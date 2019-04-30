<!DOCTYPE html>

<%@page import="com.dto.SpentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.SpentService"%>
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


	<h3 style="text-align: center;">Add Spent SubHead</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

	<div class="col-md-8" style="padding: 0px;">
						<%@include file="showMsg.jsp"%>
						<div class="right_side">
							<form action="SpentSubHeadServlet" id="new" method="post">

								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Spent Head</label>
									</div>
									<div class="col-md-6">
										<select type="text" name="spent_head_id_fk"
											id="spent_head_id_fk" class="form-control"
											placeholder="Enter Name" onblur="getSpent_head_name();">

											<option value="">Select</option>
											<%
										SpentService bankService= new SpentService();
										ArrayList<SpentDto>f_list=bankService.getAllSpentHead(request, config);
										for(SpentDto fdto : f_list){
										
										%>
											<option value="<%=fdto.getSpent_head_id()%>"><%=fdto.getSpent_head_name() %></option>

											<%} %>

										</select> <input type="hidden" name="spent_head_name"
											id="spent_head_name">




									</div>
								</div>
								<div id="sflsdkf"></div>

								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Name</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="NAME" id="NAME" onblur="checkName();"
											class="form-control" placeholder="Enter Name">
										<input type="hidden" name="creator_id_fk" id="creator_id_fk"
											value="<%=creator_id%>"> 
										
											
											<input type="hidden"
											name="branch_id_fk" id="branch_id_fk" value="<%=branch_id%>">




									</div>
								</div>
								<div id="codediv"></div>





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


	<script>
		function checkName() {

			var name = document.getElementById("bankname").value;
			var finance_id_fk = document.getElementById("finance_id_fk").value;

			/*  alert(finance_id_fk);
			 alert(name); */
			$
					.ajax({

						url : 'CheckfinanceBranchAjx.jsp',
						data : 'name=' + name + '&&finance_id_fk='
								+ finance_id_fk,
						type : 'post',

						success : function(msg) {

							$('#bankname').html(msg);
							//alert(msg);
							var checked = document.getElementById("check").value;

							// alert(checked);
							if (checked == "true") {
								//alert(checked);

								document.getElementById("bankname").value = "";

								var newDiv = document.createElement('div');
								$("#codediv")
										.html(
												newDiv.innerHTML = "<div class='form-group' ><div class='alert alert-warning alert-dismissible fade in text-center text-capitalize' id='forMsgDisplay' style='display: block; margin-bottom: 0px; margin-top:0px'>Finance branch already exist <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div></div>");

							}
						}
					});

		}

		function getSpent_head_name() {

			var spent_head_name = $("#spent_head_id_fk  :selected ").text();
			document.getElementById("spent_head_name").value = spent_head_name;

		}

		$().ready(function() {

			$("#new").validate({
				rules : {

					finacnce_id_fk : "required",
					name : "required",

				},
				messages : {

					finacnce_id_fk : "*",
					name : "required",

				}
			});

		});
	</script>
