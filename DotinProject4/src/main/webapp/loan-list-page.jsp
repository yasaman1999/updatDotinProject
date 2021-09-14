<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Insert title here</title>
<script language="Javascript">
	function valid() {

		a = document.getElementById("n1")
		b = document.getElementById("n2")
		c = document.getElementById("n3")

		if (a.value == 0) {
			alert("نوع تسهیلات را مشخص کنید");
			a.focus();
			return false;
		}

		if (b.value == '') {
			alert("مدت قرارداد را مشخص کنید");
			b.focus();
			return false;
		}

		if (c.value == '') {
			alert("مبلغ قرارداد را مشخص کنید");
			c.focus();
			return false;
		}

	}
</script>
</head>
<body background="background.jpg"
	; style="padding-top: 10px; background-repeat: no-repeat; background-size: cover; width: 460px; margin: auto;">
	<%
		List<Object[]> list = (List<Object[]>) request.getAttribute("list");
	%>

	<form action="checkInfo">
		<table align="right"
			style="border-color: black; border-width: 1px; border-top: 1px solid black; border-right: 1px solid black; border-left: 1px solid black; width: 440px">
			<tr>
				<td><select
					style="box-shadow: 0px 6px 12px 0px rgba(0, 0, 0, 0.2); width: 150px; height: 20px"
					name="loanTypeId" id="n1">
						<option value=0 selected>-----</option>
						<%
							for (Object[] LoanType : list) {
								int id = (Integer) LoanType[0];
								String name = (String) LoanType[1];
						%>
						<option value="<%=id%>">
							<%=name%>
						</option>
						<%
							}
						%>

				</select>
				<td style="text-align: right; font-family: courier">:نوع
					تسهیلات</td>
			</tr>
			<tr>
				<td style="padding-top: 20px"><input type="text"
					name="contractPeriod" size="30" id="n2" /></td>
				<td
					style="padding-top: 20px; text-align: right; font-family: courier">
					(مدت قرارداد:(ماه</td>
			</tr>
			<tr>
				<td><input type="text" name="amount" size="30" id="n3" /></td>
				<td style="text-align: right; font-family: courier">(مبلغ
					قرارداد:(ریال</td>
			</tr>
			<tr>
				<td align="center"
					style="padding-left: 190px; padding-top: 30px; font-family: verdana">
					<input type="submit" value="ثبت" onclick="return valid()"
					size="120" style="text-align: center; font-family: courier">
				</td>
			</tr>
		</table>
	</form>

	<form action="backToMainPage" method="get">
		<table align="right"
			style="border-right: 1px solid black; border-left: 1px solid black; border-bottom: 1px solid black; width: 440px">
			<tr>
				<td align="center"
					style="padding-top: 20px; padding-left: 15px; font-family: courier">

					<input type="submit" value="بازگشت" size="30"
					style="text-align: center; font-family: courier">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>