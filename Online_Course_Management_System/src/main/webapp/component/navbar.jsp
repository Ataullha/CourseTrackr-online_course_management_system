<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<a class="navbar-brand" href="index.jsp">&nbsp;&nbsp;<i
		class="fa-solid fa-graduation-cap"></i> OCMS
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ms-auto">


			<c:if test="${empty studentObj}">


				<li class="nav-item active"><a class="nav-link"
					href="admin_login.jsp"> ADMIN <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="teacher_login.jsp"> TEACHER <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active"><a class="nav-link" href="studentCourseEnroll.jsp">
						REGISTRATION <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="student_login.jsp"> STUDENT <span class="sr-only">(current)</span></a>
				</li>


			</c:if>



			<c:if test="${not empty studentObj}">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="studentCourseEnroll.jsp"> REGISTRATION</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="viewRegistration.jsp"> VIEW REGISTRATION</a></li>


				<li class="nav-item dropdown active"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-user"></i> ${studentObj.fullName}
				</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="studentLogout">Logout</a></li>
					</ul></li>

			</c:if>


		</ul>
	</div>
</nav>