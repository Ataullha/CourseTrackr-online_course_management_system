package com.student.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;
import com.entity.courseRegistration;
import com.dao.courseRegDAO;

@WebServlet("/course_enroll")
public class courseRegServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int studentID = Integer.parseInt(req.getParameter("studentID"));
		String fullname = req.getParameter("fullName");
		String registrationNO = req.getParameter("registrationNo");
		String courseName = req.getParameter("course");
		System.out.println("Student ID" + studentID);
		System.out.println("Student Name" + fullname);
		System.out.println("Reg NO" + registrationNO);
		System.out.println("Course Name" + courseName);
		courseRegistration cr = new courseRegistration(studentID, fullname, registrationNO, courseName);
		courseRegDAO dao = new courseRegDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		if(dao.addCourse(cr)) {
			session.setAttribute("succMsg", "Course Enrolled Successfully!");
			resp.sendRedirect("studentCourseEnroll.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something wrong on server!");
			resp.sendRedirect("studentCourseEnroll.jsp");
		}
	}

}
