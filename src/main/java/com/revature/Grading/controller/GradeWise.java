package com.revature.Grading.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.revature.Grading.dao.GradeDAO;
import com.revature.Grading.exception.DBException;
import com.revature.Grading.model.Details;

@WebServlet("/GradeWise")
public class GradeWise extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String grade = request.getParameter("grade");
		System.out.println("Grade:" + grade);
		List<Details> list = null;
		try {
			list = GradeDAO.findByGrade(grade);		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DBException e) {
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