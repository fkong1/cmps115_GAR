<head>
   <!-- The line below includes stupid.css -->
  <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/js/customer.js"></script>
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
          <a class="dropdown-item" href="/profile">Profile</a>
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
          <th scope="col">Type</th>
          <th scope="col">Start Time</th>
          <th scope="col">End Time</th>
          <th scope="col">Starting Point</th>
          <th scope="col">Destination</th>
          <th scope="col">Passenger</th>
          <th scope="col" style="display: none;">Request_id</th>
          <th scope="col">Detail</th>
          <th scope="col">Status</th>
        </tr>
      </thead>

      <tbody>
      <%import datetime%>
      <%import mysql.connector, smtplib, json%>

      <!--<%mydb = mysql.connector.connect(-->
        <!--host="localhost",-->
        <!--user="root",-->
        <!--passwd="password",-->
        <!--database="gar_database")%>-->
      <!--<%mycursor = mydb.cursor()%>-->
      <!--<%sql = "select userid from user where username = '"+ logged_username +"'"%>-->
      <!--<%mycursor.execute(sql)%>-->
      <!--<%myresult = mycursor.fetchall()%>-->
      <% i = 1%>
      <%fruits = request_result%>
      <%for x in fruits:%>
            <tr>
              <!--<%if myresult[0][0] != x[5]: %>-->
              <th scope="row" id="html_col_num">{{i}}</th>
              <%i+=1%>
              <!--ride Type-->
              <td id = "html_type_id{{i-1}}"name ="html_type{{i-1}}">{{ x[0] }}</td>
              <!--start time-->
              <td id = "html_start_time_id{{i-1}}" name ="html_start_time{{i-1}}">{{ x[1] }}</td>
              <!--end time-->
              <td id = "html_end_time_id{{i-1}}" name ="html_end_time{{i-1}}">{{ x[2] }}</td>
              <!--starting point-->
              <td id = "html_start_point_id{{i-1}}" name = "html_start_point{{i-1}}">{{ x[3] }}</td>
              <!--destination-->
              <td id = "html_destination_id{{i-1}}" name = "html_destination{{i-1}}">{{ x[4] }}</td>
              <!--passenger-->
              <td >{{ x[5] }}</td>
              <!--request_id-->
              <td name = "html_request_id{{i-1}}" style="display: none;">{{ x[7] }}</td>

              <% currentDT = datetime.datetime.now()%>
              <% if currentDT.strftime("%Y/%m/%d %H:%M %p") > x[2]: %>
                <td><button type ="button" class="btn btn-outline-secondary btn_width_100" disabled>View</button></td>
                <td><button type ="button" class="btn btn-secondary btn_width_100" disabled>expired</button></td>

              <% elif x[6] == "new": %>
              <td><button type ="button" class="btn btn-outline-info btn_width_100 view_btn">View</button></td>
              <td><button type ="button" class="btn btn-info main_btn_width1">accept</button></td>
              <% elif x[6] == "accepted": %>
                <%if logged_user_id == x[8]:%>
                  <td><button type ="button" class="btn btn-outline-warning btn_width_100 view_btn">View</button></td>
                  <td><button type ="button" class="btn btn-warning main_btn_width" style="color:white;">cancel</button></td>
                <%else:%>
                  <td><button type ="button" class="btn btn-outline-info btn_width_100" disabled>View</button></td>
                  <td><button type ="button" class="btn btn-info btn_width_100" disabled>accepted</button></td>
                <%end%>
              <% elif x[6] == "cancel":%>
                <td><button type ="button" class="btn btn-outline-info btn_width_100" disabled>View</button></td>
                <td><button type ="button" class="btn btn-info btn_width_100" disabled>canceled</button></td>
              <% end %>
              <!--<% end %>-->
            </tr>
      <%end%>
      </tbody>
    </table>
</body>