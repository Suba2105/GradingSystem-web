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
import com.revature.Grading.dao.TopBottomDAO;
import com.revature.Grading.exception.DBException;
import com.revature.Grading.model.Details;

@WebServlet("/TopBottomList")
public class TopBottomList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		List<Details> list = null;
		try {
			list = TopBottomDAO.findByGrade();
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