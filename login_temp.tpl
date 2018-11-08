<head>
   <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap.css" rel="stylesheet" type="text/css"/>
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/bootstrap.js"></script>
</head>

<body class="p-3 mb-2 bg-dark text-white">
      <div class="login_container">
         <div class ="login_logo">
            <img src="https://firebasestorage.googleapis.com/v0/b/cmps115-gar.appspot.com/o/images%2Ficons8-taxi-50.png?alt=media&token=b411c2c1-9874-4428-ab7d-f0a703abb9b0">
         </div>
         <div class ="login_text">Login</div>
         <form action="/login" method="post">
            <div class = "form_container">
               <div class="form-group col-md-4 main_col-md-4">
                  <select id="inputState" class="form-control" style = "width:300px;">
                     <option selected>Passenger</option>
                     <option>Driver</option>
                  </select>
               </div>
               <div class="form-group" >
                  <input name="username" type="text" class="form-control" id="formGroupExampleInput" placeholder="User name" style = "width:300px;">
               </div>
               <div class="form-group" >
                  <input name="password" type="password" class="form-control" id="formGroupExampleInput2" placeholder="Password" style = "width:300px;">
               </div>
            </div>
            <div class = "btn_login" >
               <button id="login" type ="submit" class="btn btn-info" style="width:300px">Login</button>
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