<!DOCTYPE html>


<%@page import="com.dto.QuotationDto"%>
<%@page import="com.service.QuotationServie"%>
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



<script type="text/javascript">
	function NewPrint(Copies) {
		var Count = 0;
		while (Count < Copies) {
			window.print(0);
			Count++;
		}
	}
</script>

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
				/* int id = Integer.parseInt(request.getParameter("id") == null
						? "0"
						: request.getParameter("id"));

				QuotationServie pur_service = new QuotationServie();

				QuotationDto dto = pur_service
						.getQuotationById(id, request, config); */

				int id = Integer.parseInt(request.getParameter("id") == null
						? "0"
						: request.getParameter("id"));

				PurchaseService pur_service = new PurchaseService();

				PurchaseVehicleDto dto = pur_service.getSaleRequestById(id,
						request, config);

				float tcs_value = 0;

				float final_showroom_price = dto.getShowroom_price()
						- (dto.getVariant_exchange_bonus_amount()
								+ dto.getVariant_lottery_bonus_amount()
								+ dto.getVariant_corporate_bonus_amount() + dto
									.getOther_bonus_amount());
				
				if (final_showroom_price >= dto.getTcs_amount()) {
					tcs_value = final_showroom_price * dto.getTcs_per() / 100;

				} else {

					tcs_value = 0;
				}
				

				float total = final_showroom_price + dto.getRto_tax_price()
						+ dto.getInsurance_price() + dto.getAccessories_amount()
						+ dto.getHandling_charges() + dto.getRsa_amount()
						+ dto.getExtended_warranty_amount()
						+ dto.getOther_charges() + tcs_value;

			
			%>






			<tr>
				<td><div>
						<input class="sbmit_blue" value="Print" onclick="printform()"
							type="button">
					</div>
					<div>
						<a href="Add_Quotation.jsp"> <input value="Home"
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




						<b>Email- khandpure.bs@gmail.com</b></br> <b>Email-
							sales.centralmotors@gmail.com</b>



					</div>
					<div
						style="width: 50%; float: left; font-size: 11px; text-align: right; color: #000; padding: 5px 5px 0;">
						<b>PHONE-<%=project_info_head_dto.getMobile()%></b></br> <b>Mobile-9425085423-24</b></br>

					</div>
				</div>



				<div
					style="width: 80%; float: left; font-size: 20px; color: #000; text-align: center;">

					<div style="width: 20%; float: left;">

						<img src="img/logo.png" width="100%"
							style="margin: 5px; float: left;">
					</div>


					<div style="width: 65%; float: left;">
						<b><%=project_info_head_dto.getShopname()%></b> <span
							style="font-size: 13px; width: 100%; float: left;">
							ADDRESS : <%=project_info_head_dto.getAddress()%>


						</span> <span style="font-size: 13px; width: 100%; float: left;">
							<b>QUOTATION</b>
						</span>



					</div>

				</div>



				<div
					style="width: 100%; float: left; border-top: 1px solid; border-bottom: 1px solid;">
					<div class="col-md-12" style="padding: 0px;">





						<div class="col-md-12 col-sm12- col-xs-12"
							style="padding: 0px; border-left: 1px solid;">
							<table style="width: 100%; line-height: 15px;">
								<tbody>




									<tr style="font-size: 11px;">
										<td align="center"><b style="font-size: 14px;">
												Authorised delaler for :- Mahindra & Mahindra Range of
												Vehicles</b></td>

									</tr>






								</tbody>
							</table>


						</div>


					</div>


				</div>



				<div
					style="float: left; width: 100%; line-height: 20px; border-top: 1px solid; padding: 1%;">

					<div style="float: left; width: 62%; font-size: 11px;">
						<b><u></u><b>


								<div>
									<b>SR NO:</b>

									<%=dto.getId()%>

								</div>
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
								</div> <%-- <div>
									Finance BY:<%=dto.getModel_name()%></div>
 --%>
					</div>

					<div style="width: 38%; font-size: 11px; float: right;">
						<!-- <b><u>INVOICE INFO-</u></b> -->



						<div>
							<b>DATE: </b>



							<%=LogFileService.changeFormate(dto.getSaleing_date(),
					"yyyy-MM-dd", "dd-MM-yyyy")%>

						</div>


						<div>
							<b>MODEL:</b>
							<%-- <%=bill_dto.getBill_no()%> --%>
							<%=dto.getModel_name()%>

						</div>


						<div>
							<b>VARIANT:</b>
							<%-- <%=bill_dto.getBill_no()%> --%>
							<%=dto.getVariant_name()%>

						</div>

						<%-- <div>
							<b>COLOR:</b>
							<%=bill_dto.getBill_no()%>
							<%=dto.get()%>

						</div> --%>





					</div>


				</div>

				<!--shop_name end-->
			</div>
			<!--head end-->

			<div style="width: 100%; float: left; min-height: 280px;">
				<table style="width: 100%;" border="0" cellpadding="0"
					cellspacing="0">


					<thead>
						<tr style="font-weight: bold; border-top: 1px solid;">

							<th width="4%" valign="bottom"
								style="border-right: 1px solid; font-size: 11px; text-align: center; border-top: 1px solid; border-bottom: 1px solid; margin-bottom: 20px;">S.N.</th>
							<th width="15%" valign="bottom"
								style="border-right: 1px solid; font-size: 11px; text-align: center; border-top: 1px solid; border-bottom: 1px solid;">
								DESCRIPTION</th>


							<th width="20%" valign="bottom"
								style="font-size: 11px; text-align: center; border-top: 1px solid; border-bottom: 1px solid;">AMOUNTS(Rs.)
							</th>



						</tr>

					</thead>


					<tbody>




						<%-- 
						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">1</td>
							<td style="font-size: 14px;">Ex Showroom Price</td>
							<td><%=dto.getShowroom_price()%></td>


						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">1</td>
							<td style="font-size: 14px;">Exchange Bonus</td>
							<td><%=dto.getVariant_exchange_bonus_amount()%></td>


						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">1</td>
							<td style="font-size: 14px;">Loyalty Bonus</td>
							<td><%=dto.getVariant_lottery_bonus_amount()%></td>


						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">1</td>
							<td style="font-size: 14px;">Corporate Bonus</td>
							<td><%=dto.getVariant_corporate_bonus_amount()%></td>


						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">1</td>
							<td style="font-size: 14px;">Consultant Discount</td>
							<td><%=dto.getOther_bonus_amount()%></td>


						</tr>
 --%>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">1</td>
							<td style="font-size: 14px;">Final Ex Showroom Price (After<%
								if (dto.getVariant_exchange_bonus_amount() > 0) {
							%> Exchange Bonus,<%
								}
							%> <%
 	if (dto.getVariant_lottery_bonus_amount() > 0) {
 %> Loyalty Bonus,<%
 	}
 %> <%
 	if (dto.getVariant_corporate_bonus_amount() > 0) {
 %>Corporate Bonus,<%
 	}
 %> <%
 	if (dto.getOther_bonus_amount() > 0) {
 %> Consultant Discount<%
 	}
 %>)
							</td>
							<td><%=final_showroom_price%></td>


						</tr>




						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">2</td>
							<td style="font-size: 14px;">Registration Rto Tax</td>
							<td><%=dto.getRto_tax_price()%></td>


						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">3</td>
							<td style="font-size: 14px;">Insurance</td>
							<td><%=dto.getInsurance_price()%></td>

						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">4</td>
							<td style="font-size: 14px;">Accessories</td>
							<td><%=dto.getAccessories_amount()%></td>


						</tr>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">5</td>
							<td style="font-size: 14px;">Handling Charges</td>
							<td><%=dto.getHandling_charges()%></td>


						</tr>
						<%-- 
						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">6</td>
							<td>Tcs Per(%)
							</td>
							<td><%=dto.getTcs_per()%></td>


						</tr> --%>






						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">7</td>
							<td style="font-size: 14px;">Rsa Amount</td>
							<td><%=dto.getRsa_amount()%></td>


						</tr>



						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">8</td>
							<td style="font-size: 14px;">Extended Warranty</td>
							<td><%=dto.getExtended_warranty_amount()%></td>


						</tr>


						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">9</td>
							<td style="font-size: 14px;">Other Charges</td>
							<td><%=dto.getOther_charges()%></td>


						</tr>

						<%
							if (tcs_value > 0) {
						%>

						<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">6</td>
							<td style="font-size: 14px;">T.C.S. (<%=dto.getTcs_per()%>
								%)
							</td>
							<td><%=tcs_value%></td>

						</tr>


						<%
							}
						%>


						<%-- 		<tr style="text-align: center; font-size: 11px;">


							<td style="padding: 10px 0 10px; min-height: 100px;">7</td>
							<td>TCS(<%=dto.getTcs_per()%>%)
							</td>
							<td><%=tcs_amount%></td>


						</tr> --%>


					</tbody>
				</table>




			</div>
			<div
				style="width: 100%; float: left; border-top: 1px solid; border-bottom: 1px solid;">
				<div class="col-md-12" style="padding: 0px;">


					<div class="col-md-6 col-sm-6 col-xs-6" style="padding: 0px;">

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





					<div class="col-md-6 col-sm6- col-xs-6"
						style="padding: 0px; border-left: 1px solid;">
						<table style="width: 100%; line-height: 15px;">
							<tbody>




								<tr style="font-size: 11px;">
									<td align="center"><b>TOTAL</b></td>
									<td align="left" style="padding-right: 2px;"><%=total%></td>
								</tr>

								<%-- <tr style="font-size: 11px;">
									<td align="right"><b>Tcs(<%=dto.getTcs_per() %>)</b></td>
									<td align="right" style="padding-right: 2px;"><%=dto.getShowroom_price()*dto.getTcs_per()/100%></td>
								</tr>
								
									<tr style="font-size: 11px;">
									<td align="right"><b>Grand Total</b></td>
									<td align="right" style="padding-right: 2px;"><%=dto.getShowroom_price()-tcs_amount%></td>
								</tr> --%>






							</tbody>
						</table>


					</div>


				</div>


			</div>



			<div style="width: 100%; float: left;">


				<table style="width: 100%; line-height: 15px;">
					<tbody>


						<tr style="font-size: 15px;"">
							<td style="padding-left: 2px;" valign="top" width="30%"><b>Remark-</b></td>
							<td style="padding-right: 2px;"></td>

						</tr>



					</tbody>
				</table>
			</div>
			<div style="width: 100%; float: left;">
				<div class="col-md-12"
					style="border-top: 1px solid #999; padding-top: 5px;">
					<table style="width: 100%; font-size: 11px;">
						<tbody>




						</tbody>
					</table>
				</div>
			</div>

			<div style="width: 100%; float: left;">
				<div class="col-md-12"
					style="border-top: 1px solid #999; padding-top: 5px;">

					<b style="font-size: 14px;">Amount In Word -</b> <span
						id="WordsAmount1" valign="top"
						style="padding-left: 2px; font-size: 14px;"></span>




				</div>
			</div>







			<div style="width: 100%; float: left;">
				<div class="col-md-12" style="padding: 0px;">

					<div class="col-md-12 col-sm-12 col-xs-12">

						<b>Note-</b>
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
						</ul>
					</div>


				</div>
			</div>





			<div style="width: 100%; float: left;">
				<div class="col-md-12" style="padding: 0px;">

					<div class="col-md-6 col-sm-6 col-xs-6">
						<div style="width: 100%; float: left; font-size: 11px;">
							<!-- <b>Customer Signature</b> -->

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
										<td style="padding-right: 2px;">Patel Chamber
											Branch,Khandwa.(STATE BANK OF INDIA)</td>

									</tr>

									<tr style="font-size: 11px;">
										<td style="padding-left: 2px;"><b>ACC. NO.-</b></td>
										<td style="padding-right: 2px;">53045925078</td>
									</tr>

									<tr style="font-size: 11px;"">
										<td style="padding-left: 2px;" width="30%"><b>IFC
												CODE -</b></td>
										<td style="padding-right: 2px;">SBIN0030102</td>

									</tr>




									<!-- 	<tr style="font-size: 11px;">
										<td style="padding-left: 2px;"><b>PAN. NO.-</b></td>
										<td style="padding-right: 2px;"></td>
									</tr> -->



								</tbody>
							</table>

						</div>
					</div>


					<div class="col-md-6 col-sm-6 col-xs-6">
						<br>
						<div
							style="width: 100%; float: left; text-align: right; font-size: 11px;">
							<b> For - <%=project_info_head_dto.getSing()%>
							</b> <br> <br> <br> <br> <b>Aauthorized
								Signatory </b>


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

			<%-- <script type="text/javascript"></script>
				var aAmo
			unt = <%=Math.round(dto.getTotal_amount())%>
				;
				if (!isNaN(aAmount)) {
					aAmount = parseFloat(aAmount);
					var aVarText = "Rs. " + toWords(aAmount) + " Only.";
					document.getElementById("WordsAmount1").innerHTML = aVarText;
					document.getElementById("WordsAmount2").innerHTML = aVarText;
				}
			</script> --%>








			<!--bill end-->
		</div>
	</div>
</body>


<script src="js/toword.js"></script>


<script src="js/jquery-1.9.1.js"></script>


<script type="text/javascript">
	$().ready(function() {

		NumToWord(
<%=total%>
	, 'WordsAmount1');

	});
</script>



</html>
