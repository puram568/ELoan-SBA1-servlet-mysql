<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Track Loan Status</title>
<style type="text/css">
table,td,th{
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
   border-collapse: collapse; 
}
</style>
</head>
<body>
	<!-- write html code to read the application number and send to usercontrollers'
             displaystatus method for displaying the information
	-->
	
	
	
		<jsp:include page="header.jsp"></jsp:include>
	<form method="post" action="user?action=trackloan">
		<div class="menu" align="right">
			<a href="userhome.jsp">Home</a><span>|</span> <a
				href="index.jsp">Logout</a>
		</div>
		<c:choose>
		<c:when test="${loanList==null || loanList.isEmpty() }">
				<p>No Records Fetched</p>
			</c:when>
			<c:otherwise>
			<table>
					<thead>
						<tr>
							<th>Application Number</th>
							<th>Status</th>
					</thead>
					<tbody>
						<c:forEach var="c" items="${loanList }">
							<tr>
								<td>${c.applno }</td>
								<td>${c.status }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
			</c:choose>	
	</form>
</body>
</html>