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
			<a class="navbar-brand" href="Home.jsp">Center Motor</a>
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
					data-toggle="dropdown">Purchase <b class="caret"></b></a>
					<ul class="dropdown-menu">




						<%
							if ((track_dto.getInward() == null ? "" : track_dto.getInward())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="add_purchase_vehicle.jsp">Inward</a></li>

						<%
							}
						%>

						<%
							if ((track_dto.getTransfer_vehicle() == null ? "" : track_dto
									.getTransfer_vehicle()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="report_purchase_vehicle.jsp">Transfer
								Vehicle</a></li>

						<%
							}
						%>

						<%
							if ((track_dto.getReceiving_vehicle() == null ? "" : track_dto
									.getReceiving_vehicle()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="available_stock_report.jsp">Receiving </a></li>

						<%
							}
						%>

						<%
							if ((track_dto.getReceiving_vehicle() == null ? "" : track_dto
									.getReceiving_vehicle()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="available_new_stock_report.jsp">New Stock </a></li>

						<%
							}
						%>




						<%
							if ((track_dto.getDamage_vehicle() == null ? "" : track_dto
									.getDamage_vehicle()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="damage_vehicle.jsp">Damage Vehicle</a></li>

						<%
							}
						%>

						<%
							if ((track_dto.getP_claim_damage() == null ? "" : track_dto
									.getP_claim_damage()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="pending_claim_damage_Report.jsp"> P Claim
								Damage </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getC_claim_damage() == null ? "" : track_dto
									.getC_claim_damage()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="complete_claim_damage_Report.jsp"> C Claim
								Damage </a></li>

						<%
							}
						%>



						<%
							if ((track_dto.getP_credit_damage() == null ? "" : track_dto
									.getP_credit_damage()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="pending_credit_note_damage_Report.jsp"> P
								Credit Damage </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getC_credit_damage() == null ? "" : track_dto
									.getC_credit_damage()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="complete_credit_note_damage_Report.jsp"> C
								Credit Damage </a></li>

						<%
							}
						%>






					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Sale <b class="caret"></b></a>
					<ul class="dropdown-menu">



						<%
							if ((track_dto.getAdd_quotation() == null ? "" : track_dto
									.getAdd_quotation()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="Add_Quotation.jsp">Add_Quotation </a></li>

						<%
							}
						%>

						<%
							if ((track_dto.getAdd_collect_post() == null ? "" : track_dto
									.getAdd_collect_post()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="addCollectPost.jsp">Add Collect Post</a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getAdd_transerfer_post() == null ? "" : track_dto
									.getAdd_transerfer_post()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="addTrasfer_post.jsp">Add Transerfer Post</a></li>


						<%
							}
						%>



						<%
							if ((track_dto.getVehicle_request() == null ? "" : track_dto
									.getVehicle_request()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="add_vehicle_request.jsp"> Vehicle Request</a></li>




						<%
							}
						%>


						<%
							if ((track_dto.getPend_veh_req() == null ? "" : track_dto
									.getPend_veh_req()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manage_vehicle_request.jsp"> Pend. Veh. Req.
						</a></li>

						<%
							}
						%>




						<%
							if ((track_dto.getComp_veh_req() == null ? "" : track_dto
									.getComp_veh_req()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="manage_vehicle_request_complete.jsp">
								Comp.Veh. Req. </a></li>



						<%
							}
						%>

						<%
							if ((track_dto.getSale_request() == null ? "" : track_dto
									.getSale_request()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="sale_request.jsp">Sale Request </a></li>

						<li><a href="complete_sale_request.jsp">Complete Sale
								Request </a></li>



						<%
							}
						%>


						<%
							if ((track_dto.getSale_bill() == null ? "" : track_dto
									.getSale_bill()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="verify_sale_request_report.jsp">Sale Bill </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getSold_vehicle() == null ? "" : track_dto
									.getSold_vehicle()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="sold_vehicle_report.jsp">Sold Vehicle </a></li>

						<%
							}
						%>

						<%
							if ((track_dto.getAdd_workshop() == null ? "" : track_dto
									.getAdd_workshop()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="add_workshop.jsp">Add Workshop</a></li>

						<%
							}
						%>




					</ul></li>



				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">PAY AGAINST SALE <b class="caret"></b></a>
					<ul class="dropdown-menu">



						<%
							if ((track_dto.getInsurance() == null ? "" : track_dto
									.getInsurance()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="add_insurance_Report.jsp"> Insurance </a></li>





						<%
							}
						%>


						<%
							if ((track_dto.getInsurance_report() == null ? "" : track_dto
									.getInsurance_report()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="insurance_Report.jsp"> Insurance Report</a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getFinance() == null ? "" : track_dto.getFinance())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="finance_report.jsp"> Finance </a></li>



						<%
							}
						%>

						<%
							if ((track_dto.getFinance_old() == null ? "" : track_dto
									.getFinance_old()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="finance_report_old_vehicle.jsp"> Finance Old
								Vehicle </a></li>

						<%
							}
						%>





						<%
							if ((track_dto.getWorkshop_report() == null ? "" : track_dto
									.getWorkshop_report()).equalsIgnoreCase("yes")) {
						%>


						<li><a href="workshop_report.jsp">Workshop Report </a></li>

						<li><a href="workshop_billing_report.jsp">Workshop
								Billing </a></li>

						<li><a href="workshop_pay_insurance_credit_report.jsp">
								Pay Insurance Workshop Report </a></li>




						<%
							}
						%>

						<%
							if ((track_dto.getWorkshop_credit() == null ? "" : track_dto
									.getWorkshop_credit()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="workshop_balance_collect_report.jsp">Workshop
								Credit </a></li>

						<%
							}
						%>




						<%
							if ((track_dto.getAdd_rto_tax() == null ? "" : track_dto
									.getAdd_rto_tax()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="add_rto_tax_report.jsp"> Add Rto Tax </a></li>



						<%
							}
						%>


						<%
							if ((track_dto.getRto_tax_report() == null ? "" : track_dto
									.getRto_tax_report()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="rto_tax_report.jsp">Rto Tax Report</a></li>
						<%
							}
						%>




						<!-- <li><a href="deposit_finance_report.jsp"> Finance
												Report </a></li> -->


						<!-- <li><a href="workshop_aprovel_report.jsp">Workshop
								Aprovel </a></li> -->




						<%
							if ((track_dto.getCollect_rto_paper() == null ? "" : track_dto
									.getCollect_rto_paper()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="add_rto_report.jsp"> Collect Rto Paper</a></li>


						<%
							}
						%>

						<%
							if ((track_dto.getCollect_paper_to_customer() == null ? ""
									: track_dto.getCollect_paper_to_customer())
									.equalsIgnoreCase("yes")) {
						%>

						<li><a href="manage_rto_collect_to_customer.jsp">Collect
								Paper To Customer </a></li>
						<%
							}
						%>


						<%
							if ((track_dto.getSend_to_rto() == null ? "" : track_dto
									.getSend_to_rto()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manage_sendto_rto.jsp">Send To Rto </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getReceive_from_rto() == null ? "" : track_dto
									.getReceive_from_rto()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="manage_receive_from_rto.jsp">Receive From
								Rto </a></li>
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
							if ((track_dto.getRto_paper_report() == null ? "" : track_dto
									.getRto_paper_report()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="rto_paper_report.jsp"> Rto Paper Report</a></li>
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
							if ((track_dto.getPrice_list() == null ? "" : track_dto
									.getPrice_list()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="Product_Report.jsp">Price List</a></li>
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
							if ((track_dto.getAdd_sub_head() == null ? "" : track_dto
									.getAdd_sub_head()).equalsIgnoreCase("yes")) {
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







					</ul></li>


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Account <b class="caret"></b></a>
					<ul class="dropdown-menu">


						<%
							if ((track_dto.getCredit_report() == null ? "" : track_dto
									.getCredit_report()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="customer_credit_report_by_salesconsultant.jsp">Credit
								Report </a></li>


						<%
							}
						%>


						<%
							if ((track_dto.getOld_vehicle_credit_report() == null ? ""
									: track_dto.getOld_vehicle_credit_report())
									.equalsIgnoreCase("yes")) {
						%>
						<li><a href="customer_credit_report_old_vehicle.jsp">Old
								Vehicle Credit Report </a></li>
						<%
							}
						%>



						<%
							if ((track_dto.getSpent() == null ? "" : track_dto.getSpent())
									.equalsIgnoreCase("yes")) {
						%>
						<li><a href="add_spend_payment.jsp">Spent</a></li>

						<!-- <li><a href="manageSpent.jsp">Spent Aprovel </a></li> -->


						<%
							}
						%>


						<%
							if ((track_dto.getPay_spent_report() == null ? "" : track_dto
									.getPay_spent_report()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpentPayment.jsp">Pay Cash
								Spent Report </a></li>
						<%
							}
						%>



						<%
							if ((track_dto.getSpent_report() == null ? "" : track_dto
									.getSpent_report()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpent.jsp">Spent Report</a></li>
						<%
							}
						%>



						<%
							if ((track_dto.getSpent_cheque_rep() == null ? "" : track_dto
									.getSpent_cheque_rep()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpentPayment_khandwa.jsp">Spent
								Cheque Rep. </a></li>




						<%
							}
						%>


						<%
							if ((track_dto.getRec_payment() == null ? "" : track_dto
									.getRec_payment()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="add_receiving_payment.jsp"> Rec. Payment</a></li>
						<%
							}
						%>


						<%
							if ((track_dto.getRec_payment_cash() == null ? "" : track_dto
									.getRec_payment()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="add_receiving_payment_cash.jsp"> Rec. Cash
								Payment</a></li>
						<%
							}
						%>






						<%
							if ((track_dto.getReceived_report() == null ? "" : track_dto
									.getReceived_report()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageReciveChequeReport.jsp">Received
								Report </a></li>





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


						<!-- 	<li><a href="manageReceiveAmountReport.jsp">Rec. Aprovel.</a></li> -->





						<%
							if ((track_dto.getCancle_cheque() == null ? "" : track_dto
									.getCancle_cheque()).equalsIgnoreCase("yes")) {
						%>
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
							if ((track_dto.getKhandwa_spent_cheque() == null ? "" : track_dto
									.getKhargone_spent_cheque()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageApproveSpentPayment_khandwa.jsp">
								Spent Cheque Pay </a></li>

						<%
							}
						%>
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

						<%
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


					</ul></li>



				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Report <b class="caret"></b></a>
					<ul class="dropdown-menu">


						<%
							if ((track_dto.getAvailable_old_stock() == null ? "" : track_dto
									.getAvailable_old_stock()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="available_old_stock_report.jsp">Available
								Old Stock </a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getComplete_old_stock_report() == null ? ""
									: track_dto.getComplete_old_stock_report())
									.equalsIgnoreCase("yes")) {
						%>
						<li><a href="old_stock_complete_report.jsp">Complete Old
								Stock Report </a></li>
						<%
							}
						%>


						<%
							if ((track_dto.getPending_accessories_report() == null ? ""
									: track_dto.getPending_accessories_report())
									.equalsIgnoreCase("yes")) {
						%>
						<li><a href="accessories_pending_report.jsp">Pending
								Accessories Report </a></li>


						<%
							}
						%>



						<%
							if ((track_dto.getComplete_accessories_report() == null ? ""
									: track_dto.getComplete_accessories_report())
									.equalsIgnoreCase("yes")) {
						%>
						<li><a href="accessories_complete_report.jsp">Complete
								Accessories Report </a></li>
						<%
							}
						%>








						<%
							if ((track_dto.getCollect_post() == null ? "" : track_dto
									.getCollect_post()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageCollectPost.jsp">Collect Post</a></li>
						<%
							}
						%>




						<%
							if ((track_dto.getTransfer_post_report() == null ? "" : track_dto
									.getTransfer_post_report()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageTransferPostSender.jsp">Transfer Post
								Report </a></li>
						<%
							}
						%>


						<%
							if ((track_dto.getReceiver_transfer_post_report() == null ? ""
									: track_dto.getReceiver_transfer_post_report())
									.equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageTransferPostReceiver.jsp">Receiver
								Transfer Post Report </a></li>



						<%
							}
						%>

						<%
							if ((track_dto.getQuotation() == null ? "" : track_dto
									.getQuotation()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manage_quotation.jsp">Quotation </a></li>
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
					data-toggle="dropdown">All Bonus <b class="caret"></b></a>
					<ul class="dropdown-menu">


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
									: track_dto.getComplete_credit_exchange_bonus())
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
							if ((track_dto.getPend_rsa_amount() == null ? "" : track_dto
									.getPend_rsa_amount()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="pending_rsa_amount.jsp">Pend. RsaAmount </a></li>




						<%
							}
						%>

						<%
							if ((track_dto.getComp_rsa_amount() == null ? "" : track_dto
									.getComp_rsa_amount()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="complete_rsa_amount.jsp">Comp. RsaAmount </a></li>
						<%
							}
						%>





						<%
							if ((track_dto.getPend_ext_warranty() == null ? "" : track_dto
									.getPend_ext_warranty()).equalsIgnoreCase("yes")) {
						%>

						<li><a href="pending_extended_warranty.jsp">Pend.
								Ext.Warranty </a></li>





						<%
							}
						%>

						<%
							if ((track_dto.getComp_ext_warranty() == null ? "" : track_dto
									.getComp_ext_warranty()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="complete_extended_warranty.jsp">Comp.
								Ext.Warranty </a></li>
						<%
							}
						%>

						<%
							if ((track_dto.getPend_oth_charges() == null ? "" : track_dto
									.getPend_oth_charges()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="pending_other_charges.jsp">Pend. Oth.Charges
						</a></li>


						<%
							}
						%>

						<%
							if ((track_dto.getComp_oth_charges() == null ? "" : track_dto
									.getComp_oth_charges()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="complete_other_charges.jsp">Comp.
								Oth.Charges </a></li>
						<%
							}
						%>




					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Approve <b class="caret"></b></a>
					<ul class="dropdown-menu">


						<%
							if ((track_dto.getSale_aprovel() == null ? "" : track_dto
									.getSale_aprovel()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="sale_request_report.jsp">Sale Aprovel</a></li>

						<%
							}
						%>


						<%
							if ((track_dto.getWorkshop_aprovel() == null ? "" : track_dto
									.getWorkshop_aprovel()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="workshop_aprovel_report.jsp">Workshop
								Aprovel </a></li>
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
							if ((track_dto.getRec_aprovel() == null ? "" : track_dto
									.getRec_aprovel()).equalsIgnoreCase("yes")) {
						%>
						<li><a href="manageReceiveAmountReport.jsp">Rec. Aprovel.</a></li>
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




					</ul></li>


				<li><a href="logout.jsp">Logout</a></li>


			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</div>




<!-- 

<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Purchase <b class="caret"></b></a>
					<ul class="dropdown-menu">




						<li><a href="add_purchase_vehicle.jsp">Inward</a></li>


						<li><a href="report_purchase_vehicle.jsp">Transfer
								Vehicle</a></li>

						<li><a href="available_stock_report.jsp">Receiving </a></li>

						<li><a href="damage_vehicle.jsp">Damage Vehicle</a></li>


						<li><a href="pending_claim_damage_Report.jsp"> P Claim
								Damage </a></li>

						<li><a href="complete_claim_damage_Report.jsp"> C Claim
								Damage </a></li>


						<li><a href="pending_credit_note_damage_Report.jsp"> P
								Credit Damage </a></li>

						<li><a href="complete_credit_note_damage_Report.jsp"> C
								Credit Damage </a></li>




					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Sale <b class="caret"></b></a>
					<ul class="dropdown-menu">

						<li><a href="Add_Quotation.jsp">Add_Quotation </a></li>





						<li><a href="add_vehicle_request.jsp"> Vehicle Request</a></li>


						<li><a href="manage_vehicle_request.jsp"> Pend. Veh. Req.
						</a></li>

						<li><a href="manage_vehicle_request_complete.jsp"> 
							Comp.Veh. Req. </a></li>





						<li><a href="sale_request.jsp">Sale Request </a></li>


						<li><a href="sale_request_report.jsp">Sale Aprovel</a></li>



						<li><a href="verify_sale_request_report.jsp">Sale Bill </a></li>


						<li><a href="sold_vehicle_report.jsp">Sold Vehicle </a></li>


						<li><a href="add_workshop.jsp">Add Workshop</a></li>

					</ul></li>



				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">PAY AGAINST SALE <b class="caret"></b></a>
					<ul class="dropdown-menu">

						<li><a href="add_insurance_Report.jsp"> Insurance </a></li>


						<li><a href="insurance_Report.jsp"> Insurance Report</a></li>

						<li><a href="finance_report.jsp"> Finance </a></li>

						<li><a href="finance_report_old_vehicle.jsp"> Finance Old
								Vehicle </a></li>




						<li><a href="deposit_finance_report.jsp"> Finance
												Report </a></li>


						<li><a href="workshop_aprovel_report.jsp">Workshop
								Aprovel </a></li>

						<li><a href="workshop_report.jsp">Workshop Report </a></li>





						<li><a href="workshop_balance_collect_report.jsp">Workshop Credit 
								 </a></li>


						<li><a href="add_rto_tax_report.jsp"> Add Rto Tax </a></li>

						<li><a href="rto_tax_report.jsp">Rto Tax Report</a></li>


						<li><a href="add_rto_report.jsp"> Collect Rto Paper</a></li>

						<li><a href="manage_rto_collect_to_customer.jsp">Collect
								Paper To Customer </a></li>

						<li><a href="manage_sendto_rto.jsp">Send To Rto </a></li>

						<li><a href="manage_receive_from_rto.jsp">Receive From
								Rto </a></li>

						<li><a href="manage_dispatch_to_customer.jsp">Dispatch To
								Customer</a></li>

						<li><a href="rto_paper_report.jsp"> Rto Paper Report</a></li>




					</ul></li>





				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Master <b class="caret"></b></a>
					<ul class="dropdown-menu">

						<li><a href="ManageDistributer.jsp">Distributor </a></li>

						<li><a href="manageModel.jsp">Model</a></li>



						<li><a href="manageVarient.jsp">Varient </a></li>

						<li><a href="Update_Varient_Info.jsp">Varient Update Info
						</a></li>

						<li><a href="model_report_for_varient_price.jsp">Varient
								Variation </a></li>



						<li><a href="Product_Report.jsp">Price List</a></li>

						<li><a href="manageInsurranceCompany.jsp">Insurance
								Company</a></li>



						<li><a href="manageFinanceBank.jsp">Finance Bank </a></li>

						<li><a href="manageRtoCompany.jsp">Rto Agent </a></li>


						<li><a href="bank_details.jsp">Add Bank Account </a></li>


						<li><a href="Add_Spent_Head.jsp">Add Spent Head </a></li>

						<li><a href="manage_spent_subhead.jsp">Add SubHead </a></li>
						<li><a href="add_user.jsp">User</a></li>

					</ul></li>


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Account <b class="caret"></b></a>
					<ul class="dropdown-menu">

						<li><a href="customer_credit_report.jsp">Credit Report </a></li>

						<li><a href="customer_credit_report_old_vehicle.jsp">Old Vehicle Credit Report </a></li>


						<li><a href="add_spend_payment.jsp">Spent</a></li>

						<li><a href="manageSpent.jsp">Spent Aprovel </a></li>

						<li><a href="manageApproveSpentPayment.jsp">Pay Spent Report
								</a></li>

						<li><a href="manageApproveSpent.jsp">Spent Report</a></li>




						<li><a href="manageApproveSpentPayment_khandwa.jsp">Spent Cheque Rep.
								</a></li>



						<li><a href="add_receiving_payment.jsp"> Rec. Payment</a></li>



							<li><a href="manageReceiveAmountReport.jsp">Rec. Aprovel.</a></li>

						<li><a href="manageReciveChequeReport.jsp">Received Report
								</a></li>


						<li><a href="RepresentTodayCheque.jsp">Today Cheque </a></li>



						<li><a href="Cancle_Cheque.jsp">Cancle Cheque </a></li>


						<li><a href="Bounced_Cheque.jsp">Bounced Cheque </a></li>


						<li><a href="Day_Book.jsp">Day Book </a></li>

						<li><a href="Cash_Book.jsp">Cash Book </a></li>

						<li><a href="BankDetail_Report.jsp">Banking</a></li>

						<li><a href="manageApproveSpent_khandwa.jsp">Khandwa Spent Cheque</a></li>
						<li><a href="manageApproveSpent_khargone.jsp">Khargone Spent Cheque
								</a></li>
						<li><a href="manageApproveSpent_burhanpur.jsp">Burhanpur Spent Cheque
								</a></li>
						<li><a href="manageApproveSpent_barwani.jsp">Barwani Spent Cheque
								</a></li>



					</ul></li>



				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Report <b class="caret"></b></a>
					<ul class="dropdown-menu">

						<li><a href="available_old_stock_report.jsp">Available Old Stock
								 </a></li>


						<li><a href="old_stock_complete_report.jsp">Complete Old Stock Report
								 </a></li>


						<li><a href="accessories_pending_report.jsp">Pending Accessories Report
								 </a></li>

						<li><a href="accessories_complete_report.jsp">Complete Accessories Report
								 </a></li>


						<li><a href="addCollectPost.jsp">Add Collect Post</a></li>

						<li><a href="manageCollectPost.jsp">Collect Post</a></li>

						<li><a href="addTrasfer_post.jsp">Add Transerfer Post</a></li>

						<li><a href="manageTransferPostSender.jsp">Transfer Post Report
								</a></li>

						<li><a href="manageTransferPostReceiver.jsp">Receiver Transfer Post Report
								 </a></li>




						<li><a href="manage_quotation.jsp">Quotation </a></li>

						<li><a href="discount_report_salmangerwise.jsp">Discount Report
								 </a></li>

						<li><a href="manage_Registration.jsp">Manage User</a></li>

					</ul></li>


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">All Bonus <b class="caret"></b></a>
					<ul class="dropdown-menu">

						<li><a href="pending_claim_exchange_bonus_Report.jsp">Pending Claim Exchange Bonus
								 </a></li>

						<li><a href="complete_claim_exchange_bonus_Report.jsp">Complete Claim Exchange Bonus
								 </a></li>


						<li><a href="pending_credit_note_exchange_bonus_Report.jsp">Pending Credit Exchange Bonus
								 </a></li>

						<li><a href="complete_credit_note_exchange_bonus_Report.jsp">Complete Credit Exchange Bonus
								 </a></li>


						<li><a href="pending_claim_loyalty_bonus_Report.jsp">Pending Claim Loyalty Bonus
								</a></li>

						<li><a href="complete_claim_loyalty_bonus_Report.jsp">
								Complete Claim Loyalty Bonus</a></li>


						<li><a href="pending_credit_note_loyalty_bonus_Report.jsp">Pending Credit Loyalty Bonus
								 </a></li>

						<li><a href="complete_credit_note_loyalty_bonus_Report.jsp">Complete Credit Loyalty Bonus
								 </a></li>




						<li><a href="pending_claim_corporate_bonus_Report.jsp">Pending Claim Corporate Bonus
								 </a></li>

						<li><a href="complete_claim_corporate_bonus_Report.jsp">
								Complete Claim Corporate Bonus </a></li>


						<li><a href="pending_credit_note_corporate_bonus_Report.jsp">Pending Credit Corporate Bonus
								 </a></li>

						<li><a href="complete_credit_note_corporate_bonus_Report.jsp">Complete Credit Corporate Bonus
								 </a></li>


						<li><a href="pending_rsa_amount.jsp">Pend. RsaAmount </a></li>

						<li><a href="complete_rsa_amount.jsp">Comp. RsaAmount </a></li>


						<li><a href="pending_extended_warranty.jsp">Pend. Ext.Warranty
								 </a></li>

						<li><a href="complete_extended_warranty.jsp">Comp. Ext.Warranty
								 </a></li>

						<li><a href="pending_other_charges.jsp">Pend. Oth.Charges
						</a></li>

						<li><a href="complete_other_charges.jsp">Comp. Oth.Charges
								 </a></li>

					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Approve <b class="caret"></b></a>
					<ul class="dropdown-menu">

						<li><a href="sale_request_report.jsp">Sale Aprovel</a></li>

						<li><a href="workshop_aprovel_report.jsp">Workshop Aprovel
								 </a></li>

						<li><a href="manageSpent.jsp">Spent Aprovel </a></li>

						<li><a href="manageReceiveAmountReport.jsp">Rec. Aprovel.</a></li>

						<li><a href="manageApproveSpentPayment_khandwa.jsp">Khandwa Spent Cheque
								</a></li>
						<li><a href="manageApproveSpentPayment_khargone.jsp">Khargone Spent Cheque
								</a></li>
						<li><a href="manageApproveSpentPayment_burhanpur.jsp">Burhanpur Spent Cheque
								</a></li>
						<li><a href="manageApproveSpentPayment_barwani.jsp">Barwani Spent Cheque
								</a></li>
					</ul></li>


				<li><a href="logout.jsp">Logout</a></li>


			</ul>


 -->