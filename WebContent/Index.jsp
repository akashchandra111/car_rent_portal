<!-- [Author: Akash Chandra] -->

<html>
	<head>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!-- Compiled and minified CSS -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
      <title>RentoCar: Rent a car</title>
      <style media="screen">
         .card-style{
         	width: 99.5%;
         }
      </style>
	  <script type="text/javascript" href="js/func.js"></script>
   </head>
   <body class="indigo lighten-5">
	  
      <!-- Navigation -->
      <div class="navbar-fixed">
         <nav class="nav-wrapper indigo darken-3">
            <div class="container">
               <a class="sidenav-trigger" href="#" data-target="menu-link">
               <i class="material-icons">menu</i>
               </a>
               <div class="brand-logo">
                  <a href="#">
                  RentoCar
                  </a>
               </div>
               <ul class="right hide-on-med-and-down">
                  <li>
                     <a href="#login" class="waves-effect waves-dark modal-trigger">Login</a>
                  </li>
                  <li>
                     <a href="#register" class="waves-effect waves-dark modal-trigger">Register</a>
                  </li>
                  <li>
                     <a href="#about" class="waves-effect waves-dark modal-trigger">About Us</a>
                  </li>
               </ul>
            </div>
         </nav>
      </div>
      <!-- Side Navigation for mobile devices -->
      <ul class="sidenav" id="menu-link">
         <li>
            <a href="#login" class="waves-effect waves-dark modal-trigger">Login</a>
         </li>
         <li>
            <a href="#register" class="waves-effect waves-dark modal-trigger">Register</a>
         </li>
         <li>
            <a href="#about">About Us</a>
         </li>
      </ul>
      <!-- Slider to show car types -->
      <div style="margin-top: 10px; padding-left: 10px; padding-right: 10px;">
         <div class="slider">
            <ul class="slides">
               <li>
                  <img src="images/mini_car.jpg">
                  <div class="caption center-align">
                     <h3>Mini Cars</h3>
                     <h5 class="light grey-text text-lighten-3">Cheap and affordable</h5>
                  </div>
               </li>
               <li>
                  <img src="images/micro_car.jpg">
                  <div class="caption left-align">
                     <h3>Micro Cars</h3>
                     <h5 class="light grey-text text-lighten-3">Cheap, affordable and space you can get</h5>
                  </div>
               </li>
               <li>
                  <img src="images/deluxe_car.jpg">
                  <div class="caption right-align">
                     <h3>Deluxe Cars</h3>
                     <h5 class="light grey-text text-lighten-3">Expensive but comfortable</h5>
                  </div>
               </li>
               <li>
                  <img src="images/suv_car.jpg">
                  <div class="caption center-align">
                     <h3>SUV Cars</h3>
                     <h5 class="light grey-text text-lighten-3">Faster, expensive ,comfortable and for those who care for looks</h5>
                  </div>
               </li>
            </ul>
         </div>
      </div>
      <!-- Login modal -->
      <div class="modal one" id="login">
         <form class="form" action="login" method="post">
            <div class="modal-content">
               <div class="">
                  <h4>Login</h4>
               </div>
               <div class="input-field">
                  <input type="text" name="username" id="username" class="validate" required>
                  <label for="username">Username/ Email/ Phone</label>
               </div>
               <div class="input-field">
                  <input type="password" name="password" id="password" class="validate" required>
                  <label for="password">Password</label>
               </div>
               <div id="logindiv" style="color:red;display:none">
               Login Failed
               </div>
            </div>
            <div class="modal-footer">
               <button type="submit" class="btn indigo darken-1 grey-text text-lighten-2 waves-effect waves-dark modal-close" id="loginbutton" name="submit">
               Login
               <i class="material-icons right">send</i>
               </button>
            </div>
         </form>
      </div>
      <!-- Register modal -->
      <div class="modal" id="register">
         <form class="form" action="register" method="post">
            <div class="modal-content">
               <div class="">
                  <h4>Register with Us</h4>
               </div>
               <div class="input-field">
                  <input type="text" name="firstname" id="firstname" class="validate" required>
                  <label for="firstname">First name</label>
               </div>
               <div class="input-field">
                  <input type="text" name="lastname" id="lastname" class="validate" required>
                  <label for="lastname">Last name</label>
               </div>
               <div class="input-field">
                  <input type="text" name="mobileno" id="mobileno" class="validate" required>
                  <label for="mobileno">Mobile number</label>
               </div>
               <div class="row">
                  <div class="input-field col s4">
                     <select class="input-field" name="idtype">
                        <option value="" selected disabled>Verify with</option>
                        <option value="aadhar">Aadhar</option>
                        <option value="pan">PAN</option>
                        <option value="passport">Passport</option>
                     </select>
                  </div>
                  <div class="input-field col s8">
                     <input type="text" name="verification_id" id="verification_id" class="validate" required>
                     <label for="verification_id">UID number</label>
                  </div>
               </div>
               <div class="input-field">
                  <input type="text" name="driving_id" id="driving_id" class="validate" required>
                  <label for="username">Driving License Number</label>
               </div>
               <div class="input-field">
                  <input type="text" name="username" id="username" class="validate" required>
                  <label for="username">Username</label>
               </div>
               <div class="input-field">
                  <input type="text" name="email" id="email" class="validate" required>
                  <label for="username">Email</label>
               </div>
               <div class="input-field">
                  <input type="password" name="password" id="password" class="validate" required>
                  <label for="password">Password</label>
               </div>
               <div class="input-field">
                  <input type="password" name="cpassword" id="cpassword" class="validate" required>
                  <label for="cpassword">Confirm Password</label>
               </div>
            </div>
            <div class="modal-footer">
               <button type="submit" class="btn indigo darken-1 grey-text text-lighten-2 waves-effect waves-dark modal-close" name="submit">
               Register
               <i class="material-icons right">send</i>
               </button>
            </div>
         </form>
      </div>
      <!-- Cards [Author: Dheeraj Joshi]-->
      <div class="row">
         <div class="col s12 m6 l3">
            <div class="card amber lighten-5 z-depth-3 card-style">
               <div class="card-image waves-effect waves-block waves-light">
                  <img class="activator" src="images/mini_car.jpg">
               </div>
               <div class="card-content">
                  <span class="card-title activator grey-text text-darken-4">Mini Cars<i class="material-icons right">more_vert</i></span>
                  <p><a href="#">See all Mini cars</a></p>
               </div>
               <div class="card-reveal indigo lighten-3">
                  <span class="card-title grey-text text-darken-4">Mini Cars<i class="material-icons right">close</i></span>
                  <p>Affordable, distance and power in a mini package. Good for long distance travel purposes.</p>
               </div>
            </div>
         </div>
         <div class="col s12 m6 l3">
            <div class="card amber lighten-5 z-depth-3">
               <div class="card-image waves-effect waves-block waves-light">
                  <img class="activator" src="images/micro_car.jpg">
               </div>
               <div class="card-content">
                  <span class="card-title activator grey-text text-darken-4">Micro Cars<i class="material-icons right">more_vert</i></span>
                  <p><a href="#">See all Micro cars</a></p>
               </div>
               <div class="card-reveal indigo lighten-3">
                  <span class="card-title grey-text text-darken-4">Micro Cars<i class="material-icons right">close</i></span>
                  <p>Affordable, distance with more power and more seats. Good for long distance travel purpose and extra comfortable.</p>
               </div>
            </div>
         </div>
         <div class="col s12 m6 l3">
            <div class="card amber lighten-5 z-depth-3">
               <div class="card-image waves-effect waves-block waves-light">
                  <img class="activator" src="images/deluxe_car.jpg">
               </div>
               <div class="card-content">
                  <span class="card-title activator grey-text text-darken-4">Deluxe Cars<i class="material-icons right">more_vert</i></span>
                  <p><a href="#">See all Deluxe cars</a></p>
               </div>
               <div class="card-reveal indigo lighten-3">
                  <span class="card-title grey-text text-darken-4">Deluxe Cars<i class="material-icons right">close</i></span>
                  <p>Expensive, classy cars for those who prefer on looks. Good for short distance rides.</p>
               </div>
            </div>
         </div>
         <div class="col s12 m6 l3">
            <div class="card amber lighten-5 z-depth-3">
               <div class="card-image waves-effect waves-block waves-light">
                  <img class="activator" src="images/suv_car.jpg">
               </div>
               <div class="card-content">
                  <span class="card-title activator grey-text text-darken-4">SUV Cars<i class="material-icons right">more_vert</i></span>
                  <p><a href="#">See all SUV cars</a></p>
               </div>
               <div class="card-reveal indigo lighten-3">
                  <span class="card-title grey-text text-darken-4">SUV Cars<i class="material-icons right">close</i></span>
                  <p>For those who likes to ride power. When you need space, power and comfort at one place.</p>
               </div>
            </div>
         </div>
      </div>
      <footer>
         <div class="footer-copyright indigo lighten-4" style="padding-top: 20px; padding-bottom: 1px;">
            <div class="container">
               <div class="row">
                  <div class="col">
                     &copy RentoCar 2018-2019
                  </div>
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
         	()=>{
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
          
         		
         		
//          		$("#loginbutton").on("submit", function(){
                 
//          			e.preventDefault();
//          		    $.ajax({url: "login", success: function(result){
//          		      if(result=="failure"){
         		    	
//          		      }
//          		    }});
//     })
         		

	 $("#loginbutton").click(function(e){
          e.preventDefault();
          $('#login').show();
        $.ajax({type: "POST",
                url: "login",
                data: { username: $("#username").val(), password: $("#password").val() },
                success:function(result){
         if(result=="failure"){
        	 $('#logindiv').show();
        	 $('#login').modal('open');
         }
          else if(result=="admin_success")	{
        	  $('#logindiv').hide();
        	  window.location.href = "AdminPanel.jsp";
         }
         else if(result=="user_success"){
        	 $('#logindiv').hide();
        	 window.location.href = "User.jsp";
         }
        }});
      });
         	}
         	
         	
         	
         );
     
      </script>
   </body>
</html>
