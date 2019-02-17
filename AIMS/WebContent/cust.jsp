<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<link rel="stylesheet"
href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
  <h3 class="w3-bar-item">Menu</h3>
  <a class="w3-bar-item w3-button" href="test.jsp">Make</a>
  <a class="w3-bar-item w3-button" href="model.jsp">Model</a>
  <a class="w3-bar-item w3-button" href="category.jsp">Category</a>
   <a class="w3-bar-item w3-button" href="subcategory.jsp">Subcategory</a>
    <a class="w3-bar-item w3-button" href="part_new.jsp">Part</a>
     <a class="w3-bar-item w3-button" href="note.jsp">Notifications</a>
     <a class="w3-bar-item w3-button" href="cust.jsp">Customers</a>
     <a class="w3-bar-item w3-button" href="custQueries.jsp">Customer Queries</a>
      <a class="w3-bar-item w3-button" href="viewParts.jsp">View Inventory</a>
</div>

<!-- Page Content -->
<div style="margin-left:25%">

<div class="w3-container w3-teal">
  <h1>CUSTOMERS</h1>
</div>

<%
String query="{call new_procedure (?)}";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
CallableStatement c=con.prepareCall(query);
c.registerOutParameter(1, Types.VARCHAR);
ResultSet rs=c.executeQuery();
while(rs.next())
{
	String user=rs.getString(2);
	long ph=rs.getLong(3);
	String add=rs.getString(4);
	out.println("* user:"+user+"<br>"+"  ph:"+ph+"<br>"+"  address:"+add+"<br><br>");
	
}


%>
<!-- <img src="C:\Users\Keerthana\Desktop\carparts.jpg" alt="Car" width="100%" height="425" >
 <iframe src="https://bnmit.pupilpod.in/" height="200" width="300"></iframe>-->


</div>

</html>
