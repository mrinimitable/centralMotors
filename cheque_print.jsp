<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.SpentDto"%>
<%@page import="com.service.SpentService"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Developed By: Madss Software Solution Pvt. Ltd.</title>

<link href="css/neermal.css" rel="stylesheet" type="text/css" />
<script src="js/toword.js"></script>

<style media="print">
.onlyscreen {
	display: none;
}
</style>
</head>

<body>
	<div class="fac_wraper">
		<div class="fac">

			<div class="neermal_bodynew">
				<%
					String id = request.getParameter("id");

					SpentService service = new SpentService();
					SpentDto dto = service.getSpentByid(id, config, request);
				%>

				<div style="margin-top: 5px; margin-left: 755px; font-size: 17px;">
					<%=LogFileService.changeFormate(dto.getCheck_date(),
					"yyyy-MM-dd", "dd-MM-yyyy")%></div>


				<div style="margin-top: 17px; margin-left: 160px; font-size: 20px;">
					<%=dto.getPay_to()%></div>


				<div style="margin-top: 11px; margin-left: 104px; font-size: 20px;"
					id="divDisplayWords";></div>


				<div style="margin-top: 13px; margin-left: 755px; font-size: 20px;">
					<%=dto.getApprove_amount()%>
					/-
				</div>



			</div>

		</div>
		<div class="onlyscreen">
			<input type="button" value="print" onclick="window.print();">

				<a href="manageApproveSpent_khandwa.jsp"><input type="button"
					value="Home"></a>
		</div>
		<div style="clear: both"></div>
	</div>






	<script src="js/jquery-1.9.1.js"></script>


	<script type="text/javascript">
		$().ready(function() {

			getViewerById(
	<%=id%>
		);

			NumToWord(
	<%=dto.getApprove_amount()%>
		, 'divDisplayWords');

		});

		function getViewerById(id) {

			/* alert("suraj"); */

			$.ajax({

				url : 'Ajex_spent_pay_check.jsp',
				data : 'id=' + id,
				type : 'post',

				success : function(msg) {

					$('#abcd').html(msg);

				}
			});

		}
	</script>



	<!-- <script type="text/javascript">  
	   
    
    	function onlyNumbers(evt) {
    var e = event || evt; // For trans-browser compatibility
    var charCode = e.which || e.keyCode;

    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
    	
    	 	
    

function NumToWord(inputNumber, outputControl) {
    var str = new String(inputNumber);
    var splt = str.split("");
    var rev = splt.reverse();
    var once = ['Zero', ' One', ' Two', ' Three', ' Four', ' Five', ' Six', ' Seven', ' Eight', ' Nine'];
    var twos = ['Ten', ' Eleven', ' Twelve', ' Thirteen', ' Fourteen', ' Fifteen', ' Sixteen', ' Seventeen', ' Eighteen', ' Nineteen'];
    var tens = ['', 'Ten', ' Twenty', ' Thirty', ' Forty', ' Fifty', ' Sixty', ' Seventy', ' Eighty', ' Ninety'];

    numLength = rev.length;
    var word = new Array();
    var j = 0;

    for (i = 0; i < numLength; i++) {
        switch (i) {

            case 0:
                if ((rev[i] == 0) || (rev[i + 1] == 1)) {
                    word[j] = '';
                }
                else {
                    word[j] = '' + once[rev[i]];
                }
                word[j] = word[j];
                break;

            case 1:
                aboveTens();
                break;

            case 2:
                if (rev[i] == 0) {
                    word[j] = '';
                }
                else if ((rev[i - 1] == 0) || (rev[i - 2] == 0)) {
                    word[j] = once[rev[i]] + " Hundred ";
                }
                else {
                    word[j] = once[rev[i]] + " Hundred and";
                }
                break;

            case 3:
                if (rev[i] == 0 || rev[i + 1] == 1) {
                    word[j] = '';
                }
                else {
                    word[j] = once[rev[i]];
                }
                if ((rev[i + 1] != 0) || (rev[i] > 0)) {
                    word[j] = word[j] + " Thousand";
                }
                break;

                
            case 4:
                aboveTens();
                break;

            case 5:
                if ((rev[i] == 0) || (rev[i + 1] == 1)) {
                    word[j] = '';
                }
                else {
                    word[j] = once[rev[i]];
                }
                if (rev[i + 1] !== '0' || rev[i] > '0') {
                    word[j] = word[j] + " Lakh";
                }
                 
                break;

            case 6:
                aboveTens();
                break;

            case 7:
                if ((rev[i] == 0) || (rev[i + 1] == 1)) {
                    word[j] = '';
                }
                else {
                    word[j] = once[rev[i]];
                }
                if (rev[i + 1] !== '0' || rev[i] > '0') {
                    word[j] = word[j] + " Crore";
                }                
                break;

            case 8:
                aboveTens();
                break;

            //            This is optional. 

            //            case 9:
            //                if ((rev[i] == 0) || (rev[i + 1] == 1)) {
            //                    word[j] = '';
            //                }
            //                else {
            //                    word[j] = once[rev[i]];
            //                }
            //                if (rev[i + 1] !== '0' || rev[i] > '0') {
            //                    word[j] = word[j] + " Arab";
            //                }
            //                break;

            //            case 10:
            //                aboveTens();
            //                break;

            default: break;
        }
        j++;
    }

    function aboveTens() {
        if (rev[i] == 0) { word[j] = ''; }
        else if (rev[i] == 1) { word[j] = twos[rev[i - 1]]; }
        else { word[j] = tens[rev[i]]; }
    }

    word.reverse();
  
    var finalOutput = '';
    for (i = 0; i < numLength; i++) {
        finalOutput = finalOutput + word[i];
    }
    
    document.getElementById(outputControl).innerHTML = finalOutput;
    
}
    </script>
    
 -->






</body>
</html>
