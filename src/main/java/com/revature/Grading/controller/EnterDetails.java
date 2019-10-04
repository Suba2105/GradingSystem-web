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
import com.revature.Grading.dao.RegisterDAO;
import com.revature.Grading.exception.DBException;
import com.revature.Grading.model.Details;
import com.revature.Grading.ui.Login;

@WebServlet("/EnterDetails")
public class EnterDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get Inputs
		String s_name=request.getParameter("Student_Name");
		String mat=request.getParameter("Maths_Mark");
		String phy=request.getParameter("Physics_Mark");
		String che=request.getParameter("Chemistry_Mark");
		String bot=request.getParameter("Botany_Mark");
		String zoo=request.getParameter("Zoology_Mark");
		PrintWriter out = response.getWriter();
	      System.out.println("Student_Name:" + s_name);
	      System.out.println("Maths_Mark:" + mat);
	      System.out.println("Physics_Mark:" + phy);
	      System.out.println("Chemistry_Mark:" + che);
	      System.out.println("Botany_Mark:" + bot);
	      System.out.println("Zoology_Mark:" + zoo);
	      
	      String errorMessage = null;
	      
	    //To call dao
	       Details enterdetails=new Details();
	       enterdetails.setStudent_Name(s_name);
	       enterdetails.setMaths(Integer.parseInt(mat));
	       enterdetails.setPhysics(Integer.parseInt(phy));
	       enterdetails.setChemistry(Integer.parseInt(che));
	       enterdetails.setBotany(Integer.parseInt(bot));
	       enterdetails.setZoology(Integer.parseInt(zoo));
	       int total = enterdetails.getMaths() + enterdetails.getPhysics() + enterdetails.getChemistry() + enterdetails.getBotany() + enterdetails.getZoology();
			int noOfSubjects = 5;
			double avg = (double) total / noOfSubjects;
			enterdetails.setTotal(total);
			enterdetails.setAverage(avg);
			
			String grade =  Login.getGrade(total);
			enterdetails.setGrade(grade); 
	       try {
	    	   RegisterDAO.register(enterdetails);
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
