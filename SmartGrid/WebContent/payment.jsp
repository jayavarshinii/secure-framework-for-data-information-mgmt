<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="javax.swing.JOptionPane"%>

<%@page import="com.mongodb.*"%>

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
   <!--  <li><a href="index.html" >Home</a></li> -->  
<!--      <li><a href="UserLogin.jsp">User Login</a></li>       -->
<li><a href="Userpage.jsp" class="active">Customer Status</a></li>
        <li><a href="payment.jsp">payment detail</a></li>
        <li><a href="index.html">Logout</a></li>
<!--      <li><a href="#">Solutions</a></li>      -->
  <!--    <li><a href="#">Contact Us</a></li>-->
    </ul>
  </div>      

<div id="wrapper">
 <div class="header">
   
  
  <%
Mongo mongo = null;
DB db = null;
DBCollection coll = null;
mongo = new Mongo("localhost",27017);
db = mongo.getDB("grid");
coll = db.getCollection("decrypt");
String s1=(String)session.getAttribute("pid");
BasicDBObject dbo =new BasicDBObject();

DBCursor cursor = coll.find(dbo);
String w[]=new String[20];
String x[]=new String[20];
String y[]=new String[20];
String z[]=new String[20];
String a[]=new String[20];
String c[]=new String[20];
String e[]=new String[20];
String r[]=new String[20];
String t[]=new String[20];
String u[]=new String[20];
String i[]=new String[20];
String o[]=new String[20];
String m[]=new String[20];
String q[]=new String[20];
int s=0;

int s3=0;
BasicDBObject whereq=new BasicDBObject();
whereq.put("customerid",s1);
//whereq.put("status","not paid");
DBCursor g=coll.find(whereq);
while(g.hasNext())
{   
	
	DBObject obj = g.next();
	   //System.out.println(obj);
	String uid=(String) obj.get("customerid");
	String fname=(String) obj.get("customername");
	String lname=(String) obj.get("reading");
	//String dob=(String) obj.get("date");
	
	int amount=(Integer) obj.get("amount");
	int unit=(Integer) obj.get("unit");
	String email=(String) obj.get("status");

	w[s]=uid;
	x[s]=fname;
	y[s]=lname;
	z[s]=""+obj.get("date");;
	a[s]=""+unit;
	q[s]=""+amount;
	e[s]=email;
	
	s3=s3+amount;
	
	s++;
	
	//DateFormat dat=(java.util.Date) obj.get("date");
	
	//System.out.println(datee);
	//username = (String) obj.get("uname");
	//passw = (String) obj.get("pass");
	   
	  
}

 

%>
  
    <center>  <form name="form1" >
         <TABLE  border="1">
                                <h2 style="font-size: x-large;color: #8B0000; font-family: sans-serif " align="center">File Details</h2><br>
                                
                               <tr style="font-size:large;color: #8B0000;font-family: serif">
                                     <TH  style=" text-align: center">Customer Id</TH>
                                     <TH  style=" text-align: center">Name</TH>                                    
                                     <TH  style=" text-align: center">Reading</TH>
                                     <TH  style=" text-align: center">Date</TH>
                                     <TH  style=" text-align: center">Unit</TH>
                                     <TH  style=" text-align: center">Amount</TH>
                                     <TH  style=" text-align: center">Status</TH>
                                </tr>
                                       
                               
 <%
 String sVald="0";
 if(s==0){
	 sVald="0";
 }else
 sVald=w[s-1];
 
 for(int d=0;d<s;d++){
	  // System.out.println(w[d]+" "+x[d]+" " +y[d]+" "+z[d]+" "+a[d]+" "+q[d]+" "+e[d]+" " +r[d]+" "+t[d]+" "+u[d]+" "+i[d]+" "+o[d]+" " +m[d]+" "+n[d]);
	   %> 
	 <tr><td><%=w[d] %></td>   
	     <td><%=x[d] %></td>
	     <td><%=y[d] %></td>   
	     <td><%=z[d] %></td>
	     <td><%=a[d] %></td>   
	     <td><%=q[d] %></td> 
	     <td><%=e[d] %></td> 
	    </tr>  
	       

<% }%>
                           
     <tr>
     
              </TABLE> 
              <td  width="100" style="text-align: left">Total Amount = </td><td><%=s3%> </td>
 <!--    <TD style="text-align: center" ><a href="up1.jsp?id=<%=sVald %>">Click to paid </a> </TD>-->
                                   
      </tr>
    </form>    </center>  
		</div>