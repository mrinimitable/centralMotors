

<!DOCTYPE html>

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

											/* 	dom : 'Bf_$tag___rt_$tag______$tag____', */
											dom : '_$tag_____rt_$tag_____$tag____p',
											/*  buttons: [
											     'print'
											 ],  */
											buttons : [
													{
														extend : 'print',
														title : "",
														message : "_$tag_________________________________$ta_$tag___________________________$tag___________________________"

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

		<h2 style="text-align: center;">Vehicle Receiving</h2>






		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Veh. ID</th>
								<th style="text-align: center;">Soft. ID</th>
								<th style="text-align: center;">Model</th>
								<th style="text-align: center;">Variant</th>
								<th style="text-align: center;">Chechis No</th>
								<th style="text-align: center;">Engine No</th>
								<th style="text-align: center;">Color</th>
								<th style="text-align: center;">Get Pass</th>
								<th style="text-align: center;">Driver</th>
								<th style="text-align: center;">Transfer Date</th>
								<th style="text-align: center;">Transfer Info</th>
								<th style="text-align: center;">Receive Date</th>
								<th style="text-align: center;">Receiving Remark</th>
								<th style="text-align: center;">Transfer Remark</th>
								<!-- 	<th style="text-align: center;">Transfer</th> -->

							</tr>
						</thead>

						<tbody style="background: #fff;">
							<%
								/* int branch_id = Integer.parseInt(request.getParameter("branch_id") == null
								? "0"
								: request.getParameter("branch_id")); */

								PurchaseService service = new PurchaseService();
								ArrayList<PurchaseVehicleDto> list = service
										.getAllPurchaseReceivingVehicleBYBranchID(branch_id,
												config, request);
								for (PurchaseVehicleDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>


							<tr>


								<td style="text-align: center;"><%=rowId%></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getPurchase_date(),
						"yyyy-MM-dd HH:mm", "dd-MM-yyyy HH:mm")%></td>


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
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getGet_pass_no()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDriver_name()%></td>





								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getTransfer_date(),
						"yyyy-MM-dd HH:mm", "dd-MM-yyyy HH:mm")%></td>

								<td style="text-align: center;"><a
									href="transfer_vehicle_info.jsp?id=<%=dto.getId()%>"><i
										class="fa fa-bars" aria-hidden="true" title="Transfer Info"></i>
								</a></td>



								<%
									if (dto.getReceiving_date().equalsIgnoreCase("")) {
								%>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">
									<a href="transfer_vehicle_receving.jsp?id=<%=dto.getId()%>">For
										Receving </a>
								</td>

								<%
									} else {
								%>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">
									<%=LogFileService.changeFormate(
							dto.getReceiving_date(), "yyyy-MM-dd HH:mm",
							"dd-MM-yyyy HH:mm")%></td>
								<%
									}
								%>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getReceiving_remark()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getTransfer_reamrk()%></td>

								<%-- 	<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><a
									href="transfer_vehicle.jsp?id=<%=dto.getId()%>"> <i
										class="fa fa-pencil-square-o" aria-hidden="true"
										title="Transfer"></i>
								</a></td> --%>




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
