

<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.OldVehicleDto"%>
<%@page import="com.service.OldVehicleService"%>
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

		<h3 style="text-align: center;">Customer Old Vehicle Credit
			Report</h3>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>


								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Balance</th>
								<th style="text-align: center;">Finance Balance</th>
								<th style="text-align: center;">Paid Amount</th>
								<th style="text-align: center;">Due Balance</th>
								<th style="text-align: center;">Invoice No</th>
								<th style="text-align: center;">Veh. Name</th>
								<th style="text-align: center;">Veh. Registre No.</th>
								<th style="text-align: center;">Customer</th>
								<th style="text-align: center;">Mobile</th>
								<th style="text-align: center;">Address</th>







							</tr>
						</thead>

						<tbody style="background: #fff;">

							<%
								OldVehicleService service = new OldVehicleService();
								ArrayList<OldVehicleDto> list = service.getAllCompleteOldVehicle(
										branch_id, config, request);

								for (OldVehicleDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>


							<tr>


								<td style="text-align: center;"><%=rowId%></td>


								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getSaleing_date(),
						"yyyy-MM-dd hh:mm", "dd-MM-yyyy hh:mm")%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBalance_amount()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getFinance_diff_amount()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getPay_balance_amount()%>
									<%
										if (dto.getBalance_amount() + dto.getFinance_diff_amount() > dto
													.getPay_balance_amount()) {
									%> / <a
									href="pay_deposit_customer_credit_old_vehicle.jsp?sadfjshakhfdsakj=<%=dto.getId()%>"><i
										class="fa fa-pencil-square-o" aria-hidden="true" title="Clear"></i>
								</a> <%
 	}
 %> / <a
									href="customer_credit_balance_pay_amount_info_old_vehicle.jsp?sadfjshakhfdsakj=<%=dto.getId()%>"><i
										class="fa fa-list-alt" aria-hidden="true" title="Due List"></i>
								</a></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=(dto.getBalance_amount() + dto
						.getFinance_diff_amount())
						- dto.getPay_balance_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">1</td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getExchange_vehicle_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getExchange_vehicle_reg_no()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustmer_name_sale()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getMobile_no_sale()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getAddress_sale()%></td>














							</tr>


							<%
								}
							%>







						</tbody>


					</table>


				</div>


			</div>
		</div>

	</div>
</body>
</html>

