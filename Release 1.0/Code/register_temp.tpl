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
            <div class="register_text">Register</div>
            <form action="/register" method="post">
                <div class="register_form_container">
                    <div class="form-group">
                        <input type="text"  name="username" class="form-control" id="username" placeholder="User Name">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <input type="text" name="cruzid" class="form-control" id="cruzid" placeholder="Cruz ID">
                    </div>
                    <div class="form-group">
                        <input type="text" name="studentid" class="form-control" id="studentid" placeholder="Studen ID">
                    </div>
                    <div class="form-group">
                        <input type="text" name="emailaddress" class="form-control" id="emailaddress" placeholder="Email Address">
                    </div>
                </div>
                <div class="button_register">
                    <div class="submit_button" >
                        <button type="submit" class="btn btn-info" style="width: 148px;">Submit</button>
                    </div>
                    <div class="cancel_button">
                        <a href="/"><button type="button" class="btn btn-info" style="width: 148px;">Cancel</button></a>
                    </div>
                </div>
            </form>
        </div>
</body>