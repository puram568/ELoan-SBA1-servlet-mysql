<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register New User</title>
<jsp:include page="header.jsp" />

</head>

<body>
	<!-- read user name and password from user to create account
	     and send to usercontrollers registeruser method
	-->
	<form action="user?action=registernewuser" method="post">
		<hr />
		<div align=center>
			<h2>Register New User</h2>
			<div>
				<div>
					<label for="usrName">Enter Username</label><br> <input
						type="text" id="usrName" name="usrName" required>
				</div>
				<div>
					<label for="password">Enter Password</label> <br> <input
						type="password" id="password" name="password" onkeyup=check() required>
				</div>
				<div>
					<label for="confirmPwd">Confirm Password</label> <br> <input
						type="password" id="confirmPwd" name="confirmPwd" onkeyup=check()
						required /> 
						<div> <span id='message'></span></div>
						
				</div>
				<br>
				<div>
					<input type="submit" value="Register">
				</div>
			</div>
		</div>
		<hr />
	</form>
	<script>
	
	var check = function() {
		  if (document.getElementById("password").value ==
		    document.getElementById("confirmPwd").value) {
		    document.getElementById("message").style.color = 'green';
		    document.getElementById("message").innerHTML = 'Matching';
		  } else {
		    document.getElementById("message").style.color = 'red';
		    document.getElementById("message").innerHTML = 'Not Matching';
		  }
		}
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>