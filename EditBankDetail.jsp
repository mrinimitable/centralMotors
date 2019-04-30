<!DOCTYPE html>

<%@page import="com.dto.BankDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.BankingService"%>
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


	<h3 style="text-align: center;">Bank Details</h3>


	<div id="abcd"></div>
	
		<%
					int id = Integer.parseInt(request.getParameter("id") == null
									? "0"
									: request.getParameter("id"));

							BankingService service = new BankingService();
							BankDto dto = service.getupdate_bankdetail_by_id(id, request,config);
				%>
	


	<div class="col-md-12">
		<div class="col-md-2 "></div>

	<div class="col-md-8" style="padding: 0px;">
						<div class="right_side">
							<form action="Bank_Servlet" id="form1" name="form1" method="post">
								<div class="col-md-2"></div>
									
									
									
									
									<div class="col-md-12">
									<div class="col-md-4">
										<label> Branch</label>
									</div>
									<div class="col-md-8">
										<input type="text" name="bank_name" required="required"
											placeholder="Enter Branch Name."
											value="<%=dto.getBank_name()%>"
											class="form-control" /> 
											
											<input type="hidden"
											name="bank_id" value="<%=id%>" />
									</div>
								</div>
								
								<div class="col-md-12">
									<div class="col-md-4">
										<label>Account No.</label>
									</div>
									<div class="col-md-8">
										<input type="text" name="account_no"
											placeholder="Enter Account No."
											value="<%=dto.getAccount_no()%>"
											class="form-control" />
									</div>
								</div>
								
								
							
									
									<input type="hidden" name="session" value="<%=session %>"
												/>
										<input type="hidden" name="branch_id" value="<%=branch_id %>"
												/>
													<input type="hidden" name="pay_mode" value="<%=dto.getPay_mode() %>"
												/>
									
										<div class="col-md-12">
											<div class="col-md-4">
												<label>Bank Name</label>
											</div>
											<div class="col-md-8">
												<select name="bank_id_fk" id="bank_id_fk" class="form-control" >
												<option value="">Select</option>
												<%
												BankingService bservice= new BankingService();
												ArrayList<BankDto>bank_list=bservice.getAllMasterBankActive(request,config);
												for(BankDto bdto : bank_list){
												
												%>
													
												<option  <%if(dto.getBank_id_fk()== bdto.getBank_id()){out.print("Selected='selcted'");} %> value="<%=bdto.getBank_id()%>"><%=bdto.getBank_name()%></option>
												<%} %>
												</select>
											</div>
										</div>
										
										
										
										
								<div class="col-md-12">
									<div class="col-md-4">
										<label>IFSC Code</label>
									</div>
									<div class="col-md-8">
										<input type="text" name="ifsc_code"
											placeholder="Enter IFSC Code."
											value="<%=dto.getIfsc_code()%>"
											class="form-control" />
									</div>
								</div>
								
								<div class="col-md-12">
									<div class="col-md-4">
										<label>Status</label>
									</div>
									<div class="col-md-8">
										<select name="bank_status" class="form-control" >
										<option <%if(dto.getBank_status().equals("active")){out.print("Selected=='selected'");}%>value="active">
										Active</option>
										
										<option <%if(dto.getBank_status().equals("block")){out.print("Selected=='selected'");}%> value="block">
										Block</option>
										</select>
									</div>
								</div>

  
								<div class="col-md-12">
									<div class="col-md-4">&nbsp;</div>
									<div class="col-md-8">
										<input type="submit" name="submit" id="submit" value="Submit"
											class="btn btn-primary" />
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
	if (keynum < 46 || keynum > 57 
			||keynum == 47) {
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
	
	<script type="text/javascript">
	$().ready(function() {

		$("#form1").validate({
			rules : {
				
				bank_name: "required",	
				account_no : "required",	
				branch: "required",	
				
			},
			messages : {
				
				bank_name: "*",
				account_no : "*",	
				branch: "*",	
				
			}
		});

	});
	</script>