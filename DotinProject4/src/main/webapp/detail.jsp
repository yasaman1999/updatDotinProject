<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Insert title here</title>
</head>
<body>
<h1>hellooo</h1>
<form action="showDetail">
<%
int contractPeriod;
int amount;
int customerNumber;
if(request.getParameter("contractPeriod") != null){
	contractPeriod= Integer.parseInt(request.getParameter("contractPeriod"));
	out.print(contractPeriod);
	request.setAttribute("contractPeriod", contractPeriod);
	
}
if(request.getParameter("amount") != null){
	 amount= Integer.parseInt(request.getParameter("amount"));
	 request.setAttribute("amount", amount);
	
}
if(request.getParameter("customerNumber") != null){
	 customerNumber= Integer.parseInt(request.getParameter("customerNumber"));
	 request.setAttribute("customerNumber", customerNumber);
	
}
LoanFileDao loanFileDao = LoanFileDao.getInstance();
LoanFile loanFilesList = (LoanFile) loanFileDao.loanFileDetail(customerNumber,amount,contractPeriod);


%>
</form>
</body>
</html>