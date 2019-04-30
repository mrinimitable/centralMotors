

<!DOCTYPE html>
<%@page import="com.dto.ProductDto"%>
<%@page import="com.service.ProductService"%>
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

		<h3 style="text-align: center;">Main Stock Report</h3>


		<div class="col-md-12" style="text-align: center;">

			</br> <a href="add_product.jsp" class="submit"><button class="submit">Add
					Product</button></a>
		</div>




		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
												<th width="5%" style="text-align: center;">S.N</th>
											
													<th width="10%" style="text-align: center; ">Variant Name.</th>
														<th width="10%" style="text-align: center; ">Code</th>

												<th width="10%" style="text-align: center; display: none;">Name</th>
											
												<th width="10%" style="text-align: center;"> Price With Gst</th>
												<th width="5%" style="text-align: center; display: none;">Gst(%)</th>

												<th width="5%" style="text-align: center;">Action</th>

											</tr>
						</thead>

						<tbody style="background: #fff;">
							
											<%
											
											ProductService service = new ProductService();
										ArrayList<ProductDto>list = service.getProductInfo(config, request);
										String r_qty_amt="0";
										for(ProductDto dto : list){
											
										%>




											<tr>
												<td style="text-align: center;"><%=list.indexOf(dto)+1 %></td>
													<td style="text-align: center;"><%=dto.getCat_name() %></td>
												<td style="text-align: center; "><%=dto.getItem_code() %></td>

												<td
													style="text-align: center; text-transform: capitalize; font-weight: bold; display: none;"><%=dto.getItem_name() %></td>

											

												<td
													style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getGst_sale_price() %></td>
												<td style="text-align: center; display: none;"><%=dto.getGst_per()%></td>




												<td><a href="edit_product.jsp?id=<%=dto.getItem_id()%>">
														<i class="fa fa-pencil" aria-hidden="true" title="Update "></i>
												</a></td>





											</tr>

											<%} %>


						</tbody>


					</table>


				</div>


			</div>
		</div>

	</div>
</body>
</html>

