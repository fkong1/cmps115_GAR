<head>
   <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap.css" rel="stylesheet" type="text/css"/>
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/bootstrap.js"></script>
</head>

<body class="p-3 mb-2 bg-dark text-white">
        <div class="register_container">
            <div class="register_text">Register</div>
            <form action="/register" method="post">
                <div class="register_form_container">
                    <div class="form-group">
                        <input type="text"  name="username" class="form-control" id="username" placeholder="User Name">
                    </div>
                    <div class="form-group">
                        <input type="text" name="password" class="form-control" id="password" placeholder="Password">
                    </div>
                </div>
                <div class="button_register">
                    <div class="submit_button" >
                        <button type="submit" class="btn btn-info" style="width: 148px;">Submit</button>
                    </div>

                    <div class="cancel_button">
                        <form action="/">
                            <button type="submit" class="btn btn-info" style="width: 148px;">Cancel</button>
                        </form>
                    </div>
                </div>
            </form>

        </div>
</body>