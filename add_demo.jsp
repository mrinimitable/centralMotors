<!DOCTYPE html>

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

		<div class="col-md-8">


			<form action="SaleRequestServlet" enctype="multipart/form-data"
				id="new" method="post">


				<div class="col-md-12">
					</br>

					<div class="col-md-2"></div>
					<div class="col-md-6" align="center">
						<label>VEHICLE INFO</label>
					</div>

				</div>


				<div class="col-md-12" style="padding: 0px;">
					</br>

					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label>Color</label>
					</div>
					<div class="col-md-6">

						<select id="color_id_fk" name="color_id_fk"
							onblur="getcolourName();" class="form-control">
							<option value="">Select</option>

						</select>
					</div>
				</div>





				<div class="col-md-12" style="padding: 0px;">
					</br>

					<div class="col-md-2"></div>
					<div class="col-md-6" align="center">
						<label>SALE INFO</label>
					</div>

				</div>





				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label> Sale Date</label>
					</div>
					<div class="col-md-6">
						<input type="text" name="saleing_date" id="saleing_date"
							placeholder="saleing_date" value="" class="form-control"
							readonly="readonly">
					</div>
				</div>



				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-2"></div>
					<div class="col-md-3">
						<label> Mobile No</label>
					</div>
					<div class="col-md-6">
						<input type="text" name="customer_mobile_no"
							id="customer_mobile_no" placeholder=" Enter Mobile No." value=""
							class="form-control" style="background: #ffcbcb">
					</div>
				</div>


				<div class="col-md-12" style="padding: 0px;">
					<div class="col-md-5">&nbsp;</div>
					<div class="col-md-7">
						<input type="submit" name="submit" id="submit" value="Submit"
							class="submit"
							onclick="return confirm('Are you sure to Submit Info ?')">
					</div>
				</div>
			</form>

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