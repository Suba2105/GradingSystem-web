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
import com.revature.Grading.dao.AdminRegisterDAO;
import com.revature.Grading.exception.DBException;
import com.revature.Grading.model.Details;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get Inputs
		String admin_name=request.getParameter("Admin_Name");
		String pass=request.getParameter("Password");
		PrintWriter out = response.getWriter();
	      System.out.println("Admin_Name:" + admin_name);
	       System.out.println("Password:" + pass);
	       
	       String errorMessage = null;
		      
	       
	    //To call dao
	       Details adminregister=new Details();
	       adminregister.setAdmin_Name(admin_name);
	       adminregister.setPassword(pass);
	       
	       try {
			AdminRegisterDAO.adminregister(admin_name, pass);
	       } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				errorMessage = e.getMessage();
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
		    	   obj.addProperty("message", "Successfully Marks added");
		       }
		       
		       out.write(obj.toString());
		       out.flush();
	       
	}
}
