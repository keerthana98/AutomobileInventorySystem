<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link href='https://fonts.googleapis.com/css?family=Lato:300,400|Montserrat:700' rel='stylesheet' type='text/css'>
	<style>
		@import url(//cdnjs.cloudflare.com/ajax/libs/normalize/3.0.1/normalize.min.css);
		@import url(//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css);
	</style>
	<link rel="stylesheet" href="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/default_thank_you.css">
	<script src="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/jquery-1.9.1.min.js"></script>
	<script src="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/html5shiv.js"></script>
</head>
<body>
<%
int req_stock=0;
int stock=0;
int pid=0;
int f=0;
Cookie c[]=request.getCookies();
req_stock=Integer.parseInt(c[0].getValue());
pid=Integer.parseInt(c[1].getValue());
String pname="";

//out.println("pid:"+pid);
//out.println("req stock:"+req_stock);
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/item_master";
String username="root";
String password="root";
Connection conn=DriverManager.getConnection(url,username,password);
String query="select * from part_model where partmodel_id='"+pid+"'";

Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
		{
	       pname=rs.getString(4);
	       stock=rs.getInt(5);
		}


f=stock-req_stock;
//out.println("f:"+f);


try{
query="update part_model set stock='"+f+"' where partmodel_id='"+pid+"'";
stmt.executeUpdate(query);

}
catch(Exception e)
{
	
		query="update part_model set stock=0 where partmodel_id='"+pid+"'";
		stmt.executeUpdate(query);

		
	//out.println("<script type=\"text/javascript\">");
	 //out.println("location='buy.jsp';");
	  // out.println("alert('Requested Stock Unavailable. Will be replenished shortly.');");
	  // out.println("</script>");
	   query="insert into notification(note) values('Stock of PART NAME:"+pname+" has to be replenished')";
		stmt.executeUpdate(query);
}

%>
<header class="site-header" id="header">
		<h1 class="site-header__title" data-lead-id="site-header-title">THANK YOU!</h1>
	</header>

	<div class="main-content">
		<i class="fa fa-check main-content__checkmark" id="checkmark"></i>
		<p class="main-content__body" data-lead-id="main-content-body">Your Order has been Confirmed</p>
		<p>Your Order Will Be Delivered In 3-4 Working Days.Pay On Delivery.</p>
	</div>
</body>
</html>