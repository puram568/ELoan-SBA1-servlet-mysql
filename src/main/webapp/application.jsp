<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Application Form</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body onload="myFunction()">

	<!--
	write the html code to accept laon info from user and send to placeloan servlet
-->
	<jsp:include page="header.jsp"></jsp:include>



	<div align="center">
		<h2>Apply Mortgage Loan</h2>
		<form action="user?action=placeloan" method="post">

			<div class="menu" align="right">
				<a href="userhome.jsp">Home</a><span>|</span> <a href="index.jsp">Logout</a>
			</div>
			<hr />
			<table>
				<tr>
					<td>
<%-- 						<% --%>
<!-- // 							int randomNumber = (int) (Math.random() * 1000000); -->
<%-- 						%>  --%>
<!-- 						<label -->
<!-- 						for="loanAppNum">Loan Application Number</label> -->
<!-- 					</td> -->
					<td><input type="hidden" id="loanAppNum" name="loanAppNum"/></td>
				</tr>
				<tr>
					<td><label for="loanName">Purpose</label></td>
					<td><input type="text" id="loanName" name="loanName" required/></td>
				</tr>

				<tr>
					<td><label for="loanAmount">Desired Loan Amount</label></td>
					<td><input type="text" id="loanAmount" name="loanAmount" required/></td>
				</tr>
				<tr>
					<td><label for="loanAppDate">Application Date</label></td>
					<td><input type="date" id="loanAppDate" name="loanAppDate" required/></td>
				</tr>
				<tr>
					<td><label for="businessStructure">Individual / Organization</label>
					</td>
					<td><select id="businessStructure" name="businessStructure">
					<option value="Individual">Individual</option>
  					<option value="Organization">Organization</option>
					</select>
					</td>
				</tr>
				<tr>
					<td><label for="billingIndicator">Is Salaried?</label></td>
					<td><select id="billingIndicator" name="billingIndicator">
					<option value="Yes">Yes</option>
  					<option value="No">No</option>
					</select>
					</td>
				</tr>

				<tr>
					<td><label for="taxIndicator">Is Tax Payer?</label></td>
					<td><select id="taxIndicator" name="taxIndicator">
					<option value="Yes">Yes</option>
  					<option value="No">No</option>
					</select>
					</td>
				</tr>
				<tr>
					<td><b>Contact Details</b></td>
				</tr>
				<tr>
					<td><label for="address">Address</label></td>
					<td><input type="text" id="address" name="address" required ></td>
				</tr>
				<tr>
					<td><label for="mobile">Mobile</label></td>
					<td><input type="text" id="mobile" name="mobile" required pattern="[1-9][0-9]{9}"/></td>
				</tr>
				<tr>
					<td><label for="email">Email</label></td>
					<td><input type="text" id="email" name="email" required /></td>
				</tr>

			</table>
			<hr />
			<div>
				<div>
					<input type="submit" value="Apply">
				</div>
			</div>
		</form>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>