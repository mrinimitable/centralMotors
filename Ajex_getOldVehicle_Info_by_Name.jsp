<%@page import="com.dto.OldVehicleDto"%>
<%@page import="com.service.OldVehicleService"%>
<%@page import="com.service.PurchaseService"%>
<%@page import="com.dto.PurchaseVehicleDto"%>
<%@page import="com.service.ProductService"%>
<%@page import="com.dto.ProductDto"%>
<%
	String item_code = request.getParameter("icode");

	OldVehicleService pur_service = new OldVehicleService();

	OldVehicleDto dto = pur_service.getOlDVehicleByVehicleName(
			item_code, request, config);
%>

<input id="check" type="hidden" value="done" />

<input id="id_val" type="hidden" value="<%=dto.getId()%>" />

<input id="old_vehicle_reg_no_val" type="hidden"
	value="<%=dto.getExchange_vehicle_reg_no()%>" />
<input id="old_vehicle_value_val" type="hidden"
	value="<%=dto.getExchange_vehicle_value()%>" />
<input id="customer_name_val" type="hidden"
	value="<%=dto.getCustmer_name()%>" />
<input id="customer_mobile_no_val" type="hidden"
	value="<%=dto.getMobile_no()%>" />
<input id="customer_address_val" type="hidden"
	value="<%=dto.getAddress()%>" />
	
	<input id="exchange_bonus_val" type="hidden"
	value="<%=dto.getExchange_bonus()%>" />






