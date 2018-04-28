<%-- 
    Document   : UserRegistration
    Created on : 26 Feb, 2016, 12:23:49 PM
    Author     : Shaju J
--%>
<%@page import="com.mongodb.*"%>

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
      <li><a href="index.html" class="active">Home</a></li>
      <li><a href="UserLogin.jsp">User Login</a></li>
 
      <li><a href="#">Contact Us</a></li>
    </ul>
  </div>     
<div id="header-featured"> </div>

<div id="wrapper">
  
   <script>
            function isfirstname()
            {
                var alphaExp = /^[a-zA-Z]+$/;
                var namee = document.reg.firstname.value;
                var nalt = document.getElementById('firstname1');
                if (namee != "")
                {
                    if (!namee.match(alphaExp))
                    {
                        nalt.innerHTML = "<font color='red'> Invalid Characters </font>";
                        document.reg.firstname.focus();
                        document.reg.firstname.value = "";
                        return false;
                    } else {
                        nalt.innerHTML = "";
                        return true;
                    }
                }
                else if (namee.length == 0) {
                    nalt.innerHTML = "<font color='red'> Enter FirstName</font>";
                    document.getElementById('firstname').focus();
                    return false;
                }

            }
            function islastname()
            {
                var alphaExp = /^[a-zA-Z]+$/;
                var namee = document.reg.lastname.value;
                var nalt = document.getElementById('lastname1');
                if (namee != "")
                {
                    if (!namee.match(alphaExp))
                    {
                        nalt.innerHTML = "<font color='red'> Invalid Characters </font>";
                        document.reg.lastname.focus();
                        document.reg.lastname.value = "";
                        return false;
                    } else {
                        nalt.innerHTML = "";
                        return true;
                    }
                }
                else if (namee.length == 0) {
                    nalt.innerHTML = "<font color='red'> Enter Lastname</font>";
                    document.getElementById('lastname').focus();
                    return false;
                }

            }
            function  charlen()
            {
                var userid = document.getElementById('username');
                var uu = userid.value;
                var chrlen = uu.length;
                var ualt = document.getElementById('username1');
                if (uu != "")
                {
                    if (chrlen < 5)
                    {
                        document.reg.user.focus();

                        ualt.innerHTML = "<font color='red'> Username Too Short</font>";
                        return false;
                    } else {
                        ualt.innerHTML = "";
                        return true;
                    }
                }
                else if (chrlen == 0) {
                    ualt.innerHTML = "<font color='red'> Invalid  Username</font>";
                    userid.focus();
                    return false;
                }

            }
            function isAlphaNumeric()
            {
                var alphaExp = /^[0-9 a-zA-Z]+$/;
                var usernam = document.reg.username.value;
                var ualt = document.getElementById('username1');
                if (!usernam.match(alphaExp) && (usernam != ""))
                {
                    document.reg.user.focus();
                    ualt.innerHTML = "<font color='red'> Invalid Username </font>";
                    return false;
                } else {
                    ualt.innerHTML = "";
                    return true;
                }
            }
            function ispassword()
            {
                var alphaExp = /^[0-9 a-zA-Z]+$/;
                var namee = document.reg.password.value;
                var nalt = document.getElementById('password1');
                if (namee != "")
                {
                    if (!namee.match(alphaExp))
                    {
                        nalt.innerHTML = "<font color='red'> Invalid Characters </font>";
                        document.reg.password.focus();
                        document.reg.password.value = "";
                        return false;
                    } else {
                        nalt.innerHTML = "";
                        return true;
                    }
                }
                else if (namee.length == 0) {
                    nalt.innerHTML = "<font color='red'> Enter password</font>";
                    document.getElementById('password').focus();
                    return false;
                }

            }
            function pass()
            {
                var pawd1 = document.getElementById('password');
                var pawdcon2 = document.getElementById('confirmpassword');
                var palt = document.getElementById('password1');
                var pcalt = document.getElementById('confirmpassword1');

                if (pawdcon2.value.length == 0) {
                    pcalt.innerHTML = "<font color='red'> Invalid Password Cofirm </font>";
                    pawdcon.focus();
                    return false;
                }

                else if (pawd1.value != pawdcon2.value)
                {
                    pcalt.innerHTML = "";
                    palt.innerHTML = "<font color='red'> Password Mismatch</font>";
                    return false;
                } else {
                    palt.innerHTML = "";
                    pcalt.innerHTML = "";
                    return true;
                }
            }
            function isemail()
            {
                var s1 = "@gmail.com";
                var s2 = "@yahoo.co.in";
                var s3 = "@rediffmail.com";
                var s4 = "@fabsys.in";
                var s5 = "@hotmail.com";
                var s6 = "@india.com";
                var elem = document.reg.emailid.value;
                var nalt = document.getElementById('emailid1');
                if (elem != "")
                {
                    var numericExpression = /^[0-9 a-zA-Z]+$/;
                    if (!elem.match(numericExpression))
                    {
                        nalt.innerHTML = "";
                        return true;
                    }

                    else {

                        nalt.innerHTML = "<font color='red'> Invalid Email id</font>";
                        document.reg.emailid.focus();
                        document.reg.emailid.value = "";
                        return false;
                    }
                }
                else if (elem.length == 0) {
                    nalt.innerHTML = "<font color='red'> Enter Email address</font>";
                    document.reg.emailid.focus();
                    ;
                    return false;
                }
                if ((elem.endsWith(s1)) || (elem.endsWith(s2)) || (elem.endsWith(s3)) || (elem.endsWith(s4)) || (elem.endsWith(s5)) || (elem.endsWith(s6)))
                {
                    nalt.innerHTML = "";
                    return true;
                }
                else
                {
                    nalt.innerHTML = "<font color='red'>Enter Valid Email id</font>";
                    document.reg.emailid.focus();
                    ;
                }
            }
            function isNumeric()
            {
                var elem = document.reg.phone.value;
                var nalt = document.getElementById('phone1');
                if (elem != "")
                {
                    var numericExpression = /^[0-9]+$/;
                    if (elem.match(numericExpression))
                    {
                        nalt.innerHTML = "";
                        return true;
                    }

                    else {

                        nalt.innerHTML = "<font color='red'> Numeric Values Only</font>";
                        document.reg.phone.focus();
                        document.reg.phone.value = "";
                        return false;
                    }
                }
                else if (elem.length == 0) {
                    nalt.innerHTML = "<font color='red'> Enter valid phone number</font>";
                    document.reg.phone.focus();
                    ;
                    return false;
                }
                else if ((elem.length() < 10) || (elem.length() > 10)) {
                    nalt.innerHTML = "<font color='red'>Enter 10 digits phone number</font>";
                    document.reg.phone.focus();
                    ;
                }


            }
            function isnationality()
            {
                var alphaExp = /^[a-zA-Z]+$/;
                var namee = document.reg.nationality.value;
                var nalt = document.getElementById('nationality1');
                if (namee != "")
                {
                    if (!namee.match(alphaExp))
                    {
                        nalt.innerHTML = "<font color='red'> Invalid Characters </font>";
                        document.reg.nationality.focus();
                        document.reg.nationality.value = "";
                        return false;
                    } else {
                        nalt.innerHTML = "";
                        return true;
                    }
                }
                else if (namee.length == 0) {
                    nalt.innerHTML = "<font color='red'>Enter Nationality</font>";
                    document.getElementById('nationality').focus();
                    return false;
                }

            }

        </script>

		
		<%Mongo mongo = null;
		DB db = null;
		DBCollection coll = null;
		mongo = new Mongo("localhost",27017);
		db = mongo.getDB("grid");
		coll = db.getCollection("CustomerDetail");
		BasicDBObject dbo =new BasicDBObject(); 
		coll.count();%>

				
    <Center> <h2>User Registration</h2> </Center>
							
		<center>    <form name="reg" action="InsertRegistration" method="post">

                <table  align="center">   
                <tr>
                        <td></td>
                        <td width="100">
                            <b><font ><h5 style="color: black"> userid &nbsp;</h5></font></b>
                        </td>
                        <td width="110">
                            <input align="center" type=""  name="uid1" size="20"  value="<%=coll.count()+1%>"  readonly >
                            <span id=firstname1></span>
                        </td>
                        <td width="300" rowspan="7" valign="top">
                        </td>
                    </tr>                                 
                    <tr>
                        <td></td>
                        <td width="100">
                            <b><font ><h5 style="color: black"> Firstname &nbsp;</h5></font></b>
                        </td>
                        <td width="110">
                            <input align="center" type="text" id="firstname" name="firstname" size="20"  onblur="isfirstname()" >
                            <span id=firstname1></span>
                        </td>
                        <td width="300" rowspan="7" valign="top">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td width="100">
                            <b><font ><h5 style="color:  black"> Lastname &nbsp;</h5></font></b>
                        </td>
                        <td width="110">
                            <input align="center" type="text" onblur="islastname()" id="lastname" name="lastname" size="20" >
                            <span id=lastname1></span>
                        </td>
                        <td width="300" rowspan="7" valign="top">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td width="100">
                            <b><font > <h5 style="color:  black">Username &nbsp;</h5></font></b>
                        </td>
                        <td width="110">
                            <input align="center" type="text" onBlur="charlen(this.id)" maxlength=10 onKeyup="isAlphaNumeric()" id="username" name="user"  size="20">
                            <span id=username1></span>
                        </td>
                        <td width="300" rowspan="7" valign="top">
                        </td>
                    </tr>
                    <tr>  <td></td>
                        <td>
                            <b><font ><h5 style="color:  black">Password</h5> </font></b>
                        </td>
                        <td>
                            <input align="center" id="password" onblur="ispassword()"  type="password" name="passwd" size="20">
                            <span id=password1></span>
                        </td>
                    </tr>
                    <tr>  <td></td>
                        <td>
                            <b><font ><h5 style="color: black;"> ConfirmPassword </h5> </font></b>
                        </td>
                        <td>
                            <input align="center" id="confirmpassword" onblur="pass()"  type="password" name="CONFIRM" size="20">
                            <span id=confirmpassword1></span> 
                        </td>
                    </tr>
                    <tr>  <td></td>
                        <td>
                            <b><font ><h5 style="color:  black"> Email id&nbsp;</h5></font></b>
                        </td>
                        <td>
                            <input align="center" id="emailid" onblur="isemail()"  type="text" name="emailid" size="20" ><br>
                            <span id=emailid1></span> 
                        </td>
                    </tr>
                    <tr>  <td></td>
                        <td>
                            <b><font > <h5 style="color:  black">DOB&nbsp;</h5></font></b>
                        </td>
                        <td>
                         
                  <input name="dateof" value="" onfocus="showCalendarControl(this);" type="text">
                        </td></tr>
                    <tr>  <td></td>
                        <td>
                            <b><font > <h5 style="color:  black">Gender &nbsp;</h5></font></b>
                        </td>
                        <td>
                            <select name="gender"  >
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                </optgroup>
                            </select><br></td>
                    </tr>

                    <tr>  <td></td>
                        <td>
                            <b><font ><h5 style="color: black">  Phone</h5></font></b>
                        </td>
                        <td>
                            <input align="center" id="phone" onblur="isNumeric()"  type="text" name="phone" size="20"><br>
                            <span id=phone1></span> 
                        </td>
                    </tr>                  
                   <tr>  <td></td>
                        <td>
                            <b ><font ><h5 style="color: black">  Nationality   </h5></font></b><br>
                        </td>
                        <td>
                            <input align="center" id="nationality" onblur="isnationality()" style="" type="text" name="nationality" size="20">
                            <span id=nationality1></span>    </td>
                    </tr>
                    
                    <br>
                    <br>
                    
                    <tr><td></td>
                        <td align="center" >
                            <input name="submit" type="submit" value="  Submit  " style="width:80px; color: black;font-weight: bold" >
                        </td><td><input type="reset" value="  Reset  " style="width:80px; color: black;font-weight: bold" >
                            <br>
                        </td></tr>
                        
                   
                </table>

            </form></center>
		</div>
