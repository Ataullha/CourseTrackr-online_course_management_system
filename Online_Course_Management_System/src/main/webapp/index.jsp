<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement, java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@ include file="component/allcss.jsp"%>
<style>
body {
  background-color: #f2f2f2;
}

.container {
	padding: 20px;
	background-color: #f2f2f2;
	border-radius: 5px;
	margin: 20px auto;
	max-width: 600px;
}

.card {
	background-color: #ffffff;
	border: 2px solid green;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.card-title {
	font-size: 18px;
	font-weight: bold;
	color: #333333;
	margin-bottom: 10px;
}

.card-text {
	font-size: 24px;
	color: #28a745;
	margin-bottom: 0;
}

.welcome {
	margin: 4%;
	text-align : center;
}
</style>
</head>
<body>

	<%@ include file="component/navbar.jsp"%>

	<%-- <% Connection conn=DBConnect.getConn();
	out.print(conn);
	%> --%>

	<div>
		<div>
			<h3 class='welcome'>
				Welcome to our <span>Online Course Management System!</span>
			</h3>

		</div>
	</div>

	<div class="container">
		<h4 class="text-center">OCMS Dashboard &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
		<br>
		<div class="row">
		
			<div class="col-md-5">
				<div class="card mb-5 h-200">
					<div class="card-body text-center">
						<h5 class="card-title">Teachers</h5>
						<p class="card-text">
							<span class="green"> <%
 try {
 	Class.forName("com.mysql.jdbc.Driver");
 	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms", "root", "root");
 	Statement statement = connection.createStatement();
 	ResultSet resultSet = statement.executeQuery("SELECT COUNT(DISTINCT `full_name`) AS total_teachers FROM `teacher`");

 	if (resultSet.next()) {
 		int totalTeachers = resultSet.getInt("total_teachers");
 		out.println(totalTeachers);
 	}

 	resultSet.close();
 	statement.close();
 	connection.close();
 } catch (Exception e) {
 	e.printStackTrace();
 }
 %>
							</span> teachers
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="card mb-5 h-200">
					<div class="card-body text-center">
						<h5 class="card-title">Students</h5>
						<p class="card-text">
							<span class="green"> <%
 try {
 	Class.forName("com.mysql.jdbc.Driver");
 	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms", "root", "root");
 	Statement statement = connection.createStatement();
 	ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) AS total_students FROM student_dtls");

 	if (resultSet.next()) {
 		int totalStudents = resultSet.getInt("total_students");
 		out.println(totalStudents);
 	}

 	resultSet.close();
 	statement.close();
 	connection.close();
 } catch (Exception e) {
 	e.printStackTrace();
 }
 %>
							</span> students
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<div class="card mb-5 h-200">
					<div class="card-body text-center">
						<h5 class="card-title">Courses</h5>
						<p class="card-text">
							<span class="green"> <%
 try {
 	Class.forName("com.mysql.jdbc.Driver");
 	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms", "root", "root");
 	Statement statement = connection.createStatement();
 	ResultSet resultSet = statement.executeQuery("SELECT COUNT(DISTINCT `course`) AS total_courses FROM `teacher`");

 	if (resultSet.next()) {
 		int totalCourses = resultSet.getInt("total_courses");
 		out.println(totalCourses);
 	}

 	resultSet.close();
 	statement.close();
 	connection.close();
 } catch (Exception e) {
 	e.printStackTrace();
 }
 %>
							</span> courses
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/alljs.jsp"%>
</body>
</html>