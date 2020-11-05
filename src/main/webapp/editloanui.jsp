<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Loan Process</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="menu" align="right">
			<a href="userhome.jsp">Home</a><span>|</span> <a
				href="index.jsp">Logout</a>
		</div>
		<hr/>
	<div align="center">
			<form action="user?action=editLoanProcess" method="post">
			<c:choose>
				<c:when test="${editedLoanInfo==null || editedLoanInfo.isEmpty() }">
					<p>No Records Fetched</p>
				</c:when>
				<c:otherwise>
						
					<table>
						<c:forEach var="c" items="${editedLoanInfo }">
						<h3>Loan Application No : ${c.applno }</h3>
						<tr>
								<td><input type="hidden" id="loanAppNum" name="loanAppNum"
									value="${c.applno }"></td>
							</tr>
							<tr>
								<td><label for="loanName">Purpose</label></td>
								<td><input type="text" id="loanName" name="loanName"
									value="${c.purpose }" required></td>
							</tr>

							<tr>
								<td><label for="loanAmount">Desired Loan Amount</label></td>
								<td><input type="text" id="loanAmount" name="loanAmount"
									value="${c.amtrequest }" required></td>
							</tr>
							<tr>
								<td><label for="loanAppDate">Application Date</label></td>
								<td><input type="date" id="loanAppDate" name="loanAppDate"
									value="${c.doa }" required></td>
							</tr>
							<tr>
								<td><label for="businessStructure">Individual /
										Organization</label></td>
								<c:if test="${c.bstructure =='Individual'}">
										<td><select id="businessStructure"
											name="businessStructure">
												<option value="Individual" selected>Individual</option>
												<option value="Organization">Organization</option>
										</select></td>
									</c:if> <c:if test="${c.bstructure =='Organization'}">
										<td><select id="businessStructure"
											name="businessStructure">
												<option value="Individual">Individual</option>
												<option value="Organization" selected>Organization</option>
										</select></td>
									</c:if>
							</tr>
							<tr>
								<td><label for="billingIndicator">Is Salaried?</label></td>
								<c:if test="${c.bindicator =='Yes'}">
										<td><select id="billingIndicator" name="billingIndicator">
												<option value="Yes" selected>Yes</option>
												<option value="No">No</option>
										</select></td>
									</c:if> <c:if test="${c.bindicator =='No'}">
										<td><select id="billingIndicator" name="billingIndicator">
												<option value="Yes">Yes</option>
												<option value="No" selected>No</option>
										</select></td>
									</c:if>
							</tr>
							<tr>
								<td><label for="taxIndicator">Is Tax Payer?</label></td>
								<c:if test="${c.taxindicator =='Yes'}">
										<td><select id="taxIndicator" name="taxIndicator">
												<option value="Yes" selected>Yes</option>
												<option value="No">No</option>
										</select></td>
									</c:if> <c:if test="${c.taxindicator =='No'}">
										<td><select id="taxIndicator" name="taxIndicator">
												<option value="Yes">Yes</option>
												<option value="No" selected>No</option>
										</select></td>
									</c:if>

							</tr>
							<tr>
								<td><b>Contact Details</b></td>
							</tr>
							<tr>
								<td><label for="address">Address</label></td>
								<td><input type="text" id="address" name="address"
									value="${c.address }" required></td>
							</tr>
							<tr>
								<td><label for="mobile">Mobile</label></td>
								<td><input type="text" id="mobile" name="mobile"
									value="${c.mobile }" required pattern="[1-9][0-9]{9}"></td>
							</tr>
							<tr>
								<td><label for="email">Email</label></td>
								<td><input type="text" id="email" name="email"
									value="${c.email }" required></td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
			<hr />
			<div>
				<div>
					<input type="submit" value="Update">
				</div>
			</div>
		</form>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>