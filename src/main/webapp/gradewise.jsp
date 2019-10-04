<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<script>
function validateGrade()
{
    var name=document.getElementById("grade").value;
    var nameRegex=/^[A-C,Ua-c,u]*$/;
    if(nameRegex.test(name))
    {
    document.getElementById("gradeError").innerHTML="";
    }
else
    {
    document.getElementById("gradeError").innerHTML="Invalid input";
    
    }
}
function mainmenu(){
	event.preventDefault();
		var grade = document.getElementById("grade").value;
	window.location.href = "gradewisetable.jsp?grade=" + grade;
	}
	</script>
<body style="text-align:center">
<jsp:include page="header.jsp"></jsp:include>
<form onsubmit="mainmenu()">
<label>Enter the Grade:</label>
<input type="text" name="grade" id="grade" placeholder="Enter grade"  required autofocus onkeyup="validateGrade()"/><span style="color:red" id="gradeError"></span>
<br/><br>

<button type="submit" class="btn btn-success" value="clear">SUBMIT </button>
&nbsp; &nbsp;
<button type="submit" class="btn btn-danger" value="clear">CLEAR </button>
</form>

</body>
</html>