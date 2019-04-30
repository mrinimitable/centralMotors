<!DOCTYPE html>

<%@page import="com.dto.BranchDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.BranchService"%>
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
		$('#transfer_date').datetimepicker();
	});

</script>


</head>
<body>


	<%@include file="include/header.jsp"%>


	<h2 style="text-align: center;">Transfer Vehicle</h2>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">


			<%
				int id = Integer.parseInt(request.getParameter("id") == null
													? "0"
													: request.getParameter("id"));
										
										int	update_status_id=8;

											int Vehicle_id = Integer.parseInt(request
													.getParameter("Vehicle_id") == null ? "0" : request
													.getParameter("Vehicle_id"));

											String cur_date = LogFileService
													.changeFormateOfCurrentDate("yyyy-MM-dd HH:mm");

											
											PurchaseService pur_service = new PurchaseService();

											PurchaseVehicleDto dto = pur_service.gePurchaseVehicleById(
													id, request, config);
			%>






			<form action="PurchaseServlet" enctype="multipart/form-data" id="new"
				method="post">


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


						<input type="text" name="vehical_id" id="vehical_id"
							value="<%=dto.getVehical_id()%>" class="form-control"
							readonly="readonly"> <input type="hidden" name="id"
							id="id" value="<%=id%>"> <input type="hidden"
							name="update_status_id" id="update_status_id"
							value="<%=update_status_id%>"> <input type="hidden"
							name="branch_id_fk_old" id="branch_id_fk_old"
							value="<%=dto.getBranch_id_fk()%>"> <input type="hidden"
							name="creator_id_fk" id="creator_id_fk" value="<%=creator_id%>">


					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label> Model</label>
					</div>
					<div class="col-md-6">


						<input type="text" name="model_name" id="model_name"
							value="<%=dto.getModel_name()%>" class="form-control"
							readonly="readonly"> <input type="hidden"
							name="model_id_fk" id="model_id_fk"
							value="<%=dto.getModel_id_fk()%>">



					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label> Varient</label>
					</div>
					<div class="col-md-6">


						<input type="text" name="variant_name" id="variant_name"
							value="<%=dto.getVariant_name()%>" class="form-control"
							readonly="readonly"> <input type="hidden"
							name="variant_id_fk" id="variant_id_fk"
							value="<%=dto.getVariant_id_fk()%>"> <input type="hidden"
							name="color_id_fk" id="color_id_fk"
							value="<%=dto.getColor_id_fk()%>"> <input type="hidden"
							name="color_name" id="color_name"
							value="<%=dto.getColor_name()%>">




					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Chechis No</label>
					</div>
					<div class="col-md-6">


						<input type="text" name="chechis_no" id="chechis_no"
							value="<%=dto.getChechis_no()%>" class="form-control"
							readonly="readonly">



					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Engine Number</label>
					</div>
					<div class="col-md-6">


						<input type="text" name="engine_number" id="engine_number"
							value="<%=dto.getEngine_number()%>" class="form-control"
							readonly="readonly">


					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">
					</br>

					<div class="col-md-2"></div>
					<div class="col-md-6" align="center">
						<label>TRANSFER INFO</label>
					</div>

				</div>


				<div class="col-md-12" style="padding: 0px;">
					</br>

					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Branch Name</label>
					</div>
					<div class="col-md-6">

						<select id="branch_id_fk" name="branch_id_fk" class="form-control"
							onblur="getBranchName();" onchange="getBranchName">
							<option value="">Select</option>
							<%
								BranchService mService=new BranchService();
																																	ArrayList<BranchDto>dlist=mService.getAllBranch(config, request);
																																	for(BranchDto mDto : dlist){
							%>
							<option value="<%=mDto.getId()%>"><%=mDto.getNAME()%></option>
							<%
								}
							%>

						</select> <input type="hidden" name="branch_name" id="branch_name">
					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">

					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label> Transfer Date</label>
					</div>
					<div class="col-md-6">
						<input type="text" name="transfer_date" id="transfer_date"
							placeholder="Date" value="<%=cur_date%>" class="form-control"
							readonly="readonly">



					</div>
				</div>

				<div class="col-md-12" style="padding: 0px; display: none;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label> Get pass no</label>
					</div>
					<div class="col-md-6">
						<input type="text" name="get_pass_no" id="get_pass_no"
							placeholder="get_pass_no" value="" class="form-control">


					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label> Driver Name</label>
					</div>
					<div class="col-md-6">
						<input type="text" name="driver_name" id="driver_name"
							placeholder="Driver Name" value="" class="form-control">


					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label> Reamrk</label>


					</div>
					<div class="col-md-6">
						<input type="text" name="transfer_reamrk" id="transfer_reamrk"
							placeholder="Transfer Reamrk" value="" class="form-control">


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


	
	
	function getBranchName(){
		
		var branch_name=$("#branch_id_fk :selected").text();  

		document.getElementById("branch_name").value = branch_name;
		
		
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
		
				



	</script>