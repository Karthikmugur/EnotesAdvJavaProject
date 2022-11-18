<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="mt-2">
		<div class="row" style="justify-content: center;">
			<div class="col-4 p-3">
				<div class="card">
					<div class="card-header"
						style="text-align: center; background: cyan; font-size: 21px;">
						<i class="fa fa-user-plus" aria-hidden="true"></i> REGISTER
					</div>

					<%
					String regMsg = (String) session.getAttribute("reg-success");

					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=regMsg%>
					<div><a href="login.jsp">Click Here</a>  for login</div></div>
					<%
					session.removeAttribute("reg-success");
					}
					%>

					<%
					String failMsg = (String) session.getAttribute("failed-msg");

					if (failMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=failMsg%></div>
					<%
					session.removeAttribute("failed-msg");
					}
					%>

					<div class="card-body">
						<form class="form" action="userServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputName1" class="form-label">Full
									Name</label> <input type="text" class="form-control"
									id="exampleInputName1" name="uname" aria-describedby="nameHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" name="uemail"
									aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="upassword">
							</div>

							<button type="submit" class="btn btn-primary"
								style="width: 100%; border-radius: 20px;">Register</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>