<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
 <script>
function doChange() 
{
    var x = document.getElementById("cat2"); 
	  document.getElementById("txtName").value=  x.options[x.selectedIndex].text;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Insert title here</title>
<style>
#d {
    background-color: lightgrey;
    width: 500px;
    padding: 25px;
    margin: 25px;
}
#home{
  position:absolute; top:3; right:0;left:10px;
     }
fieldset {
    margin: 8px;
    width: 600px;
    length:700px;
    position:center;
    border: 1px solid silver;
    padding: 8px;    
    border-radius: 4px;
}
legend {
    padding: 2px;   
    font-style: italic 
}
a {
display: block;
  width: 80%;
  
}
#grad1 {
    height: 800px;
    background-color: red; /* For browsers that do not support gradients */
    background-image: linear-gradient(grey, coral); /* Standard syntax (must be last) */
}
label{

 left:50px;
  width: 10em;
  margin-right: 1em;
  }
</style>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<div id="grad1">
<br>
<form action="menu.jsp" method="post">

<div id="home">
<input type="submit" value="home" class="w3-button w3-black w3-xlarge">
</div>
</form>

<center>
<fieldset>
<legend>CATEGORY</legend>
<div id="d">
<label><b>ADD CATEGORY</b></label>
<br><br>
<form action="categoryInsert.jsp" method="post">
<center>
<label>Enter Category</label>
<input type="text" name="cat" id="cat" required>
<br>
<br>
<input type="submit" value="Add">
</center>
</form>
</div>

<div id="d">
<label><b>EDIT CATEGORY</b></label>
<br><br>
<form action="categoryEdited.jsp" method="post">
<label for="cat2">Select Category to be edited </label>
<select name="cat2" id="cat2" onchange="doChange()">
<option value="none">Select Category</option>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
Statement stmt= con.createStatement();
ResultSet rs= stmt.executeQuery("select * from categorymaster");
while(rs.next()){
%>
<option value="<%=rs.getString("categoryid") %>"><%=rs.getString("categoryname") %></option>
<%
}
%>
</select> 
<br>
<br>
<label>Enter edited category name</label>
<input type="text" id="txtName" name="catE">
<br><br>
<input type="submit" value="Edit">
</form>
</div>

<div id="d">
<label><b>DELETE CATEGORY</b></label>
<br><br>
<form action="catDeleted.jsp" method="post">
<label for="cat">Select category to be Deleted</label>
<select name="cat" id="cat">
<option value="none">Select Category</option>
<%

rs= stmt.executeQuery("select * from categorymaster");
while(rs.next()){
%>
<option value="<%=rs.getString("categoryid") %>"><%=rs.getString("categoryname") %></option>
<%
}
%>
</select> 
<br>
<br>
<input type="submit" value="Delete">
</form>
</div>
</fieldset>
</center>
</div>
</body>
</html>