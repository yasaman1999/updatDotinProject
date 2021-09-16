<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ page import="com.dotin.bean.LoanFile"%>
    <%@ page import="com.dotin.dao.LoanFileDao"%>
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
int contractPeriod=0;
int amount=0;
int customerNumber=0;
if(request.getParameter("contractPeriod") != null){
	contractPeriod= Integer.parseInt(request.getParameter("contractPeriod"));
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
LoanFile loanFileDetail = (LoanFile) loanFileDao.loanFileDetail(customerNumber,amount,contractPeriod);
%>
</form>
</body>
</html>