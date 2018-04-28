/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.grid.Servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

/**
 *
 * @author Jesu Jeni
 */
public class LoginServlet extends HttpServlet {
String UserId, pass = null;
Mongo mongo = null;
DB db = null;
DBCollection coll = null;

   int count=0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try           
        {
            HttpSession session = request.getSession(true);
//          dep = request.getParameter("dep").trim(); 
            UserId = request.getParameter("username").trim();
            pass = request.getParameter("password").trim();
            System.out.println(UserId);
            System.out.println(pass);
            /*String Query="SELECT * FROM userdetails WHERE username ='"+UserId+"' AND pass='"+pass+"'";
            System.out.println(Query);
            rs1 = dao.selectmeth(Query);
            while (rs1.next()) {
                count++;
            }*/
            
           mongo = new Mongo("localhost",27017);
     	   db = mongo.getDB("grid");
     	   coll = db.getCollection("CustomerDetail");
     	   BasicDBObject dbo= new BasicDBObject();
     	   dbo.append("uname", UserId);
     	   dbo.append("pass", pass);
     	   String username="",passw="",pid="";
     	   DBCursor cursor = coll.find(dbo);
     	   while(cursor.hasNext())
     	   {
     		   DBObject obj = cursor.next();
     		   System.out.println(obj);
     		  pid = (String) obj.get("pid");
     		   username = (String) obj.get("uname");
     		   passw = (String) obj.get("pass");
     		   
     		  
     	   }
     	  System.out.println(username);
     	 System.out.println(UserId);
     	System.out.println(passw);
     	System.out.println("------>"+pass);
     	   
            session.setAttribute("pid", pid);
            	 if(username.equalsIgnoreCase(UserId) && passw.equalsIgnoreCase(pass))
            	{
            		response.sendRedirect("Userpage.jsp");
            	}
            	else
            	{
            		JOptionPane.showMessageDialog(null, "Invalid UserName & Password");
            		RequestDispatcher rd = request.getRequestDispatcher("UserLogin.jsp");
                    rd.forward(request, response);
            	}
           
            
            
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
