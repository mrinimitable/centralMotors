

<!DOCTYPE html>
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

	<div class="row_my">

		<h2 style="text-align: center;">Variant Price Variation Dates</h2>


	
		<div class="row_my">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							
							<tr>
								<th style="text-align: center;" width="5%">S.N</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Action</th>

							</tr>
							

						</thead>

						<tbody style="background: #fff;">
							<%
								String model_id = request.getParameter("id") == null ? "0"
										: request.getParameter("id");

								VariantService service = new VariantService();
								ArrayList<VariantDto> list = service
										.getAllDateForVariantChangeByModelId(model_id, request,
												config);
								for (VariantDto dto : list) {
									int rowId = list.indexOf(dto);
							%>

							<tr>
								<td style="text-align: center;"><%=rowId + 1%></td>
								<td style="text-transform: capitalize; text-align: center;"><%=LogFileService.changeFormate(dto.getVarient_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>






								<td style="text-align: center; font-weight: bold;"><a
									href="price_variance.in_variant.jsp?id=<%=model_id%>&&date=<%=dto.getVarient_date()%>">
										All Variation</a></td>

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

