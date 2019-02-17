<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="partEdited.jsp" method="post" >
<%
String v="";
int p=0;
Cookie c[]=request.getCookies();
for (Cookie cookie : c) {
	   if (cookie.getName().equals("cook")) {
	     //do something
	     //value can be retrieved using #cookie.getValue()
		    v=cookie.getValue();
		    p=Integer.parseInt(v);
	    }
	  }


//out.println(v);
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/item_master";
String username="root";
String password="root";
String img="";
String nimg="";
String str="select * from part_model where partmodel_id='"+v+"'";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(str);
while(rs.next())
{
	img=rs.getString("image");
}
//out.println("img"+img);
nimg=img.replace('\\', '/');
//out.println("new img:"+nimg);
%>
<img src="<%=nimg%>" width="600" height="300">
</form>
</body>
</html>

