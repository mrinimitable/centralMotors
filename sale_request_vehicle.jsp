<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.PurchaseVehicleDto"%>
<%@page import="com.service.PurchaseService"%>
<%@page import="com.dto.ProductDto"%>
<%@page import="com.service.ProductService"%>
<%@page import="com.dto.FinanceBankDto"%>
<%@page import="com.service.FinanceBankService"%>
<%@page import="com.dto.AdminRagistrationDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.AdminRagistrationService"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script src="js/product_sale.js" type="text/javascript"></script>



<script>
	$(function() {
		$('#saleing_date').datetimepicker();
	});
</script>

</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">For Sale</h3>


	<div id="rev"></div>
	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">


			<%
				int id = Integer.parseInt(request.getParameter("id") == null
											? "0"
						: request.getParameter("id"));

								int update_status_id = 6;

							String cur_date = LogFileService
									.changeFormateOfCurrentDate("yyyy-MM-dd");

					PurchaseService pur_service = new PurchaseService();

					PurchaseVehicleDto dto = pur_service.getSaleRequestById(id,
										request, config);
			%>


			<div class="right_side">

				<form action="PurchaseServlet" enctype="multipart/form-data"
					id="form1" method="post">


					<div class="col-md-12" style="padding: 0px;">
						</br>

						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>VEHICLE INFO</label>
						</div>

					</div>





					<div class="col-md-12" style="padding: 0px;">
						</br>
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Choose Vehicle</label>
						</div>
						<div class="col-md-6">







							<!-- 	<input type="text" class="form-control" list="browsers"
											id="Vehical_id"
											style="padding: 0px; height: 30px; "
											placeholder="Available Vehicle"
											 /> -->

							<div id="rev">
							
							</div>


							<select name="Vehical_id" id="Vehical_id" class="form-control"
								onblur="getVehicleInfo(this.value);">

								<option value="0">Select Vehicle No</option>

								<%
									PurchaseService service = new PurchaseService();
							ArrayList<PurchaseVehicleDto> list = service
												.getAllPurchaseVehicleBYBranchIDAndVariant(branch_id,  dto.getVariant_id_fk(), config, request);
																																																																																				
									for (PurchaseVehicleDto pur_dto : list) {
				  int rowId = list.indexOf(pur_dto) + 1;
								%>

								<option value="<%=pur_dto.getVehical_id()%>"><%=pur_dto.getVehical_id()%></option>

								<%
									}
								%>

							</select>

							<%-- <datalist id="vehicle_browsers">



								<%
									PurchaseService service = new PurchaseService();
											ArrayList<PurchaseVehicleDto> list = service
					.getAllPurchaseVehicleBYBranchIDAndVariant(branch_id,  dto.getVariant_id_fk(), config, request);
																																																						
									for (PurchaseVehicleDto pur_dto : list) {
			                int rowId = list.indexOf(pur_dto) + 1;
								%>

								<option value="<%=pur_dto.getVehical_id()%>" />

								<%
									}
								%>

							</datalist> --%>





						</div>








					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Model</label>
						</div>
						<div class="col-md-6">

							<input type="hidden" id="model_id_fk" class="form-control"
								readonly="readonly"> <input type="text"
								name="model_name" id="model_name" class="form-control"
								readonly="readonly"> <input type="hidden" name="id"
								id="id">




						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Varient</label>
						</div>
						<div class="col-md-6">


							<input type="text" id="variant_name" class="form-control"
								readonly="readonly"> <input type="hidden"
								id="variant_id_fk" class="form-control" readonly="readonly">
						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Color</label>
						</div>
						<div class="col-md-6">


							<input type="text" id="color_name" class="form-control"
								readonly="readonly"> <input type="hidden"
								id="color_id_fk" class="form-control" readonly="readonly">
						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Chechis No</label>
						</div>
						<div class="col-md-6">


							<input type="text" id="chechis_no" class="form-control"
								readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Engine Number</label>
						</div>
						<div class="col-md-6">


							<input type="text" id="engine_number" class="form-control"
								readonly="readonly">


						</div>
					</div>






					<%-- 		<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Request Model</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getModel_name()%>"
											class="form-control" readonly="readonly">




									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Request Varient</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getVariant_name()%>"
											class="form-control" readonly="readonly">




									</div>
								</div>






								<div class="col-md-12" style="padding: 0px;">


									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Request Color</label>
									</div>
									<div class="col-md-6">



										<input type="text" value="<%=dto.getColor_name()%>"
											class="form-control" readonly="readonly">

									</div>
								</div> --%>



					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Request Date</label>
						</div>
						<div class="col-md-6">



							<input type="text" value="<%=dto.getSaleing_date()%>"
								class="form-control" readonly="readonly">
						</div>
					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>

						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>SALE INFO</label>
						</div>

					</div>





					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Sale Date</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="saleing_date" id="saleing_date"
								placeholder="saleing_date" value="<%=cur_date%>"
								class="form-control" readonly="readonly"> <input
								type="hidden" name="request_id_fk" id="request_id_fk"
								value="<%=id%>"> <input type="hidden"
								name="branch_id_fk" id="branch_id_fk" value="<%=branch_id%>">
							<input type="hidden" name="update_status_id"
								id="update_status_id" value="<%=update_status_id%>"> <input
								type="hidden" name="session_year" id="session_year"
								value="<%=session_year%>"> <input type="hidden"
								name="creator_id_fk" id="creator_id_fk" value="<%=creator_id%>">
							<input type="hidden" name="showroom_price" id="showroom_price"
								value="<%=dto.getShowroom_price()%>"> <input
								type="hidden" name="rto_tax_price" id="rto_tax_price"
								value="<%=dto.getRto_tax_price()%>"> <input
								type="hidden" name="insurance_price" id="insurance_price"
								value="<%=dto.getInsurance_price()%>"> <input
								type="hidden" name="gst_per_one" id="gst_per"
								value="<%=dto.getGst_per()%>"> <input type="hidden"
								name="cess_per" id="cess_per" value="<%=dto.getCess_per()%>">
							<input type="hidden" name="tcs_per" id="tcs_per"
								value="<%=dto.getTcs_per()%>"> <input type="hidden"
								name="handling_charges" id="handling_charges"
								value="<%=dto.getHandling_charges()%>"> <input
								type="hidden" name="tcs_amount" id="tcs_amount"
								value="<%=dto.getTcs_amount()%>"> <input type="hidden"
								name="showroom_gross_price" id="showroom_gross_price"
								value="<%=dto.getShowroom_gross_price()%>"> <input
								type="hidden" name="consumer_schemes" id="consumer_schemes"
								value="<%=dto.getConsumer_schemes()%>">


						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Sales Manager</label>
						</div>
						<div class="col-md-6">

							<select id="sales_manager_id_fk" name="sales_manager_id_fk"
								class="form-control" onblur="getSalesmanagerName();"
								onchange="getSalesmanagerName" disabled="disabled">

								<%
									AdminRagistrationService mService=new AdminRagistrationService();
																																												ArrayList<AdminRagistrationDto> dlist=mService.getAllSalesManagerBYBranchID(branch_id, request,config);
																																											for(AdminRagistrationDto mDto : dlist){
								%>



								<option
									<%if (dto.getSales_manager_id_fk()==(mDto.getCreator_id())) {
				out.print("Selected='selected'");
			}%>
									value="<%=mDto.getCreator_id()%>"><%=mDto.getNAME()%></option>



								<%
									}
								%>

							</select> <input type="hidden" name="sales_manager_id_fk"
								id="sales_manager_id_fk"
								value="<%=dto.getSales_manager_id_fk()%>"> <input
								type="hidden" name="sales_manager_name" id="sales_manager_name"
								value="<%=dto.getSales_manager_name()%>">
						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Sales Consultant</label>
						</div>
						<div class="col-md-6">

							<select class="form-control" onblur="getSales_consultant_name();"
								onchange="getSales_consultant_name();" disabled="disabled">

								<%
									AdminRagistrationService fService=new AdminRagistrationService();
																																																										ArrayList<AdminRagistrationDto> dlist1=fService.getAllSalesConsultantBYBranchID(branch_id, request,config);
																																																												for(AdminRagistrationDto mDto : dlist1){
								%>



								<option
									<%if (dto.getSales_consultant_id_fk()==(mDto.getCreator_id())) {
				out.print("Selected='selected'");
			}%>
									value="<%=mDto.getCreator_id()%>"><%=mDto.getNAME()%></option>



								<%
									}
								%>

							</select> <input type="hidden" name="sales_consultant_id_fk"
								id="sales_consultant_id_fk"
								value="<%=dto.getSales_consultant_id_fk()%>"> <input
								type="hidden" name="sales_consultant_name"
								id="sales_consultant_name"
								value="<%=dto.getSales_consultant_name()%>">
						</div>
					</div>






					<%-- <div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Sales Consultant</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="sales_consultant_name"
											id="sales_consultant_name"
											placeholder="sales_consultant_name"
											class="form-control"
											value="<%=dto.getSales_consultant_name()%>"
											readonly="readonly"> <input type="hidden"
											name="sales_consultant_id_fk" id="sales_consultant_id_fk"
											value="<%=dto.getSales_consultant_id_fk()%>">



									</div>
								</div> --%>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Customer Name</label>
						</div>
						<div class="col-md-6">

							<input type="text" name="customer_name" id="customer_name"
								placeholder="Customer Name" class="form-control"
								value="<%=dto.getCustomer_name()%>" readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Mobile No</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_mobile_no"
								id="customer_mobile_no" placeholder="Customer Mobile"
								class="form-control" value="<%=dto.getCustomer_mobile_no()%>"
								readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Address</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_address" id="customer_address"
								placeholder="Address" class="form-control"
								value="<%=dto.getCustomer_address()%>" readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Customer_ GstIn</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_gstIn" id="customer_gstIn"
								placeholder="customer_gstIn" class="form-control"
								value="<%=dto.getCustomer_gstIn()%>" readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Adhar No.</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="adhar_no" id="adhar_no"
								placeholder="Enter  Adhar No" value="<%=dto.getAdhar_no()%>"
								class="form-control" readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Pan No.</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="pan_no" id="pan_no"
								placeholder="Enter  Pan No" value="<%=dto.getPan_no()%>"
								class="form-control" readonly="readonly">



						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Exchange Vehicle </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="exchange_vehicle_name"
								id="exchange_vehicle_name" placeholder="exchange_vehicle_name"
								value="<%=dto.getExchange_vehicle_name()%>" class="form-control"
								readonly="readonly">



						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Old Vehicle Reg No </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="old_vehicle_reg_no"
								id="old_vehicle_reg_no" placeholder="old_vehicle_reg_no"
								value="<%=dto.getOld_vehicle_reg_no()%>" class="form-control"
								readonly="readonly">



						</div>
					</div>











					<div class="col-md-12" style="padding: 0px;">

						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>On Road Price</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="sale_price" id="sale_price"
								class="form-control" placeholder=""
								value="<%=dto.getSale_price()%>" readonly="readonly">



						</div>

					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Rsa Amount</label>
						</div>
						<div class="col-md-6">

							<!-- <span id="accessories_amount_span">0</span> -->

							<input type="text" name="rsa_amount" id="rsa_amount"
								onblur="getfinal_price();" class="form-control"
								value="<%=dto.getRsa_amount()%>" style="background: #ffcbcb"
								readonly="readonly">



						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Extended Warranty </label>
						</div>
						<div class="col-md-6">

							<!-- <span id="accessories_amount_span">0</span> -->
							<input type="text" name="extended_warranty_amount"
								id="extended_warranty_amount" onblur="getfinal_price();"
								class="form-control"
								value="<%=dto.getExtended_warranty_amount()%>"
								style="background: #ffcbcb" readonly="readonly">



						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Other Charges</label>
						</div>
						<div class="col-md-6">

							<!-- <span id="accessories_amount_span">0</span> -->
							<input type="text" name="other_charges" id="other_charges"
								onblur="getfinal_price();" class="form-control"
								value="<%=dto.getOther_charges()%>" style="background: #ffcbcb"
								readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Accessories Amount</label>
						</div>
						<div class="col-md-6">

							<!-- <span id="accessories_amount_span">0</span> -->
							<input type="text" name="accessories_amount"
								id="accessories_amount" class="form-control"
								value="<%=dto.getAccessories_amount()%>" readonly="readonly">

						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Consultant Bonus</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="other_bonus_amount"
								id="other_bonus_amount" class="form-control"
								onblur="getfinal_price();" placeholder=""
								value="<%=dto.getOther_bonus_amount()%>" readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Old Vehicle Value </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="old_vehicle_value"
								id="old_vehicle_value" placeholder="old_vehicle_value"
								value="<%=dto.getOld_vehicle_value()%>" class="form-control"
								readonly="readonly">



						</div>
					</div>






					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Exchange Bonus</label>
						</div>
						<div class="col-md-3">
							<input type="text" name="exchange_bonus_amount"
								id="exchange_bonus_amount" class="form-control"
								onblur="getfinal_price();" placeholder=""
								value="<%=dto.getExchange_bonus_amount()%>" readonly="readonly">



						</div>


						<div class="col-md-3">


							<input type="text" name="Variant_exchange_bonus_amount"
								id="variant_exchange_bonus_amount" class="form-control"
								value="<%=dto.getVariant_exchange_bonus_amount()%>"
								style="background: #ffcbcb" readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Lottery Bonus </label>
						</div>
						<div class="col-md-3">
							<input type="text" name="lottery_bonus_amount"
								id="lottery_bonus_amount" class="form-control"
								onblur="getfinal_price();" placeholder=""
								value="<%=dto.getLottery_bonus_amount()%>" readonly="readonly">


						</div>

						<div class="col-md-3">


							<input type="text" name="Variant_lottery_bonus_amount"
								id="variant_lottery_bonus_amount" class="form-control"
								value="<%=dto.getVariant_lottery_bonus_amount()%>"
								style="background: #ffcbcb" readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Corporate Bonus</label>
						</div>
						<div class="col-md-3">
							<input type="text" name="corporate_bonus_amount"
								id="corporate_bonus_amount" class="form-control"
								onblur="getfinal_price();" placeholder=""
								value="<%=dto.getCorporate_bonus_amount()%>" readonly="readonly">



						</div>


						<div class="col-md-3">


							<input type="text" name="Variant_corporate_bonus_amount"
								id="variant_corporate_bonus_amount" class="form-control"
								value="<%=dto.getVariant_corporate_bonus_amount()%>"
								style="background: #ffcbcb" readonly="readonly">



						</div>
					</div>




					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Net To Collect Price</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="final_price" id="final_price"
								class="form-control" placeholder=""
								value="<%=dto.getFinal_price()%>" readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						</br>

						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>FINANCE INFO</label>
						</div>

					</div>



					<div class=" col-md-12 ">

						</br>


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Finance</label>
						</div>


						<div class="col-md-2">

							<table style="width: 100%">
								<tr align="center">
									<td><input type="radio" name="finance_available"
										<%if("No".equalsIgnoreCase(dto.getFinance_available())) {%>
										checked="checked" <%}%> onclick="showHidefinance(this.value)"
										value="No" /> <strong
										style="margin-left: 5px; font-size: 14px; font-weight: normal;">
											No</strong> <input type="radio" name="finance_available"
										<%if("Yes".equalsIgnoreCase(dto.getFinance_available())) {%>
										checked="checked" <%}%> onclick="showHidefinance(this.value)"
										value="Yes" /> <strong
										style="margin-left: 5px; font-size: 14px; font-weight: normal;">Yes
									</strong></td>
								</tr>
							</table>

						</div>
						</br>

					</div>



					<div class="col-lg-12 col-md-12 " id="ddDiv_finance"
						style="display: none;">


						<div class="col-md-12" style="padding: 0px;">

							<div class="col-md-2"></div>
							<div class="col-md-3">
								<label>Finance Company</label>
							</div>

							<div class="col-md-6">


								<select class="form-control" onblur="getFinanceCompanyName();"
									onchange="getFinanceCompanyName();" disabled="disabled">

									<%
										FinanceBankService fin_Service=new FinanceBankService();
																																																																							ArrayList<FinanceBankDto>mlist=fin_Service.getAllFianaceBankActive(config, request);
																																																																																								
																																																																																								
																																																																							for(FinanceBankDto mDto : mlist){
									%>
									<%-- <option value="<%=mDto.getId()%>"><%=mDto.getNAME()%></option> --%>



									<option
										<%if (dto.getFinance_company_id_fk()==(mDto.getId())) {
				out.print("Selected='selected'");
			}%>
										value="<%=mDto.getId()%>"><%=mDto.getNAME()%></option>



									<%
										}
									%>

								</select> <input type="hidden" name="finance_company_name"
									id="finance_company_name"
									value="<%=dto.getFinance_company_name()%>"> <input
									type="hidden" name="finance_company_id_fk"
									id="finance_company_id_fk"
									value="<%=dto.getFinance_company_id_fk()%>">

							</div>
						</div>


						<div class="col-md-12" style="padding: 0px;">

							<div class="col-md-2"></div>
							<div class="col-md-3">
								<label>Finance Branch</label>
							</div>
							<div class="col-md-6">

								<input type="text" name="finance_branch_name"
									id="finance_branch_name"
									placeholder="Enter Finance Branch Name"
									value="<%=dto.getFinance_branch_name()%>" class="form-control"
									readonly="readonly">



							</div>

						</div>


						<div class="col-md-12" style="padding: 0px;">
							<div class="col-md-2"></div>
							<div class="col-md-3">
								<label> Finance Date</label>
							</div>
							<div class="col-md-6">
								<input type="text" name="finance_date" id="finance_date"
									placeholder="Date" value="<%=dto.getSaleing_date()%>"
									class="form-control" readonly="readonly">


							</div>
						</div>

						<div class="col-md-12" style="padding: 0px;">
							<div class="col-md-2"></div>
							<div class="col-md-3">
								<label> Do Amount</label>
							</div>
							<div class="col-md-6">
								<input type="text" name="finance_amount" id="finance_amount"
									placeholder="" onblur="diposit_amount_a();"
									class="form-control" value="<%=dto.getFinance_amount()%>"
									readonly="readonly">

							</div>
						</div>



						<div class="col-md-12" style="padding: 0px;">
							<div class="col-md-2"></div>
							<div class="col-md-3">
								<label> Do No</label>
							</div>
							<div class="col-md-6">
								<input type="text" name="do_no" id="do_no"
									placeholder="Enter do_no" class="form-control"
									value="<%=dto.getDo_no()%>" readonly="readonly">

							</div>
						</div>






					</div>


					<div class="col-md-12" style="padding: 0px;">

						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> booking amount </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="booking_amount" id="booking_amount"
								class="form-control" onblur="diposit_amount_a();" placeholder=""
								value="<%=dto.getBooking_amount()%>" readonly="readonly">


						</div>
					</div>



					<div class="col-md-12" style="padding: 0px; display: none;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Cash Diposit Amount</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="diposit_amount" id="diposit_amount"
								placeholder="" class="form-control"
								value="<%=dto.getDiposit_amount()%>" readonly="readonly">


						</div>
					</div>






					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Pay Diposit(In Cash)</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="pay_diposit_amount_cash"
								id="pay_diposit_amount_cash" placeholder="Enter Minimum Value 0"
								value="<%=dto.getPay_diposit_amount_cash()%>"
								class="form-control" onblur="balanceAmt();"
								onkeypress="return onlyNumberWithFloat(htmlEvent)"
								readonly="readonly">


						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						</br>

						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>Payment Mode</label>
						</div>

					</div>


					<div class=" col-md-12 ">



						<table style="width: 100%">
							<tr align="center">
								<td><input type="radio" name="diposit_mode"
									<%if("Cash".equalsIgnoreCase(dto.getDiposit_mode())) {%>
									checked="checked" <%}%> onclick="showHideDD(this.value)"
									value="Cash" /> <strong
									style="margin-left: 5px; font-size: 14px; font-weight: normal;">
										Cash</strong> <input type="radio"
									<%if("Cheque".equalsIgnoreCase(dto.getDiposit_mode())) {%>
									checked="checked" <%}%> name="diposit_mode"
									onclick="showHideDD(this.value)" value="Cheque" /> <strong
									style="margin-left: 5px; font-size: 14px; font-weight: normal;">Cheque
										/ DD </strong> <input type="radio"
									<%if("Swap".equalsIgnoreCase(dto.getDiposit_mode())) {%>
									checked="checked" <%}%> name="diposit_mode"
									onclick="showHideDD(this.value)" value="Swap" /> <strong
									style="margin-left: 5px; font-size: 14px; font-weight: normal;">Neft
										/ Rtgs/Imps </strong></td>
							</tr>
						</table>



						<div class=" col-md-12 " style="padding: 0px;">
							<div class=" col-md-2 "></div>

							<div class="col-lg-12 col-md-12 " id="ddDiv"
								style="display: none;">
								<br />


								<div class=" col-md-3 ">
									<input type="text" class="form-control" id="diposit_bank"
										name="diposit_bank" placeholder="Bank"
										value="<%=dto.getDiposit_bank()%>" readonly="readonly" />
								</div>
								<div class=" col-md-3 ">
									<input type="text" class="form-control" id="diposit_cheaqe_no"
										name="diposit_cheaqe_no" placeholder="Cheque No./Online."
										title="Cheque / DD / Swap No."
										value="<%=dto.getDiposit_cheaqe_no()%>" readonly="readonly" />
								</div>
								<div class=" col-md-3">
									<input type="text" class="form-control"
										id="diposit_cheaqe_date" name="diposit_cheaqe_date"
										placeholder="Date" readonly="readonly"
										value="<%=dto.getDiposit_cheaqe_date()%>" readonly="readonly" />
								</div>

								<div class=" col-md-3">
									<input type="text" class="form-control"
										id="pay_diposit_amount_cheque"
										name="pay_diposit_amount_cheque" placeholder="Cheque Amount"
										value="<%=dto.getPay_diposit_amount_cheque()%>"
										onblur="balanceAmt();" readonly="readonly" />
								</div>
							</div>

						</div>

					</div>


					<div class="col-md-12" style="padding: 0px; display: none;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Total Pay Diposit </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="pay_diposit_amount"
								id="pay_diposit_amount" placeholder=""
								value="<%=dto.getPay_diposit_amount()%>" class="form-control"
								onblur="balanceAmt();" readonly="readonly">


						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Balance Amount </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="balance_amount" id="balance_amount"
								placeholder=""
								value="<%=dto.getDiposit_amount()-dto.getPay_diposit_amount()%>"
								class="form-control" onblur="balanceAmt();" readonly="readonly">


						</div>
					</div>









					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Diposit Reamrk</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="diposit_cheaqe_reamrk"
								id="diposit_cheaqe_reamrk" placeholder="Remark"
								value="<%=dto.getDiposit_cheaqe_reamrk()%>" class="form-control"
								readonly="readonly">

						</div>
					</div>


					<div class="col-md-12" style="padding: 0px; display: none;">


						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>Add Accessories</label>
						</div>

					</div>






					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="display: none;">
						<br></br>
						<div class="table-responsive">
							<table class="table table-bordered">
								<tbody>
									<tr style="background: #eee;">

										<!-- <th style="text-align: center; width: 20%;">Variant</th> -->
										<th style="text-align: center; width: 35%;">Name</th>
										<th style="text-align: center; display: none;">Description</th>

										<th style="text-align: center; width: 15%;">Price</th>
										<th style="text-align: center; width: 15%;">Qty.</th>
										<th style="text-align: center; width: 15%;">Amount</th>



									</tr>


									<tr>





										<td><div class="col-md-12"
												style="padding: 0px; text-align: center;">

												<input type="text" class="form-control" list="browsers"
													id="item_code"
													style="padding: 0px; height: 25px; text-align: center;"
													placeholder="Item Code"
													onblur="checkCodeAvail(this.value);" />

												<div id="rev"></div>


												<datalist id="browsers">
													<%
														ProductService pro_ser1 = new ProductService();
																																																																																																										ArrayList<ProductDto> pro_list1 = pro_ser1.getAllProductCodeByCatID(dto.getVariant_id_fk(), config, request);
																																																																																																											for (ProductDto pro_dto1 : pro_list1) {
													%>

													<option value="<%=pro_dto1.getItem_code()%>" />

													<%
														}
													%>




												</datalist>


											</div></td>




										<td>

											<div class="col-md-12" style="padding: 0px;">
												<div id="price_div"></div>

												<input type="text" class="form-control"
													style="padding: 0px; height: 25px; text-align: center;"
													id="gst_sale_price"
													onkeypress="return onlyNumberWithFloat(event)"
													onblur="setDisbasicToDisGStPrice();" value="0.00" /> <input
													type="hidden" id="cat_id" value="0" /> <input
													type="hidden" id="cat_name" value="0" /> <input
													type="hidden" id="item_id" value="0" /> <input
													type="hidden" id="gst_per" value="0" />

											</div>
										</td>



										<td><div class="col-md-12" style="padding: 0px;">
												<input type="text" class="form-control"
													style="padding: 0px; height: 25px; text-align: center;"
													name="quantity" id="quantity" value="0"
													onkeypress="return onlyNumberWithFloat(htmlEvent)"
													placeholder="Quantity" onblur="setAmount();" />

											</div></td>


										<td><div class="col-md-12" style="padding: 0px;">
												<input type="text" class="form-control"
													style="padding: 0px; height: 25px; text-align: center;"
													id="tot_amt" value="0"
													onkeypress="return onlyNumberWithFloat(htmlEvent)"
													placeholder="tot_amt"
													onblur="autoFocus(<%=dto.getId()%>); getfinal_price();" />


											</div></td>





									</tr>
									<!-- On cells (`td` or `th`) -->
								</tbody>
							</table>
						</div>
					</div>




					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="display: none;">
						<div class="table-responsive">


							<table class="table table-bordered">
								<thead class="thead_bg">
									<tr>




										<th style="text-align: center;">Item Code</th>

										<th style="text-align: center; display: none;">Item Name</th>

										<th style="text-align: center;">Price</th>

										<th style="text-align: center;">Qty.</th>
										<th style="text-align: center;">Amount.</th>
										<th width="5%"></th>

									</tr>
								</thead>


								<tbody id="tableScroll" style="background: #fff;">


									<%
										ProductDto pro_dto = new ProductDto();
																																																																																									
																																	ProductService pro_ser = new ProductService();
																																																										
																																						int row_id=0; 
																														ArrayList<ProductDto> item_list = pro_ser.getAllSaleProductByRequestID(dto.getId(), config, request);
																																for (ProductDto item_dto : item_list) {												
																																																									
																																																											
																																 row_id=	item_list.indexOf(item_dto)+1;
																																																										
																												/* dto = pro_ser.GetItemInfoByCode(item_dto.getItem_code(), request, config); */
									%>





									<tr>
									<tr>
										<%-- 
														<td><div class="col-md-12" style="padding: 0px;">

															
															
																<input type="text" class="form-control"
																	placeholder="Cat Name"
																	style="padding: 0px; height: 25px; text-align: center;"
																	id="cat_name<%=row_id%>" name="Cat_name"
																	value="<%=item_dto.getCat_name()%>" readonly="readonly" />

																<input type="hidden" id="cat_id<%=row_id%>"
																	name="Cat_id" value="<%=item_dto.getCat_id_fk()%>" />


															</div></td> --%>


										<td><div class="col-md-12"
												style="padding: 0px; text-align: center;">

												<input type="text" class="form-control" list="browsers"
													id="item_code<%=row_id%>" name="Item_code"
													style="padding: 0px; height: 25px; text-align: center;"
													placeholder="Item Code"
													value="<%=item_dto.getItem_code()%>" readonly="readonly" />
												<input type="hidden" id="item_id<%=row_id%>" name="Item_id"
													value="<%=item_dto.getItem_id_fk()%>" /> <input
													type="hidden" id="sell_item_id" name="Sell_item_id"
													value="<%=item_dto.getAccessories_item_id()%>" /> <input
													type="hidden" id="cat_id<%=row_id%>" name="Cat_id"
													value="<%=item_dto.getCat_id()%>" /> <input type="hidden"
													id="cat_name<%=row_id%>" name="Cat_name"
													value="<%=item_dto.getCat_name()%>" /> <input
													type="hidden" id="Gst_per<%=row_id%>" name="Gst_per"
													value="<%=item_dto.getGst_per()%>" />


												<td>

													<div class="col-md-12" style="padding: 0px;">

														<input type="text" class="form-control" list="browsers"
															id="gst_sale_price<%=row_id%>" name="Gst_sale_price"
															style="padding: 0px; height: 25px; text-align: center;"
															placeholder="" value="<%=item_dto.getGst_sale_price()%>"
															readonly="readonly" />



													</div>
												</td>



												<td><div class="col-md-12" style="padding: 0px;">
														<input type="text" class="form-control"
															style="padding: 0px; height: 25px; text-align: center;"
															name="Quantity" id="quantity<%=row_id%>"
															value="<%=item_dto.getItem_qty()%>"
															onkeypress="return onlyNumberWithFloat(htmlEvent)"
															placeholder="Quantity" onblur="setAmount();"
															readonly="readonly" />

													</div></td>


												<td><div class="col-md-12" style="padding: 0px;">
														<input type="text" class="form-control"
															style="padding: 0px; height: 25px; text-align: center;"
															id="tot_amt<%=row_id%>" name="Tot_amt"
															value="<%=item_dto.getItem_qty()*item_dto.getGst_sale_price()%>"
															onkeypress="return onlyNumberWithFloat(htmlEvent)"
															placeholder="tot_amt" readonly="readonly" />


													</div></td>




												<td>
													<div class="col-md-4">

														<span
															style="display: block; float: left; cursor: pointer;"
															id="1cross<%=row_id%>"
															onclick="deleteSelectedRow(<%=row_id%>,<%=item_dto.getItem_qty()%>,<%=item_dto.getAccessories_item_id()%>)">

															<span class="fa-stack"> <i
																class="fa fa-circle fa-stack-2x text-danger"></i> <i
																class="fa fa-times fa-stack-1x fa-inverse"> </i>
														</span>
														</span>
													</div>
												</td>
									</tr>






									<%
										}
									%>


								</tbody>

								<!-- On rows -->
							</table>


						</div>
					</div>



					<!-- 		<div class="col-md-12" style="padding: 0px;">
									</br>

									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Confirmation Sale</label>
									</div>
									<div class="col-md-6">

										<select id="Approve_status" name="Approve_status"
											class="form-control">
											<option value="ApproveSale">Approve Sale</option>
											<option value="Cancel">Cancle</option>
									</div>
								</div> -->






					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-5">&nbsp;</div>
						<div class="col-md-7">
							<input type="submit" name="submit" id="submit" value="Submit"
								class="submit"
								onclick="return confirm('Are you sure to Submit Info ?')"
								style="margin-bottom: 10px;">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>




	<script type="text/javascript" src="js/JQuerylib.js"></script>
	<script type="text/javascript" src="js/JQueryValidate.js"></script>
	<script src="js/jquery.datetimepicker.js"></script>


<!-- 
	<script type="text/javascript">
		$().ready(function() {	
			
			
			findTotal();	
			
	
			});

	
	</script> -->






	<script type="text/javascript">
		$().ready(function() {
			
		/* 	getFinanceBranch(); */
			
			var flag1='<%=dto.getFinance_available()%>';	
			
			var flag='<%=dto.getDiposit_mode()%>';	
			
			
			showHidefinance(flag1);
			
			showHideDD(flag);
			
			
			
			
	
			});

	
	</script>


	<script type="text/javascript">


		function onlyNumberWithFloat(htmlEvent, allowChar) {
			var keynum;
			if (window.event) // IE
			{
				keynum = htmlEvent.keyCode;
			} else if (htmlEvent.which) // Netscape/Firefox/Opera
			{
				keynum = htmlEvent.which;
			}
			// alert(keynum);
			// alert(allowChar.charCodeAt(0));
			var code = '';
			if (allowChar != undefined) {
				code = allowChar.charCodeAt(0);
			}
			if (keynum < 46 || keynum > 57 || keynum == 47) {
				if (keynum != 8 && keynum != code) {
					return false;
				}
			}
		}
		
		
		function onlyNumber(htmlEvent, allowChar) {
			var keynum;
			if (window.event) // IE
			{
				keynum = htmlEvent.keyCode;
			} else if (htmlEvent.which) // Netscape/Firefox/Opera
			{
				keynum = htmlEvent.which;
			}
			// alert(keynum);
			// alert(allowChar.charCodeAt(0));
			var code = '';
			if (allowChar != undefined) {
				code = allowChar.charCodeAt(0);
			}
			if (keynum < 48 || keynum > 57) {
				if (keynum != 8 && keynum != code) {
					return false;
				}
			}
		}
		
		
		

	</script>






	<script>



	
	
	function getSalesmanagerName(){
		
		var sales_manager_name=$("#sales_manager_id_fk :selected").text();  

		document.getElementById("sales_manager_name").value = sales_manager_name;
		
		
	}
	
	
	function getSales_consultant_name(){
		
		var sales_consultant_name=$("#sales_consultant_id_fk :selected").text();  

		document.getElementById("sales_consultant_name").value = sales_consultant_name;
		
		
	}
	
	
	
</script>




	<script type="text/javascript">
	

	
	
		$().ready(function() {
			
			
		
			
			

			$("#form1").validate({
				rules : {
					
					cat_id: "required",	
					
				},
				messages : {
					
					cat_id: "*",
					
				}
			});

		});
		
			
		

		function checkItemCode(){
					
					var Item_code = document.getElementById("Item_code").value;

				
					$.ajax({
						  
						url : 'CheckItemCodeeAjx.jsp',
						data : 'Item_code=' + Item_code,
						type : 'post',
						
						success : function(msg) {
						
							$('#Item_code').html(msg);
							 var checked = document.getElementById("check").value;
							 if(checked == "value"){
							
				 
							 document.getElementById("Item_code").value="";
							// $('#msgdiv').html("category already axist");
							 
							 var newDiv = document.createElement('div');
							 $("#codediv").html(newDiv.innerHTML ="<div class='form-group' ><div class='alert alert-warning alert-dismissible fade in text-center text-capitalize' id='forMsgDisplay' style='display: block; margin-bottom: 0px; margin-top:0px'> Itemcode already exist <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div></div>");		 
							 
							 
							 }
						}
					});				
					
					
				}	
		
		
		function getFinanceCompanyName(){
			
			var finance_company_name=$("#finance_company_id_fk :selected").text();  

			document.getElementById("finance_company_name").value = finance_company_name;			
			
		}


		function getfinanceBranchName(){
			
			var finance_branch_name=$("#finance_branch_id_fk :selected").text();  

			document.getElementById("finance_branch_name").value = finance_branch_name;			
			
		}

			function getFinanceBranch(){				
				
				var finance_company_id_fk = document.getElementById("finance_company_id_fk").value;
				
				var finance_branch_id_fk = <%=dto.getFinance_branch_id_fk()%>;
				
				
				
				$.ajax({
					
					url : 'getFinanceBranchAjax.jsp',
					data : 'finance_company_id_fk='+ finance_company_id_fk+ '&finance_branch_id_fk=' +finance_branch_id_fk,
					type : 'post',
										
					success  : function(msg){						
						
						$('#finance_branch_id_fk').html(msg);						 
					
						
					}
					
				});
				
				
			}
			
			
			
			
			function diposit_amount_a() {

				var final_price = document.getElementById("final_price").value;
				
				var finance_amount = document.getElementById("finance_amount").value;
				var booking_amount = document.getElementById("booking_amount").value;
				
						
				var sell_final_price_a = 0;
					
				
				sell_final_price_a=(parseFloat(final_price)-(parseFloat(finance_amount)+parseFloat(booking_amount)));				
				

				document.getElementById("diposit_amount").value =   (parseFloat(sell_final_price_a))
				.toFixed(2);
				
				balanceAmt();
				


			}
			
			
			
			function getfinal_price() {

				var sale_price = document.getElementById("sale_price").value;
				
				var other_bonus_amount = document.getElementById("other_bonus_amount").value;
				
				var exchange_bonus_amount = document.getElementById("exchange_bonus_amount").value;
				
				
				var lottery_bonus_amount = document.getElementById("lottery_bonus_amount").value;
				
				var corporate_bonus_amount = document.getElementById("corporate_bonus_amount").value;
				
				var accessories_amount = document.getElementById("accessories_amount").value;
				
				var rsa_amount = document.getElementById("rsa_amount").value;
				var extended_warranty_amount = document.getElementById("extended_warranty_amount").value;
				var other_charges = document.getElementById("other_charges").value;
				var old_vehicle_value = document.getElementById("old_vehicle_value").value;		
				
				/* alert("Please Change Value less then Right Value"); */
					
						
				
				var sell_final_price = 0;
				
			
			

				sell_final_price = (parseFloat(sale_price)+parseFloat(accessories_amount)+parseFloat(rsa_amount)+
						parseFloat(extended_warranty_amount)+parseFloat(other_charges))
						-(parseFloat(other_bonus_amount) + parseFloat(exchange_bonus_amount)
						+ parseFloat(lottery_bonus_amount)+ parseFloat(corporate_bonus_amount)+parseFloat(old_vehicle_value));	
				

				document.getElementById("final_price").value = (parseFloat(sell_final_price))
						.toFixed(2);
				
				
				diposit_amount_a();	
				


			}
			
			
			
			
			function balanceAmt() {

				
				var pay_diposit_amount_cash = document.getElementById("pay_diposit_amount_cash").value;
				var pay_diposit_amount_cheque = document.getElementById("pay_diposit_amount_cheque").value;		
				var diposit_amount = document.getElementById("diposit_amount").value;
				
				
				
				
				var pay_diposit_amount_cash_val = 0;
					
					
					if (pay_diposit_amount_cash == "" || isNaN(pay_diposit_amount_cash)) {

						pay_diposit_amount_cash_val = 0;
						

					} else {
						pay_diposit_amount_cash_val = pay_diposit_amount_cash;
					}

					
				

					var pay_diposit_amount_cheque_val = 0;
					

					if (pay_diposit_amount_cheque == "" || isNaN(pay_diposit_amount_cheque)) {

						pay_diposit_amount_cheque_val = 0;
						

					} else {
						pay_diposit_amount_cheque_val = pay_diposit_amount_cheque;
					}

					
				
					
					var total_paid_amt = parseFloat(pay_diposit_amount_cash_val)
							+ parseFloat(pay_diposit_amount_cheque_val);
					

					var balance_amt = parseFloat(diposit_amount) - parseFloat(total_paid_amt);
					
					
					document.getElementById("pay_diposit_amount").value = total_paid_amt.toFixed(2);
					
					document.getElementById("balance_amount").value = balance_amt.toFixed(2);
					
					
					
			
				
			}
			
		
			
		
		
			
			
			function showHidefinance(flag1) {
				if (flag1 == 'Yes') {
					
					showHideTemplateByCheckBox_finance(true, 'ddDiv_finance');			
					
				} else {
					showHideTemplateByCheckBox_finance(false, 'ddDiv_finance');
										
				}
			
				/* document.getElementById("ddno").value = "";
				document.getElementById("bankname").value = "";
				document.getElementById("ddDate").value = "";
				document.getElementById("dd_amount").value = "0"; */
				
			}

			function showHideTemplateByCheckBox_finance(flag, htmlObj) {
				// alert(htmlObj);
				var htmlObj1 = document.getElementById(htmlObj);
				if (htmlObj1 != undefined) {
					
					if (flag) {
						htmlObj1.style.display = "inline";
					} else {
						htmlObj1.style.display = "none";
					}
				}
			}
			
			
			
			
			
			function showHideDD(flag) {
				if (flag == 'DD' || flag == 'Cheque' || flag == 'Swap') {
					showHideTemplateByCheckBox(true, 'ddDiv');				
					showHideTemplateByCheckBox(false, 'ddDiv_cash');
					showHideTemplateByCheckBox(false, 'ddReturnDiv_cash');
				} else {
					showHideTemplateByCheckBox(false, 'ddDiv');
					
					showHideTemplateByCheckBox(true, 'ddDiv_cash');
					showHideTemplateByCheckBox(true, 'ddReturnDiv_cash');
				}
				document.getElementById("ddno").value = "";
				document.getElementById("bankname").value = "";
				document.getElementById("ddDate").value = "";
				document.getElementById("dd_amount").value = "0";
				returnAmt(0);
			}

			function showHideTemplateByCheckBox(flag, htmlObj) {
				// alert(htmlObj);
				var htmlObj1 = document.getElementById(htmlObj);
				if (htmlObj1 != undefined) {
					if (flag) {
						htmlObj1.style.display = "inline";
					} else {
						htmlObj1.style.display = "none";
					}
				}
			}
			
			
			function setAmount() {

				var quantity = document.getElementById("quantity").value;
				
				
				var gst_sale_price = document.getElementById("gst_sale_price").value;
				
						
				var cal_total_amount = 0;
					
				
				cal_total_amount=(parseFloat(quantity)*parseFloat(gst_sale_price));				
				

				document.getElementById("tot_amt").value =   (parseFloat(cal_total_amount))
				.toFixed(2);
				


			}
			
			
			
			
			
		
			

	</script>



	<script src="js/product_sale_update.js" type="text/javascript"></script>

	<script type="text/javascript">
			var preWorkExpIndex = <%=row_id == 0 ? 1 : row_id+1%>;
			</script>


	<script type="text/javascript">
			
			
			
				function deleteSelectedRow(rw_id, qty,item_id)
			{
				
					
					
					
				
				$.ajax({
					url: "ajex_update_accessories_itme..jsp",
					data :"item_id=" +item_id +"&&qty="+qty,
					type : "post",
					success :function(msg)
					{
						$("#abcd").html(msg);
						
						
					
					
					//	alert(invoice_no);
					window.location.reload();
				
						
					}
				});
				
				
			}
			
		
			function getItemCodeList(code) {			
				

				if (code != "") {

					$
							.ajax({

								url : 'Ajex_Item_CodeByCat.jsp',
								data : 'icode=' + code,
								type : 'post',
								success : function(msg) {

									// alert(msg);

									$('#browsers').html(msg);
									
									

								}
							});
				} else {
					document.getElementById('cat_name').focus();
				}
			}
			
			
	/* 		function findTotal() {

				var Tot_amtarr = document.getElementsByName('Tot_amt');

				var total_amt = 0.0;

				for ( var i = 0; i < Tot_amtarr.length; i++) {

					if (parseFloat(Tot_amtarr[i].value))
						total_amt = total_amt + parseFloat(Tot_amtarr[i].value);
				}

				

				document.getElementById('accessories_amount').value = parseFloat(total_amt)
						.toFixed(2);
				 
				 
				 getfinal_price();
				 
				 diposit_amount_a();
				 
			

			} */
			
			
			
			function getVehicleInfo(code) {

				if (code != "") {

					$
							.ajax({

								url : 'Ajex_getVehicle_Info_by_Name.jsp',
								data : 'icode=' + code,
								type : 'post',
								success : function(msg) {

									// alert(msg);

									$('#rev').html(msg);

									var check = document.getElementById("check").value;

									// alert(check);

									if (check == "done") {

										var duplicate_value = findDuplicateCode();

										if (duplicate_value == 0) {
											
											id,model_id_fk, model_name, variant_id_fk, variant_name, chechis_no, 
											engine_number, color_id_fk, color_name 	
											
											
											
											

											document.getElementById('id').value = document
													.getElementById('id_val').value;

											/*
											 * document.getElementById('item_name').value =
											 * document
											 * .getElementById('item_name_val').value;
											 */

											document.getElementById('model_name').value = document
													.getElementById('model_name_val').value;

											document.getElementById('variant_name').value = document
													.getElementById('variant_name_val').value;

											document.getElementById('color_name').value = document
													.getElementById('color_name_val').value;

											document.getElementById('chechis_no').value = document
													.getElementById('chechis_no_val').value;
											
											document.getElementById('engine_number').value = document
											.getElementById('engine_number_val').value;

											/* document.getElementById('quantity').focus(); */

										}
									} else {

										alert("Code is Incorrect");
										document.getElementById('item_code').value = a;
										document.getElementById('item_name').value = a;
										// document.getElementById('icode' + index).focus();
									}

								}
							});
				} else {
					document.getElementById('item_code').focus();
				}
			}
			
			
			
			$().ready(function() {

				
				 $('#form1').validate({ // initialize the plugin
				      
					 rules: {
						 Vehical_id: {
				                selectcheck: true
				            }
				        }
				    });

				    jQuery.validator.addMethod('selectcheck', function (value) {
				        return (value != '');
				    }, "Vehical required");

			});
		
			
			
			
			</script>