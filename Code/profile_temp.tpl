<head>
   <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/customer.js"></script>
    <link rel="shortcut icon" href="images/icons8_cab_stand_50_fDM_icon.ico" type="image/x-icon" />
    <title>Sign In</title>
</head>

<body class="p-3 mb-2 bg-dark text-white">
      <div class="login_container">
         <div class ="login_logo">
            <img src="/images/icons8-compose-64.png">
         </div>
         <div class ="login_text">My profile</div>
         <form action="/edit_profile" method="post">
            <div class = "form_container">
               <div class="form-group" >
                  <input name="username" type="text" class="form-control login_btn_width" id="username" placeholder={{logged_username}} readonly>
               </div>
               <div class="form-group" >
                  <input name="logged_cruzid" type="text" class="form-control login_btn_width" id="profile_cruzid" placeholder={{logged_cruzid}} readonly>
               </div>
               <div class="form-group" >
                  <input name="password1" type="password" class="form-control login_btn_width" id="password1" placeholder="******">
               </div>
                <div class="form-group" >
                  <input name="password2" type="password" class="form-control login_btn_width" id="password2" placeholder="******" style="display: none;">
               </div>
                <div class="form-group" >
                  <input name="emailaddress1" type="text" class="form-control login_btn_width" id="emailaddress1" placeholder={{logged_email}} >
               </div>
                <div class="form-group" >
                  <input name="emailaddress2" type="text" class="form-control login_btn_width" id="emailaddress2" placeholder={{logged_email}} style="display: none;">
               </div>
            </div>
                <div class="button_register">
                    <div class="submit_button" >
                        <button type="submit" class="btn btn-info" style="width: 148px;">Apply</button>
                    </div>
                    <div class="cancel_button">
                        <a href="/"><button type="button" class="btn btn-info" style="width: 148px;">Cancel</button></a>
                    </div>
                </div>
         </form>
      </div>
</body>


