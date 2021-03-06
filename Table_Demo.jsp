

<!DOCTYPE html>
<%@page import="com.dto.PurchaseVehicleDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.PurchaseService"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/jquery.datetimepicker.css" />
<link href="css/for_mobile.css" rel="stylesheet" />
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

		<h2 style="text-align: center;">Aprovel Sale Request</h2>

		<form id="form1" action="" method="post">


			<div class="col-md-12">
				</br>

				<div class="col-md-1"></div>

				<div class="col-md-10">

					<div class="col-md-1">

						<label>Date</label>

					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" placeholder="Date"
							id="date1" name="date1" readonly="readonly" value="" />
					</div>


					<div class="col-md-1">

						<label>Date</label>

					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" placeholder="Date"
							id="date2" name="date2" placeholder="Date." readonly="readonly"
							value="" />
					</div>


					<div class="col-md-1">

						<button class="submit" type="submit">GET</button>


					</div>
				</div>

				<div class="col-md-1"></div>


			</div>


		</form>


		<div class="col-md-12" style="text-align: center;">

			</br> <a href="addDistributer.jsp" class="submit"><button
					class="submit">Add Distributor</button></a>
		</div>




		<div class="row_my">


			<div class="col-md-12">
			</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">
							<tr>
							<tr>
								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Request ID</th>
								<th style="text-align: center;">Model</th>
								<th style="text-align: center;">Variant</th>

							</tr>
						</thead>

						<tbody style="background: #fff;">

							<tr>


								<td style="text-align: center;">1</td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">1</td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">1</td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">1</td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;">1</td>

							</tr>



						</tbody>


					</table>


				</div>


			</div>
		</div>
		
		</div>
</body>
</html>

