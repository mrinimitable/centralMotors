

<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="java.io.File"%>
<%@page import="com.dto.ReseviePaymentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.ResevedPayemntService"%>
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

		<h3 style="text-align: center;">Bounced_Cheque</h3>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

						<tr>
											<th style="text-align: center;">S.N</th>
											<th style="text-align: center;">Bounced Date</th>
											<th style="text-align: center;">Cheque No</th>
											<th style="text-align: center;">Bank Name</th>
											<th style="text-align: center;">Cheque Amount</th>
											<th style="text-align: center;">Image</th>
											<th style="text-align: center;">Received Date</th>
											<th style="text-align: center;">Remark</th>







										</tr>
						</thead>

						<tbody style="background: #fff;">
							

							<%
											ResevedPayemntService service = new ResevedPayemntService();
											ArrayList<ReseviePaymentDto> list = service
													.getBounced_Cheque(branch_id,config, request);
											for (ReseviePaymentDto dto : list) {
												File f = new File(config.getServletContext().getRealPath("/")
														+ "AmtImage/" + dto.getId() + ".jpg");

												int rowId = list.indexOf(dto) + 1;
										%>


										<tr>
											<td style="text-align: center;"><%=rowId%></td>

											<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getCheck_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>




											<td style="text-align: center;"><%=dto.getCheck_no()%></td>

											<td style="text-align: center;"><%=dto.getCheck_bank_name()%></td>
											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getAmount()%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;">
												<%
													if (f.exists()) {
												%> <a href="AmtImage/<%=dto.getId()%>.jpg" target="_blank">
													<img src="AmtImage/<%=dto.getId()%>.jpg" height="50px"
													width="50px" />
											</a> <%
 	} else {
 %> <img src="img/not.png" height="50px" width="50px" /> <%
 	}
 %> </a>
											</td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;">
												<%=LogFileService.changeFormate(dto.getReceiving_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%>
											</td>


											<td style="text-align: center;"><%=dto.getRemark() == null ? "N/A" : dto.getRemark()%></td>





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

