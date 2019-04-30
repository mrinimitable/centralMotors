

<!DOCTYPE html>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.VariantDto"%>
<%@page import="com.service.VariantService"%>
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

		<h2 style="text-align: center;">Variant Price Variation Dates</h2>



		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>

								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Name</th>
								<th style="text-align: center; display: none;">Model</th>
								<th style="text-align: center;">Showroom Gross Price</th>
								<th style="text-align: center;">Consumer Schemes</th>
								<th style="text-align: center;">Ex. Showroom Price</th>
								<th style="text-align: center;">Rto Tax</th>
								<th style="text-align: center;">Insurance</th>
								<th style="text-align: center;">Handling Charges</th>
								<!-- <th style="text-align: center;">Varient Price</th> -->
								<th style="text-align: center;">Exchange Bonus</th>
								<th style="text-align: center;">Loyalty Bonuse</th>
								<th style="text-align: center;">Corporate Bonus</th>
								
								<th style="text-align: center;">Rsa Amount</th>
								<th style="text-align: center;">Extended Warranty Amount</th>
								<th style="text-align: center;">Other Charges</th>
								
								<th style="text-align: center;">Gst (%)</th>
								<th style="text-align: center;">Cess(%)</th>
								<th style="text-align: center;">Tcs(%)</th>
								<th style="text-align: center;">Tcs Amount</th>





							</tr>


						</thead>


						<%
							String model_id = request.getParameter("id") == null ? "0"
									: request.getParameter("id");
							String date = request.getParameter("date") == null ? "0" : request
									.getParameter("date");
						%>

						<tbody style="background: #fff;">
							<%
								/* String model_id ="1";
								String date ="2018-10-09"; */

								DecimalFormat df = new DecimalFormat("");
								VariantService service = new VariantService();

								ArrayList<VariantDto> list = service
										.getAllVariantPriceVarianceModelAndDateWise(model_id, date,
												request, config);
								for (VariantDto dto : list) {
									int a = list.indexOf(dto) + 1;
							%>




							<tr>
								<td style="text-align: center;"><%=list.indexOf(dto) + 1%></td>

								<td style="text-align: center;"><%=dto.getNAME()%></td>
								<td style="text-align: center; display: none;"><%=dto.getModel()%></td>
								
								<td style="text-align: center;"><%=Math.round(dto.getShowroom_gross_price())%></td>
								
								<td style="text-align: center;"><%=Math.round(dto.getConsumer_schemes())%></td>

								<td style="text-align: center;"><%=Math.round(dto.getShowroom_price())%></td>

								<td style="text-align: center;"><%=Math.round(dto.getRto_tax_price())%></td>

								<td style="text-align: center;"><%=Math.round(dto.getInsurance_price())%></td>
								<td style="text-align: center;"><%=Math.round(dto.getHandling_charges())%></td>
								<td style="text-align: center;"><%=Math.round(dto.getExchange_bonus_amount())%></td>

								<td style="text-align: center;"><%=Math.round(dto.getLottery_bonus_amount())%></td>

								<td style="text-align: center;"><%=Math.round(dto.getCorporate_bonus_amount())%></td>
								
								<td style="text-align: center;"><%=Math.round(dto.getRsa_amount())%></td>
								<td style="text-align: center;"><%=Math.round(dto.getExtended_warranty_amount())%></td>
								<td style="text-align: center;"><%=Math.round(dto.getOther_charges())%></td>

								<td style="text-align: center;"><%=Math.round(dto.getGst_per())%></td>

								<td style="text-align: center;"><%=Math.round(dto.getCess_per())%></td>
								<td style="text-align: center;"><%=Math.round(dto.getTcs_per())%></td>
								<td style="text-align: center;"><%=Math.round(dto.getTcs_amount())%></td>






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

