<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.BranchDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.BranchService"%>
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


	<h3 style="text-align: center;">Add User</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">




			<div class="right_side">
				<form action="RegistrationServlet" id="new" method="post">



					<%
						AdminRagistrationService service= new AdminRagistrationService();					
																	
										
											String cur_date= LogFileService.changeFormateOfCurrentDate("yyyy-MM-dd");
					%>





					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Name</label>
						</div>
						<div class="col-md-6">

							<input type="text" id="NAME" name="NAME"
								placeholder="Enter  NAME" class="form-control"> <input
								type="hidden" name="creator_id_fk" id="creator_id_fk"
								value="<%=creator_id%>">


						</div>
					</div>





					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Mobile</label>
						</div>
						<div class="col-md-6">

							<input type="text" id="mobile" name="mobile"
								onkeypress="return onlyNumber(event)"
								placeholder="Enter Mobile No." class="form-control">

						</div>
					</div>






					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Password</label>
						</div>
						<div class="col-md-6">
							<input type="password" name="PASSWORD" id="PASSWORD"
								class="form-control" placeholder="Enter Password " />



						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Address</label>
						</div>
						<div class="col-md-6">
							<textarea name="address" id="address" class="form-control"
								placeholder="Enter Address "></textarea>

						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Branch</label>
						</div>
						<div class="col-md-6">
							<select name="branch_id_fk" id="branch_id_fk"
								class="form-control">

								<option value="0">Select</option>
								<%
									BranchService aminService= new BranchService();
																	ArrayList<BranchDto>list=aminService.getAllBranch(config, request)
																			;
																	for(BranchDto dto : list){
								%>
								<option value="<%=dto.getId()%>"><%=dto.getNAME()%></option>
								<%
									}
								%>

							</select>





						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>User Role</label>
						</div>
						<div class="col-md-6">
							<select name="user_role" id="user_role" class="form-control">

								<option value="">Select</option>
											<option value="Admin">Admin</option>
											<option value="SalesConsultant">Sales Consultant</option>
											<option value="SalesManager">SalesManager</option>
											<option value="Sales">Sales</option>
											<option value="HeadAccount">Head Account</option>
											<option value="SubAccount">Sub Account</option>
											<option value="Service">Service</option>
											<option value="Other">Other</option>
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