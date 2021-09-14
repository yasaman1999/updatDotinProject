<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>تکمیل فرم</title>
</head>
<body background="background.jpg"
	; style="background-repeat: no-repeat; background-size: cover; padding-top: 10px">

	<script language="Javascript">
		function valid() {
			a = document.getElementById("n1")
			b = document.getElementById("n2")
			c = document.getElementById("n3")
			d = document.getElementById("n4")
			e = document.getElementById("n5")
			f = document.getElementById("n6")
			g = document.getElementById("n7")
			h = document.getElementById("n8")
			i = document.getElementById("n9")
			j = document.getElementById("n10")

			if (a.value == '') {
				alert("نام را وارد کنید");
				a.focus();
				return false;
			}

			if (b.value == '') {
				alert("نام خانوادگی را وارد کنید");
				b.focus();
				return false;
			}

			if (c.value == '') {
				alert(" نام پدر را وارد کنید");
				c.focus();
				return false;
			}

			if (d.value == '') {
				alert("جنسیت را وارد کنید");
				d.focus();
				return false;
			}

			if (e.value == '') {
				alert("تاریخ تولد را وارد کنید");
				e.focus();
				return false;
			}

			if (f.value == '') {
				alert(" کدملی را وارد کنید");
				f.focus();
				return false;
			}

			if (g.value == '') {
				alert("محل تولد را وارد کنید");
				g.focus();
				return false;
			}

			if (h.value == '') {
				alert("آدرس پستی را وارد کنید");
				h.focus();
				return false;
			}

			if (i.value == '') {
				alert("موبایل را وارد کنید");
				i.focus();
				return false;
			}

			if (j.value == '') {
				alert(" تلفن را وارد کنید");
				j.focus();
				return false;
			}

		}
	</script>

	<form action="addCustomerSuccess" method="get">
		<table align="center"
			style="border-color: black; border-width: 1px; border-top: 1px solid black; border-right: 1px solid black; border-left: 1px solid black; width: 410px">

			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="name" size="30" id="n1" /></td>
				<td
					style="padding-top: 5px; text-align: right; font-family: courier">:نام</td>
			</tr>
			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="family" size="30" id="n2" /></td>
				<td
					style="padding-top: 5px; text-align: right; font-family: courier">:نام
					خانوادگی</td>
			</tr>
			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="fatherName" size="30" id="n3" /></td>
				<td
					style="padding-top: 5px; text-align: right; font-family: courier">:نام
					پدر</td>
			</tr>
			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="gender" size="30" id="n4" /></td>
				<td
					style="padding-top: 5px; text-align: right; font-family: courier">:جنسیت</td>
			</tr>
			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="birthday" size="30" id="n5" /></td>
				<td
					style="padding-top: 5px; text-align: right; font-family: courier">:تاریخ
					تولد</td>
			</tr>
			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="nationalCode" size="30" id="n6" /></td>
				<td
					style="padding-top: 5px; text-align: right; font-family: courier">:کدملی
				</td>
			</tr>
			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="placeOfBirth" size="30" id="n7" /></td>
				<td
					style="padding-top: 5px; text-align: right; font-family: courier">:محل
					تولد</td>
			</tr>
			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="address" size="30" id="n8" /></td>
				<td
					style="padding-top: 5px; text-align: right; font-family: courier">:آدرس</td>
			</tr>
			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="mobileNumber" size="30" id="n9" /></td>
				<td
					style="padding-top: 5px; text-align: right; font-family: courier">:موبایل</td>
			</tr>
			<tr>
				<td style="padding-top: 5px"><input dir="rtl" type="text"
					name="phoneNumber" size="30" id="n10" /></td>
				<td
					style="padding-top: 5px; text-align: right; font-family: courier">:تلفن</td>
			<tr>
				<td align="center"
					style="padding-left: 120px; padding-top: 40px; font-family: courier">
					<input type="submit" value="ثبت" onclick="return valid()"
					size="100" style="text-align: center; font-family: courier">
				</td>
			</tr>
		</table>
	</form>

	<form action="backToMainPage" method="get">
		<table align="center"
			style="border-right: 1px solid black; border-left: 1px solid black; border-bottom: 1px solid black; width: 410px">
			<tr>
				<td align="center"
					style="padding-left: 140px; padding-top: 20px; padding-right: 160px; font-family: courier">
					<input type="submit" value="بازگشت" size="100"
					style="text-align: center; font-family: courier">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>