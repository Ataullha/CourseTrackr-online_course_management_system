<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp">
		</c:redirect>
	</c:if>

	<h1 class="mb-4 text-center">Admin Features</h1>

	<div class="card mb-3">
		<div class="card-body">
			<h5 class="card-title">Requirement R-3</h5>
			<p class="card-text">An admin user needs to be able to add new
				courses in the system and assign a particular teacher to a
				corresponding course.</p>
		</div>
	</div>

	<%@ include file="../component/footer.jsp"%>
	<%@ include file="../component/alljs.jsp"%>

</body>
</html>