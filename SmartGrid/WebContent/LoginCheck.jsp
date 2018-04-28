<%-- 
    Document   : LoginCheck
    Created on : 17 Feb, 2017, 5:03:12 PM
    Author     : Akash G
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.swing.JOptionPane"%>

<%
    String username=request.getParameter("dname");
    session.setAttribute("username", username);
    
    String password=request.getParameter("pass");
    
    String dep=request.getParameter("dep");
    
    if((username!="") && (password!=""))
    {
    	if((username.equals("manage")) && (password.equals("manage")))
        { 
           JOptionPane.showMessageDialog(null, "Welcome Management Service..");
           response.sendRedirect("doctorpage.jsp"); 
         }
    	else if((username.equals("distribute")) && (password.equals("distribute")))
        { 
           JOptionPane.showMessageDialog(null, "Welcome Distribution Service..");
           response.sendRedirect("doctorpage.jsp"); 
         }
    	else if((username.equals("user")) && (password.equals("user")))
        { 
           JOptionPane.showMessageDialog(null, "Welcome User Service..");
           response.sendRedirect("doctorpage.jsp"); 
         }
           else
           {
               JOptionPane.showMessageDialog(null,"invalid username & password");
               response.sendRedirect("index.html");
           }
        }
      
    
    
    
     
    
   
%>
