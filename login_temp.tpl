<head>
   <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <title>Login</title>
</head>

<body class="p-3 mb-2 bg-dark text-white">
      <div class="login_container">
         <div class ="login_logo">
            <img src="/images/icons8-taxi-50.png">
         </div>
         <div class ="login_text">Login</div>
         <form action="/login" method="post">
            <div class = "form_container">
               <div class="form-group col-md-4 main_col-md-4">
                  <select name="login_status" class="form-control login_btn_width">
                     <option selected>Passenger</option>
                     <option>Driver</option>
                  </select>
               </div>
               <div class="form-group" >
                  <input name="cruzid" type="text" class="form-control login_btn_width" id="formGroupExampleInput" placeholder="CruzID">
               </div>
               <div class="form-group" >
                  <input name="password" type="password" class="form-control login_btn_width" id="formGroupExampleInput2" placeholder="Password">
               </div>
            </div>
            <div class = "btn_login" >
               <button id="login" type ="submit" class="btn btn-info login_btn_width">Login</button>
            </div>
         </form>
         <div class="label_container">
            <div class="main_link_1">
               <a href="register" class="alert-link">Sign Up</a>
            </div>
            <div class="main_link_2">
               <a href="find-password" class="alert-link">Forgot Password</a>
            </div>
         </div>
      </div>
</body>