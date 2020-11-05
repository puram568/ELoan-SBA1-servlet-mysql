<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Process Loan</title>
<style>
table, th, td {
/*   border: 1px solid black; */
/*   border-collapse: collapse; */
}
</style>
</head>
<body>
	<!-- write the code to read application number, and send it to admincontrollers
	     callemi method to calculate the emi and other details also provide links
	     to logout and admin home page
	-->
	
	<jsp:include page="header.jsp"></jsp:include>

	<div class="menu" align="right">
		<a href="adminhome1.jsp">Admin Home</a><span>|</span> <a
			href="index.jsp">Logout</a>
	</div>
	<hr />
	<form method="post" action="admin?action=callemi">
		<div align="center">
			<label for="LoanNo">Loan Application Number : </label>
			<c:choose>
				<c:when test="${LoanNo==null}">
					<label><b><%=request.getParameter("applno")%></b></label>
					<input type="hidden" name="LoanNo" id="LoanNo" value=<%=request.getParameter("applno")%>>
 				</c:when>
				<c:otherwise>
					<input type="text" name="LoanNo" value=${LoanNo } readonly >
				</c:otherwise>
			</c:choose>
		</div>
		<hr />
		<table >
			<tr>
				<th><label for="LoanAmount">Sanctioned Amount</label></th>
				<td><c:choose>
						<c:when test="${SanctionedAmount==null}">
							<input type="text" name="LoanAmount"
								value=<%=request.getParameter("amt")%> >
						</c:when>
						<c:otherwise>
							<input type="text" name="LoanAmount" value=${SanctionedAmount } />
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th><label for="Term">Term in Months</label></th>
				<td><c:choose>
						<c:when test="${Term==null}">
							<input type="text" id="Term" name="Term" value="60" />
						</c:when>
						<c:otherwise>
							<input type="text" id="Term" name="Term" value=${Term } />
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th><label for="StartDate">Start Date</label></th>
				<td><c:choose>
						<c:when test="${StartDate==null}">
							<input type="date" id="StartDate" name="StartDate"
								pattern="yyyy-mm-dd" onchange="myFunction()" />
						</c:when>
						<c:otherwise>
							<input type="date" id="StartDate" name="StartDate"
								pattern="yyyy-mm-dd" onchange="myFunction()" value=${StartDate } />
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
			<th><label for="ClosureDate">Closure Date</label></th>
			<td><c:choose>
					<c:when test="${ClosureDate==null}">
						<input type="text" id="ClosureDate" name="ClosureDate" readonly />
					</c:when>
					<c:otherwise>
						<input type="text" id="ClosureDate" name="ClosureDate"
							value=${ClosureDate } readonly />
					</c:otherwise>
				</c:choose></td>
			</tr>
			<tr>
				<td><input type="submit" value="Calculate EMI" /></td>
			</tr>
		</table>
	</form>
	<hr/>
	<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript">
		function myFunction() {

			var date = new Date(document.getElementById("StartDate").value);
			var term = document.getElementById("Term").value;
			var closeDate = new Date(date.setMonth(date.getMonth()
					+ parseInt(term)));

			var endDate = (((closeDate.getDate() > 9) ? closeDate.getDate()
					: ('0' + closeDate.getDate()))
					+ '-'
					+ ((closeDate.getMonth() > 8) ? (closeDate.getMonth() + 1)
							: ('0' + (closeDate.getMonth() + 1))) + '-' + closeDate
					.getFullYear());

			document.getElementById("ClosureDate").value = endDate;

		}
</script>

</body>
</html>