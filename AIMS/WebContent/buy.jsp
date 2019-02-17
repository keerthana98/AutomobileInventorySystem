<!DOCTYPE html>
 <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
<html>
<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
#grad1 {
    height: 580px;
    background-color: red; /* For browsers that do not support gradients */
    background-image: linear-gradient(grey, coral); /* Standard syntax (must be last) */
}
</style>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<div id="grad1">
<form action="partProcess.jsp" method="post">
<h2>PARTS AVAILABLE</h2>

<table>
  <tr>
    <th>PART</th>
    <th>FOR MAKE</th>
    <th>FOR MODEL</th>
    <th>PART CATEGORY</th>
    <th>PART SUBCATEGORY</th>
    <th>QUANTITY AVAILABLE</th>
    <th>PRICE PER UNIT</th>
    <th>DESCRIPTION</th>
  </tr>
  <%
  String pname="";
  float price=0;
  int stock=0;
  String desc="";
  int mod_id=0;
  int sub_id=0;
  String makename="";
  String model_name="";
  int mid=0;
  int cat_id=0;
  String subcat_name="";
  String cat_name="";
  int pid=0;
  int f=0;
  
  
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/item_master";
String username="root";
String password="root";
String query="select * from part_model";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{
	pid=rs.getInt("partmodel_id");
	pname=rs.getString("partname");
	stock=rs.getInt("stock");
	price=rs.getFloat("price");
	desc=rs.getString("description");
	 mod_id=rs.getInt("model_id");
	 sub_id=rs.getInt("subcategory_id");


query="select * from model_master where model_id='"+mod_id+"'";
stmt=conn.createStatement();
ResultSet rs1=stmt.executeQuery(query);
while(rs1.next())
{
	model_name=rs1.getString(3);
	 mid=rs1.getInt(2);
}
query="select * from makemaster where makeid='"+mid+"'";
stmt=conn.createStatement();
ResultSet rs6=stmt.executeQuery(query);
while(rs6.next())
{
	 makename=rs6.getString("makename");
}

query="select * from subcategorymaster where subcategoryid='"+sub_id+"'";
stmt=conn.createStatement();
ResultSet rs3=stmt.executeQuery(query);
while(rs3.next())
{
	subcat_name=rs3.getString(2);
	 cat_id=rs3.getInt(3);
}
query="select * from categorymaster where categoryid='"+cat_id+"'";
stmt=conn.createStatement();
ResultSet rs5=stmt.executeQuery(query);
while(rs5.next())
{
	 cat_name=rs5.getString("categoryname");
}
if(stock==0)
	 f=0;
else
	f=(stock-1);
%>
    <tr><td><%=pname %></td>
    <td><%=makename %></td>
    <td><%=model_name %></td>
    <td><%=cat_name %></td>
    <td><%=subcat_name %></td>
    <td><%=f %></td>
    	
    
   
    
    <td><%=price %></td>
    <td><%=desc %></td>
    <td><input type="radio" name="cc" value="<%=pid %>" required></td>
   
    </tr>
<%} %>
</table>
<br>
<center>

<label>Enter quantity required:</label>
<input type="number" value="0" name="q">
<br>
<br>
<input type="submit" value="SELECT" class="w3-button w3-black w3-large">
</center>
</form>
<br>
<br>
<form action="menu_jsp.jsp" method="post">
<center><input type="submit" value="BACK" class="w3-button w3-black w3-large"></center>
</form>

</div>
</body>
</html>
