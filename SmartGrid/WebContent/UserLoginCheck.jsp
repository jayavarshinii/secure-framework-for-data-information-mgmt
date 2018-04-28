
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.swing.JOptionPane"%>

<%
    String username=request.getParameter("username");
    session.setAttribute("username", username);
    
    String password=request.getParameter("password");
    
    
    
    if((username!="") && (password!=""))
    {
    	if((username.equals("user")) && (password.equals("user")))
        { 
           JOptionPane.showMessageDialog(null, "Welcome to User Service..");
           response.sendRedirect("UserServicePage.jsp"); 
        }
    	else if((username.equals("manage")) && (password.equals("manage")))
        { 
           JOptionPane.showMessageDialog(null, "Welcome to Management Service..");
           response.sendRedirect("manage.jsp"); 
        }
    	else if((username.equals("distribute")) && (password.equals("distribute")))
        { 
           JOptionPane.showMessageDialog(null, "Welcome to Distributed Service..");
           response.sendRedirect("Distribution.jsp"); 
        }
           else
           {
               JOptionPane.showMessageDialog(null,"invalid username & password");
               response.sendRedirect("index.html");
           }
        }
      
    
    
    
     
    
   
%>

</body>
</html>