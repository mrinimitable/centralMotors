

<!DOCTYPE html>

<%@page import="com.dto.AccessoriesDto"%>
<%@page import="com.service.AccessoriesService"%>
<%@page import="com.dto.OldVehicleDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.OldVehicleService"%>
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

		<h3 style="text-align: center;">Accessories Pending Report </h3>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">
							<tr>
								<th style="text-align: center;" width="4%">S.N</th>
								<th style="text-align: center;" width="5%">Date</th>
								<th style="text-align: center;" width="5%">Model Name</th>
								<th style="text-align: center;" width="5%">Variant</th>
								<th style="text-align: center;" width="5%">Accessories
									Price</th>
								<th style="text-align: center;" width="10%">Custmer Name</th>
								<th style="text-align: center;" width="10%">Mobile No</th>
								<th style="text-align: center;" width="10%">Address</th>
								<th style="text-align: center;" width="10%">Billing</th>


								<!-- <th style="text-align: center;" width="10%">Action</th> -->

							</tr>
						</thead>

						<tbody style="background: #fff;">


							<%
								/* int branch_id = Integer.parseInt(request.getParameter("branch_id") == null
								? "0"
								: request.getParameter("branch_id")); */

								AccessoriesService service = new AccessoriesService();
								ArrayList<AccessoriesDto> list = service.getAllPendingAccessories(branch_id,
										config, request);

								for (AccessoriesDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>



							<tr>


								<td style="text-align: center;"><%=rowId%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getIn_date()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getModel_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getVariant_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getAccessories_price()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustmer_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getMobile_no()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getAddress()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">
									<a href="accessories_add_billing_info_.jsp?id=<%=dto.getId()%>">Billing </a>
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

