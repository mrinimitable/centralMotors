
<%@page import="com.service.VariantService"%>
<%@page import="com.dto.VariantDto"%>
<%
	String count = request.getParameter("count");

	VariantDto dto = new VariantDto();

	dto.setId(Integer.parseInt(request.getParameter("varientid")));

	dto.setShowroom_price(Float.parseFloat(request
			.getParameter("showroom_price")));
	dto.setRto_tax_price(Float.parseFloat(request
			.getParameter("rto_tax_price")));
	dto.setInsurance_price(Float.parseFloat(request
			.getParameter("insurance_price")));
	dto.setHandling_charges(Float.parseFloat(request
			.getParameter("handling_charges")));
	dto.setExchange_bonus_amount(Float.parseFloat(request
			.getParameter("exchange_bonus_amount")));
	dto.setLottery_bonus_amount(Float.parseFloat(request
			.getParameter("lottery_bonus_amount")));

	dto.setCorporate_bonus_amount(Float.parseFloat(request
			.getParameter("corporate_bonus_amount")));

	dto.setVarient_date(request.getParameter("aDateValue"));

	dto.setGst_per(Float.parseFloat(request.getParameter("gst_per")));
	dto.setCess_per(Float.parseFloat(request.getParameter("cess_per")));
	dto.setTcs_per(Float.parseFloat(request.getParameter("tcs_per")));

	dto.setRsa_amount(Float.parseFloat(request
			.getParameter("rsa_amount")));
	dto.setExtended_warranty_amount(Float.parseFloat(request
			.getParameter("extended_warranty_amount")));
	dto.setOther_charges(Float.parseFloat(request
			.getParameter("other_charges")));

	dto.setTcs_amount(Float.parseFloat(request
			.getParameter("tcs_amount")));

	dto.setModel_id_fk(Integer.parseInt(request
			.getParameter("model_id_fk")));
	dto.setNAME(request.getParameter("NAME"));

	dto.setCreator_id_fk(Integer.parseInt(request
			.getParameter("creator_id_fk")));

	dto.setShowroom_gross_price(Float.parseFloat(request
			.getParameter("showroom_gross_price")));

	dto.setConsumer_schemes(Float.parseFloat(request
			.getParameter("consumer_schemes")));

	VariantService service = new VariantService();

	System.out.println("-----" + dto.getId());

	boolean b = service.updateVarient_Check(dto, request, config);

	dto = service.getVariantById(dto.getId(), request, config);

	float Showroomprice = dto.getShowroom_price();
	float rto_tax_price = dto.getRto_tax_price();
	float insurance_price = dto.getInsurance_price();
	float handling_charges = dto.getHandling_charges();
	float exchange_bonus_amount = dto.getExchange_bonus_amount();
	float lottery_bonus_amount = dto.getLottery_bonus_amount();
	float corporate_bonus_amount = dto.getCorporate_bonus_amount();

	float gst_per = dto.getGst_per();
	float cess_per = dto.getCess_per();
	float tcs_per = dto.getTcs_per();
	float tcs_amount = dto.getTcs_amount();

	float rsa_amount = dto.getRsa_amount();
	float extended_warranty_amount = dto.getExtended_warranty_amount();
	float other_charges = dto.getOther_charges();

	if (b) {
%>

<input type="hidden" id="status<%=count%>" value="done">

<input type="hidden" id="newShowroomprice<%=count%>"
	value="<%=Showroomprice == 0 ? "0" : Showroomprice%>">

<input type="hidden" id="newrto_tax_price<%=count%>"
	value="<%=rto_tax_price == 0 ? "0" : rto_tax_price%>">

<input type="hidden" id="newinsurance_price<%=count%>"
	value="<%=insurance_price == 0 ? "0" : insurance_price%>">

<input type="hidden" id="newhandling_charges<%=count%>"
	value="<%=handling_charges == 0 ? "0" : handling_charges%>">

<input type="hidden" id="newexchange_bonus_amount<%=count%>"
	value="<%=exchange_bonus_amount == 0 ? "0"
						: exchange_bonus_amount%>">
<input type="hidden" id="newlottery_bonus_amount<%=count%>"
	value="<%=lottery_bonus_amount == 0 ? "0"
						: lottery_bonus_amount%>">
<input type="hidden" id="newcorporate_bonus_amount<%=count%>"
	value="<%=corporate_bonus_amount == 0 ? "0"
						: corporate_bonus_amount%>">


<input type="hidden" id="newgst_per<%=count%>"
	value="<%=gst_per == 0 ? "0" : gst_per%>">

<input type="hidden" id="newcess_per<%=count%>"
	value="<%=cess_per == 0 ? "0" : cess_per%>">

<input type="hidden" id="newtcs_per<%=count%>"
	value="<%=tcs_per == 0 ? "0" : tcs_per%>">
<input type="hidden" id="newtcs_amount<%=count%>"
	value="<%=tcs_amount == 0 ? "0" : tcs_amount%>">

<!-- rsa_amount,extended_warranty_amount,other_charges -->

<input type="hidden" id="newrsa_amount<%=count%>"
	value="<%=rsa_amount == 0 ? "0" : rsa_amount%>">

<input type="hidden" id="newextended_warranty_amount<%=count%>"
	value="<%=extended_warranty_amount == 0 ? "0"
						: extended_warranty_amount%>">

<input type="hidden" id="newother_charges<%=count%>"
	value="<%=other_charges == 0 ? "0" : other_charges%>">

<input type="hidden" id="newshowroom_gross_price<%=count%>"
	value="<%=dto.getShowroom_gross_price() == 0 ? "0" : dto
						.getShowroom_gross_price()%>">

<input type="hidden" id="newconsumer_schemes<%=count%>"
	value="<%=dto.getConsumer_schemes() == 0 ? "0" : dto
						.getConsumer_schemes()%>">




<%
	}

	else {
%>
<input type="hidden" id="status<%=count%>"
	value="Please Select Different date.">
<input type="hidden" id="newShowroomprice<%=count%>"
	value="<%=Showroomprice == 0 ? "0" : Showroomprice%>">

<input type="hidden" id="newrto_tax_price<%=count%>"
	value="<%=rto_tax_price == 0 ? "0" : rto_tax_price%>">

<input type="hidden" id="newinsurance_price<%=count%>"
	value="<%=insurance_price == 0 ? "0" : insurance_price%>">

<input type="hidden" id="newhandling_charges<%=count%>"
	value="<%=handling_charges == 0 ? "0" : handling_charges%>">

<input type="hidden" id="newexchange_bonus_amount<%=count%>"
	value="<%=exchange_bonus_amount == 0 ? "0"
						: exchange_bonus_amount%>">
<input type="hidden" id="newlottery_bonus_amount<%=count%>"
	value="<%=lottery_bonus_amount == 0 ? "0"
						: lottery_bonus_amount%>">
<input type="hidden" id="newcorporate_bonus_amount<%=count%>"
	value="<%=corporate_bonus_amount == 0 ? "0"
						: corporate_bonus_amount%>">

<input type="hidden" id="newgst_per<%=count%>"
	value="<%=gst_per == 0 ? "0" : gst_per%>">

<input type="hidden" id="newcess_per<%=count%>"
	value="<%=cess_per == 0 ? "0" : cess_per%>">

<input type="hidden" id="newtcs_per<%=count%>"
	value="<%=tcs_per == 0 ? "0" : tcs_per%>">
<input type="hidden" id="newtcs_amount<%=count%>"
	value="<%=tcs_amount == 0 ? "0" : tcs_amount%>">


<input type="hidden" id="newrsa_amount<%=count%>"
	value="<%=rsa_amount == 0 ? "0" : rsa_amount%>">

<input type="hidden" id="newextended_warranty_amount<%=count%>"
	value="<%=extended_warranty_amount == 0 ? "0"
						: extended_warranty_amount%>">

<input type="hidden" id="newother_charges<%=count%>"
	value="<%=other_charges == 0 ? "0" : other_charges%>">
	
	
	<input type="hidden" id="newshowroom_gross_price<%=count%>"
	value="<%=dto.getShowroom_gross_price() == 0 ? "0" : dto
						.getShowroom_gross_price()%>">

<input type="hidden" id="newconsumer_schemes<%=count%>"
	value="<%=dto.getConsumer_schemes() == 0 ? "0" : dto
						.getConsumer_schemes()%>">



<%
	}
%>


