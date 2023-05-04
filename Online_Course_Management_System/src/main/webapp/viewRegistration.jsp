<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.courseRegDAO"%>
<%@page import="com.entity.courseRegistration"%>
<%@page import="com.entity.Student"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Registration</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<div class="container-fluid p-5">
		<c:if test="${empty studentObj}">
			<c:redirect url="student_login.jsp">
			</c:redirect>
		</c:if>
		<p class="text-center fs-2 text-black">${studentObj.fullName}'s
			registered courses</p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12 offset-md-">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Course List</p>
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
								Student student = (Student) session.getAttribute("studentObj");
								courseRegDAO dao = new courseRegDAO(DBConnect.getConn());
								List<courseRegistration> list = dao.getAllCourseByLoginStudent(student.getId());
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
	<%@ include file="component/alljs.jsp"%>
</body>
</html>