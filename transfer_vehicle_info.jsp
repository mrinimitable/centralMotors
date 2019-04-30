

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

		<h2 style="text-align: center;">Transfer Vehicle Info</h2>


		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Branch</th>
								<th style="text-align: center;">Branch To</th>
								<th style="text-align: center;">Transfer Date</th>
								<th style="text-align: center;">Receiving Date</th>
								<th style="text-align: center;">Get Pass</th>
								<th style="text-align: center;">Driver</th>
								<th style="text-align: center;">Transfer Remark</th>
									<th style="text-align: center;">Receiving Remark</th>
									<th style="text-align: center;">Print</th>
								
							</tr>
						</thead>

						<tbody style="background: #fff;">
							<%
								int vehicle_id_fk = Integer
										.parseInt(request.getParameter("id") == null ? "0"
												: request.getParameter("id"));

								PurchaseService service = new PurchaseService();
								ArrayList<PurchaseVehicleDto> list = service
										.getAllTransferVehicleInfoByID(vehicle_id_fk, config,
												request);
								for (PurchaseVehicleDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>


							<tr>


								<td style="text-align: center;"><%=rowId%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBranch_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBranch_id_fk_old_name()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getTransfer_date(),
						"yyyy-MM-dd HH:mm", "dd-MM-yyyy HH:mm")%></td>
						<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getReceiving_date(),
						"yyyy-MM-dd HH:mm", "dd-MM-yyyy HH:mm")%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getId()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDriver_name()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getTransfer_reamrk()%></td>
											<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getReceiving_remark()%></td>

								<td style="text-align: center;"><a
									href="get_pass_recipt.jsp?id=<%=dto.getId()%>">Print </a></td>




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

