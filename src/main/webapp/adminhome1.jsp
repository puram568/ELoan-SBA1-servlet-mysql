<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin home</title>
</head>
<body>

<jsp:include page="header.jsp"/>
<div align="right"><a href="index.jsp">Logout</a></div>
<h4>Admin Dash Board</h4>
<a href="admin?action=listall">List All</a><br>
<!-- <a href="admin?action=process">Process Loan</a><br> -->

<c:if test="${msg!=null }">
<div align="center" style="color:blue"><h1>${msg }</h1></div>
</c:if>

<jsp:include page="footer.jsp"/>
</body>
</html>