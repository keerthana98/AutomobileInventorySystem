<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#grad1 {
    height: 480px;
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
String cat=request.getParameter("cat");


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/item_master","root","root");
Statement stmt=con.createStatement();
String str="insert into categorymaster(categoryname) values('"+cat+"')";
stmt.executeUpdate(str);
con=DriverManager.getConnection("jdbc:mysql://localhost/parts","root","root");
stmt=con.createStatement();
String str1="insert into liveupdate(description) values('category-"+cat+" added')";
stmt.executeUpdate(str1);

%>
<br>
<br>
<center><label><b>NEW MAKE <%=cat %> INSERTED</b></label></center>
<br><br>
<center>
<form action="category.jsp" method="post">
<input type="submit" value="BACK" class="w3-button w3-black w3-large">
</form>
</center>
</div>
</body>
</html>