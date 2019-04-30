<!DOCTYPE html>

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
		$('#receive_adhar_card_date').datetimepicker();
	});
	
	$(function() {
		$('#receive_pan_card_date').datetimepicker();
	});
	
	$(function() {
		$('#receive_paichay_patr_date').datetimepicker();
	});
	
	$(function() {
		$('#receive_photo_date').datetimepicker();
	});
</script>






</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Collect Paper To Customer</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

						<div class="right_side">
							
							
							<form action="RtoPaperServlet" enctype="multipart/form-data"
								id="new" method="post">



								<%
									String cur_date = LogFileService
											.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");

									int id = Integer.parseInt(request.getParameter("id") == null
											? "0"
											: request.getParameter("id"));

									PurchaseService pur_service = new PurchaseService();

									PurchaseVehicleDto dto = pur_service.gePurchaseVehicleById(id,
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
										<label> Vehicle ID</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getVehical_id()%>"
											class="form-control" readonly="readonly"> <input
											type="hidden" name="Vehicle_id_fk" id="Vehicle_id_fk"
											value="<%=id%>"> <input type="hidden"
											name="creator_id_fk" id="creator_id_fk"
											value="<%=creator_id%>"> <input type="hidden"
											name="session" id="session" value="<%=session_year%>">

										<input type="hidden" name="branch_id_fk" id="branch_id_fk"
											value="<%=branch_id%>"> <input type="hidden"
											name="curr_date" id="curr_date" value="<%=cur_date%>">



									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Model</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getModel_name()%>"
											class="form-control" readonly="readonly">




									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Varient</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getVariant_name()%>"
											class="form-control" readonly="readonly">




									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Chechis No</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getChechis_no()%>"
											class="form-control" readonly="readonly">



									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Engine Number</label>
									</div>
									<div class="col-md-6">


										<input type="text" value="<%=dto.getEngine_number()%>"
											class="form-control" readonly="readonly">


									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									</br>

									<div class="col-md-2"></div>
									<div class="col-md-6" align="center">
										<label>Collect Paper To Customer </label>
									</div>

								</div>







								<div class="col-md-12" style="padding: 0px;">
									</br>

									<div class="col-md-1"></div>

									<div class="col-md-2">
										<label> Adhar Card</label>
									</div>
									<div class="col-md-1">
										<input type="checkbox" name="receive_adhar_card"
											id="receive_adhar_card" onchange="getcurrent_value(this);"
											onblur="getcurrent_value(this);" value="yes"
											onclick="findTotal();" />





									</div>

									<div class="col-md-2">
										<input type="text" name="receive_adhar_card_date"
											id="receive_adhar_card_date" placeholder="Date" value=""
											class="form-control" readonly="readonly">

									</div>


									<div class="col-md-2">
										<label> Pan Card</label>
									</div>
									<div class="col-md-1">
										<input type="checkbox" name="receive_pan_card"
											id="receive_pan_card" onchange="getcurrent_value1(this);"
											onblur="getcurrent_value1(this);" value="yes"
											onclick="findTotal();" />



									</div>

									<div class="col-md-2">
										<input type="text" name="receive_pan_card_date"
											id="receive_pan_card_date" placeholder="Date" value=""
											class="form-control" readonly="readonly">

									</div>





								</div>




								<div class="col-md-12" style="padding: 0px;">

									<div class="col-md-1"></div>

									<div class="col-md-2">
										<label> Paichay Patr </label>
									</div>
									<div class="col-md-1">
										<input type="checkbox" name="receive_paichay_patr"
											id="receive_paichay_patr" onchange="getcurrent_value2(this);"
											onblur="getcurrent_value2(this);" value="yes"
											onclick="findTotal();" />



									</div>

									<div class="col-md-2">
										<input type="text" name="receive_paichay_patr_date"
											id="receive_paichay_patr_date" placeholder="Date" value=""
											class="form-control" readonly="readonly">

									</div>


									<div class="col-md-2">
										<label> 2 Photo</label>
									</div>
									<div class="col-md-1">
										<input type="checkbox" name="receive_photo" id="receive_photo"
											value="yes" onchange="getcurrent_value3(this);"
											onblur="getcurrent_value3(this);" onclick="findTotal();" />



									</div>

									<div class="col-md-2">
										<input type="text" name="receive_photo_date"
											id="receive_photo_date" placeholder="Date" value=""
											class="form-control" readonly="readonly">

									</div>




								</div>
																						
													
								
								
								<div class="col-md-12" style="padding: 0px;">

									<div class="col-md-1"></div>

									<div class="col-md-2">
										<label> Adhar No </label>
									</div>
								

									<div class="col-md-3">
										<input type="text" name="adhar_no"
											id="adhar_no" placeholder="adhar_no" value=""
											class="form-control" >

									</div>


									<div class="col-md-2">
										<label>Pan Card No</label>
									</div>
									

									<div class="col-md-3">
										<input type="text" name="pan_card_no"
											id="pan_card_no" placeholder="pan_card_no" value=""
											class="form-control" >

									</div>




								</div>
								
								
									<div class="col-md-12" style="padding: 0px;">
									</br>
									<div class="col-md-3"></div>
									<div class="col-md-2">
										<label> Image(ZIp File)</label>
									</div>
									<div class="col-md-6">
										<input type="file" name="file" id="file">



									</div>
								</div>




								<div class="col-md-12" style="padding: 0px;">
								</br>
									<div class="col-md-5">&nbsp;</div>
									<div class="col-md-7">
										<input type="submit" name="submit" id="submit" value="Submit"
											class="submit" style="margin-bottom: 10px;">
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





	<script>


	
	function getcity() {

		var state_id = document.getElementById("state_id").value;
		
		$.ajax({

			url : 'GetCityajx.jsp',
			data : 'state_id=' + state_id,
			type : 'post',
			success : function(msg) {

				$('#city_id').html(msg);

			}

		});

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
			
		
		
		

		function getModelName(){
			
			var model_Name=$("#model_id :selected").text();  

			document.getElementById("modelName").value = model_Name;
			
			
		}
		
	

	
	
	function getcurrent_value(id){
		
		
		var curr_date= document.getElementById("curr_date").value;
		
		 //alert(curr_date);
		
		  if(id.checked) {
			  
			  
			  document.getElementById("receive_adhar_card_date").value = curr_date;
			 
			  
		    // alert('checked');
		     
		  }
		  
		  else{
			  		
			  
			  document.getElementById("receive_adhar_card_date").value = '';
			 
		  }
		  
		  
		  
		  
		}
	
	
	function getcurrent_value1(id){
		
		
		var curr_date= document.getElementById("curr_date").value;
		
		 //alert(curr_date);
		
		  if(id.checked) {		  
			  
			  document.getElementById("receive_pan_card_date").value = curr_date;
			  
			  	   
		     
		  }
		  
		  else{
			  
					  
			  document.getElementById("receive_pan_card_date").value = '';
			 
		  }
		  
		  
		  
		  
		}
	
	
	function getcurrent_value2(id){
		
		
		var curr_date= document.getElementById("curr_date").value;
		
		 //alert(curr_date);
		
		  if(id.checked) {		  
			  
			  document.getElementById("receive_paichay_patr_date").value = curr_date;
			  
			  	   
		     
		  }
		  
		  else{
			  
					  
			  document.getElementById("receive_paichay_patr_date").value = '';
			 
		  }
		  
		  
		  
		  
		}
	
	
	function getcurrent_value3(id){
		
		
		var curr_date= document.getElementById("curr_date").value;
		
		 //alert(curr_date);
		
		  if(id.checked) {		  
			  
			  document.getElementById("receive_photo_date").value = curr_date;
			  
			  	   
		     
		  }
		  
		  else{
			  
					  
			  document.getElementById("receive_photo_date").value = '';
			 
		  }
		  
		  
		  
		  
		}








	</script>

