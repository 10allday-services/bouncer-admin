from flask import Flask, render_template, request
from flask_mysqldb import MySQL
import mysql.connector
import xmlrenderer

class MySQLModel:
    def __init__(self, flask_app):
        self._app = flask_app
    
    def index(self):
        return "Welcome to Nazgul"
    
    def location_show(self, product, fuzzy):
        xml = xmlrenderer.XMLRenderer()

        if product is None:
            return xml.error('The GET parameter product is required', errno=103), False
        if fuzzy:
            sql = '''SELECT distinct id FROM mirror_products mp WHERE name LIKE %s;'''
            product = '%' + product + '%'
        else:
            sql = '''SELECT distinct id FROM mirror_products WHERE name = %s;'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        cur.execute(sql, (product,))

        res = cur.fetchall()

        cur.close()
        db.close()

        ids = []
        for line in res:
            ids.append(line[0])

        locs = self.get_locations_info(ids)

        for loc in locs:
            xml.prepare_locations(loc)
        return xml.render(), True
    
    def location_add(self, product, os, path):
        xml = xmlrenderer.XMLRenderer()

        if not (product and os and path):
            return xml.error('product, os, and path are required POST parameters.', errno=101), False

        os_exists, os_id = self.os_exists(os)
        product_exists, product_id = self.product_exists(product)
        location_exists, location_id = self.location_exists(os, product)

        if(not os_exists):
            return xml.error('FAILED: \'' + os + '\' does not exist', errno=104), False
        if(not product_exists):
            return xml.error('FAILED: \'' + product + '\' does not exist', errno=104), False
        if(location_exists):
            return xml.error('The specified location already exists.', errno=104), False
        
        sql = '''INSERT INTO mirror_locations (product_id, os_id, path) VALUES (%s,%s,%s)'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        cur.execute(sql, (product_id, os_id, path))

        db.commit()

        cur.close()
        db.close()

        xml.prepare_locations(self.get_locations_info([location_id]))
        return xml.render(), True
    
    def location_modify(self, product, os, path):
        xml = xmlrenderer.XMLRenderer()


        os_exists, os_id = self.os_exists(os)
        product_exists, product_id = self.product_exists(product)
        location_exists, location_id = self.location_exists(os, product)

        if(not os_exists):
            return xml.error('FAILED: \'' + os + '\' does not exist', errno=104), False
        if(not product_exists):
            return xml.error('FAILED: \'' + product + '\' does not exist', errno=104), False
        if(not location_exists):
            return xml.error('FAILED: location \'' + product + '\' on OS \'' + os + '\' does not exist', errno=104), False
        
        sql = '''UPDATE mirror_locations SET path=%s WHERE os_id=%s AND product_id=%s'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        cur.execute(sql, (path, os_id, product_id))

        db.commit()

        cur.close()
        db.close()

        xml.prepare_locations(self.get_locations_info([location_id]))
        return xml.render(), True
        
    def location_delete(self, product, os):
        xml = xmlrenderer.XMLRenderer()

        os_exists, os_id = self.os_exists(os)
        product_exists, product_id = self.product_exists(product)
        location_exists, location = self.location_exists(os, product)

        if(not os_exists):
            return xml.error('FAILED: \'' + os + '\' does not exist', errno=102), False
        if(not product_exists):
            return xml.error('FAILED: \'' + product + '\' does not exist', errno=102), False
        if(not location_exists):
            return xml.error('No location found.', errno=102)
        
        sql = '''DELETE FROM mirror_locations WHERE os_id=%s AND product_id=%s'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        cur.execute(sql, (os_id, product_id))

        db.commit()

        cur.close()
        db.close()

        return xml.success('SUCCESS: location has been deleted'), True
    
    def product_show(self, product, fuzzy):
        xml = xmlrenderer.XMLRenderer()

        if fuzzy:
            sql = '''SELECT id FROM mirror_products WHERE name LIKE %s;'''
            product = '%' + product + '%'
        else:
            sql = '''SELECT id FROM mirror_products WHERE name = %s;'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        cur.execute(sql, (product,))

        res = cur.fetchall()

        cur.close()
        db.close()

        ids = []
        for line in res:
            ids.append(line[0])

        xml.prepare_products(self.get_products_info(ids))
        return xml.render(), True

    def product_add(self, product, languages, ssl_only):
        xml = xmlrenderer.XMLRenderer()

        product_exists, product_id = self.product_exists(product)
        if(product_exists):
            return xml.error('product already exists.', errno=104), False
        
        sql = '''INSERT INTO mirror_products (name, ssl_only) VALUES (%s, %s)'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        cur.execute(sql, (product, int(ssl_only)))
        db.commit()

        product_exists, product_id = self.product_exists(product)
        for lang in languages:
            sql = '''INSERT INTO mirror_product_langs (product_id, language) VALUES (%s, %s)'''
            cur.execute(sql, (product_id, languages[lang]))

        db.commit()

        cur.close()
        db.close()

        xml.prepare_products(self.get_products_info([product_id]))
        return xml.render(), True

    def product_delete_name(self, name):
        xml = xmlrenderer.XMLRenderer()

        product_exists, product_id = self.product_exists(name)
        if(not product_exists):
            return xml.error('No product found.', errno=102), False


        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()

        sql = '''DELETE FROM mirror_products WHERE id=%s'''
        cur.execute(sql, (product_id,))

        sql = '''DELETE FROM mirror_product_langs WHERE product_id=%s'''
        cur.execute(sql, (product_id,))

        sql = '''DELETE FROM mirror_locations WHERE product_id=%s'''
        cur.execute(sql, (product_id,))

        db.commit()

        cur.close()
        db.close()

        return xml.success('SUCCESS: product has been deleted'), True

    def product_delete_id(self, id):
        xml = xmlrenderer.XMLRenderer()

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()

        sql = '''DELETE FROM mirror_products WHERE id=%s'''
        cur.execute(sql, (id,))

        sql = '''DELETE FROM mirror_product_langs WHERE product_id=%s'''
        cur.execute(sql, (id,))

        sql = '''DELETE FROM mirror_locations WHERE product_id=%s'''
        cur.execute(sql, (id,))

        db.commit()

        cur.close()
        db.close()

        return xml.success('SUCCESS: location has been deleted'), True
    
    def product_language_add(self, product, languages):
        xml = xmlrenderer.XMLRenderer()

        product_exists, product_id = self.product_exists(product)
        if(not product_exists):
            return xml.error('Product not found.', errno=102), False

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()

        for lang in languages:
            sql = '''INSERT INTO mirror_product_langs (product_id, language) VALUES (%s, %s)'''
            cur.execute(sql, (product_id, lang))

        db.commit()

        cur.close()
        db.close()

        xml.prepare_products(self.get_products_info([product_id]))
        return xml.render(), True

    def product_language_delete(self, product, languages):
        xml = xmlrenderer.XMLRenderer()

        product_exists, product_id = self.product_exists(product)
        if(not product_exists):
            return xml.error('Product not found.', errno=102), False
        
        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()

        if languages[0] == '*':
            sql = '''DELETE FROM mirror_product_langs WHERE product_id=%s'''
            cur.execute(sql, (product_id,))
        else:
            for lang in languages:
                sql = '''DELETE FROM mirror_product_langs WHERE product_id=%s AND language=%s'''
                cur.execute(sql, (product_id, lang))
        
        db.commit()

        cur.close()
        db.close()

        return xml.success('SUCCESS: language has been deleted'), True

    def mirror_list(self):
        xml = xmlrenderer.XMLRenderer()

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()

        sql = '''SELECT baseurl FROM mirror_mirrors WHERE active=1'''
        cur.execute(sql)

        res = cur.fetchall()

        mirrors = []
        for line in res:
            mirrors.append({'baseurl': line[0]})

        cur.close()
        db.close()

        xml.prepare_mirrors(mirrors)
        return xml.render(), True

    def os_exists(self, os):
        sql = '''SELECT id FROM mirror_os WHERE name=%s;'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        cur.execute(sql, (os,))

        res = cur.fetchall()

        cur.close()
        db.close()

        if len(res) > 0:
            return True, res[0][0]
        else:
            return False, []
    
    def product_exists(self, product):
        sql = '''SELECT id FROM mirror_products WHERE name=%s;'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        cur.execute(sql, (product,))

        res = cur.fetchall()

        cur.close()
        db.close()

        if len(res) > 0:
            return True, res[0][0]
        else:
            return False, []
    
    def location_exists(self, os, product):
        sql = '''SELECT * FROM mirror_locations ml JOIN mirror_os mo ON ml.os_id=mo.id JOIN mirror_products mp ON ml.product_id=mp.id WHERE mo.name=%s AND mp.name=%s;'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        cur.execute(sql, (os, product))

        res = cur.fetchall()

        cur.close()
        db.close()

        if len(res) > 0:
            return True, res[0][0]
        else:
            return False, []
    
    def get_products_info(self, ids):
        sql = '''SELECT mp.id, mp.name, mpl.language FROM mirror_products mp JOIN mirror_product_langs mpl ON mp.id=mpl.product_id WHERE mp.id=%s'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        products = []
        for id in ids:
            cur.execute(sql, (id,))
            res = cur.fetchall()
            if res == []:
                continue
            prod = {'id': res[0][0], 'name': res[0][1]}
            languages = []
            for line in res:
                languages.append(line[2])
            
            prod['languages'] = languages
            
            products.append(prod)
        
        return products

    def get_locations_info(self, ids):
        sql = '''SELECT ml.id, ml.product_id, mp.name, path, mo.name FROM mirror_locations ml JOIN mirror_products mp ON ml.product_id=mp.id JOIN mirror_os mo ON mo.id=ml.os_id WHERE mp.id=%s'''

        db = mysql.connector.connect(user='root', host='127.0.0.1', database='bouncer')
        cur = db.cursor()
        products = []
        for id in ids:
            cur.execute(sql, (id,))
            res = cur.fetchall()
            if res == []:
                continue
            prod = {'id': res[0][1], 'name': res[0][2]}
            locations = []
            for line in res:
                locations.append({'id': line[0], 'path': line[3], 'os_name': line[4]})
            
            prod['locations'] = locations
            
            products.append(prod)
        
        return products
    