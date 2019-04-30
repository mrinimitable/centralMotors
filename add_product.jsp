<!DOCTYPE html>

<%@page import="com.dto.VariantDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.VariantService"%>
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
		$('#saleing_date').datetimepicker();
	});
</script>


</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Add Product</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

						<div class="right_side">
							<form action="ProductServlet" id="form1" method="post">






								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Variant</label>
									</div>
									<div class="col-md-6">
										<select name="cat_id_fk" id="cat_id_fk"
											class="form-control" onclick="getCatName();">
											<option value="">- Select -</option>


											<%
												VariantService service = new VariantService();
									
												ArrayList<VariantDto>list = service.getAllVariant(request, config); 
												
												for(VariantDto c_dto : list){
												
												
									%>
											<option value="<%=c_dto.getId()%>"><%=c_dto.getNAME() %></option>

											<%} %>
										</select>


									</div>
								</div>

								<div class="col-md-12" style="padding: 0px; display: none;">


									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Description</label>
									</div>
									<div class="col-md-6">

										<input type="text" id="Item_name" name="item_name"
											placeholder="Enter Item Name" class="form-control">


										
									</div>
								</div>


								<div class="col-md-12" style="padding: 0px; ">


									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Part Name</label>
									</div>
									<div class="col-md-6">

										<input type="text" id="Item_code" name="item_code"
											placeholder="Enter Item code" onblur="checkItemCode();"
											class="form-control"> <input type="hidden"
											name="accessories_item_id" id="accessories_item_id" value="0">
										<div id="codediv"></div>
										
										<input type="hidden" name="creator_id_fk" id="creator_id_fk"
											value="<%=creator_id %>"> <input type="hidden"
											name="cat_name" id="cat_name" value=""> 
											<input
											type="hidden" name="branch_id_fk" id="branch_id_fk"
											value="<%=branch_id %>">

										<div id="msgdiv"></div>
										

									</div>
								</div>





								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Price With Gst</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="gst_sale_price" id="gst_sale_price"
											class="form-control" value="0.0"
											onkeypress="return onlyNumberWithFloat(event)">



									</div>
								</div>






								<div class="col-md-12" style="padding: 0px; display: none;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>GST(%)</label>
									</div>
									<div class="col-md-6">
										<select name="gst_per" id="gst_per"
											class="form-control">
											
											<option value="0">0</option>
											<option value="5">5</option>
											<option value="12">12</option>

											<option value="18">18</option>
											<option value="28">28</option>

										</select>


									</div>
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
		$().ready(function() {

			$("#form1").validate({
				rules : {
					
					cat_id: "required",	
					item_name : "required",	
					item_code: "required",	
					p_price : "required",
					sale_price: "required",
					gst: "required",
					cess: "required",
					f_cess: "required",
					
					opening_qty: "required",
					limit: "required",
				},
				messages : {
					
					cat_id: "*",
										
					item_name : "*",	
					item_code: "*",	
					p_price : "*",
					sale_price: "*",
					gst: "*",
					opening_qty: "*",
					limit: "*",
				}
			});

		});
		
		
		
		
		
		
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
		
		
		function getCatName(){
			
			var cat_name=$("#cat_id_fk :selected").text();  

			document.getElementById("cat_name").value = cat_name;		
			
		}
		
		
	</script>

