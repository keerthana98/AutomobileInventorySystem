<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
		@import url(//cdnjs.cloudflare.com/ajax/libs/normalize/3.0.1/normalize.min.css);
		@import url(//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css);
	</style>
	<link rel="stylesheet" href="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/default_thank_you.css">
	<script src="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/jquery-1.9.1.min.js"></script>
	<script src="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/html5shiv.js"></script>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String subject=request.getParameter("subject");
String text=request.getParameter("text");

String query="insert into notification(note) values('customer with Name:"+name+", Email: "+email+" has a query.Subject:"+subject+", Query:"+text+"')";
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/item_master","root","root");
Statement stmt=conn.createStatement();
stmt.executeUpdate(query);

%>
<header class="site-header" id="header">
		<h1 class="site-header__title" data-lead-id="site-header-title">THANK YOU!</h1>
	</header>

	<div class="main-content">
		<i class="fa fa-check main-content__checkmark" id="checkmark"></i>
		
		<p>We'll get back to your query shortly.</p>
	</div>
<br>
<br>
<form action="menu_jsp.jsp" method="post">
<center><input type="submit" value="BACK" class="w3-button w3-black w3-large"></center>
</form>
</body>
</html>