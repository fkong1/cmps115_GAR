<head>
   <!-- The line below includes stupid.css -->
  <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/js/customer.js"></script>
  <script type="text/javascript" src="/js/require.js"></script>
  <link rel="shortcut icon" href="images/icons8_cab_stand_50_fDM_icon.ico" type="image/x-icon" />
  <title>Main</title>
</head>
<body class="p-3 mb-2 bg-dark text-white">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="float: right;">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="images/icons8-customer-64.png" style="width: 28px; height: 28px; float: left; ">{{logged_username}}
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
         <a class="dropdown-item" href="/profile">Profile</a>
          <div class="dropdown-divider"></div>
         <a class="dropdown-item" href="/">Log off</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
<div class ="login_text"><img src="images/icons8-request-service-64.png">Passenger Ride History </div>
<div class="button_add_ride">
    <a href="pa_request"><button type ="submit" class="btn add_btn_width">Add New Ride</button></a>
</div>
<table class="table">
    <thead class="thead-dark">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Type</th>
          <th scope="col">Start Time</th>
          <th scope="col">End Time</th>
          <th scope="col">Starting Point</th>
          <th scope="col">Destination</th>
          <!--<th scope="col">Detail</th>-->
          <th scope="col">Status</th>
        </tr>
    </thead>

    <tbody>
    <%import datetime%>
    <% i = 1%>
        <%fruits = request_result%>
        <%for x in fruits:%>

            <tr>
              <th scope="row">{{i}}</th>
              <%i+=1%>
              <td id = "html_type_id{{i-1}}"name ="html_type{{i-1}}">{{ x[0] }}</td>
              <td id = "html_start_time_id{{i-1}}" name ="html_start_time{{i-1}}">{{ x[1] }}</td>
              <td id = "html_end_time_id{{i-1}}" name ="html_end_time{{i-1}}">{{ x[2] }}</td>

              <td id = "html_start_point_id{{i-1}}" name = "html_start_point{{i-1}}">{{ x[3] }}</td>
              <td id = "html_destination_id{{i-1}}" name = "html_destination{{i-1}}">{{ x[4] }}</td>
              <!--<td><button type ="button" class="btn btn-outline-info main_btn_width" >View</button></td>-->
              <td name = "html_request_id{{i-1}}" style="display: none;">{{ x[7] }}</td>
                <% currentDT = datetime.datetime.now()%>
                <% if currentDT.strftime("%Y/%m/%d %H:%M %p") > x[2]: %>
                <td><button type ="button" class="btn btn-secondary main_btn_width " id="expired" disabled>expired</button></td>
              <% elif x[6]=="new": %>
              <td><button type ="button" class="btn customer_request_bottom_width main_btn_width2">cancel</button></td>
              <% elif x[6]=="accepted": %>
              <td><button type ="button" class="btn customer_request_bottom_width " disabled>accepted</button></td>
                <%elif x[6]=="cancel":%>
                <td><button type ="button" class="btn customer_request_bottom_width " disabled>canceled</button></td>
              <% end %>
            </tr>
        <%end%>
    </tbody>
</table>

</body>