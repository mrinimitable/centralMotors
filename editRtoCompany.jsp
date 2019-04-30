<!DOCTYPE html>

<%@page import="com.service.RtoCompanyService"%>
<%@page import="com.dto.RtoCompanyDto"%>
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


	<h3 style="text-align: center;">Edit Rto Company</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

			<div class="col-md-8" style="padding: 0px;">
					
						<%
										int id=Integer.parseInt(request.getParameter("id")==null ? "0" : request.getParameter("id"));
										RtoCompanyService service= new RtoCompanyService();
										RtoCompanyDto dto = service.getRtoCompanyByid(id, config, request);
										
										%>
					
	<%@include file="showMsg.jsp"%>
						<div class="right_side">
							<form action="RtoCompanyServlet" id="new" method="post">

								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Name</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="name" id="name"  onblur="checkName();"
											class="form-control" placeholder="Enter Name" value="<%=dto.getNAME()%>">
											<input type="hidden" name="creatorId"  id="creatorId" value="<%=creator_id%>">
									<input type="hidden" name="id"  id="id" value="<%=dto.getId()%>">



									</div>
								</div>	<div id="codediv"></div>
								
									<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Mobile</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="mobile" id="mobile"   value="<%=dto.getMobile() %>"
											class="form-control" placeholder="Enter Mobile">
											
									



									</div>
								</div>
								
								
								
						<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Status</label>
									</div>
									<div class="col-md-6">
										<select name="status" id="status"
											class="form-control" >
											<option value="">Select</option>
											<option  <% if(dto.getSTATUS().equalsIgnoreCase("active")){out.print("Selected='selected'");} %> value="active">Active</option>
											<option <% if(dto.getSTATUS().equalsIgnoreCase("block")){out.print("Selected='selected'");} %> value="block">Block</option>
											
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

	

	function checkName(){
				
				var name = document.getElementById("name").value;
				var id = document.getElementById("id").value;

				
				$.ajax({
					  
					url : 'CheckRtoCompnayeupdateAjx.jsp',
					data : 'name=' + name+"&&id="+id,
					type : 'post',
					
					success : function(msg) {
						
						$('#name').html(msg);
						
						 var checked = document.getElementById("check").value;
						
						
						 if(checked == "true"){
						
			 
						 document.getElementById("name").value="";
						
						
					
						 
						 var newDiv = document.createElement('div');
						 $("#codediv").html(newDiv.innerHTML ="<div class='form-group' ><div class='alert alert-warning alert-dismissible fade in text-center text-capitalize' id='forMsgDisplay' style='display: block; margin-bottom: 0px; margin-top:0px'> Rto Company already exist <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div></div>");		 
						 
						 
						 }
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

