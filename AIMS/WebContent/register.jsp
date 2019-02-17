<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String pass=request.getParameter("psw");
String add=request.getParameter("add");
long ph=Long.parseLong(request.getParameter("ph"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
Statement stmt=con.createStatement();
String str="insert into register(email,phone,address,password) values('"+email+"','"+ph+"','"+add+"','"+pass+"')";
stmt.executeUpdate(str);
String str1="insert into notification(note) values('new user with email-"+email+" added')";
stmt.executeUpdate(str1);
response.sendRedirect("menu_jsp.jsp");
%>
</body>
</html>