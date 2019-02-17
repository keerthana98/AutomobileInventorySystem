<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Insert title here</title>

  <script language="javascript" type="text/javascript">
       var xmlHttp;
       
 	  var mnew="";
       var cnew="";
      function showModel(str){
    	  if(typeof XMLHttpRequest !=="undefined"){
    		  xmlHttp = new XMLHttpRequest();
    	  } else if(window.ActiveXObject){
    			  xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
    	  }  
    		  if(xmlHttp === null)
    			  {
    			  alert("browser does not support XMLHTTP  request");
    			  return;
    			  }
    		  var url="partsService.jsp";
    		  url +="?count=" + str;
    		  xmlHttp.onreadystatechange = modelChange;
    		  xmlHttp.open("GET",url,true);
    		  xmlHttp.send(null);
    	  }
    	  
    	  function modelChange(){
    		  if(xmlHttp.readyState === 4|| xmlHttp.readyState === "complete"){
    			  document.getElementById("model").innerHTML = xmlHttp.responseText;
    			  
    		  }
    	  }    
    	  
    	  function showSubcat(str){
        	  if(typeof XMLHttpRequest !=="undefined"){
        		  xmlHttp = new XMLHttpRequest();
        	  } else if(window.ActiveXObject){
        			  xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
        	  }  
        		  if(xmlHttp === null)
        			  {
        			  alert("browser does not support XMLHTTP  request");
        			  return;
        			  }
        		  var url="subcat.jsp";
        		  url +="?countt=" + str;
        		  xmlHttp.onreadystatechange =subcatChange;
        		  xmlHttp.open("GET",url,true);
        		  xmlHttp.send(null);
        	  }
    	  function subcatChange(){
    		  if(xmlHttp.readyState === 4|| xmlHttp.readyState === "complete"){
    			  document.getElementById("subcat").innerHTML = xmlHttp.responseText;
    			  
    		  }
    	  }    
    	
         function showModelNew(str){
       	  if(typeof XMLHttpRequest !=="undefined"){
       		  xmlHttp = new XMLHttpRequest();
       	  } else if(window.ActiveXObject){
       			  xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
       	  }  
       		  if(xmlHttp === null)
       			  {
       			  alert("browser does not support XMLHTTP  request");
       			  return;
       			  }
       		  var url="partsServiceNew.jsp";
       		  url +="?count=" + str;
       		  xmlHttp.onreadystatechange = modelChangeNew;
       		  xmlHttp.open("GET",url,true);
       		  xmlHttp.send(null);
       	  }
       	  
       	  function modelChangeNew(){
       		  if(xmlHttp.readyState === 4|| xmlHttp.readyState === "complete"){
       			  document.getElementById("modelN").innerHTML = xmlHttp.responseText;
       			  
       		  }
       	  }    
       	  
       	  function saveModelNew(str)
       	  {
       		  mnew=str;
       	  }
       	  
       	
       	  function showSubcatNew(str){
       		  
           	  if(typeof XMLHttpRequest !=="undefined"){
           		  xmlHttp = new XMLHttpRequest();
           	  } else if(window.ActiveXObject){
           			  xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
           	  }  
           		  if(xmlHttp === null)
           			  {
           			  alert("browser does not support XMLHTTP  request");
           			  return;
           			  }
           		  var url="subcatNew.jsp";
           		  url +="?countt=" + str;
           		  xmlHttp.onreadystatechange =subcatChangeNew;
           		  xmlHttp.open("GET",url,true);
           		  xmlHttp.send(null);
           	  }
       	  function subcatChangeNew(){
       		  if(xmlHttp.readyState === 4|| xmlHttp.readyState === "complete"){
       			  document.getElementById("subcatN").innerHTML = xmlHttp.responseText;
       			  
       		  }
       	  }    
       	  
       	  
       	  function showPart(str){
       		  cnew=str;
           	  if(typeof XMLHttpRequest !=="undefined"){
           		  xmlHttp = new XMLHttpRequest();
           	  } else if(window.ActiveXObject){
           			  xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
           	  }  
           		  if(xmlHttp === null)
           			  {
           			  alert("browser does not support XMLHTTP  request");
           			  return;
           			  }
           		  var url="part.jsp";
           		  url +="?counttt=" + str+ "&name="+mnew ;
           		  
           		  xmlHttp.onreadystatechange =partChange;
           		  xmlHttp.open("GET",url,true);
           		  xmlHttp.send(null);
           	  }
       	  function partChange(){
       		  if(xmlHttp.readyState === 4|| xmlHttp.readyState === "complete"){
       			  
       			  document.getElementById("partN").innerHTML = xmlHttp.responseText;
       			  
       		  }
       	  }    
       	  
       	 
       	
    	 
      </script>
      <style>
fieldset {
    margin: 8px;
    width: 600px;
    length:700px;
    position:center;
    border: 1px solid silver;
    padding: 8px;    
    border-radius: 4px;
}
#d {
    background-color: lightgrey;
    width: 500px;
    padding: 25px;
    margin: 25px;
}
legend {
    padding: 2px;   
    font-style: italic 
}
a {
display: block;
  width: 80%;
  
}
#grad1 {
    height: 1300px;
    background-color: red; /* For browsers that do not support gradients */
    background-image: linear-gradient(grey, coral); /* Standard syntax (must be last) */
}
label{

 left:50px;
  width: 10em;
  margin-right: 1em;
  }
  #home{
  position:absolute; top:3; right:0;left:10px;
     }
     table {
    border-collapse: collapse;
}
td {
    height: 30px;
    vertical-align: center;
}
</style>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<form action="menu.jsp" method="post">
<div id="home">
<input type="submit" value="home" class="w3-button w3-black w3-xlarge">
</div>
</form>

<div id="grad1">
<center>
<fieldset>
<legend>PART</legend>
<form action="submit.jsp" method="post">
<div id="d">
<label for="make"><b>ADD PART</b></label>
<br>
<br>
   <table border="2" align="center" width="80%"> 
     
     <tr>
      <th align="right">Select make:</th>
      <td>
       <select name="make" onchange="showModel(this.value)" required>
         <option value="">Select make</option>
         <%
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
         Statement stmt= con.createStatement();
        ResultSet rs= stmt.executeQuery("select * from makemaster");
        while(rs.next()){
         %>
       <option value="<%=rs.getString("makeid") %>"><%=rs.getString("makename") %></option>
       <%
         }
       %>
       </select> 
     </td>
     </tr>
  
    <tr>
    <th align="right">Select model:</th>
    <td id="model"><select name="model" required>
      <option value="">Select model</option>
   </select>
   </td>
   </tr>
   
    <tr>
      <th align="right">Select category:</th>
      <td>
       <select name="category" onchange="showSubcat(this.value)" required>
         <option value="">Select category</option>
         <%
        
         rs= stmt.executeQuery("select * from categorymaster");
        while(rs.next()){
         %>
       <option value="<%=rs.getString("categoryid") %>"><%=rs.getString("categoryname") %></option>
       <%
         }
       %>
       </select> 
     </td>
     </tr>
  
     <tr>
    <th align="right">Select part:</th>
    <td ><select id="partNadd" name="partNadd" required>
    <option value="" >select part</option>
      <option value="1" >p123</option>
       <option value="2"  >p124</option>
   </select>
   </td>
   </tr>
   
 
   <tr>
    <th align="right">Enter part name:</th>
   <td><input type="text" name="partname" required></td>
   </tr>
   
   <tr>
    <th align="right">Enter Price:</th>
   <td><input type="text" name="price" required></td>
   </tr>
   
   <tr>
    <th align="right">Enter Quantity:</th>
   <td><input type="text" name="quantity" required></td>
   </tr>
   
   <tr>
    <th align="right">Enter Description:</th>
   <td><input type="text" name="description"></td>
   </tr> 
   
   <tr>
    <th align="right">Upload picture</th>
   <td><input type="file" name="myimg"></td>
   </tr> 
   
    
  </table>
  <center>
  <br>
  <br>
  <input type="submit" value="ADD" class="w3-button w3-black w3-large">
  </center>
  </div>
   </form>
  
<div id="d">
<form action="partEdited.jsp" method="post">
<label for="make"><b>EDIT PART</b></label>
<br>
<br>
   <table border="2" align="center" width="80%">
     <tr>
      <th align="right">Select make:</th>
      <td>
       <select name="make" onchange="showModelNew(this.value)" required>
         <option value="">Select make</option>
         <%
        
        rs= stmt.executeQuery("select * from makemaster");
        while(rs.next()){
         %>
       <option value="<%=rs.getString("makeid") %>"><%=rs.getString("makename") %></option>
       <%
         }
       %>
       </select> 
     </td>
     </tr>
  
    <tr>
    <th align="right">Select model:</th>
    <td id="modelN"><select name="modelN" onchange="saveModelNew(this.value)" required>
    
      <option value="">Select model</option>
   </select>
   </td>
   </tr>
   
    <tr>
      <th align="right">Select category:</th>
      <td>
       <select name="category" onchange="showSubcatNew(this.value)" required>
         <option value="">Select category</option>
         <%
         
         rs= stmt.executeQuery("select * from categorymaster");
        while(rs.next()){
         %>
       <option value="<%=rs.getString("categoryid") %>"><%=rs.getString("categoryname") %></option>
       <%
         }
       %>
       </select> 
     </td>
     </tr>

     <tr>
    <th align="right">Select subcategory:</th>
    <td id="subcatN"><select name="subcatN" onchange="showPart(this.value)" required>
      <option value="">Select subcategory</option>
   </select>
   </td>
   </tr>
   
   
     <tr>
    <th align="right">Select part:</th>
    <td ><select id="partN" name="partN" required>
      <option value="">Select part</option>
   </select>
   </td>
   </tr>
   
 </table>
 <br>
 <br>
 <input type="submit" value="EDIT" class="w3-button w3-black w3-large">
</form>
</div>

<div id="d">
<label ><b>DELETE PART</b></label>
<br>
<br>
<form action="partDeleted.jsp" method="post">
<select name="part" id="part" required>
<option value="">Select part</option>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_master","root","root");
stmt= con.createStatement();
 rs= stmt.executeQuery("select * from part_model");
while(rs.next()){
%>
<option value="<%=rs.getString("partmodel_id") %>"><%=rs.getString("partname") %></option>
<%
}

%>
</select> 
<br>
<br>
<input type="submit" value="DELETE" class="w3-button w3-black w3-large">
</form>
</div>
 </fieldset>
   </center>
<br><br>
</div>
</body>
</html>