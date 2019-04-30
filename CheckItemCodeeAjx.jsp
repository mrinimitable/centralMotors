
<%@page import="com.dto.ProductDto"%>
<%@page import="com.service.ProductService"%>
<%
	String itemcode = request.getParameter("Item_code") == null ? ""
			: request.getParameter("Item_code");

	ProductService service = new ProductService();
	ProductDto dto = new ProductDto();

	boolean b = service.checkItemCode(itemcode, request,config);

	if (b) {
%>

<input type="hidden" id="check" value="value" />

<%
	}
%>