
<%@page import="com.service.FinanceBankService"%>
<%@page import="com.servlet.FinanceBankServlet"%>
<%@page import="com.service.FinanceBranchService"%>
<%
	String name = request.getParameter("name") == null ? ""
			: request.getParameter("name");

		int id =Integer.parseInt(request.getParameter("id")== null ? "0" : request.getParameter("id"));

	FinanceBankService service = new FinanceBankService();
	

	boolean b = service.checkFinanceBanknameUpdate(name, id, request,config);  


%>

<input type="hidden" id="check" value="<%=b%>" />

