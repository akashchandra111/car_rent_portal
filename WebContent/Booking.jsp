<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mysql.cj.Session"%>
<%@ 
	page
	import="
		com.rent.car.controller.UserController, 
		com.rent.car.controller.BookingController, 
		com.rent.car.controller.UserLogController, 
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
		UserController user = (UserController) request.getSession().getAttribute("user_controller");

		String carid = (String) request.getSession().getAttribute("car_id");
		String carname = (String) request.getSession().getAttribute("car_name");
		String cardesc = (String) request.getSession().getAttribute("car_desc");
		String carmileage = (String) request.getSession().getAttribute("car_mileage");
		String carimagepath = (String) request.getSession().getAttribute("car_image_path");

		if (id != null && !user.getFirstName(id).equals("")) {

			// Getting the necessary objects from session
			UserLogController userLog = (UserLogController) request.getSession()
					.getAttribute("user_log_controller");
			BookingController booking = (BookingController) request.getSession().getAttribute("booking_controller");

			// Using the necessary objects
			String userWallet = user.getWallet(id);
			String userFirstName = user.getFirstName(id);
			String userEmail = user.getEmail(id);
			String carPickupLocation = userLog.getCurrentLocation(id);
			String carPickupTime = userLog.getStartTime(id);
	%>
	<!-- Navigation -->
	<div class="navbar-fixed">
		<nav class="nav-wrapper indigo darken-3">
			<div class="container">
				<a class="sidenav-trigger" href="#" data-target="menu-link"> <i
					class="material-icons">menu</i>
				</a>
				<div class="brand-logo">
					<a href="#"> RentoCar </a>
				</div>
				<ul class="right hide-on-med-and-down">
					<li><a href="#modalwallet"
						class="waves-effect waves-light modal-trigger">Wallet</a></li>
					<li><a href="#booking"
						class="waves-effect waves-dark dropdown-trigger"
						data-target="booking_dropdown">Booking</a></li>
					<!-- Booking Dropdown -->
					<ul id="booking_dropdown" class="dropdown-content">
						<li><a href="RentCar.jsp" class="indigo-text">Rent a car</a></li>
						<li><a href="History.jsp" class="indigo-text">History</a></li>
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
						<a href="RentCar.jsp"
							class="waves-effect waves-light modal-trigger"
							style="margin-left: 5%;">Rent a Car</a>
					</div> <!-- 					<div class="collapsible-body"> --> <!-- 						<a href="CurrentBooking.jsp" -->
					<!-- 							class="waves-effect waves-light modal-trigger" --> <!-- 							style="margin-left: 5%;">Current Booking</a> -->
					<!-- 					</div> -->
					<div class="collapsible-body">
						<a href="History.jsp"
							class="waves-effect waves-light modal-trigger"
							style="margin-left: 5%;">History</a>
					</div>
				</li>
				<!--             <a href="#booking" class="waves-effect waves-dark"></a> -->
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
					</div> <!-- 					  <li><a href="logout" class="indigo-text">Logout</a></li> -->
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
					<img class="activator" src="images/background.jpg">
				</div>
				<div class="card-content">
					<span class="card-title activator grey-text text-darken-4"><%=carname%><i
						class="material-icons right">more_vert</i></span>
						
						
						
				</div>
				<a href="#" class="btn indigo" style="margin-top:0;margin-bottom:2%;margin-left:0;">Choose Another Car</a>

				<div class="card-reveal">
					<span class="card-title grey-text text-darken-4"><%=carname%><i
						class="material-icons right">close</i></span>
					<p><%=cardesc%></p>
				</div>
			</div>
			<!--               <div class="col s5 m4 "> -->
			<!--                     <div class="card indigo darken-3"> -->
			<!--                         <div class="card-image waves-effect waves-block waves-light"> -->
			<%--                             <img class="activator" src="<%=carname %>"> --%>
			<!--                         </div> -->
			<!--                         <div class="card-content"> -->
			<%--                             <span class="card-title activator white-text text-darken-4"><%=carname %><i class="material-icons right">more_vert</i></span> --%>
			<!--                             <div class = "card-action">   -->
			<!--                                 <button class = "btn waves-effect waves-light white">  -->
			<!--                                 <a class = "black-text" href = "home.html">Change your car</a>  -->
			<!--                                 </button>   -->
			<!--                             </div> -->
			<!--                         </div> -->
			<!--                         <div class="card-reveal"> -->
			<!--                             <span class="card-title black-text text-darken-4">Car Information<i class="material-icons right">close</i></span> -->
			<%--                             <p><%=cardesc %></p> --%>
			<!-- <!--                             <p> It packs a Bluetooth-enabled audio system that offers hands-free calling and music streaming, central locking, manual AC, LED daytime running lights and more. For safety, it gets only ABS with EBD as standard since the driver airbag is limited to the top-spec S variant only. It is white in colour and 4seater.</p> -->
			<!--                         </div> -->
			<!--                     </div> -->
			<!--               </div>---Closing the card------ -->

	
	
	
			<div class="col s12 m5 l8 ">				<!------Opening the form------->
				<div class="booking-form" style="margin-left:4%;">
					<div class="input-field">
						<input type="text" id="autocomplete-input" class="autocomplete">
						<label for="autocomplete-input black-text darken-3">Origin
							City</label>
					</div>

					<div class="input-field">
						<input type="text" id="autocomplete-input" class="autocomplete">
						<label for="autocomplete-input">Delivery City</label>
					</div>

					<div>
						<div class="input-field col s6">
							<input type="text" id="date-picker1" class="validate datepicker">
							<label for="date-picker1">Start Date</label>
						</div>

						<div class="input-field col s6">
							<input type="text" id="time-picker1" class="validate timepicker">
							<label for="time-picker1">Start Time</label>
						</div>
					</div>

					<div>
						<div class="input-field col s6">
							<input type="text" id="date-picker2" class="validate datepicker">
							<label for="date-picker2">End Date</label>
						</div>

						<div class="input-field col s6">
							<input type="text" id="time-picker2" class="validate timepicker">
							<label for="time-picker2">End Time</label>
						</div>
					</div>
					<div>
						<h4>
							<p class="Get-Price">
								Cost: <label for="Get-Price">Rs </label>
							</p>
						</h4>
						<a class="waves-effect waves-light btn indigo darken-3">Proceed
							to pay</a>

					</div>

				</div>
			</div>
			<!-------Closing the form-------->
		</div>
	</div>

	<!----Footer------>
	<footer>
	<div class="footer-copyright indigo lighten-4 "
		style="padding-top: 20px;">
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
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
                }

         );
         <!-- Author Dheeraj Joshi-->
         //User profile Drop down
         $(".dropdown-trigger").dropdown();

         //Time picker
        $(document).ready(function(){
            $('.timepicker').timepicker();
        });

        //Date picker
        $(document).ready(function(){
            $('.datepicker').datepicker();
        });
      
      </script>
	<%
		} else {
			response.sendRedirect("Index.jsp");
		}
	%>
</body>
</html>