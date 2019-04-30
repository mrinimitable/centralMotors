<!DOCTYPE html>

<%@page import="java.util.ArrayList"%>
<%@page import="com.service.LogFileService"%>
<%@page import="java.io.File"%>
<%@page import="com.dto.SpentDto"%>
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
		$('#receive_date').datetimepicker();
	});
	
	$(function() {
		$('#check_date').datetimepicker();
	});
	
	
	$(function() {
		$('#aprrove_Date').datetimepicker();
	});
	
	$(function() {
		$('#ddDate').datetimepicker();
	});
	
	$(function() {
		$('#saleing_date').datetimepicker();
	});
</script>










</head>
<body>


	<%@include file="include/header.jsp"%>


	<h3 style="text-align: center;">Approve Spent Payment</h3>


	<div id="abcd"></div>


	<div class="col-md-12">
		<div class="col-md-2 "></div>

		<div class="col-md-8" style="padding: 0px;">

			<div class="right_side">
				<form action="SpentApprovePaymentStatusServlet"
					enctype="multipart/form-data" id="new" method="post">





					<%
						int id=Integer.parseInt(request.getParameter("id")== null ? "0" : request.getParameter("id"));
															SpentService service = new SpentService();
															SpentDto dto = service.getSpentAmoutByid(id, config, request);

																File f= new File(config.getServletContext().getRealPath("/")+"imageSpent/"+id+".jpg");



														
														String cur_date = LogFileService.changeFormateOfCurrentDate("yyyy-MM-dd hh:mm");
					%>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Image</label>
						</div>
						<div class="col-md-6">
							<%
								if(f.exists()){
							%>
							<a href="imageSpent/<%=dto.getId()%>.jpg" target="_blank"><img
								src="imageSpent/<%=dto.getId()%>.jpg" height="50px" width="50px" /></a>
							<a href="imageSpent/<%=dto.getId()%>.jpg" target="_blank">View</a>
							<%
								}else{
							%>
							<img src="img/not.png" height="50px" width="50px" />
							<%
								}
							%>
						</div>

					</div>





					<%-- 		<div class="col-md-12">
									</br>
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<label>Spent Head</label>
									</div>
									<div class="col-md-6">
										<select name="Spent_head_id" class="form-control input_a">

											<%
												//	SpentDetailService service = new SpentDetailService();
												
											ArrayList<SpentDto> list1 = new SpentService().getAllSpentHead_ByActiveStatus(request, config);
													for (SpentDto dto11 : list1) {
														
														%>

											<option
												<%if(dto.getSpent_head_id() == dto11.getSpent_head_id()){out.print("Selected='selected'");} %>
												value="<%=dto11.getSpent_head_id()%>"><%=dto11.getSpent_head_name() %></option>
											<%} %>


										</select>




									</div>
								</div> --%>



					<div class="col-md-12" style="padding: 0px;">

						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Spent Head</label>
						</div>

						<div class="col-md-6">

							<select id="Spent_head_id" name="Spent_head_id"
								class="form-control"
								onblur="getSpent_head_name();getSpent_subhead();"
								onchange="getSpent_head_name();">

								<option value="0">Select</option>
								<%
									SpentService fin_Service=new SpentService();
														ArrayList<SpentDto> mlist = new SpentService().getAllSpentHead_ByActiveStatus(request, config);
														for(SpentDto mDto : mlist){
								%>


								<option
									<%if(dto.getSpent_head_id() == mDto.getSpent_head_id()){out.print("Selected='selected'");}%>
									value="<%=mDto.getSpent_head_id()%>"><%=mDto.getSpent_head_name()%></option>
								<%
									}
								%>

							</select> <input type="hidden" name="creator_id_fk" id="creator_id_fk"
								value="<%=creator_id%>"> <input type="hidden"
								name="session" id="session" value="<%=session_year%>"> <input
								type="hidden" name="spent_head_name" id="spent_head_name">

							<input type="hidden" name="creator_id_fk_mobile"
								id="creator_id_fk_mobile"
								value="<%=dto.getCreator_id_fk_mobile()%>">





						</div>
					</div>





					<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Sub Head</label>
						</div>
						<div class="col-md-6">

							<select id="Spent_subhead_id_fk" name="Spent_subhead_id_fk"
								onblur="getSpent_sub_head_name()" class="form-control">
								<option value="">Select</option>

							</select>

						</div>


						<input type="hidden" name="Spent_sub_head_name"
							id="Spent_sub_head_name">






					</div>















					<div class="col-md-12" style="padding: 0px;">

						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Receiving Date</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="receiving_date" id="receive_date"
								readonly="readonly" placeholder="Receive Date"
								value="<%=dto.getReceiving_date()%>" class="form-control">



						</div>
					</div>



					<input type="hidden" name="id" id="id" value="<%=dto.getId()%>" />

					<input type="hidden" name="branch_id_fk" id="branch_id_fk"
						value="<%=branch_id%>" /> <input type="hidden" name="branch_name"
						id="branch_name" value="<%=dto.getBranch_name()%>" /> <input
						type="hidden" name="creator_id_fk_approver"
						id="creator_id_fk_approver" value="<%=creator_id%>" /> <input
						type="hidden" name="formId" id="formId" value="1" /> <input
						type="hidden" name="SESSION" id="SESSION"
						value="<%=session_year%>" />




					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Spend By</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="spend_by" id="spend_by"
								placeholder="spend_by" class="form-control"
								value="<%=dto.getSpend_by()%>">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Pay To</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="pay_to" id="pay_to" placeholder="pay_to"
								class="form-control" value="<%=dto.getPay_to()%>">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Remark</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="remark" readonly="readonly" id="remark"
								value="<%=dto.getRemark()%>" placeholder="Remark"
								class="form-control">



						</div>
					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Amount</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="amount" id="receive_amount"
								readonly="readonly" placeholder="Receive Amount"
								value="<%=dto.getAmount()%>" class="form-control"
								onkeypress="return onlyNumberWithFloat(event)">



						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Approve Amount</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="aprrove_amount" id="aprrove_amount"
								placeholder="Approve  Amount" value="<%=dto.getAmount()%>"
								onkeypress="return onlyNumberWithFloat(event)"
								class="form-control">

						</div>

					</div>


					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Approve Date</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="aprrove_Date" id="aprrove_Date"
								placeholder="Approve  Date" value="<%=cur_date%>"
								class="form-control">

						</div>

					</div>


					<div class="col-md-12">

						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label>Approver Pay Mode</label>
						</div>
						<div class="col-md-6">
							<select name="approver_pay_mode" class="form-control">

								<option value="Cash">Cash</option>
								<option value="Cheque">Cheque</option>
								<option value="Online">Online</option>

							</select>




						</div>
					</div>



					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Approve Remark</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="aprroveRemark" id="aprroveRemark"
								placeholder="Approve Remark" class="form-control">

						</div>

					</div>




					<div class="col-md-12" style="padding: 0px;">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<label> Approve Status</label>
						</div>
						<div class="col-md-6">
							<select name="aprrove_status" id="aprrove_status"
								class="form-control">
								<option value="ApprovePayment">Approve Payment</option>
								<option value="Cancle">Cancle</option>
							</select>


						</div>
					</div>



					<div class=" col-md-12 ">








						<div class="col-md-12" style="padding: 0px;">
							<div class="col-md-5">&nbsp;</div>
							<div class="col-md-7">
								<input type="submit" name="submit" id="submit" value="Submit"
									class="submit"
									onclick="return confirm('Are you sure to Submit Info ?')">
							</div>
						</div>
						<br /> <br /> <br /> <br />



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
			
			getSpent_subhead();
			
			
			
	
			});

	
	</script>


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
		
		
		function showHideDD(flag) {
			if (flag == 'DD' || flag == 'Cheque' || flag == 'Online') {
				showHideTemplateByCheckBox(true, 'ddDiv');				
				showHideTemplateByCheckBox(false, 'ddDiv_cash');
			} else {
				showHideTemplateByCheckBox(false, 'ddDiv');
				
				showHideTemplateByCheckBox(true, 'ddDiv_cash');
			}
			document.getElementById("ddno").value = "";
			document.getElementById("bankname").value = "";
			document.getElementById("ddDate").value = "";
			document.getElementById("dd_amount").value = "0";
			returnAmt(0);
		}

		function showHideTemplateByCheckBox(flag, htmlObj) {
			// alert(htmlObj);
			var htmlObj1 = document.getElementById(htmlObj);
			if (htmlObj1 != undefined) {
				if (flag) {
					htmlObj1.style.display = "inline";
				} else {
					htmlObj1.style.display = "none";
				}
			}
		}
		

	</script>
	<script>		
	
		
		function totalAmount(){
			    
			
			var tens= document.getElementById("tensrupess").value;
			//alert(tens); 
			var twenty = document.getElementById("twentyrupees").value;
			//alert(twenty);
			var fifty= document.getElementById("fiftees").value;
			//alert(fifty);
			var hundred= document.getElementById("hundred").value;
			//alert(hundred);
			var fivehundred = document.getElementById("fivehundresd").value;
			//alert(fivehundred);
			var twothosunad= document.getElementById("twothousand").value;
			//alert(twothosunad);
			
			var Twohundred = document.getElementById("Twohundred").value;
		
			
			
		var total=(10*tens)+(20*twenty)+(50*fifty)+(100*hundred)+(500*fivehundred)+(2000*twothosunad)+(200*Twohundred);
			
	
			
			document.getElementById("aprrove_amount").value=total;
		
		}
		
		
		

		function getSpent_head_name(){
			
			var spent_head_name=$("#Spent_head_id :selected").text();  

			document.getElementById("spent_head_name").value = spent_head_name;			
			
		}
		
		
		
	function getSpent_sub_head_name(){
			
			var Spent_sub_head_name=$("#Spent_subhead_id_fk :selected").text();  

			document.getElementById("Spent_sub_head_name").value = Spent_sub_head_name;			
			
		}

			
	
	function getSpent_subhead(){				
				
				var Spent_head_id = document.getElementById("Spent_head_id").value;
				
				var Spent_subhead_id_fk = <%=dto.getSpent_subhead_id_fk()%>;
				
				$.ajax({
					
					url : 'Ajax.spentsubhead.jsp',
					data : 'Spent_head_id='+ Spent_head_id,
					
					data : 'Spent_head_id='+ Spent_head_id+ '&Spent_subhead_id_fk=' +Spent_subhead_id_fk,
					
					
					type : 'post',
										
					success  : function(msg){						
						
						$('#Spent_subhead_id_fk').html(msg);						 
					
						
					}
					
				});
				
				
			}
	
	
		
	</script>