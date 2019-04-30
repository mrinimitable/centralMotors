

<%@page import="com.dto.SpentDto"%>
<%@page import="com.service.SpentService"%>
<%@page import="com.dto.FinanceBranchDto"%>
<%@page import="com.service.FinanceBranchService"%>
<%@page import="com.dto.VariantDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.VariantService"%>
<option value="0">Select</option>
<%
	int Spent_head_id = Integer.parseInt(request
			.getParameter("Spent_head_id") == null ? "0" : request
			.getParameter("Spent_head_id"));

	int Spent_subhead_id_fk = Integer.parseInt(request
			.getParameter("Spent_subhead_id_fk") == null ? "0"
			: request.getParameter("Spent_subhead_id_fk"));

	SpentService service = new SpentService();

	ArrayList<SpentDto> list = service.getspentSubheadByHeadWise(
			Spent_head_id, config, request);

	for (SpentDto dto : list) {
%>
<option
	<%if (Spent_subhead_id_fk == dto.getId()) {
					out.print("Selected='selected'");
				}%>
	value="<%=dto.getId()%>"><%=dto.getSpent_sub_head_name()%></option>

<%
	}
%>


