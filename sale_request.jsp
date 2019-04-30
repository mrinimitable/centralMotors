<!DOCTYPE html>

<%@page import="com.dto.BankDto"%>
<%@page import="com.service.BankingService"%>
<%@page import="com.dto.ModelDto"%>
<%@page import="com.dto.FinanceBankDto"%>
<%@page import="com.service.FinanceBankService"%>
<%@page import="com.dto.AdminRagistrationDto"%>
<%@page import="com.service.AdminRagistrationService"%>
<%@page import="com.dto.ColorDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.ColorService"%>
<%@page import="com.service.ModelService"%>
<%@page import="com.dto.PurchaseVehicleDto"%>
<%@page import="com.service.PurchaseService"%>
<%@page import="com.service.LogFileService"%>
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
		$('#diposit_cheaqe_date').datetimepicker();
	});
	
	$(function() {
		$('#saleing_date').datetimepicker();
	});
</script>





</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Sale Request</h3>


	<div id="rev"></div>
	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">


			<%
				int id = Integer.parseInt(request.getParameter("id") == null
																		? "0": request.getParameter("id"));																
																															

												String cur_date = LogFileService.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");

									PurchaseService pur_service = new PurchaseService();

								PurchaseVehicleDto dto = pur_service.gePurchaseVehicleById(
								id, request, config);
			%>

			<div class="right_side">

				<form action="SaleRequestServlet" enctype="multipart/form-data"
					id="new" method="post">


					<div class="col-md-12" style="padding: 0px;">
						</br>

						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>VEHICLE INFO</label>
						</div>
					</div>
					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Model</label>
						</div>

						<div class="col-md-6">

							<select id="model_id_fk" name="model_id_fk" class="form-control"
								onblur="getModelName();getVariant();"
								onchange="getModelName();getVariant();">
								<option value="">Select</option>
								<%
									ModelService mod_Service=new ModelService();
																													ArrayList<ModelDto>mod_list=mod_Service.getAllModel(config, request);
																													for(ModelDto mod_Dto : mod_list){
								%>
								<option value="<%=mod_Dto.getId()%>"><%=mod_Dto.getNAME()%></option>
								<%
									}
								%>

							</select> <input type="hidden" name="creator_id_fk" id="creator_id_fk"
								value="<%=creator_id%>"> <input type="hidden"
								name="session" id="session" value="<%=session_year%>"> <input
								type="hidden" name="model_name" id="model_name"> <input
								type="hidden" name="color_name" id="color_name"> <input
								type="hidden" name="branch_id_fk" id="branch_id_fk"
								value="<%=branch_id%>">
						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Variant</label>
						</div>
						<div class="col-md-6">

							<select id="variant_id_fk" name="variant_id_fk"
								onblur="getVariantName(),getVariantPrice(),getproduct();"
								class="form-control">
								<option value="">Select</option>

							</select>

						</div>


						<input type="hidden" name="variant_name" id="variant_name">
						<input type="hidden" name="showroom_price" id="showroom_price">
						<input type="hidden" name="rto_tax_price" id="rto_tax_price">
						<input type="hidden" name="insurance_price" id="insurance_price">
						<input type="hidden" name="gst_per_one" id="gst_per_one">
						<input type="hidden" name="cess_per" id="cess_per"> <input
							type="hidden" name="tcs_per" id="tcs_per"> <input
							type="hidden" name="handling_charges" id="handling_charges">
						<input type="hidden" name="tcs_amount" id="tcs_amount"> <input
							type="hidden" name="showroom_gross_price"
							id="showroom_gross_price"> <input type="hidden"
							name="consumer_schemes" id="consumer_schemes">

					</div>


					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Color</label>
						</div>
						<div class="col-md-6">

							<select id="color_id_fk" name="color_id_fk"
								onblur="getcolourName();" class="form-control">
								<option value="">Select</option>
								<%
									ColorService cService=new ColorService();
																													ArrayList<ColorDto> clist=cService.getAllColor(config, request);
																													for(ColorDto mDto : clist){
								%>
								<option value="<%=mDto.getId()%>"><%=mDto.getNAME()%></option>
								<%
									}
								%>

							</select>
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
								class="form-control">
						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Customer Name</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_name" id="customer_name"
								placeholder="Enter Customer Name" value="" class="form-control"
								style="background: #ffcbcb">

						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Mobile No</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_mobile_no"
								id="customer_mobile_no" placeholder=" Enter Mobile No." value=""
								class="form-control" style="background: #ffcbcb">


						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Address</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_address" id="customer_address"
								placeholder="Enter Address" value="" class="form-control"
								style="background: #ffcbcb">

						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> GST No</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_gstIn" id="customer_gstIn"
								placeholder="Enter  Customer GstIn" value=""
								class="form-control" style="background: #ffcbcb">

						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Adhar No.</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="adhar_no" id="adhar_no"
								placeholder="Enter  Adhar No" value="" class="form-control"
								style="background: #ffcbcb">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Pan No.</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="pan_no" id="pan_no"
								placeholder="Enter  Pan No" value="" class="form-control"
								style="background: #ffcbcb">

						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Exchange Vehicle Name </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="exchange_vehicle_name"
								id="exchange_vehicle_name" placeholder="Enter Exchange Vehicle"
								value="" class="form-control" style="background: #ffcbcb">



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
								value="" class="form-control">



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
								onchange="getSalesmanagerName">
								<option value="">Select</option>
								<%
									AdminRagistrationService mService=new AdminRagistrationService();
																													ArrayList<AdminRagistrationDto> dlist=mService.getAllSalesManagerBYBranchID(branch_id, request,config);
																													for(AdminRagistrationDto mDto : dlist){
								%>
								<option value="<%=mDto.getCreator_id()%>"><%=mDto.getNAME()%></option>
								<%
									}
								%>

							</select> <input type="hidden" name="creator_id_fk_sale"
								id="creator_id_fk_sale" value="<%=creator_id%>"> <input
								type="hidden" name="session_sale" id="session_sale"
								value="<%=session_year%>"> <input type="hidden"
								name="sales_manager_name" id="sales_manager_name">
						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Sales Consultant</label>
						</div>
						<div class="col-md-6">

							<select id="sales_consultant_id_fk" name="sales_consultant_id_fk"
								class="form-control" onblur="getSales_consultant_name();"
								onchange="getSales_consultant_name();">
								<option value="">Select</option>
								<%
									AdminRagistrationService fService=new AdminRagistrationService();
																													ArrayList<AdminRagistrationDto> dlist1=fService.getAllSalesConsultantBYBranchID(branch_id, request,config);
																													for(AdminRagistrationDto mDto : dlist1){
								%>
								<option value="<%=mDto.getCreator_id()%>"><%=mDto.getNAME()%></option>
								<%
									}
								%>

							</select> <input type="hidden" name="sales_consultant_name"
								id="sales_consultant_name">
						</div>
					</div>












					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>On Road Price</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="sale_price" id="sale_price"
								class="form-control" placeholder="" value="0"
								readonly="readonly">



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
								onblur="getfinal_price();" class="form-control" value="0"
								style="background: #ffcbcb">



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
								class="form-control" value="0" style="background: #ffcbcb">



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
								onblur="getfinal_price();" class="form-control" value="0"
								style="background: #ffcbcb">



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
								id="accessories_amount" onblur="getfinal_price();"
								class="form-control" value="0" style="background: #ffcbcb">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Consultant Discount</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="other_bonus_amount"
								id="other_bonus_amount" onblur="getfinal_price();"
								class="form-control" placeholder="Enter Consultant Discount"
								value="0" style="background: #ffcbcb">



						</div>
					</div>




					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Old Vehicle Value </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="old_vehicle_value"
								id="old_vehicle_value"
								placeholder="Enter Exchange Vehicle Price" value="0"
								class="form-control" style="background: #ffcbcb"
								onblur="getfinal_price();">



						</div>
					</div>




					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Exchange Bonus</label>
						</div>
						<div class="col-md-3">


							<input type="text" name="exchange_bonus_amount"
								id="exchange_bonus_amount"
								onblur="getfinal_price(); CheckExchangeBonus();"
								class="form-control" placeholder="" value="0"
								style="background: #ffcbcb">



						</div>



						<div class="col-md-3">


							<input type="text" name="Variant_exchange_bonus_amount"
								id="variant_exchange_bonus_amount" class="form-control"
								value="0" style="background: #ffcbcb" readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Loyalty Bonus </label>
						</div>
						<div class="col-md-3">
							<input type="text" name="lottery_bonus_amount"
								id="lottery_bonus_amount"
								onblur="getfinal_price(); CheckLoyaltBonus();"
								class="form-control" placeholder="" value="0"
								style="background: #ffcbcb">


						</div>

						<div class="col-md-3">


							<input type="text" name="Variant_lottery_bonus_amount"
								id="variant_lottery_bonus_amount" class="form-control" value="0"
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
								id="corporate_bonus_amount"
								onblur="CheckCorporateBonus(); getfinal_price(); "
								class="form-control" placeholder="" value="0"
								style="background: #ffcbcb">



						</div>


						<div class="col-md-3">


							<input type="text" name="Variant_corporate_bonus_amount"
								id="variant_corporate_bonus_amount" class="form-control"
								value="0" style="background: #ffcbcb" readonly="readonly">



						</div>
					</div>




					<div class="col-md-12" style="padding: 0px;">

						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Net To Collect Price </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="final_price" id="final_price"
								class="form-control" placeholder="" value="0"
								readonly="readonly">


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
										checked="checked" onclick="showHidefinance(this.value)"
										value="No" /> <strong
										style="margin-left: 5px; font-size: 14px; font-weight: normal;">
											No</strong> <input type="radio" value="Yes" name="finance_available"
										onclick="showHidefinance(this.value)" /> <strong
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

								<select id="finance_company_id_fk" name="finance_company_id_fk"
									class="form-control" onblur="getFinanceCompanyName()"
									onchange="getFinanceCompanyName()">
									<option value="0">Select</option>
									<%
										FinanceBankService fin_Service=new FinanceBankService();
																																	ArrayList<FinanceBankDto>mlist=fin_Service.getAllFianaceBankActive(config, request);
																																	for(FinanceBankDto mDto : mlist){
									%>
									<option value="<%=mDto.getId()%>"><%=mDto.getNAME()%></option>
									<%
										}
									%>

								</select> <input type="hidden" name="creator_id_fk" id="creator_id_fk"
									value="<%=creator_id%>"> <input type="hidden"
									name="session" id="session" value="<%=session_year%>">
								<input type="hidden" name="finance_company_name"
									id="finance_company_name">


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
									placeholder="Enter Finance Branch Name" value=""
									class="form-control">



							</div>

						</div>




						<!-- 	<div class="col-md-12" style="padding: 0px;">


											<div class="col-md-2"></div>
											<div class="col-md-3">
												<label>Finance Branch</label>
											</div>
											<div class="col-md-6">

												<select id="finance_branch_id_fk"
													name="finance_branch_id_fk"
													onblur="getfinanceBranchName();"
													class="form-control">
													<option value="0">Select</option>

												</select>



											</div>
											<input type="hidden" name="finance_branch_name"
												id="finance_branch_name">
										</div> -->






						<div class="col-md-12" style="padding: 0px;">
							<div class="col-md-2"></div>
							<div class="col-md-3">
								<label> Finance Date </label>
							</div>
							<div class="col-md-6">
								<input type="text" name="finance_date" id="finance_date"
									placeholder="Date" value="<%=cur_date%>" class="form-control">


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
									onchange="diposit_amount_a()" class="form-control" value="0">


							</div>
						</div>

						<div class="col-md-12" style="padding: 0px;">
							<div class="col-md-2"></div>
							<div class="col-md-3">
								<label> Do No</label>
							</div>
							<div class="col-md-6">
								<input type="text" name="do_no" id="do_no"
									placeholder="Enter do_no" class="form-control" value="0">

							</div>
						</div>




					</div>




					<div class="col-md-12" style="padding: 0px;">

						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Booking Amount </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="booking_amount" id="booking_amount"
								class="form-control" onblur="diposit_amount_a();" placeholder=""
								value="0" style="background: #ffcbcb">


						</div>
					</div>




					<div class="col-md-12" style="padding: 0px; display: none;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Cash Diposit Amount</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="diposit_amount" id="diposit_amount"
								placeholder="" class="form-control" value="0"
								readonly="readonly">


						</div>
					</div>





					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Pay on Delivery(In Cash)</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="pay_diposit_amount_cash"
								id="pay_diposit_amount_cash" placeholder="" value="0"
								class="form-control" style="background: #ffcbcb"
								onblur="balanceAmt();">


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
									checked="checked" onclick="showHideDD(this.value)" value="Cash" />
									<strong
									style="margin-left: 5px; font-size: 14px; font-weight: normal;">
										Cash</strong> <input type="radio" value="Cheque" name="diposit_mode"
									onclick="showHideDD(this.value)" /> <strong
									style="margin-left: 5px; font-size: 14px; font-weight: normal;">Cheque
										/ DD </strong> <input type="radio" value="Online" name="diposit_mode"
									onclick="showHideDD(this.value)" /> <strong
									style="margin-left: 5px; font-size: 14px; font-weight: normal;">Neft
										/ Rtgs/Imps </strong></td>
							</tr>
						</table>





						<div class=" col-md-12 " style="padding: 0px;">
							<div class=" col-md-2 "></div>

							<div class="col-lg-12 col-md-12 " id="ddDiv"
								style="display: none;">
								<br />


								<div class=" col-md-3">

									<select id="diposit_bank" name="diposit_bank"
										class="form-control">

										<option value="0">Select</option>
										<%
											BankingService bak_ser = new BankingService();
																				ArrayList<BankDto> bank_list = bak_ser
																				.getAllMasterBankActive(request, config);
																						for (BankDto mDto : bank_list) {
										%>
										<option value="<%=mDto.getBank_name()%>"><%=mDto.getBank_name()%></option>
										<%
											}
										%>

									</select>



								</div>




								<div class=" col-md-3">
									<input type="text" class="form-control" id="diposit_cheaqe_no"
										name="diposit_cheaqe_no" placeholder="Cheque No./Online."
										title="Cheque / DD / Swap No." />
								</div>
								<div class=" col-md-3">
									<input type="text" class="form-control"
										id="diposit_cheaqe_date" name="diposit_cheaqe_date"
										placeholder="Date" readonly="readonly" />
								</div>

								<div class=" col-md-3">
									<input type="text" class="form-control"
										id="pay_diposit_amount_cheque"
										name="pay_diposit_amount_cheque" placeholder="Cheque Amount"
										value="0" onblur="balanceAmt();" />
								</div>


							</div>

						</div>

					</div>



					<div class="col-md-12" style="padding: 0px; display: none;">

						</br>
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Total Pay on Delivery </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="pay_diposit_amount"
								id="pay_diposit_amount" placeholder="" value="0"
								class="form-control" style="background: #ffcbcb"
								onblur="balanceAmt();">


						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Balance Amount </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="balance_amount" id="balance_amount"
								placeholder="" value="0" class="form-control"
								style="background: #ffcbcb" onblur="balanceAmt();">


						</div>
					</div>







					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Diposit Reamrk</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="diposit_cheaqe_reamrk"
								id="diposit_cheaqe_reamrk" placeholder="Remark" value=""
								class="form-control" style="background: #ffcbcb">


						</div>
					</div>


					<div class="col-md-12" style="padding: 0px; display: none;">
						</br>

						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>Add Accessories</label>
						</div>
					</div>



					<div class="col-md-12" style="padding: 0px; display: none;">
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


										<%-- 		<td>
															<div class="col-md-12"
																style="padding: 0px; text-align: center;">

																<input type="text" class="form-control"
																	list="cat_browser" id="cat_name"
																	style="padding: 0px; height: 25px; text-align: center;"
																	placeholder="Item Code"
																	onblur="getItemCodeList(this.value);" />


																<div id="rev"></div>



																<datalist id="cat_browser">
																	<%
 	                                          
													
													VariantService v_ser = new VariantService();
																	
  												ArrayList<VariantDto> pro_lis = v_ser.getAllVariant(request, config);
  												for (VariantDto v_dto : pro_lis) {
                                                        %>

																	<option value="<%=v_dto.getNAME()%>" />
																	<%
														}
													%>
																</datalist>


															</div>
														</td> --%>




										<td>


											<div class="col-md-12"
												style="padding: 0px; text-align: center;">

												<input type="text" class="form-control" list="browsers"
													id="item_code"
													style="padding: 0px; height: 25px; text-align: center;"
													placeholder="Item Code"
													onblur="checkCodeAvail(this.value);" />

												<div id="rev"></div>


												<datalist id="browsers">



												</datalist>


											</div>


										</td>




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
													name="quantity" id="quantity" value="1"
													onkeypress="return onlyNumberWithFloat(htmlEvent)"
													placeholder="Quantity" onblur="setAmount();" />

											</div></td>


										<td><div class="col-md-12" style="padding: 0px;">
												<input type="text" class="form-control"
													style="padding: 0px; height: 25px; text-align: center;"
													id="tot_amt" value="0"
													onkeypress="return onlyNumberWithFloat(htmlEvent)"
													placeholder="tot_amt"
													onblur="autoFocus(); getfinal_price();" />


											</div></td>





									</tr>
									<!-- On cells (`td` or `th`) -->
								</tbody>
							</table>
						</div>
					</div>



					<div class="col-md-12" style="padding: 0px; display: none;">
						<div class="table-responsive">


							<table class="table table-bordered">
								<thead class="thead_bg">
									<tr>


										<th style="text-align: center;">Item Code</th>
										<th style="text-align: center;">Price</th>
										<th style="text-align: center;">Qty.</th>
										<th style="text-align: center;">Amount.</th>
										<th width="5%"></th>

									</tr>
								</thead>


								<tbody id="tableScroll" style="background: #fff;">


								</tbody>

								<!-- On rows -->
							</table>


						</div>
					</div>

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
	
	
	
	
	function CheckExchangeBonus() {

		
		var variant_exchange_bonus_amount = document.getElementById("variant_exchange_bonus_amount").value;
		
		var exchange_bonus_amount = document.getElementById("exchange_bonus_amount").value;
		

				
	if(parseFloat(exchange_bonus_amount) > parseFloat(variant_exchange_bonus_amount)){
		
		alert("Please Change Value less then Right Value");
		
	
		
		setTimeout(function() { document.getElementById("exchange_bonus_amount").focus(); }, 1);
		document.getElementById("exchange_bonus_amount").value = "0.0";
		
				
		
		
	}
		

	}
	
	
	function CheckLoyaltBonus() {

		
		var lottery_bonus_amount = document.getElementById("lottery_bonus_amount").value;
		
		var variant_lottery_bonus_amount = document.getElementById("variant_lottery_bonus_amount").value;
		
				
	if(parseFloat(lottery_bonus_amount) > parseFloat(variant_lottery_bonus_amount)){
		
		alert("Please Change Value less then Right Value");
		
		/* document.getElementById("lottery_bonus_amount").focus();	 */
		
		setTimeout(function() { document.getElementById("lottery_bonus_amount").focus(); }, 1);
		
		document.getElementById("lottery_bonus_amount").value = "0.0";
		
	}
		

	}
	
	
	
	function CheckCorporateBonus() {

		
		var corporate_bonus_amount = document.getElementById("corporate_bonus_amount").value;
		
		var variant_corporate_bonus_amount = document.getElementById("variant_corporate_bonus_amount").value;
		
				
	if(parseFloat(corporate_bonus_amount) > parseFloat(variant_corporate_bonus_amount)){
		
		alert("Please Change Value less then Right Value");
		
		setTimeout(function() { document.getElementById("corporate_bonus_amount").focus(); }, 1);
		
		document.getElementById("corporate_bonus_amount").value = "0.0";
		
		
	}
		

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
	
	
	function setAmount() {

		var quantity = document.getElementById("quantity").value;
		
		
		var gst_sale_price = document.getElementById("gst_sale_price").value;
		
				
		var cal_total_amount = 0;
			
		
		cal_total_amount=(parseFloat(quantity)*parseFloat(gst_sale_price));				
		

		document.getElementById("tot_amt").value =   (parseFloat(cal_total_amount))
		.toFixed(2);
		


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
	
	
	
	
</script>







	<script type="text/javascript">
		$().ready(function() {

			$("#form1").validate({
				rules : {
					
					cat_id: "required",	
					
				},
				messages : {
					
					cat_id: "*",
					
				},
				
				
				 myselect:
				 { required: true }
				
				
				
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

/* 
		function getfinanceBranchName(){
			
			var finance_branch_name=$("#finance_branch_id_fk :selected").text();  

			document.getElementById("finance_branch_name").value = finance_branch_name;			
			
		} */

		/* 	function getFinanceBranch(){				
				
				var finance_company_id_fk = document.getElementById("finance_company_id_fk").value;
				
				$.ajax({
					
					url : 'getFinanceBranchAjax.jsp',
					data : 'finance_company_id_fk='+ finance_company_id_fk,
					type : 'post',
										
					success  : function(msg){						
						
						$('#finance_branch_id_fk').html(msg);						 
					
						
					}
					
				});
				
				
			} */
			
			
			
			function showHidefinance(flag) {
				if (flag == 'Yes') {
					
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
				if (flag == 'DD' || flag == 'Cheque' || flag == 'Online') {
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
			

	</script>






	<script type="text/javascript">
		

		function getVariantName(){
			
			var variant_name=$("#variant_id_fk :selected").text();  

			document.getElementById("variant_name").value = variant_name;
			
			
		}

			function getVariant(){
				
				
				var model_id_fk = document.getElementById("model_id_fk").value;
				
				$.ajax({
					
					url : 'getVariantAjax.jsp',
					data : 'model_id_fk='+ model_id_fk,
					type : 'post',
					
					
					success  : function(msg){
						
						
						$('#variant_id_fk').html(msg);
						 
					
						
					}
					
				});
				
				
			}
			
			
			
	function getproduct(){
				
				
				var variant_id_fk = document.getElementById("variant_id_fk").value;
				
				$.ajax({
					
					url : 'Ajex.getproduct_code.jsp',
					data : 'variant_id_fk='+ variant_id_fk,
					type : 'post',
					
					
					success  : function(msg){
						
						
						$('#browsers').html(msg);
						 
					
						
					}
					
				});
				
				
			}
			
			
			
			
		function getVariantPrice(){
				
				
				var variant_id_fk = document.getElementById("variant_id_fk").value;
				
				
				
				$.ajax({
					
					url : 'getVariantPriceAjax.jsp',
					data : 'variant_id_fk='+ variant_id_fk,
					type : 'post',		
					
					success  : function(msg){
						
						
						$('#abcd').html(msg);
						//alert(msg);
						
						 
						var varientPrice = document.getElementById("price_a").value;
						var Exchange_bonus_amount = document.getElementById("variant_exchange_bonus_amount_a").value;
						var Lottery_bonus_amount = document.getElementById("variant_lottery_bonus_amount_a").value;
						var Corporate_bonus_amount = document.getElementById("variant_corporate_bonus_amount_a").value;	
						
						
						var showroom_price = document.getElementById("showroom_price_a").value;
						var rto_tax_price = document.getElementById("rto_tax_price_a").value;
						var insurance_price = document.getElementById("insurance_price_a").value;	
						
						var gst_per = document.getElementById("gst_per_a").value;
						var cess_per = document.getElementById("cess_per_a").value;
						var tcs_per = document.getElementById("tcs_per_a").value;
						var handling_charges = document.getElementById("handling_charges_a").value;
						var tcs_amount = document.getElementById("tcs_amount_a").value;
														
						var rsa_amount = document.getElementById("rsa_amount_a").value;
						var extended_warranty_amount = document.getElementById("extended_warranty_amount_a").value;
						var other_charges = document.getElementById("other_charges_a").value;	
						
						var showroom_gross_price = document.getElementById("showroom_gross_price_a").value;
						
						var consumer_schemes = document.getElementById("consumer_schemes_a").value;
						
						document.getElementById("sale_price").value = varientPrice;				
						document.getElementById("variant_exchange_bonus_amount").value = Exchange_bonus_amount;
						document.getElementById("variant_lottery_bonus_amount").value = Lottery_bonus_amount;
						document.getElementById("variant_corporate_bonus_amount").value = Corporate_bonus_amount;			
						
						document.getElementById("showroom_price").value = showroom_price;
						document.getElementById("rto_tax_price").value = rto_tax_price;
						document.getElementById("insurance_price").value = insurance_price;				
						document.getElementById("gst_per_one").value = gst_per;
						document.getElementById("cess_per").value = cess_per;
						document.getElementById("tcs_per").value = tcs_per;
						document.getElementById("handling_charges").value = handling_charges;
						document.getElementById("tcs_amount").value = tcs_amount;
						
						document.getElementById("rsa_amount").value = rsa_amount;				
						document.getElementById("extended_warranty_amount").value = extended_warranty_amount;
						document.getElementById("other_charges").value = other_charges;
						
						document.getElementById("showroom_gross_price").value = showroom_gross_price;
						document.getElementById("consumer_schemes").value = consumer_schemes;					
						
						
						getfinal_price();							
										
						
					}
					
				});
				
				
			}	
		

		function getModelName(){
			
			var model_name=$("#model_id_fk :selected").text();  

			document.getElementById("model_name").value = model_name;
			
			
		}

		function getcolourName(){
			
			var color_name=$("#color_id_fk :selected").text();  

			document.getElementById("color_name").value = color_name;
			
			
		}
		
	</script>