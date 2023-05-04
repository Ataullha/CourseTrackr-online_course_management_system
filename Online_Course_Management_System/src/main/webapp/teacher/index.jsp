<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.courseRegDAO"%>
<%@page import="com.entity.courseRegistration"%>
<%@page import="com.entity.Teacher"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.teacher.servlet.TeacherLogin"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../component/allcss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<c:if test="${empty teacherObj}">
		<c:redirect url="../teacher_login.jsp">
		</c:redirect>
	</c:if>

	<div class="container-fluid p-5">
		<p class="text-center fs-2 text-black">${teacherObj.fullName}'s student list</p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12 offset-md-">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Student List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Student ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">Registration NO</th>
									<th scope="col">Course Name</th>
								</tr>
							</thead>
							<tbody>
								<%
								Teacher teacher = (Teacher) session.getAttribute("teacherObj");
								courseRegDAO dao = new courseRegDAO(DBConnect.getConn());
								List<courseRegistration> list = dao.getAllStudentByCourseName(teacher.getPassword());
								for (courseRegistration cr : list) {
								%>
								<tr>
									<td><%=cr.getStudentID()%></td>
									<td><%=cr.getFullName()%></td>
									<td><%=cr.getRegNO()%></td>
									<td><%=cr.getCourseName()%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../component/alljs.jsp"%>
</body>
</html>