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
   <link rel="shortcut icon" href="images/icons8_cab_stand_50_fDM_icon.ico" type="image/x-icon" />
   <title>New Ride</title>
   <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
   <meta charset="utf-8">
</head>
<body class="p-3 mb-2 bg-dark">
   <nav class="navbar navbar-default" role="navigation" style="background-color:#343a40 !important; border-color: #343a40;">
      <div class="container-fluid">
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
               <img src="images/icons8-customer-64.png" style="width: 32px; height: 32px;margin-top: 8px;">
               <li class="dropdown" style="float:right;">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                     {{logged_username}}
                     <span class="caret"></span>
                  </a>
                  <ul class="dropdown-menu" role="menu">
                     <li><a href="/profile">Profile</a></li>
                     <li class="divider"></li>
                     <li><a href="/">Log off</a></li>
                  </ul>
               </li>
            </ul>
         </div>
      </div>
   </nav>
   <div class ="login_text text-white"><img src="/images/icons8-taxi-booking-office-64.png"> View Detail</div>
   <%for x in view_details: %>
   <div id="request_id" class="request_id">{{x[8]}}</div>
   <div class="newrider_container">
      <div class="newrider_container_left">
         <form action="/new_request" method="post">
            <div class="newrider_row_container">
               <div class="newrider_row_container_label text-white">Passenger: </div>
               <div class="view_row_container_input text-white">
                  {{ x[4] }}
               </div>
            </div>
            <div class="newrider_row_container">
               <div class="newrider_row_container_label text-white">Rider Type: </div>
               <div class="view_row_container_input text-white">
                  {{ x[0] }}
               </div>
            </div>
            <div class="newrider_row_container">
               <div class="newrider_row_container_label text-white">Start Time: </div>
               <div class="view_row_container_input text-white">
                  {{ x[1] }}
               </div>
            </div>
            <div class="newrider_row_container">
               <div class="newrider_row_container_label text-white">End Time: </div>
               <div class="view_row_container_input text-white">
                  {{ x[2] }}
               </div>
            </div>
            <div id="riderType" class="newrider_checkbox_area">
               <div class="custom-control1 custom-checkbox1">
                  <div class = "nerrider_checkbox_group_label text-white text-right">Repeat: </div>
                  <div class = "nerrider_checkbox_group">
                     <div class="newrider_checkbox_row_container">
                        <input type="checkbox" class="custom-control-input1" id="ck_1" name="ck_1">
                        <label class="custom-control-label1 text-white" for="ck_1" >Monday</label>
                     </div>
                     <div class="newrider_checkbox_row_container">
                        <input type="checkbox" class="custom-control-input1" id="ck_2" name="ck_2">
                        <label class="custom-control-label1 text-white" for="ck_2">Tuesday</label>
                     </div>
                     <div class="newrider_checkbox_row_container">
                        <input type="checkbox" class="custom-control-input1" id="ck_3" name="ck_3">
                        <label class="custom-control-label1 text-white" for="ck_3">Wednesday</label>
                     </div>
                     <div class="newrider_checkbox_row_container">
                        <input type="checkbox" class="custom-control-input1" id="ck_4" name="ck_4">
                        <label class="custom-control-label1 text-white" for="ck_4">Thursday</label>
                     </div>
                     <div class="newrider_checkbox_row_container">
                        <input type="checkbox" class="custom-control-input1" id="ck_5" name="ck_5">
                        <label class="custom-control-label1 text-white" for="ck_5">Friday</label>
                     </div>
                  </div>
               </div>
            </div>
            <div class="view_newrider_row_container">
               <div class="view_newrider_row_container_label text-white" id="starting_point_id_label">Starting Point: </div>
               <div class="view_row_container_input text-white" id="starting_point_id">
                  {{ x[5] }}
               </div>
            </div>
            <div class="view_newrider_row_container">
               <div class="view_newrider_row_container_label text-white" id="destination_id_label">Destination: </div>
               <div class="view_row_container_input text-white" id="destination_id">
                  {{ x[6] }}
               </div>

            </div>
            <div class="direction_row_container text-white" >
                <div id="right-panel">
                  <p>Total Distance: <span id="total"></span></p>
                </div>
            </div>
            <div class="newrider_row_container" id="request_type">
               <div class="view_btn_triple" style="text-align: right !important; padding-right: 10px;">
                  <%if x[7] == "new":%>
                  <button type ="button" class="btn btn-info view_btn_width view_accept">accept</button>
                  <%elif x[7] == "accepted":%>
                  <button type ="button" class="btn btn-warning view_btn_width view_cancel" style="color:white;">cancel</button>
                  <%end%>
               </div>
               <div class="view_btn_triple" style="text-align: left !important; padding-left: 10px;">
                  <%if x[7] == "new":%>
                  <a href="/main"><button type ="button" class="btn btn-info view_btn_width" >Back</button></a>
                  <%elif x[7] == "accepted":%>
                  <a href="/main"><button type ="button" class="btn btn-warning view_btn_width" style="color:white;">Back</button></a>
                  <%end%>
               </div>
            </div>
         </form>
      </div>
      <div class="newrider_container_right text-white">
         <div id="map"></div>
      </div>
   </div>
   <script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: {lat: 36.9916, lng: -122.0583}  // UCSC.
        });
        var originInput = document.getElementById('starting_point_id').innerText;
        var destinationInput = document.getElementById('destination_id').innerText;

        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer({
          draggable: false,
          map: map,
          panel: document.getElementById('right-panel')
        });

        directionsDisplay.addListener('directions_changed', function() {
          computeTotalDistance(directionsDisplay.getDirections());
        });

        displayRoute(originInput, destinationInput, directionsService, directionsDisplay);
      }

      function displayRoute(origin, destination, service, display) {
        service.route({
          origin: origin,
          destination: destination,
          travelMode: 'DRIVING',
          avoidTolls: true
        }, function(response, status) {
          if (status === 'OK') {
            display.setDirections(response);
          } else {
            alert('Could not display directions due to: ' + status);
          }
        });
      }

      function computeTotalDistance(result) {
        var total = 0;
        var myroute = result.routes[0];
        for (var i = 0; i < myroute.legs.length; i++) {
          total += myroute.legs[i].distance.value;
        }
        total = total / 1000;
        document.getElementById('total').innerHTML = total + ' km';
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDL1YkEcCMEebnwcML3AaISv0i0L0fAqX0&callback=initMap">
    </script>
</body>