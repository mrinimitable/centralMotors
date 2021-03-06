<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.ReseviePaymentDto"%>
<%@page import="com.service.ResevedPayemntService"%>
<%@page import="com.dto.BankDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.BankingService"%>
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
		$('#purchase_date').datetimepicker();
	});
	
	$(function() {
		$('#aprrove_Date').datetimepicker();
	});
	
	$(function() {
		$('#check_date').datetimepicker();
	});
	
	$(function() {
		$('#receive_date').datetimepicker();
	});
	
	$(function() {
		$('#ddDate').datetimepicker();
	});
</script>

	


</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Verify & OK Status</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">




						<form action="checkStatusReceveAmtServlet"
							enctype="multipart/form-data" id="new" method="post">

							<%
									String cur_date = LogFileService
											.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");
									int id = Integer.parseInt(request.getParameter("id") == null
											? "0"
											: request.getParameter("id"));
									
									
									ResevedPayemntService service = new ResevedPayemntService();

									ReseviePaymentDto dto = service.getReciveAmountById(id, config,
											request);
								%>


							<div class="col-md-12" style="padding: 0px;">
								</br>
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label>Receiving Date</label>
								</div>


								<div class="col-md-6">
									<input type="text" name="receiving_date" id="receive_date1"
										readonly="readonly" placeholder="Receive Date"
										value="<%=dto.getReceiving_date()%>"
										class="form-control">



								</div>
							</div>



							<input type="hidden" name="id" id="id" value="<%=dto.getId()%>" />
							<input type="hidden" name="Creator_id_fk_mobile" id="Creator_id_fk_mobile" value="<%=dto.getCreator_id_fk_mobile()%>" />

							<input type="hidden" name="branch_id_fk" id="branch_id_fk"
								value="<%=branch_id%>" /> <input type="hidden" name="SESSION"
								id="SESSION" value="<%=session_year%>" />



							<div class="col-md-12" style="padding: 0px;">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label> Customer Name</label>
								</div>
								<div class="col-md-6">
									<input type="text" name="customer_name" id="customer_name"
										placeholder="customer_name" class="form-control"
										value="<%=dto.getCustomer_name()%>">



								</div>
							</div>



							<div class="col-md-12" style="padding: 0px;">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label> Customer Mobile</label>
								</div>
								<div class="col-md-6">
									<input type="text" name="customer_mobile" id="customer_mobile"
										placeholder="customer_mobile" class="form-control"
										value="<%=dto.getCustomer_mobile()%>">



								</div>
							</div>




							<div class="col-md-12" style="padding: 0px;">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label> Remark</label>
								</div>
								<div class="col-md-6">
									<input type="text" name="remark" id="remark"
										placeholder="Remark" class="form-control"
										value="<%=dto.getRemark()%>">

								</div>
							</div>


							<div class="col-md-12" style="padding: 0px;">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label> Amount</label>
								</div>
								<div class="col-md-6">
									<input type="text" name="receive_amount" id="receive_amount"
										placeholder="Receive Amount" value="<%=dto.getAmount()%>"
										class="form-control">

								</div>
							</div>


							<input type="hidden" name="Paymode" id="Paymode"
								readonly="readonly" value="<%=dto.getPayment_mode()%>"
								class="form-control">




							<div class="col-md-12" style="padding: 0px;">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label> Approve Status</label>
								</div>
								<div class="col-md-6">
									<select name="aprrove_status" id="aprrove_status"
										class="form-control">
										<option value="ApprovePayment">Approve Payment</option>
										<option value="Cancle">Cancle</option>
									</select>


								</div>
							</div>




							<div class="col-md-12" style="padding: 0px;">

								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label>Approve Date</label>
								</div>


								<div class="col-md-6">
									<input type="text" name="aprrove_Date" id="aprrove_Date"
										readonly="readonly" placeholder="aprrove_datee"
										value="<%=cur_date%>" class="form-control">



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
											<%if("Cash".equalsIgnoreCase(dto.getPayment_mode())) {%>
											checked="checked" <%}%> onclick="showHideDD(this.value)"
											value="Cash" /> <strong
											style="margin-left: 5px; font-size: 14px; font-weight: normal;">
												Cash</strong> <input type="radio"
											<%if("Cheque".equalsIgnoreCase(dto.getPayment_mode())) {%>
											checked="checked" <%}%> name="diposit_mode"
											onclick="showHideDD(this.value)" value="Cheque" /> <strong
											style="margin-left: 5px; font-size: 14px; font-weight: normal;">Cheque
												/ DD </strong> <input type="radio"
											<%if("Online".equalsIgnoreCase(dto.getPayment_mode())) {%>
											checked="checked" <%}%> name="diposit_mode"
											onclick="showHideDD(this.value)" value="Online" /> <strong
											style="margin-left: 5px; font-size: 14px; font-weight: normal;">Neft
												/ Rtgs/Imps </strong></td>
									</tr>
								</table>



								<!-- <table style="width: 100%">
										<tr align="center">
											<td><input type="radio" name="payment_mode"
												checked="checked" onclick="showHideDD(this.value)"
												value="Cash" /> <strong
												style="margin-left: 5px; font-size: 14px; font-weight: normal;">
													Cash</strong> <input type="radio" value="Cheque" name="payment_mode"
												onclick="showHideDD(this.value)" /> <strong
												style="margin-left: 5px; font-size: 14px; font-weight: normal;">Cheque
													/ DD </strong> <input type="radio" value="Swap" name="payment_mode"
												onclick="showHideDD(this.value)" /> <strong
												style="margin-left: 5px; font-size: 14px; font-weight: normal;">Neft
													/ Rtgs/Imps </strong></td>
										</tr>
									</table> -->



								<div class=" col-md-12 " style="padding: 0px;">
									<div class=" col-md-2 "></div>

									<div class="col-lg-12 col-md-12 " id="ddDiv"
										style="display: none;">
										<br />

										<div class=" col-md-3 ">
											<select class="form-control" id="bank_id_fk"
												name="bank_id_fk">
												<option value="0">Select Bank</option>
												<%
										BankingService bankService = new BankingService();
										ArrayList<BankDto> bankList = bankService.getBankname(request,config);
										for (BankDto bankDto : bankList) {   
											%>


												<option
													<%if(dto.getBank_id_fk() == bankDto.getBank_id()){out.print("Selected='selected'");} %>
													value="<%=bankDto.getBank_id()%>"><%=bankDto.getBank_name() %></option>

												<%-- 	<option value="<%=bankDto.getBank_id()%>"><%=bankDto.getBank_name()%></option> --%>

												<%} %>
											</select>
										</div>

										<div class=" col-md-3 ">
											<input type="text" class="form-control" id="bankname"
												name="check_bank_name" placeholder="Bank"
												value="<%=dto.getCheck_bank_name()%>" />
										</div>
										<div class=" col-md-3 ">
											<input type="text" class="form-control" id="ddno"
												name="check_no" placeholder="Cheque No./Online."
												title="Cheque / DD / Swap No."
												value="<%=dto.getCheck_no()%>" />
										</div>
										<div class=" col-md-3">
											<input type="text" class="form-control" id="ddDate"
												name="check_date" placeholder="Date" readonly="readonly"
												value="<%=dto.getCheck_date()%>" />
										</div>

									</div>



									<div class="col-lg-12 col-md-12 " id="ddDiv_cash">
										<br />


										<div class=" col-md-2 ">
											<input type="text" class="form-control" id="tensrupess"
												name="Rs_10" placeholder="Rs10" onblur="totalAmount(); "
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getRs_10()%>" />
										</div>
										<div class=" col-md-2 ">
											<input type="text" class="form-control" id="twentyrupees"
												name="Rs_20" placeholder="Rs20" onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getRs_20()%>" />
										</div>
										<div class=" col-md-2 ">
											<input type="text" class="form-control" id="fiftees"
												name="Rs_50" placeholder="Rs50" onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getRs_50()%>" />
										</div>

										<div class=" col-md-2">
											<input type="text" class="form-control" id="hundred"
												name="Rs_100" placeholder="Rs100" onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getRs_100()%>" />
										</div>
										<div class=" col-md-2">
											<input type="text" class="form-control" id="Twohundred"
												name="Rs_200" placeholder="Rs200" onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getRs_200()%>" />
										</div>




										<div class=" col-md-2">
											<input type="text" class="form-control" id="fivehundresd"
												name="Rs_500" placeholder="Rs500" onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getRs_500()%>" />
										</div>

										<div class=" col-md-2">
											<input type="text" class="form-control" id="twothousand"
												name="Rs_2000" placeholder="Rs2000" onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getRs_2000()%>" />
										</div>

									</div>



									<div class="col-lg-12 col-md-12 " id="ddReturnDiv_cash">
										<div>
											<b>Return Note Detail</b>
										</div>
										<br />


										<div class=" col-md-2 ">
											<input type="text" class="form-control" id="Returntensrupess"
												name="ReturnRs_10" placeholder="Rs10"
												onblur="totalAmount(); "
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getReturn_rs_10()%>" />
										</div>
										<div class=" col-md-2 ">
											<input type="text" class="form-control"
												id="Returntwentyrupees" name="ReturnRs_20"
												placeholder="Rs20" onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getReturn_rs_20()%>" />
										</div>
										<div class=" col-md-2 ">
											<input type="text" class="form-control" id="Returnfiftees"
												name="ReturnRs_50" placeholder="Rs50"
												onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getReturn_rs_50()%>" />
										</div>

										<div class=" col-md-2">
											<input type="text" class="form-control" id="Returnhundred"
												name="ReturnRs_100" placeholder="Rs100"
												onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getReturn_rs_100()%>" />
										</div>
										<div class=" col-md-2">
											<input type="text" class="form-control" id="ReturnTwohundred"
												name="ReturnRs_200" placeholder="Rs200"
												onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getReturn_rs_200()%>" />
										</div>




										<div class=" col-md-2">
											<input type="text" class="form-control"
												id="Returnfivehundresd" name="ReturnRs_500"
												placeholder="Rs500" onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getReturn_rs_500()%>" />
										</div>

										<div class=" col-md-2">
											<input type="text" class="form-control"
												id="Returntwothousand" name="ReturnRs_2000"
												placeholder="Rs2000" onblur="totalAmount();"
												onkeypress="return onlyNumber(event)"
												value="<%=dto.getReturn_rs_2000()%>" />
										</div>
										
										
											<div class=" col-md-2">
									<input type="text" class="form-control" id="ReturnCoin_1"
										name="ReturnCoin_1" placeholder="Coin_1"
										onblur="totalAmount();" onkeypress="return onlyNumber(event)"
										
										value="<%=dto.getReturnCoin_1()%>"/>
								</div>
										
										

									</div>






								</div>




							</div>




							<div class="col-md-12" style="padding: 0px;">
							</br>
								<div class="col-md-5">&nbsp;</div>
								<div class="col-md-7">
									<input type="submit" name="submit" id="submit" value="Submit"
										class="submit" onclick="return confirm('Are you sure to Submit Info ?')">
								</div>
								<br /> <br /> 
							</div>
							







						</form>
					</div>
	</div>




	<script type="text/javascript" src="js/JQuerylib.js"></script>
	<script type="text/javascript" src="js/JQueryValidate.js"></script>
	<script src="js/jquery.datetimepicker.js"></script>


	<script type="text/javascript">
	$().ready(function() {
		
		
		
		
		
		var flag='<%=dto.getPayment_mode()%>';	
		
		
	
		
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

		
		
	function totalAmount(){
			    
			
			var tens= document.getElementById("tensrupess").value;
			//alert(tens); 
			var twenty = document.getElementById("twentyrupees").value;
			//alert(twenty);
			var fifty= document.getElementById("fiftees").value;
			//alert(fifty);
			var hundred= document.getElementById("hundred").value;
			//alert(hundred);
			var fivehundred = document.getElementById("fivehundresd").value;
			//alert(fivehundred);
			var twothosunad= document.getElementById("twothousand").value;
			//alert(twothosunad);
			
			var Twohundred = document.getElementById("Twohundred").value;
		
			

			var Returntens= document.getElementById("Returntensrupess").value;
			
			var Returntwenty = document.getElementById("Returntwentyrupees").value;
			
			var Returnfifty= document.getElementById("Returnfiftees").value;
			
			var Returnhundred= document.getElementById("Returnhundred").value;
		
			var Returnfivehundred = document.getElementById("Returnfivehundresd").value;
			
			var Returntwothosunad= document.getElementById("Returntwothousand").value;
			
			
			var ReturnTwohundred = document.getElementById("ReturnTwohundred").value;
			
			
			
			
			
			var total=((10*tens)+(20*twenty)+(50*fifty)+(100*hundred)+(500*fivehundred)+(2000*twothosunad)+(200*Twohundred) - (10*Returntens)-(20*Returntwenty)-(50*Returnfifty)-(100*Returnhundred)-(500*Returnfivehundred)-(2000*Returntwothosunad)-(200*ReturnTwohundred));
				

		if(total < 0){
			
			
			alert("Please Return Proper Notes");
			
			
			
			var Returntens= document.getElementById("Returntensrupess").value="";
			
			var Returntwenty = document.getElementById("Returntwentyrupees").value="";
			
			var Returnfifty= document.getElementById("Returnfiftees").value="";
			
			var Returnhundred= document.getElementById("Returnhundred").value="";
		
			var Returnfivehundred = document.getElementById("Returnfivehundresd").value="";
			
			var Returntwothosunad= document.getElementById("Returntwothousand").value="";
			
			
			var ReturnTwohundred = document.getElementById("ReturnTwohundred").value="";
			
			
			
			
			document.getElementById("Returntensrupess").focus();
		}
	
			
			document.getElementById("receive_amount").value=total;
		
		}
		
		
		

		
		
		
		
		
		
		
		
	</script>




	<script>


	
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
		
		
	
		
		
		function showHideDD(flag) {
			if (flag == 'DD' || flag == 'Cheque' || flag == 'Online') {
				showHideTemplateByCheckBox(true, 'ddDiv');				
				showHideTemplateByCheckBox(false, 'ddDiv_cash');
				showHideTemplateByCheckBox(false, 'ddReturnDiv_cash');
			} else {
				showHideTemplateByCheckBox(false, 'ddDiv');
				
				showHideTemplateByCheckBox(true, 'ddDiv_cash');
				showHideTemplateByCheckBox(true, 'ddReturnDiv_cash');
				 document.getElementById("ddno").value = "";
					document.getElementById("bankname").value = "";
					document.getElementById("ddDate").value = "";
					document.getElementById("dd_amount").value = "0"; 
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
				
				$.ajax({
					
					url : 'getFinanceBranchAjax.jsp',
					data : 'finance_company_id_fk='+ finance_company_id_fk,
					type : 'post',
										
					success  : function(msg){						
						
						$('#finance_branch_id_fk').html(msg);						 
					
						
					}
					
				});
				
				
			}
				
	
			
			
			
		</script>



