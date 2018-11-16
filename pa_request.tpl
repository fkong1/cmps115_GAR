<head>
   <!-- The line below includes stupid.css -->
   <link href="/css/bootstrap-3.3.1.min.css" rel="stylesheet" type="text/css"/>
   <link href="/css/bootstrap-3.3.1-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
   <link href="/css/customer.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="/js/jquery.min.js"></script>
   <script type="text/javascript" src="/js/moment.min.js"></script>
   <script type="text/javascript" src="js/bootstrap-3.3.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap-3.3.1-datetimepicker.min.js"></script>
    <script type="text/javascript" src="js/customer.js"></script>
   <title>New Ride</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
</head>

<body class="p-3 mb-2 bg-dark">

<nav class="navbar navbar-default" role="navigation" style="background-color:#343a40 !important; border-color: #343a40;">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
          <img src="images/icons8-customer-64.png" style="width: 32px; height: 32px;margin-top: 8px;">
        <li class="dropdown" style="float:right;">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Cruz ID <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Profile</a></li>
            <li class="divider"></li>
            <li><a href="#">Log off</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

   <div class ="login_text text-white"><img src="/images/icons8-taxi-booking-office-64.png"> New Ride</div>
   <div class="newrider_container">
      <div class="newrider_container_left">
          <form action="/new_request" method="post">
              <div class="newrider_row_container">
                <div class="newrider_row_container_label text-white">Rider Type: </div>
                <div class="newrider_row_container_input">
                   <select id="rider_type_id" name="ride_status" class="form-control newrider_btn_width">
                      <option selected>Single Ride</option>
                      <option>Long Period</option>
                   </select>
                </div>
             </div>
              <div class="newrider_row_container">
                <div class="newrider_row_container_label text-white">Start Time: </div>
                <div class="newrider_row_container_input">
                   <div class="form-group datetime_select_width">
                      <div class='input-group date' id='datetimepicker1'>
                         <input type='text' class="form-control" name="input_start_time"/>
                         <span class="input-group-addon">
                         <span class="glyphicon glyphicon-calendar"></span>
                         </span>
                      </div>
                   </div>
                </div>
             </div>
              <div class="newrider_row_container">
                <div class="newrider_row_container_label text-white">End Time: </div>
                <div class="newrider_row_container_input">
                   <div class="form-group datetime_select_width">
                      <div class='input-group date' id='datetimepicker2'>
                         <input type='text' class="form-control" name="input_end_time"/>
                         <span class="input-group-addon">
                         <span class="glyphicon glyphicon-calendar"></span>
                         </span>
                      </div>
                   </div>
                </div>
             </div>
              <div id="riderType" class="newrider_checkbox_area">
                <div class="custom-control1 custom-checkbox1">
                 <div class = "nerrider_checkbox_group_label text-white text-right">Repeat: </div>
                 <div class = "nerrider_checkbox_group">
                    <div class="newrider_checkbox_row_container">
                       <input type="checkbox" class="custom-control-input1" id="customCheck1">
                       <label class="custom-control-label1 text-white" for="customCheck1">Monday</label>
                    </div>
                    <div class="newrider_checkbox_row_container">
                       <input type="checkbox" class="custom-control-input1" id="customCheck2">
                       <label class="custom-control-label1 text-white" for="customCheck2">Tuesday</label>
                    </div>
                    <div class="newrider_checkbox_row_container">
                       <input type="checkbox" class="custom-control-input1" id="customCheck3">
                       <label class="custom-control-label1 text-white" for="customCheck3">Wednesday</label>
                    </div>
                    <div class="newrider_checkbox_row_container">
                       <input type="checkbox" class="custom-control-input1" id="customCheck4">
                       <label class="custom-control-label1 text-white" for="customCheck4">Thursday</label>
                    </div>
                    <div class="newrider_checkbox_row_container">
                       <input type="checkbox" class="custom-control-input1" id="customCheck5">
                       <label class="custom-control-label1 text-white" for="customCheck4">Friday</label>
                    </div>
                </div>
             </div>
              </div>
              <div class="newrider_row_container">
                <div class="newrider_row_container_label text-white">Starting Point: </div>
                <div class="newrider_row_container_input">
                    <input class="form-control newrider_btn_width" type="text" placeholder="Starting Point" name="input_staring_point"/>
                </div>
             </div>
              <div class="newrider_row_container">
                <div class="newrider_row_container_label text-white">Destination: </div>
                <div class="newrider_row_container_input">
                    <input class="form-control newrider_btn_width" type="text" placeholder="Destination" name="input_destination"/>
                </div>
             </div>
              <div class="newrider_row_container">
                 <div class="newrider_btn_left">
                    <button type ="submit" class="btn btn-info request_btn_width">Submit</button>
                     </div>
                  <div class="newrider_btn_right">
                <button type ="reset" class="btn btn-info request_btn_width">Reset</button>
                  </div>
             </div>
          </form>
      </div>
      <div class="newrider_container_right text-white">
          <div id="map"></div>
      </div>
   </div>
 <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 8
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDL1YkEcCMEebnwcML3AaISv0i0L0fAqX0&callback=initMap"
    async defer></script>
</body>