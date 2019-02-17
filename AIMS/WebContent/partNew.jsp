<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
    <%@page import="java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<% 
String subid=request.getParameter("counttt");

String mid=request.getParameter("name");

//out.print("executed"+mmid);
%>
 <select name="partNadd" required>
         <option value="none">Select part</option>
         <%
         
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
         Statement stmt= con.createStatement();
        ResultSet rs= stmt.executeQuery("Select * from part_model where subcategory_id='"+subid+"'AND model_id='"+mid+"'");
        while(rs.next()){
         %>
       <option value="<%=rs.getString("partmodel_id") %>"><%=rs.getString("partname") %></option>
        <% }
         
       %>
       
</select> 

</body>
</html>