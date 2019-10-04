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
<h3>Welcome To Admin Registration</h3><br>

<script type="text/javascript">

</script>

<form onsubmit="register()">
<label>Admin Name:</label>
<input type="text" name="name" id="name" placeholder="Enter name"  required autofocus  onkeyup="validateName()"/><span style="color:red" id="nameError"></span>
<br/>

<label>Password:</label>
<input type="password" name="password" id="password" placeholder="Enter Password"  required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" onkeyup="validatePassword()"/><span style="color:red" id="passwordError"></span>
<br/>
<input type="checkbox" onclick="myFunction()">Show Password
<br><br>		 

<input type = "submit" value = "REGISTER" class="btn btn-success" >
&nbsp; &nbsp;
<button type="reset" class="btn btn-danger" value="clear">CLEAR</button><br/><br>
<a href="adminlogin.jsp">Existing User</a>
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
function register()
{
    event.preventDefault();     
  var admin_name = document.getElementById("name").value;
  var pass=document.getElementById("password").value;
  var formData = "Admin_Name=" + admin_name+ "&Password="+pass;
  console.log(formData);
   var url="http://localhost:8080/GradingAPI/Register?"+ formData;
   console.log(url);
   var formData = {};
   $.get(url, function(response){
	   console.log(response);
	   alert('Registration Successful');
	   window.location.href = "adminlogin.jsp";
   });
}
</script>

</body>
</html>