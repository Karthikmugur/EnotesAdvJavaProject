<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="mt-2">
		<div class="row" style="justify-content:center;">
			<div class="col-4 p-3">
				<div class="card">
				<div class="card-header" style="text-align: center; background:cyan; font-size:21px;">
				<i class="fa fa-sign-in" aria-hidden="true"></i>    LOGIN
				</div>
				
				<%
				String errorMsg = (String) session.getAttribute("login-error");
				
				if(errorMsg != null){
					%>
					<div class="alert alert-danger" role="alert"><%=errorMsg%></div>
					<%
					session.removeAttribute("login-error");
				}
				%>
				
				<%
				String errorMsg2 = (String) session.getAttribute("login-error2");
				if(errorMsg2!=null){
					%>
					<div class="alert alert-danger" role="alert"><%=errorMsg2%></div>
					<%
					session.removeAttribute("login-error2");
				}
				%>
				
				<%
				
				String logoutMsg = (String) session.getAttribute("logout-Msg");
				if(logoutMsg!=null){
					%>
					<div class="alert alert-success" role="alert"><%=logoutMsg%></div>
					<%
					session.removeAttribute("logout-Msg");
				}
				%>
				
					<div class="card-body">
						<form action="loginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter Registered Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" name="usemail" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Enter Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="uspassword">
							</div>

							<button type="submit" class="btn btn-primary" 
							style="width:100%; border-radius:20px;">Login</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="all_component/footer.jsp"%>
</body>

</body>
</html>