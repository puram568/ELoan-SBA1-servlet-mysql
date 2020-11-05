<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Loan Application</title>
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
	<!-- read the application number to edit from user and send to 
	     user controller to edit info
	-->
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="menu" align="right">
			<a href="userhome.jsp">Home</a><span>|</span> <a
				href="index.jsp">Logout</a>
		</div>
		<hr/>
	<c:choose>
		<c:when test="${loanList==null || loanList.isEmpty() }">
			<p>No Records Fetched</p>
		</c:when>
		<c:otherwise>
			<div align="center">
				<table>
					<thead>
						<tr>
							<th>Application Number</th>
							<th>Status</th>
					</thead>
					<tbody>
						<c:forEach var="c" items="${loanList }">
							<tr>
								<c:if test="${c.status =='Pending'}">
									<td><a href="user?action=editloan&loanNum=${c.applno }">${c.applno }</a>
									</td>
								</c:if>
								<c:if test="${c.status =='Approved'}">
									<td>${c.applno }</td>
								</c:if>
								<td>${c.status }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
	<hr/>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>