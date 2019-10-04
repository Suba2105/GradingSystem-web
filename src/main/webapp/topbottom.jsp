<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
function topbottom(){
  var url = "http://localhost:8080/GradingAPI/TopBottomList?";
  console.log(url);
 $.getJSON(url, function(response){
       var books = response;
  document.getElementById("tbody").innerHTML = "";
  var content = "";
  var i = 0;
  for(let us of books){
      console.log(books);
      content += "<tr>";
      content += "<td>" + ++i + "</td>";
      content += "<td>" + us.Student_Name + "</td>";
      content += "<td>" + us.Register_Number + "</td>";
      content += "<td>" + us.Grade + "</td>";
      content += "</tr>";
  }
  console.log(content);
  document.getElementById("tbody").innerHTML =  content;
});
}
</script>
</head>
<body style="text-align:center">
   <jsp:include page="header.jsp"></jsp:include>
 
   <form>
       <div class="container-fluid">
           <div class="row">
               <div class="col">
                   <h4>Overall Student Result</h4><br>
                   <table border="1" class="table table-condensed" id="tbl">
                       <thead>
                           <tr>
                           <th>S.no</th>
                               <th>Student_Name </th>
                               <th>Register_Number</th>
                               <th>Grade</th>
                           </tr>
                       </thead>
                       <tbody id="tbody">
                       </tbody>
                   </table>
               </div>
           </div>
       </div>
       <script>
       topbottom();
</script>
   </form>
   <a href="adminpage.jsp">BACK</a>&nbsp; &nbsp; <a href="logout.jsp">LOGOUT</a>
</body>
</html>