
<%
	String msg = request.getParameter("msg") == null ? "" : request
			.getParameter("msg");
%>

<%
	if (!"".equalsIgnoreCase(msg)) {
%>
<div class='form-group'>
	<div
		class='alert alert-warning alert-dismissible fade in text-center text-capitalize'
		id='forMsgDisplay'
		style='display: block; margin-bottom: 0px; margin-top: 0px'><%=msg%>
		<button type='button' class='close' data-dismiss='alert'
			aria-label='Close'>
			<span aria-hidden='true'>&times;</span>
		</button>
	</div>
</div>
<%
	}
%>