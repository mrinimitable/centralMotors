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

						<div class="col-md-2"></div>


						<div class="col-md-6" align="center">
							<label>Purchase </label>
						</div>

					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label> Vehicle Inward</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="vehicle_inward" value="yes"
								<%if ("yes".equals(dto.getVehicle_inward())) {
				out.print("Checked='checked'");
			}%>></input>


						</div>



						<div class="col-md-2">
							<label> Transfer Without Request</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="transfer_without_request"
								id="purchase_module" value="yes"
								<%if ("yes".equals(dto.getTransfer_without_request())) {
				out.print("Checked='checked'");
			}%> />


						</div>


						<div class="col-md-2">
							<label>Vehicle Receiving</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="vehicle_receiving"
								id="in_stock_vehicle" value="yes"
								<%if ("yes".equals(dto.getVehicle_receiving())) {
				out.print("Checked='checked'");
			}%> />


						</div>

						<div class="col-md-2">
							<label>New Vehicle Stock</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="new_vehicle_stock"
								id="new_vehicle_stock" value="yes"
								<%if ("yes".equals(dto.getNew_vehicle_stock())) {
				out.print("Checked='checked'");
			}%> />

						</div>


						<div class="col-md-2">
							<label> Vehicle Request To Branch</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="vehicle_request"
								id="vehicle_request" value="yes"
								<%if ("yes".equals(dto.getVehicle_request())) {
				out.print("Checked='checked'");
			}%> />

						</div>


						<div class="col-md-2">
							<label> Pending Vehicle Request </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_vehicle_request"
								id="pending_vehicle_request" value="yes"
								<%if ("yes".equals(dto.getPending_vehicle_request())) {
				out.print("Checked='checked'");
			}%> />

						</div>


						<div class="col-md-2">
							<label> Complete Vehicle Request </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_vehicle_request"
								id="complete_vehicle_request" value="yes"
								<%if ("yes".equals(dto.getComplete_vehicle_request())) {
				out.print("Checked='checked'");
			}%> />

						</div>





					</div>


					<div class="col-md-12" style="padding: 0px;">
						</br>

						<div class="col-md-2"></div>


						<div class="col-md-6" align="center">
							<label>Claims </label>
						</div>

					</div>




					<div class="col-md-12" style="padding: 0px;">
						</br>



						<div class="col-md-2">
							<label> Pending Damage Claim</label>
						</div>
						<div class="col-md-1">
							<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


							<input type="checkbox" name="pending_damage_claim" value="yes"
								<%if ("yes".equals(dto.getPending_damage_claim())) {
				out.print("Checked='checked'");
			}%>></input>


						</div>



						<div class="col-md-2">
							<label> Pending Damage Credit Note</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_damage_creditnote"
								id="pending_damage_creditnote" value="yes"
								<%if ("yes".equals(dto.getPending_damage_creditnote())) {
				out.print("Checked='checked'");
			}%> />


						</div>


						<div class="col-md-2">
							<label> Complete Damage Claim</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_damage_claim"
								id="complete_damage_claim" value="yes"
								<%if ("yes".equals(dto.getComplete_damage_claim())) {
				out.print("Checked='checked'");
			}%> />


						</div>

						<div class="col-md-2">
							<label>Complete Damage Credit Note</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_damage_creditnote"
								id="complete_damage_creditnote" value="yes"
								<%if ("yes".equals(dto.getComplete_damage_creditnote())) {
				out.print("Checked='checked'");
			}%> />

						</div>


						<div class="col-md-2">
							<label>Pending Claim Exchange Bonus</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_claim_exchange_bonus"
								id="pending_claim_exchange_bonus" value="yes"
								<%if ("yes".equals(dto.getPending_claim_exchange_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>


						<div class="col-md-2">
							<label> Complete Claim Exchange Bonus </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_claim_exchange_bonus"
								id="complete_claim_exchange_bonus" value="yes"
								<%if ("yes".equals(dto.getComplete_claim_exchange_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>


						<div class="col-md-2">
							<label> Pending Credit Exchange Bonus </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_credit_exchange_bonus"
								id="pending_credit_exchange_bonus" value="yes"
								<%if ("yes".equals(dto.getPending_credit_exchange_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>


						<div class="col-md-2">
							<label> Complete Credit Exchange Bonus</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_credit_exchange_bonus"
								id="complete_credit_exchange_bonus" value="yes"
								<%if ("yes".equals(dto.getComplete_credit_exchange_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>

						<div class="col-md-2">
							<label> Pending Claim Loyalty Bonus</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_claim_loyalty_bonus"
								id="pending_claim_loyalty_bonus" value="yes"
								<%if ("yes".equals(dto.getPending_claim_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>

						<div class="col-md-2">
							<label> Complete Claim Loyalty Bonus </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_claim_loyalty_bonus"
								id="complete_claim_loyalty_bonus" value="yes"
								<%if ("yes".equals(dto.getComplete_claim_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>




						<div class="col-md-2">
							<label> Pending Credit Loyalty Bonus </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_credit_loyalty_bonus"
								id="pending_credit_loyalty_bonus" value="yes"
								<%if ("yes".equals(dto.getPending_credit_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>
						<div class="col-md-2">
							<label> Complete Credit Loyalty Bonus</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_credit_loyalty_bonus"
								id="complete_credit_loyalty_bonus" value="yes"
								<%if ("yes".equals(dto.getComplete_credit_loyalty_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>
						<div class="col-md-2">
							<label> Pending Claim Corporate Bonus </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_claim_corporate_bonus"
								id="pending_claim_corporate_bonus" value="yes"
								<%if ("yes".equals(dto.getPending_claim_corporate_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>
						<div class="col-md-2">
							<label> Complete Claim Corporate Bonus </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_claim_corporate_bonus"
								id="complete_claim_corporate_bonus" value="yes"
								<%if ("yes".equals(dto.getComplete_credit_corporate_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>




						<div class="col-md-2">
							<label> Pending Credit Corporate Bonus </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_credit_corporate_bonus"
								id="pending_credit_corporate_bonus" value="yes"
								<%if ("yes".equals(dto.getPending_credit_corporate_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>
						<div class="col-md-2">
							<label> Complete Credit Corporate Bonus</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_credit_corporate_bonus"
								id="complete_credit_corporate_bonus" value="yes"
								<%if ("yes".equals(dto.getComplete_credit_corporate_bonus())) {
				out.print("Checked='checked'");
			}%> />

						</div>
						<div class="col-md-2">
							<label>Pending RSA Amount </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_rsa_amount"
								id="pending_rsa_amount" value="yes"
								<%if ("yes".equals(dto.getPending_rsa_amount())) {
				out.print("Checked='checked'");
			}%> />

						</div>
						<div class="col-md-2">
							<label> Complete RSA Amount </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_rsa_amount"
								id="complete_rsa_amount" value="yes"
								<%if ("yes".equals(dto.getComplete_rsa_amount())) {
				out.print("Checked='checked'");
			}%> />

						</div>



						<div class="col-md-2">
							<label> Pending Extended Warranty </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_extended_warranty"
								id="pending_extended_warranty" value="yes"
								<%if ("yes".equals(dto.getPending_extended_warranty())) {
				out.print("Checked='checked'");
			}%> />

						</div>
						<div class="col-md-2">
							<label> Complete Extended Warranty</label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_extended_warranty"
								id="complete_extended_warranty" value="yes"
								<%if ("yes".equals(dto.getComplete_extended_warranty())) {
				out.print("Checked='checked'");
			}%> />

						</div>
						<div class="col-md-2">
							<label>Pending Other Charges </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="pending_other_charges"
								id="pending_other_charges" value="yes"
								<%if ("yes".equals(dto.getPending_other_charges())) {
				out.print("Checked='checked'");
			}%> />

						</div>
						<div class="col-md-2">
							<label> Complete Other Charges </label>
						</div>
						<div class="col-md-1">
							<input type="checkbox" name="complete_other_charges"
								id="complete_other_charges" value="yes"
								<%if ("yes".equals(dto.getComplete_other_charges())) {
				out.print("Checked='checked'");
			}%> />

						</div>






						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2"></div>


							<div class="col-md-6" align="center">
								<label>Sales </label>
							</div>

						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>



							<div class="col-md-2">
								<label> Add Quotation</label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="add_quotation"
									value="yes"
									<%if ("yes".equals(dto.getAdd_quotation())) {
				out.print("Checked='checked'");
			}%>></input>


							</div>



							<div class="col-md-2">
								<label> Quotation Report</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="quotation_report"
									id="quotation_report" value="yes"
									<%if ("yes".equals(dto.getQuotation_report())) {
				out.print("Checked='checked'");
			}%> />


							</div>


							<div class="col-md-2">
								<label>Vehicle Sales Request</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="vehicle_sales_request"
									id="vehicle_sales_request" value="yes"
									<%if ("yes".equals(dto.getVehicle_sales_request())) {
				out.print("Checked='checked'");
			}%> />


							</div>

							<div class="col-md-2">
								<label>Approval Sales Request</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="approval_sales_request"
									id="approval_sales_request" value="yes"
									<%if ("yes".equals(dto.getApproval_sales_request())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Approval/Complete Vehicle Report</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="approval_sales_request_complete"
									id="approval_sales_request_complete" value="yes"
									<%if ("yes".equals(dto.getApproval_sales_request_complete())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Sales Bill </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="sales_bill" id="sales_bill"
									value="yes"
									<%if ("yes".equals(dto.getSales_bill())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Sold Vehicle Report</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="sold_vehicle_report"
									id="sold_vehicle_report" value="yes"
									<%if ("yes".equals(dto.getSold_vehicle_report())) {
				out.print("Checked='checked'");
			}%> />

							</div>



							<div class="col-md-2">
								<label> Pending For Insurance</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="pending_for_insurance"
									id="pending_for_insurance" value="yes"
									<%if ("yes".equals(dto.getPending_for_insurance())) {
				out.print("Checked='checked'");
			}%> />

							</div>

							<div class="col-md-2">
								<label> Pending For Policy Number</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="pending_for_policy_number"
									id="pending_for_policy_number" value="yes"
									<%if ("yes".equals(dto.getPending_for_policy_number())) {
				out.print("Checked='checked'");
			}%> />

							</div>

							<div class="col-md-2">
								<label> Insurance Register</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="insurance_register"
									id="insurance_register" value="yes"
									<%if ("yes".equals(dto.getInsurance_register())) {
				out.print("Checked='checked'");
			}%> />

							</div>
							<div class="col-md-2">
								<label> Renewal Ins. Request</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="renewal_insurance_request"
									id="renewal_insurance_request" value="yes"
									<%if ("yes".equals(dto.getRenewal_insurance_request())) {
				out.print("Checked='checked'");
			}%> />

							</div>
							<div class="col-md-2">
								<label> approval renewal request</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="approval_renewal_request"
									id="approval_renewal_request" value="yes"
									<%if ("yes".equals(dto.getApproval_renewal_request())) {
				out.print("Checked='checked'");
			}%> />

							</div>
							<div class="col-md-2">
								<label> Complete Insurance Register For Renewal</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox"
									name="complete_renewal_insurance_register"
									id="complete_renewal_insurance_register" value="yes"
									<%if ("yes".equals(dto.getComplete_renewal_insurance_register())) {
				out.print("Checked='checked'");
			}%> />

							</div>
							<div class="col-md-2">
								<label> Pending List For RTO Tax</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="pending_list_rto_tax"
									id="pending_list_rto_tax" value="yes"
									<%if ("yes".equals(dto.getPending_list_rto_tax())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Tax Pay</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="tax_pay" id="tax_pay" value="yes"
									<%if ("yes".equals(dto.getTax_pay())) {
				out.print("Checked='checked'");
			}%> />

							</div>




						</div>



						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2"></div>


							<div class="col-md-6" align="center">
								<label>Work Shop </label>
							</div>

						</div>

						<div class="col-md-12" style="padding: 0px;">
							</br>



							<div class="col-md-2">
								<label>Credit bill request WS</label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="work_shop_request" value="yes"
									<%if ("yes".equals(dto.getWork_shop_request())) {
				out.print("Checked='checked'");
			}%>></input>


							</div>



							<div class="col-md-2">
								<label> Approval WS Credit Bill</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="approval_work_shop_request"
									id="approval_work_shop_request" value="yes"
									<%if ("yes".equals(dto.getApproval_work_shop_request())) {
				out.print("Checked='checked'");
			}%> />


							</div>


							<div class="col-md-2">
								<label>Workshop Report</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="workshop_report"
									id="workshop_report" value="yes"
									<%if ("yes".equals(dto.getWorkshop_report())) {
				out.print("Checked='checked'");
			}%> />


							</div>

							<div class="col-md-2">
								<label>Pending for Bill No</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="workshop_pending_for_billno"
									id="workshop_pending_for_billno" value="yes"
									<%if ("yes".equals(dto.getWorkshop_pending_for_billno())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Pending Insurance WS Claim</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="pending_insurance_wprkshop_claim"
									id="pending_insurance_wprkshop_claim" value="yes"
									<%if ("yes".equals(dto.getPending_insurance_wprkshop_claim())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Pending Customer WS list </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="pending_customer_workshop_list"
									id="pending_customer_workshop_list" value="yes"
									<%if ("yes".equals(dto.getPending_customer_workshop_list())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Issue Bill No For Accessories </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="issue_billno_for_accessories"
									id="issue_billno_for_accessories" value="yes"
									<%if ("yes".equals(dto.getIssue_billno_for_accessories())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Reciept Against Accessories Amount</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="accessories_report"
									id="accessories_report" value="yes"
									<%if ("yes".equals(dto.getAccessories_report())) {
				out.print("Checked='checked'");
			}%> />

							</div>

							<div class="col-md-2">
								<label> More Than Bill Amount Accessories Report </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="accessories_report_grater_amout"
									id="accessories_report_grater_amout" value="yes"
									<%if ("yes".equals(dto.getAccessories_report_grater_amout())) {
				out.print("Checked='checked'");
			}%> />

							</div>

						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2"></div>


							<div class="col-md-6" align="center">
								<label>Finance </label>
							</div>

						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>



							<div class="col-md-2">
								<label> Pending List Of Finance Recovery </label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="pending_finance_recovery"
									value="yes"
									<%if ("yes".equals(dto.getPending_finance_recovery())) {
				out.print("Checked='checked'");
			}%>></input>


							</div>



							<div class="col-md-2">
								<label> List Of Finance</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="list_of_finance"
									id="list_of_finance" value="yes"
									<%if ("yes".equals(dto.getList_of_finance())) {
				out.print("Checked='checked'");
			}%> />


							</div>


							<div class="col-md-2">
								<label>Pending List Of Customer Recovery</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="pending_list_of_customer_recovery"
									id="pending_list_of_customer_recovery" value="yes"
									<%if ("yes".equals(dto.getPending_list_of_customer_recovery())) {
				out.print("Checked='checked'");
			}%> />


							</div>

						</div>



						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2"></div>


							<div class="col-md-6" align="center">
								<label>Master </label>
							</div>

						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>



							<div class="col-md-2">
								<label>Distributor</label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="distributor" value="yes"
									<%if ("yes".equals(dto.getDistributor())) {
				out.print("Checked='checked'");
			}%>></input>


							</div>



							<div class="col-md-2">
								<label> Model</label>
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

							<div class="col-md-2">
								<label>Varient Update Info</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="varient_update_info"
									id="varient_update_info" value="yes"
									<%if ("yes".equals(dto.getVarient_update_info())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Varient Variation</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="varient_variation"
									id="varient_variation" value="yes"
									<%if ("yes".equals(dto.getVarient_variation())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Insurance Com.</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="insurance_company"
									id="insurance_company" value="yes"
									<%if ("yes".equals(dto.getInsurance_company())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Finance Bank </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="finance_bank" id="finance_bank"
									value="yes"
									<%if ("yes".equals(dto.getFinance_bank())) {
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
								<label>Add Account</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="add_bank_account"
									id="add_bank_account" value="yes"
									<%if ("yes".equals(dto.getAdd_bank_account())) {
				out.print("Checked='checked'");
			}%> />

							</div>

							<div class="col-md-2">
								<label> Add Spent Head </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="add_spent_head" id="add_spent_head"
									value="yes"
									<%if ("yes".equals(dto.getAdd_spent_head())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label>Add SubHead </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="add_subhead" id="add_subhead"
									value="yes"
									<%if ("yes".equals(dto.getAdd_subhead())) {
				out.print("Checked='checked'");
			}%> />

							</div>

							<div class="col-md-2">
								<label> User </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="USER" id="USER" value="yes"
									<%if ("yes".equals(dto.getUSER())) {
				out.print("Checked='checked'");
			}%> />

							</div>

							<div class="col-md-2">
								<label>Manage User </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="manage_user" id="manage_user"
									value="yes"
									<%if ("yes".equals(dto.getManage_user())) {
				out.print("Checked='checked'");
			}%> />

							</div>





						</div>



						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2"></div>


							<div class="col-md-6" align="center">
								<label>Expenses </label>
							</div>

						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>



							<div class="col-md-2">
								<label> Spend Request</label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="spend_request" value="yes"
									<%if ("yes".equals(dto.getSpend_request())) {
				out.print("Checked='checked'");
			}%>></input>


							</div>



							<div class="col-md-2">
								<label> Spent Aprovel</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="spent_aprovel" id="spent_aprovel"
									value="yes"
									<%if ("yes".equals(dto.getSpent_aprovel())) {
				out.print("Checked='checked'");
			}%> />


							</div>


							<div class="col-md-2">
								<label>Cash Approved Spend Pay Amt</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="cash_approved_spend_pay_amount"
									id="cash_approved_spend_pay_amount" value="yes"
									<%if ("yes".equals(dto.getCash_approved_spend_pay_amount())) {
				out.print("Checked='checked'");
			}%> />


							</div>

							<div class="col-md-2">
								<label>Print Cash Spend Voucher</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="print_cash_spend_voucher"
									id="print_cash_spend_voucher" value="yes"
									<%if ("yes".equals(dto.getPrint_cash_spend_voucher())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label> Cheque Approved Spend Pay Amount</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="cheque_approved_spend_pay_amount"
									id="cheque_approved_spend_pay_amount" value="yes"
									<%if ("yes".equals(dto.getCheque_approved_spend_pay_amount())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label>Print Cheque Spend </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="print_cheque_spend"
									id="print_cheque_spend" value="yes"
									<%if ("yes".equals(dto.getPrint_cheque_spend())) {
				out.print("Checked='checked'");
			}%> />

							</div>



						</div>



						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2"></div>


							<div class="col-md-6" align="center">
								<label>Receipt </label>
							</div>

						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>



							<div class="col-md-2">
								<label> Make Reciept cheque</label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="make_reciept_cheque" value="yes"
									<%if ("yes".equals(dto.getMake_reciept_cheque())) {
				out.print("Checked='checked'");
			}%>></input>


							</div>



							<div class="col-md-2">
								<label> Make Reciept Cash</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="make_reciept_cash"
									id="make_reciept_cash" value="yes"
									<%if ("yes".equals(dto.getMake_reciept_cash())) {
				out.print("Checked='checked'");
			}%> />


							</div>


							<div class="col-md-2">
								<label>Approval Reciept</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="approval_reciept"
									id="approval_reciept" value="yes"
									<%if ("yes".equals(dto.getApproval_reciept())) {
				out.print("Checked='checked'");
			}%> />


							</div>

							<div class="col-md-2">
								<label>Print Reciept</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="print_reciept" id="print_reciept"
									value="yes"
									<%if ("yes".equals(dto.getPrint_reciept())) {
				out.print("Checked='checked'");
			}%> />

							</div>




						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2"></div>


							<div class="col-md-6" align="center">
								<label>Bank </label>
							</div>

						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>



							<div class="col-md-2">
								<label>Day Book </label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="day_book" value="yes"
									<%if ("yes".equals(dto.getDay_book())) {
				out.print("Checked='checked'");
			}%>></input>


							</div>



							<div class="col-md-2">
								<label> Cash Book </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="cash_book" id="cash_book"
									value="yes"
									<%if ("yes".equals(dto.getCash_book())) {
				out.print("Checked='checked'");
			}%> />


							</div>


							<div class="col-md-2">
								<label>Banking</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="banking"
									id="banking" value="yes"
									<%if ("yes".equals(dto.getBanking())) {
				out.print("Checked='checked'");
			}%> />


							</div>

							<div class="col-md-2">
								<label>Cash Deposit to Bank</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="cash_deposit_to_bank"
									id="cash_deposit_to_bank" value="yes"
									<%if ("yes".equals(dto.getCash_deposit_to_bank())) {
				out.print("Checked='checked'");
			}%> />

							</div>



							<div class="col-md-2">
								<label>Today Cheque</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="today_cheque" id="today_cheque"
									value="yes"
									<%if ("yes".equals(dto.getToday_cheque())) {
				out.print("Checked='checked'");
			}%> />

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
								<label>Bounced Cheque</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="bounced_cheque" id="bounced_cheque"
									value="yes"
									<%if ("yes".equals(dto.getBounced_cheque())) {
				out.print("Checked='checked'");
			}%> />

							</div>





						</div>



						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2"></div>


							<div class="col-md-6" align="center">
								<label>Old Vehicle </label>
							</div>

						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>



							<div class="col-md-2">
								<label>Old Vehicle Stock Report </label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="old_vehicle_stock_report"
									value="yes"
									<%if ("yes".equals(dto.getOld_vehicle_stock_report())) {
				out.print("Checked='checked'");
			}%>></input>


							</div>



							<div class="col-md-2">
								<label> Sales Requst For Old Vehcle </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="sales_requst_for_old_vehicle"
									id="sales_requst_for_old_vehicle" value="yes"
									<%if ("yes".equals(dto.getSales_requst_for_old_vehicle())) {
				out.print("Checked='checked'");
			}%> />


							</div>


							<div class="col-md-2">
								<label>Approval For Old Vehicle</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="approval_for_old_vehicle"
									id="approval_for_old_vehicle" value="yes"
									<%if ("yes".equals(dto.getApproval_for_old_vehicle())) {
				out.print("Checked='checked'");
			}%> />


							</div>

							<div class="col-md-2">
								<label>Sale Old Vehicle Report</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="sale_old_vehicle"
									id="sale_old_vehicle" value="yes"
									<%if ("yes".equals(dto.getSale_old_vehicle())) {
				out.print("Checked='checked'");
			}%> />

							</div>



							<div class="col-md-2">
								<label>Sold Old Vehicle</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="sold_old_vehicle"
									id="sold_old_vehicle" value="yes"
									<%if ("yes".equals(dto.getSold_old_vehicle())) {
				out.print("Checked='checked'");
			}%> />

							</div>



							<div class="col-md-2">
								<label>Finance Pending Old Vehicle</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="finance_pending_old_vehicle"
									id="finance_pending_old_vehicle" value="yes"
									<%if ("yes".equals(dto.getFinance_pending_old_vehicle())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label>Pend. Cust.Old Veh.Recovery </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="pending_customer_old_veh_recovery"
									id="pending_customer_old_veh_recovery" value="yes"
									<%if ("yes".equals(dto.getPending_customer_old_veh_recovery())) {
				out.print("Checked='checked'");
			}%> />

							</div>





						</div>



						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2"></div>


							<div class="col-md-6" align="center">
								<label>Posts </label>
							</div>

						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>



							<div class="col-md-2">
								<label>Reciept Of post </label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="reciept_of_post_menu" value="yes"
									<%if ("yes".equals(dto.getReciept_of_post())) {
				out.print("Checked='checked'");
			}%>></input>


							</div>



							<div class="col-md-2">
								<label> Post Transfer </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="post_transfer_to_branch"
									id="post_transfer_to_branch" value="yes"
									<%if ("yes".equals(dto.getPost_transfer_to_branch())) {
				out.print("Checked='checked'");
			}%> />


							</div>


							<div class="col-md-2">
								<label>Reciept Of Post </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="reciept_of_post"
									id="reciept_of_post" value="yes"
									<%if ("yes".equals(dto.getReciept_of_post())) {
				out.print("Checked='checked'");
			}%> />


							</div>

							<div class="col-md-2">
								<label>Transfer Post</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="transfer_post" id="transfer_post"
									value="yes"
									<%if ("yes".equals(dto.getTransfer_post())) {
				out.print("Checked='checked'");
			}%> />

							</div>



							<div class="col-md-2">
								<label>Receiver</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="receiver" id="receiver" value="yes"
									<%if ("yes".equals(dto.getReceiver())) {
				out.print("Checked='checked'");
			}%> />

							</div>



							<div class="col-md-2">
								<label>First Coll. RtoPaper cust.</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox"
									name="collect_rto_paper_from_customer_first"
									id="collect_rto_paper_from_customer_first" value="yes"
									<%if ("yes".equals(dto.getCollect_rto_paper_from_customer_first())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label>Coll. RtoPaper From cust.</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="collect_rto_paper_from_customer"
									id="collect_rto_paper_from_customer" value="yes"
									<%if ("yes".equals(dto.getCollect_rto_paper_from_customer())) {
				out.print("Checked='checked'");
			}%> />

							</div>


							<div class="col-md-2">
								<label>RTO Paper Deliver to Agent </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="rto_paper_deliver_to_agent"
									id="rto_paper_deliver_to_agent" value="yes"
									<%if ("yes".equals(dto.getRto_paper_deliver_to_agent())) {
				out.print("Checked='checked'");
			}%> />

							</div>

							<div class="col-md-2">
								<label>RTO Paper</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="rto_paper" id="rto_paper"
									value="yes"
									<%if ("yes".equals(dto.getRto_paper())) {
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


							<div class="col-md-2">
								<label>Discount Report</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="discount_report"
									id="discount_report" value="yes"
									<%if ("yes".equals(dto.getDiscount_report())) {
				out.print("Checked='checked'");
			}%> />

							</div>





						</div>





						<div class="col-md-12" style="padding: 0px;">
							</br>

							<div class="col-md-2"></div>


							<div class="col-md-6" align="center">
								<label>Head Office </label>
							</div>

						</div>




						<div class="col-md-12" style="padding: 0px;">
							</br>



							<div class="col-md-2">
								<label>New Veh. Stock Branch Wise </label>
							</div>
							<div class="col-md-1">
								<!-- <input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" value="yes" onclick="findTotal();" /> -->


								<input type="checkbox" name="new_vehicle_stock_branch_wise"
									value="yes"
									<%if ("yes".equals(dto.getNew_vehicle_stock_branch_wise())) {
				out.print("Checked='checked'");
			}%>></input>


							</div>



							<div class="col-md-2">
								<label> Quotation Report branch wise </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="quotation_report_branch_wise"
									id="purchase_module" value="yes"
									<%if ("yes".equals(dto.getQuotation_report_branch_wise())) {
				out.print("Checked='checked'");
			}%> />


							</div>


							<div class="col-md-2">
								<label>Sold Veh. Report Branch Wise </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="sold_vehicle_report_branch_wise"
									id="sold_vehicle_report_branch_wise" value="yes"
									<%if ("yes".equals(dto.getSold_vehicle_report_branch_wise())) {
				out.print("Checked='checked'");
			}%> />


							</div>

							<div class="col-md-2">
								<label>Cust. Credit Report </label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="credit_report" id="credit_report"
									value="yes"
									<%if ("yes".equals(dto.getCredit_report())) {
				out.print("Checked='checked'");
			}%> />

							</div>



							<div class="col-md-2">
								<label>Complete Vehicle Request</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox"
									name="complete_vehicle_request_branch_wise"
									id="complete_vehicle_request_branch_wise" value="yes"
									<%if ("yes".equals(dto.getComplete_vehicle_request_branch_wise())) {
				out.print("Checked='checked'");
			}%> />

							</div>



							<div class="col-md-2">
								<label>RTO Paper History</label>
							</div>
							<div class="col-md-1">
								<input type="checkbox" name="rto_paper_history"
									id="rto_paper_history" value="yes"
									<%if ("yes".equals(dto.getRto_paper_history())) {
				out.print("Checked='checked'");
			}%> />

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