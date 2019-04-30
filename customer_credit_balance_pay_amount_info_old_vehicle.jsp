

<!DOCTYPE html>

<%@page import="com.dto.OldVehicleDto"%>
<%@page import="com.service.OldVehicleService"%>
<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.PurchaseVehicleDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.PurchaseService"%>
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

</head>
<body>
	<%@include file="include/header.jsp"%>

	<div class="row">

		<h3 style="text-align: center;">Manage Old Vehicle Credit Amount
			Deposit</h3>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Action</th>

								<th style="text-align: center;">Pay Date</th>
								<th style="text-align: center;">Reaming Amount</th>
								<th style="text-align: center;">Paid Amount</th>
								<th style="text-align: center;">PayMode</th>
								<th style="text-align: center;">Cheque Bank</th>
								<th style="text-align: center;">Cheque NO</th>
								<th style="text-align: center;">Cheque Date</th>



							</tr>
						</thead>

						<tbody style="background: #fff;">



							<%
								int id = Integer
										.parseInt(request.getParameter("sadfjshakhfdsakj") == null ? "0"
												: request.getParameter("sadfjshakhfdsakj"));

								OldVehicleService service = new OldVehicleService();
								ArrayList<OldVehicleDto> list = service
										.getDepositOldVehicleCustomerCreditByID(id, config, request);
								for (OldVehicleDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>


							<tr>
								<td style="text-align: center;"><%=rowId%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><a
									href="receipt_customer_credit_balance_old_vehicle.jsp?id=<%=dto.getId()%>">Print
								</a></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getPay_date(),
						"yyyy-mm-dd", "dd-mm-yyyy")%></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBalance_amount()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getPay_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getPayment_mode()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCheck_bank_name()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCheck_no()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getCheck_date(),
						"yyyy-mm-dd", "dd-mm-yyyy")%></td>






								<%
									}
								%>


							</tr>





						</tbody>


					</table>


				</div>


			</div>
		</div>

	</div>
</body>
</html>

