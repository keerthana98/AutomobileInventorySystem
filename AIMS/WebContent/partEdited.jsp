<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
    <%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
img {
    width: 20px;
    height: 20px;
}
#grad1 {
    height: 598px;
    background-color: red; /* For browsers that do not support gradients */
    background-image: linear-gradient(grey, coral); /* Standard syntax (must be last) */
}
 #home{
  position:absolute; top:3; right:0;left:10px;
     }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<div id="grad1">
<form action="menu.jsp" method="post">
<div id="HOME">
<input type="submit" value="home" class="w3-button w3-black w3-xlarge">
</div>
</form>
<%
String pn="",desc="";
int stock=0;
float price=0;
String image=null;
byte[ ] imgData = null ;
int pid=Integer.parseInt(request.getParameter("partN"));
//Cookie c=new Cookie("cook",String.valueOf(pid));
//response.addCookie(c);
Cookie cdd=new Cookie("cook",String.valueOf(pid));
response.addCookie(cdd);


Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
Statement stmt= con.createStatement();
String query="Select * from part_model where partmodel_id='"+pid+"'";
ResultSet rs= stmt.executeQuery(query);
while(rs.next()){
pn=rs.getString(4);
stock=rs.getInt(5);
price=rs.getFloat(6);
desc=rs.getString(7);
image = rs.getString(8);

}

%>
<center>
<form action="partEditUpdated.jsp" method="post">
 Edit Part name :
<input type="text" name="partname" id="p" size="20" value="<%= pn%>"  >
<br>
<br>
Edit Price        :
<input type="text" name="price" id="price" value="<%= price %>">
<br>
<br>
Edit Quantity  :
<input type="text" name="quantity" value="<%= stock %>">
<br>
<br>
Edit Description:
<input type="text" name="description" value="<%= desc %>">
<br>
<br>
Edit Uploaded picture    :
<!--  <input type="button" onclick="location.href='pic.jsp';" value="Go to Google" />-->

<input type="file" name="newimg"><br><br>
<br>
<br>
<input type="submit" value="submit" class="w3-button w3-black w3-large"> 
</form>
<br>
<br>
<form method="post" target="_blank" action="pic.jsp">
<input type="submit" value="click to see existing image" class="w3-button w3-black w3-large">
</form>
</center>
</div>
</body>
</html>