<%@page import="com.service.PurchaseService"%>
<%@page import="com.dto.PurchaseVehicleDto"%>
<%@page import="com.service.ProductService"%>
<%@page import="com.dto.ProductDto"%>
<%
	String item_code = request.getParameter("icode");

	PurchaseVehicleDto dto = new PurchaseVehicleDto();

	PurchaseService pro_ser = new PurchaseService();

	dto = pro_ser.gePurchaseVehicleByVehicleId(item_code, request,
			config);
%>

<input id="check" type="hidden" value="done" />

<input id="id_val" type="hidden" value="<%=dto.getId()%>" />
<input id="model_id_fk_val" type="hidden"
	value="<%=dto.getModel_id_fk()%>" />
<input id="model_name_val" type="hidden"
	value="<%=dto.getModel_name()%>" />
<input id="variant_id_fk_val" type="hidden"
	value="<%=dto.getVariant_id_fk()%>" />
<input id="variant_name_val" type="hidden"
	value="<%=dto.getVariant_name()%>" />
<input id="color_id_fk_val" type="hidden"
	value="<%=dto.getColor_id_fk()%>" />

<input id="color_name_val" type="hidden"
	value="<%=dto.getColor_name()%>" />


<input id="chechis_no_val" type="hidden"
	value="<%=dto.getChechis_no()%>" />
<input id="engine_number_val" type="hidden"
	value="<%=dto.getEngine_number()%>" />




