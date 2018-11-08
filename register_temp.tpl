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
                    <div class="form-group col-md-4 main_col-md-4">
                        <select id="inputState" class="form-control" style = "width:300px;">
                            <option selected>Passenger</option>
                            <option>Driver</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text"  name="username" class="form-control" id="username" placeholder="User Name">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <input type="text" name="cruzid" class="form-control" id="formGroupExampleInput" placeholder="Cruz ID">
                    </div>
                    <div class="form-group">
                        <input type="text" name="studentid" class="form-control" id="formGroupExampleInput" placeholder="Studen ID">
                    </div>
                    <div class="form-group">
                        <input type="text" name="emailaddress" class="form-control" id="formGroupExampleInput" placeholder="Email Address">
                    </div>
                </div>
                <div class="button_register">
                    <div class="submit_button" >
                        <button type="submit" class="btn btn-info" style="width: 148px;">Submit</button>
                    </div>

                    <div class="cancel_button">
                        <form action="/">
                            <button type="button" class="btn btn-info" onclick="window.location='http://localhost:3005/'" style="width: 148px;">Cancel</button>
                        </form>
                    </div>
                </div>
            </form>
        </div>
</body>