package com.revature.Grading.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.revature.Grading.exception.DBException;
import com.revature.Grading.model.Details;
import com.revature.Grading.util.ConnectionUtil;

public class UserDAO {

	public static Details login(String S_name, int reg_no) throws SQLException,DBException  {
		Details det = null;
		Connection con =null;
		PreparedStatement pst=null;
		try {
			con = ConnectionUtil.getConnection();
			//String sql = "select Student_Name,Register_Number,Maths,Physics,Chemistry,Botany,Zoology,Total,Average,Grade from Admin where Student_Name=? && Register_Number=?";
           
		String sql = "select Student_Name,Register_Number from Admin where Student_Name=? && Register_Number=?";
			
			pst = con.prepareStatement(sql);

			pst.setString(1, S_name);
			pst.setInt(2, reg_no);
			ResultSet rs = pst.executeQuery();
			


			if (rs.next()) {

				String s_name = rs.getString("Student_Name");
			Integer reg_no1 = rs.getInt("Register_Number");
//				Integer mat = rs.getInt("Maths");
//				Integer phy = rs.getInt("Physics");
//				Integer che = rs.getInt("Chemistry");
//				Integer bot = rs.getInt("Botany");
//				Integer zoo = rs.getInt("Zoology");
//				Integer total = rs.getInt("Total");
//				Double avg = rs.getDouble("Average");
//				String grade = rs.getString("Grade");

				det = new Details();

				det.setStudent_Name(s_name);
				det.setRegister_Number(reg_no1);
//				det.setMaths(mat);
//				det.setPhysics(phy);
//				det.setChemistry(che);
//				det.setBotany(bot);
//				det.setZoology(zoo);
//				det.setTotal(total);
//				det.setAverage(avg);
//				det.setGrade(grade);

			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new DBException("Unable to select");
		}finally {
			con.close();
			pst.close();
		}
		return det;

	}
}
