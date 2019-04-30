<!DOCTYPE html>

<%@page import="com.dto.BankDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.BankingService"%>
<%@page import="com.dto.WorkshopDto"%>
<%@page import="com.service.WorkshopService"%>
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
		$('#insurance_credit_date').datetimepicker();
	});
	
	$(function() {
		$('#insurance_credit_cheque_date').datetimepicker();
	});
</script>




</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Pay Insurance Amount</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

			<div class="right_side">

				<form action="WorkshopServlet" id="new" method="post">


					<%
						int	update_status_id=1;
																		
																	
																	int id = Integer.parseInt(request.getParameter("id") == null
																				? "0"
																				: request.getParameter("id"));

																		

																		String cur_date = LogFileService
																				.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");

																		WorkshopService pur_service = new WorkshopService();

																		WorkshopDto dto = pur_service.getWorkshopById(id, request, config);
					%>




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
							<label> JOb Card</label>
						</div>
						<div class="col-md-6">


							<input type="text" value="<%=dto.getJobcard_no()%>"
								class="form-control" readonly="readonly"> <input
								type="hidden" name="update_status_id" id="update_status_id"
								value="<%=update_status_id%>"> <input type="hidden"
								name="id" id="id" value="<%=id%>"> <input type="hidden"
								name="branch_id_fk" id="branch_id_fk" value="<%=branch_id%>">




						</div>
					</div>




					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Customer Name</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_name" id="customer_name"
								placeholder="customer_name" class="form-control"
								value="<%=dto.getCustomer_name()%>" readonly="readonly">



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
								value="<%=dto.getCustomer_mobile_no()%>" readonly="readonly">


						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Insurance Amount</label>
						</div>
						<div class="col-md-6">


							<input type="text" name="insurance_amount" id="insurance_amount "
								value="<%=dto.getInsurance_amount()%>" class="form-control"
								readonly="readonly">

						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">

						</br>



						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>RECEIVE INFO</label>
						</div>

					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Receive Date</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="insurance_credit_date"
								id="insurance_credit_date" placeholder="insurance_credit_date"
								value="<%=cur_date%>" class="form-control">



						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Receive Amount</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="insurance_credit_amount"
								id="insurance_credit_amount"
								placeholder="insurance_credit_amount" value=""
								class="form-control">



						</div>
					</div>



					<div class=" col-md-12 ">

						</br>







						<table style="width: 100%">
							<tr align="center">
								<td><input type="radio" value="Cheque"
									name="Insurance_credit_paymode"
									onclick="showHideDD(this.value)" /> <strong
									style="margin-left: 5px; font-size: 14px; font-weight: normal;">Cheque
										/ DD </strong> <input type="radio" value="Online"
									name="Insurance_credit_paymode"
									onclick="showHideDD(this.value)" /> <strong
									style="margin-left: 5px; font-size: 14px; font-weight: normal;">Neft
										/ Rtgs/Imps </strong></td>
							</tr>
						</table>



						<div class=" col-md-12 " style="padding: 0px;">
							</br>


							<div class="col-lg-12 col-md-12 " id="ddDiv"
								style="display: none;">
								<br />





								<div class=" col-md-3 ">



									<select id="insurance_credit_cheque_bank"
										name="insurance_credit_cheque_bank" class="form-control">

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
									<input type="text" class="form-control"
										id="insurance_credit_cheque_no"
										name="insurance_credit_cheque_no" value=""
										placeholder="Check No" />
								</div>
								<div class=" col-md-3 ">
									<input type="text" class="form-control"
										id="insurance_credit_cheque_date"
										name="insurance_credit_cheque_date" value=""
										placeholder="Cheque Date" readonly="readonly" />
								</div>

							</div>

						</div>

						<div class="col-md-12" style="padding: 0px;">
							<div class="col-md-5">&nbsp;</div>
							<div class="col-md-7">
								<input type="submit" name="submit" id="submit" value="Submit"
									class="submit">
							</div>
						</div>





						<br /> <br /> <br /> <br />

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
		
		
		
		

		
		
		
		
		function showHideDD(flag) {
			if (flag == 'DD' || flag == 'Cheque' || flag == 'Online') {
				showHideTemplateByCheckBox(true, 'ddDiv');
			} else {
				showHideTemplateByCheckBox(false, 'ddDiv');
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