<!DOCTYPE html>

<%@page import="com.dto.PostByDto"%>
<%@page import="com.service.PostByService"%>
<%@page import="com.dto.CollectPostDto"%>
<%@page import="com.service.CollectPostService"%>
<%@page import="com.dto.BranchDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.BranchService"%>
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
		$('#date').datetimepicker();
	});
</script>





</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Add Transerfer Post</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-1 "></div>

		<div class="col-md-10">


			<form action="TransferPostServlet" method="post" name="form1"
				id="form1"">
				<div class="right_side">




					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-1" style="padding-right: 0px;">
							<label>Post by</label>
						</div>
						<div class="col-md-2">
							<select name="post_by_id_fk" id="post_by_id_fk"
								onblur="PostByName();" class="form-control">
								<option value="">Select</option>
								<%
									PostByService pservice= new  PostByService();
																							ArrayList<PostByDto>list=pservice.getAllPostBy(config, request);
																							 for(PostByDto pdto : list){
								%>
								<option value="<%=pdto.getPost_by_id()%>"><%=pdto.getPost_by()%></option>
								<%
									}
								%>
							</select>
						</div>


						<input type="hidden" name="post_by_name" id="post_by_name"
							class="form-control" /> <input type="hidden" name="id" id="id"
							value="0" /> <input type="hidden" name="branch_id_fk_send"
							id="branch_id_fk_send" value="<%=branch_id%>" /> <input
							type="hidden" name="creator_id_fk" id="creator_id_fk"
							value="<%=creator_id%>" /> <input type="hidden" name="session"
							id="session" value="<%=session_year%>" />





						<!-- 		<div class="col-md-1" style="padding: 0px;">
								<label>Post No</label>
							</div>
							<div class="col-md-2">
								<input type="text" name="post_old_no" id="post_old_no"
									placeholder="Post No."
									class="form-control" />



								<div id="checkinvoicenodiv"></div>


							</div> -->



						<div class="col-md-2" style="padding-right: 0px;">
							<label>Existing Post</label>
						</div>
						<div class="col-md-2">
							<select name="post_old_no" id="post_old_no" class="form-control">
								<option value="">Select</option>
								<%
									CollectPostService c_ser= new  CollectPostService();
																							ArrayList<CollectPostDto>clist=c_ser.getAllCollectPost(config, request);
																							 for(CollectPostDto cdto : clist){
								%>
								<option value="<%=cdto.getPost_no()%>"><%=cdto.getPost_no()%></option>
								<%
									}
								%>
							</select>
						</div>


						<div class="col-md-1">
							<label>By Person</label>
						</div>
						<div class="col-md-2">
							<input type="text" name="By_Person" placeholder="By Person"
								class="form-control" />

						</div>




					</div>


					<div class="col-md-12" style="padding: 0px;">


						<%
							String cur_date= LogFileService.changeFormateOfCurrentDate("yyyy-MM-dd");
						%>

						<div class="col-md-2">
							<label>Transfer date</label>
						</div>
						<div class="col-md-2">
							<input type="text" name="transfer_date" id="date"
								value="<%=cur_date%>" readonly="readonly" placeholder="Date"
								class="form-control" />




						</div>

						<div class="col-md-1" style="padding-right: 0px;">
							<label>Branch</label>
						</div>
						<div class="col-md-2">
							<select name="branch_id_fk_recive" id="branch_id_fk_recive"
								onblur="branchName();" class="form-control">
								<option value="">Select</option>
								<%
									BranchService bservice= new  BranchService();
																							ArrayList<BranchDto>blist=bservice.getAllBranch(config, request);
																							 for(BranchDto bdto : blist){
								%>
								<option value="<%=bdto.getId()%>"><%=bdto.getNAME()%></option>
								<%
									}
								%>
							</select>
						</div>

						<input type="hidden" name="branch_name_recive"
							id="branch_name_recive" />



						<div class="col-md-1">
							<label>Remark</label>
						</div>
						<div class="col-md-2">
							<input type="text" name="remark" placeholder="Remark"
								class="form-control" />

						</div>

					</div>




					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<br></br>
						<div class="table-responsive">
							<table class="table table-bordered">
								<tbody>
									<tr style="background: #eee;">
										<th style="text-align: center;">Document</th>
										<th style="text-align: center;">Document Remark</th>




									</tr>
									<tr>
										<td><div class="col-md-12"
												style="padding: 0px; text-align: center;">

												<input type="text" class="form-control" id="item_name"
													style="padding: 0px; height: 25px; text-align: center;"
													placeholder="Document Name" />
											</div></td>


										<td><div class="col-md-12" style="padding: 0px;">
												<input type="text" class="form-control"
													placeholder="Document Remark"
													style="padding: 0px; height: 25px; text-align: center;"
													id="itemRemark" onblur="autoFocus();" />


											</div></td>

									</tr>
									<!-- On cells (`td` or `th`) -->
								</tbody>
							</table>
						</div>
					</div>

					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="table-responsive">


							<table class="table table-bordered">
								<thead class="thead_bg">
									<tr>
										<th style="text-align: center;">Document Name</th>
										<th style="text-align: center;">Document Remark</th>
										<th style="text-align: center;"></th>




									</tr>
								</thead>



								<tbody id="tableScroll" style="background: #fff;">


								</tbody>


								<!-- On rows -->
							</table>
							<br></br>


						</div>
					</div>
					<div class=" col-md-12 ">

						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
							align="center">
							<br /> <input class="submit" type="submit" id="submit"
								value="Submit"></input>
						</div>
						<br /> <br /> <br /> <br />

					</div>
			</form>



		</div>
	</div>




	<script type="text/javascript" src="js/JQuerylib.js"></script>
	<script type="text/javascript" src="js/JQueryValidate.js"></script>
	<script src="js/jquery.datetimepicker.js"></script>


	<script type="text/javascript">
		var preWorkExpIndex = 1;

		function autoFocus() {

			var item_name = document.getElementById('item_name').value;

			var itemRemark = document.getElementById("itemRemark").value;

			/* if (item_name == "" || isNaN(item_name)) {
			 alert("Insert Item Name ");
			 document.getElementById("item_name").value = "";
			 document.getElementById("item_name").focus();
			
			 }  else { */

			// setAmount();
			var applicationTable = document.getElementById("tableScroll");

			var newRow = applicationTable.insertRow(preWorkExpIndex - 1);

			// alert(preWorkExpIndex);

			var newCell = newRow.insertCell(0);
			newCell.innerHTML = item_name
					+ '<input id="item_name'
					+ preWorkExpIndex + '" type="hidden" name="Item_name" value="'
					+ item_name 
					+ '">';
			newCell.setAttribute("align", "center");

			var newCell = newRow.insertCell(1);
			newCell.innerHTML = itemRemark
					+ '<input id="itemRemark' + preWorkExpIndex
					+ '" type="hidden" name="ItemRemark" value="' + itemRemark + '">';
			newCell.setAttribute("align", "center");

			newCell = newRow.insertCell(2);
			newCell.innerHTML = "<img src='img/close.gif' onclick='deleteRow(\""
					+ applicationTable.id
					+ "\",this.parentNode.parentNode.rowIndex); '/>";

			document.getElementById('item_name').value = "";
			document.getElementById("itemRemark").value = "";

			document.getElementById("item_name").focus();

			preWorkExpIndex++;

		}

		function deleteRow(tableObjId, i, btnId) {

			var btnObj = document.getElementById(btnId);
			var tblObj = document.getElementById(tableObjId);
			preWorkExpIndex--;

			tblObj.deleteRow(i - 1);

			if (btnObj != null) {
				if (tblObj.rows.length <= 7) {
					btnObj.disabled = "";
				}
			}

			manageRow(i);
		}

		function manageRow(rowNo) {

			var applicationTable = document.getElementById("tableScroll");
			var tblObj = document.getElementById(applicationTable.id);

			for (var index = rowNo; index <= tblObj.rows.length; index++) {
				j = index + 1;

				var item_name = document.getElementById('item_name' + j).value;

				var itemRemark = document.getElementById("itemRemark" + j).value;

				var newRow = applicationTable.insertRow(index - 1);
				// alert(index);

				var newCell = newRow.insertCell(0);
				newCell.innerHTML = item_name
						+ '<input id="item_name'
					+ index + '" type="hidden" name="Item_name" value="'
					+ item_name 
					+ '">';
				newCell.setAttribute("align", "center");

				var newCell = newRow.insertCell(1);
				newCell.innerHTML = itemRemark
						+ '<input id="itemRemark' + index
					+ '" type="hidden" name=ItemRemark" value="' + itemRemark + '">';
				newCell.setAttribute("align", "center");

				newCell = newRow.insertCell(2);
				newCell.innerHTML = "<img src='img/close.gif' onclick='deleteRow(\""
						+ applicationTable.id
						+ "\",this.parentNode.parentNode.rowIndex); '/>";

				tblObj.deleteRow(index);
			}
		}
	</script>






	<script>
		function PostByName() {

			var post_name = $("#post_by_id_fk  :selected ").text();
			document.getElementById("post_by_name").value = post_name;

		}

		function branchName() {

			var branch = $("#branch_id_fk_recive  :selected ").text();
			document.getElementById("branch_name_recive").value = branch;

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
	</script>