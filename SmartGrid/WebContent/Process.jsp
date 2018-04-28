<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.mongodb.*"%>
    <%@page import="com.encrypt.*"%>
     <%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  


PBA bf = new PBA();



        Mongo mongo = null;
		DB db = null;
		DBCollection coll = null;
	  String	 id = request.getParameter("id").trim();
      String    name= request.getParameter("name").trim();
      String   reading= request.getParameter("reading").trim();      
      String aacc=bf.gett(reading);
      String raacc=bf.gett(aacc);
      System.out.println("Encryption :"+aacc);
      System.out.println("Re Encryption :"+raacc);
      int read=0;
      int amount=0;
      
      mongo = new Mongo("localhost",27017);
      db = mongo.getDB("grid");
      coll = db.getCollection("decrypt");
      BasicDBObject dbo2 =new BasicDBObject();
       DBCursor cursor = coll.find(dbo2);
      String w[]=new String[20];
      String x[]=new String[20];
      int s=0;

      BasicDBObject whereq=new BasicDBObject();
      whereq.put("customerid",id);
      DBCursor g=coll.find(whereq);
      System.out.println("g---"+g);
      while(g.hasNext())
      {     	
      	DBObject obj = g.next();
      	String id1=(String) obj.get("customerid");
      	String reading23=(String) obj.get("reading");;
      	w[s]=id1;
      	x[s]=reading23; 
      	
      	System.out.println(w[s]);
      	System.out.println(x[s]);
      	
      	s++;
      	  
       }
      System.out.println("sssss;-----"+s);
      //System.out.println("System.out.println(w[s]);-----"+x[s-1]);
      
      int read1 = Integer.parseInt(reading);
      int read2= 0;
      if(s == 0){
    	  read2= 0;
      }else
    	  read2=Integer.parseInt(x[s-1]);
      
      read=read1-read2;
      int a=3;
      System.out.println(read);
      amount=read*3;
      System.out.println(amount);
      java.sql.Timestamp rdate = new java.sql.Timestamp(new java.util.Date().getTime());
      
      System.out.println(rdate);
      mongo = new Mongo("localhost",27017);
	  db = mongo.getDB("grid");
		coll = db.getCollection("encrypt");
		BasicDBObject dbo =new BasicDBObject();
  	   dbo.append("customerid", id);
  	   dbo.append("customername", name);
  	   dbo.append("reading", aacc); 
  	   dbo.append("reading1", raacc);  
  	   WriteResult wr= coll.insert(dbo);
  	   
  	 mongo = new Mongo("localhost",27017);
	  db = mongo.getDB("grid");
		coll = db.getCollection("decrypt");
		BasicDBObject dbo1 =new BasicDBObject();
		dbo1.append("customerid", id);
		dbo1.append("customername", name);
		dbo1.append("reading", reading);  	
		dbo1.append("date", rdate); 
		dbo1.append("amount", amount); 
		dbo1.append("unit", read); 
		dbo1.append("status", "not paid"); 
 	   WriteResult wr1= coll.insert(dbo1);
  	 JOptionPane.showMessageDialog(null, "Customer Reading added successfully..");
  	 response.sendRedirect("UserServicePage.jsp"); 
  	 
  	
    
  
  	 
  	 
  	   
  	   %>
</body>
</html>