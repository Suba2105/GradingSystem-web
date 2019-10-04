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
function validateSubject()
{
    var name=document.getElementById("subject").value;
    var nameRegex=/^[Maths,Physics,Chemistry,Botany,Zoology]*$/;
    if(nameRegex.test(name))
    {
    document.getElementById("subjectError").innerHTML="";
    }
else
    {
    document.getElementById("subjectError").innerHTML="Invalid input";
    
    }
}
function mainmenu(){
	event.preventDefault();
		var subject = document.getElementById("subject").value;
	window.location.href = "subjectwisetable.jsp?subject=" + subject;
	}
	</script>
<body style="text-align:center">
<jsp:include page="header.jsp"></jsp:include>
<form onsubmit="mainmenu()">
<label>Enter the Subject:</label>
<input type="text" name="subject" id="subject" placeholder="Enter subject"  required autofocus onkeyup="validateSubject()"/><span style="color:red" id="subjectError"></span>
<br/><br>

<button type="submit" class="btn btn-success" value="clear">SUBMIT </button>
&nbsp; &nbsp;
<button type="submit" class="btn btn-danger" value="clear">CLEAR </button>
</form>

</body>
</html>