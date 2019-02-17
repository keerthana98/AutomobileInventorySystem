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
String user=request.getParameter("user");
String pass=request.getParameter("pass");
	String query="select id from register where email='"+user+"' and password='"+pass+"'";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(query);
	if(rs.next())
	{
		if(user.equals("admin198@gmail.com"))
		  response.sendRedirect("menu.jsp");
		else
			response.sendRedirect("menu_jsp.jsp");
			
	}
	else
	{
		out.println("<script type=\"text/javascript\">");
		   out.println("alert('User or password incorrect');");
		   out.println("location='homePage.html';");
		   out.println("</script>");
	}
	
%>


</body>
</html>