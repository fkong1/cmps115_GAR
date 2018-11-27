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
                <img src="/images/icons8-edit-64.png">
            </div>
            <div class="register_text">My profile</div>
            <form action="/edit_profile" method="post">
                <div class="register_form_container">
                    <div class="form-group" id="profile_group_1">
                        <span class="prepend30 text_size_16" id="profile_1">User Name</span>
                        <input type="text"  name="username" class="append70" id="username" placeholder={{logged_username}} readonly>
                    </div>
                    <div class="form-group" id="profile_group_2">
                        <span class="prepend30 text_size_16" id="profile_2">CruzID</span>
                        <input type="text" name="cruzid" class="append70" id="profile_cruzid" placeholder="{{logged_cruzid}}" readonly>
                    </div>
                    <div class="form-group" id="profile_group_3">
                        <span class="prepend30 text_size_16" id="profile_3">Password</span>
                        <input type="password" name="password1" class="append70" id="profile_password1" placeholder="******">
                    </div>
                    <div class="form-group" id="profile_group_4">
                        <span class="prepend30 text_size_16" id="profile_4">Confirm</span>
                        <input type="password" name="password2" class="append70" id="profile_assword2" placeholder="******">
                    </div>
                    <div class="form-group" id="profile_group_5">
                        <span class="prepend30 text_size_16" id="profile_5">Email</span>
                        <input type="text" name="emailaddress1" class="append70" id="profile_email1" placeholder="{{logged_email}}">
                    </div>
                    <div class="form-group" id="profile_group_6">
                        <span class="prepend30 text_size_16" id="profile_6">Confirm</span>
                        <input type="text" name="emailaddress2" class="append70" id="profile_email2" placeholder="{{logged_email}}">
                    </div>
                </div>
                <div class="button_register">
                    <div class="submit_button">
                        <button type="submit" class="btn btn-info" style="width: 148px;">Apply</button>
                    </div>
                    <div class="cancel_button">
                        <a href="/"><button type="button" class="btn btn-info" style="width: 148px;">Cancel</button></a>
                    </div>
                </div>
            </form>
        </div>
</body>
