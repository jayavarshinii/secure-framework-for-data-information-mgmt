package com.grid.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import com.mongodb.WriteResult;

/**
 * Servlet implementation class InsertRegistration
 */
@WebServlet("/InsertRegistration")
public class InsertRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public String id= null;
    public String fname = null;
    public String lname = null;
    public String uname = null;
    public String pass = null;
    public String mobile = null;
    public String dob = null;
    public String nationality = null;
    public String gender = null;
    public String email = null;
    public String ptype = null;
    
    
    Mongo mongo = null;
	DB db = null;
	DBCollection coll = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        PrintWriter out = response.getWriter();
        try {
        	
        	id = request.getParameter("uid1").trim();
            fname = request.getParameter("firstname").trim();
            lname = request.getParameter("lastname").trim();
            uname = request.getParameter("user").trim();
            pass = request.getParameter("passwd").trim();
            dob = request.getParameter("dateof").trim();
            nationality = request.getParameter("nationality").trim();
            gender = request.getParameter("gender").trim();
            email = request.getParameter("emailid").trim();
            mobile = request.getParameter("phone").trim();
           int num=0;
           
           if((uname!="") && (fname!="") ){

           /* String Query = "insert into userdetails() values("+num+",'" + fname + "', '" + lname + "', '" + dob + "', '" + gender + "', '" + email + "', '" + mobile + "', '" + address + "', '" + uname + "', '" + pass + "', '" + usertype + "')";
            System.out.println(Query);
            int res = dao.insertion(Query);*/
         
        	   mongo = new Mongo("localhost",27017);
        	   db = mongo.getDB("grid");
        	   coll = db.getCollection("CustomerDetail");
        	   BasicDBObject dbo =new BasicDBObject();
        	   dbo.append("pid", id);
        	   dbo.append("fname", fname);
        	   dbo.append("lname", lname);
        	   dbo.append("uname", uname);
        	   dbo.append("pass", pass);
        	   dbo.append("dob", dob);
        	   dbo.append("nationality", nationality);
        	   dbo.append("mobile", mobile);
        	   dbo.append("gender", gender);
        	   dbo.append("email", email);
        	   WriteResult wr= coll.insert(dbo);

        	   int res= wr.getN();
        	   System.out.println("res=="+res);
        	   
        	   mongo = new Mongo("localhost",27017);
        	   db = mongo.getDB("grid");
        	   coll = db.getCollection("distribute");
        	   BasicDBObject dbo1 =new BasicDBObject();
        	   dbo1.append("pid", id);
        	   dbo1.append("uname", uname);
        	   dbo1.append("mobile", mobile);
        	   dbo1.append("Status", "not paid");
        	   WriteResult wr1= coll.insert(dbo1);
        	   
        	   int res1= wr1.getN();
        	   System.out.println("res1=="+res1);
        	   
               if ((res == 0) && (res1==0)){
                  
                       out.println("<script>alert('success')</script>");
                       JOptionPane.showMessageDialog(null, "Register Sucessfully....");
                       RequestDispatcher rd = request.getRequestDispatcher("UserLogin.jsp");
                       rd.forward(request, response);
                       
                       
                  
               }

                else {
                   out.println("<script>alert('Failed')</script>");
                   RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                   rd.forward(request, response);
                }
           
           
            
         
    }else{
    	//out.println("<script>alert('Failed')</script>");
    	JOptionPane.showMessageDialog(null, "Enter the valid details");
        RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
        rd.forward(request, response);
    	
    }}
        
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
	}

}
