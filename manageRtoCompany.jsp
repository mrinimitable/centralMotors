

<!DOCTYPE html>

<%@page import="com.dto.RtoCompanyDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.RtoCompanyService"%>
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

		<h3 style="text-align: center;">Add Rto Company</h3>

		<div class="col-md-12" style="text-align: center;">

			</br><a href="addRtoCompany.jsp" class="submit">
			<button class="submit">Add Rto Company</button>
			</a>
		</div>




		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>

								<th style="text-align: center;" width="5%">S.N</th>
								<th style="text-align: center;">Name</th>
								<th style="text-align: center;">Mobile</th>

								<th style="text-align: center;">Status</th>
								<th style="text-align: center;">Action</th>

							</tr>
						</thead>

						<tbody style="background: #fff;">



							<%
								RtoCompanyService service = new RtoCompanyService();
								ArrayList<RtoCompanyDto> list = service.getAllRtoCompany(branch_id,
										config, request);
								for (RtoCompanyDto dto : list) {
							%>




							<tr>
								<td style="text-align: center;"><%=list.indexOf(dto) + 1%></td>





								<td style="text-align: center;"><%=dto.getNAME()%></td>
								<td style="text-align: center;"><%=dto.getMobile()%></td>

								<td style="text-align: center; text-transform: capitalize;"><%=dto.getSTATUS()%></td>
								<td style="text-align: center;"><a
									href="editRtoCompany.jsp?id=<%=dto.getId()%>"> <i
										class="fa fa-pencil" aria-hidden="true" title="Update "></i>
								</a></td>

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

