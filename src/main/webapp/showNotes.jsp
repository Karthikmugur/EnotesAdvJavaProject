<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.Dao.PostDao"%>
<%@ page import="com.User.Post"%>
<%@ page import="java.util.List"%>

<%
UserList user3 = (UserList) session.getAttribute("userl");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error2", "Please login..!!");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>

	<%
	String updateMsg = (String) session.getAttribute("update-Msg");
	if (updateMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("update-Msg");
	}
	%>
	<%
	String deleteMsg = (String) session.getAttribute("delete-Msg");
	if (deleteMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=deleteMsg%></div>
	<%
	session.removeAttribute("delete-Msg");
	}
	%>

	<%
	String wrongMsg = (String) session.getAttribute("wrong-Msg");
	if (wrongMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
	<%
	session.removeAttribute("wrong-Msg");
	}
	%>
	
	
	<div class="container">
		<h3 style="text-align: center; margin-top: 10px;">All Notes:</h3>

		<div class="row">
			<div class="col-12">
				<%
				if (user3 != null) {
					PostDao ob = new PostDao(DBconnect.getCon());
					List<Post> post1 = ob.getData(user3.getId());

					for (Post post : post1) {
				%>
				<div class="card mt-3">
					<img alt="" src="img/e.png" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px;">

					<div class="card-body p-4">


						<h5 class="card-title"><%=post.getCtitle()%></h5>
						<p><%=post.getCdesc()%></p>
						<p>
							<b class="text-success">published by:</b></br> <b class="text-primary"><%=user3.getName()%></b>
						</p>
						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=post.getCid()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note_id=<%=post.getCid()%>"
								class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>


			</div>
		</div>
	</div>

</body>
</html>