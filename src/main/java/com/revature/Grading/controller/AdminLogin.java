package com.revature.Grading.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.revature.Grading.dao.AdminLoginDAO;
import com.revature.Grading.exception.DBException;
import com.revature.Grading.model.Details;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get Inputs 
		String admin_name=request.getParameter("name");
		String pass=request.getParameter("password");
		PrintWriter out = response.getWriter();
	       System.out.println("Admin_Name:" + admin_name);
	       System.out.println("Password:" + pass);
	       
	       String errorMessage = null;
		      
	       
	    //To call dao
	       Details adminlogin=new Details();
	       adminlogin.setAdmin_Name(admin_name);
	       adminlogin.setPassword(pass);
	       
	       Details result  = null;
	       try {
			result=AdminLoginDAO.login(admin_name, pass);
			if (result == null) {
				throw new DBException("Invalid login");
			}
	       } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				errorMessage = e.getMessage();
			} catch (DBException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				errorMessage = e.getMessage();
			}
		       
		    // Convert list to json
		       JsonObject obj = new JsonObject();
		       if (errorMessage != null) {
		    	   obj.addProperty("errorMessage", errorMessage);
		       }
		       else {
		    	   obj.addProperty("message", "Successfully LoggedIn");
		       }
		       
		       out.write(obj.toString());
		       out.flush();

	       
	    
	       
	}
}
