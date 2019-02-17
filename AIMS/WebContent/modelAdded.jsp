<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
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
<input type="submit" value="HOME" class="w3-button w3-black w3-xlarge">
</div>
</form>
<%
String model=request.getParameter("mod");
String make_name=request.getParameter("make");

ResultSet resultset =null;
int id=1;
final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
final String DB_URL = "jdbc:mysql://localhost/item_master";

 final String USER = "root";
 final String PASS = "root";
 Connection conn = null;
 Statement stmt = null;
 
	 if(make_name.equals("none"))
	 {
	 	out.println("<script type=\"text/javascript\">");
	 	   out.println("alert('Select make');");
	 	   out.println("location='model.jsp';");
	 	   out.println("</script>");
	 }
	 if(model=="")
	 {
	 	out.println("<script type=\"text/javascript\">");
	 	   out.println("alert('Enter model');");
	 	   out.println("location='model.jsp';");
	 	   out.println("</script>");
	 }
 
	 
 
 try{
   
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Connecting to database...");
    conn = DriverManager.getConnection(DB_URL,USER,PASS);
    System.out.println("Creating statement...");
    stmt = conn.createStatement();
    String sql;
     
     sql="select makeid FROM makemaster where makename='"+make_name+"' ";
     
    ResultSet rs = stmt.executeQuery(sql);
    
    while(rs.next()){
   	 id  = rs.getInt("makeid");
   }
    int i=stmt.executeUpdate("insert into model_master(makeid,model_name)values('"+id+"','"+model+"')");
   
 }
 catch(Exception e)
 {
      out.println(e);
 }
 
 String str1="insert into liveupdate(description) values('model-"+model+" added')";
 stmt.executeUpdate(str1);

%>
<br>
<br>
<center><label><b>MODEL <%=model%> ADDED</b></label>
<br>
<br>
<form action="model.jsp" method="post">
<input type="submit" value="BACK" class="w3-button w3-black w3-large">
</form>
</center>
</div>
</body>
</html>