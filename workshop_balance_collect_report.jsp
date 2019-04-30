

<!DOCTYPE html>
<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.InsuranceCompanyDto"%>
<%@page import="com.service.InsuranceCompnayService"%>
<%@page import="com.dto.WorkshopDto"%>
<%@page import="com.service.WorkshopService"%>
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

		<h3 style="text-align: center;">Workshop Report</h3>


		<form id="form1" action="" method="post">
			<div class="col-md-1"></div>
			<div class="col-md-10">





				<div class="col-md-3" style="text-align: center;">

					<label>Company</label>

				</div>
				<div class="col-md-4">
					<select id="company_id_fk " name="company_id_fk "
						class="form-control">
						<option value="0">Select</option>
						<%
							int company_id_fk = Integer.parseInt(request
									.getParameter("company_id_fk ") == null ? "0" : request
									.getParameter("company_id_fk "));

							InsuranceCompnayService aservice = new InsuranceCompnayService();

							ArrayList<InsuranceCompanyDto> alist = aservice
									.getAllInsuranceCompanyActive(config, request);
							for (InsuranceCompanyDto adto : alist) {
						%>




						<option
							<%if (adto.getId() == company_id_fk) {
					out.print("Selected='selected'");
				}%>
							value="<%=adto.getId()%>"><%=adto.getNAME()%></option>


						<%-- 	<option value="<%=adto.getId()%>"><%=adto.getNAME()%></option> --%>



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
								<th style="text-align: center;">S.N</th>

								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Customer Name</th>
								<th style="text-align: center;">Mobile No</th>
								<th style="text-align: center;">Company</th>
								<th style="text-align: center;">JobCard No.</th>
								<th style="text-align: center;">Promish Date</th>

								<th style="text-align: center;">Balance Amount</th>

								<th style="text-align: center;">Diff. Insurance</th>

								<th style="text-align: center; background: rgb(212, 188, 188);">Paid
									Amount</th>

								<th style="text-align: center;">Present Balance</th>

								<th style="text-align: center;">Action</th>




							</tr>
						</thead>

						<tbody style="background: #fff;">

							<%
								WorkshopService service = new WorkshopService();
								ArrayList<WorkshopDto> list = service.getAllWorkshopCredit(
										company_id_fk, branch_id, config, request);
								for (WorkshopDto dto : list) {
									int rowId = list.indexOf(dto) + 1;
							%>


							<tr>
								<td style="text-align: center;"><%=rowId%></td>





								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getRequest_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_name()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_mobile_no()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getInsurance_company_name()%></td>
								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getJobcard_no()%></td>



								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getPromish_sate(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getBalance_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getInsurance_diff_amount()%></td>

								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold; background: rgb(212, 188, 188); color: #fff;"><a
									href="pay_deposit_workshop.jsp?id=<%=dto.getId()%>"><%=dto.getPay_balance_amount()%>
										(Pay Amount) </a></td>






								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=(dto.getBalance_amount() + dto
						.getInsurance_diff_amount())
						- dto.getPay_balance_amount()%></td>


								<td
									style="text-align: center; text-transform: capitalize; font-weight: bold;"><a
									href="workshop_balance_pay_amount_info.jsp?id=<%=dto.getId()%>">Paid
										Info </a></td>


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

