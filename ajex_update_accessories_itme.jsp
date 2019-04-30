

<%@page import="com.service.ProductService"%>
<%
	String item_id = request.getParameter("item_id") == null ? "0"
			: request.getParameter("item_id");

	new ProductService().deleteAccessoriesItemByID(item_id, request, config);
%>


