

<%@page import="com.dto.ProductDto"%>
<%@page import="com.service.ProductService"%>
<%
	ProductDto dto = new ProductDto();
	ProductService pro_ser = new ProductService();

	dto.setItem_id_fk(Integer
			.parseInt(request.getParameter("item_id") == null ? "0"
					: request.getParameter("item_id")));

	String vehecle_id = request.getParameter("bill_id") == null ? "0"
			: request.getParameter("bill_id");

	dto.setCat_id_fk(Integer
			.parseInt(request.getParameter("cat_id") == null ? "0"
					: request.getParameter("cat_id")));

	dto.setCat_name(request.getParameter("cat_name") == null ? "0"
			: request.getParameter("cat_name"));

	dto.setItem_code(request.getParameter("item_code") == null ? "0"
			: request.getParameter("item_code"));

	dto.setCat_name(request.getParameter("cat_name") == null ? "0"
			: request.getParameter("cat_name"));

	dto.setItem_qty(Float
			.parseFloat(request.getParameter("qty") == null ? "0.00"
					: request.getParameter("qty")));

	dto.setGst_sale_price(Float.parseFloat(request
			.getParameter("gst_sale_price") == null ? "0.00" : request
			.getParameter("gst_sale_price")));

	dto.setItem_qty(Float
			.parseFloat(request.getParameter("quantity") == null ? "0.00"
					: request.getParameter("quantity")));

	dto.setGst_per(Float
			.parseFloat(request.getParameter("gst_per") == null ? "0.00"
					: request.getParameter("gst_per")));

	dto.setC_y_session(request.getParameter("session_year") == null ? "0.00"
			: request.getParameter("session_year"));

	dto.setCreator_id_fk(Integer.parseInt(request
			.getParameter("creator_id_fk") == null ? "0.00" : request
			.getParameter("creator_id_fk")));

	dto.setSale_date(request.getParameter("saleing_date") == null ? "0.00"
			: request.getParameter("saleing_date"));

	pro_ser.insertproductItem(dto, vehecle_id, request, config);
%>

