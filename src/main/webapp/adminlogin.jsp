<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body style="text-align:center">
	<jsp:include page="header.jsp"></jsp:include>
	<h3>Welcome to Admin Login</h3><br>

	<script type="text/javascript">
		
	</script>
	<form onsubmit="adminlogin()">
		<label>Admin Name:</label>
		 <input type="text" name="name" id="name" placeholder="Enter name" required autofocus onkeyup="validateName()"/><span style="color:red" id="nameError"></span> 
		 <br />
		  <label>Password:</label>
		<input type="password"  name="password" id="password" placeholder="Enter Password" required onkeyup="validatePassword()"/><span style="color:red" id="passwordError"></span>
		 <br >
		 <input type="checkbox" onclick="myFunction()">Show Password
		 <br><br>	 
		 
		  <input type="submit" value="LOGIN" class="btn btn-success">
		  &nbsp; &nbsp;  
		<button type="reset" class="btn btn-danger" value="clear">CLEAR</button>
	
	</form>
	

	<script>
	function myFunction() {
		  var x = document.getElementById("password");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		}
	function validateName()
	{
	    var name=document.getElementById("name").value;
	    var nameRegex=/^[A-Za-z]*$/;
	    if(nameRegex.test(name))
	    {
	    document.getElementById("nameError").innerHTML="";
	    }
	else
	    {
	    document.getElementById("nameError").innerHTML="Characters only";
	    
	    }
	}

	function validatePassword()
	{
	    var password=document.getElementById("password").value;
	    var passwordRegex=/^[A-Za-z0-9]*$/;
	if(passwordRegex.test(password))
	    {
	    document.getElementById("passwordError").innerHTML="";
	    }
	else
	    {
	    document.getElementById("passwordError").innerHTML="Alpha Numeric only ";
	    
	    }
	}
		function adminlogin() {
			//alert('adminlogin');
			event.preventDefault();
			var admin_name = document.getElementById("name").value;
			var pass = document.getElementById("password").value;
			var formData = "name=" + admin_name + "&password=" + pass;
			//console.log(formData);
			var url = "http://localhost:8080/GradingAPI/AdminLogin?" + formData;

			console.log(url);
			var formData = {};
			$.get(url, function(response) {
			console.log(response);
			console.log(response.errorMessage);
			var msg = JSON.parse(response);
			//alert(msg);

				if ( msg.errorMessage !=null) {
					alert("Invalid Username/Password");
				} else {
					alert("Login Successful");
					window.location.href = "adminpage.jsp";
				}
			});
		}
	</script>
</body>
</html>