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
	top: 350px;
	padding: 1px;
	height: 195px;
	width: 99.5%;
}

.column3 {
	align: right;
	position: absolute;
	top: 200px;
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

	function init() {
<%Integer customerNumber = (Integer) request.getAttribute("customerNumber");
			if (customerNumber != null && customerNumber != 0) {%>
	document.getElementById("n1").value =
<%=customerNumber%>	
<%}%>
			
<%Integer loanAmountFrom = (Integer) request.getAttribute("loanAmountFrom");
			if (loanAmountFrom != null && loanAmountFrom != 0) {%>
	document.getElementById("n2").value =
<%=loanAmountFrom%>
	
<%}%>

<%Integer loanAmountTo = (Integer) request.getAttribute("loanAmountTo");
			if (loanAmountTo != null && loanAmountTo != 0) {%>
	document.getElementById("n3").value =
<%=loanAmountTo%>
	
<%}%>

<%Integer loanPeriodFrom = (Integer) request.getAttribute("loanPeriodFrom");
			if (loanPeriodFrom != null && loanPeriodFrom != 0) {%>
	document.getElementById("n4").value =
<%=loanPeriodFrom%>
	
<%}%>

<%Integer loanPeriodTo = (Integer) request.getAttribute("loanPeriodTo");
			if (loanPeriodTo != null && loanPeriodTo != 0) {%>
	document.getElementById("n5").value =
<%=loanPeriodTo%>
	
<%}%>
	}
</script>
<body background="background.jpg"
	; style="background-repeat: no-repeat; background-size: cover; padding-top: 50px"; onload="init()">
	<%
		List loanFiles = (ArrayList) session.getAttribute("loanFiles");
	List notActiveloanFiles = (ArrayList) session.getAttribute("notActiveloanFiles");
	Long countActiveLoanFile =(Long) request.getAttribute("countActiveLoanFile");
	if(countActiveLoanFile != null){
		out.print(countActiveLoanFile + ":???????????? ?????? ????????" );
	}
	out.print("<br/>");
	Long countNotActiveLoanFile =(Long) request.getAttribute("countNotActiveLoanFile");
	if(countNotActiveLoanFile != null){
		out.print(countNotActiveLoanFile + ":???????????? ?????? ?????? ????????");
	}

	%>
	<div>
		<a href="loan-file.jsp"> <input type="submit" value="?????????? ????????????"
			size="120"
			style="text-align: center; font-family: courier; margin-left: 20%">
		</a>
	</div>
	
	<br><br><br><br><br>

	
		<div class="column3"
			style=" text-align: center; padding-top: 7%">
			<form action="choose" method="get">
				<table class="table2" id="newTable">
				<caption style="text-align:center;font-family: courier">???????????? ?????? ????????</caption>
					<thead>
						<tr>
							<th>...</th>
							<th>????????</th>
							<th>????????</th>
							<th>?????????? ??????????</th>
							<th>????????</th>
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
							
							<td><a
								href="detail.jsp?contractPeriod=<%=((LoanFile) loanFiles.get(i)).getContractPeriod()%>&amount=<%=((LoanFile) loanFiles.get(i)).getAmount()%>&customerNumber<%=((LoanFile) loanFiles.get(i)).getAmount()%>&customerNumber=<%=((LoanFile) loanFiles.get(i)).getCustomer().getCustomerNumber()%>">????????????</a></td>
							</td>
							<td><%=((LoanFile) loanFiles.get(i)).getContractPeriod()%></td>
							<td><%=((LoanFile) loanFiles.get(i)).getAmount()%></td>
							<td><%=((LoanFile) loanFiles.get(i)).getCustomer().getCustomerNumber()%></td>
							<td><%=i + 1%></td>

						</tr>
						<%
							}
							}
						%>
					</tbody>
				</table>
				
			</form>
			</div>
			
		
		
		
		<div class="column2"
			style=" text-align: center; padding-top: 7%">
			<form action="notactiveLoanFile" method="get">			
				<table class="table2">
				<caption style="text-align:center;font-family: courier">???????????? ?????? ??????  ????????</caption>
					<thead>
						<tr>
							<th>...</th>
							<th>????????</th>
							<th>????????</th>
							<th>?????????? ??????????</th>
							<th>????????</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (notActiveloanFiles == null) {
							}

							else {

								for (int i = 0; i < notActiveloanFiles.size(); i++) {
						%>
						<tr>
							
							<td><a
								href="detail.jsp?contractPeriod=<%=((LoanFile) notActiveloanFiles.get(i)).getContractPeriod() %>&amount=<%=((LoanFile) notActiveloanFiles.get(i)).getAmount()%>&customerNumber<%=((LoanFile) notActiveloanFiles.get(i)).getAmount()%>&customerNumber=<%=((LoanFile) notActiveloanFiles.get(i)).getCustomer().getCustomerNumber()%>">????????????</a></td>
							</td>
							<td><%=((LoanFile) notActiveloanFiles.get(i)).getContractPeriod()%></td>
							<td><%=((LoanFile) notActiveloanFiles.get(i)).getAmount()%></td>
							<td><%=((LoanFile) notActiveloanFiles.get(i)).getCustomer().getCustomerNumber()%></td>
							<td><%=i + 1%></td>

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
						<td style="text-align: right">:?????????? ??????????</td>
					</tr>
					<tr>
						<td><input type="text" name="loanAmountFrom" size="30"
							id="n2" style="margin-left: 3px" /></td>
						<td style="text-align: right">(???????? ?????????????? ????:(????????</td>
					</tr>
					<tr>
						<td><input type="text" name="loanAmountTo" size="30" id="n3"
							style="margin-left: 3px" /></td>
						<td style="text-align: right">(???????? ?????????????? ????:(????????</td>
					</tr>
					<tr>
						<td><input type="text" name="loanPeriodFrom" size="30"
							id="n4" style="margin-left: 3px" /></td>
						<td style="text-align: right">(?????? ?????????????? ????:(??????</td>
					</tr>
					<tr>
						<td><input type="text" name="loanPeriodTo" size="30" id="n5"
							style="margin-left: 3px" /></td>
						<td style="text-align: right">(?????? ?????????????? ????:(??????</td>
					</tr>
					<tr>
						<td style="padding-top: 20px; padding-bottom: 10px"><input
							type="submit" value="??????????" size="120" 
							style="text-align: center; font-family: courier; margin-left: 90%">
						</td>
					</tr>
					<tr>
						<td style="padding-top: 20px; padding-bottom: 10px"><input type="checkbox" name="id" value="see" onchange="this.form.submit()" size="120" 
							style="text-align: center; font-family: courier; margin-right: 90%">
							<td>???????????? ???????????? ?????? ??????????????</td>
						</td>
					</tr>
				</table>
				</div>
		</form>
</body>
</html>