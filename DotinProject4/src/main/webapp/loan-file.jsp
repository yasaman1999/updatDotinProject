<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Insert title here</title>
<script language="Javascript">

function valid() {
	a = document.getElementById("n1")

	if (a.value == '') {
		alert("شماره مشتری را وارد کنید");
		a.focus();
		return false;
	}
}

function init() {
	<%String customerSearch = (String) request.getAttribute("customerSearch");
			if (customerSearch != null) {%>
			document.getElementById("n1").value = <%=customerSearch%>	
	<%}%>
	}
</script>

</head>
<body background="background.jpg"
	; style="padding-top: 10px; background-repeat: no-repeat; background-size: cover"
	; onload="init()">
	<form action="checkCustomer" method="get">
		<table align="center"
			style="border-color: black; border-width: 1px; border-top: 1px solid black; border-right: 1px solid black; border-left: 1px solid black; width: 390px">
			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="customerNumber" size="30" id="n1" /></td>
				<td
					style="padding-top: 5px; font-family: verdana; text-align: right; font-family: courier">:شماره
					مشتری</td>
			<tr>
				<td align="center"
					style="padding-left: 120px; padding-top: 40px; font-family: courier">
					<input type="submit" value="بازیابی" onclick="return valid()"
					size="100" style="text-align: center; font-family: courier">
				</td>
			</tr>
			</table>
			<table align="center"
			style="border-right: 1px solid black; border-left: 1px solid black; width: 390px">
			<tr>
				<td align="center"
					style="font-family: courier; padding-top: 30px;text-align:center">

					<%
						String customerName = (String) request.getAttribute("name");
						String customerFamily = (String) request.getAttribute("family");
						String nationalCode = (String) request.getAttribute("nationalCode");

						if (customerName != null) {
							out.print(customerName + " " + customerFamily +" "+ "با کد ملی" +" " + nationalCode);
						} else {
							if (customerSearch != null) {
								
								out.print("مشتری با شماره ی" +" "+ customerSearch+" " + "در سیستم موجود نمیباشد");
							}
						}
					%>
				</td>
			</tr>
		</table>
	</form>

	<form action="goToLoanListPage" method="get">
		<table align="center"
			style="border-right: 1px solid black; border-left: 1px solid black; width: 390px">
			<tr>
				<td align="center"
					style="padding-left: 140px; padding-top: 20px; padding-right: 140px; font-family: courier">
					<input type="submit" value="تایید" size="100"
					onclick="return valid()"
					style="text-align: center; font-family: courier">
				</td>
			</tr>
		</table>
	</form>

	<form action="backToMainPage" method="get">
		<table align="center"
			style="border-right: 1px solid black; border-left: 1px solid black; border-bottom: 1px solid black; width: 390px">
			<tr>
				<td align="center"
					style="padding-left: 140px; padding-top: 20px; padding-right: 140px; font-family: courier">
					<input type="submit" value="بازگشت" size="100"
					style="text-align: center; font-family: courier">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>