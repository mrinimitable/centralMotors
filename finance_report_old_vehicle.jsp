

<!DOCTYPE html>

<%@page import="com.service.FinanceServiceOldVehicle"%>
<%@page import="com.dto.FinanceDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.FinanceService"%>
<%@page import="com.service.LogFileService"%>
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

		<h3 style="text-align: center;">Old Vehicle Finance Report</h3>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th style="text-align: center;">S.N</th>

								<th style="text-align: center;">Vehicle Name</th>
								<th style="text-align: center;">Vehicle Reg No</th>
								<th style="text-align: center;">Customer</th>
								<th style="text-align: center;">Mobile</th>
								<th style="text-align: center;">Address</th>
								<th style="text-align: center;">Do No.</th>
								<th style="text-align: center;">Finance Date</th>
								<th style="text-align: center;">Company</th>
								<th style="text-align: center;">Branch</th>
								<th style="text-align: center;">Do Amount</th>
								<th style="text-align: center;">Receive Amount</th>
								<th style="text-align: center;">Diff. Amount</th>
								<th style="text-align: center;">Receive Status</th>
								<th style="text-align: center;">Receive Date</th>
								<th style="text-align: center;">Mode</th>
								<th style="text-align: center;">Cheque No</th>
								<th style="text-align: center;">Cheque Date</th>
								<th style="text-align: center;">Cheque Bank</th>
								<!-- <th style="text-align: center;">Action</th> -->

							</tr>
						</thead>

						<tbody style="background: #fff;">


							<%
								FinanceServiceOldVehicle service = new FinanceServiceOldVehicle();
								ArrayList<FinanceDto> list = service.getAllOldVehicleFinance(
										branch_id, config, request);
								for (FinanceDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>

							<tr>
								<td style="text-align: center;"><%=rowId%></td>

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




								<%
									if (dto.getDo_no().equals("0")) {
								%>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><a
									href="add_ old_vehicle_finance_do.jsp?id=<%=dto.getId()%>"><%=dto.getDo_no()%></a></td>


								<%-- <td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDo_no()%></td> --%>



								<%
									}

										else {
								%>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDo_no()%></td>



								<%
									}
								%>









								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getFinance_date(),
						"yyyy-mm-dd", "dd-mm-yyyy")%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getFinance_company_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getFinance_branch_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getFinance_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getReceive_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=Float.parseFloat(dto.getFinance_amount())
						- Float.parseFloat(dto.getReceive_amount())%></td>




								<%
									if (dto.getSecond_stage_status().equalsIgnoreCase("Done")) {
								%>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">Done</td>



								<%
									} else {
								%>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><a
									href="finance_credit_old_vehicle.jsp?id=<%=dto.getId()%>&&Vehicle_id=<%=dto.getVehicle_id_fk()%>">
										Credit Entry </a></td>


								<%
									}
								%>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getReceive_date(),
						"yyyy-mm-dd", "dd-mm-yyyy")%></td>







								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getPayment_mode()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCheck_no()%></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getCheck_date(),
						"yyyy-mm-dd", "dd-mm-yyyy")%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCheck_bank_name()%></td>






								<!-- <td style="text-align: center;"><a
												href="Customer_Account_Report.jsp"><i class="fa fa-bars"
													aria-hidden="true" title="Account"></i> </a></td> -->
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

