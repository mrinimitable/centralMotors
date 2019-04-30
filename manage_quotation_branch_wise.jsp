

<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.BranchDto"%>
<%@page import="com.service.BranchService"%>
<%@page import="com.dto.QuotationDto"%>
<%@page import="com.service.QuotationServie"%>

<%@page import="java.util.ArrayList"%>

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

											/* 	dom : 'Bf_$tag___rt_$tag______$tag____', */
											dom : '_$tag_____rt_$tag_____$tag____p',
											/*  buttons: [
											     'print'
											 ],  */
											buttons : [
													{
														extend : 'print',
														title : "",
														message : "_$tag_________________________________$ta_$tag___________________________$tag___________________________"

																+ " _$tag____$tag_$tag_$ta_$tag___________________________$tag___________________________All Customer List_$tag____$tag_$tag _$tag___",
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

		<h3 style="text-align: center;">Quotation Report Branch Wise</h3>

		<%
			int branch_id_fk = Integer.parseInt(request
					.getParameter("branch_id_fk ") == null ? "0" : request
					.getParameter("branch_id_fk "));
		%>

		<form id="form1" action="" method="post">
			<div class="col-md-1"></div>
			<div class="col-md-10">


				<div class="col-md-3">
					<center>
						<label>Branch</label>
					</center>
				</div>
				<div class="col-md-4">
					<select id="branch_id_fk " name="branch_id_fk "
						class="form-control">
						<option value="0">Select</option>
						<%
							BranchService aservice = new BranchService();

							ArrayList<BranchDto> alist = aservice.getAllBranch(config, request);
							for (BranchDto adto : alist) {
						%>
						<option
							<%if (branch_id_fk == adto.getId()) {
					out.print("Selected='selected'");
				}%>
							value="<%=adto.getId()%>"><%=adto.getNAME()%></option>
						<%
							}
						%>
					</select>
				</div>


				<div class="col-md-1">
					<center>
						<button class="submit" type="submit">Get</button>
					</center>

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

								<th style="text-align: center;" width="5%">S.N</th>



								<th style="text-align: center;">Date</th>
								<th style="text-align: center;">Name</th>
								<th style="text-align: center;">Mobile</th>
								<th style="text-align: center;">Address</th>
								<th style="text-align: center;">Model</th>
								<th style="text-align: center;">Varient</th>
								<th style="text-align: center;">Ex. Showroom Price</th>
								<th style="text-align: center;">Rto Tax</th>
								<th style="text-align: center;">Insurance</th>
								<th style="text-align: center;">Handling Charges</th>
								<th style="text-align: center;">Accessories</th>
								<th style="text-align: center;">Tcs(%)</th>
								<th style="text-align: center;">Total Amount</th>
								<th style="text-align: center;">Remark</th>
								<th style="text-align: center;">Print</th>
								<!-- <th style="text-align: center;">Action</th> -->

							</tr>
						</thead>

						<tbody style="background: #fff;">


							<%
								QuotationServie service = new QuotationServie();
								ArrayList<QuotationDto> list = service.getAllQuotationBranchWise(
										branch_id_fk, config, request);
								for (QuotationDto dto : list) {
							%>




							<tr>
								<td style="text-align: center;"><%=list.indexOf(dto) + 1%></td>
								
								


								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getQuotation_date(),
					"yyyy-MM-dd hh:mm", "dd-MM-yyyy hh:mm")%></td>
								<td style="text-align: center;"><%=dto.getCustomer_name()%></td>
								<td style="text-align: center;"><%=dto.getCustomer_mobile_no()%></td>
								<td style="text-align: center;"><%=dto.getCustomer_address()%></td>
								<td style="text-align: center;"><%=dto.getModel_name()%></td>
								<td style="text-align: center;"><%=dto.getVariant_name()%></td>
								<td style="text-align: center;"><%=dto.getShowroom_price()%></td>
								<td style="text-align: center;"><%=dto.getRto_tax_price()%></td>
								<td style="text-align: center;"><%=dto.getInsurance_price()%></td>
								<td style="text-align: center;"><%=dto.getOther_charges()%></td>
								<td style="text-align: center;"><%=dto.getAccessories_charges()%></td>
								<td style="text-align: center;"><%=dto.getTcs_per()%></td>
								<td style="text-align: center;"><%=dto.getTotal_amount()%></td>
								<td style="text-align: center;"><%=dto.getRemark()%></td>
								<td style="text-align: center;"><a
									href="receipt_quotation.jsp?id=<%=dto.getId()%>">Print </a></td>


								<%-- <td style="text-align: center;"><a
												href="delete_quotation.jsp?id=<%=dto.getId()%>"><img
													src="img/delete.png" width="25px" height="25px"
													onclick="return confirm('Are you sure to delete this quotation ?')"></img>
											</a> </i> </a></td> --%>



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

