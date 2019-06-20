<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mysql.cj.Session"%>
<%@ 
	page
	import="
		com.rent.car.controller.UserController, 
		com.rent.car.controller.BookingController, 
		com.rent.car.controller.UserLogController,
		com.rent.car.controller.CarController,
		javax.servlet.http.HttpSession
	"%>
<!-- [Author: Vyshnavi] -->
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<title>RentoCar: Welcome</title>
</head>
<body>

	<%
		String id = (String) request.getSession().getAttribute("session_id");
		String carId = (String) request.getParameter("carid");
		UserController user = (UserController) request.getSession().getAttribute("user_controller");

		if (id != null && !user.getFirstName(id).equals("")) {

			// Getting the necessary objects from session
			UserLogController userLog = (UserLogController) request.getSession().getAttribute("user_log_controller");
			BookingController booking = (BookingController) request.getSession().getAttribute("booking_controller");
			CarController car = (CarController) request.getSession().getAttribute("car_controller");

			// Using the necessary objects
			String userFirstName = user.getFirstName(id);
			String userEmail = user.getEmail(id);
			
			// Car Details
			//String carName = car.getCarName(carId);
			String selectedCarName = car.getCarName(carId);
			String selectedCarImgPath = car.getImgPath(carId);
			String selectedCarDescription = car.getDescription(carId);
			String selectedCarType = car.getCarType(carId);
			String selectedCarMileage = car.getMileage(carId);
			String selectedCarSeaters = car.getSeaters(carId);
			String selectedCarCost = car.getCost(carId);
	%>
	<!-- Navigation -->
	<div class="navbar-fixed">
		<nav class="nav-wrapper indigo darken-3">
			<div class="container">
				<a class="sidenav-trigger" href="#" data-target="menu-link"> <i
					class="material-icons">menu</i>
				</a>
				<div class="brand-logo">
					<a href="User.jsp"> RentoCar </a>
				</div>
				<ul class="right hide-on-med-and-down">
					<li><a href="#modalwallet"
						class="waves-effect waves-light modal-trigger">Wallet</a></li>
					<li><a href="#booking"
						class="waves-effect waves-dark dropdown-trigger"
						data-target="booking_dropdown">Booking</a></li>
					<!-- Booking Dropdown -->
					<ul id="booking_dropdown" class="dropdown-content">
						<li><a href="UserHistory.jsp" class="indigo-text">History</a></li>
					</ul>
					<li><a href="#username"
						class="waves-effect waves-dark dropdown-trigger"
						data-target="account_dropdown"> <i class="material-icons">person_outline</i>
					</a></li>
					<!-- Account Dropdown -->
					<ul id="account_dropdown" class="dropdown-content">
						<li><a class="indigo-text">Hi <%=userFirstName%></a></li>
						<li><a href="user_profile" class="indigo-text">Profile</a></li>
						<li><a href="logout" class="indigo-text">Logout</a></li>
					</ul>
				</ul>
			</div>
		</nav>
	</div>

	<!-- Side Navigation for mobile devices -->
	<ul class="sidenav" id="menu-link">
		<li>
			<div class="user-view">
				<div class="background indigo accent-4"></div>
				<a href="#user"> <img src="images/user_profile.png"
					class="circle">
				</a> <a href="#name"><span class="name white-text"><%=userFirstName%></span></a>
				<a href="#email"><span class="email white-text"><%=userEmail%></span></a>
			</div>
		</li>
		<li><a href="#modalwallet"
			class="waves-effect waves-light modal-trigger">Wallet</a></li>
		<li>
			<ul class="collapsible" id="collapsibleBooking"
				style="margin-left: 5%;">
				<li>
					<div class="collapsible-header">Booking</div>
					
					<div class="collapsible-body">
						<a href="UserHistory.jsp"
							class="waves-effect waves-light modal-trigger"
							style="margin-left: 5%;">History</a>
					</div>
				</li>
			</ul>
		</li>
		<li>
			<ul class="collapsible" id="collapsibleAccount"
				style="margin-left: 5%;">
				<li>
					<div class="collapsible-header">Account</div>
					<div class="collapsible-body">
						<a href="user_profile" class="waves-effect "
							style="margin-left: 5%;">Profile</a>
					</div>
					<div class="collapsible-body">
						<a href="logout" class="waves-effect " style="margin-left: 5%;">Logout</a>
					</div>
				</li>
			</ul>
		</li>
	</ul>
	<!------Side Navigation ends here----->

<!-- Author Dheeraj Joshi -->
	<div class="container">
		<h3 class="indigo-text darken-3">Book Car</h3>

		<div class="row">
			<!-----Displaying Selected car----->

			<div class="card col s12 m7 l4">
				<div class="card-image waves-effect waves-block waves-light small">
					<img class="activator" src="<%=selectedCarImgPath%>">
				</div>
				<div class="card-content">
					<span class="card-title activator grey-text text-darken-4"> <%= selectedCarName%> <i class="material-icons right">more_vert</i></span>
				</div>
				<a href="ChooseCar.jsp" class="btn indigo" style="margin-top:0;margin-bottom:2%;margin-left:0;">Choose Another</a>

				<div class="card-reveal">
					<span class="card-title grey-text text-darken-4"><%= selectedCarName %><i
						class="material-icons right">close</i></span>
					<p>
						<b>Description:</b> <%= selectedCarDescription %><br>
						<b>Type:</b> <%= selectedCarType %><br>
						<b>Mileage:</b> <%= selectedCarMileage %><br>
						<b >Cost:</b> <span id="car_cost"><%= selectedCarCost %></span>/hr<br>
						<b>Seats:</b> <%= selectedCarSeaters %><br>
					</p>
				</div>
			</div>
	
			<div class="col s12 m5 l8 ">
				<form method="get" action="rentcar">
				<div class="booking-form" style="margin-left:4%;">
					<div class="input-field">
						<input type="text" id="from_location" class="autocomplete">
						<label for="autocomplete-input black-text darken-3">From</label>
					</div>

					<div class="input-field">
						<input type="text" id="to_location" class="autocomplete">
						<label for="autocomplete-input">To</label>
					</div>

					<div>
						<div class="input-field col s6">
							<input type="text" id="start_date" class="validate datepicker">
							<label for="start_date">Start Date</label>
						</div>

						<div class="input-field col s6">
							<input type="text" id="start_time" class="validate timepicker">
							<label for="start_time">Start Time</label>
						</div>
					</div>

					<div>
						<div class="input-field col s6">
							<input type="text" id="end_date" class="validate datepicker">
							<label for="end_date">End Date</label>
						</div>

						<div class="input-field col s6">
							<input type="text" id="end_time" class="validate timepicker">
							<label for="end_time">End Time</label>
						</div>
					</div>
				<h4>
						Cost: <span id="calculated_cost">0</span>
						<span id="car_id" class="hide"><%= carId %></span>
						<span class="Get-Price">
							<label for="Get-Price">Rs</label>
						</span>
						<a href="#" class="btn indigo" id="check_rate">Check rate</a>
				</h4>
					<div>
						<button id="submit" class="waves-effect waves-light btn indigo darken-3">Proceed to pay</button>
					</div>
				</div>
				</form>
				

			</div>
			<!-------Closing the form-------->
		</div>
	</div>
	
		<div id="modalwallet" class="modal">
			<form class="form" action="addwallet" method="post">
				<div class="row container" style="margin-top: 2%;">
					<div class="col s12">
						<div class="modal-content">
							<h4>Add Money</h4>
						</div>
					</div>
				</div>
				<div class="row container">
					<div class="col s6 l8">
						<div class="input-field ">

							<input id="amount" name="amount" type="text" class="validate">
							<label for="money">Enter Amount </label>
						</div>
					</div>
					<div class="col s6 l4">
						<div class="modal-footer">

							<button type="submit"
								class="modal-close waves-effect waves-indigo btn left indigo "
								onclick="M.toast({html: 'Money added!'})"
								style="margin-left: 2%;">Add Money</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>


	<!----Footer------>
	<footer>
		<div class="footer-copyright indigo lighten-4"
			style="padding-top: 20px; padding-bottom: 1px;">
			<div class="container">
				<div class="row">
					<div class="col">&copy RentoCar 2018-2019</div>
					<div class="col right">
						<a href="#!" class="">Contact Us</a>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- Compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<!-- Initializing all the materialize elements -->
	<script type="text/javascript">
         $(document).ready(
          ()=>  {
            // Sidenav initialization
            $('.sidenav').sidenav();
            // Slider initialization and params setting
            $('.slider').slider(
              {
                indicators: false,
                height: 450,
                interval: 3000
              }
            );
            // Modal initialization
            $('.modal').modal();
            // Form initialization
            $('select').formSelect();
            // $('.datepicker').datepicker();
            // $('.timepicker').timepicker();
            //User profile Drop down
         $('.dropdown-trigger').dropdown();

         //Time picker
        $(document).ready(function(){
            $('.timepicker').timepicker(
            	{
            		twelveHour: false	
            	}		
            );
        });

        //Date picker
        $(document).ready(function(){
            $('.datepicker').datepicker(
            	{
            		 //format: 'dd-mm-yyyy'
            	}
            );
        });
        
   	 $("#submit").click(function(e){
         e.preventDefault();
         $('#login').show();
       $.ajax({type: "POST",
               url: "rentcar",
               data: { 
            	   car_id: $("#car_id")[0].innerHTML,
            	   from_location: $("#from_location").val(),
            	   to_location: $("#to_location").val(),
            	   start_date: $("#start_date").val(),
            	   start_time: $("#start_time").val(),
            	   end_date: $("#end_date").val(),
            	   end_time: $("#end_time").val(),
            	   calculated_cost: $("#calculated_cost")[0].innerHTML
            	},
               success: function(result){
            	   if(result == "success")	{
            		   console.log(result);
            		   M.toast({html: 'Car Booked!'});
            	   		setTimeout(function()	{
            		   		window.location.href = "User.jsp";
            	   			}, 1000);
            	   }
            	   else	{
            		   console.log(result);
            		   M.toast({html: 'Car booking failed!, please try after sometime!'});
            		   setTimeout(
							function()	{
								
							},
							1000
            		   );
            	   }
               }});
     });
                
        $('#check_rate').click(
        	()=>	{
        		start_date = new Date($('#start_date').val() + ' ' + $('#start_time').val());
        		end_date = new Date($('#end_date').val() + ' ' + $('#end_time').val());
        		
        		//console.log("Start Date: " + start_date + " " + "End Date: " + end_date);
        		date_diff = end_date - start_date;
        		date_diff_hrs = date_diff/3600000;
        		car_cost = $('#car_cost')[0].innerHTML;
        		total_cost = parseInt(date_diff_hrs) * parseInt(car_cost);
				//console.log(date_diff_hrs + ' ' + car_cost + ' ' + total_cost);
        		$('#calculated_cost')[0].innerHTML = total_cost;
        	}		
        );
          }
         );
               
      </script>
	<%
		} else {
			response.sendRedirect("Index.jsp");
		}
	%>
</body>
</html>