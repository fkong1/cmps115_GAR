<head>
   <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="images/icons8_cab_stand_50_fDM_icon.ico" type="image/x-icon" />
    <title>Sign In</title>
</head>

<body class="p-3 mb-2 bg-dark text-white">
        <div class="register_container">
            <div class ="login_logo">
                <img src="/images/icons8-moleskine-64.png">
            </div>
            <div class="register_text">My profile</div>
            <form action="/edit_profile" method="post">
                <div class="register_form_container">
                    <div class="form-group">
                        <span class="prepend30 text_size_16" id="basic-addon1">User Name</span>
                        <input type="text"  name="username" class="append70" id="username" placeholder={{logged_username}} readonly>
                    </div>
                    <div class="form-group">
                        <span class="prepend30 text_size_16" id="basic-addon2">CruzID</span>
                        <input type="text" name="cruzid1" class="append70" id="cruzid" placeholder="{{logged_cruzid}}" readonly>
                    </div>
                    <div class="form-group">
                        <span class="prepend30 text_size_16" id="basic-addon2">Confirm</span>
                        <input type="text" name="cruzid2" class="append70" id="cruzid" placeholder="{{logged_cruzid}}">
                    </div>
                    <div class="form-group">
                        <span class="prepend30 text_size_16" id="basic-addon3">Password</span>
                        <input type="text" name="password" class="append70" id="password" placeholder="{{logged_password}}">
                    </div>
                    <div class="form-group">
                        <span class="prepend30 text_size_16" id="basic-addon4">Email</span>
                        <input type="text" name="semail1" class="append70" id="email1" placeholder="{{logged_email}}">
                    </div>
                    <div class="form-group">
                        <span class="prepend30 text_size_16" id="basic-addon5">Confirm</span>
                        <input type="text" name="email2" class="append70" id="email2" placeholder="{{logged_email}}">
                    </div>
                </div>
                <div class="button_register">
                    <div class="submit_button">
                        <button type="submit" class="btn btn-info" style="width: 148px;">Submit</button>
                    </div>
                    <div class="cancel_button">
                        <a href="/"><button type="button" class="btn btn-info" style="width: 148px;">Cancel</button></a>
                    </div>
                </div>
            </form>
        </div>
</body>
