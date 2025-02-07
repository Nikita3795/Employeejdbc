package com.employeejdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB", "root",
					"root");
			String sql = "Delete from Employees where id = ?";
			PreparedStatement stmt = stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("showEmployees.jsp");
	}

}
