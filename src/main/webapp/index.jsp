<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img{
background: url("img/Enote.webp");
wight:100%;
height:90vh;
background-repeat: no-repeat;
background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>

<%@ include file="all_component/navbar.jsp" %>

<div class="back-img">
<div style="text-align: center; color: black; font-size:27px; font-weight: bold; padding-top:21px;">
ENotes - Save Your Notes Here
</div>
<div style="text-align: center; color: black; font-size:27px; font-weight: bold; padding-top:21px;">
REGISTER and LOGIN to Add Your Notes
</div>
</div>

<%@ include file="all_component/footer.jsp" %>

</body>
</html>