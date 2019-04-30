
<%@page import="com.dto.AdminBillChangeDto"%>
<%@page import="com.service.AdminBillChangeService"%>
<%
	AdminBillChangeService project_info_head_service = new AdminBillChangeService();
	

AdminBillChangeDto project_info_head_dto = project_info_head_service
			.GetProjectdetail(request, config);
%>