<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
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
<center>
<%
String make_old="";
String mid=request.getParameter("make1");
String editM=request.getParameter("makeE");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
Statement stmt= con.createStatement();
String str="select * from makemaster where makeid='"+mid+"'";
ResultSet rs=stmt.executeQuery(str);

if(mid.equals("none"))
{
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('Select make to be edited.');");
	   out.println("location='test.jsp';");
	   out.println("</script>");
}
if(editM=="")
{
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('enter edited make name');");
	   out.println("location='test.jsp';");
	   out.println("</script>");
}
while(rs.next())
{
	 make_old=rs.getString(2);
}
str="update makemaster set makename='"+editM+"' where makeid='"+mid+"'";
stmt.executeUpdate(str);

String str1="insert into liveupdate(description) values('make-"+make_old+" updated to "+editM+" ')";
stmt.executeUpdate(str1);
%>
<br>
<br>
<center><label><b>MAKE UPDATED FROM <%=make_old %> TO <%=editM %></b></label></center>
<br>
<br>
<form action="test.jsp" method="post">
<input type="submit" value="BACK" class="w3-button w3-black w3-large">
</form>
</center>
</div>

</body>
</html>