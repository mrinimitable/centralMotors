<%@page import="com.service.ProductService"%>
<%@page import="com.dto.ProductDto"%>
<%
	String item_code = request.getParameter("icode");

	ProductDto dto = new ProductDto();

	ProductService pro_ser = new ProductService();

	boolean b = pro_ser.getCodeAvail(item_code, request, config);

	if (b) {

		dto = pro_ser.GetItemInfoByCode(item_code, request, config);
%>

<input id="check" type="hidden" value="done" />

<input id="item_id_val" type="hidden" value="<%=dto.getItem_id()%>" />
<input id="item_name_val" type="hidden" value="<%=dto.getItem_name()%>" />
<input id="cat_id_val" type="hidden" value="<%=dto.getCat_id_fk()%>" />
<input id="model_name_val" type="hidden"
	value="<%=dto.getModel_name()%>" />
<input id="gst_per_val" type="hidden" value="<%=dto.getGst_per()%>" />
<input id="gst_sale_price_val" type="hidden"
	value="<%=dto.getGst_sale_price()%>" />


<%
	} else {
%>
<input id="check" type="hidden" value="notdone" />
<%
	}
%>