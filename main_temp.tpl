<head>
   <!-- The line below includes stupid.css -->
  <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>
  <link rel="shortcut icon" href="images/icons8_cab_stand_50_fDM_icon.ico" type="image/x-icon" />
  <title>Main</title>
</head>
<body class="p-3 mb-2 bg-dark text-white">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="collapse navbar-collapse text_to_right" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <img src="images/icons8-customer-64.png" style="width: 32px; height: 32px; float: right; margin-top: 3px">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           {{logged_username}}
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Profile</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/">Log off</a>
        </div>
      </li>

    </ul>
  </div>
</nav>

    <div class ="login_text"><img src="images/icons8-request-service-64.png">Request List</div>
    <table class="table">
      <thead class="thead-dark">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Start Time</th>
          <th scope="col">End Time</th>
          <th scope="col">Starting Point</th>
          <th scope="col">Destination</th>
          <th scope="col">Detail</th>
          <th scope="col">Status</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>Mark</td>
          <td>Otto</td>
          <td>@mdo</td>
          <td>@mdo</td>
          <td>@mdo</td>
          <td><button type ="butto " class="btn btn-info main_btn_width" >Detail</button></td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Jacob</td>
          <td>Thornton</td>
          <td>@fat</td>
          <td>@fat</td>
          <td>@fat</td>
          <td><button type ="butto " class="btn btn-secondary main_btn_width" disabled>Accepted</button></td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Larry</td>
          <td>the Bird</td>
          <td>@twitter</td>
          <td>@twitter</td>
          <td>@fat</td>
          <td><button type ="butto " class="btn btn-secondary main_btn_width" disabled>Accepted</button></td>
        </tr>
      </tbody>
    </table>
</body>