

<!DOCTYPE html>
<%@page import="com.dto.ModelDto"%>
<%@page import="com.service.ModelService"%>
<%@page import="com.dto.DistributorDto"%>
<%@page import="com.service.DistributorService"%>
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
														message : "<table class='table ' align='center'><tr><td colspan='7' align='center'>_$tag___________________________"

																+ " _$tag____$tag_$tag_$ta_$tag___________________________$tag___________________________All Customer List_$tag____$tag_$tag _$tag___",
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

		<h3 style="text-align: center;">Request Available for Sales</h3>






		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Quotation</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Request ID_</th>
								<th style="text-align: center;">For Sale</th>
								<th style="text-align: center;">Model</th>
								<th style="text-align: center;">Variant</th>
								<th style="text-align: center;">Customer</th>
								<th style="text-align: center;">Mobile</th>
								<th style="text-align: center;">Address</th>
								<th style="text-align: center;">Adhar No</th>
								<th style="text-align: center;">Pan No.</th>
								<th style="text-align: center;">GstIN</th>
								<th style="text-align: center;">Color</th>
								<th style="text-align: center;">Sales Manager</th>
								<th style="text-align: center;">Sales Consultant</th>
								<th style="text-align: center;">On Road Price</th>
								<th style="text-align: center;">Rsa</th>
								<th style="text-align: center;">Warranty</th>
								<th style="text-align: center;">Other Charges</th>
								<th style="text-align: center;">Accessories Amount</th>
								<th style="text-align: center;">Consultant Discount</th>
								<th style="text-align: center;">Exchange Bonus</th>
								<th style="text-align: center;">Lottery Bonus</th>
								<th style="text-align: center;">Corporate Bonus</th>
								<th style="text-align: center;">Net To Collect Price</th>
								<th style="text-align: center;">Do Amount</th>
								<th style="text-align: center;">Booking Amount</th>
								<th style="text-align: center;">Cash Diposit Amount</th>
								<th style="text-align: center;">Pay Dispatch</th>
								<th style="text-align: center;">Finance Date</th>
								<th style="text-align: center;">Finance Company</th>
								<th style="text-align: center;">Finance Branch</th>
								<th style="text-align: center;">Do No.</th>
								<th style="text-align: center;">Exchange Vehicle</th>
								<th style="text-align: center;">Vehicle Reg No</th>
								<th style="text-align: center;">Vehicle_value</th>
								<th style="text-align: center;">Mode</th>
								<th style="text-align: center;">Diposit Bank</th>
								<th style="text-align: center;">Cheaqe_no</th>
								<th style="text-align: center;">Cheaqe Date</th>
								<th style="text-align: center;">Reamrk</th>


							</tr>
						</thead>

						<tbody style="background: #fff;">
							<%
								PurchaseService service = new PurchaseService();
								ArrayList<PurchaseVehicleDto> list = service
										.getAllVarifySaleRequestByBranch(branch_id, config, request);

								for (PurchaseVehicleDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>



							<tr>


								<td style="text-align: center;"><%=rowId%></td>

								<td style="text-align: center;"><a
									href="sale_request_quotation.jsp?id=<%=dto.getId()%>">Print
								</a></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSaleing_date()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getId()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><a
									href="sale_request_vehicle.jsp?id=<%=dto.getId()%>"> For
										Sale</a></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getModel_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getVariant_name()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_name()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_mobile_no()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_address()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getAdhar_no()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getPan_no()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_gstIn()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getColor_name()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSales_manager_name()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSales_consultant_name()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSale_price()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getRsa_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getExtended_warranty_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getOther_charges()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getAccessories_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getOther_bonus_amount()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getExchange_bonus_amount()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getLottery_bonus_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCorporate_bonus_amount()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getFinal_price()%></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getFinance_amount()%></td>








								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBooking_amount() == null ? "" : dto
						.getBooking_amount()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDiposit_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">
									<%=dto.getPay_diposit_amount()%>(<%=dto.getPay_diposit_amount_cash()%>
									+ <%=dto.getPay_diposit_amount_cheque()%>)
								</td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSaleing_date()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getFinance_company_name() == null ? "" : dto
						.getFinance_company_name()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getFinance_branch_name() == null ? "" : dto
						.getFinance_branch_name()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDo_no() == null ? "" : dto.getDo_no()%></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getExchange_vehicle_name() == null ? "" : dto
						.getExchange_vehicle_name()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getOld_vehicle_reg_no() == null ? "" : dto
						.getOld_vehicle_reg_no()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getOld_vehicle_value() == null ? "" : dto
						.getOld_vehicle_value()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDiposit_mode() == null ? "" : dto
						.getDiposit_mode()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDiposit_bank() == null ? "" : dto
						.getDiposit_bank()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDiposit_cheaqe_no() == null ? "" : dto
						.getDiposit_cheaqe_no()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDiposit_cheaqe_date() == null ? "" : dto
						.getDiposit_cheaqe_date()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDiposit_cheaqe_reamrk() == null ? "" : dto
						.getDiposit_cheaqe_reamrk()%></td>






















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

