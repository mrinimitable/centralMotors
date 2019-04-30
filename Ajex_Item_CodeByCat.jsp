<%@page import="java.util.ArrayList"%>
<%@page import="com.service.ProductService"%>
<%@page import="com.dto.ProductDto"%>
<%
	int cat_name = Integer
			.parseInt(request.getParameter("cat_name") == null ? ""
					: request.getParameter("cat_name"));

	ProductService pro_ser = new ProductService();
	ArrayList<ProductDto> pro_lis = pro_ser.getAllProductCodeByCatID(
			cat_name, config, request);
	for (ProductDto pro_dto : pro_lis) {
%>

<option value="<%=pro_dto.getItem_code()%>" />
<%
	}
%>
