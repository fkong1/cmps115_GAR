from bottle import get, route, run, template, view, static_file

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
@route('/images/<filename:re:.*\.*>')
def serve_image(filename):
    return static_file(filename, root='images', mimetype='image/png jpg')

# Code for serving css stylesheets from /css directory.
@route('/css/<filename:re:.*.css>')
def serve_css(filename):
    return static_file(filename, root='css', mimetype='text/css')


run(reloader=True, host='localhost', port=8080)