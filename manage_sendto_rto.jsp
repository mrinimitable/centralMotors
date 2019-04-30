

<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.RtoPaperDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.RtoPaperService"%>
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

		<h3 style="text-align: center;">Send TO Rto Paper Report</h3>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">


							<tr>
								<th style="text-align: center;">S.N</th>

								<th style="text-align: center;">Action</th>

								<th style="text-align: center;">Veh. ID</th>

								<th style="text-align: center;">Model</th>
								<th style="text-align: center;">Variant</th>
								<th style="text-align: center;">Chechis_no</th>
								<th style="text-align: center;">Engine</th>
								<th style="text-align: center;">Customer</th>
								<th style="text-align: center;">Mobile</th>



								<th style="text-align: center;">Ro Name</th>
								<th style="text-align: center;">Adhar Card</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Pan Card</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Paichay Patr</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">2 Photo</th>
								<th style="text-align: center;">Date</th>





							</tr>
						</thead>

						<tbody style="background: #fff;">


							<%
								RtoPaperService service = new RtoPaperService();
								ArrayList<RtoPaperDto> list = service.getAllRtoPaper(branch_id,
										config, request);
								for (RtoPaperDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>



							<tr>
								<td style="text-align: center;"><%=rowId%></td>

								<td style="text-align: center;"><a
									href="edit_send_to_rto_paper.jsp?id=<%=dto.getId()%>&&Vehicle_id=<%=dto.getVehicle_id_fk()%>"><i
										class="fa fa-bars" aria-hidden="true" title="Account"></i> </a></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getVehicle_id()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getModel_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getVariant_name()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getChechis_no()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getEngine_number()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_mobile_no()%></td>






								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getRto_name()%></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSend_adhar_card()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(
						dto.getSend_adhar_card_date(), "yyyy-mm-dd",
						"dd-mm-yyyy")%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSend_pan_card()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(
						dto.getSend_pan_card_date(), "yyyy-mm-dd", "dd-mm-yyyy")%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSend_paichay_patr()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(
						dto.getSend_paichay_patr_date(), "yyyy-mm-dd",
						"dd-mm-yyyy")%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSend_photo()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(
						dto.getSend_photo_date(), "yyyy-mm-dd", "dd-mm-yyyy")%></td>









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

