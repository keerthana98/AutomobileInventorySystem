<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function doChange() 
{
    var x = document.getElementById("model"); 
	  document.getElementById("txtName").value=  x.options[x.selectedIndex].text;
	  
}
</script>
<style>
fieldset {
    margin: 8px;
    width: 600px;
    length:700px;
    position:center;
    border: 1px solid silver;
    padding: 8px;    
    border-radius: 4px;
}
#d {
    background-color: lightgrey;
    width: 500px;
    padding: 25px;
    margin: 25px;
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
    height: 900px;
    background-color: red; /* For browsers that do not support gradients */
    background-image: linear-gradient(grey, coral); /* Standard syntax (must be last) */
}
label{

 left:50px;
  width: 10em;
  margin-right: 1em;
  }
  #home{
  position:absolute; top:3; right:0;left:10px;
     }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Insert title here</title>
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
<legend>MODEL</legend>
<div id="d">
<label><b>ADD MODEL</b></label>
<br>
<br>
<% 
Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/item_master","root","root");
   Statement stmt = conn.createStatement();
    String sql;
   ResultSet resultset =stmt.executeQuery("select * from makemaster") ;
%>
<form action="modelAdded.jsp">
<label for="make">Select make of model to be added</label>
        <select name="make" id="make">
        <option value="none">Select make</option>
        <%  while(resultset.next()){ %>
            <option><%= resultset.getString("makename")%></option>
        <% } 
        %>
        </select>
        <br>
        <br>
        <label for="mod">Enter model to be added</label>
<input type="text" name="mod">
<br>
<br>
<input type="submit" value="Add"/>
</form>
</div>
<div id="d">
<label><b>EDIT MODEL</b></label>
<br>
<br>
<% 
 resultset =stmt.executeQuery("select * from model_master") ;
%>
<form action="modelEdited.jsp" >
<label for="model">Select model to be edited</label>
        <select name="model" id="model" onchange="doChange()">
        <option value="none">Select model</option>
        <%  while(resultset.next()){ %>
            <option value="<%=resultset.getString("model_id") %>"><%=resultset.getString("model_name") %></option>
        <% } 
 
        %>
        </select> 
<br>
<br>
<label>Enter edited model name</label>
<input type="text" id="txtName" name="modelE">
<br>
<br>
<input type="submit" value="Edit">
</form>
</div>
<div id="d">
<label><b>DELETE MODEL</b></label>
<br>
<br>
<form action="modelDeleted.jsp" method="post">
<label for="model1">Select model to be Deleted</label>
<select name="model1" id="model1">
<option value="none">Select model</option>
<%

ResultSet rs= stmt.executeQuery("select * from model_master");
while(rs.next()){
%>
<option value="<%=rs.getString("model_id") %>"><%=rs.getString("model_name") %></option>
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