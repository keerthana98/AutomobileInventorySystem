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
String model=" ";
String subcategory=" ";
String loc="";

String modelid=request.getParameter("model");
String subcategoryid=request.getParameter("subcat");
//out.println("modelid:"+modelid);
//out.println("sub id:"+subcategoryid);
//String pname=request.getParameter("partname");
String pname="p123";
String price=request.getParameter("price");
String quant=request.getParameter("quantity");
String description=request.getParameter("description");
loc=request.getParameter("myimg");


//if(loc=="")
//{
	//out.println("<script type=\"text/javascript\">");
	  // out.println("alert('Select image');");
	   //out.println("location='part_new.jsp';");
	   //out.println("</script>");
//}

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
Statement stmt= con.createStatement();
ResultSet rs= stmt.executeQuery("Select model_name from model_master where model_id='"+modelid+"'");
while(rs.next()){
	 model=rs.getString("model_name");
}

rs=stmt.executeQuery("Select subcategoryname from subcategorymaster where subcategoryid='"+subcategoryid+"'");
while(rs.next()){
	 subcategory=rs.getString("subcategoryname");
}



PreparedStatement st=null;

//conn.createStatement();

st=con.prepareStatement("INSERT INTO `item_master`.`part_model` ( `subcategory_id`, `model_id`, `partname`, `stock`, `price`, `description`,`image`) VALUES (?,?,?,?,?,?,?)"); 
st.setString(1,subcategoryid);
st.setString(2,modelid);
st.setString(3,pname);
st.setString(4,quant);
st.setString(5,price);
st.setString(6,description);
st.setString(7,loc);

st.executeUpdate();




String str1="insert into liveupdate(description) values('part-"+pname+" added')";
stmt.executeUpdate(str1);

%>
<br>
<br>
<center><label><b>PART p123 ADDED</b></label>
<br>
<br>
<form action="part_new.jsp" method="post">
<input type="submit" value="back" class="w3-button w3-black w3-large">
</form>
</center>
</div>
</body>
</html>