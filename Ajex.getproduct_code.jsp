


<%@page import="com.dto.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.ProductService"%>

<%
	int model_id_fk = Integer
			.parseInt(request.getParameter("model_id_fk") == null ? "0"
					: request.getParameter("model_id_fk"));

	int variant_id_fk = Integer.parseInt(request
			.getParameter("variant_id_fk") == null ? "0" : request
			.getParameter("variant_id_fk"));
	
	

	ProductService pro_ser = new ProductService(); 
	ArrayList<ProductDto> pro_list =pro_ser.getAllProductCodeByCatID(variant_id_fk, config, request); 
	for(ProductDto pro_dto : pro_list) 
	{
		
		
%>
<option value="<%=pro_dto.getItem_code()%>" />
<%
	}
%>



																