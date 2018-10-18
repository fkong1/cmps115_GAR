<head>
   <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap.css" rel="stylesheet" type="text/css"/>
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/bootstrap.js"></script>
</head>
<body class="p-3 mb-2 bg-dark text-white">
   <div>
      <div class="login_container">
         <div class ="login_logo" style="padding-left: 130px">
            <img src="/images/icons8-taxi-50.png">
         </div>
         <div class ="login_text">Login</div>
         <div class = "form_container">
            <form>
               <div class="form-group col-md-4">
                  <select id="inputState" class="form-control" style = "width:300px;">
                     <option selected>Passenger</option>
                     <option>Driver</option>
                  </select>
               </div>
               <div class="form-group" style="padding-left:14px;">
                  <input type="text" class="form-control" id="formGroupExampleInput" placeholder="User name" style = "width:300px;">
               </div>
               <div class="form-group" style="padding-left:14px;">
                  <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Password" style = "width:300px;">
               </div>
            </form>
         </div>
         <div class = "btn_login" style="padding-left:14px;">
            <button type="button" class="btn btn-info" style="width:300px">Login</button>
      </div>
         <div class="label_container" style="padding-left:14px;">
            <a href="#" class="alert-link">Sign Up</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#" class="alert-link">Forgot Password</a>
         </div>
      </div>
   </div>
</body>