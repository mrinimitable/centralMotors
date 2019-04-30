

<!DOCTYPE html>

<%@page import="java.io.File"%>
<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.SpentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.SpentService"%>
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

		<h3 style="text-align: center;">Cash Payment Approve Request</h3>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Action</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Branch</th>
								<th style="text-align: center;">Head</th>
								<th style="text-align: center;">Sub Head</th>
								<th style="text-align: center;">Remark</th>
								<th style="text-align: center;">Amount</th>
								<th style="text-align: center;">Approve Amount</th>
								<th style="text-align: center;">Approve Date</th>
								<th style="text-align: center;">Mode</th>
								<th style="text-align: center;">Image</th>



							</tr>
						</thead>

						<tbody style="background: #fff;">

							<%
								String branch = "1";

								SpentService service = new SpentService();
								ArrayList<SpentDto> list = service
										.getAllApproverSpentAmountNotOnlyCashAllBranch(config,
												request);
								for (SpentDto dto : list) {

									int rowId = list.indexOf(dto) + 1;

									File f = new File(config.getServletContext().getRealPath("/")
											+ "imageSpent/" + dto.getId() + ".jpg");
							%>


							<tr>
								<td style="text-align: center;"><%=rowId%></td>
								
								<td style="text-align: center;"><a
									href="approve_spend_payment.jsp?id=<%=dto.getId()%>&&check=2">Pay
										Amount </a></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">
									<%=LogFileService.changeFormate(dto.getReceiving_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%>
								</td>

								<td style="text-align: center;"><%=dto.getBranch_name()%></td>

								

								

								<td style="text-align: center;"><%=dto.getSpent_head_name() == null ? "N/A" : dto
						.getSpent_head_name()%></td>


								<td style="text-align: center;"><%=dto.getSpent_sub_head_name() == null ? "N/A" : dto
						.getSpent_sub_head_name()%></td>


								<td style="text-align: center;"><%=dto.getRemark() == null ? "N/A" : dto.getRemark()%></td>



								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getAmount()%></td>

								<td style="text-align: center; font-weight: bold;"><%=dto.getApprove_amount()%></td>


								<td style="text-align: center; font-weight: bold;"><%=LogFileService.changeFormate(dto.getAprrove_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>


								<td style="text-align: center; font-weight: bold;"><%=dto.getApprover_pay_mode()%></td>


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












								<%-- 	<td style="text-align: center;"><a
												href="spentAmountApproveStatusa.jsp?id=<%=dto.getId()%>">Verify
													& Ok </a></td>
 --%>







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

