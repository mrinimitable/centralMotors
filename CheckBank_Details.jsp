<%@page import="com.service.BankingService"%>
<%@page import="com.dto.BankDto"%>


<%@page import="java.text.DecimalFormat"%>

<%
	//      ye data humne js se liye

	int s1 = Integer.parseInt(request.getParameter("bank_name"));

	BankDto dto = new BankDto();

	BankingService service = new BankingService();

	dto = service.Getbankdetail(s1, request, config);
%>


<input id="bank_name_val" type="hidden" value="<%=dto.getBank_name()%>" />
<input id="account" type="hidden" value="<%=dto.getAccount_no()%>" />
<input id="branch" type="hidden" value="<%=dto.getBranch()%>" />


