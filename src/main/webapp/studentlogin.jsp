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
	<h3>Welcome to Student Login</h3><br>

	<script type="text/javascript">
		
	</script>
	<form onsubmit="studentlogin()">
		<label>Student Name:</label> 
		<input type="text" name="name" id="name" placeholder="Enter Name" required autofocus onkeyup="validateName()"/><span style="color:red" id="nameError"></span>
		 <br />
		  <label>Register Number:</label>
		<input type="text" name="num" id="num" placeholder="Enter reg_no"required onkeyup="validateReg()"/><span style="color:red" id="regError"></span> 
		<br /> <br>
		<input type="submit" value="LOGIN" class="btn btn-success">
		&nbsp; &nbsp;
		<button type="reset" class="btn btn-danger" value="clear">CLEAR</button>

	</form>

	<script>
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

	function validateReg()
	{
	    var password=document.getElementById("num").value;
	    var passwordRegex=/^[0-9]*$/;
	if(passwordRegex.test(password))
	    {
	    document.getElementById("regError").innerHTML="";
	    }
	else
	    {
	    document.getElementById("regError").innerHTML="Number only ";
	    
	    }
	}
		function studentlogin() {
			//alert('studentlogin');
			event.preventDefault();
			var admin_name = document.getElementById("name").value;
			var pass = document.getElementById("num").value;
			var formData = "name=" + admin_name + "&num=" + pass;
			//console.log(formData);
			var url = "http://localhost:8080/GradingAPI/StudentLogin?" + formData;

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
					window.location.href = "studentpage.jsp";
				}
			});
		}
	</script>
</body>
</html>