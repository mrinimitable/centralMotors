

<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.BankDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.BankingService"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="font-awesome-4.4.0/css/font-awesome.min.css"
	rel="stylesheet" />

<link rel="stylesheet" href="css/jquery.datetimepicker.css" />
<!-- <link href="css/for_mobile.css" rel="stylesheet" /> -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="font-awesome-4.4.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="css/jquery.dataTables.css" rel="stylesheet"></link>
<link href="css/jquery.dataTables.min.css" rel="stylesheet"></link>
<link href="css/buttons.dataTables.min.css" rel="stylesheet"></link>
<script src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="js/buttons.print.min.js"></script>
<script type="text/javascript" src="js/buttons.colVis.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.datetimepicker.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('#example')
								.dataTable(
										{
											// dom: 'Bfrtip',

											//  dom: 'Bfrtip',
											"lengthMenu" : [
													[ 20, 100, 500, -1 ],
													[ 20, 100, 500, "All" ] ],
											//  iDisplayLength: 20,

											/* 	dom : 'Bf<"top"i>rt<"left"lp><"clear">', */
											dom : '<"top"lBf>rt<"left"i><"clear">p',
											/*  buttons: [
											     'print'
											 ],  */
											buttons : [
													{
														extend : 'print',
														title : "",
														message : "<table class='table ' align='center'><tr><td colspan='7' align='center'><label for='exampleInputEmail1'>"

																+ " </label></td></tr><tr><td colspan='8' align='center'><label for='exampleInputEmail1'>All Customer List</label></td></tr> </table>",
														exportOptions : {
															columns : ':visible'
														}
													}, 'colvis'

											],
											columnDefs : [ {
												//		targets : -1,
												visible : false
											} ]
										});
					});
</script>



<script>
	$(function() {
		$('#date1').datetimepicker();
	});

	$(function() {
		$('#date2').datetimepicker();
	});
</script>

</head>
<body>
	<%@include file="include/header.jsp"%>

	<%
		String d1 = request.getParameter("date1") == null ? "" : request
				.getParameter("date1");
		String d2 = request.getParameter("date2") == null ? "" : request
				.getParameter("date2");

		int bank_id = Integer.parseInt(request.getParameter("id") == null
				|| "".equalsIgnoreCase(request.getParameter("id")) ? "0"
				: request.getParameter("id"));
	%>

	<div class="row">

		<h3 style="text-align: center;">Transaction Report By Bank</h3>

		<form id="form1" action="" method="post">
			<div class="col-md-1"></div>
			<div class="col-md-10">

				<div class="col-md-1">
					<center>
						<label>Date</label>
					</center>
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control" placeholder="Date"
						id="date1" name="date1" readonly="readonly"
						value="<%=d1 == null ? "" : d1%>" />
				</div>
				<!-- <div class="col-md-1">To</div> -->

				<div class="col-md-1">
					<center>
						<label>Date</label>
					</center>
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control" placeholder="Date"
						id="date2" name="date2" placeholder="Date." readonly="readonly"
						value="<%=d2 == null ? "" : d2%>" />
				</div>


				<div class="col-md-1">
					<center>
						<button class="submit" type="submit">Get</button>
					</center>

				</div>
			</div>
		</form>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th style="text-align: center;">S.No</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Branch</th>
								<th style="text-align: center;">Bank</th>
								<th style="text-align: center;">Payment By</th>
								<th style="text-align: center;">Source</th>
								<th style="text-align: center;">Credit</th>
								<th style="text-align: center;">Dabit</th>
								<th style="text-align: center;">Balance</th>
								<th style="text-align: center;">Mode</th>

								<th style="text-align: center;">Cheque Bank</th>
								<th style="text-align: center;">Cheque No</th>
								<th style="text-align: center;">Cheque Date</th>

							</tr>
						</thead>

						<tbody style="background: #fff;">

							<%
								BankingService bService = new BankingService();
								ArrayList<BankDto> blist = null;
								float bal = 0, debit = 0, credit = 0;

								blist = bService.BankTrasactionReportByBankId(request, d1, d2,
										bank_id, config);
								for (BankDto dto : blist) {

									bal = bal + (dto.getCredit_amt() - dto.getDebit_amt());
							%>


							<tr>
								<td style="text-align: center;"><%=blist.indexOf(dto) + 1%></td>
								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getIn_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>

								<td style="text-align: center;"><%=dto.getBranch_name() == null ? "NA" : dto
						.getBranch_name()%></td>


								<td style="text-align: center;"><%=dto.getBank_name() == null ? "NA" : dto
						.getBank_name()%></td>
								<td style="text-align: center;"><%=dto.getPayment_by() == null ? "NA" : dto
						.getPayment_by()%></td>

								<td style="text-align: center;"><%=dto.getSource_type()%></td>

								<td style="text-align: center;"><%=dto.getCredit_amt()%></td>
								<td style="text-align: center;"><%=dto.getDebit_amt()%></td>
								<td style="text-align: center;"><%=bal%></td>

								<td style="text-align: center;"><%=dto.getPay_mode()%></td>
								<td style="text-align: center;"><%=dto.getCheck_bank_name()%></td>
								<td style="text-align: center;"><%=dto.getCheck_no()%></td>
								<td style="text-align: center;"><%=dto.getCheck_date()%></td>




							</tr>
							<%
								}
							%>





						</tbody>


					</table>

					<br></br>
					<table class="table table-bordered" style="margin: 0px auto;">
						<thead class="thead_bg">
							<tr>


								<th style="text-align: right;">Balance</th>
							</tr>

						</thead>
						<tbody style="background: #fff;">
							<tr style="background: #fff;">

								<td style="text-align: right;"><%=bal%></td>

							</tr>
						</tbody>
					</table>


				</div>


			</div>
		</div>

	</div>
</body>
</html>

