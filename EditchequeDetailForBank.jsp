<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.ReseviePaymentDto"%>
<%@page import="com.service.ResevedPayemntService"%>
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
		$('#receive_date').datetimepicker();
	});
	
	$(function() {
		$('#ddDate').datetimepicker();
	});
	
	$(function() {
		$('#check_received_date').datetimepicker();
	});
	
	$(function() {
		$('#purchase_date').datetimepicker();
	});
</script>

</head>
<body>

	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Cheque Payment Status</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">



						<form action="checkStatusDetailServlet"
						 id="form1" method="post">


							<%
								int id = Integer.parseInt(request.getParameter("id") == null
										? "0"
										: request.getParameter("id"));
								ResevedPayemntService service = new ResevedPayemntService();
								ReseviePaymentDto dto = service.getReciveAmountById(id, config,
										request);
								String cur_date = LogFileService
										.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");
							%>


							<div class="col-md-12" style="padding: 0px;">
								</br>
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label>Receiving Date</label>
								</div>
								<div class="col-md-6">
									<input type="text" name="receiving_date" id="receiving_date"
										readonly="readonly" placeholder="receiving_date"
										value="<%=dto.getReceiving_date()%>"
										class="form-control">



								</div>
							</div>



							<input type="hidden" name="id" id="id" value="<%=dto.getId()%>" />

							<input type="hidden" name="branch_id_fk" id="branch_id_fk"
								value="<%=branch_id%>" /> <input type="hidden" name="SESSION"
								id="SESSION" value="<%=session_year%>" /> <input type="hidden"
								name="check_no" value="<%=dto.getCheck_no()%>"
								class="form-control"> <input type="hidden"
								name="check_date" value="<%=dto.getCheck_date()%>"
								class="form-control"> <input type="hidden"
								name="check_bank_name" value="<%=dto.getCheck_bank_name()%>"
								class="form-control"> <input type="hidden"
								name="bank_id_fk" value="<%=dto.getBank_id_fk()%>"
								class="form-control">




							<div class="col-md-12" style="padding: 0px;">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label> Remark</label>
								</div>
								<div class="col-md-6">
									<input type="text" name="remark" id="remark"
										readonly="readonly" placeholder="Remark"
										class="form-control" value="<%=dto.getRemark()%>">

								</div>
							</div>




							<div class="col-md-12" style="padding: 0px;">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label> Amount</label>
								</div>
								<div class="col-md-6">
									<input type="text" name="receive_amount" id="receive_amount"
										readonly="readonly" placeholder="Receive Amount"
										value="<%=dto.getAmount()%>" class="form-control">

								</div>
							</div>


							<input type="hidden" name="Paymode" id="Paymode"
								readonly="readonly" value="<%=dto.getPayment_mode()%>"
								class="form-control">







							<div class="col-md-12" style="padding: 0px;">
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label> Change Status</label>
								</div>
								<div class="col-md-6">
									<select name="checkStatus" id="checkStatus"
										class="form-control">
										<option value="">Select</option>
										<option value="Cancel">Cancel</option>
										<option value="Ready for Bank">Bounced and Resubmit</option>
										<option value="Clear">Clear</option>


									</select>



								</div>
							</div>


							<div class="col-md-12" style="padding: 0px;">



								<div class="col-md-2"></div>
								<div class="col-md-3">
									<label> Change Status Date</label>
								</div>
								<div class="col-md-6">
									<input type="text" name="check_received_date"
										id="check_received_date" readonly="readonly"
										placeholder="Receive Date" value="<%=cur_date%>"
										class="form-control">



								</div>
							</div>


							<div class="col-md-12" style="padding: 0px;">
								<div class="col-md-5">&nbsp;</div>
								<div class="col-md-7">
									<input type="submit" name="submit" id="submit" value="Submit"
										class="submit" onclick="return confirm('Are you sure to Submit Info ?')">
								</div>
							</div>
							<br /> <br /> <br /> <br />







						</form>
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
		
			
						
			
			
			
		var total=(10*tens)+(20*twenty)+(50*fifty)+(100*hundred)+(500*fivehundred)+(2000*twothosunad)+(200*Twohundred);
			
	
			
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
			if (flag == 'DD' || flag == 'Cheque' || flag == 'Swap') {
				showHideTemplateByCheckBox(true, 'ddDiv');				
				showHideTemplateByCheckBox(false, 'ddDiv_cash');
			} else {
				showHideTemplateByCheckBox(false, 'ddDiv');
				
				showHideTemplateByCheckBox(true, 'ddDiv_cash');
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

