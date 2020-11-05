<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user home</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h4>User Dash Board</h4>
<div align="right"><a href="index.jsp">Logout</a></div>
<a href="user?action=application1">Apply for Loan</a><br>
<a href="user?action=trackloan">Track Loan Application</a><br>
<a href="user?action=displaystatus">Edit Loan Application</a>

<c:choose>
<c:when test="${msg==null}">
</c:when>
<c:otherwise>
<div align="center" style="color:blue">"${msg }"</div>
</c:otherwise>
</c:choose>
<jsp:include page="footer.jsp"/>
</body>
</html>