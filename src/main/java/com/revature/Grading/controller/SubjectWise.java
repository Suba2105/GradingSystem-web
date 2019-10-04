package com.revature.Grading.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.revature.Grading.exception.DBException;
import com.revature.Grading.model.Details;
import com.revature.Grading.services.SubWiseRank;

@WebServlet("/SubjectWise")
public class SubjectWise extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String subject = request.getParameter("subject");
		System.out.println("Subject:" + subject);
		List<Details> list = new ArrayList<Details>();
		try {
			list = SubWiseRank.findByGrade(subject);		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// convert list to json
		Gson gson = new Gson();
		String json = gson.toJson(list);
        //   write the json as response
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();

	}

}