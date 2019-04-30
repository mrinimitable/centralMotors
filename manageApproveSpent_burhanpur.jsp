

<!DOCTYPE html>

<%@page import="java.io.File"%>
<%@page import="com.dto.SpentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.SpentService"%>
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

		<h3 style="text-align: center;">Spent Complete Burhanpur Report</h3>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
											<th style="text-align: center;">S.N</th>
											<th style="text-align: center;">Date</th>

											<th style="text-align: center;">Head</th>
											<th style="text-align: center;">Remark</th>
											<th style="text-align: center;">Amount</th>
											<th style="text-align: center;">Approve Amount</th>
											<th style="text-align: center;">Image</th>
											<th style="text-align: center;">Mode</th>
											<th style="text-align: center; display: none;">Bank Name</th>
											<th style="text-align: center;">Cheque No/ Voucher No</th>
											<th style="text-align: center;">Cheque Date</th>
											<th style="text-align: center;">Cheque print</th>
											<th style="text-align: center;">Cheque Clear Status</th>

											<!-- 	<th style="text-align: center;">Action</th> -->
											<!-- <th style="text-align: center;">Action</th> -->

										</tr>
						</thead>

						<tbody style="background: #fff;">
							

							<%
										
										
										String branch= "3";
										
										
											SpentService service = new SpentService();
											ArrayList<SpentDto> list = service.getAllSpentCompleteNotOnlyCash(
													branch, config, request);
											for (SpentDto dto : list) {

												File f = new File(config.getServletContext().getRealPath("/")
														+ "imageSpent/" + dto.getId() + ".jpg");
												int rowId = list.indexOf(dto) + 1;
										%>


										<tr>
											<td style="text-align: center;"><%=rowId%></td>
											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;">
												<%=LogFileService.changeFormate(dto.getReceiving_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%>
											</td>

											<td style="text-align: center;"><%=dto.getSpent_head_name() == null ? "N/A" : dto
						.getSpent_head_name()%></td>

											<td style="text-align: center;"><%=dto.getRemark() == null ? "N/A" : dto.getRemark()%></td>
											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getAmount()%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getApprove_amount()%></td>







											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;">
												<%
													if (f.exists()) {
												%> <a href="imageSpent/<%=dto.getId()%>.jpg" target="_blank">
													<img src="imageSpent/<%=dto.getId()%>.jpg" height="50px"
													width="50px" />
											</a> <%
 	} else {
 %> <img src="img/not.png" height="50px" width="50px" /> <%
 	}
 %> </a>
											</td>






											<td style="text-align: center;"><%=dto.getPayment_mode()%></td>

											<td style="text-align: center; display: none;"><%=dto.getCheck_bank_name()%></td>

											<td style="text-align: center;"><%=dto.getCheck_no()%></td>


											<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getCheck_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>



											<%
												if (dto.getCheque_print_status().equals("Done")) {
											%>


											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;">Done</td>



											<%
												} else {
											%>


											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><a
												href="cheque_print.jsp?id=<%=dto.getId()%>"
												onclick="return confirm('Are you sure to Print Cheque ?')">Cheque
													Print</a></td>




											<%
												}
											%>




											<td style="text-align: center;">
												<%
													if (dto.getPayment_mode().equalsIgnoreCase("Cheque")) {
												%> <%
 	if (dto.getCheck_status().equalsIgnoreCase("Clear")) {
 %> <%=LogFileService.changeFormate(
								dto.getCheck_received_date(), "yyyy-MM-dd",
								"dd-MM-yyyy")%> <%
 	} else {
 %> <a href="SpentCheckStatus.jsp?id=<%=dto.getId()%>"> Ready to
													Bank </a> <%
 	}
 		} else {
 %> Done <%
 	}
 %>

											</td>



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

