<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
    <%@ page import="com.dotin.bean.LoanFile"%>
    <%@ page import="com.dotin.dao.LoanFileDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Insert title here</title>
<style>


table.table2 {
	align: right;
	display: block;
	/*     white-space: nowrap; */
	display: table;
	width: 600px;
	font-family: courier;
	font-size: 14px;
	border: 1px solid #000;
	border-collapse: collapse;
}

.column2 {
	align: right;
	position: absolute;
	top: 300px;
	padding: 1px;
	height: 195px;
	width: 99.5%;
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
</head>
<body background="background.jpg"
	; style="padding-top: 200px; background-repeat: no-repeat; background-size: cover">
<h2 align="center"
		style="color: black,; font-family: courier; text-shadow: 4px 4px 3px white, 7px 7px 3px silver;">جزئیات پرونده</h2>
<form action="showDetail">
<%
int contractPeriod=0;
int amount=0;
int customerNumber=0;

contractPeriod= Integer.parseInt(request.getParameter("contractPeriod"));


amount= Integer.parseInt(request.getParameter("amount"));


customerNumber= Integer.parseInt(request.getParameter("customerNumber"));

LoanFileDao loanFileDao = LoanFileDao.getInstance();
LoanFile loanFileDetail = (LoanFile) loanFileDao.loanFileDetail(customerNumber,amount,contractPeriod);
%>
</form>
<form action="deleteLoanFile" method="get">
<div class="row">
		<div class="column2">
				<table class="table2" align="center"
			style="border: 1px solid black; width: 700px">
					<thead style="text-align:center;font-family: courier">
						<tr>	
						
							<th>شماره وام</th>
							<th>شماره مشتری</th>
							<th>وضعیت</th>
							<th>مبلغ</th>
							<th>دوره</th>
							
						</tr>
					</thead>
					<tbody>	
						<tr>
							<td><%=loanFileDetail.getLoanType().getId() %></td>
							<td><%=loanFileDetail.getCustomer().getCustomerNumber() %></td>
							<td><%=loanFileDetail.getState() %></td>
							<td><%=loanFileDetail.getAmount() %></td>
							<td><%=loanFileDetail.getContractPeriod()%></td>
							
						</tr>	
					</tbody>
				</table>
				<%
				LoanFile loanFile = loanFileDetail;
				request.setAttribute("loanFile", loanFile);
				
				%>
				<br><br>
				<input
					type="submit" value="غیر فعالسازی  پرونده" size="70"
					style="text-align: center; width: 200px; font-family: courier;align:center;margin-left:42%">
				</div>
				</div>
			</form>
</body>
</html>