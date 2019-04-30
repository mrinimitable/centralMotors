

<!DOCTYPE html>

<%@page import="com.service.ModelService"%>
<%@page import="com.dto.ModelDto"%>
<%@page import="com.dto.VariantDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.VariantService"%>
<%@page import="java.text.DecimalFormat"%>
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
	<script src="js/jquery.datetimepicker.js"></script>

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


<script type="text/javascript">


	function getdata() {
	// alert("done");

			var model_id = document.getElementById("model_id").value;

		window.location.href = "Update_Varient_Info.jsp?model_id="
				+ model_id;
	}
	
	
	function getCalShowroom_price(count) {
		// alert("done");

				var showroom_gross_price = document.getElementById("showroom_gross_price"+count).value;
				var consumer_schemes = document.getElementById("consumer_schemes"+count).value;		
				
				document.getElementById("showroom_price"+count).value= parseFloat(showroom_gross_price) - parseFloat(consumer_schemes);
				
				
					
		}



	function AddVarient(count,varientid,index_a) {
		

    // alert("done");  


         var aDateValue = document.getElementById("datepicker").value;

		var showroom_price = document.getElementById("showroom_price"+count).value;	
		
		var rto_tax_price = document.getElementById("rto_tax_price"+count).value;	
		var insurance_price = document.getElementById("insurance_price"+count).value;	
		var handling_charges = document.getElementById("handling_charges"+count).value;	
		var exchange_bonus_amount = document.getElementById("exchange_bonus_amount"+count).value;	
		var lottery_bonus_amount = document.getElementById("lottery_bonus_amount"+count).value;	
		var corporate_bonus_amount = document.getElementById("corporate_bonus_amount"+count).value;			
		
		var model_id_fk = document.getElementById("model_id_fk"+count).value;
		var NAME = document.getElementById("NAME"+count).value;
		var gst_per = document.getElementById("gst_per"+count).value;
		var cess_per = document.getElementById("cess_per"+count).value;
		var tcs_per = document.getElementById("tcs_per"+count).value;
		var tcs_amount = document.getElementById("tcs_amount"+count).value;				
		
		var rsa_amount = document.getElementById("rsa_amount"+count).value;
		
		var extended_warranty_amount = document.getElementById("extended_warranty_amount"+count).value;
		var other_charges = document.getElementById("other_charges"+count).value;
		
		
		var creator_id_fk = document.getElementById("creator_id_fk"+count).value;
		
		var showroom_gross_price = document.getElementById("showroom_gross_price"+count).value;
		var consumer_schemes = document.getElementById("consumer_schemes"+count).value;
		
				


	//	alert(salesmen);
		if(aDateValue==null || aDateValue=="")
		{
			alert("Select Date First..");
			
		} else if(showroom_price == "" || showroom_price == null || isNaN(showroom_price) || parseInt(showroom_price) == 0)
			{
			alert("Please Insert number only");
			}
		
		else {
			
			$.ajax({
				url : 'Ajx_User.UpdateVarient.jsp',
				data : 'showroom_price='+showroom_price+'&rto_tax_price='+rto_tax_price+'&insurance_price='+insurance_price+'&handling_charges='+handling_charges+
				'&exchange_bonus_amount='+exchange_bonus_amount+'&lottery_bonus_amount='+lottery_bonus_amount+'&corporate_bonus_amount='+corporate_bonus_amount+
				'&varientid='+varientid+'&count='+count+'&aDateValue='+aDateValue+'&model_id_fk='+model_id_fk+'&NAME='+NAME+'&gst_per='+gst_per+
				'&cess_per='+cess_per+'&tcs_per='+tcs_per+'&creator_id_fk='+creator_id_fk+'&tcs_amount='+tcs_amount+
				'&rsa_amount='+rsa_amount+'&extended_warranty_amount='+extended_warranty_amount+'&other_charges='+other_charges+
				'&showroom_gross_price='+showroom_gross_price+'&consumer_schemes='+consumer_schemes,			
				
				
				type : 'post',
				success : function(msg) {
 				
					//alert(msg);

					$('#showroom_price'+count).html(msg);
					

					var new_showroom_price = document.getElementById("newShowroomprice"+count).value;
					var newinsurance_price = document.getElementById("newinsurance_price"+count).value;
					var newrto_tax_price = document.getElementById("newrto_tax_price"+count).value;
					var newhandling_charges = document.getElementById("newhandling_charges"+count).value;
					var newexchange_bonus_amount = document.getElementById("newexchange_bonus_amount"+count).value;
					var newlottery_bonus_amount = document.getElementById("newlottery_bonus_amount"+count).value;
					var newcorporate_bonus_amount = document.getElementById("newcorporate_bonus_amount"+count).value;
					var newgst_per = document.getElementById("newgst_per"+count).value;					
					var newcess_per = document.getElementById("newcess_per"+count).value;
					var newtcs_per = document.getElementById("newtcs_per"+count).value;
					
					var newrsa_amount = document.getElementById("newrsa_amount"+count).value;
					var newextended_warranty_amount = document.getElementById("newextended_warranty_amount"+count).value;
					var newother_charges = document.getElementById("newother_charges"+count).value;
								
					
					var newshowroom_gross_price = document.getElementById("newshowroom_gross_price"+count).value;
					
					var newtcs_amount = document.getElementById("newtcs_amount"+count).value;
					var newconsumer_schemes = document.getElementById("newconsumer_schemes"+count).value;
								
					
				
					
			
					
					 // alert(new_showroom_price);  
					 
					
					
					if (new_showroom_price != document.getElementById("showroom_price"+count).value) {

						document.getElementById("showroom_price"+count).value = parseInt(new_showroom_price);
						document.getElementById("rto_tax_price"+count).value = parseInt(newrto_tax_price);
						document.getElementById("insurance_price"+count).value = parseInt(newinsurance_price);
						document.getElementById("handling_charges"+count).value = parseInt(newhandling_charges);
						document.getElementById("exchange_bonus_amount"+count).value = parseInt(newexchange_bonus_amount);
						document.getElementById("lottery_bonus_amount"+count).value = parseInt(newlottery_bonus_amount);
						document.getElementById("corporate_bonus_amount"+count).value = parseInt(newcorporate_bonus_amount);
						
						
						document.getElementById("gst_per"+count).value = parseInt(newgst_per);
						document.getElementById("cess_per"+count).value = parseInt(newcess_per);
						document.getElementById("tcs_per"+count).value = parseInt(newtcs_per);
						document.getElementById("tcs_amount"+count).value = parseInt(newtcs_amount);
						
						document.getElementById("rsa_amount"+count).value = parseInt(newrsa_amount);
						document.getElementById("extended_warranty_amount"+count).value = parseInt(newextended_warranty_amount);
						document.getElementById("other_charges"+count).value = parseInt(newother_charges);
						
						document.getElementById("other_charges"+count).value = parseInt(newother_charges);
						document.getElementById("showroom_gross_price"+count).value = parseInt(newshowroom_gross_price);
						
						document.getElementById("consumer_schemes"+count).value = parseInt(newconsumer_schemes);
						
						
						
						
						
						//rsa_amount,extended_warranty_amount,other_charges
					
						
						var a="";
						
						
					/* 	document.getElementById("Bottles"+count).value=a;	 */	
					alert("Update Varient Info");
					
						 
						document.getElementById("showroom_price"+count).focus();
						
						
				
				
					} else {
						alert("Please Select Different date.");
					}
					
				}
			});
		}
	}
	


</script>

<script>
	$(function() {
		$('#datepicker').datetimepicker();
	});
</script>



</head>
<body>
	<%@include file="include/header.jsp"%>

	<div class="row_my">

		<h2 style="text-align: center;">Aprovel Sale Request</h2>






		<div class="row_my">


			<div class="col-md-12" style="padding: 0px;">



						<div class="col-md-2"></div>

						<div class="col-md-2">
							<label for="exampleInputEmail1"> Vehicle No</label>
						</div>

						<div class="col-md-5">
							<select name="model_id" id="model_id" class="form-control">
								<option value="0000">--Select--</option>
								<%
									String model_id = request.getParameter("model_id") == null ? "0"
											: request.getParameter("model_id");

									ModelDto spent = new ModelDto();
									ModelService service1 = new ModelService();

									ArrayList<ModelDto> alist = service1.getAllModelActive(config,
											request);

									for (ModelDto a : alist) {
								%>
								<option
									<%if (Integer.parseInt(model_id) == a.getId()) {

					out.println("Selected='selected'");
				}%>
									value="<%=a.getId()%>"><%=a.getNAME()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="col-md-2" style="padding-left: 0px;">
							<input class="btn btn-default" type="submit" value="Get Details"
								onclick="getdata();" name="get" style="margin: 0px;" />
						</div>

					</div>

		<div class="col-md-12" style="padding: 0px;">


						<div class="col-md-2"></div>

						<div class="col-md-2">
							<label for="exampleInputEmail1"> Date</label>
						</div>

						<div class="col-md-5">
							<input class="form-control" type="text" name="date"
								id="datepicker" readonly="readonly" />
						</div>

						<%-- 	<input type="hidden" name="year_h" value="<%=year_h%>" id="year_h" /> --%>

					</div>
					
					<div class="right_side">
						<%@include file="showMsg.jsp"%>


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>

											<th style="text-align: center; width:">S.N</th>
											<th style="text-align: center;">Name</th>
											<th style="text-align: center; display: none;">Model</th>
											<th style="text-align: center;">Gross Price</th>
											<th style="text-align: center;">Consumer schemes</th>
											<th style="text-align: center;">Ex. Showroom Price</th>
											<th style="text-align: center;">RtoTax</th>
											<th style="text-align: center;">Insurance</th>
											<th style="text-align: center;">Handling Charges</th>
											<th style="text-align: center;">Exchange Bonus</th>
											<th style="text-align: center;">Loyalty Bonuse</th>
											<th style="text-align: center;">Corporate Bonus</th>
											<th style="text-align: center;">Gst(%)</th>
											<th style="text-align: center;">Cess(%)</th>
											<th style="text-align: center;">Rsa Amount</th>
											<th style="text-align: center;">Extended Warranty</th>
											<th style="text-align: center;">Other Charges</th>

											<th style="text-align: center;">Tcs(%)</th>
											<th style="text-align: center;">Tcs Amount</th>



											<th style="text-align: center;">Add</th>

										</tr>
						</thead>

						<tbody style="background: #fff;">
							<%
											DecimalFormat df = new DecimalFormat("");
											VariantService service = new VariantService();
											ArrayList<VariantDto> list = service.getAllVariantModelWise(
													model_id, request, config);
											for (VariantDto dto : list) {
												int a = list.indexOf(dto) + 1;
										%>




										<tr>
											<td style="text-align: center;"><%=list.indexOf(dto) + 1%></td>

											<td style="text-align: center;"><div style="width: 80px;"> <%=dto.getNAME()%></div></td>
											<td style="text-align: center; display: none;"><%=dto.getModel()%></td>



											<td style="text-align: center;"><input type="text"
												class="form-control" id="showroom_gross_price<%=a%>"
												value="<%=Math.round(dto.getShowroom_gross_price())%>"  onblur="getCalShowroom_price(count<%=a%>.value);" 
												style="width: 90px;"/>

												<td style="text-align: center;"><input type="text"
													class="form-control" id="consumer_schemes<%=a%>"
													value="<%=Math.round(dto.getConsumer_schemes())%>" onblur="getCalShowroom_price(count<%=a%>.value);" style="width: 80px;"/>
											
											<td style="text-align: center;"><input type="text"
												class="form-control" id="showroom_price<%=a%>"
												value="<%=Math.round(dto.getShowroom_price())%>" /> <input
												type="hidden" id="varient_id<%=a%>" value="<%=dto.getId()%>" style="width: 80px;" />
												
												<input type="hidden" id="NAME<%=a%>"
												value="<%=dto.getNAME()%>" /> <input type="hidden"
												id="model_id_fk<%=a%>" value="<%=dto.getModel_id_fk()%>"  />


												<input type="hidden" id="creator_id_fk<%=a%>"
												value="<%=creator_id%>" /></td>



											<td style="text-align: center;"><input type="text"
												class="form-control" id="rto_tax_price<%=a%>"
												value="<%=Math.round(dto.getRto_tax_price())%>"  style="width: 80px;"/>

												<td style="text-align: center;"><input type="text"
													class="form-control" id="insurance_price<%=a%>"
													value="<%=Math.round(dto.getInsurance_price())%>" style="width: 80px;" /></td>

												<td style="text-align: center;"><input type="text"
													class="form-control" id="handling_charges<%=a%>"
													value="<%=Math.round(dto.getHandling_charges())%>" /></td></td>

											<td style="text-align: center;"><input type="text"
												class="form-control" id="exchange_bonus_amount<%=a%>"
												value="<%=Math.round(dto.getExchange_bonus_amount())%>" style="width: 80px;"/></td>
											</td>

											<td style="text-align: center;"><input type="text"
												class="form-control" id="lottery_bonus_amount<%=a%>"
												value="<%=Math.round(dto.getLottery_bonus_amount())%>" style="width: 70px;" /></td>
											</td>

											<td style="text-align: center;"><input type="text"
												class="form-control" id="corporate_bonus_amount<%=a%>"
												value="<%=Math.round(dto.getCorporate_bonus_amount())%>" style="width: 70px;"/></td>

											<td style="text-align: center;"><input type="text"
												class="form-control" id="gst_per<%=a%>"
												value="<%=Math.round(dto.getGst_per())%>" /></td>


											<td style="text-align: center;"><input type="text"
												class="form-control" id="cess_per<%=a%>"
												value="<%=Math.round(dto.getCess_per())%>" /></td>





											<td style="text-align: center;"><input type="text"
												class="form-control" id="rsa_amount<%=a%>"
												value="<%=Math.round(dto.getRsa_amount())%>"  style="width: 70px;"/></td>


											<td style="text-align: center;"><input type="text"
												class="form-control" id="extended_warranty_amount<%=a%>"
												value="<%=Math.round(dto.getExtended_warranty_amount())%>"  style="width: 70px;"/></td>


											<td style="text-align: center;"><input type="text"
												class="form-control" id="other_charges<%=a%>"
												value="<%=Math.round(dto.getOther_charges())%>"  style="width: 70px;"/></td>





											<td style="text-align: center;"><input type="text"
												class="form-control" id="tcs_per<%=a%>"
												value="<%=Math.round(dto.getTcs_per())%>"  /></td>


											<td style="text-align: center;"><input type="text"
												class="form-control" id="tcs_amount<%=a%>"
												value="<%=Math.round(dto.getTcs_amount())%>" style="width: 80px;" /></td>



											<%-- <td style="text-align: center;"><a
												href="editVarient.jsp?id=<%=dto.getId()%>"> <i
													class="fa fa-pencil" aria-hidden="true" title="Update "></i>
											</a></td>
 --%>


											<td style="text-align: center;"><input type="button"
												value="Add" id="addVArient<%=a%>"
												onclick="AddVarient(count<%=a%>.value,varient_id<%=a%>.value,<%=a%>)" />


												<input type="hidden" id="count<%=a%>" value="<%=a%>" />
												<div id="showroom_price_add<%=a%>"></div></td>

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
</body>
</html>

