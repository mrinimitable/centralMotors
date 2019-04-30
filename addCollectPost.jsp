<!DOCTYPE html>

<%@page import="com.dto.PostByDto"%>
<%@page import="com.service.PostByService"%>
<%@page import="java.util.ArrayList"%>
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
		$('#post_date').datetimepicker();
	});
</script>



</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Add Collect Post</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">
						<%@include file="showMsg.jsp"%>
						<div class="right_side">


							<form action="CollectPostServlet" enctype="multipart/form-data"
								id="new" method="post">




								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Post By</label>
									</div>
									<div class="col-md-6">
										<select name="post_by_id_fk" id="post_by_id_fk"
											onblur="PostByName();" class="form-control">
											<option value="">Select</option>
											<%
											
											String cur_date = LogFileService.changeFormateOfCurrentDate("yyyy-MM-dd");
											PostByService pservice= new  PostByService();
											ArrayList<PostByDto>list=pservice.getAllPostBy(config, request);
											 for(PostByDto pdto : list){
											%>
											<option value="<%=pdto.getPost_by_id()%>"><%=pdto.getPost_by() %></option>
											<%} %>
										</select>



									</div>
								</div>





								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Post Date</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="post_date" id="post_date"
											class="form-control" placeholder="Enter Date"
											value="<%=cur_date%>">





									</div>
								</div>
								<input type="hidden" name="id" id="id" value="0"> <input
									type="hidden" name="creatorId" id="creatorId"
									value="<%=creator_id%>"> <input type="hidden"
									name="SESSION" id="SESSION" value="<%=session_year%>">

								<input type="hidden" name="post_by" id="post_by"> <input
									type="hidden" name="branch_id_fk" id="branch_id_fk"
									value="<%=branch_id%>"> <input type="hidden"
									name="branch_name" id="branch_name">


								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Remark</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="remark" id="remark"
											placeholder="Remark" class="form-control">



									</div>
								</div>



								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Post Number</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="post_no" id="post_no"
											class="form-control"
											placeholder="Enter Post Number">




									</div>
								</div>
								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>File Number</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="file_no" id="file_no"
											class="form-control"
											placeholder="Enter File Number">




									</div>
								</div>


								<div class="col-md-12" style="padding: 0px;">
									
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label> Image</label>
									</div>
									<div class="col-md-6">
										<input type="file" name="file" id="file">



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
		function PostByName() {

			var name = $("#post_by_id_fk :selected").text();

			document.getElementById("post_by").value = name;

		}
	</script>







	<script type="text/javascript">
		$().ready(function() {

			$("#form1").validate({
				rules : {

					cat_id : "required",

				},
				messages : {

					cat_id : "*",

				}
			});

		});

		function checkItemCode() {

			var Item_code = document.getElementById("Item_code").value;

			$
					.ajax({

						url : 'CheckItemCodeeAjx.jsp',
						data : 'Item_code=' + Item_code,
						type : 'post',

						success : function(msg) {

							$('#Item_code').html(msg);
							var checked = document.getElementById("check").value;
							if (checked == "value") {

								document.getElementById("Item_code").value = "";
								// $('#msgdiv').html("category already axist");

								var newDiv = document.createElement('div');
								$("#codediv")
										.html(
												newDiv.innerHTML = "<div class='form-group' ><div class='alert alert-warning alert-dismissible fade in text-center text-capitalize' id='forMsgDisplay' style='display: block; margin-bottom: 0px; margin-top:0px'> Itemcode already exist <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div></div>");

							}
						}
					});

		}
	</script>
