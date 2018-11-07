import mysql.connector

from bottle import get, route, run, template, view, static_file, request, post
__author__ = 'kai'

from flask import Flask

app = Flask(__name__)

@get('/')
def index():
    return template('login_temp')

@get('/register')
def register():
    return template("register_temp")

@get('/register-succeed')
def register_succeed():
    return template("register_succeed")

@get('/find-password-succeed')
def password_succeed():
    return template("password-succeed")

@get('/findpw')
def find_pw():
    return template("findPW_temp")

@get('/main')
def main():
    return template("main_temp")


# Let's add some code to serve jpg images from our static images directory.
# @route('/images/<filename:re:.*\.*>')
# def serve_image(filename):
#     return static_file(filename, root='images', mimetype='image/png jpg')

def login_connectDB(username, password):
    str_sql = "SELECT PASSWORD FROM user where username ='" + username  + "'"
    mydb = mysql.connector.connect(
    host = "localhost",
    user="root",
    passwd="password",
    database="gar_database"
)
    mycursor = mydb.cursor()
    print str_sql
    mycursor.execute(str_sql)
    myresult = mycursor.fetchall()
    print myresult
    if myresult is not None:
        print "test"
        for x in myresult:
            psw = x[0]
        if psw == password:
            print "password is correct"
            return True
        else:
            print "password is wrong"
            return False
    else:
        return False
    mydb.close()



@post('/login')
def login():
    login_username = request.forms.get('username')
    login_password = request.forms.get('password')
    print("login_username: " + str(login_username))
    print("login_password: " + str(login_password))
    if login_connectDB(login_username,login_password)== False:
        return template("login_wrong")
    else:
        return template("main_temp")


# Code for serving css stylesheets from /css directory.
@route('/css/<filename:re:.*.css>')
def serve_css(filename):
    return static_file(filename, root='css', mimetype='text/css')


run(reloader=True, host='localhost', port=3003)

