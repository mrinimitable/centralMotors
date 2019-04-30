<!DOCTYPE html>

<%@page import="com.dto.AccessoriesDto"%>
<%@page import="com.service.AccessoriesService"%>
<%@page import="com.dto.OldVehicleDto"%>
<%@page import="com.service.OldVehicleService"%>
<%@page import="com.dto.ModelDto"%>
<%@page import="com.dto.FinanceBankDto"%>
<%@page import="com.service.FinanceBankService"%>
<%@page import="com.dto.AdminRagistrationDto"%>
<%@page import="com.service.AdminRagistrationService"%>
<%@page import="com.dto.ColorDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.ColorService"%>
<%@page import="com.service.ModelService"%>
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
		$('#billing_date').datetimepicker();
	});
	

</script>





</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Sale Old Vehicle</h3>


	<div id="rev"></div>
	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">


			<%
				int id = Integer.parseInt(request.getParameter("id") == null
						? "0"
						: request.getParameter("id"));

				String cur_date = LogFileService
						.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");

				AccessoriesService pur_service = new AccessoriesService();

				AccessoriesDto dto = pur_service.getAllAccessoriesByID(id, request,
						config);
			%>

			<div class="right_side">

				<form action="AccessoriesServlet" id="new" method="post">


					<div class="col-md-12" style="padding: 0px;">
						</br>

						<div class="col-md-2"></div>
						<div class="col-md-6" align="center">
							<label>VEHICLE INFO</label>
						</div>

					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Date</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="saleing_date" id="saleing_date"
								placeholder="saleing_date" value="<%=dto.getIn_date()%>"
								class="form-control" readonly="readonly"> <input
								type="hidden" name="creator_id_fk_billing"
								id="creator_id_fk_billing" value="<%=creator_id%>"> <input
								type="hidden" name="session_year_billing"
								id="session_year_billing" value="<%=session_year%>"> <input
								type="hidden" name="id" id="id" value="<%=id%>"> <input
								type="hidden" name="update_status_id" id="update_status_id"
								value="1">



						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Model </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="exchange_vehicle_name"
								id="exchange_vehicle_name" placeholder="Enter Exchange Vehicle"
								value="<%=dto.getModel_name()%>" class="form-control"
								readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Variant</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="" id="" placeholder="Variant"
								value="<%=dto.getVariant_name()%>" class="form-control"
								readonly="readonly">



						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Accessories Price </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="" id="" placeholder="Enter "
								value="<%=dto.getAccessories_price()%>" class="form-control"
								onblur="getfinal_price();" readonly="readonly">



						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Customer Name</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="" id=""
								placeholder="Enter Customer Name"
								value="<%=dto.getCustmer_name()%>" class="form-control"
								readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Mobile No</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="" id="" placeholder=" Enter Mobile No."
								value="<%=dto.getMobile_no()%>" class="form-control"
								readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Address</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="customer_address" id="customer_address"
								placeholder="Enter Address" value="<%=dto.getAddress()%>"
								class="form-control" readonly="readonly">


						</div>
					</div>




					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Bill No</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="bill_no" id="bill_no"
								placeholder="Enter  Bill No " value="" class="form-control"
								style="background: #ffcbcb">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Bill Amount.</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="bill_price" id="bill_price"
								placeholder="Enter Bill Amount" value="" class="form-control"
								style="background: #ffcbcb">



						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Billing Date </label>
						</div>
						<div class="col-md-6">
							<input type="text" name="billing_date" id="billing_date"
								placeholder="Enter Billing Date" value="<%=cur_date%>"
								class="form-control" style="background: #ffcbcb"
								readonly="readonly">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-5">&nbsp;</div>
						<div class="col-md-7">
							<input type="submit" name="submit" id="submit" value="Submit"
								class="submit"
								onclick="return confirm('Are you sure to Submit Info ?')"
								style="margin-bottom: 10px;">
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
					
				},
				
				
				 myselect:
				 { required: true }
				
				
				
			});

		});
		
					
			

	</script>