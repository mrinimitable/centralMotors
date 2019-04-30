<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.BranchDto"%>
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
		$('#Date').datetimepicker();
	});
	
	$(function() {
		$('#Dob').datetimepicker();
	});
</script>






</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Edit User</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

			<div class="right_side">


				<%
					int id = Integer.parseInt(request.getParameter("id") == null
												? "0"
												: request.getParameter("id"));
										AdminRagistrationService service = new AdminRagistrationService();
										AdminRagistrationDto dto = service.getUserInfoById(id, request,config);
				%>





				<form action="RegistrationServlet" id="new" method="post">




					<%
						String cur_date = LogFileService
														.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");
					%>





					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Name</label>
						</div>
						<div class="col-md-6">

							<input type="text" id="NAME" name="NAME"
								placeholder="Enter  Name" value="<%=dto.getNAME()%>"
								class="form-control"> <input type="hidden"
								name="creator_id" id="creator_id_"
								value="<%=dto.getCreator_id()%>"> <input type="hidden"
								name="update_status_id" id="update_status_id" value="1">



						</div>
					</div>








					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Password</label>
						</div>
						<div class="col-md-6">
							<input type="password" name="PASSWORD" id="PASSWORD"
								value="<%=dto.getPASSWORD()%>" class="form-control"
								placeholder="Enter Password " />



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
								placeholder="Enter Mobile No." value="<%=dto.getMobile()%>"
								class="form-control">

						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Address</label>
						</div>
						<div class="col-md-6">
							<textarea name="address" id="address" class="form-control"
								placeholder="Enter Address "><%=dto.getAddress()%></textarea>



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
																	for(BranchDto sdto : list){
								%>
								<option
									<%if(dto.getBranch_id_fk()==sdto.getId()){out.print("Selected='selected'");}%>
									value="<%=sdto.getId()%>"><%=sdto.getNAME()%></option>
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
								<option
									<%if ("Admin".equals(dto.getUser_role())) {
				out.print("Selected='selected'");
			}%>
									value="Admin">Admin</option>


								<option
									<%if ("SalesManager".equals(dto.getUser_role())) {
				out.print("Selected='selected'");
			}%>
									value="SalesManager">SalesManager</option>



								<option
									<%if ("SalesConsultant".equals(dto.getUser_role())) {
				out.print("Selected='selected'");
			}%>
									value="SalesConsultant">SalesConsultant</option>
									
									
									
									
										<option
									<%if ("Sales".equals(dto.getUser_role())) {
				out.print("Selected='selected'");
			}%>
									value="Sales">Sales</option>
									
									
									<option
									<%if ("HeadAccount".equals(dto.getUser_role())) {
				out.print("Selected='selected'");
			}%>
									value="HeadAccount">Head Account</option>
									
									<option
									<%if ("SubAccount".equals(dto.getUser_role())) {
				out.print("Selected='selected'");
			}%>
									value="SubAccount">Sub Account</option>
									
									<option
									<%if ("Service".equals(dto.getUser_role())) {
				out.print("Selected='selected'");
			}%>
									value="Service">Service</option>
									
									<option
									<%if ("Other".equals(dto.getUser_role())) {
				out.print("Selected='selected'");
			}%>
									value="Other">Other</option>






							</select>




						</div>
					</div>







					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Status</label>
						</div>
						<div class="col-md-6">
							<select name="status" id="status" class="form-control">
								<option value="">Select</option>
								<option
									<%if ("active".equals(dto.getSTATUS())) {
				out.print("Selected='selected'");
			}%>
									value="active">Active</option>
								<option
									<%if ("block".equals(dto.getSTATUS())) {
				out.print("Selected='selected'");
			}%>
									value="block">Block</option>
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

			$("#new").validate({
				rules : {
					f_name : "required",
					u_name : "required",
					password : "required",
					Role : "required",
					status : "required",
					
				},
				messages : {
					f_name : "*",
					u_name : "*",
					password : "*",
					Role : "*",
					status : "*",

				}
			});

		});
		

		
		
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