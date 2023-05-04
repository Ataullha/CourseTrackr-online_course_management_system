<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@ include file="component/allcss.jsp"%>
</head>
<body>

	<%@ include file="component/navbar.jsp"%>
	
	<%-- <% Connection conn=DBConnect.getConn();
	out.print(conn);
	%> --%>


	<div class="container mt-4">
		<h1 class="mb-4">Our Website Features</h1>
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Requirement R-1</h5>
				<p class="card-text">It must be able to handle three types of
					users: a student, a teacher and an admin.</p>
			</div>
		</div>
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Requirement R-2</h5>
				<p class="card-text">Each user needs to be authenticated using
					username and password. Creating a registration page is optional.
					You can directly create users in your database with their
					corresponding user types (e.g. student, teacher and so on).</p>
			</div>
		</div>
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Requirement R-3</h5>
				<p class="card-text">An admin user needs to be able to add new
					courses in the system and assign a particular teacher to a
					corresponding course.</p>
			</div>
		</div>
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Requirement R-4</h5>
				<p class="card-text">A student user should be able to register
					for a new course and view all his/her registered courses.</p>
			</div>
		</div>
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Requirement R-5</h5>
				<p class="card-text">A teacher user should be able to view
					his/her corresponding registered course(s) and to select a
					particular course, from these registered courses, to view the list
					of the registered students for that particular course.</p>
			</div>
		</div>
	</div>



	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/alljs.jsp"%>
</body>
</html>