<!DOCTYPE html>

<%@page import="com.dto.ColorDto"%>
<%@page import="com.service.ColorService"%>
<%@page import="com.dto.ModelDto"%>
<%@page import="com.service.ModelService"%>
<%@page import="com.dto.DistributorDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.DistributorService"%>
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
		$('#purchase_date').datetimepicker();
	});

</script>


</head>
<body>


	<%@include file="include/header.jsp"%>


	<h2 style="text-align: center;">Purchase Vehicle</h2>


	<div id="rev"></div>
	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">


			<form action="PurchaseServlet" enctype="multipart/form-data"
				id="form1" method="post">

				<%
					String cur_date = LogFileService
									.changeFormateOfCurrentDate("yyyy-MM-dd HH:mm");
				%>



				<div class="col-md-12" style="padding: 0px;">


					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Distributor name *</label>
					</div>
					<div class="col-md-6">

						<select id="distributor_id_fk" name="distributor_id_fk"
							class="form-control" onblur="getdistributernameName();"
							onchange="getdistributernameName();">
							<option value="0">Select</option>
							<%
								DistributorService dService=new DistributorService();
												ArrayList<DistributorDto>dlist=dService.getAllDistributor(config, request);
											for(DistributorDto mDto : dlist){
							%>
							<option value="<%=mDto.getId()%>"><%=mDto.getNAME()%></option>
							<%
								}
							%>

						</select>

					</div>
				</div>




				<div class="col-md-12" style="padding: 0px;">


					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Model *</label>
					</div>

					<div class="col-md-6">

						<select id="model_id_fk" name="model_id_fk" class="form-control"
							onblur="getModelName();getVariant();"
							onchange="getModelName();getVariant();">
							<option value="">Select</option>
							<%
								ModelService mService=new ModelService();
									ArrayList<ModelDto>mlist=mService.getAllModel(config, request);
							for(ModelDto mDto : mlist){
							%>
							<option value="<%=mDto.getId()%>"><%=mDto.getNAME()%></option>
							<%
								}
							%>

						</select> <input type="hidden" name="creator_id_fk" id="creator_id_fk"
							value="<%=creator_id%>"> <input type="hidden"
							name="session" id="session" value="<%=session_year%>"> <input
							type="hidden" name="model_name" id="model_name"> <input
							type="hidden" name="distributor_name" id="distributor_name">
						<input type="hidden" name="color_name" id="color_name"> <input
							type="hidden" name="branch_id_fk" id="branch_id_fk"
							value="<%=branch_id%>">
					</div>
				</div>



				<div class="col-md-12" style="padding: 0px;">


					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Variant *</label>
					</div>
					<div class="col-md-6">

						<select id="variant_id_fk" name="variant_id_fk"
							onblur="getVariantName(),getVariantPrice()" class="form-control">
							<option value="">Select</option>

						</select>

					</div>


					<input type="hidden" name="variant_name" id="variant_name">


					<input type="hidden" name="sale_price" id="varientPrice"> <input
						type="hidden" name="Variant_corporate_bonus_amount"
						id="variant_corporate_bonus_amount"> <input type="hidden"
						name="Variant_lottery_bonus_amount"
						id="variant_lottery_bonus_amount"> <input type="hidden"
						name="Variant_exchange_bonus_amount"
						id="variant_exchange_bonus_amount"> <input type="hidden"
						name="showroom_price" id="showroom_price"> <input
						type="hidden" name="rto_tax_price" id="rto_tax_price"> <input
						type="hidden" name="insurance_price" id="insurance_price">
					<input type="hidden" name="gst_per" id="gst_per"> <input
						type="hidden" name="cess_per" id="cess_per"> <input
						type="hidden" name="tcs_per" id="tcs_per"> <input
						type="hidden" name="handling_charges" id="handling_charges">
					<input type="hidden" name="tcs_amount" id="tcs_amount"> <input
						type="hidden" name="rsa_amount" id="rsa_amount"> <input
						type="hidden" name="extended_warranty_amount"
						id="extended_warranty_amount"> <input type="hidden"
						name="other_charges" id="other_charges"> <input
						type="hidden" name="showroom_gross_price"
						id="showroom_gross_price"> <input type="hidden"
						name="consumer_schemes" id="consumer_schemes">






				</div>




				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label> Vehicle ID *</label>
					</div>
					<div class="col-md-6">



						<input name="vehical_id" id="vehical_id" class="form-control"
							placeholder="Enter Vehicle_id " required="required" />



					</div>
				</div>






				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Chechis No *</label>
					</div>
					<div class="col-md-6">
						<input type="text" name="chechis_no" id="chechis_no"
							class="form-control" placeholder="Enter Chechis No"
							required="required">



					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Engine Number *</label>
					</div>
					<div class="col-md-6">
						<input type="text" name="engine_number" id="engine_number"
							class="form-control" placeholder="Enter engine_number">



					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">


					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Color *</label>
					</div>
					<div class="col-md-6">

						<select id="color_id_fk" name="color_id_fk"
							onblur="getcolourName();" class="form-control">
							<option value="">Select</option>
							<%
								ColorService cService=new ColorService();
																																ArrayList<ColorDto> clist=cService.getAllColor(config, request);
																																for(ColorDto mDto : clist){
							%>
							<option value="<%=mDto.getId()%>"><%=mDto.getNAME()%></option>
							<%
								}
							%>

						</select>
					</div>
				</div>



				<div class="col-md-12" style="padding: 0px;">


					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Damage Vehicle</label>
					</div>
					<div class="col-md-6">

						<select id="vehicle_status" name="vehicle_status"
							class="form-control">
							<option value="Purchase">No</option>
							<option value="Damage">Yes</option>


						</select>
					</div>
				</div>





				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Purchase Date</label>
					</div>
					<div class="col-md-6">
						<input type="text" name="purchase_date" id="purchase_date"
							placeholder="Date" value="<%=cur_date%>" class="form-control">



					</div>
				</div>



				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-5">&nbsp;</div>
					<div class="col-md-7">
						<input type="submit" name="submit" id="submit" value="Submit"
							class="submit"
							onclick="return confirm('Are you sure to Submit Info ?')">
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
		$(function() {
			$("#purchase_date").datepicker({
				changeMonth : true,
				changeYear : true
			});
		});
		
		
	</script>





	<script type="text/javascript">
	
			

			$().ready(function() {

				
				 $('#form1').validate({ // initialize the plugin
				      
					 rules: {
				        	
						 distributor_id_fk: {
							 
				                selectcheck: true
				                
				            }
				        }
				    });

				    jQuery.validator.addMethod('selectcheck', function (value) {
				        return (value != '0');
				    }, "Distributor name required");

			});
		
			
		

		function checkItemCode(){
					
					var Item_code = document.getElementById("Item_code").value;

				
					$.ajax({
						  
						url : 'CheckItemCodeeAjx.jsp',
						data : 'Item_code=' + Item_code,
						type : 'post',
						
						success : function(msg) {
						
							$('#Item_code').html(msg);
							 var checked = document.getElementById("check").value;
							 if(checked == "value"){
							
				 
							 document.getElementById("Item_code").value="";
							// $('#msgdiv').html("category already axist");
							 
							 var newDiv = document.createElement('div');
							 $("#codediv").html(newDiv.innerHTML ="<div class='form-group' ><div class='alert alert-warning alert-dismissible fade in text-center text-capitalize' id='forMsgDisplay' style='display: block; margin-bottom: 0px; margin-top:0px'> Itemcode already exist <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div></div>");		 
							 
							 
							 }
						}
					});				
					
					
				}	

	</script>


	<script>
	
	
	
	
	

function getModelName(){
	
	var model_name=$("#model_id_fk :selected").text();  

	document.getElementById("model_name").value = model_name;
	
	
}

function getcolourName(){
	
	var color_name=$("#color_id_fk :selected").text();  

	document.getElementById("color_name").value = color_name;
	
	
}



function getdistributernameName(){
	
	var distributor_name=$("#distributor_id_fk :selected").text();  

	document.getElementById("distributor_name").value = distributor_name;
	
	
}


function getVariantName(){
	
	var variant_name=$("#variant_id_fk :selected").text();  

	document.getElementById("variant_name").value = variant_name;
	
	
}

	function getVariant(){
		
		
		var model_id_fk = document.getElementById("model_id_fk").value;
		
		$.ajax({
			
			url : 'getVariantAjax.jsp',
			data : 'model_id_fk='+ model_id_fk,
			type : 'post',
			
			
			success  : function(msg){
				
				
				$('#variant_id_fk').html(msg);
				 
			
				
			}
			
		});
		
		
	}
	
	
	
	
function getVariantPrice(){
		
		
		var variant_id_fk = document.getElementById("variant_id_fk").value;
		
		
		
		$.ajax({
			
			url : 'getVariantPriceAjax.jsp',
			data : 'variant_id_fk='+ variant_id_fk,
			type : 'post',		
			
			success  : function(msg){
				
				
				$('#abcd').html(msg);
				//alert(msg);
				
				 
				var varientPrice = document.getElementById("price_a").value;
				var Exchange_bonus_amount = document.getElementById("variant_exchange_bonus_amount_a").value;
				var Lottery_bonus_amount = document.getElementById("variant_lottery_bonus_amount_a").value;
				var Corporate_bonus_amount = document.getElementById("variant_corporate_bonus_amount_a").value;	
				
				
				var showroom_price = document.getElementById("showroom_price_a").value;
				var rto_tax_price = document.getElementById("rto_tax_price_a").value;
				var insurance_price = document.getElementById("insurance_price_a").value;	
				
				var gst_per = document.getElementById("gst_per_a").value;
				var cess_per = document.getElementById("cess_per_a").value;
			
				
				var tcs_per = document.getElementById("tcs_per_a").value;
				var handling_charges = document.getElementById("handling_charges_a").value;
				var tcs_amount = document.getElementById("tcs_amount_a").value;	
						
				
				
				var rsa_amount = document.getElementById("rsa_amount_a").value;
				var extended_warranty_amount = document.getElementById("extended_warranty_amount_a").value;
				var other_charges = document.getElementById("other_charges_a").value;	
				
				var showroom_gross_price = document.getElementById("showroom_gross_price_a").value;
				
				var consumer_schemes = document.getElementById("consumer_schemes_a").value;
				
				
																						
				document.getElementById("varientPrice").value = varientPrice;				
				document.getElementById("variant_exchange_bonus_amount").value = Exchange_bonus_amount;
				document.getElementById("variant_lottery_bonus_amount").value = Lottery_bonus_amount;
				document.getElementById("variant_corporate_bonus_amount").value = Corporate_bonus_amount;				
				
				document.getElementById("showroom_price").value = showroom_price;
				document.getElementById("rto_tax_price").value = rto_tax_price;
				document.getElementById("insurance_price").value = insurance_price;				
				document.getElementById("gst_per").value = gst_per;
				document.getElementById("cess_per").value = cess_per;
				
				document.getElementById("tcs_per").value = tcs_per;				
				document.getElementById("handling_charges").value = handling_charges;
				document.getElementById("tcs_amount").value = tcs_amount;
				
				document.getElementById("rsa_amount").value = rsa_amount;				
				document.getElementById("extended_warranty_amount").value = extended_warranty_amount;
				document.getElementById("other_charges").value = other_charges;
				
				document.getElementById("showroom_gross_price").value = showroom_gross_price;
				document.getElementById("consumer_schemes").value = consumer_schemes;
					
				
						
								
				
			}
			
		});
		
		
	}
	
	</script>