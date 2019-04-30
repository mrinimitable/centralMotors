<!DOCTYPE html>


<%@page import="com.dto.PurchaseVehicleDto"%>
<%@page import="com.service.PurchaseService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.service.LogFileService"%>


<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
<%@include file="include/project_info_file_header.jsp"%>
<title><%=project_info_head_dto.getShopname()%></title>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />


<style type="text/css">
.sbmit_blue {
	width: 110px;
	height: 25px;
	float: left;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 13px;
	border-radius: 6px;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from ( 
		                         
		                         
		                                   #003366), to(#00CCFF));
	background: -webkit-linear-gradient(top, #003366, #00CCFF);
	background: -moz-linear-gradient(top, #003366, #00CCFF);
	background: -ms-linear-gradient(top, #003366, #00CCFF);
	background: -o-linear-gradient(top, #003366, #00CCFF);
	background: -webkit-linear-gradient(top, #003366, #00CCFF);
	background: -moz-linear-gradient(top, #003366, #00CCFF);
	background: -ms-linear-gradient(top, #003366, #00CCFF);
	background: -webkit-linear-gradient(top, #003366, #00CCFF);
	background: -moz-linear-gradient(top, #003366, #00CCFF);
	background: -ms-linear-gradient(top, #003366, #00CCFF);
	background: -webkit-linear-gradient(top, #003366, #00CCFF);
	background: -moz-linear-gradient(top, #003366, #00CCFF);
	background: -ms-linear-gradient(top, #003366, #00CCFF);
}
</style>
<style type="text/css">
#printable {
	display: none;
}

@media print {
	#non-printable {
		display: none;
	}
	#printable {
		display: block;
	}
}

.table>tbody>tr>td {
	border-top: none;
}
</style>
<script src="js/toword.js"></script>
<script type="text/javascript">
	function NewPrint(Copies) {
		var Count = 0;
		while (Count < Copies) {
			window.print(0);
			Count++;
		}
	}
</script>
<script src="js/toword.js"></script>
<script>
	function printform() {
		//alert("yes");
		var printContent = document.getElementById('wrapper').innerHTML;
		myWin = window
				.open(
						"",
						"print_window",
						"left=0,top=0,width=0,height=0,toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=yes,copyhistory=0,resizable=yes");
		myWin.document
				.write('<html><head><link rel="stylesheet" href="css/bootstrap.css" type="text/css" /><title>Receipt</title></head><body><div>'
						+ printContent + '</div></body></html>');
		myWin.print();
		myWin.document.close();
	}
</script>


</head>
<body>
	<table>
		<tbody>
			<%
				int id = Integer.parseInt(request.getParameter("id") == null
						? "0"
						: request.getParameter("id"));

				PurchaseService pur_service = new PurchaseService();

				PurchaseVehicleDto dto = pur_service.gePurchaseVehicleById(id,
						request, config);
			%>






			<tr>
				<td><div>
						<input class="sbmit_blue" value="Print" onclick="printform()"
							type="button">
					</div>
					<div>
						<a href="sold_vehicle_report.jsp"> <input value="Home"
							class="sbmit_blue" type="button">
						</a>
					</div></td>
			</tr>
		</tbody>
	</table>
	<div
		style="margin: 0 auto; width: 640px; font-family: 'Times New Roman', Times, serif;"
		id="wrapper">
		<div style="width: 100%; float: left; border: 1px solid;">


			<div style="float: left; width: 100%;">
				<div style="float: left; width: 100%;">
					<div
						style="width: 50%; float: left; font-size: 11px; color: #000; padding: 5px 5px 0;">




						<b>GSTIN -</b>
						<%=project_info_head_dto.getGSTIN()%>

					</div>
					<div
						style="width: 50%; float: left; font-size: 11px; text-align: right; color: #000; padding: 5px 5px 0;">
						<b>Mob -</b>9425085423
					</div>
				</div>
				<div
					style="width: 100%; float: left; font-size: 20px; color: #000; text-align: center;">
					<img src="img/logo.png" width="60"
						style="margin: 5px; float: left;">

					<div style="width: 80%; float: left;">
						<b><%=project_info_head_dto.getShopname()%></b> <span
							style="font-size: 13px; width: 100%; float: left;">
							ADDRESS : <%=dto.getBranch_name()%>


						</span> <span style="font-size: 13px; width: 100%; float: left;">
							<b>TAX INVOICE</b>
						</span>

					</div>

				</div>
				<div
					style="float: left; width: 100%; line-height: 20px; border-top: 1px solid; padding: 1%;">
					<div style="float: left; width: 62%; font-size: 11px;">
						<b><u>RECEIVER INFO-</u><b>
								<div>
									<b>NAME:</b> <span style="text-transform: capitalize;"><%=dto.getCustomer_name()%></span>
								</div>
								<div>
									<b></b>
								</div>


								<div>
									<b>ADDRESS :</b>
									<%=dto.getCustomer_address()%>
								</div>

								<div style="width: 100%; float: left;">
									<span style="width: 50%; float: left;"><b>Mobile:</b> <%=dto.getCustomer_mobile_no()%></span>


								</div>
								<div>
									<b></b>
								</div>




								<div>
									Finance By:<%=dto.getFinance_branch_name()%></div>
					</div>
					<div style="width: 38%; font-size: 11px; float: right;">
						<b><u>INVOICE INFO-</u></b>

						<div>
							<b>INVOICE NO:</b>
							<%-- <%=bill_dto.getBill_no()%> --%>
							<%=dto.getSale_invoice_no()%>
						</div>
						<div>
							<b>DATE: </b>

							<%=LogFileService.changeFormate(dto.getSaleing_date(),
					"yyyy-MM-dd", "dd-MM-yyyy")%>

						</div>





						<div>
							<span style="width: 100%; float: left;"><b>GSTIN :-</b> <%=dto.getCustomer_gstIn()%></span>
						</div>



					</div>


				</div>

				<!--shop_name end-->
			</div>
			<!--head end-->

			<div style="width: 100%; float: left; min-height: 400px;">
				<table style="width: 100%;" border="0" cellpadding="0"
					cellspacing="0">


					<thead>
						<tr style="font-weight: bold; border-top: 1px solid;">

							<th width="4%" valign="bottom"
								style="border-right: 1px solid; font-size: 11px; text-align: center; border-top: 1px solid; border-bottom: 1px solid; margin-bottom: 20px;">S.N.</th>
							<th width="15%" valign="bottom"
								style="border-right: 1px solid; font-size: 11px; text-align: center; border-top: 1px solid; border-bottom: 1px solid;">
								PARTICULARS</th>


							<th width="20%" valign="bottom"
								style="font-size: 11px; text-align: center; border-top: 1px solid; border-bottom: 1px solid;">Amount(Rs.)
							</th>



						</tr>

					</thead>
					<tbody>


						<%
							DecimalFormat df = new DecimalFormat(".##");

							Float Net_saleing_price = dto.getShowroom_price()
									- (dto.getOther_bonus_amount()
											+ dto.getExchange_bonus_amount()
											+ dto.getLottery_bonus_amount() + dto
												.getCorporate_bonus_amount());

							/* Float gst_amount = (dto.getShowroom_price() * dto.getGst_per()) / 100;
							Float cess_amount = (dto.getShowroom_price() * dto.getCess_per()) / 100;
							Float tcs_amount = (dto.getShowroom_price() * dto.getTcs_per()) / 100; */

							Float Discount = dto.getOther_bonus_amount()
									+ dto.getExchange_bonus_amount()
									+ dto.getLottery_bonus_amount()
									+ dto.getCorporate_bonus_amount();

							/* float Total = Net_saleing_price + gst_amount + cess_amount
									+ tcs_amount; */

							float base_price = (100 * Net_saleing_price)
									/ (100 + dto.getGst_per() + dto.getCess_per());

							Float gst_amount = (base_price * dto.getGst_per()) / 100;
							Float cess_amount = (base_price * dto.getCess_per()) / 100;

							float tcs_amount = 0;

							if (Net_saleing_price > dto.getTcs_amount())

							{

								tcs_amount = (Net_saleing_price * dto.getTcs_per()) / 100;

							}

							else {

								tcs_amount = 0;

							}

							Float Grand_total = (Net_saleing_price + dto.getRsa_amount()
									+ dto.getExtended_warranty_amount()
									+ dto.getOther_charges() + tcs_amount);

							/* 	float Total = Net_saleing_price + gst_amount + cess_amount
										+ tcs_amount; */
						%>

						<%-- 
						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">1</td>
							<td>Price Of One(<%=dto.getVariant_name()%>)
							</td>
							<td><%=dto.getShowroom_price()%></td>


						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">2</td>
							<td>Discount</td>
							<td><%=Discount%></td>


						</tr> --%>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">1</td>
							<td>Vehicle Price</td>
							<td><%=df.format(base_price)%></td>



						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">2</td>
							<td>SGST(<%=dto.getGst_per() / 2%>%)
							</td>
							<td><%=df.format(gst_amount / 2)%></td>




						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">3</td>
							<td>CGST(<%=dto.getGst_per() / 2%>%)
							</td>
							<td><%=df.format(gst_amount / 2)%></td>


						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">4</td>
							<td>Compensation Cess(<%=dto.getCess_per()%>%)
							</td>

							<td><%=df.format(cess_amount)%></td>



						</tr>


						<%-- 		<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">7</td>
							<td>TCS(<%=dto.getTcs_per()%>%)
							</td>
							<td><%=tcs_amount%></td>


						</tr> --%>


					</tbody>
				</table>




			</div>


			<div style="width: 100%; float: left;">
				<div class="col-md-12"
					style="border-top: 1px solid #999; padding-top: 5px;">
					<table style="width: 100%; font-size: 11px;">
						<tbody>
							<tr>
								<td style="width: 25%"><b>Model(Varient)</b></td>
								<td style="width: 25%"><b> Chechis No.</b></td>
								<td style="width: 25%"><b>Engine No</b></td>

								<td style="width: 25%; display: none;"><b>Key No.</b></td>

							</tr>
							<tr>
								<td><%=dto.getModel_name()%> ( <%=(dto.getVariant_name())%>)</td>

								<td><%=dto.getChechis_no()%></td>

								<td><%=dto.getEngine_number()%></td>


								<td style="display: none;"><%=dto.getEngine_number()%></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
			<div
				style="width: 100%; float: left; border-top: 1px solid; border-bottom: 1px solid;">
				<div class="col-md-12" style="padding: 0px;">


					<div class="col-md-7 col-sm-7 col-xs-7" style="padding: 0px;">

						<%-- 
						<%if(bill_dto.getGst_status().equalsIgnoreCase("yes")){ %>
						<div style="width: 100%; float: left;">




							<table style="width: 100%; line-height: 15px;">
								<tbody>
									<tr>
										<td colspan="2"></td>
									</tr>


									<tr style="font-size: 11px;">
										<td style="padding-left: 2px; padding-top: 5px;" width="30%"><b><u>BANK
													INFO</u></b></td>

									</tr>

									<tr style="font-size: 11px;"">
										<td style="padding-left: 2px;" valign="top" width="30%"><b>BANK-</b></td>
										<td style="padding-right: 2px;">Axix Bank Ltd, Bombay
											Hospital</td>

									</tr>

									<tr style="font-size: 11px;">
										<td style="padding-left: 2px;"><b>ACC. NO.-</b></td>
										<td style="padding-right: 2px;">916020047467833</td>
									</tr>

									<tr style="font-size: 11px;"">
										<td style="padding-left: 2px;" width="30%"><b>IFC
												CODE Code-</b></td>
										<td style="padding-right: 2px;">UTIB0003029</td>

									</tr>




									<!-- 	<tr style="font-size: 11px;">
										<td style="padding-left: 2px;"><b>PAN. NO.-</b></td>
										<td style="padding-right: 2px;"></td>
									</tr> -->



								</tbody>
							</table>
						</div>



						<div style="width: 100%; float: left;">

							<table style="width: 100%; border-bottom: 1px solid;"
								class="table-bordered" cellpadding="0" cellspacing="0">


								<thead>
									<tr>


										<th style="font-size: 10px; text-align: center; width: 28%"
											rowspan="2">TAXABLE VALUE</th>
										<th style="font-size: 10px; text-align: center;" colspan="2"
											width="36%">CGST</th>

										<th style="font-size: 10px; text-align: center;" colspan="2"
											width="36%">SGST</th>

									</tr>
									<tr>


										<th style="font-size: 10px; text-align: center; width: 20%;">RATE</th>
										<th style="font-size: 10px; text-align: center;">AMT</th>

										<th style="font-size: 10px; text-align: center; width: 20%;">RATE</th>
										<th style="font-size: 10px; text-align: center;">AMT</th>

									</tr>
								</thead>
								<tbody>



									<%if(bill_dto.getTaxable_value_0() >0){ %>

									<tr style="border-bottom: 1px solid; text-align: center;">


										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getTaxable_value_0() %></td>
										<td style="border-top: 1px solid; font-size: 9px;"></td>
										<td style="border-top: 1px solid; font-size: 9px;"></td>
										<td style="border-top: 1px solid; font-size: 9px;"></td>


										<td style="border-top: 1px solid; font-size: 9px;"></td>



									</tr>

									<%} 
									
								if(bill_dto.getTaxable_value_5() >0){ %>

									<tr style="border-bottom: 1px solid; text-align: center;">


										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getTaxable_value_5() %></td>
										<td style="border-top: 1px solid; font-size: 9px;">2.5%</td>
										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getGst_5()/2 %></td>
										<td style="border-top: 1px solid; font-size: 9px;">2.5%</td>


										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getGst_5()/2 %></td>



									</tr>


									<%} 
									
								if(bill_dto.getTaxable_value_12() >0){ %>

									<tr style="border-bottom: 1px solid; text-align: center;">


										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getTaxable_value_12() %></td>
										<td style="border-top: 1px solid; font-size: 9px;">6%</td>
										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getGst_12()/2 %></td>
										<td style="border-top: 1px solid; font-size: 9px;">6%</td>


										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getGst_12()/2 %></td>



									</tr>


									<%} 
									
								if(bill_dto.getTaxable_value_18() >0){ %>

									<tr style="border-bottom: 1px solid; text-align: center;">


										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getTaxable_value_18() %></td>
										<td style="border-top: 1px solid; font-size: 9px;">9%</td>
										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getGst_18()/2 %></td>
										<td style="border-top: 1px solid; font-size: 9px;">9%</td>


										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getGst_18()/2 %></td>



									</tr>

									<%} 
									
								if(bill_dto.getTaxable_value_28() >0){ %>

									<tr style="border-bottom: 1px solid; text-align: center;">


										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getTaxable_value_28() %></td>
										<td style="border-top: 1px solid; font-size: 9px;">14%</td>
										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getGst_28()/2 %></td>
										<td style="border-top: 1px solid; font-size: 9px;">14%</td>

										<td style="border-top: 1px solid; font-size: 9px;"><%=bill_dto.getGst_28()/2 %></td>



									</tr>


									<%} %>



								</tbody>
							</table>
						</div>

						<%} %> --%>


					</div>



					<div class="col-md-5 col-sm-5 col-xs-5"
						style="padding: 0px; border-left: 1px solid;">
						<table style="width: 100%; line-height: 15px;">
							<tbody>




								<tr style="font-size: 11px;">
									<td align="right"><b>TOTAL</b></td>
									<td align="right" style="padding-right: 2px;"><%=Net_saleing_price%></td>
								</tr>


								<tr style="font-size: 11px;">
									<td align="right"><b>Rsa Amount</b></td>
									<td align="right" style="padding-right: 2px;"><%=dto.getRsa_amount()%></td>
								</tr>


								<tr style="font-size: 11px;">
									<td align="right"><b>Extended Warranty</b></td>
									<td align="right" style="padding-right: 2px;"><%=dto.getExtended_warranty_amount()%></td>
								</tr>


								<tr style="font-size: 11px;">
									<td align="right"><b>Other Charges</b></td>
									<td align="right" style="padding-right: 2px;"><%=dto.getOther_charges()%></td>
								</tr>





								<%
									float tcs_per = 0;

									if (Net_saleing_price > dto.getTcs_amount())

									{

										tcs_per = dto.getTcs_per();

									}

									else {

										tcs_per = 0;

									}
								%>


								<tr style="font-size: 11px;">
									<td align="right"><b>Tcs(<%=tcs_per%>)
									</b></td>
									<td align="right" style="padding-right: 2px;"><%=Net_saleing_price * tcs_per / 100%></td>
								</tr>

								<tr style="font-size: 11px;">
									<td align="right"><b>Grand Total</b></td>
									<td align="right" style="padding-right: 2px;"><%=Grand_total%></td>
								</tr>

								<!-- 

								<tr style="font-size: 11px;">
									<td align="right"><b>TCS(%)</b></td>
									<td align="right" style="padding-right: 2px;">12</td>

								</tr>



								<tr
									style="font-size: 11px; border-top: 1px solid; border-bottom: 1px solid;">
									<td align="right"><b>FINAL AMOUNT</b></td>
									<td align="right" style="padding-right: 2px;">200</td>
								</tr> -->


							</tbody>
						</table>


					</div>
				</div>


			</div>
			<div style="width: 100%; float: left;">


				<table style="width: 100%; line-height: 15px;">
					<tbody>


						<tr style="font-size: 11px;"">
							<td style="padding-left: 2px;" valign="top" width="10%"><b>Remark-</b></td>
							<td style="padding-right: 2px;"><%=dto.getDiposit_cheaqe_reamrk()%></td>

						</tr>



					</tbody>
				</table>
			</div>


			<div style="width: 100%; float: left;">
				<div class="col-md-12"
					style="border-top: 1px solid #999; padding-top: 5px;">

					<b style="font-size: 14px;">AMOUNT IN WORD -</b> <span
						id="WordsAmount1" valign="top"
						style="padding-left: 2px; font-size: 14px;"></span>




				</div>
			</div>







			<div style="width: 100%; float: left;">
				<div class="col-md-12" style="padding: 0px;">

					<div class="col-md-7 col-sm-7 col-xs-7">

						<%-- <b>Note-</b>
						<ul style="padding-left: 10px; font-size: 10px;">
							<%
								String[] terms_a = project_info_head_dto.getTerm().split("@");
							%>
							<%
								for (int i = 0; i < terms_a.length; i++) {
							%>
							<li><%=terms_a[i]%></li>
							<%
								}
							%>
						</ul> --%>
					</div>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<br>
						<div
							style="width: 100%; float: left; text-align: right; font-size: 11px;">
							<b> <%=project_info_head_dto.getSing()%>
							</b> <br> <br> <br> <br> <b>Aauthorized
								Signatory </b>


						</div>
					</div>

				</div>
			</div>





			<div style="width: 100%; float: left;">
				<div class="col-md-12" style="padding: 0px;">

					<div class="col-md-5 col-sm-5 col-xs-5">
						<div style="width: 100%; float: left; font-size: 11px;">
							<b>Customer Signature</b>

						</div>
					</div>


				</div>
			</div>







			<%-- 		<div class="col-md-12" style="padding: 0px;">
				<%
 	MassegeService service = new MassegeService();
 	ArrayList<Massegedto> msg_list = service.getMsgDetails(request, config);
 	for(Massegedto message_dto : msg_list){
 %>
				<div
					style="color: #000; font-size: 11px; font-style: oblique; text-ali
				
			 5px;">
					<%=message_dto.getD
				
			
 	}
 %>
			</div> --%>
			<%-- 
			<script>
				var
				aAmount = <%=Math.round(dto.getShowroom_price())%>
				;
				if (!isNaN(aAmount)) {
					aAmount = parseFloat(aAmount);
					var aVarText = "Rs. " + toWords(aAmount) + " Only.";
					document.getElementById("WordsAmount1").innerHTML = aVarText;
					document.getElementById("WordsAmount2").innerHTML = aVarText;
				}
			</script> --%>


			<script src="js/toword.js"></script>


			<script src="js/jquery-1.9.1.js"></script>


			<script type="text/javascript">
				$().ready(function() {

					NumToWord(
			<%=Grand_total%>
				, 'WordsAmount1');

				});
			</script>





			<!--bill end-->
		</div>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>
