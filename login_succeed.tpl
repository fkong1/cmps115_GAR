<head>
    <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="images/icons8_cab_stand_50_fDM_icon.ico" type="image/x-icon" />

    {{login_status}} = driver
    {{login_status == 'Driver' }}
    <meta http-equiv="Refresh" content="2;main">

</head>

<body class="p-3 mb-2 bg-dark text-white">
    <div class="register_succeed_container">
        <div class="successful_sign">
            <img src="/images/icons8-checkmark-64.png">
        </div>
        <div class="successful_title">Congratulations!</div>
        <div class="successful_text">Welcome back!</div>

    </div>

    <!--p v-if="{{login_status == 'Passenger'}}=== True">tt</p>
    <p v-if="{{login_status == 'Driver'}} === False"> ee </p-->

</body>