<!DOCTYPE html>

<%@page import="com.dto.InsuranceCompanyDto"%>
<%@page import="com.service.InsuranceCompnayService"%>
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


	<h3 style="text-align: center;">Edit Insurance Company</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">
							<%@include file="showMsg.jsp"%>
						<div class="right_side">
							<form action="InsuranceCompanyServlet" id="new" method="post">
							
								<%
								
								int id=Integer.parseInt(request.getParameter("id")== null ? "0" : request.getParameter("id"));
								InsuranceCompnayService service = new InsuranceCompnayService();
								InsuranceCompanyDto dto = service.getInsuranceCompanyByid(id, config, request);
								
								
								%>
							
							
							

								<div class="col-md-12" style="padding: 0px;">
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Insurance Company</label>
									</div>
									<div class="col-md-6">
										<input type="text" name="name" id="name" onblur="checkCompany();" value="<%=dto.getNAME() %>" required="required"
											class="form-control" placeholder="Enter  Insurance Company Name">
											<input type="hidden" name="creatorId"  id="creatorId" value="<%=creator_id%>">
									     <input type="hidden" name="id"  id="id" value="<%=dto.getId()%>">



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