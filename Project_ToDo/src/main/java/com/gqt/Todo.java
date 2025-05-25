package com.gqt;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Todo")
public class Todo extends HttpServlet {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/Todo";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "Bighouse$770";

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String task = request.getParameter("task");
		String deleteTask = request.getParameter("deleteTask");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			if (task != null ) {

				String insertQuery = "INSERT INTO tasks (task) VALUES (?)";
				PreparedStatement pst = con.prepareStatement(insertQuery);
				pst.setString(1, task);
				pst.executeUpdate();
			}

			if (deleteTask != null  ) {

				String deleteQuery = "DELETE FROM tasks WHERE task = ?";
				PreparedStatement pstDelete = con.prepareStatement(deleteQuery);
				pstDelete.setString(1, deleteTask);
				pstDelete.executeUpdate();
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		doGet(request, response);
	}

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<String> tasks = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			String selectQuery = "SELECT task FROM tasks";
			PreparedStatement pstSelect = con.prepareStatement(selectQuery);
			ResultSet rs = pstSelect.executeQuery();

			while (rs.next()) {
				tasks.add(rs.getString("task"));
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("taskList", tasks);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}