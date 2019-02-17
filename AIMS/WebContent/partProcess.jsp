<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    
}
input[type=submit]
{
 background-color: #4CAF50;
 width: auto;
    padding: 10px 18px;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
#grad1 {
    height: 580px;
    background-color: red; /* For browsers that do not support gradients */
    background-image: linear-gradient(grey, coral); /* Standard syntax (must be last) */
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<div id="grad1">
<br>
<br>
<%

String str=request.getParameter("cc");
int val=Integer.parseInt(request.getParameter("q"));
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
float tot=0;

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/item_master";
String username="root";
String password="root";
int quant[]=new int[15];
String im="";
int i=0;
String query="select * from part_model where partmodel_id='"+str+"'";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{
	pid=rs.getInt("partmodel_id");
	im=rs.getString("image");
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
Cookie c=new Cookie("myc",String.valueOf(val));
response.addCookie(c);
Cookie c1=new Cookie("mycook",str);
response.addCookie(c1);
if(val>(stock-1))
{
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('Enter valid Quantity.Refer QUANTITY AVAILABLE');");
	   out.println("location='buy.jsp';");
	   out.println("</script>");
}

tot=price*stock;
int f=stock-val;
//out.println("f:"+f);

}
%>
<center> <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">VIEW BILLING DETAILS</button></center>



<div id="id01" class="modal">
  
  <form class="modal-content animate" action="placeOrder.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="<%=im %>" alt="Avatar" >
    </div>

    <div class="container">
      <label for="pname"><b>PART NAME</b></label>
      <input type="text" value="<%=pname %>" readonly>
     
     <label for="moviename"><b>MAKE</b></label>
      <input type="text" value="<%=makename %>"readonly> 

     
      <label for="modelname"><b>MODEL</b></label>
      <input type="text" value="<%=model_name %>" readonly>
      
      <label for="catname"><b>CATEGORY OF PART</b></label>
      <input type="text" value="<%=cat_name %>"readonly>
      
      <label for="subcatname"><b>SUBCATEGORY OF PART</b></label>
      <input type="text" value="<%=subcat_name %>"readonly>
      
      <label for="quant"><b>NO OF PARTS ORDERED</b></label>
      <input type="text" value="<%=val %>"readonly>
         
      <label for="tot"><b>TOTAL COST</b></label>
      <input type="text" value="<%=tot %>"readonly>
        
      
    </div>

    <div class="container" style="background-color:#f1f1f1">
     <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
     <input type="submit" value="PLACE ORDER" onclick="placeOrder.jsp">
     </div>
    
  </form>
</div>
<br>
<br>
<form action="placeOrder.jsp" method="post">
<center><input type="submit" value="PLACE ORDER" class="w3-button w3-black w3-large"></center>
</form>
<br>
<br>
<form action="buy.jsp" method="post">
<center><input type="submit" value="BACK" class="w3-button w3-black w3-large"></center>
</form>

</div>

</body>
</html>