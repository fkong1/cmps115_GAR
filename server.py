import mysql.connector
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from bottle import get, route, run, template, static_file, request, post
__author__ = 'kai'

from flask import Flask

app = Flask(__name__)

login_after_cruzid = ""

@get('/test')
def register():
    return template("test")

@get('/')
def index():
    return template('login_temp')

@get('/register')
def register():
    return template("register_temp")

@get('/find-password')
def register():
    return template("findPW_temp")

@get('findPW_back_main')
def findPW_back_main():
    return template('login_temp')

@get('/main')
def main():
    return template("main_temp")

@get('/pa_request')
def pa_request():
    return template("pa_request")

################################################## functions will be used ##################################################
# open the database
def connectDB():
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        passwd="password",
        database="gar_database"
    )
    return mydb

# login_temp connect to database
# if enter the correct cruzid and password, then login succeed
# if enter wrong or noting, then can't login
def login_connectDB(status, cruzid, password):
    # conect the database
    mydb = connectDB()
    # check if the enter is empty
    if password == "" or cruzid == "":
        return False
    mycursor = mydb.cursor()
    sql = "select password from user where cruzid = '"+ cruzid +"'"     # select the password with the entered cruzid from database
    mycursor.execute(sql)
    myresult = mycursor.fetchone()         # let myresult equal the password we selected

    if myresult is not None:
        for x in myresult:
            psw = x
            print ("myresult: " + str(x))
        # if the entered password is correct, return true, else return false
        if password == psw:
            print "password is correct"
            #  since the password is correct,
            # update the identity(passenger, driver)
            # then we can choose which main page(passenger page, driver page) we want to login
            # cause each user can be passenger and driver
            sql = "UPDATE user SET identity = '"+ status +"' WHERE cruzid = '" + cruzid + "'"
            mycursor.execute(sql)
            mydb.commit()
            return True
        else:
            print "cruzid is wrong"
            return False
    mydb.close()

# register_temp connect to database
# if the cruzid or email has already been used, return false
# else insert the information into the database, then return true
def register_connectDB(username, password,cruzid,studentid,emailaddress):
    # conect the database
    mydb = connectDB()
    mycursor = mydb.cursor()
    mycursor.execute("SELECT cruzid, emailaddress FROM user")   # select all cruzid and email from the database
    myresult = mycursor.fetchall()                              # and set them into myresult
    # check if the entered cruzid or email is in the database
    for x in myresult:
        if x[0] == cruzid or x[1] == emailaddress:
            return False
    # if the entered cruzid or email is not in the database
    # insert all entered information into database with the passenger defult
    # then return true
    sql = "INSERT INTO user (username, password,cruzid,studentid,emailaddress,identity) VALUES (%s, %s, %s, %s, %s, %s)"
    val = (username, password,cruzid,studentid,emailaddress,"Passenger")
    mycursor.execute(sql, val)
    mydb.commit()
    mydb.close()
    return True


def new_requestDB(ride_status,input_start_time,input_end_time,input_staring_point,input_destination, login_after_cruzid):
    login_after_cruzid = "1"
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "INSERT INTO new_ride (ride_type,start_time,end_time,repeat_status, starting_point,destination,userid) values(%s, %s, %s, %s, %s, %s, %s)"
    print sql
    val = (ride_status,input_start_time,input_end_time,'0',input_staring_point,input_destination,login_after_cruzid)
    print val
    mycursor.execute(sql, val)
    mydb.commit()
    mydb.close()
    return True


# findPW_temp connect to database
# user can choose using cruzid or email to find password
# if the entered cruzid or email is correct, return true
# else return false
def findPW_connectDB(choice, value):
    # conect the database
    mydb = connectDB()
    mycursor = mydb.cursor()
    mycursor.execute("SELECT cruzid, emailaddress FROM user")       # select all cruzid and email from the database
    myresult = mycursor.fetchall()                                  # and set them into myresult

    if choice == "cruzid":      # user choose cruzid to find password
        for x in myresult:
            if x[0] == value:
                return True
    else:                       # user choose cruzid to find password
        for x in myresult:
            if x[1] == value:
                return True
    return False
    mydb.close()

# find the email with the entered cruzid
def findEmail(cruzid):
    # conect the database
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "select emailaddress from user where cruzid = '" + cruzid + "'"   # select the email under the given cruzid
    mycursor.execute(sql)
    myresult = mycursor.fetchone()
    return myresult[0]

# find the password with the entered email
def findPassword(email):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "select password from user where emailaddress = '" + email + "'"   # select the password under the given email
    mycursor.execute(sql)
    myresult = mycursor.fetchone()
    return str(myresult[0])

# find the username with the entered email
def findusername(email):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "select username from user where emailaddress = '" + email + "'"   # select the username under the given email
    mycursor.execute(sql)
    myresult = mycursor.fetchone()
    return str(myresult[0])

# sent the password to the user's email
def sentmassage(email,password):
    usern = findusername(email)     # get username
    sender = "teamgar2018@gmail.com"    # server email
    message = MIMEMultipart()
    message['From'] = sender
    message['To'] = email
    message['Subject'] = "Password Request (do not reply!)"
    body = "Dear " + usern + ",\n" + "\nHere is your password: " + str(password) + "\n\nThanks for choosing us!\n" + "Team GAR"

    message.attach(MIMEText(body, 'plain'))

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(sender, "garpassword")
    server.sendmail(sender, email, message.as_string())

    server.quit()

############################################ connect UI page to MySQL database ############################################

@post('/login')
def login():
    login_status = request.forms.get('login_status')        # get the identity from user entered
    login_cruzid = request.forms.get('cruzid')               # get the cruzid from user entered
    login_password = request.forms.get('password')            # get the password from user entered

    print("login_status: " + str(login_status))
    print("login_cruzid: " + str(login_cruzid))
    print("login_password: " + str(login_password))
    # if enter wrong or noting, then can't login, go to the login wrong warning page
    if login_connectDB(login_status, login_cruzid,login_password)== False:
        return template("login_wrong")
    # if cruzid and password are correct, go to the succeed page, then go to main page
    else:
        # if passenger return passenger page
        # if driver return driver page
        return template("login_succeed")

@post('/register')
def register():
    register_username = request.forms.get('username')           # get the username from user entered
    register_password = request.forms.get('password')           # get the password from user entered
    register_cruzid = request.forms.get('cruzid')               # get the cruzid from user entered
    register_studentid = request.forms.get('studentid')         # get the studentid from user entered
    register_emailaddress = request.forms.get('emailaddress')   # get the emailaddress from user entered

    # user must enter something, go to the wrong warning page
    if register_password == "" or register_username == "" or register_cruzid == "" or register_studentid == "" or register_emailaddress == "":
        return template("register_wrong")
    # if the cruzid and email have not been used, insert information and go to the succeed page
    if register_connectDB(register_username,register_password,register_cruzid,register_studentid,register_emailaddress) == True:
        return template("register_succeed")
    # if the cruzid or email has been used, go to the used warning page
    else:
        return template("registe_used")

@post('/new_request')
def new_request():
    ride_status = request.forms.get('ride_status')
    input_start_time = request.forms.get('input_start_time')
    input_end_time = request.forms.get('input_end_time')
    input_staring_point = request.forms.get('input_staring_point')
    input_destination = request.forms.get('input_destination')

    print("ride_status: "+str(ride_status))
    print("input_start_time: " + str(input_start_time))
    print("input_end_time: " + str(input_end_time))
    print("input_staring_point: " + str(input_staring_point))
    print("input_destination: " + str(input_destination))

    if input_start_time == "" or input_end_time == "" or input_staring_point == "" or input_staring_point == "" or input_destination == "":
        return template("pa_request_error")

    if new_requestDB(ride_status,input_start_time,input_end_time,input_staring_point,input_destination, login_after_cruzid) == True:
        return template("pa_request_succeed")


@post('/find-password')
def password_succeed():
    find_choice = request.forms.get('choice')           # get the user choice(cruzid, email) from user entered
    user_cruzid = request.forms.get('cruzid')           # get the cruzid from user entered
    user_email = request.forms.get('emailaddress')      # get the emailaddress from user entered

    # if user enter correct cruzid or email, go to the succeed  page, the password will send to the user email
    if find_choice == "cruzid":
        print("choose cruzid")
        if findPW_connectDB(find_choice, user_cruzid) == True:
            email = findEmail(user_cruzid)          # if the entered cruzid is correct, get the email under the cruzid
            user_pasword =  findPassword(email)
            sentmassage(email, user_pasword)
            return template("findPW_succeed")
    else:
        if findPW_connectDB(find_choice, user_email) == True:
            user_pasword = findPassword(user_email)
            sentmassage(user_email, user_pasword)
            return template("findPW_succeed")
    return template("findPW_wrong")     # if user enter wrong cruzid or email, go to the wrong warning page

# Let's add some code to serve jpg images from our static images directory.
@route('/images/<filename:re:.*\.*>')
def serve_image(filename):
    return static_file(filename, root='images', mimetype='image/png jpg')

# Code for serving css stylesheets from /css directory.
@route('/css/<filename:re:.*.css>')
def serve_css(filename):
    return static_file(filename, root='css', mimetype='text/css')

# Code for serving css stylesheets from /js directory.
@route('/js/<filename:re:.*.js>')
def serve_js(filename):
    return static_file(filename, root='js', mimetype='javascript/js')

# Code for serving css stylesheets from /js directory.
@route('/fonts/<filename:re:.*\.*>')
def serve_js(filename):
    return static_file(filename, root='fonts', mimetype='fonts/woff ttf')

run(reloader=True, host='localhost', port=8006)

