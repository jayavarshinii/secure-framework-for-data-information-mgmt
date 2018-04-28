

<%@page import="com.mongodb.*"%>

<%

String pid=request.getParameter("id");

Mongo mongo = null;
DB db = null;
DBCollection coll = null;

mongo = new Mongo("localhost",27017);
db = mongo.getDB("grid");
coll = db.getCollection("decrypt");
BasicDBObject dbo =new BasicDBObject();

BasicDBObject b =new BasicDBObject();

b.append("$set", new BasicDBObject().append("status", "Paid"));
BasicDBObject a=new BasicDBObject().append("customerid", pid) ;
coll.updateMulti(a, b);
response.sendRedirect("Userpage.jsp");

%>