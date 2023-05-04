<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.TeacherDao"%>
<%@page import="com.entity.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Enrollment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid p-5">
		<p class="text-center fs-2 text-black">Enroll Your Desired Course</p>
	</div>
	<div class="container p-1">
		<div class="row">
			<div class="col-md-6 p-1">
				<img alt="" src="img/image001.jpg" style="max-width: 100%;">
			</div>
			<div class="col-md-6">
				<div class="card-body">
					<p class="text-center fs-3">Course Enrollment</p>
					<c:if test="${not empty errorMsg}">
						<p class="fs-4 text-center text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<c:if test="${not empty succMsg}">
						<p class="fs-4 text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<form class="row g-6" action="course_enroll" method="post">

						<input type="hidden" name="studentID" value="${studentObj.id}">
						<div class="col-md-12">
							<label for="inputEmail4" class="form-label">Full Name</label> <input
								required type="text" class="form-control" name="fullName">
						</div>
						<div class="col-md-12">
							<label for="inputEmail4" class="form-label">Registration
								No</label> <input required type="text" class="form-control"
								name="registrationNo">
						</div>
						<div class="col-md-12">
							<label for="inputPassword4" class="form-label"> Select
								Course </label> <select class="form-control" name="course" required>
								<option value="">--select--</option>
								
								<%
									TeacherDao dao = new TeacherDao(DBConnect.getConn());
									List<String> list = dao.getAllCourse();
									for (String s : list){
										%>											
											<option value="<%=s %>"><%=s %></option>										
										<%
									}
								%>
								
							
							</select>
						</div>
						<c:if test="${empty studentObj}">
							<a href="student_login.jsp" class="col-md-6 offset-md-3 btn btn-success" style="margin-top: 20px;">Submit</a>
						</c:if>
						<c:if test="${not empty studentObj}">
							<button class="col-md-6 offset-md-3 btn btn-success" style="margin-top: 20px;">Submit</button>
						</c:if>
					</form>
				</div>
			</div>
		</div>
		
	</div>
	
	
	<%@ include file="../component/footer.jsp"%>
	<%@ include file="../component/alljs.jsp"%>
</body>
</html>