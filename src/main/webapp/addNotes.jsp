<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
UserList user1 = (UserList) session.getAttribute("userl");

if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error2", "Please login..!!");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes Page</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid p-0">
		<%@ include file="all_component/navbar.jsp"%>
		<h2 style="text-align: center; margin-top: 14px;">Add Your Notes
		</h2>
		<div class="row" style="justify-content: center;">
			<div class="col-6">
				<form action="addNotesServlet" method="post">
					<div class="mb-3">

						<%
						UserList us = (UserList) session.getAttribute("userl");
						if (us != null) {
						%>
						<input type="hidden" value="<%=us.getId()%>" name="userid">
						<%
						}
						%>


						<label for="exampleInputTitle" class="form-label">Add
							Title</label> <input type="text" class="form-control"
							id="exampleInputTitle" name="ctitle" required="required"
							aria-describedby="titleHelp">
					</div>
					<div class="form-group">
						<label for="exampleInputTitle" class="form-label">Description</label>
						<textarea rows="7" cols="" class="form-control" name="cdesc"
							required="required"></textarea>
					</div>
					<button type="submit" class="btn btn-primary mt-3">Add</button>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>