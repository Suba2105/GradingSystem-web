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
import com.revature.Grading.dao.UserDAO;
import com.revature.Grading.exception.DBException;
import com.revature.Grading.model.Details;

@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get Inputs
		String student_name=request.getParameter("name");
		String reg_no=request.getParameter("num");
		PrintWriter out = response.getWriter();
	       System.out.println("Student_Name:" + student_name);
	       System.out.println("Register_Number:" + reg_no);
	       
	       String errorMessage = null;
		      
	       
	    //To call dao
	       Details studentlogin=new Details();
	       studentlogin.setStudent_Name(student_name);
	       studentlogin.setRegister_Number(Integer.parseInt(reg_no));
	       
	       Details result  = null;
	       try {
	    	   result= UserDAO.login(student_name, Integer.parseInt(reg_no));
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
