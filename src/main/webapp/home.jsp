<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
UserList user2 = (UserList) session.getAttribute("userl");

if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error2", "Please login..!!");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>

	<div class="container-fluid p-0">
		<%@ include file="all_component/navbar.jsp"%>
		<div class="card py-5">
			<div class="card-body" style="text-align: center;">
				<img src="img/e.png" width=200px; height=200px;>
				<h2>Start Adding Your Notes</h2>
				<a href="addNotes.jsp" class="btn btn-primary">Click Here to Add</a>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>