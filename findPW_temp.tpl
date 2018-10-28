<head>
   <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap.css" rel="stylesheet" type="text/css"/>
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/bootstrap.js"></script>
</head>
<body class="p-3 mb-2 bg-dark text-white">
   <div class="psw_container">
      <div class="register_container">
         <div class="register_text">
            <p>Find your password</p>
         </div>
         <div class="register_form_container">
            <div class="selection_container">
               <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
               <label class="form-check-label radio_label" for="exampleRadios1">Username: </label>
               <input type="text" class="form-control" id="find_by_ID" placeholder="find by username" style = "width:190px;">
            </div>
            <div class="selection_container">
               <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
               <label class="form-check-label radio_label" for="exampleRadios2">Email: </label>
               <input type="text" class="form-control" id="find_by_email" placeholder="find by email" style = "width:190px;">
            </div>
            <div class="psw_btn_container">
               <div class = "psw_btn_1">
                  <button type="button-inline" class="btn btn-info" style="width: 144px;">Send</button>
               </div>
               <div class = "psw_btn_2">
                  <form action="/" method="get">
                  <button type="button-inline" class="btn btn-info" style="width: 144px;">Cancle</button>
                     </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>