<!DOCTYPE html>

<%@page import="com.dto.InsuranceCompanyDto"%>
<%@page import="com.dto.InsuranceRenewalDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.InsuranceCompnayService"%>
<%@page import="com.service.InsuranceRenewalService"%>
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
		$('#renival_date').datetimepicker();
	});
</script>








</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Approval Insurance Renewal</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">




			<div class="right_side">
				<form action="InsuranceRenewalServlet" id="new" method="post">
					<%
						int id = Integer.parseInt(request.getParameter("id") == null ? "0"
																											: request.getParameter("id"));

																		InsuranceRenewalService pservice = new InsuranceRenewalService();

																		InsuranceRenewalDto p_dto = pservice.getInsurenseRenewalById(id, config, request);
					%>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Customer Name</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_name" id="customer_name"
								placeholder="Enter customer_name" value="<%=p_dto.getCustomer_name() %>" class="form-control" >

						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">




						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>VEHICLE Name</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="vehcle_name" id="vehcle_name"
								placeholder="Enter Vehicle Name"
								value="<%=p_dto.getVehcle_name()%>" class="form-control">
							<input type="hidden" name="id" id="id" value="<%=id%>"> <input
								type="hidden" name="creator_id_fk" id="creator_id_fk"
								value="<%=creator_id%>"> <input type="hidden"
								name="session_year" id="session_year" value="<%=session_year%>">
							<input type="hidden" name="branch_id_fk" id="branch_id_fk"
								value="<%=branch_id%>"> <input type="hidden"
								name="creator_id_fk_approve" id="creator_id_fk_approve"
								value="<%=creator_id%>">

						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Reg No</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="reg_no" id="reg_no"
								placeholder="Enter Reg No " value="<%=p_dto.getReg_no()%>"
								class="form-control" onblur="checkCity();">



						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Insurance Company</label>
						</div>
						<div class="col-md-6">
							<select id="insurance_comapny_id_fk"
								name="insurance_comapny_id_fk" onblur="getcompanyName();"
								class="form-control">
								<%
									InsuranceCompnayService fin_Service = new InsuranceCompnayService();
																			ArrayList<InsuranceCompanyDto> mlist = fin_Service
																						.getAllInsuranceCompany(config, request);
																				for (InsuranceCompanyDto mDto : mlist) {
																				int rowId = mlist.indexOf(p_dto) + 1;
								%>
								<option
									<%if (p_dto.getInsurance_comapny_id_fk() == mDto.getId()) {
					out.print("Selected='selected'");}%>
									value="<%=mDto.getId()%>"><%=mDto.getNAME()%>
								</option>

								<%
									}
								%>

							</select> <input type="hidden" name="insurance_comapny_name"
								id="insurance_comapny_name">



						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Od Premium</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="od_premium" id="od_premium"
								placeholder="Enter Premium" value="<%=p_dto.getOd_premium()%>"
								class="form-control" onblur="checkCity();">



						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Total Premium</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="total_premium" id="total_premium"
								placeholder="Enter Total Premium"
								value="<%=p_dto.getTotal_premium()%>" class="form-control"
								onblur="checkCity();">



						</div>
					</div>
					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>No Claim Bouns</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="no_claim_bonus" id="no_claim_bonus"
								placeholder="Enter Claim Bouns"
								value="<%=p_dto.getNo_claim_bonus()%>" class="form-control"
								onblur="checkCity();">



						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Discount</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="discount_per" id="discount_per"
								placeholder="Enter Discount"
								value="<%=p_dto.getDiscount_per()%>" class="form-control"
								onblur="checkCity();">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Date</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="renival_date" id="renival_date"
								placeholder="Enter Reniwal Date"
								value="<%=p_dto.getRenival_date()%>" class="form-control"
								onblur="checkCity();">



						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Recipt No</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="recipt_no" id="recipt_no"
								placeholder="Enter Recipt No" value="<%=p_dto.getRecipt_no()%>"
								class="form-control" onblur="checkCity();">



						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Remark</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="remark" id="remark"
								placeholder="Enter Recipt No" value="<%=p_dto.getRemark()%>"
								class="form-control" onblur="checkCity();">


						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Status</label>
						</div>
						<div class="col-md-6">
							<select id="status" name="status" class="form-control">
								<option value="0">Select</option>
								<option value="approval">Approval</option>
								<option value="cancel">Cencel</option>
							</select>
						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-5">&nbsp;</div>
						<div class="col-md-7">
							<input type="submit" name="submit" id="submit" value="Submit"
								class="submit" style="margin-bottom: 10px;">
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


	
	function getcity() {

		var state_id = document.getElementById("state_id").value;
		
		$.ajax({

			url : 'GetCityajx.jsp',
			data : 'state_id=' + state_id,
			type : 'post',
			success : function(msg) {

				$('#city_id').html(msg);

			}

		});

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
		
	</script>
	<script type="text/javascript">
		function getcompanyName(){
			
			var insurance_comapny_name=$("#insurance_comapny_id_fk :selected").text();  

			document.getElementById("insurance_comapny_name").value = insurance_comapny_name;
			
			
		}
	</script>