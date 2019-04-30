<!DOCTYPE html>

<%@page import="com.dto.BankDto"%>
<%@page import="com.service.BankingService"%>
<%@page import="com.dto.InsuranceCompanyDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.InsuranceCompnayService"%>
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
		$('#request_date').datetimepicker();
	});
	
	$(function() {
		$('#insurance_date').datetimepicker();
	});
	
	$(function() {
		$('#promish_sate').datetimepicker();
	});
	$(function() {
		$('#diposit_cheaqe_date').datetimepicker();
	});
</script>





</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Add Workshop</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">


			<%
				String cur_date = LogFileService
											.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");
			%>

			<div class="right_side">

				<form action="WorkshopServlet" id="new" method="post">

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Date</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="request_date" id="request_date"
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
							<label> JobCard No.</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="jobcard_no" id="jobcard_no"
								placeholder="Enter jobcard_no" value="" class="form-control"
								style="background: #ffcbcb">

						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Promish Date</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="promish_sate" id="promish_sate"
								placeholder="saleing_date" value="<%=cur_date%>"
								class="form-control">



						</div>
					</div>




					<div class="col-md-12" style="padding: 0px;">

						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Bill Amount</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="bill_amount" id="bill_amount"
								class="form-control" placeholder="" value="0"
								onblur="balanceAmt();">


						</div>
					</div>






					<div class="col-md-12" style="padding: 0px;">
						</br>

						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>Accidental INFO</label>
						</div>

					</div>



					<div class=" col-md-12 ">

						</br>


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Accidental</label>
						</div>


						<div class="col-md-2">

							<table style="width: 100%">
								<tr align="center">
									<td><input type="radio" name="accidental_status"
										checked="checked" onclick="showHidefinance(this.value)"
										value="No" /> <strong
										style="margin-left: 5px; font-size: 14px; font-weight: normal;">
											No</strong> <input type="radio" value="Yes" name="accidental_status"
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
								<label>Insurance Company</label>
							</div>

							<div class="col-md-6">

								<select id="insurance_company_id_fk"
									name="insurance_company_id_fk" class="form-control"
									onblur="getInsuranceCompanyName()"
									onchange="getInsuranceCompanyName">
									<option value="0">Select</option>
									<%
										InsuranceCompnayService fin_Service = new InsuranceCompnayService();
																											ArrayList<InsuranceCompanyDto> mlist = fin_Service
																													.getAllInsuranceCompany(config, request);
																											for (InsuranceCompanyDto mDto : mlist) {
									%>
									<option value="<%=mDto.getId()%>"><%=mDto.getNAME()%></option>
									<%
										}
									%>

								</select> <input type="hidden" name="creator_id_fk" id="creator_id_fk"
									value="<%=creator_id%>"> <input type="hidden"
									name="session" id="session" value="<%=session_year%>">
								<input type="hidden" name="branch_id_fk" id="branch_id_fk"
									value="<%=branch_id%>" /> <input type="hidden"
									name="insurance_company_name" id="insurance_company_name">




							</div>
						</div>

						<div class="col-md-12" style="padding: 0px;">
							<div class="col-md-2"></div>
							<div class="col-md-3">
								<label> Insurance Date </label>
							</div>
							<div class="col-md-6">
								<input type="text" name="Insurance_date" id="insurance_date"
									placeholder="Date" value="<%=cur_date%>" class="form-control">


							</div>
						</div>

						<div class="col-md-12" style="padding: 0px;">
							<div class="col-md-2"></div>
							<div class="col-md-3">
								<label> Insurance Amount</label>
							</div>
							<div class="col-md-6">
								<input type="text" name="insurance_amount" id="insurance_amount"
									placeholder="" onblur="balanceAmt();" onchange="balanceAmt();"
									class="form-control" value="0">


							</div>
						</div>





					</div>



					<div class="col-md-12" style="padding: 0px; display: none;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Cash Diposit Amount</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="diposit_amount" id="diposit_amount"
								placeholder="" class="form-control" value="0">


						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Advance Amount</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="booking_amount" id="booking_amount"
								placeholder="" class="form-control" value="0"
								onblur="balanceAmt();">

						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Pay Diposit(In Cash)</label>
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
							</br>
							<div class=" col-md-2 "></div>

							<div class="col-lg-12 col-md-12 " id="ddDiv"
								style="display: none;">
								<br />


								<div class=" col-md-3">								
										
										
										<select
										id="diposit_bank" name="diposit_bank" class="form-control">

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
							<label>Total Pay Diposit </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="pay_diposit" id="pay_diposit"
								placeholder="" value="0" class="form-control"
								style="background: #ffcbcb" onblur="balanceAmt();">


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
		
			
		
			
		

		function getInsuranceCompanyName(){
			
			var insurance_company_name=$("#insurance_company_id_fk :selected").text();  

			document.getElementById("insurance_company_name").value = insurance_company_name;			
			
		}


			
			
			function showHidefinance(flag) {
				if (flag == 'Yes') {
					
					showHideTemplateByCheckBox_finance(true, 'ddDiv_finance');	
					balanceAmt();
					
				} else {
					showHideTemplateByCheckBox_finance(false, 'ddDiv_finance');
					document.getElementById("insurance_date").value = "";
					document.getElementById("insurance_amount").value = "0";
					document.getElementById("insurance_company_id_fk").value = "0";
					balanceAmt();
										
				}
			
				
				
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
					balanceAmt();
				} else {
					showHideTemplateByCheckBox(false, 'ddDiv');					
					showHideTemplateByCheckBox(true, 'ddDiv_cash');
					showHideTemplateByCheckBox(true, 'ddReturnDiv_cash');
					
					document.getElementById("diposit_cheaqe_no").value = "";
					document.getElementById("diposit_bank").value = "";
					document.getElementById("diposit_cheaqe_date").value = "";
					document.getElementById("pay_diposit_amount_cheque").value = "0";
					
					balanceAmt();
				}
				
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
						
										
						
									
						
						document.getElementById("sale_price").value = varientPrice;				
						document.getElementById("variant_exchange_bonus_amount").value = Exchange_bonus_amount;
						document.getElementById("variant_lottery_bonus_amount").value = Lottery_bonus_amount;
						document.getElementById("variant_corporate_bonus_amount").value = Corporate_bonus_amount;			
						
						document.getElementById("showroom_price").value = showroom_price;
						document.getElementById("rto_tax_price").value = rto_tax_price;
						document.getElementById("insurance_price").value = insurance_price;				
						document.getElementById("gst_per").value = gst_per;
						document.getElementById("cess_per").value = cess_per;
						document.getElementById("tcs_per").value = tcs_per;
						document.getElementById("handling_charges").value = handling_charges;
						document.getElementById("tcs_amount").value = tcs_amount;
						
						
								
										
						
					}
					
				});
				
				
			}
		
		

		
		
		function getfinal_price() {

			var bill_amount = document.getElementById("bill_amount").value;
			
			var insurance_amount = document.getElementById("insurance_amount").value;
					
					
			
			var cash_diposit_amount = 0;	
			

			cash_diposit_amount = (parseFloat(bill_amount)-parseFloat(insurance_amount));		
			

			document.getElementById("diposit_amount").value = (parseFloat(cash_diposit_amount))
					.toFixed(2);
						
			

		}
			
		
	
		
		
		function balanceAmt() {

			
			var pay_diposit_amount_cash = document.getElementById("pay_diposit_amount_cash").value;
			var pay_diposit_amount_cheque = document.getElementById("pay_diposit_amount_cheque").value;		
			var diposit_amount = document.getElementById("diposit_amount").value;
			var booking_amount = document.getElementById("booking_amount").value;

			var bill_amount = document.getElementById("bill_amount").value;			
			var insurance_amount = document.getElementById("insurance_amount").value;
			
			
			
          var cash_diposit_amount = 0;	
			

			cash_diposit_amount = (parseFloat(bill_amount)-parseFloat(insurance_amount));		
			

			document.getElementById("diposit_amount").value = (parseFloat(cash_diposit_amount))
					.toFixed(2);
		
			
			
			
			
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
				

				var balance_amt =  (parseFloat(bill_amount)-parseFloat(insurance_amount)) - (parseFloat(total_paid_amt)+parseFloat(booking_amount));
				
				
				document.getElementById("pay_diposit").value = total_paid_amt.toFixed(2);
				
				document.getElementById("balance_amount").value = balance_amt.toFixed(2);
				
				
				
			
		}
		
	</script>