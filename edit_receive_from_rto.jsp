<!DOCTYPE html>

<%@page import="com.dto.RtoPaperDto"%>
<%@page import="com.service.RtoPaperService"%>
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
	$(function() {
		$('#send_adhar_card_date').datetimepicker();
	});
	$(function() {
		$('#send_pan_card_date').datetimepicker();
	});
	$(function() {
		$('#send_paichay_patr_date').datetimepicker();
	});
	
	$(function() {
		$('#send_photo_date').datetimepicker();
	});
	
	
	$(function() {
		$('#receive_rc_date').datetimepicker();
	});
	
	$(function() {
		$('#receive_permit_date').datetimepicker();
	});
	
	
	$(function() {
		$('#receive_fitness_date').datetimepicker();
	});
	
	$(function() {
		$('#send_rc_date').datetimepicker();
	});
	
	$(function() {
		$('#send_permit_date').datetimepicker();
	});
	
	$(function() {
		$('#send_fitness_date').datetimepicker();
	});
	
	
	
	$(function() {
		$('#send_fitness_date').datetimepicker();
	});
	
	$(function() {
		$('#dispatch_rc_date').datetimepicker();
	});
	
	$(function() {
		$('#dispatch_permit_date').datetimepicker();
	});
	
	$(function() {
		$('#dispatch_fitness_date').datetimepicker();
	});
</script>



</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Receive From Rto</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

						<div class="right_side">
							<form action="RtoPaperServlet" enctype="multipart/form-data"
								id="new" method="post">





								<%
									int id = Integer.parseInt(request.getParameter("id") == null
											? "0"
											: request.getParameter("id"));

									int Vehicle_id = Integer.parseInt(request
											.getParameter("Vehicle_id") == null ? "0" : request
											.getParameter("Vehicle_id"));

									String cur_date = LogFileService
											.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");

									RtoPaperService pur_service = new RtoPaperService();

									RtoPaperDto dto = pur_service.getAllRtoPaperById(id, request,
											config);
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


										<input type="text" value="<%=dto.getVehicle_id()%>"
											class="form-control" readonly="readonly"> <input
											type="hidden" value="<%=id%>" name="id"> <input
											type="hidden" name="curr_date" id="curr_date"
											value="<%=cur_date%>"> <input type="hidden"
											name="update_status_id" id="update_status_id" value="3">







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
										<label>Collect Paper To Rto </label>
									</div>

								</div>




								<div class="col-md-12" style="padding: 0px;">
									</br>



									<div class="col-md-1">
										<label> RC</label>
									</div>









									<%
										if ("yes".equals(dto.getReceive_rc())) {
									%>


									<div class="col-md-1">
										<input type="checkbox" name="receive_rc" id="receive_rc"
											value="yes"
											<%if ("yes".equals(dto.getReceive_rc())) {
					out.print("Checked='checked'");
				}%>
											onchange="getcurrent_value(this);"
											onblur="getcurrent_value(this);" onclick="return false;" />



									</div>


									<%
										} else {
									%>



									<div class="col-md-1">
										<input type="checkbox" name="receive_rc" id="receive_rc"
											value="yes"
											<%if ("yes".equals(dto.getReceive_rc())) {
					out.print("Checked='checked'");
				}%>
											onchange="getcurrent_value(this);"
											onblur="getcurrent_value(this);" />



									</div>



									<%
										}
									%>





									<div class="col-md-2">
										<input type="text" name="receive_rc_date" id="receive_rc_date"
											placeholder="Date" value="<%=dto.getReceive_rc_date()%>"
											class="form-control" readonly="readonly">

									</div>



									<div class="col-md-1">
										<label> Permit</label>
									</div>







									<%
										if ("yes".equals(dto.getReceive_permit())) {
									%>

									<div class="col-md-1">
										<input type="checkbox" name="receive_permit"
											id="receive_permit" value="yes"
											<%if ("yes".equals(dto.getReceive_permit())) {
					out.print("Checked='checked'");
				}%>
											onchange="getcurrent_value1(this);"
											onblur="getcurrent_value1(this);" onclick="return false;" />



									</div>


									<%
										} else {
									%>



									<div class="col-md-1">
										<input type="checkbox" name="receive_permit"
											id="receive_permit" value="yes"
											<%if ("yes".equals(dto.getReceive_permit())) {
					out.print("Checked='checked'");
				}%>
											onchange="getcurrent_value1(this);"
											onblur="getcurrent_value1(this);" />



									</div>



									<%
										}
									%>

									<div class="col-md-2">
										<input type="text" name="receive_permit_date"
											id="receive_permit_date" placeholder="Date"
											value="<%=dto.getReceive_permit_date()%>"
											class="form-control" readonly="readonly">

									</div>


									<div class="col-md-1">
										<label> Fitness</label>
									</div>





									<%
										if ("yes".equals(dto.getReceive_fitness())) {
									%>

									<div class="col-md-1">
										<input type="checkbox" name="receive_fitness"
											id="receive_fitness" value="yes"
											<%if ("yes".equals(dto.getReceive_fitness())) {
					out.print("Checked='checked'");
				}%>
											onchange="getcurrent_value2(this);"
											onblur="getcurrent_value2(this);" onclick="return false;" />




									</div>


									<%
										} else {
									%>



									<div class="col-md-1">
										<input type="checkbox" name="receive_fitness"
											id="receive_fitness" value="yes"
											<%if ("yes".equals(dto.getReceive_fitness())) {
					out.print("Checked='checked'");
				}%>
											onchange="getcurrent_value2(this);"
											onblur="getcurrent_value2(this);" />




									</div>



									<%
										}
									%>

									<div class="col-md-2">
										<input type="text" name="receive_fitness_date"
											id="receive_fitness_date" placeholder="Date"
											value="<%=dto.getReceive_fitness_date()%>"
											class="form-control" readonly="readonly">

									</div>





								</div>



								<div class="col-md-12" style="padding: 0px;">

									<div class="col-md-1"></div>

									<div class="col-md-2">
										<label> Rc No </label>
									</div>








									<%
										if ("".equals(dto.getRc_no())) {
									%>



									<div class="col-md-3">
										<input type="text" name="rc_no" id="rc_no" placeholder="rc_no"
											value="<%=dto.getRc_no()%>" class="form-control">



									</div>


									<%
										} else {
									%>


									<div class="col-md-3">
										<input type="text" name="rc_no" id="rc_no" placeholder="rc_no"
											value="<%=dto.getRc_no()%>" class="form-control"
											readonly="readonly">



									</div>



									<%
										}
									%>




									<div class="col-md-2">
										<label>Permit No</label>
									</div>







									<%
										if ("".equals(dto.getPermit_no())) {
									%>



									<div class="col-md-3">
										<input type="text" name="permit_no" id="permit_no"
											placeholder="permit_no" value="<%=dto.getPermit_no()%>"
											class="form-control">

									</div>



									<%
										} else {
									%>


									<div class="col-md-3">
										<input type="text" name="permit_no" id="permit_no"
											placeholder="permit_no" value="<%=dto.getPermit_no()%>"
											class="form-control" readonly="readonly">

									</div>








									<%
										}
									%>





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

	<script>		
		



function getcurrent_value(id){
	
	
	var curr_date= document.getElementById("curr_date").value;
	
	 //alert(curr_date);
	
	  if(id.checked) {
		  
		  
		  document.getElementById("receive_rc_date").value = curr_date;
		 
		  
	    // alert('checked');
	     
	  }
	  
	  else{
		  		
		  
		  document.getElementById("receive_rc_date").value = '';
		 
	  }
	  
	  
	  
	  
	}
	
	


function getcurrent_value1(id){
	
	
	var curr_date= document.getElementById("curr_date").value;
	
	 //alert(curr_date);
	
	  if(id.checked) {		  
		  
		  document.getElementById("receive_permit_date").value = curr_date;
		  
		  	   
	     
	  }
	  
	  else{
		  
				  
		  document.getElementById("receive_permit_date").value = '';
		 
	  }
	  
	  
	  
	  
	}


function getcurrent_value2(id){
	
	
	var curr_date= document.getElementById("curr_date").value;
	
	 //alert(curr_date);
	
	  if(id.checked) {		  
		  
		  document.getElementById("receive_fitness_date").value = curr_date;
		  
		  	   
	     
	  }
	  
	  else{
		  
				  
		  document.getElementById("receive_fitness_date").value = '';
		 
	  }
	  
	  
	  
	  
	}



	
		
		
	</script>




	<script>


	
	




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
		

		
		
		
		

		function getRtoName(){
			
			var rto_name=$("#rto_id_fk :selected").text();  

			document.getElementById("rto_name").value = rto_name;
			
			
		}









	</script>
