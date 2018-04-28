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
  <div class="logo">Big Data</div>
  <div class="menu">
    <ul>
      <li><a href="index.html" >Home</a></li>
<!--      <li><a href="UserLogin.jsp">User Login</a></li>       -->
<li><a href="Service.jsp" >Management Service</a></li>
       <li><a href="Distribute.jsp">Distribution Service</a></li>
        <li><a href="UserService.jsp" class="active">User Service</a></li>
<!--      <li><a href="#">Solutions</a></li>      -->
  <!--    <li><a href="#">Contact Us</a></li>-->
    </ul>
  </div>      

<div id="wrapper">
  
 <center><h1>Welcome to User Service </h1><br><br></center>
                                 <center>
                            <form action="UserLoginCheck.jsp" name="datauser.jsp"  method="post" >
                                <table  width="300px"  color: black  align="" />

                                <tr><td></td></tr>
                                <tr><td ></td></tr>
                                <tr>
                                    <td><b>Login Name</b></td><br><br>
                                    <td ><input style="width:200px; "type="text" name="username" id="USERNAME" style="" /></td>
                                </tr>
                                <tr><td></td></tr>              <tr><td ></td></tr>
                                <tr>
                                    <td ><b>Password</b></td>
                                    <td ><input style="width:200px;" type="password" name="password" id="PASSWORD" MaxLength="8"/></td>
                                </tr>
                                <tr><td></td></tr>
                                <tr><td ></td></tr>
                                <tr><td ></td></tr>
                                <tr><td ></td></tr>
                                <tr><td ></td><td  cellpadding="20" align="left" style=" color: black " ><input type="submit" name="Submit" value="Submit" id="submit" onclick="login()" style="  border-style: outset" />
                                    </td>
                                </tr>
                                
                                
                                </table>
                            </form>	 </center>
		</div>