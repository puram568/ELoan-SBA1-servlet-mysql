<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approve Loan</title>
</head>
<body>
	<!--
     Read the values from the admin servlet and cal emi and other details and send to
     to the same admin servlet to update the values in the database 
  -->

	<jsp:include page="header.jsp"></jsp:include>

	<div class="menu" align="right">
		<a href="adminhome1.jsp">Admin Home</a><span>|</span> <a
			href="index.jsp">Logout</a>
	</div>
	<hr />
	
	<form action="admin?action=updatestatus" method="post">

		<div align="center">
			<label for="LoanNo">Loan Application Number : <b>${LoanNo }</b></label> 
		</div>
		<hr />
		<input type="hidden" name="LoanNo" id="LoanNo" value="${LoanNo }">
		<input type="hidden" name="LoanAmount" value=${SanctionedAmount }>
		<input type="hidden" name="Term" value="${Term }"> <input
			type="hidden" name="StartDate" value="${StartDate }"> <input
			type="hidden" name="ClosureDate" value="${ClosureDate }">
		<div align="center">
		<table >
			<tr>
				<th><label for="EMI">EMI Amount</label></th>
				<td><c:choose>
						<c:when test="${EMI==null}">
							<input type="text" name="EMI" readonly>
						</c:when>
						<c:otherwise>
							<input type="text" name="EMI" value=${EMI } readonly>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th><label for="Term Payment Amount">Term Payment
						Amount</label></th>
				<td><c:choose>
						<c:when test="${TermPaymentAmount==null}">
							<input type="text" name="TermPaymentAmount" readonly>
						</c:when>
						<c:otherwise>
							<input type="text" name="TermPaymentAmount"
								value=${TermPaymentAmount } readonly>
						</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
		<input type="submit" value="Approve" >		
		</div>
	</form>
	<hr />

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>