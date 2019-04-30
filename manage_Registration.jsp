

<!DOCTYPE html>

<%@page import="com.dto.BranchDto"%>
<%@page import="com.service.BranchService"%>
<%@page import="java.util.ArrayList"%>
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

		<h3 style="text-align: center;">All User</h3>


		<%
			int branch_id_fk = Integer.parseInt(request
					.getParameter("branch_id_fk ") == null ? "0" : request
					.getParameter("branch_id_fk "));
		%>
		<br />


		<form id="form1" action="" method="post">
			<div class="col-md-1"></div>
			<div class="col-md-10">





				<div class="col-md-3">
					<center>
						<label>Branch</label>
					</center>
				</div>
				<div class="col-md-4">
					<select id="branch_id_fk " name="branch_id_fk "
						class="form-control">
						<option value="0">Select</option>
						<%
							BranchService aservice = new BranchService();

							ArrayList<BranchDto> alist = aservice.getAllBranch(config, request);
							for (BranchDto adto : alist) {
						%>
						<option
							<%if (branch_id_fk == adto.getId()) {
					out.print("Selected='selected'");
				}%>
							value="<%=adto.getId()%>"><%=adto.getNAME()%></option>
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
		</form>


		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th width="5%" style="text-align: center;">S.N</th>
								<th width="15%" style="text-align: center;">Name</th>
								<th width="15%" style="text-align: center;">Password</th>
								<th width="10%" style="text-align: center;">Mobile</th>
								<th width="20%" style="text-align: center;">Address</th>
								<th width="10%" style="text-align: center;">Role</th>
								<th width="10%" style="text-align: center;">Branch</th>
								<th width="10%" style="text-align: center;">Status</th>
								<th width="5%" style="text-align: center;">Feature Alot</th>
								<th width="5%" style="text-align: center;">Action</th>

							</tr>
						</thead>

						<tbody style="background: #fff;">

							<%
								AdminRagistrationService service = new AdminRagistrationService();

								ArrayList<AdminRagistrationDto> list = service.getAllUserInfo(
										branch_id_fk, request, config);
								for (AdminRagistrationDto dto : list) {
							%>

							<tr>
								<td style="text-align: center;"><%=list.indexOf(dto) + 1%></td>

								<td style="text-align: center;"><%=dto.getNAME()%></td>

								<td style="text-align: center;"><%=dto.getPASSWORD()%></td>

								<td style="text-align: center;"><%=dto.getMobile()%></td>
								<td style="text-align: center;"><%=dto.getAddress()%></td>
								<td style="text-align: center;"><%=dto.getUser_role()%></td>

								<td style="text-align: center;"><%=dto.getBranch_id_fk_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getSTATUS()%>
								</td>



								<td style="text-align: center;"><a
									href="feature_alot.jsp?id=<%=dto.getCreator_id()%>"> <i
										class="fa fa-pencil" aria-hidden="true" title="Update "></i>
								</a></td>

								<td style="text-align: center;"><a
									href="edit_AdminRegistration.jsp?id=<%=dto.getCreator_id()%>">
										<i class="fa fa-pencil" aria-hidden="true" title="Update "></i>
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

