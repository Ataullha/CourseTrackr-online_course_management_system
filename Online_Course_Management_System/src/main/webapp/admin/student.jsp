<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="com.entity.Student"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="./navbar.jsp"%>
	<div class="container-fluid p-5">
		<p class="text-center fs-2 text-black">All Student List</p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12 offset-md-">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Student
							Entries</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Student ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">Email</th>
									<th scope="col">Password</th>
								</tr>
							</thead>
							<tbody>

								<%
								StudentDao dao = new StudentDao(DBConnect.getConn());
								List<Student> list = dao.getAllStudent();
								System.out.println(list.size());
								for (Student st : list) {
								%>
								<tr>
									<td><%= st.getId() %></td>
									<td><%= st.getFullName() %></td>
									<td><%= st.getEmail() %></td>
									<td><%= st.getPassword() %></td>
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