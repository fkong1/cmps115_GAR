<head>
   <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap.css" rel="stylesheet" type="text/css"/>
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/bootstrap.js"></script>

   <script src="https://www.gstatic.com/firebasejs/5.5.6/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyAOOqsx8ZbKsFrm-8T4ZTkEYZbROKzyMJA",
    authDomain: "cmps115-gar.firebaseapp.com",
    databaseURL: "https://cmps115-gar.firebaseio.com",
    projectId: "cmps115-gar",
    storageBucket: "cmps115-gar.appspot.com",
    messagingSenderId: "765891788857"
  };
  firebase.initializeApp(config);
</script>

</head>
<body class="p-3 mb-2 bg-dark text-white">
   <div>
      <div class="login_container">
         <div class ="login_logo">
            <img src="https://firebasestorage.googleapis.com/v0/b/cmps115-gar.appspot.com/o/images%2Ficons8-taxi-50.png?alt=media&token=b411c2c1-9874-4428-ab7d-f0a703abb9b0">
         </div>
         <div class ="login_text">Login</div>
         <div class = "form_container">
            <form id ="login_form">
               <div class="form-group col-md-4 main_col-md-4">
                  <select id="inputState" class="form-control" style = "width:300px;">
                     <option selected>Passenger</option>
                     <option>Driver</option>
                  </select>
               </div>
               <div class="form-group" >
                  <input id = "username" type="text" class="form-control" id="formGroupExampleInput" placeholder="User name" style = "width:300px;">
               </div>
               <div class="form-group" >
                  <input id = "password" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Password" style = "width:300px;">
               </div>
            </form>
         </div>
         <div class = "btn_login" >
            <form>
               <button id="login" class="btn btn-info" style="width:300px">Login</button>
            </form>
         </div>
         <div class="label_container">
            <div class="main_link_1">
               <a href="register" class="alert-link">Sign Up</a>
            </div>
            <div class="main_link_2">
               <a href="findpw" class="alert-link">Forgot Password</a>
            </div>
         </div>
      </div>
   </div>

   <script>

       document.getElementById("login").addEventListener("click", checkForm);

      function checkForm() {
          var login_form = document.querySelector('#login_form');
           alert("login_form");

               var username = login_form.username.value;
               alert(username);
               var password = login_form.password.value;
               alert(password);


               if(!username || !password){
                   alert("aaaa");
                   return console.log('username and password required');

               }
           firebase.auth().signInWithUsenameAndPassword(username, password).catch(function (error) {
               var errorCode = error.code;
               var errorMessage = error.message;
               console.log('signIn error',error);

               });
      };

   </script>
</body>