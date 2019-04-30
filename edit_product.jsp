<!DOCTYPE html>

<%@page import="com.dto.ProductDto"%>
<%@page import="com.service.ProductService"%>
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


	<h3 style="text-align: center;">Update Product</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

			<div class="right_side">



				<%
					int id = Integer.parseInt(request.getParameter("id") == null ? "0"
												: request.getParameter("id"));

													ProductService pservice = new ProductService();

												ProductDto p_dto = pservice.getProductInfoById(id, config, request);
				%>








				<form action="ProductServlet" id="form1" method="post">





					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Model</label>
						</div>
						<div class="col-md-6">
							<select name="cat_id_fk" id="cat_id_fk" class="form-control"
								onclick="getCatName();">
								<option value="">- Select -</option>


								<%
									VariantService d_service = new VariantService();
																	ArrayList<VariantDto> d_list = d_service.getAllVariant(request, config);
																	for (VariantDto d_dto : d_list) {
								%>


								<option
									<%if (p_dto.getCat_id_fk() == d_dto.getId()) {
					out.print("Selected='selected'");
				}%>
									value="<%=d_dto.getId()%>"><%=d_dto.getNAME()%></option>

								<%
									}
								%>

							</select>


						</div>
					</div>

					<div class="col-md-12" style="padding: 0px; display: none;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Description</label>
						</div>
						<div class="col-md-6">

							<input type="text" id="item_name" name="item_name"
								placeholder="Enter Item Name" onblur="checkProductName();"
								class="form-control" value="<%=p_dto.getItem_name()%>">


						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Part No</label>
						</div>
						<div class="col-md-6">

							<input type="text" id="Item_code" name="item_code"
								placeholder="Enter Item code" class="form-control"
								value="<%=p_dto.getItem_code()%>"> <input type="hidden"
								name="item_id" id="item_id" value="<%=p_dto.getItem_id()%>">
							<input type="hidden" name="creator_id_fk" id="creator_id_fk"
								value="<%=p_dto.getCreator_id_fk()%>"> <input
								type="hidden" name="cat_name" id="cat_name" value="">

							<div id="msgdiv"></div>
						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Price With Gst</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="gst_sale_price" id="gst_sale_price"
								class="form-control" value="<%=p_dto.getGst_sale_price()%>"
								onkeypress="return onlyNumberWithFloat(event)">



						</div>
					</div>





					<div class="col-md-12" style="padding: 0px; display: none;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>GST(%)</label>
						</div>
						<div class="col-md-6">
							<select name="gst_per" id="gst_per" class="form-control">
								<option value="">- Select -</option>
								<option
									<%if (p_dto.getGst_per() == 0.0) {
				out.print("Selected ='selected'");
			}%>
									value="0.0">0</option>
								<option
									<%if (p_dto.getGst_per() == 5.0) {
				out.print("Selected ='selected'");
			}%>
									value="5.0">5</option>
								<option
									<%if (p_dto.getGst_per() == 12.0) {
				out.print("Selected ='selected'");
			}%>
									value="12.0">12</option>

								<option
									<%if (p_dto.getGst_per() == 18.0) {
				out.print("Selected ='selected'");
			}%>
									value="18.0">18</option>
								<option
									<%if (p_dto.getGst_per() == 28.0) {
				out.print("Selected ='selected'");
			}%>
									value="28.0">28</option>

							</select>


						</div>
					</div>




					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Status</label>
						</div>
						<div class="col-md-6">
							<select name="item_status" id="item_status" class="form-control">

								<option value="">-- Select--</option>
								<option value="active"
									<%if (p_dto.getItem_status().equals("active")) {
					out.print("selected='selected'");
				}%>>Active</option>
								<option value="block"
									<%if (p_dto.getItem_status().equals("block")) {
					out.print("selected='selected'");
				}%>>Block</option>


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
					
					cat_id : "required",	
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
					
					cat_id : "*",
										
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
		
		
function checkProductName(){
			
			var Item_name = document.getElementById("Item_name").value;

		
			$.ajax({
				  
				url : 'CheckItemnameAjx.jsp',
				data : 'Item_name=' + Item_name,
				type : 'post',
				
				success : function(msg) {
				
					$('#Item_name').html(msg);
					 var checked = document.getElementById("checked").value;
					 if(checked == "done"){
					
		 
					 document.getElementById("Item_name").value="";
					// $('#msgdiv').html("category already axist");
					 
					 var newDiv = document.createElement('div');
					 $("#msgdiv").html(newDiv.innerHTML ="<div class='form-group' ><div class='alert alert-warning alert-dismissible fade in text-center text-capitalize' id='forMsgDisplay' style='display: block; margin-bottom: 0px; margin-top:0px'> Item already axist <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div></div>");		 
					 
					 
					 }
				}
			});
			
			
			
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
		
		
	function getCatName(){
			
			var cat_name=$("#cat_id_fk :selected").text();  

			document.getElementById("cat_name").value = cat_name;		
			
		}
		
		
		
		
		
	</script>