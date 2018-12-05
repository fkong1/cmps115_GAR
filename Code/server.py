import mysql.connector, smtplib, json,string
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from bottle import get, route, run, template, static_file, request, post
from random import choice
from string import digits,ascii_letters,join


__author__ = 'kai'

from flask import Flask

app = Flask(__name__)

logged_user_id = ""
logged_username = ""
view_details = ""

@get('/')
def index():
    global logged_user_id
    global logged_username
    logged_user_id = ""
    logged_username = ""
    return template('login_temp')

@get('/register')
def register():
    return template("register_temp")

@get('/view_detail')
def view_detail():
    if logged_username == "":
        return template('must_login')
    else:
        print ("view_details:"+str(view_details))
        return template("view_detail",logged_username=logged_username, view_details = view_details)

@get('/find-password')
def find_password():
    return template("findPW_temp")

@get('findPW_back_main')
def findPW_back_main():
    return template('login_temp')

@get('/profile')
def profile():
    if logged_username == "":
        return template('must_login')
    else:
        logged_cruzid = findcruzID(logged_username)
        logged_email = findEmail(logged_cruzid)
        logged_password = findPassword(logged_email)

        return template("profile_temp",logged_username=logged_username, logged_cruzid=logged_cruzid,
                        logged_email=logged_email,logged_password=logged_password)

@get('/main')
def main():
    print("main logged_user_id: "+str(logged_user_id))
    print("main logged_username: "+str(logged_username))
    if logged_username == "":
        return template('must_login')
    else:
        request_result = main_DB(logged_user_id)
        print ('main front page:' + str(logged_user_id))

        return template("main_temp",logged_username=logged_username,request_result=request_result,logged_user_id=logged_user_id)

@get('/history')
def history():
    print("main logged_user_id: "+str(logged_user_id))
    print("main logged_username: "+str(logged_username))
    if logged_username == "":
        return template('must_login')
    else:
        request_result = history_DB(logged_user_id)
        print ('main front page:' + str(logged_user_id))

        return template("history_list",logged_username=logged_username,request_result=request_result)

@get('/pa_request')
def pa_request():
    if logged_username == "":
        return template('must_login')
    else:
        return template("pa_request",logged_username=logged_username)

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
def login_connectDB(status, cruzid, password,login_username):
    # conect the database
    mydb = connectDB()
    # check if the enter is empty
    if password == "" or cruzid == "":
        return False
    mycursor = mydb.cursor()
    sql = "select password,userid from user where cruzid = '"+ cruzid +"'"     # select the password with the entered cruzid from database
    mycursor.execute(sql)
    myresult = mycursor.fetchall()         # let myresult equal the password we selected

    if myresult is not None:
        for x in myresult:
            psw = x[0]
            user_id = x[1]
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
            global logged_user_id
            global logged_username
            logged_user_id = user_id
            logged_username = login_username
            print ("logged_user_id aaa: " + str(logged_user_id))
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

def main_DB(logged_user_id):
    mydb = connectDB()
    mycursor = mydb.cursor()
    # print ("main_db ===========" + str(logged_user_id))
    sql = "select new_ride.ride_type, new_ride.start_time, new_ride.end_time, " \
          "new_ride.starting_point,new_ride.destination,user.username,new_ride.request_type,new_ride.request_id, new_ride.driverid " \
          "from new_ride, user where new_ride.userid = user.userid and new_ride.userid <> "+ str(logged_user_id)
    # print("sql: "+ str(sql))
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    # print("function main_DB: "+str(logged_user_id)+str(myresult))
    mydb.close()
    return myresult

def history_DB(logged_user_id):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "select ride_type, start_time, end_time, starting_point,destination,userid,request_type,request_id from new_ride where userid = '" + str(logged_user_id) + "'"
    print("sql: "+str(sql))
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    print("function history_DB: "+str(logged_user_id)+str(myresult))
    mydb.close()
    return myresult

def repeat_DB(ck_1,ck_2,ck_3,ck_4,ck_5,ck_6,ck_7):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "INSERT INTO repeat_request (monday, tuesday,wednesday,thursday,friday,saturday,sunday) values(%s, %s, %s, %s, %s,%s,%s)"
    val = (ck_1,ck_2,ck_3,ck_4,ck_5,ck_6,ck_7)
    print("sql"+str(sql))
    print("sql" + str(val))
    mycursor.execute(sql, val)
    mydb.commit()

    sql = "select repeat_request_id from repeat_request  order by repeat_request_id desc limit 1"
    print("sql" + str(sql))
    mycursor.execute(sql)
    myresult = mycursor.fetchone()  # let myresult equal the password we selected
    for x in myresult:
        repeat_request_id = x
    mydb.close()
    return repeat_request_id

def new_requestDB(ride_status,input_start_time,input_end_time,repeat_status,input_staring_point,input_destination, logged_user_id):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "INSERT INTO new_ride (ride_type,start_time,end_time,repeat_request_id, starting_point,destination,userid) values(%s, %s, %s, %s, %s, %s, %s)"
    print sql
    val = (ride_status, input_start_time, input_end_time, repeat_status, input_staring_point, input_destination,logged_user_id)
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

# check if password and email match the original data
def able_to_update( logged_username, password1, email1):

    print ("password1 is: " + str(password1))
    print ("email1 is: " + str(email1))
    mydb = connectDB()
    mycursor = mydb.cursor()

    if password1 != "":
        sql = "UPDATE user SET password = '" + password1 + "' WHERE username = '" + logged_username + "'"
        mycursor.execute(sql)
        mydb.commit()
    if email1 != "":
        sql = "UPDATE user SET emailaddress = '" + email1 + "' WHERE username = '" + logged_username + "'"
        mycursor.execute(sql)
        mydb.commit()
    mydb.close()
    return True


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

def findcruzID(logged_username):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "select cruzid from user where username = '" + logged_username + "'"   # select the username under the given email
    mycursor.execute(sql)
    myresult = mycursor.fetchone()
    return str(myresult[0])

def findEmailid(id):
    # conect the database
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "select emailaddress from user where userid = '" + str(id) + "'"   # select the email under the given cruzid
    mycursor.execute(sql)
    myresult = mycursor.fetchone()
    return myresult[0]

def findUserid(id):
    # conect the database
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "select userid from new_ride where request_id = '" + str(id) + "'"   # select the email under the given cruzid
    mycursor.execute(sql)
    myresult = mycursor.fetchone()
    return myresult[0]

def findDriverid(id):
    # conect the database
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "select driverid from new_ride where request_id = '" + id + "'"   # select the email under the given cruzid
    mycursor.execute(sql)
    myresult = mycursor.fetchone()
    return myresult[0]

def accepted_request(comments):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "UPDATE new_ride SET request_type = 'accepted', driverid = '"+ str(logged_user_id) +"'WHERE request_id = '"+ comments +"'"
    mycursor.execute(sql)
    mydb.commit()
    mydb.close()
    return True


def accepted_canceled(comments):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "UPDATE new_ride SET request_type = 'new', driverid = 0 WHERE request_id = '"+ comments +"'"
    mycursor.execute(sql)
    mydb.commit()
    mydb.close()
    return True

def Request_canceled(comments):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "UPDATE new_ride SET request_type = 'cancel' WHERE request_id = '" + comments + "'"
    mycursor.execute(sql)
    mydb.commit()
    mydb.close()
    return True

def view_requst(view_id):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "select new_ride.ride_type, new_ride.start_time, new_ride.end_time, new_ride.repeat_request_id,user.username, new_ride.starting_point, new_ride.destination,new_ride.request_type, new_ride.request_id  from new_ride, user where new_ride.userid = user.userid and request_id = " + str(view_id)
    print ("view_requst_sql: "+ str(sql))
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    mydb.close()
    return myresult


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

def senddriver(id):
    useri = findUserid(id)
    drivi = findDriverid(id)
    passemail = findEmailid(useri)
    passusern = findusername(passemail)
    drivemail = findEmailid(drivi)
    drivusern = findusername(drivemail)     # get username
    sender = "teamgar2018@gmail.com"    # server email
    message = MIMEMultipart()
    message['From'] = sender
    message['To'] = drivemail
    message['Subject'] = "Password Request (do not reply!)"
    body = "Dear " + drivusern + ",\n" + "\nHere is your passenger information: \n\n" + "Username: " +str(passusern)+ "\nEmail        : " +str(passemail) + "\n\nThanks for choosing us!\n" + "Team GAR"

    message.attach(MIMEText(body, 'plain'))

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(sender, "garpassword")
    server.sendmail(sender, drivemail, message.as_string())

    server.quit()

def getNewPassword():
    new_password_list = ascii_letters + digits + "~!@#$%^&*"


    return str(join(choice(new_password_list) for i in range(15))).replace(" ", "")

def updatePassword(email, newPassword):
    mydb = connectDB()
    mycursor = mydb.cursor()
    sql = "UPDATE user SET password = '"+ newPassword + "' WHERE emailaddress = '" + email + "'"
    mycursor.execute(sql)
    mydb.commit()
    mydb.close()


############################################ connect UI page to MySQL database ############################################

@post('/login')
def login():
    login_status = request.forms.get('login_status')        # get the identity from user entered
    login_cruzid = request.forms.get('cruzid')               # get the cruzid from user entered
    login_password = request.forms.get('password')            # get the password from user entered

    mydb = connectDB()
    mycursor = mydb.cursor()
    mycursor.execute(
        "select COUNT(*) from user where cruzid = '" + login_cruzid + "'")  # select all cruzid and email from the database
    result = mycursor.fetchall()
    the_num = result[0]
    if the_num==0:
        return template("login_wrong")
    mycursor = mydb.cursor()
    mycursor.execute(
        "select username from user where cruzid = '" + login_cruzid + "'")  # select all cruzid and email from the database
    myresult = mycursor.fetchall()

    login_username = ""
    for x in myresult:
        login_username = x[0]

    print("login_status: " + str(login_status))
    print("login_cruzid: " + str(login_cruzid))
    print("login_password: " + str(login_password))
    # if enter wrong or noting, then can't login, go to the login wrong warning page
    if login_connectDB(login_status, login_cruzid,login_password,login_username)== False:
        return template("login_wrong")
    # if cruzid and password are correct, go to the succeed page, then go to main page
    else:
        # if passenger return passenger page
        # if driver return driver page
        print ("logged_user_id: " + str(logged_user_id))
        return template("login_succeed", login_status=login_status, login_username = login_username)

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
    repeat_request_id = 0
    ck_1 = request.forms.get('ck_1')
    ck_2 = request.forms.get('ck_2')
    ck_3 = request.forms.get('ck_3')
    ck_4 = request.forms.get('ck_4')
    ck_5 = request.forms.get('ck_5')
    ck_6 = request.forms.get('ck_6')
    ck_7 = request.forms.get('ck_7')

    if input_start_time != "" and input_end_time != "" and input_staring_point != "" and input_staring_point != "" and input_destination != "":
        if ride_status == "Long Period":
            if ck_1 == 'on':
                ck_1 = 1
            else:
                ck_1 = 0

            if ck_2 == 'on':
                ck_2 = 1
            else:
                ck_2 = 0

            if ck_3 == 'on':
                ck_3 = 1
            else:
                ck_3 = 0

            if ck_4 == 'on':
                ck_4 = 1
            else:
                ck_4 = 0

            if ck_5 == 'on':
                ck_5 = 1
            else:
                ck_5 = 0

            if ck_6 == 'on':
                ck_6 = 1
            else:
                ck_6 = 0

            if ck_7 == 'on':
                ck_7 = 1
            else:
                ck_7 = 0

            if (ck_1 == 0 and ck_2 == 0 and ck_3 == 0 and ck_4 == 0 and ck_5 == 0 and ck_6 == 0 and ck_7 == 0):
                return template("pa_request_error")
            else:
                repeat_request_id = repeat_DB(ck_1,ck_2,ck_3,ck_4,ck_5,ck_6,ck_7)
        else:
            print("do nothing")

        print("repeat_request_id: "+ str(repeat_request_id))

        if new_requestDB(ride_status, input_start_time, input_end_time,repeat_request_id, input_staring_point, input_destination,logged_user_id) == True:
            return template("pa_request_succeed")
        else:
            return template("pa_request_error")
    else:
        return template("pa_request_error")

@post('/find-password')
def password_succeed():
    find_choice = request.forms.get('choice')           # get the user choice(cruzid, email) from user entered
    user_cruzid = request.forms.get('cruzid')           # get the cruzid from user entered
    user_email = request.forms.get('emailaddress')      # get the emailaddress from user entered
    new_passwprd = getNewPassword()

    # if user enter correct cruzid or email, go to the succeed  page, the password will send to the user email
    if find_choice == "cruzid":
        print("choose cruzid")
        if findPW_connectDB(find_choice, user_cruzid) == True:
            email = findEmail(user_cruzid)          # if the entered cruzid is correct, get the email under the cruzid
            updatePassword(email, new_passwprd)
            sentmassage(email, new_passwprd)
            return template("findPW_succeed")
    else:
        if findPW_connectDB(find_choice, user_email) == True:
            updatePassword(user_email, new_passwprd)
            sentmassage(user_email, new_passwprd)
            return template("findPW_succeed")
    return template("findPW_wrong")     # if user enter wrong cruzid or email, go to the wrong warning page

@post('/main_list')
def main_list():
    html_request_id = request.forms.get('html_type1')
    print ("html_request_id:" + str(html_request_id))
    return

@post('/edit_profile')
def edit_profile():
    print("the name is :" + str(logged_username))

    user_password1 = request.forms.get('password1')
    user_password2 = request.forms.get('password2')
    user_email1 = request.forms.get('emailaddress1')
    user_email2 = request.forms.get('emailaddress2')

    if user_password1 == '' and user_email1 =='' :
        return template("Profile_nothing")

    if user_password1 != user_password2 or user_email1 != user_email2:
        return template("Profile_not_match")

    if able_to_update(logged_username, user_password1, user_email1) == True:
        print 'hello update'

    return template("Profile_succeed")

@route('/feedback', method='POST')
def feedback():
    comments = request.json #request_id
    print comments
    #accepted
    if accepted_request(comments) == True:
        senddriver(comments)
        return comments

@route('/feedback_acc', method='POST')
def feedback_acc():
    comments = request.json #request_id
    print comments
    if accepted_canceled(comments) == True:
        return comments

@route('/feedback_req', method='POST')
def feedback_req():
    comments = request.json #request_id
    if Request_canceled(comments) == True:
        return comments

@post('/feedback_view', method='POST')
def feedback_view():
    view_id = request.json #request_id
    print ("view_id: "+str(view_id))
    global view_details
    view_details = view_requst(view_id)
    print ("view_details: " + str(view_details))
    return view_id

@route('/feedback_view_accept', method='POST')
def view_accept():
    comments = request.json #request_id
    if accepted_request(comments) == True:
        senddriver(comments)
        return comments

@route('/feedback_view_cancel', method='POST')
def view_accept():
    comments = request.json #request_id
    if accepted_canceled(comments) == True:
        return comments


# Let's add some code to serve jpg images from our static images directory.
@route('/images/<filename:re:.*\.*>')
def serve_image(filename):
    return static_file(filename, root='images', mimetype='image/png jpg ico')

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

run(reloader=True, host='localhost', port=8080)


