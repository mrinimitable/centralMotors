

<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.InsuranceCompanyDto"%>
<%@page import="com.dto.InsuranceRenewalDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.InsuranceCompnayService"%>
<%@page import="com.service.InsuranceRenewalService"%>
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

		<h3 style="text-align: center;">Insurance Renewal Report</h3>


		<div class="col-md-12" style="text-align: center;"></div>



		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>

								<th style="text-align: center;" width="5%">S.N</th>
								<th style="text-align: center;" "width="5%">Approve</th>
								<th style="text-align: center;" width="10%">Date</th>
								<th style="text-align: center;" width="15%">Customer Name</th>
								<th style="text-align: center;" width="15%">Vehcle Name</th>
								<th style="text-align: center;" width="10%">Reg No</th>
								<th style="text-align: center;" width="10%">Insurance
									Company</th>
								<th style="text-align: center;" width="5%">Od Premium</th>
								<th style="text-align: center;" width="5%">Total Premium</th>
								<th style="text-align: center;" width="10%">No Claim Bouns</th>
								<th style="text-align: center;" width="10%">Discount</th>
								<th style="text-align: center;" width="10%">Recipt No</th>
								<th style="text-align: center;" width="20%">Remake</th>


							</tr>
						</thead>

						<tbody style="background: #fff;">


							<%
								InsuranceRenewalService service = new InsuranceRenewalService();
								ArrayList<InsuranceRenewalDto> list = service
										.getAllInsuranceRenewal(config, request);
								for (InsuranceRenewalDto dto : list) {
							%>

							<tr>
								<td style="text-align: center;"><%=list.indexOf(dto) + 1%></td>
								<td style="text-align: center;"><a
									href="edit_insuerence_renewal.jsp?id=<%=dto.getId()%>">
										Verify </a></td>
								
								
								
								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getRenival_date(),
						"yyyy-MM-dd hh:mm", "dd-MM-yyyy hh:mm")%></td>
						<td style="text-align: center; text-transform: capitalize;"><%=dto.getCustomer_name()%></td>
								<td style="text-align: center; text-transform: capitalize;"><%=dto.getVehcle_name()%></td>

								<td style="text-align: center; text-transform: capitalize;"><%=dto.getReg_no()%></td>
								<td style="text-align: center; text-transform: capitalize;"><%=dto.getInsurance_comapny_name()%></td>
								<td style="text-align: center; text-transform: capitalize;"><%=dto.getOd_premium()%></td>
								<td style="text-align: center; text-transform: capitalize;"><%=dto.getTotal_premium()%></td>
								<td style="text-align: center; text-transform: capitalize;"><%=dto.getNo_claim_bonus()%></td>
								<td style="text-align: center; text-transform: capitalize;"><%=dto.getDiscount_per()%></td>
								<td style="text-align: center; text-transform: capitalize;"><%=dto.getRecipt_no()%></td>
								<td style="text-align: center; text-transform: capitalize;"><%=dto.getRemark()%></td>


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

