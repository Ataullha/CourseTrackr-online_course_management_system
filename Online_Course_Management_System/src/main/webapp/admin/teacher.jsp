<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.TeacherDao"%>
<%@page import="com.entity.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../component/allcss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	﻿

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Teacher and Course</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="../addTeacher" method="post">
							<div class="mb-3">
								<label class="form-label"> Teacher's Name</label> <input
									type="text" required name="fullname" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label ">Course</label> <input required
									name="course" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label ">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>
				</div>
			</div>

			﻿

			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Teacher's Name</th>
									<th scope="col">Email</th>
									<th scope="col">Password</th>
									<th scope="col">Course</th>
								</tr>
							</thead>
							<tbody>

								<%
							
							TeacherDao dao = new TeacherDao(DBConnect.getConn());
							List<Teacher> list = dao.getAllTeacher();
							for(Teacher d:list){%>
							
							<tr>
							
							<td><%=d.getFullName() %></td>
							<td><%=d.getCourse()%></td>
							<td><%=d.getEmail() %></td>
							<td><%=d.getPassword() %></td>
							
							</tr>

								<%}
							
							
							%>





							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../component/footer.jsp"%>
	<%@ include file="../component/alljs.jsp"%>
</body>
</html>