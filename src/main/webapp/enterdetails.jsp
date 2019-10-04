<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<h4>Enter Student Details</h4><br>
<body style="text-align:center">
	<script type="text/javascript">
		
	</script>
	<form onsubmit="enterdetails()">
		<label>Student Name:</label> 
		<input type="text" name="name" id="name" placeholder="Enter Name" required autofocus  onkeyup="validateName()"/><span style="color:red" id="nameError"></span>
		<br />
		 <label>Maths Mark:</label> 
		 <input type="number" name="mark" id="maths" placeholder="Enter mark" required pattern="(?=.*\d)" title="Must contain only numbers" onkeyup="validateMark()"/><span style="color:red" id="markError"></span>
         <br /> 
         <label>Physics Mark:</label>
		<input type="number" name="mark" id="physics" placeholder="Enter mark" required pattern="(?=.*\d)" title="Must contain only numbers" onkeyup="validateMark()"/><span style="color:red" id="markError"></span>
			<br />
		<label>Chemistry Mark:</label> 
		<input type="number" name="mark" id="chemistry" placeholder="Enter mark" required pattern="(?=.*\d)"title="Must contain only numbers" onkeyup="validateMark()"/><span style="color:red" id="markError"></span>
		<br /> 
		<label>Botany Mark:</label>
		<input type="number" name="mark" id="botany" placeholder="Enter mark" required pattern="(?=.*\d)" title="Must contain only numbers" onkeyup="validateMark()"/><span style="color:red" id="markError"></span>
		 <br />
		<label>Zoology Mark:</label> 
		<input type="number" name="mark" id="zoology" placeholder="Enter mark" required pattern="(?=.*\d)" title="Must contain only numbers" onkeyup="validateMark()"/><span style="color:red" id="markError"></span>
			<br /> <br>
			<input type="submit" value="SUBMIT" class="btn btn-success">
			&nbsp; &nbsp;
		<button type="reset" class="btn btn-danger" value="clear">CLEAR	</button>

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

	function validateMark()
	{
	    var password=document.getElementById("num").value;
	    var passwordRegex=/^[0-9]*$/;
	if(passwordRegex.test(password))
	    {
	    document.getElementById("markError").innerHTML="";
	    }
	else
	    {
	    document.getElementById("markError").innerHTML="Number only ";
	    
	    }
	}
		function enterdetails() {

			event.preventDefault();
			var s_name = document.getElementById("name").value;
			var mat = document.getElementById("maths").value;
			var phy = document.getElementById("physics").value;
			var che = document.getElementById("chemistry").value;
			var bot = document.getElementById("botany").value;
			var zoo = document.getElementById("zoology").value;
			var formData = "Student_Name=" + s_name + "&Maths_Mark=" + mat
					+ "&Physics_Mark=" + phy + "&Chemistry_Mark=" + che
					+ "&Botany_Mark=" + bot + "&Zoology_Mark=" + zoo;
			console.log(formData);
			var url = "http://localhost:8080/GradingAPI/EnterDetails?"
					+ formData;
			console.log(url);
			var formData = {};
			$.get(url, function(response) {
				console.log(response);
				alert('Details Entered Successfully');
				window.location.href = "adminpage.jsp";
				//alert(response);
				//alert("Successfully Registered"); //TODO: temporarily you can add alert like this.
			});
		}
	</script>
</body>
</html>