<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display All Loans</title>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

th {
	background-color: #add8e6;
}
td, th {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>
	<!-- write code to display all the loan details 
             which are received from the admin controllers' listall method
	-->
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="menu" align="right">
		<a href="adminhome1.jsp">Admin Home</a><span>|</span> <a
			href="index.jsp">Logout</a>
	</div>
	<hr />
	
	<div align="center" style="color:red">
		<h3 >
			<b>All Loan Details</b>
		</h3>
	</div>

	<c:choose>
		<c:when test="${loanList==null || loanList.isEmpty() }">
			<p>No Records Fetched</p>
		</c:when>
		<c:otherwise>
			<table>
				<thead>
					<tr>
						<th>Loan Application No</th>
						<th>Description</th>
						<th>Loan Amount</th>
						<th>Application Date</th>
						<th>Individual/Organization</th>
						<th>Is Salaried?</th>
						<th>Is Tax Payer?</th>
						<th>Address</th>
						<th>Mobile</th>
						<th>Email</th>
						<th>Status</th>
				</thead>
				<tbody>
					<c:forEach var="c" items="${loanList }">
						<tr>
							<c:if test="${c.status=='Pending' }">
								<td align="center"><a
									href="admin?action=process&applno=${c.applno }&amt=${c.amtrequest }">${c.applno }
								</a></td>
							</c:if>
							<c:if test="${c.status=='Approved' }">
								<td align="center">${c.applno }</td>
							</c:if>
							<td align="center">${c.purpose }</td>
							<td align="center">${c.amtrequest }</td>
							<td align="center">${c.doa }</td>
							<td align="center">${c.bstructure }</td>
							<td align="center">${c.bindicator }</td>
							<td align="center">${c.taxindicator }</td>
							<td align="center">${c.address }</td>
							<td align="center">${c.mobile }</td>
							<td align="center">${c.email }</td>
							<td align="center">${c.status }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>	
	<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>