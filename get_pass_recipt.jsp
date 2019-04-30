<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.PurchaseVehicleDto"%>
<%@page import="com.service.PurchaseService"%>
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

				PurchaseVehicleDto dto = pur_service.getGetpassById(id, request,
						config);
			%>


			<tr>
				<td><div>
						<input class="sbmit_blue" value="Print" onclick="printform()"
							type="button">
					</div>
					<div>
						<a href="report_purchase_vehicle.jsp"> <input value="Home"
							class="sbmit_blue" type="button">
						</a>
					</div></td>
			</tr>
		</tbody>
	</table>
	<div
		style="margin: 0 auto; width: 400px; font-family: 'Times New Roman', Times, serif;"
		id="wrapper">
		<div style="width: 100%; float: left; border: 1px solid;">


			<div style="float: left; width: 100%;">
				<div style="float: left; width: 100%;">
					<div
						style="width: 50%; float: left; font-size: 11px; color: #000; padding: 5px 5px 0;">




						<b></b>



					</div>
					<div
						style="width: 50%; float: left; font-size: 11px; text-align: right; color: #000; padding: 5px 5px 0;">
						<b>Mobile -</b><%=project_info_head_dto.getMobile()%>
					</div>
				</div>


				<div
					style="width: 100%; float: left; font-size: 20px; color: #000; text-align: center;">
					<img src="img/logo.png" width="40"
						style="margin: 5px; float: left;">



					<div style="width: 80%; float: left;">
						<b><%=project_info_head_dto.getShopname()%></b> <span
							style="font-size: 13px; width: 100%; float: left;">
							Address : <%=dto.getBranch_id_fk_old_name()%>


						</span> <span style="font-size: 13px; width: 100%; float: left;">
							<b>Get Pass</b>
						</span>

					</div>




				</div>



				<div
					style="float: left; width: 100%; line-height: 20px; border-top: 1px solid; padding: 1%;">


					<div style="float: left; width: 60%; font-size: 11px;">
						<!-- 	<b><u>RECEIVER INFO-</u><b> -->
						<div>
							<b>Veh Id:</b> <span style="text-transform: capitalize;"><%=dto.getVehical_id()%></span>
						</div>
						<div>
							<b></b>
						</div>
						<div style="width: 100%; float: left;">
							<span style="width: 60%; float: left;"><b>Driver Name:</b><%=dto.getDriver_name()%>
							</span>
						</div>


						<div>
							<span style="width: 60%; float: left;"><b>Remark : </b><%=dto.getTransfer_reamrk() == null ? "NA" : dto
					.getTransfer_reamrk()%> </span>
						</div>


					</div>


					<div style="width: 40%; font-size: 11px; float: right;">
						<!-- 	<b><u>INVOICE INFO-</u></b> -->
						<div>
							<b>Transfer Date: <%=LogFileService.changeFormate(dto.getTransfer_date(),
					"yyyy-MM-dd hh:mm", "dd-MM-yyyy hh:mm")%></b>



						</div>

						<div>
							<b>Get Pass No:</b>
							<%=dto.getId()%>

						</div>


					</div>


					<div style="width: 40%; font-size: 11px; float: right;">
						<b>Branch: <%=dto.getBranch_id_fk_old_name()%> To <%=dto.getBranch_name()%>
						</b>
						<div></div>



					</div>



				</div>

				<!--shop_name end-->
			</div>
			<!--head end-->

			<div style="width: 100%; float: left; min-height: 220px;">
				</br>

				<table style="width: 100%; border-bottom: 1px solid;" border="0"
					cellpadding="0" cellspacing="0">


					<thead>
						<tr style="font-weight: bold; border-top: 1px solid;">
							<th width="10%" valign="bottom"
								style="border-right: 1px solid; font-size: 13px; text-align: center; border-top: 1px solid;">1.</th>
							<th width="30%" valign="bottom"
								style="border-right: 1px solid; font-size: 13px; text-align: center; border-top: 1px solid;">
								Model</th>

							<th width="60%" valign="bottom"
								style="border-right: 1px solid; font-size: 12px; text-align: center; border-top: 1px solid;">
								<%=dto.getModel_name()%></th>



						</tr>

						<tr style="font-weight: bold; border-top: 1px solid;">
							<th width="5%" valign="bottom"
								style="border-right: 1px solid; font-size: 13px; text-align: center; border-top: 1px solid;">2.</th>
							<th width="20%" valign="bottom"
								style="border-right: 1px solid; font-size: 13px; text-align: center; border-top: 1px solid;">
								Varient</th>

							<th width="75%" valign="bottom"
								style="border-right: 1px solid; font-size: 12px; text-align: center; border-top: 1px solid;">
								<%=dto.getVariant_name()%>
							</th>


						</tr>

						</tr>

						<tr style="font-weight: bold; border-top: 1px solid;">
							<th width="5%" valign="bottom"
								style="border-right: 1px solid; font-size: 13px; text-align: center; border-top: 1px solid;">3.</th>
							<th width="20%" valign="bottom"
								style="border-right: 1px solid; font-size: 13px; text-align: center; border-top: 1px solid;">
								Chechis No</th>

							<th width="75%" valign="bottom"
								style="border-right: 1px solid; font-size: 12px; text-align: center; border-top: 1px solid;">
								<%=dto.getChechis_no()%>
							</th>

						</tr>

						</tr>

						<tr style="font-weight: bold; border-top: 1px solid;">
							<th width="5%" valign="bottom"
								style="border-right: 1px solid; font-size: 13px; text-align: center; border-top: 1px solid;">4.</th>
							<th width="20%" valign="bottom"
								style="border-right: 1px solid; font-size: 13px; text-align: center; border-top: 1px solid;">
								Engine Number</th>

							<th width="75%" valign="bottom"
								style="border-right: 1px solid; font-size: 12px; text-align: center; border-top: 1px solid;">
								<%=dto.getEngine_number()%>
							</th>

						</tr>
					</thead>

					</tbody>
				</table>




			</div>


			<div style="width: 100%; float: left; display: none;">
				<div class="col-md-12"
					style="border-top: 1px solid #999; padding-top: 5px;">


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


			<div style="width: 100%; float: left;">
				<div class="col-md-12" style="padding: 0px;">
					<br>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<div style="width: 100%; float: left; font-size: 11px;">
							<b> Signature</b>

						</div>
					</div>
					<div class="col-md-7 col-sm-7 col-xs-7">

						<div
							style="width: 100%; float: left; text-align: right; font-size: 11px;">
							<b> <%=project_info_head_dto.getSing()%>
							</b>

						</div>

						</br> </br>


						<div
							style="width: 100%; float: left; text-align: right; font-size: 11px;">
							<b> <%=project_info_head_dto.getSing()%> Signature
							</b>

						</div>
					</div>

				</div>
			</div>




			<div class="col-md-12" style="padding: 0px;"></div>





			<!--bill end-->
		</div>
	</div>

</body>
<script type="text/javascript">
	
</script>
</html>
