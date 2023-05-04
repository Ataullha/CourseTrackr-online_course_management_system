package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Teacher;
import com.dao.TeacherDao;
import com.db.DBConnect;

@WebServlet("/addTeacher")
public class AddTeacher extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String fullName = req.getParameter("fullname");
			String course = req.getParameter("course");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			Teacher d = new Teacher(fullName, course, email, password);

			TeacherDao dao = new TeacherDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.registerTeacher(d)) {
				session.setAttribute("succMsg", "Teacher Added!");
				resp.sendRedirect("admin/teacher.jsp");
			} else {
				session.setAttribute("errorMsg", "Something went wrong!");
				resp.sendRedirect("admin/teacher.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
