

<%@page import="com.dto.VariantDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.VariantService"%>

<%
	int variant_id_fk = Integer.parseInt(request
			.getParameter("variant_id_fk") == null ? "0" : request
			.getParameter("variant_id_fk"));

	VariantService service = new VariantService();
	VariantDto dto = service.getVariantPriceById(variant_id_fk,
			request, config);
%>



<input type="hidden" id="price_a"
	value="<%=dto.getVarient_price() == 0 ? 0 : dto.getVarient_price()%>" />


<input type="hidden" id="variant_exchange_bonus_amount_a"
	value="<%=dto.getExchange_bonus_amount() == 0 ? 0 : dto
					.getExchange_bonus_amount()%>" />

<input type="hidden" id="variant_lottery_bonus_amount_a"
	value="<%=dto.getLottery_bonus_amount() == 0 ? 0 : dto
					.getLottery_bonus_amount()%>" />

<input type="hidden" id="variant_corporate_bonus_amount_a"
	value="<%=dto.getCorporate_bonus_amount() == 0 ? 0 : dto
					.getCorporate_bonus_amount()%>" />

<input type="hidden" id="showroom_price_a"
	value="<%=dto.getShowroom_price() == 0 ? 0 : dto
					.getShowroom_price()%>" />

<input type="hidden" id="rto_tax_price_a"
	value="<%=dto.getRto_tax_price() == 0 ? 0 : dto.getRto_tax_price()%>" />

<input type="hidden" id="insurance_price_a"
	value="<%=dto.getInsurance_price() == 0 ? 0 : dto
					.getInsurance_price()%>" />

<input type="hidden" id="gst_per_a"
	value="<%=dto.getGst_per() == 0 ? 0 : dto.getGst_per()%>" />

<input type="hidden" id="cess_per_a"
	value="<%=dto.getCess_per() == 0 ? 0 : dto.getCess_per()%>" />

<input type="hidden" id="tcs_per_a"
	value="<%=dto.getTcs_per() == 0 ? 0 : dto.getTcs_per()%>" />

<input type="hidden" id="handling_charges_a"
	value="<%=dto.getHandling_charges() == 0 ? 0 : dto
					.getHandling_charges()%>" />

<input type="hidden" id="tcs_amount_a"
	value="<%=dto.getTcs_amount() == 0 ? 0 : dto.getTcs_amount()%>" />


<input type="hidden" id="rsa_amount_a"
	value="<%=dto.getRsa_amount() == 0 ? 0 : dto.getRsa_amount()%>" />

<input type="hidden" id="extended_warranty_amount_a"
	value="<%=dto.getExtended_warranty_amount() == 0 ? 0 : dto
					.getExtended_warranty_amount()%>" />

<input type="hidden" id="other_charges_a"
	value="<%=dto.getOther_charges() == 0 ? 0 : dto.getOther_charges()%>" />

<input type="hidden" id="showroom_gross_price_a"
	value="<%=dto.getShowroom_gross_price() == 0 ? "0" : dto
					.getShowroom_gross_price()%>">

<input type="hidden" id="consumer_schemes_a"
	value="<%=dto.getConsumer_schemes() == 0 ? "0" : dto
					.getConsumer_schemes()%>">

