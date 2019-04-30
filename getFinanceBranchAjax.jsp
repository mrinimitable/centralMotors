

<%@page import="com.dto.FinanceBranchDto"%>
<%@page import="com.service.FinanceBranchService"%>
<%@page import="com.dto.VariantDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.VariantService"%>
<option value="0">Select</option>
<%
	int finance_company_id_fk = Integer
			.parseInt(request.getParameter("finance_company_id_fk") == null ? "0"
					: request.getParameter("finance_company_id_fk"));

	int finance_branch_id_fk = Integer
			.parseInt(request.getParameter("finance_branch_id_fk") == null ? "0"
					: request.getParameter("finance_branch_id_fk"));
	
	

	FinanceBranchService service = new FinanceBranchService();
	ArrayList<FinanceBranchDto> list = service.getAllFianaceBranchByID(finance_company_id_fk, config, request);
	for (FinanceBranchDto dto : list) {
%>
<option
	<%if (finance_branch_id_fk == dto.getId()) {
					out.print("Selected='selected'");
				}%>
	value="<%=dto.getId()%>"><%=dto.getNAME()%></option>
	
<%
	}
%>


