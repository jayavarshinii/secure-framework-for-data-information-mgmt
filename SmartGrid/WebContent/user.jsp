<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Theme-02</title>
<link href='http://fonts.googleapis.com/css?family=Trocchi' rel='stylesheet' type='text/css' />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="wrapper">
  <div class="logo"> Kidney Failure</div>
  <div class="menu">
   
    <ul>
        
      <li><a href="index.html" class="active">Home</a></li>
      <li><a href="manage.jsp">Management Service</a></li>
      <li><a href="distribute.jsp">Distribution Service</a></li>
      <li><a href="user.jsp">User Service</a></li>
      <li><a href="#">Contact Us</a></li>
    </ul>
  </div>  
  <tr><td></td></tr>
  <tr><td ></td></tr>
  
  <center><h1>Welcome To User</h1><br><br></center>
                                 <center>
                            <form action="LoginServlet"   method="post" >
                                <table  width="300px"  color: black  align="" />

                                <tr><td></td></tr>
                                <tr><td ></td></tr>
                                <tr>
                                    <td><b>Login Name</b></td><br><br>
                                    <td ><input style="width:200px; "type="text" name="userid" id="USERNAME" style="" /></td>
                                </tr>
                                <tr><td></td></tr>              <tr><td ></td></tr>
                                <tr>
                                    <td ><b>Password</b></td>
                                    <td ><input style="width:200px;" type="password" name="pwd" id="PASSWORD" MaxLength="8"/></td>
                                </tr>
                                <tr><td></td></tr>
                                <tr><td ></td></tr>
                                <tr><td ></td></tr>
                                <tr><td ></td></tr>
                                <tr><td ></td><td  cellpadding="20" align="left" style=" color: black " ><input type="submit" name="Submit" value="Submit" id="submit" onclick="login()" style="  border-style: outset" />
                                    </td>
                                </tr>
                                
                                <tr><td><a href="UserRegistration.jsp"></a></td></td></tr>

                                </table>
                            </form>	 </center>
		</div>

<!--<div id="copyright" class="container">
  <p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div>-->

            <!-- Javascripts
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
            <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
            <script src="js/bootstrap.min.js"></script>
            <script src="http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js"></script>
            <script src="js/jquery.fitvids.js"></script>
            <script src="js/jquery.sequence-min.js"></script>
            <script src="js/jquery.bxslider.js"></script>
            <script src="js/main-menu.js"></script>
            <script src="js/template.js"></script>-->
</body>
</html>