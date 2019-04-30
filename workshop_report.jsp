

<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.WorkshopDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.WorkshopService"%>
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

		<h3 style="text-align: center;">Workshop Report</h3>






		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Customer Name</th>
								<th style="text-align: center;">Mobile No</th>
								<th style="text-align: center;">JobCard No.</th>
								<th style="text-align: center;">Promish Date</th>
								<th style="text-align: center;">Bill Amount</th>
								<th style="text-align: center;">Insurance Amount</th>
								<th style="text-align: center;">Booking amount</th>
								<th style="text-align: center;">Today Pay Amount</th>
								<th style="text-align: center;">Balance Amount</th>
								<th style="text-align: center;">Diff. Insurance</th>
								<th style="text-align: center;">Diposit Reamrk</th>
								<th style="text-align: center;">Insurance Company</th>
								<th style="text-align: center;">Insurance Date</th>
								<th style="text-align: center;">Mode</th>
								<th style="text-align: center;">Cheque No</th>
								<th style="text-align: center;">Cheque Date</th>
								<th style="text-align: center;">Cheque Bank</th>
								<th style="text-align: center;">Credit Amount</th>
								<th style="text-align: center;">Insurance PayMode</th>
								<th style="text-align: center;">Insurance Cheque No</th>
								<th style="text-align: center;">Insurance Cheque Date</th>
								<th style="text-align: center;">Insurance Cheque Bank</th>
								<th style="text-align: center;">Bill Date</th>
								<th style="text-align: center;">Bill NO</th>


							</tr>
						</thead>

						<tbody style="background: #fff;">
							<%
								WorkshopService service = new WorkshopService();
								ArrayList<WorkshopDto> list = service.getAllWorkshopApproval(
										branch_id, config, request);
								for (WorkshopDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>


							<tr>
								<td style="text-align: center;"><%=rowId%></td>



								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getRequest_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_mobile_no()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getJobcard_no()%></td>




								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getPromish_sate(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBill_amount()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getInsurance_amount()%></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBooking_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getPay_diposit()%>
								</td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBalance_amount()%></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getInsurance_diff_amount()%></td>






								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDiposit_cheaqe_reamrk()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getInsurance_company_name()%></td>








								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getInsurance_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDiposit_mode()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDiposit_cheaqe_no()%></td>


								<td style="text-align: center;"><%=LogFileService.changeFormate(
						dto.getDiposit_cheaqe_date(), "yyyy-MM-dd",
						"dd-MM-yyyy")%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getDiposit_bank()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getInsurance_credit_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getInsurance_credit_paymode()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getInsurance_credit_cheque_no()%></td>




								<td style="text-align: center;"><%=LogFileService.changeFormate(
						dto.getInsurance_credit_cheque_date(), "yyyy-MM-dd",
						"dd-MM-yyyy")%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getInsurance_credit_cheque_bank()%></td>






								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getBill_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>




								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBill_no()%></td>







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

