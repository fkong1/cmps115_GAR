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

def register_connectDB(username, password,cruzid,studentid,emailaddress,identity):
    mydb = mysql.connector.connect(
        host = "localhost",
        user="root",
        passwd="password",
        database="gar_database"
    )
    mycursor = mydb.cursor()
    mycursor.execute("SELECT username FROM user")
    myresult = mycursor.fetchall()
    usern = ""
    for x in myresult:
        usern = x[0]
    if usern == username:
        return False
    else:
        sql = "INSERT INTO user (username, password,cruzid,studentid,emailaddress,identity) VALUES (%s, %s, %s, %s, %s, %s)"
        val = (username, password,cruzid,studentid,emailaddress,identity)
        mycursor.execute(sql, val)
        mydb.commit()
        return True
    mydb.close()


@post('/register', methods='post')
def register():
    register_username = request.forms.get('username')
    register_password = request.forms.get('password')
    register_cruzid = request.forms.get('cruzid')
    register_studentid = request.forms.get('studentid')
    register_emailaddress = request.forms.get('emailaddress')
    register_identity = request.forms.get('identity')
    if register_password == "" or register_username == "" or register_cruzid == "" or register_studentid == "" or register_emailaddress == "":
        return template("register_wrong")
    if register_connectDB(register_username,register_password,register_cruzid,register_studentid,register_emailaddress,register_identity) == True:
        return template("register_succeed")
    else:
        return template("register_used")

@get('/login-succeed')
def login_succeed():
    return template("login_succeed")

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
@route('/images/<filename:re:.*\.*>')
def serve_image(filename):
    return static_file(filename, root='images', mimetype='image/png jpg')

def login_connectDB(username, password):
    str_sql = "SELECT PASSWORD FROM user where username ='" + username  + "'"
    mydb = mysql.connector.connect(
    host = "localhost",
    user="root",
    passwd="password",
    database="gar_database"
)
    mycursor = mydb.cursor()
    print ("sql: "+ str(str_sql))
    mycursor.execute(str_sql)
    myresult = mycursor.fetchone()
    mydb.close()
    print ("myresult: " + str(myresult))
    if myresult is not None:
        for x in myresult:
            psw = x
        if psw == password:
            print "password is correct"
            return True
        else:
            print "password is wrong"
            return False
    else:
        return False



@post('/login')
def login():
    login_username = request.forms.get('username')
    login_password = request.forms.get('password')

    print("login_username: " + str(login_username))
    print("login_password: " + str(login_password))
    if login_connectDB(login_username,login_password)== False:
        return template("login_wrong")
    else:
        return template("login_succeed")


# Code for serving css stylesheets from /css directory.
@route('/css/<filename:re:.*.css>')
def serve_css(filename):
    return static_file(filename, root='css', mimetype='text/css')


run(reloader=True, host='localhost', port=3005)

