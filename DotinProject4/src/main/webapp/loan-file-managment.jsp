<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.dotin.bean.LoanFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
}

.row {
	margin-left: -5px;
	margin-right: -5px;
}

.column1 {
	margin-left: 49%;
	position: absolute;
	top: 20px;
	width: 50%;
	padding: 1px;
	height: 380px;
}

.column2 {
	align: right;
	position: absolute;
	top: 300px;
	padding: 1px;
	height: 195px;
	width: 99.5%;
}

table.table1 {
	align: right;
	border-spacing: 0;
	width: 470px;
	border: 1px solid black;
	margin: auto;
}

table.table2 {
	align: right;
	display: block;
	/*     white-space: nowrap; */
	display: table;
	width: 99.5%;
	font-family: courier;
	font-size: 14px;
	border: 1px solid #000;
	border-collapse: collapse;
}

table.table1 td {
	border: 1px #000;
	font-family: courier;
	font-size: 14px;
}

table.table2 td {
	color: black;
	vertical-align: middle;
	text-align: center;
	border: 1px solid #000;
	font-family: courier;
	font-size: 14px;
}

table.table2 th {
	color: #000;
	vertical-align: middle;
	text-align: center;
	border: 1px solid #000;
	font-family: courier;
	font-size: 14px;
}
</style>
<script type="text/javascript">
	function deleteValue() {

		document.getElementById("n1").defaultValue = 0;
		document.getElementById("n2").defaultValue = 0;
		document.getElementById("n3").defaultValue = 0;
		document.getElementById("n4").defaultValue = 0;
		document.getElementById("n5").defaultValue = 0;
	}
</script>
<body background="background.jpg"
	; style="background-repeat: no-repeat; background-size: cover; padding-top: 50px;">
	<%
		List loanFiles = (ArrayList) session.getAttribute("loanFiles");
	%>
	<div>
		<a href="loan-file.jsp"> <input type="submit" value="تشکیل پرونده"
			size="120"
			style="text-align: center; font-family: courier; margin-left: 20%">
		</a>
	</div>
	<div class="row">
		<div class="column2"
			style="overflow-y: scroll; text-align: center; padding-top: 7%">
			<form action="choose" method="get">
				<table class="table2" id="newTable" style="overflow-y: scroll">
					<thead>
						<tr>
							<th>دوره</th>
							<th>مبلغ</th>
							<th>شماره مشتری</th>
							<th>ردیف</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (loanFiles == null) {
							}

							else {

								for (int i = 0; i < loanFiles.size(); i++) {
						%>
						<tr>
							<td id="1"><a href="detail.jsp"><%=((LoanFile) loanFiles.get(i)).getContractPeriod()%></a></td>
							<td id="2"><a href="detail.jsp"><%=((LoanFile) loanFiles.get(i)).getAmount()%></a></td>
							<td id="3"><a href="detail.jsp"><%=((LoanFile) loanFiles.get(i)).getCustomer().getCustomerNumber()%></a></td>
							<td id="4"><%=i + 1%></td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
				</table>
			</form>
		</div>

		<form action="search" method="get">
			<div class="column1">
				<table class="table1" align="right">
					<tr>
						<td><input type="text" name="customerNumber" size="30"
							id="n1" style="margin-left: 3px" /></td>
						<td style="text-align: right">:شماره مشتری</td>
					</tr>
					<tr>
						<td><input type="text" name="loanAmountFrom" size="30"
							id="n2" style="margin-left: 3px" /></td>
						<td style="text-align: right">(مبلغ تسهیلات از:(ریال</td>
					</tr>
					<tr>
						<td><input type="text" name="loanAmountTo" size="30" id="n3"
							style="margin-left: 3px" /></td>
						<td style="text-align: right">(مبلغ تسهیلات تا:(ریال</td>
					</tr>
					<tr>
						<td><input type="text" name="loanPeriodFrom" size="30"
							id="n4" style="margin-left: 3px" /></td>
						<td style="text-align: right">(مدت تسهیلات از:(ماه</td>
					</tr>
					<tr>
						<td><input type="text" name="loanPeriodTo" size="30" id="n5"
							style="margin-left: 3px" /></td>
						<td style="text-align: right">(مدت تسهیلات تا:(ماه</td>
					</tr>
					<tr>
						<td style="padding-top: 20px; padding-bottom: 10px"><input
							type="submit" value="جستجو" size="120" onclick="deleteValue()"
							style="text-align: center; font-family: courier; margin-left: 90%">
						</td>
					</tr>
				</table>
		</form>
	</div>
	</div>
</body>
</html>