

<!DOCTYPE html>

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

		<h3 style="text-align: center;">Pending List Of Customer Recovery</h3>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>


								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Invoice No</th>
								<th style="text-align: center;">Customer</th>
								<th style="text-align: center;">Mobile</th>
								<th style="text-align: center;">Address</th>
								<th style="text-align: center;">Veh. ID</th>
								<th style="text-align: center;">Soft. ID</th>
								<th style="text-align: center;">Model</th>
								<th style="text-align: center;">Variant</th>
								<th style="text-align: center;">Chechis No</th>
								<th style="text-align: center;">Engine No</th>
								<th style="text-align: center;">Color</th>
								<th style="text-align: center;">Sales Manager</th>
								<th style="text-align: center;">Sales Consultant</th>
								<th style="text-align: center;">Balance</th>
								<th style="text-align: center;">Finance Balance</th>
								<th style="text-align: center;">Paid Amount</th>
								<th style="text-align: center;">Due Balance</th>

								<!-- 	<th style="text-align: center;">Action</th> -->





							</tr>
						</thead>

						<tbody style="background: #fff;">

							<%
								PurchaseService service = new PurchaseService();
								ArrayList<PurchaseVehicleDto> list = service
										.getVerifyAllSaleVehicleByBranchBYSalesConsultant(
												branch_id, creator_id, config, request);

								for (PurchaseVehicleDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>


							<tr>


								<td style="text-align: center;"><%=rowId%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSaleing_date()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSale_invoice_no()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_name()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_mobile_no()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_address()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getVehical_id()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getId()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getModel_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getVariant_name()%></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getChechis_no()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getEngine_number()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getColor_name()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSales_manager_name()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSales_consultant_name()%></td>




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
									href="pay_deposit_customer_credit.jsp?sadfjshakhfdsakj=<%=dto.getId()%>"><i
										class="fa fa-pencil-square-o" aria-hidden="true" title="Clear"></i>
								</a> <%
 	}
 %> / <a
									href="customer_credit_balance_pay_amount_info.jsp?sadfjshakhfdsakj=<%=dto.getId()%>"><i
										class="fa fa-list-alt" aria-hidden="true" title="Due List"></i>
								</a></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=(dto.getBalance_amount() + dto
						.getFinance_diff_amount())
						- dto.getPay_balance_amount()%></td>




								<%-- 	<td style="text-align: center;"><a
									href="accessories_item_report.jsp?id=<%=dto.getId()%>"><i
										class="fa fa-bars" aria-hidden="true" title="Account"></i> </a></td> --%>





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

