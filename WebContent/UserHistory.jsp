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
	
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<title>RentoCar: History</title>
</head>
<body>

	<%
		String id = (String) request.getSession().getAttribute("session_id");
		UserController user = (UserController) request.getSession().getAttribute("user_controller");

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
						<li><a href="ChooseCar.jsp" class="indigo-text">Rent a car</a></li>
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
						<a href="ChooseCar.jsp"
							class="waves-effect waves-light modal-trigger"
							style="margin-left: 5%;">Rent a Car</a>
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
					</div> <!-- 					  <li><a href="logout" class="indigo-text">Logout</a></li> -->
				</li>
			</ul>
		</li>
	</ul>
	
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
	
		<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- Compiled and minified JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<!-- Initializing all the materialize elements -->
	<script type="text/javascript">
         $(document).ready(
         	()=>	{
         		// Sidenav initialization
            	$('.sidenav').sidenav();

         		// Slider initialization and params 
         		$('.slider').slider({
         				indicators: false,
         				height: 450,
         				interval: 3000
         			}
         		);

				//Dropdown initialization
				$('.dropdown-trigger').dropdown();

         		// Modal initialization
         		$('.modal').modal();

         		// Form initialization
         		$('select').formSelect();

         		// $('.datepicker').datepicker();
         		// $('.timepicker').timepicker();
         		$('.modal').modal();
         		 
         		//sidenav collapsible initialization
         		
         		$('#collapsibleBooking').collapsible();
         		$('#collapsibleAccount').collapsible();
         		 
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