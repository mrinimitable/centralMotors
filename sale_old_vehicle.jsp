<!DOCTYPE html>

<%@page import="com.dto.BankDto"%>
<%@page import="com.service.BankingService"%>
<%@page import="com.dto.OldVehicleDto"%>
<%@page import="com.service.OldVehicleService"%>
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


	<h3 style="text-align: center;">Sales Requst For Old Vehicle</h3>
	<div id="rev"></div>
	<div id="abcd"></div>

	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

			<%-- 		<%
				int id = Integer.parseInt(request.getParameter("id") == null
																				? "0": request.getParameter("id"));																
																																	

														String cur_date = LogFileService.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");

											OldVehicleService pur_service = new OldVehicleService();

										OldVehicleDto dto = pur_service.getOlDVehicleById(id, request, config);
			%> --%>

			<div class="right_side">

				<form action="OldVehicleServlet" enctype="multipart/form-data"
					id="new" method="post">


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

							<div id="rev"></div>


							<select name="exchange_vehicle_name" id="exchange_vehicle_name"
								class="form-control" onblur="getVehicleInfo(this.value);">
								<option value="0">Select Vehicle No</option>

								<%
									String cur_date = LogFileService.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");
																																																						OldVehicleService service = new OldVehicleService();
																																																ArrayList<OldVehicleDto> list = service.getAllOldVehiclePurchaseStatus(config,request);

																																																			for (OldVehicleDto dto : list) {
																																																		int rowId = list.indexOf(dto) + 1;
								%>

								<option value="<%=dto.getExchange_vehicle_name()%>"><%=dto.getExchange_vehicle_name()%></option>

								<%
									}
								%>

							</select>

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
								class="form-control"> <input type="hidden"
								name="creator_id_fk_sale" id="creator_id_fk_sale"
								value="<%=creator_id%>"> <input type="hidden"
								name="session_year_sale" id="session_year_sale"
								value="<%=session_year%>"> <input type="hidden"
								name="branch_id_fk_sale" id="branch_id_fk_sale"
								value="<%=branch_id%>"> <input type="hidden" name="id"
								id="id" value=""> <input type="hidden"
								name="update_status_id" id="id" value="1">


						</div>
					</div>

					<%-- 	<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Vehicle Name </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="exchange_vehicle_name"
								id="exchange_vehicle_name" placeholder="Enter Exchange Vehicle"
								value="<%=dto.getExchange_vehicle_name()%>" class="form-control"
								style="background: #ffcbcb">



						</div>
					</div> --%>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Vehicle Reg No </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="old_vehicle_reg_no"
								id="old_vehicle_reg_no" placeholder="old_vehicle_reg_no"
								value="" class="form-control" readonly="readonly">
						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Exchange Bonus </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="exchange_bonus" id="exchange_bonus"
								placeholder="Enter exchange_bonus" value="" class="form-control"
								readonly="readonly" onblur="getfinal_price();">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Purchase Price </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="old_vehicle_value"
								id="old_vehicle_value"
								placeholder="Enter Exchange Vehicle Price" value=""
								class="form-control" readonly="readonly"
								onblur="getfinal_price();">



						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Owner Customer Name</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_name" id="customer_name"
								placeholder="Enter Customer Name" value="" class="form-control"
								readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Owner Mobile No</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_mobile_no"
								id="customer_mobile_no" placeholder=" Enter Mobile No." value=""
								class="form-control" readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Owner Address</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_address" id="customer_address"
								placeholder="Enter Address" value="" class="form-control"
								readonly="readonly">
						</div>
					</div>






					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Customer Name</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="custmer_name_sale"
								id="custmer_name_sale" placeholder="Enter Customer Name"
								class="form-control" style="background: #ffcbcb">

						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Mobile No</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="mobile_no_sale" id="mobile_no_sale"
								placeholder=" Enter Mobile No." class="form-control"
								style="background: #ffcbcb">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Address</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="address_sale" id="address_sale"
								placeholder="Enter Address" class="form-control"
								style="background: #ffcbcb">

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
							<label> Sale Price </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="sale_price" id="sale_price"
								placeholder="Enter Exchange Vehicle Price" value="0"
								class="form-control" style="background: #ffcbcb"
								onblur="balanceAmt();">



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
									placeholder="" onblur="balanceAmt();" class="form-control"
									value="0">


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
								class="form-control" onblur="balanceAmt();" placeholder=""
								value="0" style="background: #ffcbcb">


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


								<!-- 	<div class=" col-md-3">
									<input type="text" class="form-control" id="diposit_bank"
										name="diposit_bank" placeholder="Bank" />
								</div> -->

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


	

	
	
		
	function balanceAmt() {

		
		var sale_price = document.getElementById("sale_price").value;
		var finance_amount = document.getElementById("finance_amount").value;		
		var booking_amount = document.getElementById("booking_amount").value;
		
		var pay_diposit_amount_cash = document.getElementById("pay_diposit_amount_cash").value;			
		var pay_diposit_amount_cheque = document.getElementById("pay_diposit_amount_cheque").value;	
		
       		
		
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
		
		
			
			var balance_amt = parseFloat(sale_price)-(parseFloat(finance_amount)+
							parseFloat(booking_amount)+parseFloat(pay_diposit_amount_cash)+parseFloat(pay_diposit_amount_cheque));
								
								
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
		
					
		
		

		function getFinanceCompanyName(){
			
			var finance_company_name=$("#finance_company_id_fk :selected").text();  

			document.getElementById("finance_company_name").value = finance_company_name;			
			
		}


			
			
			
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
			
			
			
			
			function getVehicleInfo(code) {

				if (code != "") {

					$
							.ajax({

								url : 'Ajex_getOldVehicle_Info_by_Name.jsp',
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
											
																				
											
											

											document.getElementById('id').value = document
													.getElementById('id_val').value;

											/*
											 * document.getElementById('item_name').value =
											 * document
											 * .getElementById('item_name_val').value;
											 */

											document.getElementById('old_vehicle_reg_no').value = document
													.getElementById('old_vehicle_reg_no_val').value;

											document.getElementById('old_vehicle_value').value = document
													.getElementById('old_vehicle_value_val').value;

											document.getElementById('customer_name').value = document
													.getElementById('customer_name_val').value;

											document.getElementById('customer_mobile_no').value = document
													.getElementById('customer_mobile_no_val').value;
											
											document.getElementById('customer_address').value = document
											.getElementById('customer_address_val').value;
											
											document.getElementById('exchange_bonus').value = document
											.getElementById('exchange_bonus_val').value;
											
											
											

											/* document.getElementById('quantity').focus(); */

										}
									} else {

										alert("Code is Incorrect");
										document.getElementById('exchange_vehicle_name').value = a;
										
										// document.getElementById('icode' + index).focus();
									}

								}
							});
				} else {
					document.getElementById('item_code').focus();
				}
			}

	</script>