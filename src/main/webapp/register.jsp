<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register New User</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<hr />
	<div align=center>

		<h2>eLoan Login</h2>
		<form action="user?action=validate" method="post">
			<div>
				<div>
					<label for="loginid">Enter login Id</label>
				</div>
				<div>
					<input type="text" id="loginid" name="loginid">
				</div>
			</div>
			<div>
				<div>
					<label for="password">Enter password</label>
				</div>
				<div>
					<input type="password" id="password" name="password">
				</div>
			</div>
			<div>
				<div>
					<input type="submit" value="Login">
				</div>
			</div>
			<div>
				<a href="user?action=registeruser">New User? register here</a>
			</div>		
		</form>
	</div>
	<hr />
	<jsp:include page="footer.jsp" />
</body>
</html>