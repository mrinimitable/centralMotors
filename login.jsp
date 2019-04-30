<%@include file="include/project_info_file_header.jsp"%>


<!DOCTYPE html>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

.input-container {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	width: 100%;
	margin-bottom: 15px;
}

.icon {
	padding: 10px;
	background: dodgerblue;
	color: white;
	min-width: 50px;
	text-align: center;
}

.input-field {
	width: 100%;
	padding: 10px;
	outline: none;
}

.input-field:focus {
	border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
	background-color: dodgerblue;
	color: white;
	padding: 15px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.btn:hover {
	opacity: 1;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}
</style>


<script>
	function cheksessionforlogin() {

		var systemdate = document.getElementById("systemdate").value;

		var session = document.getElementById("session").value;
		var sessionsplit = session.split("-");
		var newsession = sessionsplit[0].split("/");
		var temp = false;
		if (new Date(systemdate) >= new Date(newsession[1] + "-"
				+ newsession[0] + "-01")) {
			temp = true;
		} else {
			temp = false;
			alert("Selected Session Is Not Valid");
		}
		return temp;
	}
</script>
</head>
<body>

	<%
		session.setAttribute("schid", "0");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String yr = sdf.format(new Date());

		sdf = new SimpleDateFormat("MM");
		String month = sdf.format(new Date());

		sdf = new SimpleDateFormat("MM/yyyy");
		String monthyear = sdf.format(new Date());

		System.out.print(yr);
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nnn = sdf.format(new Date());

		String msg = request.getParameter("msg") == null ? "" : request
				.getParameter("msg");
	%>
	<%
		String select, select2;

		int m = Integer.parseInt(month);
		int yr1 = Integer.parseInt(yr);

		int yr2 = yr1 + 1;
		int yr3 = yr1 - 1;

		if (m > 03) {
			select = "04/" + yr1 + "-04/" + yr2;
			select2 = yr1 + "-" + yr2;
		} else {
			select = "04/" + yr3 + "-04/" + yr1;
			select2 = yr3 + "-" + yr1;
		}
	%>

	<form action="AdminLoginServlet" style="max-width: 500px; margin: auto"
		method="post" id="login">

		<h1 style="text-align: center;"><%=project_info_head_dto.getShopname() %></h1>
		<h2 style="text-align: center;">Login Form</h2>
		<div class="input-container">
			<i class="fa fa-user icon"></i> <input class="input-field"
				type="text" placeholder="Mobile No:" name="mobile">
		</div>


		<div class="input-container">
			<i class="fa fa-key icon"></i> <input class="input-field"
				type="password" placeholder="Password" name="password">
		</div>

		<input type="hidden" name="systemdate" id="systemdate"
			value="<%=nnn%>" /> <select id="session" name="session">

			<option value="<%=select%>" selected="selected"><%=select2%></option>

			<option value="04/2018-04/2019">2018-2019</option>
			<option value="04/2019-04/2020">2019-2020</option>
			<option value="04/2020-04/2021">2020-2021</option>
			<option value="04/2021-04/2022">2021-2022</option>
			<option value="04/2022-04/2023">2022-2023</option>
			<option value="04/2023-04/2024">2023-2024</option>
			<option value="04/2024-04/2025">2024-2025</option>
			<option value="04/2025-04/2026">2025-2026</option>
			<option value="04/2026-04/2027">2026-2027</option>
			<option value="04/2027-04/2028">2027-2028</option>
			<option value="04/2028-04/2029">2028-2029</option>
			<option value="04/2029-04/2030">2029-2030</option>
			<option value="04/2030-04/2031">2030-2031</option>

		</select> <br> <br>

		<button type="submit" class="btn">Login</button>
	</form>

</body>
</html>








<%-- 
<!DOCTYPE html>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="include/project_info_file.jsp"%>
<%@page import="com.service.AdminBillChangeService"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<link href="font-awesome-4.4.0/css/font-awesome.min.css"
	rel="stylesheet" />


<style type="text/css">
.heading_text {
	padding: 1% 0 0;
	font-weight: bold;
	width: 100%;
	color: #FFFFFF;
	font-size: 52px;
	text-shadow: 0px 2px 0px #ffffff;
	font-family: serif;
}
</style>
<script>
	function cheksessionforlogin() {
		var systemdate = document.getElementById("systemdate").value;
		var session = document.getElementById("session").value;
		var sessionsplit = session.split("-");
		var newsession = sessionsplit[0].split("/");
		var temp = false;
		if (new Date(systemdate) >= new Date(newsession[1] + "-"
				+ newsession[0] + "-01")) {
			temp = true;
		} else {
			temp = false;
			alert("Selected Session Is Not Valid");
		}
		return temp;
	}
</script>


</head>
<body style="background: #e2dbcc;">
	<div
		style="width: 100%; float: left; /*  background: url(img/bk.png); */ background: #e31837; border-bottom: 4px solid #2184b3;">


		<a href="#"><div class="col-md-1"></div>
			<div class="col-md-2">
				<img src="img/logo.png" width="100" height="100"
					style="padding: 2%;">
			</div>

			<div class="col-md-8">
				<div class="heading_text">



					<a href="#" style="color: #000;"><%=project_info_dto.getShopname()%>
				</div>
			</div></a>

	</div>
	<%
		session.setAttribute("schid", "0");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String yr = sdf.format(new Date());

		sdf = new SimpleDateFormat("MM");
		String month = sdf.format(new Date());

		sdf = new SimpleDateFormat("MM/yyyy");
		String monthyear = sdf.format(new Date());

		System.out.print(yr);
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nnn = sdf.format(new Date());

		String msg = request.getParameter("msg") == null ? "" : request
				.getParameter("msg");
	%>
	<%
		String select, select2;
		int m = Integer.parseInt(month);
		int yr1 = Integer.parseInt(yr);
		int yr2 = yr1 + 1;
		int yr3 = yr1 - 1;

		if (m > 03) {
			select = "04/" + yr1 + "-04/" + yr2;
			select2 = yr1 + "-" + yr2;
		} else {
			select = "04/" + yr3 + "-04/" + yr1;
			select2 = yr3 + "-" + yr1;
		}
	%>

	<form action="AdminLoginServlet" method="post" id="login" name="myForm">

		<div class="col-md-3"></div>
		<div class="col-md-6">

			<div class="col-md-10 col-md-offset-1">
				<br> <br>
				<div
					style="width: 100%; float: left; background: #ea0427; box-shadow: 0px 4px 15px 0px #060606; padding: 2%; margin-bottom: 20px;">


					<div class="login">
						<div class="login-header">
							<h1
								style="color: #0073aa; font-weight: bold; font-variant: small-caps;">Login</h1>
						</div>
						<div class="login-form">
							<h3>Mobile No:</h3>
							<input type="text" name="mobile" placeholder="Mobile"
								required="required" /><br>
							<h3>Password:</h3>
							<input type="password" name="password"
								placeholder="Enter Your Password" required="required" />

							<!-- <h3>Session:</h3> -->

							<input type="hidden" name="systemdate" id="systemdate"
								value="<%=nnn%>" /> 
								
								<select id="session" name="session">

								<option value="<%=select%>" selected="selected"><%=select2%></option>
								
								<option value="04/2018-04/2019">2018-2019</option>
								<option value="04/2019-04/2020">2019-2020</option>
								<option value="04/2020-04/2021">2020-2021</option>
								<option value="04/2021-04/2022">2021-2022</option>
								<option value="04/2022-04/2023">2022-2023</option>
								<option value="04/2023-04/2024">2023-2024</option>
								<option value="04/2024-04/2025">2024-2025</option>
								<option value="04/2025-04/2026">2025-2026</option>
								<option value="04/2026-04/2027">2026-2027</option>
								<option value="04/2027-04/2028">2027-2028</option>
								<option value="04/2028-04/2029">2028-2029</option>
								<option value="04/2029-04/2030">2029-2030</option>
								<option value="04/2030-04/2031">2030-2031</option>

							</select> <br> <br> <input type="submit" value="Login"
								class="login-button"
								style="background: #3a8fb9; width: 80%; padding: 1%; font-size: 20px; color: #000;" />
							<br>


						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3" style="padding-right: 0px;">
			<img alt="" src="img/madss2.png" width="100%">
		</div>
	</form>



	<title><%=project_info_dto.getShopname()%></title>
</body>
</html>
 --%>