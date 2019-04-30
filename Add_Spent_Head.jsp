

<!DOCTYPE html>

<%@page import="com.dto.SpentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.SpentService"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="font-awesome-4.4.0/css/font-awesome.min.css"
	rel="stylesheet" />

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

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('#example')
								.dataTable(
										{
											// dom: 'Bfrtip',

											//  dom: 'Bfrtip',
											"lengthMenu" : [
													[ 20, 100, 500, -1 ],
													[ 20, 100, 500, "All" ] ],
											//  iDisplayLength: 20,

											/* 	dom : 'Bf<"top"i>rt<"left"lp><"clear">', */
											dom : '<"top"lBf>rt<"left"i><"clear">p',
											/*  buttons: [
											     'print'
											 ],  */
											buttons : [
													{
														extend : 'print',
														title : "",
														message : "<table class='table ' align='center'><tr><td colspan='7' align='center'><label for='exampleInputEmail1'>"

																+ " </label></td></tr><tr><td colspan='8' align='center'><label for='exampleInputEmail1'>All Customer List</label></td></tr> </table>",
														exportOptions : {
															columns : ':visible'
														}
													}, 'colvis'

											],
											columnDefs : [ {
												//		targets : -1,
												visible : false
											} ]
										});
					});
</script>

</head>
<body>
	<%@include file="include/header.jsp"%>

	<div class="row">

		<h3 style="text-align: center;">Add Spent Head</h3>
		
		
				<form action="SpentHeadServlet" id="new" method="post">
							<div class="col-md-2 "></div>
							<div class="col-md-8 ">
								<div class="col-md-12">
									<div class="col-md-3">
										<label>Spent Head</label>
									</div>
									<div class="col-md-8">
										<input type="text" name="Spent_head" id="spent_head"
											required="" placeholder="Enter Spent Head"
											class="form-control" onblur="checkSpentHead();" />
									</div>


									<div class="col-md-1">
										<button class="submit" type="submit">Submit</button>

									</div>
								</div>
							</div>
						</form>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
								<th style="text-align: center;">S.no</th>
								<th style="text-align: center;">Name</th>
								<th style="text-align: center;">Status</th>
								<th style="text-align: center;">Action</th>
							</tr>
						</thead>

						<tbody style="background: #fff;">


							<%
								SpentService service = new SpentService();
								ArrayList<SpentDto> list = service.getAllSpentHead(request, config);
								for (SpentDto spent_head_dto : list) {
							%>
							<tr>
								<td style="text-align: center;"><%=list.indexOf(spent_head_dto) + 1%></td>
								<td style="text-align: center;"><%=spent_head_dto.getSpent_head_name()%></td>
								<td style="text-align: center;"><%=spent_head_dto.getSpent_head_status()%></td>
								<td style="text-align: center;"><a
									href="UpdateSpent_head.jsp?sadfjshakhfdsakj=<%=spent_head_dto.getSpent_head_id()%>"></>Update</a>

									/ <a
									href="Delete_SpentHead.jsp?sadfjshakhfdsakj=<%=spent_head_dto.getSpent_head_id()%>"
									onclick=" return confirm('do you want to delete this link')">Delete</a>
								</td>
							</tr>
							<%
								}
							%>




						</tbody>


					</table>


				</div>


			</div>
		</div>

	</div>
	
	<script type="text/javascript">
		$().ready(function() {

			$("#new").validate({
				rules : {
					category : "required",

				},
				messages : {
					category : "*",

				}
			});

		});

		function checkSpentHead() {
			var spent_head = document.getElementById("spent_head").value;
			if (spent_head != "" && spent_head != null) {

				$.ajax({
					url : 'checkSpentHead_Ajax.jsp',
					data : 'spent_head=' + spent_head,
					type : 'post',

					success : function(msg) {
						$('#rev').html(msg);

						var a2 = document.getElementById("value").value;

						if (a2 == "availabile") {
							alert("Spent Head Is Already Available");
							document.getElementById("spent_head").value = "";
							document.getElementById("spent_head").focus();
						}
					}

				});
			}
		}
	</script>
</body>
</html>

