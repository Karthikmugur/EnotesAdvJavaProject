<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.DB.DBconnect"%>
<%@ page import="com.Dao.PostDao"%>
<%@ page import="com.User.Post"%>

    
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
<title>Edit Page</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
<%
 Integer noteid = Integer.parseInt(request.getParameter("note_id"));
 PostDao post = new PostDao(DBconnect.getCon());
 Post p = post.getDataById(noteid);

%>

<div class="container-fluid p-0">
		<%@ include file="all_component/navbar.jsp"%>
		<h2 style="text-align: center; margin-top: 14px;">Edit Your Notes
		</h2>
		
		<div class="row" style="justify-content: center;">
			<div class="col-6">
				<form action="editNotesServlet" method="post">
				
				<input type="hidden" value="<%=noteid %>" name="noteid">
					<div class="mb-3">

						<label for="exampleInputTitle">Add
							Title</label> <input type="text" class="form-control"
							id="exampleInputTitle" name="ctitle" required="required" 
							aria-describedby="titleHelp" value="<%=p.getCtitle() %>">
					</div>
					<div class="form-group">
						<label for="exampleInputTitle" class="form-label">Description</label>
						<textarea rows="7" cols="" class="form-control" name="cdesc"
							required="required"><%= p.getCdesc() %></textarea>
					</div>
					<button type="submit" class="btn btn-primary mt-3">Add</button>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
	
</body>
</html>