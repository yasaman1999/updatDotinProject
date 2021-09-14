<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>تکمیل فرم</title>
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

<script language="Javascript">
	function valid() {
		n1 = document.getElementById("n1")
		n2 = document.getElementById("n2")
		n3 = document.getElementById("n3")
		n4 = document.getElementById("n4")
		n5 = document.getElementById("n5")

		if (n1.value == '') {
			alert("عنوان را وارد کنید");
			n1.focus();
			return false;
		}

		if (n2.value == '') {
			alert("حداقل مدت قرارداد را وارد کنید");
			n2.focus();
			return false;
		}
		if (n3.value == '') {
			alert(" حداکثر مدت قرارداد را وارد کنید");
			n3.focus();
			return false;
		}

		if (n4.value == '') {
			alert("حداقل مبلغ قرارداد را وارد کنید");
			n4.focus();
			return false;
		}

		if (n5.value == '') {
			alert("حداکثر مبلغ قرارداد را وارد کنید");
			n5.focus();
			return false;
		} else {
			return true;
		}
	}

	function addRow() {
		var table = document.getElementById("newTable");
		if (valid()) {
			var row = table.insertRow(1);
			var cell0 = row.insertCell(0);
			var cell1 = row.insertCell(1);
			var cell2 = row.insertCell(2);
			var cell3 = row.insertCell(3);
			var cell4 = row.insertCell(4);
			cell0.innerHTML = n5.value;
			cell1.innerHTML = n4.value;
			cell2.innerHTML = n3.value;
			cell3.innerHTML = n2.value;
			cell4.innerHTML = n1.value;

			document.getElementById("n1").value = "";
			document.getElementById("n2").value = "";
			document.getElementById("n3").value = "";
			document.getElementById("n4").value = "";
			document.getElementById("n5").value = "";
		}
	}

	function submitGrantConditions() {
		var container = document.getElementById("container");

		var myTab = document.getElementById('newTable');

		// loop through each row of the table.
		for (row = 1; row < myTab.rows.length; row++) {
			// loop through each cell in a row.
			var rowValue = myTab.rows.item(row).cells[0].innerHTML;
			for (c = 1; c < myTab.rows[row].cells.length; c++) {
				var element = myTab.rows.item(row).cells[c];
				rowValue = rowValue + '#' + element.innerHTML;
			}
			var input = document.createElement("input");
			input.type = "text";
			input.name = "grantCondition";
			input.value = rowValue;
			container.appendChild(input);
		}
	}
</script>
</head>

<body background="background.jpg"
	; style="background-repeat: no-repeat; background-size: cover; padding-top: 50px;">

	<%
		String name = (String) request.getAttribute("name");
		int interestRate = (Integer) request.getAttribute("interestRate");
		session.setAttribute("name", name);
		session.setAttribute("interestRate", interestRate);
	%>

	<div class="row">
		<div class="column2" style="overflow-y: scroll; text-align: center">
			<table class="table2" id="newTable" style="overflow-y: scroll">
				<caption
					style="text-align: right; font-family: courier; font-size: 16px">شرایط
					اعطا تعریف شده</caption>
				<tr>
					<th>حداکثر مبلغ قرارداد</th>
					<th>حداقل مبلغ قرارداد</th>
					<th>حداکثر مدت قرارداد</th>
					<th>حداقل مدت قرارداد</th>
					<th>عنوان</th>
				</tr>
			</table>
		</div>
		<div class="column1">
			<table class="table1" align="right" id="myTable">
				<caption style="text-align: right; font-family: courier">تعریف
					شرایط اعطا</caption>
				<tr>
					<td><input dir="rtl" type="text" name="name" size="30" id="n1"
						style="margin-left: 3px" /></td>
					<td style="text-align: right">:عنوان</td>
				</tr>
				<tr>
					<td><input type="text" name="minimumContractPeriod" size="30"
						id="n2" style="margin-left: 3px" /></td>
					<td style="text-align: right">(حداقل مدت قرارداد:(ماه</td>
				</tr>
				<tr>
					<td><input type="text" name="maximumContractPeriod" size="30"
						id="n3" style="margin-left: 3px" /></td>
					<td style="text-align: right">(حداکثرمدت قرارداد:(ماه</td>
				</tr>
				<tr>
					<td><input type="text" name="minimumContractAmount" size="30"
						id="n4" style="margin-left: 3px" /></td>
					<td style="text-align: right">(حداقل مبلغ قرارداد:(ریال</td>
				</tr>
				<tr>
					<td><input type="text" name="maximumContractAmount" size="30"
						id="n5" style="margin-left: 3px" /></td>
					<td style="text-align: right">(حداکثر مبلغ قرارداد:(ریال</td>
				</tr>
				<tr>
					<td style="padding-top: 20px; padding-bottom: 10px">
						<button type="button" onclick="addRow()"
							style="text-align: center; font-family: courier; margin-left: 90%">اضافه</button>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<form name="notnull" action="registrationofGrantConditions"
		method="get" onsubmit="return submitGrantConditions()">
		<div id="container"></div>
		<input type="submit" value="ثبت" size="120"
			style="text-align: center; font-family: courier; margin-left: 49%; margin-top: 40%">
	</form>
</body>
</html>