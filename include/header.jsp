<%@page import="com.service.AdminRagistrationService"%>
<%@page import="com.dto.AdminRagistrationDto"%>
<%@include file="project_info_file_header.jsp"%>
<%@include file="UserTrack.jsp"%>

<div id="navbar">
	<nav class="navbar navbar-default navbar-static-top" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="Home.jsp">Home</a>
		</div>


		<%
			AdminRagistrationDto track_dto = new AdminRagistrationDto();

			AdminRagistrationService admin_service = new AdminRagistrationService();

			track_dto = admin_service.getAlotFeatureUserInfoByID(creator_id,
					request, config);
		%>


		<div class="collapse navbar-collapse" id="navbar-collapse-1">
			<ul class="nav navbar-nav">


				<!-- <li class="active"><a href="Home.jsp">Home</a></li> -->


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Head Office <b class="caret"></b></a>
					<ul class="dropdown-menu">


						<%
							if ((track_dto.getNew_vehicle_stock_branch_wise() == null ? ""
									: track_dto.getNew_vehicle_stock_branch_wise())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="available_new_stock_report_branch_wise.jsp">New
								Vehicle Stock Branch Wise </a></li>

						<%
							}
						%>



						<%
							if ((track_dto.getQuotation_report_branch_wise() == null ? ""
									: track_dto.getQuotation_report_branch_wise())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="manage_quotation_branch_wise.jsp">Quotation
								Report branch wise </a></li>

						<%
							}
						%>



						<%
							if ((track_dto.getSold_vehicle_report_branch_wise() == null ? ""
									: track_dto.getSold_vehicle_report_branch_wise())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="sold_vehicle_report_branch_wise.jsp">Sold
								Vehicle Report Branch Wise </a></li>


						<%
							}
						%>



						<%
							if ((track_dto.getCredit_report() == null ? "" : track_dto
									.getCredit_report()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="customer_credit_report.jsp">Credit Report </a></li>


						<%
							}
						%>



						<%
							if ((track_dto.getComplete_vehicle_request() == null ? ""
									: track_dto.getComplete_vehicle_request())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="manage_vehicle_request_complete_branch_wise.jsp">Complete
								Vehicle Request </a></li>




						<%
							}
						%>



						<%
							if ((track_dto.getRto_paper_history() == null ? "" : track_dto
									.getRto_paper_history()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="rto_paper_report.jsp"> RTO Paper History </a></li>

						<%
							}
						%>






					</ul></li>




				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Purchase <b class="caret"></b></a>
					<ul class="dropdown-menu">

						<%
							if ((track_dto.getVehicle_inward() == null ? "" : track_dto
									.getVehicle_inward()).equalsIgnoreCase("yes")) {
						%>




						<li><a href="add_purchase_vehicle.jsp">Vehicle Inward</a></li>


						<%
							}
						%>



						<%
							if ((track_dto.getTransfer_without_request() == null ? ""
									: track_dto.getTransfer_without_request())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="report_purchase_vehicle.jsp">Vehicle
								Transfer By Without Request</a></li>

						<%
							}
						%>



						<%
							if ((track_dto.getVehicle_receiving() == null ? "" : track_dto
									.getVehicle_receiving()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="available_stock_report.jsp">Vehicle
								Receiving </a></li>

						<%
							}
						%>



						<%
							if ((track_dto.getNew_vehicle_stock() == null ? "" : track_dto
									.getNew_vehicle_stock()).equalsIgnoreCase("yes")) {
						%>




						<li><a href="available_new_stock_report.jsp">New Vehicle
								Stock </a></li>


						<%
							}
						%>



						<%
							if ((track_dto.getVehicle_request() == null ? "" : track_dto
									.getVehicle_request()).equalsIgnoreCase("yes")) {
						%>




						<li><a href="add_vehicle_request.jsp"> Vehicle Request To
								Branch</a></li>



						<%
							}
						%>



						<%
							if ((track_dto.getPending_vehicle_request() == null ? ""
									: track_dto.getPending_vehicle_request())
									.equalsIgnoreCase("yes")) {
						%>




						<li><a href="manage_vehicle_request.jsp"> Pending Vehicle
								Request </a></li>




						<%
							}
						%>



						<%
							if ((track_dto.getComplete_vehicle_request() == null ? ""
									: track_dto.getComplete_vehicle_request())
									.equalsIgnoreCase("yes")) {
						%>




						<li><a href="manage_vehicle_request_complete.jsp">
								Complete Vehicle Request </a></li>



						<%
							}
						%>






					</ul></li>


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Claims <b class="caret"></b></a>
					<ul class="dropdown-menu">








						<%
							if ((track_dto.getPending_damage_claim() == null ? "" : track_dto
									.getPending_damage_claim()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="pending_claim_damage_Report.jsp"> Pending
								Damage Claim </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getPending_damage_creditnote() == null ? ""
									: track_dto.getPending_damage_creditnote())
									.equalsIgnoreCase("yes")) {
						%>





						<li><a href="pending_credit_note_damage_Report.jsp">
								Pending Damage Credit Note </a></li>



						<%
							}
						%>


						<%
							if ((track_dto.getComplete_damage_claim() == null ? "" : track_dto
									.getComplete_damage_claim()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="complete_claim_damage_Report.jsp"> Complete
								Damage Claim </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getComplete_damage_creditnote() == null ? ""
									: track_dto.getComplete_damage_creditnote())
									.equalsIgnoreCase("yes")) {
						%>




						<li><a href="complete_credit_note_damage_Report.jsp">
								Complete Damage Credit Note </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_claim_exchange_bonus() == null ? ""
									: track_dto.getPending_claim_exchange_bonus())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="pending_claim_exchange_bonus_Report.jsp">Pending
								Claim Exchange Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_claim_exchange_bonus() == null ? ""
									: track_dto.getComplete_claim_exchange_bonus())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="complete_claim_exchange_bonus_Report.jsp">Complete
								Claim Exchange Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_credit_exchange_bonus() == null ? ""
									: track_dto.getPending_credit_exchange_bonus())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="pending_credit_note_exchange_bonus_Report.jsp">Pending
								Credit Exchange Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_credit_exchange_bonus() == null ? ""
									: track_dto.getComplete_damage_creditnote())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="complete_credit_note_exchange_bonus_Report.jsp">Complete
								Credit Exchange Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_claim_loyalty_bonus() == null ? ""
									: track_dto.getPending_claim_loyalty_bonus())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="pending_claim_loyalty_bonus_Report.jsp">Pending
								Claim Loyalty Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_claim_loyalty_bonus() == null ? ""
									: track_dto.getComplete_claim_loyalty_bonus())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="complete_claim_loyalty_bonus_Report.jsp">
								Complete Claim Loyalty Bonus</a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_credit_loyalty_bonus() == null ? ""
									: track_dto.getPending_credit_loyalty_bonus())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="pending_credit_note_loyalty_bonus_Report.jsp">Pending
								Credit Loyalty Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_credit_loyalty_bonus() == null ? ""
									: track_dto.getComplete_credit_loyalty_bonus())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="complete_credit_note_loyalty_bonus_Report.jsp">Complete
								Credit Loyalty Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_claim_corporate_bonus() == null ? ""
									: track_dto.getPending_claim_corporate_bonus())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="pending_claim_corporate_bonus_Report.jsp">Pending
								Claim Corporate Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_claim_corporate_bonus() == null ? ""
									: track_dto.getComplete_claim_corporate_bonus())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="complete_claim_corporate_bonus_Report.jsp">
								Complete Claim Corporate Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_credit_corporate_bonus() == null ? ""
									: track_dto.getPending_credit_corporate_bonus())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="pending_credit_note_corporate_bonus_Report.jsp">Pending
								Credit Corporate Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_credit_corporate_bonus() == null ? ""
									: track_dto.getComplete_credit_corporate_bonus())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="complete_credit_note_corporate_bonus_Report.jsp">Complete
								Credit Corporate Bonus </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_rsa_amount() == null ? "" : track_dto
									.getPending_rsa_amount()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="pending_rsa_amount.jsp">Pending RSA Amount </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_rsa_amount() == null ? "" : track_dto
									.getComplete_rsa_amount()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="complete_rsa_amount.jsp">Complete RSA Amount
						</a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_extended_warranty() == null ? ""
									: track_dto.getPending_extended_warranty())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="pending_extended_warranty.jsp">Pending
								Extended Warranty </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_extended_warranty() == null ? ""
									: track_dto.getComplete_extended_warranty())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="complete_extended_warranty.jsp">Complete
								Extended Warranty </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_other_charges() == null ? "" : track_dto
									.getPending_other_charges()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="pending_other_charges.jsp">Pending Other
								Charges </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_other_charges() == null ? "" : track_dto
									.getComplete_other_charges()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="complete_other_charges.jsp">Complete Other
								Charges </a></li>
						<%
							}
						%>



					</ul></li>


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Sales <b class="caret"></b></a>
					<ul class="dropdown-menu">



						<%
							if ((track_dto.getAdd_quotation() == null ? "" : track_dto
									.getAdd_quotation()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="Add_Quotation.jsp">Add Quotation </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getQuotation_report() == null ? "" : track_dto
									.getQuotation_report()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="manage_quotation.jsp">Quotation Report </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getVehicle_sales_request() == null ? "" : track_dto
									.getVehicle_sales_request()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="sale_request.jsp">Vehicle Sales Request </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getApproval_sales_request() == null ? "" : track_dto
									.getApproval_sales_request()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="sale_request_report.jsp">Approval Sales
								Request </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getApproval_sales_request_complete() == null ? ""
									: track_dto.getApproval_sales_request_complete())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="complete_sale_request.jsp">Approval/Complete
								Vehicle Report </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getSales_bill() == null ? "" : track_dto
									.getSales_bill()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="verify_sale_request_report.jsp">Sales Bill </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getSold_vehicle_report() == null ? "" : track_dto
									.getComplete_damage_creditnote()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="sold_vehicle_report.jsp">Sold Vehicle Report
						</a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_for_insurance() == null ? "" : track_dto
									.getPending_for_insurance()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="add_insurance_Report.jsp"> Pending For
								Insurance </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_for_policy_number() == null ? ""
									: track_dto.getPending_for_policy_number())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="pending_pn_insurance_report.jsp"> Pending
								For Policy Number </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getInsurance_register() == null ? "" : track_dto
									.getInsurance_register()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="insurance_Report.jsp"> Insurance Register </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getRenewal_insurance_request() == null ? ""
									: track_dto.getRenewal_insurance_request())
									.equalsIgnoreCase("yes")) {
						%>
						<li><a href="add_insurance_renival.jsp"> Renewal
								Insurance Request </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getApproval_renewal_request() == null ? ""
									: track_dto.getApproval_renewal_request())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="insuracerenewal.jsp"> approval renewal
								request</a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_renewal_insurance_register() == null ? ""
									: track_dto.getComplete_renewal_insurance_register())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="manage_insurence_renewal.jsp"> Complete
								Insurance Register For Renewal</a></li>
						<%
							}
						%>


						<%
							if ((track_dto.getPending_list_rto_tax() == null ? "" : track_dto
									.getPending_list_rto_tax()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="add_rto_tax_report.jsp"> Pending List For
								RTO Tax </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getTax_pay() == null ? "" : track_dto.getTax_pay())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="rto_tax_report.jsp">Tax Pay</a></li>

						<%
							}
						%>






					</ul></li>


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Work Shop <b class="caret"></b></a>
					<ul class="dropdown-menu">



						<%
							if ((track_dto.getWork_shop_request() == null ? "" : track_dto
									.getWork_shop_request()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="add_workshop.jsp">Credit bill request WS</a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getApproval_work_shop_request() == null ? ""
									: track_dto.getApproval_work_shop_request())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="workshop_aprovel_report.jsp">Approval WS
								Credit Bill </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getWorkshop_report() == null ? "" : track_dto
									.getWorkshop_report()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="workshop_report.jsp">Workshop Report </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getWorkshop_pending_for_billno() == null ? ""
									: track_dto.getWorkshop_pending_for_billno())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="workshop_billing_report.jsp">Pending for
								Bill No </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_insurance_wprkshop_claim() == null ? ""
									: track_dto.getPending_insurance_wprkshop_claim())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="workshop_pay_insurance_credit_report.jsp">
								Pending Insurance WS Claim </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_customer_workshop_list() == null ? ""
									: track_dto.getPending_customer_workshop_list())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="workshop_balance_collect_report.jsp">Pending
								Customer WS list </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getIssue_billno_for_accessories() == null ? ""
									: track_dto.getIssue_billno_for_accessories())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="accessories_pending_report.jsp">Issue Bill
								No For Accessories </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getAccessories_report() == null ? "" : track_dto
									.getAccessories_report()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="accessories_complete_report.jsp">Reciept
								Against Accessories Amount </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getAccessories_report_grater_amout() == null ? ""
									: track_dto.getAccessories_report_grater_amout())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="accessories_complete_report_more_amount.jsp">More
								Than Bill Amount Accessories Report </a></li>

						<%
							}
						%>






					</ul></li>




				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Finance <b class="caret"></b></a>
					<ul class="dropdown-menu">





						<%
							if ((track_dto.getPending_finance_recovery() == null ? ""
									: track_dto.getPending_finance_recovery())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="finance_recovery_report.jsp"> Pending List
								Of Finance Recovery </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getList_of_finance() == null ? "" : track_dto
									.getList_of_finance()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="finance_report.jsp"> List Of Finance </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getPending_list_of_customer_recovery() == null ? ""
									: track_dto.getPending_list_of_customer_recovery())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="customer_credit_report_by_salesconsultant.jsp">Pending
								List Of Customer Recovery </a></li>

						<%
							}
						%>





					</ul></li>



				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Master <b class="caret"></b></a>
					<ul class="dropdown-menu">






						<%
							if ((track_dto.getDistributor() == null ? "" : track_dto
									.getDistributor()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="ManageDistributer.jsp">Distributor </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getModel() == null ? "" : track_dto.getModel())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="manageModel.jsp">Model</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getVarient() == null ? "" : track_dto.getVarient())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="manageVarient.jsp">Varient </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getVarient_update_info() == null ? "" : track_dto
									.getVarient_update_info()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="Update_Varient_Info.jsp">Varient Update Info
						</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getVarient_variation() == null ? "" : track_dto
									.getVarient_variation()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="model_report_for_varient_price.jsp">Varient
								Variation </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getInsurance_company() == null ? "" : track_dto
									.getInsurance_company()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="manageInsurranceCompany.jsp">Insurance
								Company</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getFinance_bank() == null ? "" : track_dto
									.getFinance_bank()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manageFinanceBank.jsp">Finance Bank </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getRto_agent() == null ? "" : track_dto
									.getRto_agent()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manageRtoCompany.jsp">Rto Agent </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getAdd_bank_account() == null ? "" : track_dto
									.getAdd_bank_account()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="bank_details.jsp">Add Bank Account </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getAdd_spent_head() == null ? "" : track_dto
									.getAdd_spent_head()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="Add_Spent_Head.jsp">Add Spent Head </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getAdd_subhead() == null ? "" : track_dto
									.getAdd_subhead()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="manage_spent_subhead.jsp">Add SubHead </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getUSER() == null ? "" : track_dto.getUSER())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="add_user.jsp">User</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getManage_user() == null ? "" : track_dto
									.getManage_user()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manage_Registration.jsp">Manage User</a></li>


						<%
							}
						%>





					</ul></li>


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Expenses <b class="caret"></b></a>
					<ul class="dropdown-menu">






						<%
							if ((track_dto.getSpend_request() == null ? "" : track_dto
									.getSpend_request()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="add_spend_payment.jsp">Spend Request</a></li>

						<!-- <li><a href="manageSpent.jsp">Spent Aprovel </a></li> -->



						<%
							}
						%>


						<%
							if ((track_dto.getSpent_aprovel() == null ? "" : track_dto
									.getSpent_aprovel()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manageSpent.jsp">Spent Aprovel </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getCash_approved_spend_pay_amount() == null ? ""
									: track_dto.getCash_approved_spend_pay_amount())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="manageApproveSpentPayment.jsp">Cash Approved
								Spend / Pay Amount </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getPrint_cash_spend_voucher() == null ? ""
									: track_dto.getPrint_cash_spend_voucher())
									.equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpent.jsp">Print Cash Spend
								Voucher </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getCheque_approved_spend_pay_amount() == null ? ""
									: track_dto.getCheque_approved_spend_pay_amount())
									.equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpentPayment_khandwa.jsp">
								Cheque Approved Spend/Pay Amount</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getPrint_cheque_spend() == null ? "" : track_dto
									.getPrint_cheque_spend()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manageSpentChequePrint.jsp">Print Cheque
								Spend </a></li>


						<%
							}
						%>


						<%-- <%
							if ((track_dto.getSpent_cheque_rep() == null ? "" : track_dto
									.getSpent_cheque_rep()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpentPayment_khandwa.jsp">Spent
								Cheque Rep. </a></li>




						<%
							}
						%> --%>












						<%-- 	<%
							if ((track_dto.getKhandwa_spent_cheque() == null ? "" : track_dto
									.getKhandwa_spent_cheque()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpent_khandwa.jsp">Khandwa
								Spent Cheque</a></li>
						<%
							}
						%>



						<%
							if ((track_dto.getKhargone_spent_cheque() == null ? "" : track_dto
									.getKhargone_spent_cheque()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpent_khargone.jsp">Khargone
								Spent Cheque </a></li>

						<%
							}
						%>

						<%
							if ((track_dto.getBurhanpur_spent_cheque() == null ? "" : track_dto
									.getBurhanpur_spent_cheque()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpent_burhanpur.jsp">Burhanpur
								Spent Cheque </a></li>
						<%
							}
						%>

						<%
							if ((track_dto.getBarwani_spent_cheque() == null ? "" : track_dto
									.getBarwani_spent_cheque()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpent_barwani.jsp">Barwani
								Spent Cheque </a></li>
						<%
							}
						%>
						 --%>










						<%-- 
						<%
							if ((track_dto.getKhargone_spent_cheque() == null ? "" : track_dto
									.getKhargone_spent_cheque()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpentPayment_khargone.jsp">Khargone
								Spent Cheque Pay </a></li>
						<%
							}
						%>

						<%
							if ((track_dto.getBurhanpur_spent_cheque() == null ? "" : track_dto
									.getBurhanpur_spent_cheque()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manageApproveSpentPayment_burhanpur.jsp">Burhanpur
								Spent Cheque Pay</a></li>

						<%
							}
						%>

						<%
							if ((track_dto.getBarwani_spent_cheque() == null ? "" : track_dto
									.getBarwani_spent_cheque()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpentPayment_barwani.jsp">Barwani
								Spent Cheque Pay </a></li>
						<%
							}
						%>
 --%>



					</ul></li>


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Receipt <b class="caret"></b></a>
					<ul class="dropdown-menu">





						<%
							if ((track_dto.getMake_reciept_cheque() == null ? "" : track_dto
									.getMake_reciept_cheque()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="add_receiving_payment.jsp">Make Reciept
								cheque </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getMake_reciept_cash() == null ? "" : track_dto
									.getMake_reciept_cash()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="add_receiving_payment_cash.jsp"> Make
								Reciept Cash</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getApproval_reciept() == null ? "" : track_dto
									.getApproval_reciept()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="manageReceiveAmountReport.jsp">Approval
								Reciept </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getPrint_reciept() == null ? "" : track_dto
									.getPrint_reciept()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manageReciveChequeReport.jsp">Print Reciept
						</a></li>


						<%
							}
						%>




					</ul></li>


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Bank<b class="caret"></b></a>
					<ul class="dropdown-menu">



						<%
							if ((track_dto.getDay_book() == null ? "" : track_dto.getDay_book())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="Day_Book.jsp">Day Book </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getCash_book() == null ? "" : track_dto
									.getCash_book()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="Cash_Book.jsp">Cash Book </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getBanking() == null ? "" : track_dto.getBanking())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="BankDetail_Report.jsp">Banking</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getCash_deposit_to_bank() == null ? "" : track_dto
									.getCash_deposit_to_bank()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="Transaction_Entry.jsp">Cash Deposit to Bank
						</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getToday_cheque() == null ? "" : track_dto
									.getToday_cheque()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="RepresentTodayCheque.jsp">Today Cheque </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getCancle_cheque() == null ? "" : track_dto
									.getCancle_cheque()).equalsIgnoreCase("yes")) {
						%>

						<!-- 	<li><a href="manageReceiveAmountReport.jsp">Rec. Aprovel.</a></li> -->

						<li><a href="Cancle_Cheque.jsp">Cancle Cheque </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getBounced_cheque() == null ? "" : track_dto
									.getBounced_cheque()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="Bounced_Cheque.jsp">Bounced Cheque </a></li>


						<%
							}
						%>




					</ul></li>




				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Old Vehicle <b class="caret"></b></a>
					<ul class="dropdown-menu">




						<%
							if ((track_dto.getOld_vehicle_stock_report() == null ? "" : track_dto
									.getOld_vehicle_stock_report()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="available_old_stock_report.jsp">Old Vehicle
								Stock Report </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getSales_requst_for_old_vehicle() == null ? ""
									: track_dto.getSales_requst_for_old_vehicle())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="sale_old_vehicle.jsp">Sales Requst For Old
								Vehcle </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getApproval_for_old_vehicle() == null ? ""
									: track_dto.getApproval_for_old_vehicle())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="old_stock_complete_report.jsp">Approval For
								Old Vehicle </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getSale_old_vehicle() == null ? "" : track_dto
									.getSale_old_vehicle()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="sale_old_vehicle_report.jsp">Sale Old
								Vehicle </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getSold_old_vehicle() == null ? "" : track_dto
									.getSold_old_vehicle()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="sold_old_stock_report.jsp">Sold Old Vehicle
						</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getFinance_pending_old_vehicle() == null ? ""
									: track_dto.getFinance_pending_old_vehicle())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="finance_report_old_vehicle.jsp"> Finance
								Pending Old Vehicle </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getPending_customer_old_veh_recovery() == null ? ""
									: track_dto.getPending_customer_old_veh_recovery())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="customer_credit_report_old_vehicle.jsp">
								Pending Customer Old Veh. Recovery </a></li>


						<%
							}
						%>





					</ul></li>



				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Posts <b class="caret"></b></a>
					<ul class="dropdown-menu">






						<%
							if ((track_dto.getReciept_of_post() == null ? "" : track_dto
									.getReciept_of_post()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="addCollectPost.jsp">Reciept Of post </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getPost_transfer_to_branch() == null ? ""
									: track_dto.getPost_transfer_to_branch())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="addTrasfer_post.jsp">Post Transfer to Branch</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getReciept_of_post() == null ? "" : track_dto
									.getReciept_of_post()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="manageCollectPost.jsp">Reciept Of Post </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getTransfer_post() == null ? "" : track_dto
									.getComplete_damage_creditnote()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manageTransferPostSender.jsp">Transfer Post</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getReceiver() == null ? "" : track_dto.getReceiver())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="manageTransferPostReceiver.jsp">Receiver</a></li>



						<%
							}
						%>


						<%
							if ((track_dto.getCollect_rto_paper_from_customer_first() == null ? ""
									: track_dto.getCollect_rto_paper_from_customer_first())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="add_rto_report.jsp"> First Time Collect RTO
								Paper From customer </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getCollect_rto_paper_from_customer() == null ? ""
									: track_dto.getCollect_rto_paper_from_customer())
									.equalsIgnoreCase("yes")) {
						%>



						<li><a href="manage_rto_collect_to_customer.jsp">Collect
								RTO Paper From customer </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getRto_paper_deliver_to_agent() == null ? ""
									: track_dto.getRto_paper_deliver_to_agent())
									.equalsIgnoreCase("yes")) {
						%>


						<li><a href="manage_sendto_rto.jsp">RTO Paper Deliver to
								Agent </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getRto_paper() == null ? "" : track_dto
									.getRto_paper()).equalsIgnoreCase("yes")) {
						%>



						<li><a href="manage_receive_from_rto.jsp">RTO Paper</a></li>



						<%
							}
						%>


						<%
							if ((track_dto.getDispatch_to_customer() == null ? "" : track_dto
									.getDispatch_to_customer()).equalsIgnoreCase("yes")) {
						%>





						<li><a href="manage_dispatch_to_customer.jsp">Dispatch To
								Customer</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getDiscount_report() == null ? "" : track_dto
									.getDiscount_report()).equalsIgnoreCase("yes")) {
						%>




						<li><a href="discount_report_salmangerwise.jsp">Discount
								Report </a></li>


						<%
							}
						%>



					</ul></li>







				<li><a href="logout.jsp">Logout</a></li>


			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</div>



