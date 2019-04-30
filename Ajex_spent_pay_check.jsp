
<%@page import="com.dto.SpentDto"%>
<%@page import="com.service.SpentService"%>
<%@page import="com.service.InsuranceCompnayService"%>
<%
	int id = Integer.parseInt(request.getParameter("id") == null ? ""
			: request.getParameter("id"));

	SpentService ser = new SpentService();

	SpentDto dto = ser.getSpentAmoutByid(id, config, request);

	boolean b;

	if (dto.getBranch_id_fk() == 1) {

		b = ser.cleareCheckSpentDetail(dto, request, config);

	}

	else {

		b = ser.cleareCheckSpentDetailOtherBranch(dto, request, config);

	}

	if (b)

	{
%>

<input type="hidden" id="check" value="<%=b%>" />

<%
	}
%>