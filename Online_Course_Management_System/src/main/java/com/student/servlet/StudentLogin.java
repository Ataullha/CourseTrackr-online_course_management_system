package com.student.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.StudentDao;
import com.db.DBConnect;
import com.entity.Student;

@WebServlet("/studentLogin")
public class StudentLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		StudentDao dao = new StudentDao(DBConnect.getConn());
		Student student = dao.login(email, password);

		if (student != null) {

			session.setAttribute("studentObj", student);
			resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("errorMsg", "invalid email and password!");
			resp.sendRedirect("student_login.jsp");
		}
	}

}
