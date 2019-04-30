

<!DOCTYPE html>

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.BankDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.BankingService"%>
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

		<h3 style="text-align: center;">Bank Detail</h3>





		<div class="row">


			<div class="col-md-12">
				</br>

				<div class="table-responsive">

					<table class="table table-bordered" id="example">
						<thead class="thead_bg">

							<tr>
											<th style="text-align: center;" width="5%">S.No</th>
		<th style="text-align: center;" width="15%">Branch</th>
										
											<th style="text-align: center;" width="15%">Account No</th>
									
												<th style="text-align: center;" width="20%">Bank Name</th>
											<th style="text-align: center;" width="15%">IFSC Code</th>
											<th style="text-align: center;" width="10%">Opening Bal</th>
											<th style="text-align: center;" width="10%">Date</th>
											<th style="text-align: center;" width="10%">Bank Detail</th>
											<th style="text-align: center;" width="10%">Action</th>
											<!-- <td width="5%">Action</td> -->
										</tr>
						</thead>

						<tbody style="background: #fff;">
							

							<%
											BankingService bService = new BankingService();
											ArrayList<BankDto> blist = null;
											blist = bService.BankReport(request,config);
											for (BankDto dto : blist) {
										%>
										<tr>
											<td style="text-align: center;"><%=blist.indexOf(dto) + 1%></td>
											<td style="text-align: center;"><%=dto.getBank_branch_name()%></td>

											<td style="text-align: center;"><%=dto.getAccount_no()%></td>
											<td style="text-align: center;"><%=dto.getBank_name()%></td>

											<td style="text-align: center;"><%=dto.getIfsc_code()%></td>
											<td style="text-align: center;"><%=dto.getOpening_bal()%></td>
											<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getOpening_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%></td>
						
						
											<td style="text-align: center;"><a
												href="bankTrasactionReportByBnakId.jsp?id=<%=dto.getBank_id()%>">	<i
													class="fa fa-pencil-square-o" aria-hidden="true"
													title="Clear"></i></a></td>
											
											
											<td style="text-align: center;"><a
												href="EditBankDetail.jsp?id=<%=dto.getBank_id()%>"><i
													class="fa fa-pencil" aria-hidden="true" title="Update"></i></a></td>


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

