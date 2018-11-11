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

@get('/find-password')
def register():
    return template("findPW_temp")

@get('/main')
def main():
    return template("main_temp")


def login_connectDB(status, cruzid, password):
    mydb = mysql.connector.connect(
    host = "localhost",
    user="root",
    passwd="password",
    database="gar_database"
)
    mycursor = mydb.cursor()
    sql = "select password from user where cruzid = '"+ cruzid +"'"
    mycursor.execute(sql)
    myresult = mycursor.fetchone()

    if myresult is not None:
        for x in myresult:
            psw = x
            print ("myresult: " + str(x))
        if password == psw:
            print "password is correct"
            sql = "UPDATE user SET identity = '"+ status +"' WHERE cruzid = '" + cruzid + "'"
            mycursor.execute(sql)
            mydb.commit()
            return True
        else:
            print "cruzid is wrong"
            return False
    mydb.close()

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
    for x in myresult:
        if x[0] == username:
            return False
    mycursor.execute("SELECT emailaddress FROM user")
    myresult = mycursor.fetchall()
    for x in myresult:
        if x[0] == emailaddress:
            return False
    sql = "INSERT INTO user (username, password,cruzid,studentid,emailaddress,identity) VALUES (%s, %s, %s, %s, %s, %s)"
    val = (username, password,cruzid,studentid,emailaddress,identity)
    mycursor.execute(sql, val)
    mydb.commit()
    return True
    mydb.close()

def findPW_connectDB(choice, value):
    mydb = mysql.connector.connect(
        host = "localhost",
        user="root",
        passwd="password",
        database="gar_database"
    )
    mycursor = mydb.cursor()
    if choice == "username":
        mycursor.execute("SELECT username FROM user")
        myresult = mycursor.fetchall()
        for x in myresult:
            if x[0] == value:
                return True
    else:
        mycursor.execute("SELECT emailaddress FROM user")
        myresult = mycursor.fetchall()
        for x in myresult:
            if x[0] == value:
                return True
    return False
    mydb.close()
def findEmail(username):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        passwd="password",
        database="gar_database"
    )
    mycursor = mydb.cursor()
    mycursor.execute("SELECT username, emailaddress FROM user")
    myresult = mycursor.fetchall()
    for x in myresult:
        if x[0] == username:
            return x[1]

@post('/login')
def login():
    login_status = request.forms.get('login_status')
    login_cruzid = request.forms.get('cruzid')
    login_password = request.forms.get('password')

    print("login_status: " + str(login_status))
    print("login_cruzid: " + str(login_cruzid))
    print("login_password: " + str(login_password))
    if login_connectDB(login_status, login_cruzid,login_password)== False:
        return template("login_wrong")
    else:
        return template("login_succeed")

@post('/register')
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
        return template("registe_used")


@post('/find-password')
def password_succeed():
    find_choice = request.forms.get('choice')
    register_username = request.forms.get('username')
    register_email = request.forms.get('emailaddress')
    if find_choice == "username":
        if findPW_connectDB(find_choice, register_username) == True:
            email = findEmail(register_username)
            print email
            return template("findPW_succeed")
    else:
        if findPW_connectDB(find_choice, register_email) == True:
            return template("findPW_succeed")
    return template("findPW_wrong")



# Let's add some code to serve jpg images from our static images directory.
@route('/images/<filename:re:.*\.*>')
def serve_image(filename):
    return static_file(filename, root='images', mimetype='image/png jpg')

# Code for serving css stylesheets from /css directory.
@route('/css/<filename:re:.*.css>')
def serve_css(filename):
    return static_file(filename, root='css', mimetype='text/css')


run(reloader=True, host='localhost', port=3006)

