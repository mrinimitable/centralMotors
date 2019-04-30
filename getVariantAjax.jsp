

<%@page import="com.dto.VariantDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.VariantService"%>
<option value="0">Select</option>
<%
	int model_id_fk = Integer
			.parseInt(request.getParameter("model_id_fk") == null ? "0"
					: request.getParameter("model_id_fk"));

	int variant_id_fk = Integer.parseInt(request
			.getParameter("variant_id_fk") == null ? "0" : request
			.getParameter("variant_id_fk"));

	VariantService service = new VariantService();
	ArrayList<VariantDto> list = service.getVariantByModelId(model_id_fk,
			request, config);
	for (VariantDto dto : list) {
%>
<option
	<%if (variant_id_fk == dto.getId()) {
					out.print("Selected='selected'");
				}%>
	value="<%=dto.getId()%>"><%=dto.getNAME()%></option>
<%
	}
%>