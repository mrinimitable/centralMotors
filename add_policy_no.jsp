<!DOCTYPE html>

<%@page import="com.dto.InsuranceDto"%>
<%@page import="com.service.InsuranceService"%>
<%@page import="com.service.LogFileService"%>
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
		$('#insurance_date1').datetimepicker();
	});
	$(function() {
		$('#check_date').datetimepicker();
	});
</script>






</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Add Policy No.</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

						<div class="right_side">
							<form action="InsuranceServlet" id="new" method="post">



								<%
									String cur_date = LogFileService
											.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");

									int id = Integer.parseInt(request.getParameter("id") == null
											? "0"
											: request.getParameter("id"));

									InsuranceService pur_service = new InsuranceService();

									InsuranceDto dto = pur_service.getInsuranceVehicleById(id, request, config);
								%>






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
										<label> Vehicle ID</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getVehicle_id()%>"
											class="form-control" readonly="readonly"> 
											
											<input
											type="hidden" name="id" value="<%=id%>">



									</div>
								</div>





								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Model</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getModel_name()%>"
											class="form-control" readonly="readonly">




									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Varient</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getVariant_name()%>"
											class="form-control" readonly="readonly">




									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Chechis No</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getChechis_no()%>"
											class="form-control" readonly="readonly">



									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Engine Number</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getEngine_number()%>"
											class="form-control" readonly="readonly">


									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									</br>

									<div class="col-md-2"></div>
									<div class="col-md-6" align="center">
										<label>INSURANCE INFO</label>
									</div>

								</div>






<%-- 
								<div class="col-md-12" style="padding: 0px;">

									</br>


									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Insurance Company</label>
									</div>

									<div class="col-md-6">

										<select id="company_id_fk" name="company_id_fk"
											class="form-control" onblur="getCompanyName();"
											onchange="getModelName();">
											<option value="">Select</option>
											<%
												
												InsuranceCompnayService mService=new InsuranceCompnayService();
												ArrayList<InsuranceCompanyDto>mlist=mService.getAllInsuranceCompanyActive(config, request);
												for(InsuranceCompanyDto mDto : mlist){
												%>
											<option value="<%=mDto.getId()%>"><%=mDto.getNAME()%></option>
											<%} %>

										</select> <input type="hidden" name="creator_id_fk" id="creator_id_fk"
											value="<%=creator_id%>"> <input type="hidden"
											name="session" id=session value="<%=session_year%>">
										<input type="hidden" name="company_name" id="company_name">
									
									</div>
								</div> --%>






								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Insurance Company</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="company_name" id="company_name"
											placeholder="Insurance Date" value="<%=dto.getCompany_name()%>"
											class="form-control" readonly="readonly">



									</div>
								</div>







								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Insurance Date</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="insurance_date" id="insurance_date"
											placeholder="Insurance Date" value="<%=dto.getInsurance_date()%>"
											class="form-control" readonly="readonly">



									</div>
								</div>

								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Od Premium</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="Od_premium_amount"
											id="Od_premium_amount" placeholder="Od Premium Amount"
											value="<%=dto.getOd_premium_amount() %>" class="form-control" readonly="readonly">



									</div>
								</div>

								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Total Premium</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="total_premium_amount"
											id="total_premium_amount" placeholder="Total Premium Amount"
											value="<%=dto.getTotal_premium_amount() %>" class="form-control" readonly="readonly">



									</div>
								</div>










								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Cover Note No</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="cover_note_no" id="cover_note_no"
											placeholder="Cover Note No" value="<%=dto.getCover_note_no() %>"
											class="form-control" readonly="readonly">



									</div>
								</div>

								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Policy No</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="policy_no" id="policy_no"
											placeholder="Policy No" value="<%=dto.getPolicy_no() %>"
											class="form-control">



									</div>
								</div>



								<div class=" col-md-12 " style="display: none;">

									</br>



									<table style="width: 100%">
										<tr align="center">
											<td><input type="radio" value="Cheque"
												name="payment_mode" onclick="showHideDD(this.value)" /> <strong
												style="margin-left: 5px; font-size: 14px; font-weight: normal;">Cheque
													/ DD </strong> <input type="radio" value="Swap" name="modeType"
												onclick="showHideDD(this.value)" /> <strong
												style="margin-left: 5px; font-size: 14px; font-weight: normal;">Neft
													/ Rtgs </strong></td>
										</tr>
									</table>






									<div class=" col-md-12 " style="padding: 0px;">
										</br>


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

													<option value="<%=bankDto.getBank_id()%>"><%=bankDto.getBank_name()%></option>
													<%} %>
												</select>
											</div>



											<div class=" col-md-3 ">
												<input type="text" class="form-control" id="check_bank_name"
													name="check_bank_name" value="" placeholder="Bank Name" />
											</div>
											<div class=" col-md-3">
												<input type="text" class="form-control" id="check_no"
													name="check_no" value="" placeholder="check_no" />
											</div>
											<div class=" col-md-3 ">
												<input type="text" class="form-control" id="check_date"
													name="check_date" value="" placeholder="check_date"
													readonly="readonly" />
											</div>

										</div>

									</div>




									<br /> <br /> <br /> <br />

								</div>


								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-5">&nbsp;</div>
									<div class="col-md-7">
										<input type="submit" name="submit" id="submit" value="Submit"
											class="submit">
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
		
		
		function showHideDD(flag) {
			if (flag == 'DD' || flag == 'Cheque' || flag == 'Swap') {
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
		
		
		
		

		function getCompanyName(){
			
			var company_name=$("#company_id_fk :selected").text();  

			document.getElementById("company_name").value = company_name;
			
			
		}






	</script>
