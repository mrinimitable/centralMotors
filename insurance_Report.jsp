

<!DOCTYPE html>

<%@page import="com.dto.InsuranceCompanyDto"%>
<%@page import="com.service.InsuranceCompnayService"%>
<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.InsuranceDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.InsuranceService"%>
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

		<h3 style="text-align: center;">Insurance Register </h3>

		<form id="form1" action="" method="post">
					<div class="col-md-1"></div>
					<div class="col-md-10">





						<div class="col-md-3">
							<center>
								<label>Company</label>
							</center>
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
								
								

									ArrayList<InsuranceCompanyDto> alist = aservice.getAllInsuranceCompanyActive(config, request);
									for (InsuranceCompanyDto adto : alist) {
										
										
								%>
								
								
								
								
								<option
								<%if(adto.getId()==company_id_fk) {out.print("Selected='selected'");}%>
												value="<%=adto.getId()%>"><%=adto.getNAME() %></option>
								
								
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

											<th style="text-align: center;">Veh. ID</th>
											<th style="text-align: center;">Model</th>
											<th style="text-align: center;">Variant</th>
											<th style="text-align: center;">Chechis_no</th>
											<th style="text-align: center;">Engine</th>
											<th style="text-align: center;">Customer</th>
											<th style="text-align: center;">Mobile</th>
											<th style="text-align: center;">Address</th>
											<th style="text-align: center;">Insurance Date</th>
											<th style="text-align: center;">Insurance Company</th>
											<th style="text-align: center;">Od Premium</th>
											<th style="text-align: center;">Total Premium</th>
											<th style="text-align: center;">Cover Note No</th>
											<th style="text-align: center;">Policy No</th>
											<!-- <th style="text-align: center;">Mode</th>
											<th style="text-align: center;">Bank</th>
											<th style="text-align: center;">Check NO</th>
											<th style="text-align: center;">Check Date</th> -->

											<!-- <th style="text-align: center;">Action</th> -->

										</tr>
						</thead>

						<tbody style="background: #fff;">
							

							<%

										
										
										
											InsuranceService service = new InsuranceService();
											ArrayList<InsuranceDto> list = service.getAllInsuranceByCompanyID(company_id_fk, config, request);											for (InsuranceDto dto : list) {
												int rowId = list.indexOf(dto) + 1;
										%>


										<tr>
											<td style="text-align: center;"><%=rowId%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getVehicle_id()%></td>


											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getModel_name()%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getVariant_name()%></td>


											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getChechis_no()%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getEngine_number()%></td>


											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_name()%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_mobile_no()%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCustomer_address()%></td>



											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getInsurance_date(),
						"yyyy-mm-dd", "dd-mm-yyyy")%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCompany_name()%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getOd_premium_amount()%></td>


											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getTotal_premium_amount()%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCover_note_no()%></td>										
										
							

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getPolicy_no()%></td>

										


											<%-- <td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getPayment_mode()%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCheck_bank_name()%></td>

											<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=dto.getCheck_no()%></td>
												
												
												<td
												style="text-align: center; text-transform: capitalize; font-weight: bold;"><%=LogFileService.changeFormate(dto.getCheck_date(),
						"yyyy-mm-dd", "dd-mm-yyyy")%></td> --%>




										<!-- 	<td style="text-align: center;"><a
												href="Customer_Account_Report.jsp"><i class="fa fa-bars"
													aria-hidden="true" title="Account"></i> </a></td> -->

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

