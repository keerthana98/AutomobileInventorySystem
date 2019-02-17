<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
</head>
<body>

<h3>Contact Form</h3>

<div class="container">
  <form action="contact_process.jsp">
    
    <input type="text" id="name"  name="name" placeholder="Name" required>

     <input type="text" id="email"  name="email" placeholder="Email" required>
     
      <input type="text" id="subject" name="subject"  placeholder="Subject" >
    
    <textarea id="text" name="text" placeholder="Write something.." style="height:200px"></textarea>

    <input type="submit" value="Submit">
  </form>
</div>
<br>
<br>
<form action="menu_jsp.jsp" method="post">
<center><input type="submit" value="BACK" class="w3-button w3-black w3-large"></center>
</form>

</body>
</html>
