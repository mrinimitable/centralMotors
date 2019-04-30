<!DOCTYPE html>

<%@page import="com.dto.BankDto"%>
<%@page import="com.service.BankingService"%>
<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.BranchDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.BranchService"%>
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


	<h3 style="text-align: center;">Transactions Entry</h3>


	<div id="abcd"></div>
	<div id="rev"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8 ">

			<div class="right_side">
				<%
					BankingService service = new BankingService();

																/* String invoice= service.getMaxInvoiceNo(c_y_session,request,config); 
																int ab= 1;
																if(invoice!=null)
																{
																	ab = Integer.parseInt(invoice);
																	ab = ab + 1;
																}  */
				%>
				<br />
				<form action="TransactionServlet" id="form1" name="form1"
					method="post" onsubmit="return checkSubmit();">




					<%-- 	<input type="hidden" name="c_y_session" id="c_y_session"
									value="<%=c_y_session %>"  class="form-control"
								 /> --%>

					<%--  <input type="hidden" name="invoice_no" id="invoice_no"
									value="<%=ab%>" placeholder="Invoice no." class="form-control"
								  /> --%>

					<div class="col-md-12">
						<div class="col-md-3">
							<label> Bank Name</label>
						</div>
						<div class="col-md-9">
							<select class="form-control input_a" name="bank_id_fk"
								id="Bank_name" onclick="checkBankName();">
								<option value="0">Choose Bank</option>
								<%
									//	BankingService service = new BankingService();
																																				ArrayList<BankDto> list = service.getBankname(request, config);
																																				for (BankDto a : list) {
								%>
								<option value="<%=a.getBank_id()%>"><%=a.getBank_name()%></option>
								<%
									}
								%>

							</select>
						</div>
					</div>


					<input type="hidden" name="branch_id_fk" id="branch_id_fk"
						value="<%=branch_id%>" /> <input type="hidden" name="branch_name"
						id="branch_name" value="" /> <input type="hidden"
						name="c_y_session" id="c_y_session" value="<%=session_year%>" />




					<div class="col-md-12">
						<div class="col-md-3">
							<label> Bank Branch</label>
						</div>
						<div class="col-md-9">
							<input type="text" name="bankbranch" id="bankbranch"
								readonly="readonly" placeholder="Enter Branch Name"
								class="form-control" />
						</div>
					</div>

					<div class="col-md-12">
						<div class="col-md-3">
							<label>Account No.</label>
						</div>
						<div class="col-md-9">
							<input type="text" name="account_no" id="Account_no"
								readonly="readonly" placeholder="Enter Account No"
								class="form-control" />
						</div>
					</div>


					<input type="hidden" name="type" id="type"
						class="form-control input_a" value="Credit" />

					<!-- 	<div class="col-md-12">
									<div class="col-md-3">
										<label>Type</label>
									</div>
									<div class="col-md-9">
										<select class="form-control input_a" name="type"
											placeholder="">
											
											<option value="Credit">Credit</option>
											<option value="Debit">Debit</option>

										</select>
									</div>
								</div> -->





					<div class="col-md-12">
						<div class="col-md-3">
							<label>Amount</label>
						</div>
						<div class="col-md-9">
							<input type="text" name="amount" id="txt_amount"
								placeholder="Enter Amount." class="form-control input_a" />
						</div>
					</div>

					<%
						String cur_date = LogFileService
																							.changeFormateOfCurrentDate("yyyy-MM-dd");
					%>

					<div class="col-md-12">
						<div class="col-md-3">
							<label>Date</label>
						</div>
						<div class="col-md-9">
							<input type="text" name="date" id="date1" value="<%=cur_date%>"
								placeholder="Enter Opening Date" class="form-control" />
						</div>
					</div>

					<div class="col-md-12">
						<div class="col-md-3">
							<label>Remark</label>
						</div>
						<div class="col-md-9">
							<input type="text" name="remark" placeholder="Remark"
								class="form-control" />
						</div>
					</div>

					<div class=" col-md-12 ">



						<input type="hidden" name="pay_mode" value="Cash" />

						<table style="width: 100%">
							<!-- <tr align="center">
											<td><input type="radio" name="pay_mode"
												checked="checked" onclick="showHideDD1(this.value)"
												value="Cash"></input> <strong
												style="margin-left: 5px; font-size: 14px; font-weight: normal;">
													Cash</strong> <input type="radio" value="Cheque" name="pay_mode"
												onclick="showHideDD1(this.value)"></input> <strong
												style="margin-left: 5px; font-size: 14px; font-weight: normal;">Cheque
													/ DD </strong>
											</td>		
										</tr> -->
						</table>
						<center>
							<!-- <div class="col-lg-12 col-md-12 " id="ddDiv1"
											style="display: none;">
											<br/>
												<div class=" col-md-3 ">
													<input type="text" class="form-control" id="bankname" style="text-align: center;"
														name="bankname" value="" placeholder="Bank Name"></input>
												</div>
												<div class=" col-md-3 ">
													<input type="text" class="form-control" id="ddno"
														name="ddno" value="" placeholder="Cheq./DD"  style="text-align: center;"
														title="Cheque/ DD/SwapNo."></input>
												</div>
												<div class=" col-md-3 ">
													<input type="text" class="form-control" id="ddDate"
														name="ddDate" value="" placeholder="Date" style="text-align: center;"
														readonly="readonly"></input>
												</div>
												<div class=" col-md-3">
													<input type="text"    
														onkeypress="return onlyNumberWithFloat(event)"
														class="form-control" id="dd_amount" name="dd_amount"
														placeholder="Amount" value="0" style="text-align: center;"
														onblur="returnAmt(requiredAmountPaid.value);"></input>
												</div>
										</div> -->
						</center>
						<div class=" col-md-5 "></div>

						<div class=" col-md-2 " style="padding: 0px;">
							<center>
								<button class="submit" type="submit">Submit</button>

							</center>
						</div>
						<div class=" col-md-5 "></div>

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
		function checkBankName() {
			var code_a = $("#Bank_name :selected").val();

			if (code_a != "" && code_a != null) {

				$.ajax({

					// Es Page vo jayega Working ke liye

					url : 'CheckBank_Details.jsp',

					// ye data id ke jariye hum jsp se yha uta ke jasp pe denge
					data : 'bank_name=' + code_a,
					type : 'post',

					success : function(msg) {

						$('#rev').html(msg);

						var branch = document.getElementById("branch").value;
						var account = document.getElementById("account").value;

						document.getElementById('bankbranch').value = branch;
						document.getElementById('Account_no').value = account;

					}

				});

			} else {
				alert("Code is Incorrect");

			}
		}
		
		function checkSubmit() {
			var amount = document.getElementById("txt_amount").value;
			var dd_amt = document.getElementById("dd_amount").value;

			var new_amount = 0;
			var new_dd_amt = 0;

			if (amount == 0 || amount == "") {
				amount = 0;
			}
			new_amount = amount;

			if (dd_amt == 0 || dd_amt == "") {
				dd_amt = 0;
			}
			new_dd_amt = dd_amt;

			var total_amt = parseFloat(new_amount) + parseFloat(new_dd_amt);

			if (total_amt <= 0) {
				alert("Please insert amount");
				return false;
			} else {
				return true;
			}

		}
	</script>