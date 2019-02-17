<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
    <%@page import="java.sql.Connection" %>
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
<%
int p=0;
String v="";
Cookie c[]=request.getCookies();
for (Cookie cookie : c) {
	   if (cookie.getName().equals("cook")) {
	     //do something
	     //value can be retrieved using #cookie.getValue()
		    v=cookie.getValue();
		  // out.println(v);
		    p=Integer.parseInt(v);
	    }
	  }



String pname=request.getParameter("partname");
String price=request.getParameter("price");
float priceVal=Float.parseFloat(price);
String quant=request.getParameter("quantity");
int quantVal=Integer.parseInt(quant);
String description=request.getParameter("description");
String loc="";
loc=request.getParameter("newimg");

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
Statement stmt= con.createStatement();
String str="update part_model set partname='"+pname+"' where partmodel_id='"+p+"'";
stmt.executeUpdate(str);
str="update part_model set price='"+priceVal+"'where partmodel_id='"+p+"'";
stmt.executeUpdate(str);
str="update part_model set stock='"+quantVal+"'where partmodel_id='"+p+"'";
stmt.executeUpdate(str);
str="update part_model set description='"+description+"'where partmodel_id='"+p+"'";
stmt.executeUpdate(str);
if(loc=="")
{
	str="select * from part_model where partmodel_id='"+p+"'";
	ResultSet rs=stmt.executeQuery(str);
	while(rs.next())
	{
		loc=rs.getString("image");
	}
	String query = "update part_model set image = ? where partmodel_id = ?";
    PreparedStatement preparedStmt = con.prepareStatement(query);
    preparedStmt.setString  (1, loc);
    preparedStmt.setInt(2, p);

    // execute the java preparedstatement
    preparedStmt.executeUpdate();
}
else{
//str="update part_model set image='"+loc+"'where partmodel_id='"+p+"'";
//stmt.executeUpdate(str);
//str="insert into part_model(image)"+" values('"+loc+"') where partmodel_id='"+p+"'";
//stmt.executeUpdate(str);


//PreparedStatement st=null;
//st=con.prepareStatement("INSERT INTO `parts`.`part_model` (`image`)  VALUES (?) where partmodel_id=?");
//st.setString(1,loc);
//st.setInt(2,p);

//st.executeUpdate();
String query = "update part_model set image = ? where partmodel_id = ?";
      PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setString  (1, loc);
      preparedStmt.setInt(2, p);

      // execute the java preparedstatement
      preparedStmt.executeUpdate();
      
}
String str1="insert into liveupdate(description) values('part-"+pname+" edited')";
stmt.executeUpdate(str1);
%>
<br>
<br>
<center><label><b>PART DETAILS UPDATED</b></label></center>
<br><br>
<center>
<form action="part_new.jsp" method="post">
<input type="submit" value="BACK" class="w3-button w3-black w3-large">
</form>
</center>
</div>
</body>
</html>