





<!DOCTYPE html>

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
		$('#saleing_date').datetimepicker();
	});
</script>


</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Feature Alot</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

			<div class="right_side">
				<form action="RegistrationServlet" id="new" method="post">



					<%
						String id = request.getParameter("id") == null ? "0" : request
								.getParameter("id");

						String cur_date = LogFileService
								.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");

						AdminRagistrationService service = new AdminRagistrationService();
						AdminRagistrationDto dto = service.getAlotFeatureUserInfoByID(id,
								request, config);
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
							<label> Name</label>
						</div>
						<div class="col-md-6">


							<input type="text" value="<%=dto.getNAME()%>"
								class="form-control" readonly="readonly"> <input
								type="hidden" value="<%=id%>" name="creator_id"> <input
								type="hidden" name="update_status_id" value="2">




						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Mobile</label>
						</div>
						<div class="col-md-6">


							<input type="text" value="<%=dto.getMobile()%>"
								class="form-control" readonly="readonly">




						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Varient</label>
						</div>
						<div class="col-md-6">


							<input type="text" value="<%=dto.getAddress()%>"
								class="form-control" readonly="readonly">




						</div>
					</div>





					<div class="col-md-12" style="padding: 0px;">
						</br>

						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>Feature Alot Info </label>
						</div>

					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label> Inward</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="inward" value="yes"
								<%if ("yes".equals(dto.getInward())) {
				out.print("Checked='checked'");
			}%>></input>




						</div>



						<div class="col-md-2">
							<label> Transfer Vehicle</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="transfer_vehicle"
								id="purchase_module" value="yes"
								<%if ("yes".equals(dto.getTransfer_vehicle())) {
				out.print("Checked='checked'");
			}%> />


						</div>


						<div class="col-md-2">
							<label>Receiving Vehicle</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="receiving_vehicle"
								id="in_stock_vehicle" value="yes"
								<%if ("yes".equals(dto.getReceiving_vehicle())) {
				out.print("Checked='checked'");
			}%> />


						</div>

						<div class="col-md-2">
							<label>Damage Vehicle</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="damage_vehicle" id="sale_verify"
								value="yes"
								<%if ("yes".equals(dto.getDamage_vehicle())) {
				out.print("Checked='checked'");
			}%> />

						</div>





					</div>








					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label> P Claim Damage</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="p_claim_damage" value="yes"
								<%if ("yes".equals(dto.getP_claim_damage())) {
				out.print("Checked='checked'");
			}%>></input>


						</div>



						<div class="col-md-2">
							<label>C Claim Damage</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="c_claim_damage" id="c_claim_damage"
								value="yes"
								<%if ("yes".equals(dto.getC_claim_damage())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>P Credit Damage</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="p_credit_damage"
								id="p_credit_damage" value="yes"
								<%if ("yes".equals(dto.getP_credit_damage())) {
				out.print("Checked='checked'");
			}%> />

						</div>

						<div class="col-md-2">
							<label> C Credit Damage</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="c_credit_damage"
								id="c_credit_damage" value="yes"
								<%if ("yes".equals(dto.getC_credit_damage())) {
				out.print("Checked='checked'");
			}%> />


						</div>


					</div>


					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Add_Quotation </label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="add_quotation" value="yes"
								<%if ("yes".equals(dto.getAdd_quotation())) {
				out.print("Checked='checked'");
			}%>></input>




						</div>



						<div class="col-md-2">
							<label>Vehicle Request</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="vehicle_request"
								id="vehicle_request" value="yes"
								<%if ("yes".equals(dto.getVehicle_request())) {
				out.print("Checked='checked'");
			}%> />



						</div>





						<div class="col-md-2">
							<label>Pend. Veh. Req.</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pend_veh_req" id="pend_veh_req"
								value="yes"
								<%if ("yes".equals(dto.getPend_veh_req())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Comp.Veh. Req.</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="comp_veh_req" id="comp_veh_req"
								value="yes"
								<%if ("yes".equals(dto.getComp_veh_req())) {
				out.print("Checked='checked'");
			}%> />


						</div>


					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Sale Request </label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="sale_request" value="yes"
								<%if ("yes".equals(dto.getSale_request())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>



						<div class="col-md-2">
							<label>Sale Bill</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="sale_bill" id="sale_bill"
								value="yes"
								<%if ("yes".equals(dto.getSale_bill())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Sold Vehicle</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="sold_vehicle" id="sold_vehicle"
								value="yes"
								<%if ("yes".equals(dto.getSold_vehicle())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Add Workshop</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="add_workshop" id="add_workshop"
								value="yes"
								<%if ("yes".equals(dto.getAdd_workshop())) {
				out.print("Checked='checked'");
			}%> />


						</div>


					</div>






					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label> Insurance </label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="insurance" value="yes"
								<%if ("yes".equals(dto.getInsurance())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>






						<div class="col-md-2">
							<label> Insurance Report</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="insurance_report"
								id="insurance_report" value="yes"
								<%if ("yes".equals(dto.getInsurance_report())) {
				out.print("Checked='checked'");
			}%> />



						</div>




						<div class="col-md-2">
							<label>Finance</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="finance" id="finance" value="yes"
								<%if ("yes".equals(dto.getFinance())) {
				out.print("Checked='checked'");
			}%> />


						</div>







						<div class="col-md-2">
							<label>Finance Old Vehicle </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="finance_old" id="finance_old"
								value="yes"
								<%if ("yes".equals(dto.getFinance_old())) {
				out.print("Checked='checked'");
			}%> />


						</div>





					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Workshop Credit </label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="workshop_credit" value="yes"
								<%if ("yes".equals(dto.getWorkshop_credit())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>





						<div class="col-md-2">
							<label>Add Rto Tax</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="add_rto_tax"
								id="Pending_received_payment" value="yes"
								<%if ("yes".equals(dto.getAdd_rto_tax())) {
				out.print("Checked='checked'");
			}%> />



						</div>









						<div class="col-md-2">
							<label>Rto Tax Report</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="rto_tax_report"
								id="Complete_received_payment" value="yes"
								<%if ("yes".equals(dto.getRto_tax_report())) {
				out.print("Checked='checked'");
			}%> />


						</div>





						<div class="col-md-2">
							<label> Collect Rto Paper</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="collect_rto_paper"
								id="add_spent_head" value="yes"
								<%if ("yes".equals(dto.getCollect_rto_paper())) {
				out.print("Checked='checked'");
			}%> />


						</div>





					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Collect Paper To Customer</label>
						</div>
						<div class="col-md-1">



							<input type="checkbox" name="collect_paper_to_customer"
								value="yes"
								<%if ("yes".equals(dto.getCollect_paper_to_customer())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>




						<div class="col-md-2">
							<label>Send To Rto</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="send_to_rto" id="send_to_rto"
								value="yes"
								<%if ("yes".equals(dto.getSend_to_rto())) {
				out.print("Checked='checked'");
			}%> />


						</div>










						<div class="col-md-2">
							<label>Receive From Rto</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="receive_from_rto"
								id="receive_from_rto" value="yes"
								<%if ("yes".equals(dto.getReceive_from_rto())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Dispatch To Customer</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="dispatch_to_customer"
								id="dispatch_to_customer" value="yes"
								<%if ("yes".equals(dto.getDispatch_to_customer())) {
				out.print("Checked='checked'");
			}%> />


						</div>







					</div>



					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label> Rto Paper Report</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="rto_paper_report" value="yes"
								<%if ("yes".equals(dto.getRto_paper_report())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>



						<div class="col-md-2">
							<label>Distributor</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="distributor" id="distributor"
								value="yes"
								<%if ("yes".equals(dto.getDistributor())) {
				out.print("Checked='checked'");
			}%> />



						</div>






						<div class="col-md-2">
							<label>Model</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="model" id="model" value="yes"
								<%if ("yes".equals(dto.getModel())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Varient</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="varient" id="varient" value="yes"
								<%if ("yes".equals(dto.getVarient())) {
				out.print("Checked='checked'");
			}%> />


						</div>






					</div>



					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Varient Update Info</label>
						</div>
						<div class="col-md-1">



							<input type="checkbox" name="varient_update_info" value="yes"
								<%if ("yes".equals(dto.getVarient_update_info())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>



						<div class="col-md-2">
							<label>Varient Variation </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="varient_variation"
								id="varient_variation" value="yes"
								<%if ("yes".equals(dto.getVarient_variation())) {
				out.print("Checked='checked'");
			}%> />



						</div>


						<div class="col-md-2">
							<label>Price List</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="price_list" id="price_list"
								value="yes"
								<%if ("yes".equals(dto.getPrice_list())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Insurance Company</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="insurance_company"
								id="insurance_company" value="yes"
								<%if ("yes".equals(dto.getInsurance_company())) {
				out.print("Checked='checked'");
			}%> />


						</div>





					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Finance Bank</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="finance_bank" value="yes"
								<%if ("yes".equals(dto.getFinance_bank())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>



						<div class="col-md-2">
							<label>Cancle Cheque</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="cancle_cheque" id="cancle_cheque"
								value="yes"
								<%if ("yes".equals(dto.getCancle_cheque())) {
				out.print("Checked='checked'");
			}%> />



						</div>


						<div class="col-md-2">
							<label>Rto Agent </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="rto_agent" id="rto_agent"
								value="yes"
								<%if ("yes".equals(dto.getRto_agent())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Add Bank Account</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="add_bank_account"
								id="add_bank_account" value="yes"
								<%if ("yes".equals(dto.getAdd_bank_account())) {
				out.print("Checked='checked'");
			}%> />


						</div>





					</div>





					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Add Spent Head </label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="add_spent_head" value="yes"
								<%if ("yes".equals(dto.getAdd_spent_head())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>



						<div class="col-md-2">
							<label>Add SubHead</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="add_sub_head" value="yes"
								<%if ("yes".equals(dto.getAdd_sub_head())) {
				out.print("Checked='checked'");
			}%>></input>




						</div>


						<div class="col-md-2">
							<label>User</label>
						</div>
						<div class="col-md-1">


							<input type="checkbox" name="user" value="yes"
								<%if ("yes".equals(dto.getUSER())) {
				out.print("Checked='checked'");
			}%>></input>



						</div>


						<div class="col-md-2">
							<label>Credit Report </label>
						</div>
						<div class="col-md-1">



							<input type="checkbox" name="credit_report" value="yes"
								<%if ("yes".equals(dto.getCredit_report())) {
				out.print("Checked='checked'");
			}%>></input>



						</div>



					</div>


					<div class="col-md-12" style="padding: 0px;">
						</br>


						<div class="col-md-2">
							<label>Old Vehicle Credit Report</label>
						</div>
						<div class="col-md-1">


							<input type="checkbox" name="old_vehicle_credit_report"
								value="yes"
								<%if ("yes".equals(dto.getOld_vehicle_credit_report())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>





						<div class="col-md-2">
							<label>Spent</label>
						</div>
						<div class="col-md-1">


							<input type="checkbox" name="spent" value="yes"
								<%if ("yes".equals(dto.getSpent())) {
				out.print("Checked='checked'");
			}%>></input>



						</div>



						<div class="col-md-2">
							<label>Pay Spent Report</label>
						</div>
						<div class="col-md-1">


							<input type="checkbox" name="pay_spent_report" value="yes"
								<%if ("yes".equals(dto.getPay_spent_report())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>

						<div class="col-md-2">
							<label>Spent Report</label>
						</div>
						<div class="col-md-1">



							<input type="checkbox" name="spent_report" value="yes"
								<%if ("yes".equals(dto.getSpent_report())) {
				out.print("Checked='checked'");
			}%>></input>


						</div>

						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2">
								<label>Spent Cheque Rep.</label>
							</div>
							<div class="col-md-1">


								<input type="checkbox" name="spent_cheque_rep" value="yes"
									<%if ("yes".equals(dto.getSpent_cheque_rep())) {
				out.print("Checked='checked'");
			}%>></input>





							</div>

							<div class="col-md-2">
								<label>Rec. Payment</label>
							</div>
							<div class="col-md-1">



								<input type="checkbox" name="rec_payment" value="yes"
									<%if ("yes".equals(dto.getRec_payment())) {
				out.print("Checked='checked'");
			}%>></input>





							</div>

							<div class="col-md-2">
								<label>Received Report</label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="received_report" value="yes"
									<%if ("yes".equals(dto.getReceived_report())) {
				out.print("Checked='checked'");
			}%>></input>





							</div>

							<div class="col-md-2">
								<label>Today Cheque</label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="today_cheque" value="yes"
									<%if ("yes".equals(dto.getToday_cheque())) {
				out.print("Checked='checked'");
			}%>></input>




							</div>

							<div class="col-md-12" style="padding: 0px;">
								</br>

								<div class="col-md-2">
									<label>Cancle Cheque</label>
								</div>
								<div class="col-md-1">
									<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


									<input type="checkbox" name="cancle_cheque" value="yes"
										<%if ("yes".equals(dto.getCancle_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





								</div>

								<div class="col-md-2">
									<label>Bounced Cheque</label>
								</div>
								<div class="col-md-1">
									<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


									<input type="checkbox" name="bounced_cheque" value="yes"
										<%if ("yes".equals(dto.getBounced_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





								</div>

								<div class="col-md-2">
									<label>Day Book </label>
								</div>
								<div class="col-md-1">



									<input type="checkbox" name="day_book" value="yes"
										<%if ("yes".equals(dto.getDay_book())) {
				out.print("Checked='checked'");
			}%>></input>





								</div>

								<div class="col-md-2">
									<label>Cash Book</label>
								</div>
								<div class="col-md-1">



									<input type="checkbox" name="cash_book" value="yes"
										<%if ("yes".equals(dto.getCash_book())) {
				out.print("Checked='checked'");
			}%>></input>




								</div>

								<div class="col-md-12" style="padding: 0px;">
									</br>


									<div class="col-md-2">
										<label>Banking</label>
									</div>
									<div class="col-md-1">
										<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


										<input type="checkbox" name="banking" value="yes"
											<%if ("yes".equals(dto.getBanking())) {
				out.print("Checked='checked'");
			}%>></input>





									</div>

									<div class="col-md-2">
										<label>Khandwa Spent Cheque</label>
									</div>
									<div class="col-md-1">
										<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


										<input type="checkbox" name="khandwa_spent_cheque" value="yes"
											<%if ("yes".equals(dto.getKhandwa_spent_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





									</div>

									<div class="col-md-2">
										<label>Khargone Spent Cheque</label>
									</div>
									<div class="col-md-1">
										<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


										<input type="checkbox" name="khargone_spent_cheque"
											value="yes"
											<%if ("yes".equals(dto.getKhargone_spent_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





									</div>

									<div class="col-md-2">
										<label>Burhanpur Spent Cheque</label>
									</div>
									<div class="col-md-1">
										<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


										<input type="checkbox" name="burhanpur_spent_cheque"
											value="yes"
											<%if ("yes".equals(dto.getBurhanpur_spent_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





									</div>
									<div class="col-md-12" style="padding: 0px;">
										</br>
										<div class="col-md-2">
											<label>Barwani Spent Cheque</label>
										</div>
										<div class="col-md-1">
											<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


											<input type="checkbox" name="barwani_spent_cheque"
												value="yes"
												<%if ("yes".equals(dto.getBarwani_spent_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





										</div>

										<div class="col-md-2">
											<label>Available Old Stock</label>
										</div>
										<div class="col-md-1">
											<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


											<input type="checkbox" name="available_old_stock" value="yes"
												<%if ("yes".equals(dto.getAvailable_old_stock())) {
				out.print("Checked='checked'");
			}%>></input>





										</div>

										<div class="col-md-2">
											<label>Complete Old Stock Report</label>
										</div>
										<div class="col-md-1">
											<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


											<input type="checkbox" name="complete_old_stock_report"
												value="yes"
												<%if ("yes".equals(dto.getComplete_old_stock_report())) {
				out.print("Checked='checked'");
			}%>></input>





										</div>

										<div class="col-md-2">
											<label>Pending Accessories Report</label>
										</div>
										<div class="col-md-1">
											<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


											<input type="checkbox" name="pending_accessories_report"
												value="yes"
												<%if ("yes".equals(dto.getPending_accessories_report())) {
				out.print("Checked='checked'");
			}%>></input>





										</div>
										<div class="col-md-12" style="padding: 0px;">
											</br>
											<div class="col-md-2">

												<label>Complete Accessories Report</label>
											</div>
											<div class="col-md-1">
												<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


												<input type="checkbox" name="complete_accessories_report"
													value="yes"
													<%if ("yes".equals(dto.getComplete_accessories_report())) {
				out.print("Checked='checked'");
			}%>></input>





											</div>

											<div class="col-md-2">
												<label>Pending Credit Exchange Bonus</label>
											</div>
											<div class="col-md-1">



												<input type="checkbox" name="pending_credit_exchange_bonus"
													value="yes"
													<%if ("yes".equals(dto.getPending_credit_exchange_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





											</div>

											<div class="col-md-2">
												<label>Complete Credit Exchange Bonus</label>
											</div>
											<div class="col-md-1">



												<input type="checkbox" name="complete_credit_exchange_bonus"
													value="yes"
													<%if ("yes".equals(dto.getComplete_credit_exchange_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





											</div>

											<div class="col-md-2">
												<label>Pending Claim Loyalty Bonus</label>
											</div>
											<div class="col-md-1">
												<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


												<input type="checkbox" name="pending_claim_loyalty_bonus"
													value="yes"
													<%if ("yes".equals(dto.getPending_claim_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





											</div>
											<div class="col-md-12" style="padding: 0px;">
												</br>
												<div class="col-md-2">
													<label>Complete Claim Loyalty Bonus</label>
												</div>
												<div class="col-md-1">
													<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


													<input type="checkbox" name="complete_claim_loyalty_bonus"
														value="yes"
														<%if ("yes".equals(dto.getComplete_claim_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





												</div>

												<div class="col-md-2">
													<label>Pending Credit Loyalty Bonus</label>
												</div>
												<div class="col-md-1">
													<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


													<input type="checkbox" name="pending_credit_loyalty_bonus"
														value="yes"
														<%if ("yes".equals(dto.getPending_credit_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





												</div>

												<div class="col-md-2">
													<label>Complete Credit Loyalty Bonus</label>
												</div>
												<div class="col-md-1">
													<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


													<input type="checkbox" name="complete_credit_loyalty_bonus"
														value="yes"
														<%if ("yes".equals(dto.getComplete_credit_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





												</div>

												<div class="col-md-2">
													<label>Pending Claim Corporate Bonus</label>
												</div>
												<div class="col-md-1">
													<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


													<input type="checkbox" name="pending_claim_corporate_bonus"
														value="yes"
														<%if ("yes".equals(dto.getPending_claim_corporate_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





												</div>
												<div class="col-md-12" style="padding: 0px;">
													</br>
													<div class="col-md-2">

														<label>Complete Claim Corporate Bonus</label>
													</div>
													<div class="col-md-1">
														<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


														<input type="checkbox"
															name="complete_claim_corporate_bonus" value="yes"
															<%if ("yes".equals(dto.getComplete_claim_corporate_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





													</div>

													<div class="col-md-2">
														<label>Pending Credit Corporate Bonus</label>
													</div>
													<div class="col-md-1">
														<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


														<input type="checkbox"
															name="pending_credit_corporate_bonus" value="yes"
															<%if ("yes".equals(dto.getPending_credit_corporate_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





													</div>

													<div class="col-md-2">
														<label>Complete Credit Corporate Bonus</label>
													</div>
													<div class="col-md-1">


														<input type="checkbox"
															name="complete_credit_corporate_bonus" value="yes"
															<%if ("yes".equals(dto.getComplete_credit_corporate_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





													</div>

													<div class="col-md-2">
														<label>Add Collect Post</label>
													</div>
													<div class="col-md-1">
														<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


														<input type="checkbox" name="add_collect_post" value="yes"
															<%if ("yes".equals(dto.getAdd_collect_post())) {
				out.print("Checked='checked'");
			}%>></input>





													</div>
													<div class="col-md-12" style="padding: 0px;">
														</br>
														<div class="col-md-2">
															<label>Collect Post</label>
														</div>
														<div class="col-md-1">
															<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


															<input type="checkbox" name="collect_post" value="yes"
																<%if ("yes".equals(dto.getCollect_post())) {
				out.print("Checked='checked'");
			}%>></input>





														</div>

														<div class="col-md-2">
															<label>Add Transerfer Post</label>
														</div>
														<div class="col-md-1">
															<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


															<input type="checkbox" name="add_transerfer_post"
																value="yes"
																<%if ("yes".equals(dto.getAdd_transerfer_post())) {
				out.print("Checked='checked'");
			}%>></input>





														</div>
														<div class="col-md-2">
															<label>Transfer Post Report</label>
														</div>
														<div class="col-md-1">
															<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


															<input type="checkbox" name="transfer_post_report"
																value="yes"
																<%if ("yes".equals(dto.getTransfer_post_report())) {
				out.print("Checked='checked'");
			}%>></input>





														</div>
														<div class="col-md-2">
															<label>Receiver Transfer Post Report</label>
														</div>
														<div class="col-md-1">
															<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


															<input type="checkbox"
																name="receiver_transfer_post_report" value="yes"
																<%if ("yes".equals(dto.getReceiver_transfer_post_report())) {
				out.print("Checked='checked'");
			}%>></input>





														</div>
														<div class="col-md-12" style="padding: 0px;">
															</br>
															<div class="col-md-2">

																<label>Quotation</label>
															</div>
															<div class="col-md-1">
																<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																<input type="checkbox" name="quotation" value="yes"
																	<%if ("yes".equals(dto.getQuotation())) {
				out.print("Checked='checked'");
			}%>></input>





															</div>
															<div class="col-md-2">
																<label>Discount Report</label>
															</div>
															<div class="col-md-1">
																<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																<input type="checkbox" name="discount_report"
																	value="yes"
																	<%if ("yes".equals(dto.getDiscount_report())) {
				out.print("Checked='checked'");
			}%>></input>





															</div>
															<div class="col-md-2">
																<label>Manage User</label>
															</div>
															<div class="col-md-1">
																<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																<input type="checkbox" name="manage_user" value="yes"
																	<%if ("yes".equals(dto.getManage_user())) {
				out.print("Checked='checked'");
			}%>></input>





															</div>
															<div class="col-md-2">
																<label>Pending Claim Exchange Bonus</label>
															</div>
															<div class="col-md-1">
																<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																<input type="checkbox"
																	name="pending_claim_exchange_bonus" value="yes"
																	<%if ("yes".equals(dto.getPending_claim_exchange_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





															</div>
															<div class="col-md-12" style="padding: 0px;">
																</br>
																<div class="col-md-2">
																	<label>Complete Claim Exchange Bonus</label>
																</div>
																<div class="col-md-1">
																	<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																	<input type="checkbox"
																		name="complete_claim_exchange_bonus" value="yes"
																		<%if ("yes".equals(dto.getComplete_claim_exchange_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





																</div>
																<div class="col-md-2">
																	<label>Pend. RsaAmount </label>
																</div>
																<div class="col-md-1">
																	<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																	<input type="checkbox" name="pend_rsa_amount"
																		value="yes"
																		<%if ("yes".equals(dto.getPend_rsa_amount())) {
				out.print("Checked='checked'");
			}%>></input>





																</div>
																<div class="col-md-2">
																	<label>Comp Rsa Amount</label>
																</div>
																<div class="col-md-1">
																	<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																	<input type="checkbox" name="comp_rsa_amount"
																		value="yes"
																		<%if ("yes".equals(dto.getComp_rsa_amount())) {
				out.print("Checked='checked'");
			}%>></input>





																</div>
																<div class="col-md-2">
																	<label>Pend Ext Warranty</label>
																</div>
																<div class="col-md-1">
																	<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																	<input type="checkbox" name="pend_ext_warranty"
																		value="yes"
																		<%if ("yes".equals(dto.getPend_ext_warranty())) {
				out.print("Checked='checked'");
			}%>></input>





																</div>
																<div class="col-md-12" style="padding: 0px;">
																	</br>
																	<div class="col-md-2">
																		<label>Comp Ext Warranty</label>
																	</div>
																	<div class="col-md-1">



																		<input type="checkbox" name="comp_ext_warranty"
																			value="yes"
																			<%if ("yes".equals(dto.getComp_ext_warranty())) {
				out.print("Checked='checked'");
			}%>></input>





																	</div>
																	<div class="col-md-2">
																		<label>Pend Other Charges</label>
																	</div>
																	<div class="col-md-1">
																		<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																		<input type="checkbox" name="pend_oth_charges"
																			value="yes"
																			<%if ("yes".equals(dto.getPend_oth_charges())) {
				out.print("Checked='checked'");
			}%>></input>





																	</div>
																	<div class="col-md-2">
																		<label>Comp. Oth.Charges</label>
																	</div>
																	<div class="col-md-1">
																		<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																		<input type="checkbox" name="comp_oth_charges"
																			value="yes"
																			<%if ("yes".equals(dto.getComp_oth_charges())) {
				out.print("Checked='checked'");
			}%>></input>





																	</div>
																	<div class="col-md-2">
																		<label>Sale Aprovel</label>
																	</div>
																	<div class="col-md-1">
																		<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																		<input type="checkbox" name="sale_aprovel" value="yes"
																			<%if ("yes".equals(dto.getSale_aprovel())) {
				out.print("Checked='checked'");
			}%>></input>





																	</div>
																	<div class="col-md-12" style="padding: 0px;">
																		</br>
																		<div class="col-md-2">
																			<label>Workshop Aprovel</label>
																		</div>
																		<div class="col-md-1">
																			<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																			<input type="checkbox" name="workshop_aprovel"
																				value="yes"
																				<%if ("yes".equals(dto.getWorkshop_aprovel())) {
				out.print("Checked='checked'");
			}%>></input>





																		</div>

																		<div class="col-md-2">
																			<label>Spent Aprovel</label>
																		</div>
																		<div class="col-md-1">
																			<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																			<input type="checkbox" name="spent_aprovel"
																				value="yes"
																				<%if ("yes".equals(dto.getSpent_aprovel())) {
				out.print("Checked='checked'");
			}%>></input>





																		</div>
																		<div class="col-md-2">
																			<label>Rec. Aprovel.</label>
																		</div>
																		<div class="col-md-1">
																			<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																			<input type="checkbox" name="rec_aprovel" value="yes"
																				<%if ("yes".equals(dto.getRec_aprovel())) {
				out.print("Checked='checked'");
			}%>></input>





																		</div>
																		<div class="col-md-2">
																			<label>Khandwa Spent Cheque Pay</label>
																		</div>
																		<div class="col-md-1">
																			<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																			<input type="checkbox"
																				name="khandwa_spent_cheque_pay" value="yes"
																				<%if ("yes".equals(dto.getKhandwa_spent_cheque_pay())) {
				out.print("Checked='checked'");
			}%>></input>





																		</div>
																		<div class="col-md-12" style="padding: 0px;">
																			</br>
																			<div class="col-md-2">
																				<label>Khargone Spent Cheque Pay</label>
																			</div>
																			<div class="col-md-1">
																				<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																				<input type="checkbox"
																					name="khargone_spent_cheque_pay" value="yes"
																					<%if ("yes".equals(dto.getKhargone_spent_cheque_pay())) {
				out.print("Checked='checked'");
			}%>></input>





																			</div>

																			<div class="col-md-2">
																				<label>Burhanpur Spent Cheque Pay</label>
																			</div>
																			<div class="col-md-1">
																				<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																				<input type="checkbox"
																					name="burhanpur_spent_cheque_pay" value="yes"
																					<%if ("yes".equals(dto.getBurhanpur_spent_cheque_pay())) {
				out.print("Checked='checked'");
			}%>></input>





																			</div>

																			<div class="col-md-2">
																				<label>Barwani Spent Cheque Pay </label>
																			</div>
																			<div class="col-md-1">
																				<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																				<input type="checkbox"
																					name="barwani_spent_cheque_pay" value="yes"
																					<%if ("yes".equals(dto.getBarwani_spent_cheque_pay())) {
				out.print("Checked='checked'");
			}%>></input>





																			</div>


																			<div class="col-md-2">
																				<label>Workshop Report </label>
																			</div>
																			<div class="col-md-1">
																				<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																				<input type="checkbox" name="workshop_report"
																					value="yes"
																					<%if ("yes".equals(dto.getWorkshop_report())) {
				out.print("Checked='checked'");
			}%>></input>





																			</div>





																		</div>

																		<div class="col-md-12" style="padding: 0px;">
																			</br>


																			<div class="col-md-2">
																				<label>Cash Rec. Payment</label>
																			</div>
																			<div class="col-md-1">



																				<input type="checkbox" name="rec_payment_cash"
																					value="yes"
																					<%if ("yes".equals(dto.getRec_payment_cash())) {
				out.print("Checked='checked'");
			}%>></input>





																			</div>




																		</div>









																		<div class="col-md-12" style="padding: 0px;">
																			<div class="col-md-5">&nbsp;</div>
																			<div class="col-md-7">
																				<input type="submit" name="submit" id="submit"
																					value="Submit" class="submit">
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



	<!DOCTYPE html>

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
		$('#saleing_date').datetimepicker();
	});
</script>


</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Feature Alot</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

			<div class="right_side">
				<form action="RegistrationServlet" id="new" method="post">



					<%
						String id = request.getParameter("id") == null ? "0" : request
								.getParameter("id");

						String cur_date = LogFileService
								.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");

						AdminRagistrationService service = new AdminRagistrationService();
						AdminRagistrationDto dto = service.getAlotFeatureUserInfoByID(id,
								request, config);
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
							<label> Name</label>
						</div>
						<div class="col-md-6">


							<input type="text" value="<%=dto.getNAME()%>"
								class="form-control" readonly="readonly"> <input
								type="hidden" value="<%=id%>" name="creator_id"> <input
								type="hidden" name="update_status_id" value="2">




						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Mobile</label>
						</div>
						<div class="col-md-6">


							<input type="text" value="<%=dto.getMobile()%>"
								class="form-control" readonly="readonly">




						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Varient</label>
						</div>
						<div class="col-md-6">


							<input type="text" value="<%=dto.getAddress()%>"
								class="form-control" readonly="readonly">




						</div>
					</div>





					<div class="col-md-12" style="padding: 0px;">
						</br>

						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>Feature Alot Info </label>
						</div>

					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label> Inward</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="inward" value="yes"
								<%if ("yes".equals(dto.getInward())) {
				out.print("Checked='checked'");
			}%>></input>




						</div>



						<div class="col-md-2">
							<label> Transfer Vehicle</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="transfer_vehicle"
								id="purchase_module" value="yes"
								<%if ("yes".equals(dto.getTransfer_vehicle())) {
				out.print("Checked='checked'");
			}%> />


						</div>


						<div class="col-md-2">
							<label>Receiving Vehicle</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="receiving_vehicle"
								id="in_stock_vehicle" value="yes"
								<%if ("yes".equals(dto.getReceiving_vehicle())) {
				out.print("Checked='checked'");
			}%> />


						</div>

						<div class="col-md-2">
							<label>Damage Vehicle</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="damage_vehicle" id="sale_verify"
								value="yes"
								<%if ("yes".equals(dto.getDamage_vehicle())) {
				out.print("Checked='checked'");
			}%> />

						</div>





					</div>








					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label> P Claim Damage</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="p_claim_damage" value="yes"
								<%if ("yes".equals(dto.getP_claim_damage())) {
				out.print("Checked='checked'");
			}%>></input>


						</div>



						<div class="col-md-2">
							<label>C Claim Damage</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="c_claim_damage" id="c_claim_damage"
								value="yes"
								<%if ("yes".equals(dto.getC_claim_damage())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>P Credit Damage</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="p_credit_damage"
								id="p_credit_damage" value="yes"
								<%if ("yes".equals(dto.getP_credit_damage())) {
				out.print("Checked='checked'");
			}%> />

						</div>

						<div class="col-md-2">
							<label> C Credit Damage</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="c_credit_damage"
								id="c_credit_damage" value="yes"
								<%if ("yes".equals(dto.getC_credit_damage())) {
				out.print("Checked='checked'");
			}%> />


						</div>


					</div>


					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Add_Quotation </label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="add_quotation" value="yes"
								<%if ("yes".equals(dto.getAdd_quotation())) {
				out.print("Checked='checked'");
			}%>></input>




						</div>



						<div class="col-md-2">
							<label>Vehicle Request</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="vehicle_request"
								id="vehicle_request" value="yes"
								<%if ("yes".equals(dto.getVehicle_request())) {
				out.print("Checked='checked'");
			}%> />



						</div>





						<div class="col-md-2">
							<label>Pend. Veh. Req.</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pend_veh_req" id="pend_veh_req"
								value="yes"
								<%if ("yes".equals(dto.getPend_veh_req())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Comp.Veh. Req.</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="comp_veh_req" id="comp_veh_req"
								value="yes"
								<%if ("yes".equals(dto.getComp_veh_req())) {
				out.print("Checked='checked'");
			}%> />


						</div>


					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Sale Request </label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="sale_request" value="yes"
								<%if ("yes".equals(dto.getSale_request())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>



						<div class="col-md-2">
							<label>Sale Bill</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="sale_bill" id="sale_bill"
								value="yes"
								<%if ("yes".equals(dto.getSale_bill())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Sold Vehicle</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="sold_vehicle" id="sold_vehicle"
								value="yes"
								<%if ("yes".equals(dto.getSold_vehicle())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Add Workshop</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="add_workshop" id="add_workshop"
								value="yes"
								<%if ("yes".equals(dto.getAdd_workshop())) {
				out.print("Checked='checked'");
			}%> />


						</div>


					</div>






					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label> Insurance </label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="insurance" value="yes"
								<%if ("yes".equals(dto.getInsurance())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>






						<div class="col-md-2">
							<label> Insurance Report</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="insurance_report"
								id="insurance_report" value="yes"
								<%if ("yes".equals(dto.getInsurance_report())) {
				out.print("Checked='checked'");
			}%> />



						</div>




						<div class="col-md-2">
							<label>Finance</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="finance" id="finance" value="yes"
								<%if ("yes".equals(dto.getFinance())) {
				out.print("Checked='checked'");
			}%> />


						</div>







						<div class="col-md-2">
							<label>Finance Old Vehicle </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="finance_old" id="finance_old"
								value="yes"
								<%if ("yes".equals(dto.getFinance_old())) {
				out.print("Checked='checked'");
			}%> />


						</div>





					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Workshop Credit </label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="workshop_credit" value="yes"
								<%if ("yes".equals(dto.getWorkshop_credit())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>





						<div class="col-md-2">
							<label>Add Rto Tax</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="add_rto_tax"
								id="Pending_received_payment" value="yes"
								<%if ("yes".equals(dto.getAdd_rto_tax())) {
				out.print("Checked='checked'");
			}%> />



						</div>









						<div class="col-md-2">
							<label>Rto Tax Report</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="rto_tax_report"
								id="Complete_received_payment" value="yes"
								<%if ("yes".equals(dto.getRto_tax_report())) {
				out.print("Checked='checked'");
			}%> />


						</div>





						<div class="col-md-2">
							<label> Collect Rto Paper</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="collect_rto_paper"
								id="add_spent_head" value="yes"
								<%if ("yes".equals(dto.getCollect_rto_paper())) {
				out.print("Checked='checked'");
			}%> />


						</div>





					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Collect Paper To Customer</label>
						</div>
						<div class="col-md-1">



							<input type="checkbox" name="collect_paper_to_customer"
								value="yes"
								<%if ("yes".equals(dto.getCollect_paper_to_customer())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>




						<div class="col-md-2">
							<label>Send To Rto</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="send_to_rto" id="send_to_rto"
								value="yes"
								<%if ("yes".equals(dto.getSend_to_rto())) {
				out.print("Checked='checked'");
			}%> />


						</div>










						<div class="col-md-2">
							<label>Receive From Rto</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="receive_from_rto"
								id="receive_from_rto" value="yes"
								<%if ("yes".equals(dto.getReceive_from_rto())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Dispatch To Customer</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="dispatch_to_customer"
								id="dispatch_to_customer" value="yes"
								<%if ("yes".equals(dto.getDispatch_to_customer())) {
				out.print("Checked='checked'");
			}%> />


						</div>







					</div>



					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label> Rto Paper Report</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="rto_paper_report" value="yes"
								<%if ("yes".equals(dto.getRto_paper_report())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>



						<div class="col-md-2">
							<label>Distributor</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="distributor" id="distributor"
								value="yes"
								<%if ("yes".equals(dto.getDistributor())) {
				out.print("Checked='checked'");
			}%> />



						</div>






						<div class="col-md-2">
							<label>Model</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="model" id="model" value="yes"
								<%if ("yes".equals(dto.getModel())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Varient</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="varient" id="varient" value="yes"
								<%if ("yes".equals(dto.getVarient())) {
				out.print("Checked='checked'");
			}%> />


						</div>






					</div>



					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Varient Update Info</label>
						</div>
						<div class="col-md-1">



							<input type="checkbox" name="varient_update_info" value="yes"
								<%if ("yes".equals(dto.getVarient_update_info())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>



						<div class="col-md-2">
							<label>Varient Variation </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="varient_variation"
								id="varient_variation" value="yes"
								<%if ("yes".equals(dto.getVarient_variation())) {
				out.print("Checked='checked'");
			}%> />



						</div>


						<div class="col-md-2">
							<label>Price List</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="price_list" id="price_list"
								value="yes"
								<%if ("yes".equals(dto.getPrice_list())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Insurance Company</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="insurance_company"
								id="insurance_company" value="yes"
								<%if ("yes".equals(dto.getInsurance_company())) {
				out.print("Checked='checked'");
			}%> />


						</div>





					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Finance Bank</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="finance_bank" value="yes"
								<%if ("yes".equals(dto.getFinance_bank())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>



						<div class="col-md-2">
							<label>Cancle Cheque</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="cancle_cheque" id="cancle_cheque"
								value="yes"
								<%if ("yes".equals(dto.getCancle_cheque())) {
				out.print("Checked='checked'");
			}%> />



						</div>


						<div class="col-md-2">
							<label>Rto Agent </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="rto_agent" id="rto_agent"
								value="yes"
								<%if ("yes".equals(dto.getRto_agent())) {
				out.print("Checked='checked'");
			}%> />


						</div>



						<div class="col-md-2">
							<label>Add Bank Account</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="add_bank_account"
								id="add_bank_account" value="yes"
								<%if ("yes".equals(dto.getAdd_bank_account())) {
				out.print("Checked='checked'");
			}%> />


						</div>





					</div>





					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label>Add Spent Head </label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="add_spent_head" value="yes"
								<%if ("yes".equals(dto.getAdd_spent_head())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>



						<div class="col-md-2">
							<label>Add SubHead</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="add_sub_head" value="yes"
								<%if ("yes".equals(dto.getAdd_sub_head())) {
				out.print("Checked='checked'");
			}%>></input>




						</div>


						<div class="col-md-2">
							<label>User</label>
						</div>
						<div class="col-md-1">


							<input type="checkbox" name="user" value="yes"
								<%if ("yes".equals(dto.getUSER())) {
				out.print("Checked='checked'");
			}%>></input>



						</div>


						<div class="col-md-2">
							<label>Credit Report </label>
						</div>
						<div class="col-md-1">



							<input type="checkbox" name="credit_report" value="yes"
								<%if ("yes".equals(dto.getCredit_report())) {
				out.print("Checked='checked'");
			}%>></input>



						</div>



					</div>


					<div class="col-md-12" style="padding: 0px;">
						</br>


						<div class="col-md-2">
							<label>Old Vehicle Credit Report</label>
						</div>
						<div class="col-md-1">


							<input type="checkbox" name="old_vehicle_credit_report"
								value="yes"
								<%if ("yes".equals(dto.getOld_vehicle_credit_report())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>





						<div class="col-md-2">
							<label>Spent</label>
						</div>
						<div class="col-md-1">


							<input type="checkbox" name="spent" value="yes"
								<%if ("yes".equals(dto.getSpent())) {
				out.print("Checked='checked'");
			}%>></input>



						</div>



						<div class="col-md-2">
							<label>Pay Spent Report</label>
						</div>
						<div class="col-md-1">


							<input type="checkbox" name="pay_spent_report" value="yes"
								<%if ("yes".equals(dto.getPay_spent_report())) {
				out.print("Checked='checked'");
			}%>></input>





						</div>

						<div class="col-md-2">
							<label>Spent Report</label>
						</div>
						<div class="col-md-1">



							<input type="checkbox" name="spent_report" value="yes"
								<%if ("yes".equals(dto.getSpent_report())) {
				out.print("Checked='checked'");
			}%>></input>


						</div>

						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2">
								<label>Spent Cheque Rep.</label>
							</div>
							<div class="col-md-1">


								<input type="checkbox" name="spent_cheque_rep" value="yes"
									<%if ("yes".equals(dto.getSpent_cheque_rep())) {
				out.print("Checked='checked'");
			}%>></input>





							</div>

							<div class="col-md-2">
								<label>Rec. Payment</label>
							</div>
							<div class="col-md-1">



								<input type="checkbox" name="rec_payment" value="yes"
									<%if ("yes".equals(dto.getRec_payment())) {
				out.print("Checked='checked'");
			}%>></input>





							</div>

							<div class="col-md-2">
								<label>Received Report</label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="received_report" value="yes"
									<%if ("yes".equals(dto.getReceived_report())) {
				out.print("Checked='checked'");
			}%>></input>





							</div>

							<div class="col-md-2">
								<label>Today Cheque</label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="today_cheque" value="yes"
									<%if ("yes".equals(dto.getToday_cheque())) {
				out.print("Checked='checked'");
			}%>></input>




							</div>

							<div class="col-md-12" style="padding: 0px;">
								</br>

								<div class="col-md-2">
									<label>Cancle Cheque</label>
								</div>
								<div class="col-md-1">
									<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


									<input type="checkbox" name="cancle_cheque" value="yes"
										<%if ("yes".equals(dto.getCancle_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





								</div>

								<div class="col-md-2">
									<label>Bounced Cheque</label>
								</div>
								<div class="col-md-1">
									<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


									<input type="checkbox" name="bounced_cheque" value="yes"
										<%if ("yes".equals(dto.getBounced_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





								</div>

								<div class="col-md-2">
									<label>Day Book </label>
								</div>
								<div class="col-md-1">



									<input type="checkbox" name="day_book" value="yes"
										<%if ("yes".equals(dto.getDay_book())) {
				out.print("Checked='checked'");
			}%>></input>





								</div>

								<div class="col-md-2">
									<label>Cash Book</label>
								</div>
								<div class="col-md-1">



									<input type="checkbox" name="cash_book" value="yes"
										<%if ("yes".equals(dto.getCash_book())) {
				out.print("Checked='checked'");
			}%>></input>




								</div>

								<div class="col-md-12" style="padding: 0px;">
									</br>


									<div class="col-md-2">
										<label>Banking</label>
									</div>
									<div class="col-md-1">
										<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


										<input type="checkbox" name="banking" value="yes"
											<%if ("yes".equals(dto.getBanking())) {
				out.print("Checked='checked'");
			}%>></input>





									</div>

									<div class="col-md-2">
										<label>Khandwa Spent Cheque</label>
									</div>
									<div class="col-md-1">
										<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


										<input type="checkbox" name="khandwa_spent_cheque" value="yes"
											<%if ("yes".equals(dto.getKhandwa_spent_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





									</div>

									<div class="col-md-2">
										<label>Khargone Spent Cheque</label>
									</div>
									<div class="col-md-1">
										<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


										<input type="checkbox" name="khargone_spent_cheque"
											value="yes"
											<%if ("yes".equals(dto.getKhargone_spent_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





									</div>

									<div class="col-md-2">
										<label>Burhanpur Spent Cheque</label>
									</div>
									<div class="col-md-1">
										<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


										<input type="checkbox" name="burhanpur_spent_cheque"
											value="yes"
											<%if ("yes".equals(dto.getBurhanpur_spent_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





									</div>
									<div class="col-md-12" style="padding: 0px;">
										</br>
										<div class="col-md-2">
											<label>Barwani Spent Cheque</label>
										</div>
										<div class="col-md-1">
											<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


											<input type="checkbox" name="barwani_spent_cheque"
												value="yes"
												<%if ("yes".equals(dto.getBarwani_spent_cheque())) {
				out.print("Checked='checked'");
			}%>></input>





										</div>

										<div class="col-md-2">
											<label>Available Old Stock</label>
										</div>
										<div class="col-md-1">
											<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


											<input type="checkbox" name="available_old_stock" value="yes"
												<%if ("yes".equals(dto.getAvailable_old_stock())) {
				out.print("Checked='checked'");
			}%>></input>





										</div>

										<div class="col-md-2">
											<label>Complete Old Stock Report</label>
										</div>
										<div class="col-md-1">
											<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


											<input type="checkbox" name="complete_old_stock_report"
												value="yes"
												<%if ("yes".equals(dto.getComplete_old_stock_report())) {
				out.print("Checked='checked'");
			}%>></input>





										</div>

										<div class="col-md-2">
											<label>Pending Accessories Report</label>
										</div>
										<div class="col-md-1">
											<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


											<input type="checkbox" name="pending_accessories_report"
												value="yes"
												<%if ("yes".equals(dto.getPending_accessories_report())) {
				out.print("Checked='checked'");
			}%>></input>





										</div>
										<div class="col-md-12" style="padding: 0px;">
											</br>
											<div class="col-md-2">

												<label>Complete Accessories Report</label>
											</div>
											<div class="col-md-1">
												<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


												<input type="checkbox" name="complete_accessories_report"
													value="yes"
													<%if ("yes".equals(dto.getComplete_accessories_report())) {
				out.print("Checked='checked'");
			}%>></input>





											</div>

											<div class="col-md-2">
												<label>Pending Credit Exchange Bonus</label>
											</div>
											<div class="col-md-1">



												<input type="checkbox" name="pending_credit_exchange_bonus"
													value="yes"
													<%if ("yes".equals(dto.getPending_credit_exchange_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





											</div>

											<div class="col-md-2">
												<label>Complete Credit Exchange Bonus</label>
											</div>
											<div class="col-md-1">



												<input type="checkbox" name="complete_credit_exchange_bonus"
													value="yes"
													<%if ("yes".equals(dto.getComplete_credit_exchange_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





											</div>

											<div class="col-md-2">
												<label>Pending Claim Loyalty Bonus</label>
											</div>
											<div class="col-md-1">
												<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


												<input type="checkbox" name="pending_claim_loyalty_bonus"
													value="yes"
													<%if ("yes".equals(dto.getPending_claim_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





											</div>
											<div class="col-md-12" style="padding: 0px;">
												</br>
												<div class="col-md-2">
													<label>Complete Claim Loyalty Bonus</label>
												</div>
												<div class="col-md-1">
													<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


													<input type="checkbox" name="complete_claim_loyalty_bonus"
														value="yes"
														<%if ("yes".equals(dto.getComplete_claim_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





												</div>

												<div class="col-md-2">
													<label>Pending Credit Loyalty Bonus</label>
												</div>
												<div class="col-md-1">
													<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


													<input type="checkbox" name="pending_credit_loyalty_bonus"
														value="yes"
														<%if ("yes".equals(dto.getPending_credit_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





												</div>

												<div class="col-md-2">
													<label>Complete Credit Loyalty Bonus</label>
												</div>
												<div class="col-md-1">
													<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


													<input type="checkbox" name="complete_credit_loyalty_bonus"
														value="yes"
														<%if ("yes".equals(dto.getComplete_credit_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





												</div>

												<div class="col-md-2">
													<label>Pending Claim Corporate Bonus</label>
												</div>
												<div class="col-md-1">
													<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


													<input type="checkbox" name="pending_claim_corporate_bonus"
														value="yes"
														<%if ("yes".equals(dto.getPending_claim_corporate_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





												</div>
												<div class="col-md-12" style="padding: 0px;">
													</br>
													<div class="col-md-2">

														<label>Complete Claim Corporate Bonus</label>
													</div>
													<div class="col-md-1">
														<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


														<input type="checkbox"
															name="complete_claim_corporate_bonus" value="yes"
															<%if ("yes".equals(dto.getComplete_claim_corporate_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





													</div>

													<div class="col-md-2">
														<label>Pending Credit Corporate Bonus</label>
													</div>
													<div class="col-md-1">
														<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


														<input type="checkbox"
															name="pending_credit_corporate_bonus" value="yes"
															<%if ("yes".equals(dto.getPending_credit_corporate_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





													</div>

													<div class="col-md-2">
														<label>Complete Credit Corporate Bonus</label>
													</div>
													<div class="col-md-1">


														<input type="checkbox"
															name="complete_credit_corporate_bonus" value="yes"
															<%if ("yes".equals(dto.getComplete_credit_corporate_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





													</div>

													<div class="col-md-2">
														<label>Add Collect Post</label>
													</div>
													<div class="col-md-1">
														<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


														<input type="checkbox" name="add_collect_post" value="yes"
															<%if ("yes".equals(dto.getAdd_collect_post())) {
				out.print("Checked='checked'");
			}%>></input>





													</div>
													<div class="col-md-12" style="padding: 0px;">
														</br>
														<div class="col-md-2">
															<label>Collect Post</label>
														</div>
														<div class="col-md-1">
															<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


															<input type="checkbox" name="collect_post" value="yes"
																<%if ("yes".equals(dto.getCollect_post())) {
				out.print("Checked='checked'");
			}%>></input>





														</div>

														<div class="col-md-2">
															<label>Add Transerfer Post</label>
														</div>
														<div class="col-md-1">
															<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


															<input type="checkbox" name="add_transerfer_post"
																value="yes"
																<%if ("yes".equals(dto.getAdd_transerfer_post())) {
				out.print("Checked='checked'");
			}%>></input>





														</div>
														<div class="col-md-2">
															<label>Transfer Post Report</label>
														</div>
														<div class="col-md-1">
															<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


															<input type="checkbox" name="transfer_post_report"
																value="yes"
																<%if ("yes".equals(dto.getTransfer_post_report())) {
				out.print("Checked='checked'");
			}%>></input>





														</div>
														<div class="col-md-2">
															<label>Receiver Transfer Post Report</label>
														</div>
														<div class="col-md-1">
															<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


															<input type="checkbox"
																name="receiver_transfer_post_report" value="yes"
																<%if ("yes".equals(dto.getReceiver_transfer_post_report())) {
				out.print("Checked='checked'");
			}%>></input>





														</div>
														<div class="col-md-12" style="padding: 0px;">
															</br>
															<div class="col-md-2">

																<label>Quotation</label>
															</div>
															<div class="col-md-1">
																<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																<input type="checkbox" name="quotation" value="yes"
																	<%if ("yes".equals(dto.getQuotation())) {
				out.print("Checked='checked'");
			}%>></input>





															</div>
															<div class="col-md-2">
																<label>Discount Report</label>
															</div>
															<div class="col-md-1">
																<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																<input type="checkbox" name="discount_report"
																	value="yes"
																	<%if ("yes".equals(dto.getDiscount_report())) {
				out.print("Checked='checked'");
			}%>></input>





															</div>
															<div class="col-md-2">
																<label>Manage User</label>
															</div>
															<div class="col-md-1">
																<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																<input type="checkbox" name="manage_user" value="yes"
																	<%if ("yes".equals(dto.getManage_user())) {
				out.print("Checked='checked'");
			}%>></input>





															</div>
															<div class="col-md-2">
																<label>Pending Claim Exchange Bonus</label>
															</div>
															<div class="col-md-1">
																<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																<input type="checkbox"
																	name="pending_claim_exchange_bonus" value="yes"
																	<%if ("yes".equals(dto.getPending_claim_exchange_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





															</div>
															<div class="col-md-12" style="padding: 0px;">
																</br>
																<div class="col-md-2">
																	<label>Complete Claim Exchange Bonus</label>
																</div>
																<div class="col-md-1">
																	<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																	<input type="checkbox"
																		name="complete_claim_exchange_bonus" value="yes"
																		<%if ("yes".equals(dto.getComplete_claim_exchange_bonus())) {
				out.print("Checked='checked'");
			}%>></input>





																</div>
																<div class="col-md-2">
																	<label>Pend. RsaAmount </label>
																</div>
																<div class="col-md-1">
																	<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																	<input type="checkbox" name="pend_rsa_amount"
																		value="yes"
																		<%if ("yes".equals(dto.getPend_rsa_amount())) {
				out.print("Checked='checked'");
			}%>></input>





																</div>
																<div class="col-md-2">
																	<label>Comp Rsa Amount</label>
																</div>
																<div class="col-md-1">
																	<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																	<input type="checkbox" name="comp_rsa_amount"
																		value="yes"
																		<%if ("yes".equals(dto.getComp_rsa_amount())) {
				out.print("Checked='checked'");
			}%>></input>





																</div>
																<div class="col-md-2">
																	<label>Pend Ext Warranty</label>
																</div>
																<div class="col-md-1">
																	<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																	<input type="checkbox" name="pend_ext_warranty"
																		value="yes"
																		<%if ("yes".equals(dto.getPend_ext_warranty())) {
				out.print("Checked='checked'");
			}%>></input>





																</div>
																<div class="col-md-12" style="padding: 0px;">
																	</br>
																	<div class="col-md-2">
																		<label>Comp Ext Warranty</label>
																	</div>
																	<div class="col-md-1">



																		<input type="checkbox" name="comp_ext_warranty"
																			value="yes"
																			<%if ("yes".equals(dto.getComp_ext_warranty())) {
				out.print("Checked='checked'");
			}%>></input>





																	</div>
																	<div class="col-md-2">
																		<label>Pend Other Charges</label>
																	</div>
																	<div class="col-md-1">
																		<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																		<input type="checkbox" name="pend_oth_charges"
																			value="yes"
																			<%if ("yes".equals(dto.getPend_oth_charges())) {
				out.print("Checked='checked'");
			}%>></input>





																	</div>
																	<div class="col-md-2">
																		<label>Comp. Oth.Charges</label>
																	</div>
																	<div class="col-md-1">
																		<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																		<input type="checkbox" name="comp_oth_charges"
																			value="yes"
																			<%if ("yes".equals(dto.getComp_oth_charges())) {
				out.print("Checked='checked'");
			}%>></input>





																	</div>
																	<div class="col-md-2">
																		<label>Sale Aprovel</label>
																	</div>
																	<div class="col-md-1">
																		<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																		<input type="checkbox" name="sale_aprovel" value="yes"
																			<%if ("yes".equals(dto.getSale_aprovel())) {
				out.print("Checked='checked'");
			}%>></input>





																	</div>
																	<div class="col-md-12" style="padding: 0px;">
																		</br>
																		<div class="col-md-2">
																			<label>Workshop Aprovel</label>
																		</div>
																		<div class="col-md-1">
																			<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																			<input type="checkbox" name="workshop_aprovel"
																				value="yes"
																				<%if ("yes".equals(dto.getWorkshop_aprovel())) {
				out.print("Checked='checked'");
			}%>></input>





																		</div>

																		<div class="col-md-2">
																			<label>Spent Aprovel</label>
																		</div>
																		<div class="col-md-1">
																			<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																			<input type="checkbox" name="spent_aprovel"
																				value="yes"
																				<%if ("yes".equals(dto.getSpent_aprovel())) {
				out.print("Checked='checked'");
			}%>></input>





																		</div>
																		<div class="col-md-2">
																			<label>Rec. Aprovel.</label>
																		</div>
																		<div class="col-md-1">
																			<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																			<input type="checkbox" name="rec_aprovel" value="yes"
																				<%if ("yes".equals(dto.getRec_aprovel())) {
				out.print("Checked='checked'");
			}%>></input>





																		</div>
																		<div class="col-md-2">
																			<label>Khandwa Spent Cheque Pay</label>
																		</div>
																		<div class="col-md-1">
																			<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																			<input type="checkbox"
																				name="khandwa_spent_cheque_pay" value="yes"
																				<%if ("yes".equals(dto.getKhandwa_spent_cheque_pay())) {
				out.print("Checked='checked'");
			}%>></input>





																		</div>
																		<div class="col-md-12" style="padding: 0px;">
																			</br>
																			<div class="col-md-2">
																				<label>Khargone Spent Cheque Pay</label>
																			</div>
																			<div class="col-md-1">
																				<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																				<input type="checkbox"
																					name="khargone_spent_cheque_pay" value="yes"
																					<%if ("yes".equals(dto.getKhargone_spent_cheque_pay())) {
				out.print("Checked='checked'");
			}%>></input>





																			</div>

																			<div class="col-md-2">
																				<label>Burhanpur Spent Cheque Pay</label>
																			</div>
																			<div class="col-md-1">
																				<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																				<input type="checkbox"
																					name="burhanpur_spent_cheque_pay" value="yes"
																					<%if ("yes".equals(dto.getBurhanpur_spent_cheque_pay())) {
				out.print("Checked='checked'");
			}%>></input>





																			</div>

																			<div class="col-md-2">
																				<label>Barwani Spent Cheque Pay </label>
																			</div>
																			<div class="col-md-1">
																				<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																				<input type="checkbox"
																					name="barwani_spent_cheque_pay" value="yes"
																					<%if ("yes".equals(dto.getBarwani_spent_cheque_pay())) {
				out.print("Checked='checked'");
			}%>></input>





																			</div>


																			<div class="col-md-2">
																				<label>Workshop Report </label>
																			</div>
																			<div class="col-md-1">
																				<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


																				<input type="checkbox" name="workshop_report"
																					value="yes"
																					<%if ("yes".equals(dto.getWorkshop_report())) {
				out.print("Checked='checked'");
			}%>></input>





																			</div>





																		</div>

																		<div class="col-md-12" style="padding: 0px;">
																			</br>


																			<div class="col-md-2">
																				<label>Cash Rec. Payment</label>
																			</div>
																			<div class="col-md-1">



																				<input type="checkbox" name="rec_payment_cash"
																					value="yes"
																					<%if ("yes".equals(dto.getRec_payment_cash())) {
				out.print("Checked='checked'");
			}%>></input>





																			</div>




																		</div>









																		<div class="col-md-12" style="padding: 0px;">
																			<div class="col-md-5">&nbsp;</div>
																			<div class="col-md-7">
																				<input type="submit" name="submit" id="submit"
																					value="Submit" class="submit">
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