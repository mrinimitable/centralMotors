

<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.BranchDto"%>
<%@page import="com.service.BranchService"%>
<%@page import="com.dto.VehicleRequestDto"%>
<%@page import="com.service.VehicleRequestService"%>
<%@page import="com.dto.ModelDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.ModelService"%>
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

											/* 	dom : 'Bf_$tag___rt_$tag______$tag____', */
											dom : '_$tag_____rt_$tag_____$tag____p',
											/*  buttons: [
											     'print'
											 ],  */
											buttons : [
													{
														extend : 'print',
														title : "",
														message : "_$tag_________________________________$ta_$tag___________________________$tag___________________________"

																+ " _$tag____$tag_$tag_$ta_$tag___________________________$tag___________________________All Customer List_$tag____$tag_$tag _$tag___",
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

		<h3 style="text-align: center;">Complete Vehicle Request</h3>


		<%-- 	<form id="form1" action="" method="post">
			<div class="col-md-1"></div>
			<div class="col-md-10">

				<div class="col-md-3">
					<center>
						<label>Branch Name</label>
					</center>
				</div>
				<div class="col-md-4">
					<select id="branch_id_fk " name="branch_id_fk "
						class="form-control">
						<option value="0">Select</option>

						<%
							int branch_id_fk = Integer.parseInt(request
									.getParameter("branch_id_fk ") == null ? "0" : request
									.getParameter("branch_id_fk "));

							BranchService aservice = new BranchService();

							ArrayList<BranchDto> alist = aservice.getAllBranch(config, request);

							for (BranchDto adto : alist) {
						%>




						<option
							<%if (adto.getId() == branch_id_fk) {
					out.print("Selected='selected'");
				}%>
							value="<%=adto.getId()%>"><%=adto.getNAME()%></option>


							<option value="<%=adto.getId()%>"><%=adto.getNAME()%></option>



						<%
							}
						%>

					</select>
				</div>


				<div class="col-md-1">
					<center>
						<button class="submit" type="submit">Get</button>
					</center>

				</div>
			</div>
		</form> --%>



		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th style="text-align: center;">S.N</th>
								<th style="text-align: center;">Request Date</th>
								<th style="text-align: center;">Request Branch Name</th>
								<!-- 	<th style="text-align: center;">Request Person</th> -->
								<th style="text-align: center;">Model</th>
								<th style="text-align: center;">Variant</th>
								<th style="text-align: center;">Color</th>
								<th style="text-align: center;">Vehicle No</th>
								<!-- <th style="text-align: center;">Reamrk</th> -->

								<!-- <th style="text-align: center;">Action</th> -->

							</tr>
						</thead>

						<tbody style="background: #fff;">


							<%
								VehicleRequestService service = new VehicleRequestService();
								ArrayList<VehicleRequestDto> list = service
										.getAllVehicleComleteRequestByBranch(branch_id, request,
												config);

								for (VehicleRequestDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>


							<tr>
								<td style="text-align: center;"><%=rowId%></td>


								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getRequest_date(),
						"yyyy-MM-dd hh:mm", "dd-MM-yyyy hh:mm")%></td>


								<%-- <td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getRequset_person()%></td> --%>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBranch_name_recive()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getModel_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getVariant_name()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getColor_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getVehicle_id()%></td>


								<%-- <td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getRemark()%></td> --%>






								<%-- 	<td style="text-align: center;"><a
												href="complete_vehicle_request.jsp?id=<%=dto.getId()%>"><i class="fa fa-bars"
													aria-hidden="true" title="Account"></i> </a></td> --%>

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

