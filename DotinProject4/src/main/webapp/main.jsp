<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<title>welcome</title>
<body background="background.jpg"
	; style="padding-top: 200px; background-repeat: no-repeat; background-size: cover">
	<h2 align="center"
		style="color: black,; font-family: courier; text-shadow: 4px 4px 3px white, 7px 7px 3px silver;">به
		سیستم بانکداری خوش آمدید</h2>
	<br></br>
	<form action="addCustomer" method="get">
		<table align="center">
			<tr>
				<td style="padding-top: 20px; padding-bottom: 20px"><input
					type="submit" value="تعریف مشتری" size="70"
					style="text-align: center; width: 200px; font-family: courier"></td>
			</tr>
		</table>
	</form>

	<form action="chooseLoanType" method="get">
		<table align="center">
			<tr>
				<td style="padding-top: 20; padding-bottom: 20px"><input
					type="submit" value=" تعریف نوع تسهیلات " size="70"
					style="text-align: center; width: 200px; font-family: courier"></td>
			</tr>
		</table>
	</form>

	<form action="loanFile" method="get">
		<table align="center">
			<tr>
				<td style="padding-top: 20; padding-bottom: 20px"><input
					type="submit" value="تشکیل پرونده" size="70"
					style="text-align: center; width: 200px; font-family: courier"></td>
			</tr>
		</table>
	</form>
	
	<form action="loanFileManagment" method="get">
		<table align="center">
			<tr>
				<td style="padding-top: 20; padding-bottom: 20px"><input
					type="submit" value="مدیریت پرونده" size="70"
					style="text-align: center; width: 200px; font-family: courier"></td>
			</tr>
		</table>
	</form>
</body>
</html>