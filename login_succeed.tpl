<head>
    <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="images/icons8_cab_stand_50_fDM_icon.ico" type="image/x-icon" />
    <% if login_status == 'Driver': %>
        <meta http-equiv="Refresh" content="2;main">
    <% end %>
    <% if login_status == 'Passenger': %>
        <meta http-equiv="Refresh" content="2;pa_request">
    <% end %>



</head>

<body class="p-3 mb-2 bg-dark text-white">
    <div class="register_succeed_container">
        <div class="successful_sign">
            <img src="/images/icons8-checkmark-64.png">
        </div>
        <div class="successful_title">Congratulations!</div>
        <div class="successful_text">Welcome back!</div>
        <input type="hidden" name="login_status" value="{{login_status}}">


         </div>
    <div>
        <% if login_status == 'Driver': %>
            <script>
            var login_username="{{login_username}}";
            var login_userid="{{login_userid}}";
            var queryString = "?" + login_username + "&" + login_userid;
            setTimeout(function(){
                window.location.href = "main" + queryString;
                }, 1000);
            </script>
        <% end %>
        <% if login_status == 'Passenger': %>
            <script>
            var login_username="{{login_username}}";
            var login_userid="{{login_userid}}";
            var queryString = "?" + login_username+ "&" + login_userid;
            setTimeout(function(){
                window.location.href = "pa_request" + queryString;
                }, 1000);
            </script>
        <% end %>
     </div>

</body>