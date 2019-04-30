var preWorkExpIndex = 1;

function autoFocus() {


	var item_name = document.getElementById('item_name').value;
	
	var gst_per = document.getElementById("gst_per").value;
	var cess_per = document.getElementById("cess_per").value;
	var cess_fix = document.getElementById("cess_fix").value;
	var pur_base_price = document.getElementById("pur_base_price").value;
	var dis_per = document.getElementById("dis_per").value;
	var dis_amt = document.getElementById("dis_amt").value;
	var dis_pur_price = document.getElementById("dis_pur_price").value;
	var dis_pur_gst_price = document.getElementById("dis_pur_gst_price").value;
	var qty = document.getElementById("qty").value;
	var tot_amt = document.getElementById("tot_amt").value;
	var pur_gst_price = document.getElementById("pur_gst_price").value;

	var gstamt_with_qty = document.getElementById("gstamt_with_qty").value;
	var CessAmount_with_qty = document.getElementById("CessAmount_with_qty").value;
	var cess_fix_amount_with_qty = document.getElementById("cess_fix_amount_with_qty").value;
	
	

/*	if (item_code == "" || qty == 0) {
		alert("Select any Name or Insert qty value");
		document.getElementById("item_code").value = "";
		document.getElementById("item_id").value = "";
		document.getElementById('item_name').value = "";
		document.getElementById("cat_name").value = "";
		document.getElementById("cat_id").value = "0";
		document.getElementById("measure_id").value = "0";
		document.getElementById("measure_name").value = "";
		document.getElementById("gst_per").value = "0.0";
		document.getElementById("cess_per").value = "0.0";
		document.getElementById("cess_fix").value = "0.0";
		document.getElementById("pur_base_price").value = "0.0";
		document.getElementById("pur_gst_price").value = "0.0";
		document.getElementById("dis_per").value = "0.0";
		document.getElementById("dis_amt").value = "0.0";
		document.getElementById("dis_pur_price").value = "0.0";
		document.getElementById("dis_pur_gst_price").value = "0.0";
		document.getElementById("qty").value = "0.0";
		document.getElementById("tot_amt").value = "0.0";
		document.getElementById("gstamt_with_qty").value = "0.0";
		document.getElementById("CessAmount_with_qty").value = "0.0";
		document.getElementById("cess_fix_amount_with_qty").value = "0.0";
		document.getElementById("hsn_code").value = "";

		// document.getElementById("icode").focus();
	} else*/ if (dis_pur_price == "" || dis_pur_price < 0 || isNaN(dis_pur_price)) {
		alert("Insert Pur Price ");
		document.getElementById("dis_pur_price").value = "0";
		document.getElementById("dis_pur_price").focus();
	} else if (qty == "" || qty <= 0 || isNaN(qty)) {
		alert("Insert qty value");
		document.getElementById("qty").value = "0";
		document.getElementById("qty").focus();
	} else {

		// setAmount();

		var applicationTable = document.getElementById("tableScroll");

		var newRow = applicationTable.insertRow(preWorkExpIndex - 1);

		// alert(preWorkExpIndex);

		

	

		var newCell = newRow.insertCell(0);
		newCell.innerHTML = item_name + '<input id="item_name'
				+ preWorkExpIndex + '" type="hidden" name="Item_name" value="'
				+ item_name 
				+ '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(1);
		newCell.innerHTML = gst_per + '<input id="gst_per' + preWorkExpIndex
				+ '" type="hidden" name="Gst_per" value="' + gst_per + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(2);
		newCell.innerHTML = cess_per + '<input id="cess_per' + preWorkExpIndex
				+ '" type="hidden" name="Cess_per" value="' + cess_per + '">';
		newCell.setAttribute("align", "center");
		newCell.setAttribute("style", "display: none");

		var newCell = newRow.insertCell(3);
		newCell.innerHTML = cess_fix + '<input id="cess_fix' + preWorkExpIndex
				+ '" type="hidden" name="Cess_fix" value="' + cess_fix + '">';
		newCell.setAttribute("align", "center");
		newCell.setAttribute("style", "display : none");

		var newCell = newRow.insertCell(4);

		newCell.innerHTML = pur_base_price + '<input id="pur_base_price'
				+ preWorkExpIndex
				+ '" type="hidden" name="Pur_base_price" value="'
				+ pur_base_price + '"><input id="pur_gst_price'
				+ preWorkExpIndex
				+ '" type="hidden" name="pur_gst_price" value="'
				+ pur_gst_price + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(5);
		newCell.innerHTML = dis_per + '<input id="dis_per' + preWorkExpIndex
				+ '" type="hidden" name="Dis_per" value="' + dis_per + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(6);
		newCell.innerHTML = dis_amt + '<input id="dis_amt' + preWorkExpIndex
				+ '" type="hidden" name="Dis_amt" value="' + dis_amt + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(7);
		newCell.innerHTML = dis_pur_price + '<input id="dis_pur_price'
				+ preWorkExpIndex
				+ '" type="hidden" name="Dis_pur_price" value="'
				+ dis_pur_price + '"><input id="dis_pur_gst_price'
				+ preWorkExpIndex
				+ '" type="hidden" name="Dis_pur_gst_price" value="'
				+ dis_pur_gst_price + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(8);
		newCell.innerHTML = qty + '<input id="qty' + preWorkExpIndex
				+ '" type="hidden" name="Qty" value="' + qty + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(9);
		newCell.innerHTML = tot_amt + '<input id="tot_amt' + preWorkExpIndex
				+ '" type="hidden" name="Tot_amt" value="' + tot_amt
				+ '"><input id="gstamt_with_qty' + preWorkExpIndex
				+ '" type="hidden" name="Gstamt_with_qty" value="'
				+ gstamt_with_qty + '"><input id="CessAmount_with_qty'
				+ preWorkExpIndex
				+ '" type="hidden" name="CessAmount_with_qty" value="'
				+ CessAmount_with_qty + '"><input id="cess_fix_amount_with_qty'
				+ preWorkExpIndex
				+ '" type="hidden" name="Cess_fix_amount_with_qty" value="'
				+ cess_fix_amount_with_qty + '">';
		newCell.setAttribute("align", "center");

		newCell = newRow.insertCell(10);
		newCell.innerHTML = "<img src='img/close.gif' onclick='deleteRow(\""
				+ applicationTable.id
				+ "\",this.parentNode.parentNode.rowIndex); '/>";

		
		document.getElementById('item_name').value = "";
		document.getElementById("gst_per").value = "0.0";
		document.getElementById("cess_per").value = "0.0";
		document.getElementById("cess_fix").value = "0.0";
		document.getElementById("pur_base_price").value = "0.0";
		document.getElementById("pur_gst_price").value = "0.0";
		document.getElementById("dis_per").value = "0.0";
		document.getElementById("dis_amt").value = "0.0";
		document.getElementById("dis_pur_price").value = "0.0";
		document.getElementById("dis_pur_gst_price").value = "0.0";
		document.getElementById("qty").value = "0.0";
		document.getElementById("tot_amt").value = "0.0";
		document.getElementById("gstamt_with_qty").value = "0.0";
		document.getElementById("CessAmount_with_qty").value = "0.0";
		document.getElementById("cess_fix_amount_with_qty").value = "0.0";
		

		document.getElementById("item_name").focus();

		preWorkExpIndex++;

		findTotal();
		findTotalQty();

	}
}

function deleteRow(tableObjId, i, btnId) {

	var btnObj = document.getElementById(btnId);
	var tblObj = document.getElementById(tableObjId);
	preWorkExpIndex--;

	tblObj.deleteRow(i - 1);

	if (btnObj != null) {
		if (tblObj.rows.length <= 7) {
			btnObj.disabled = "";
		}
	}

	findTotal();
	findTotalQty();

	manageRow(i);
}

function manageRow(rowNo) {

	var applicationTable = document.getElementById("tableScroll");
	var tblObj = document.getElementById(applicationTable.id);

	for ( var index = rowNo; index <= tblObj.rows.length; index++) {
		j = index + 1;

		
		var item_name = document.getElementById('item_name' + j).value;
		
		var gst_per = document.getElementById("gst_per" + j).value;
		var cess_per = document.getElementById("cess_per" + j).value;
		var cess_fix = document.getElementById("cess_fix" + j).value;
		var pur_base_price = document.getElementById("pur_base_price" + j).value;
		var pur_gst_price = document.getElementById("pur_gst_price" + j).value;
		var dis_per = document.getElementById("dis_per" + j).value;
		var dis_amt = document.getElementById("dis_amt" + j).value;
		var dis_pur_price = document.getElementById("dis_pur_price" + j).value;
		var dis_pur_gst_price = document
				.getElementById("dis_pur_gst_price" + j).value;

		var qty = document.getElementById("qty" + j).value;
		var tot_amt = document.getElementById("tot_amt" + j).value;
		var gstamt_with_qty = document.getElementById("gstamt_with_qty" + j).value;
		var CessAmount_with_qty = document.getElementById("CessAmount_with_qty"
				+ j).value;
		var cess_fix_amount_with_qty = document.getElementById("cess_fix_amount_with_qty" + j).value;
		

		var newRow = applicationTable.insertRow(index - 1);
		// alert(index);

		

		var newCell = newRow.insertCell(0);
		newCell.innerHTML = item_name + '<input id="item_name'
				+ index + '" type="hidden" name="Item_name" value="'
				+ item_name 
				+ '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(1);
		newCell.innerHTML = gst_per + '<input id="gst_per' + index
				+ '" type="hidden" name="Gst_per" value="' + gst_per + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(2);
		newCell.innerHTML = cess_per + '<input id="cess_per' + index
				+ '" type="hidden" name="Cess_per" value="' + cess_per + '">';
		newCell.setAttribute("align", "center");
		newCell.setAttribute("style", "display : none");

		var newCell = newRow.insertCell(3);
		newCell.innerHTML = cess_fix + '<input id="cess_fix' + index
				+ '" type="hidden" name="Cess_fix" value="' + cess_fix + '">';
		newCell.setAttribute("align", "center");
		newCell.setAttribute("style", "display : none");

		var newCell = newRow.insertCell(4);

		newCell.innerHTML = pur_base_price + '<input id="pur_base_price'
				+ index
				+ '" type="hidden" name="Pur_base_price" value="'
				+ pur_base_price + '"><input id="pur_gst_price'
				+ index
				+ '" type="hidden" name="pur_gst_price" value="'
				+ pur_gst_price + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(5);
		newCell.innerHTML = dis_per + '<input id="dis_per' + index
				+ '" type="hidden" name="Dis_per" value="' + dis_per + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(6);
		newCell.innerHTML = dis_amt + '<input id="dis_amt' + index
				+ '" type="hidden" name="Dis_amt" value="' + dis_amt + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(7);
		newCell.innerHTML = dis_pur_price + '<input id="dis_pur_price'
				+ index
				+ '" type="hidden" name="Dis_pur_price" value="'
				+ dis_pur_price + '"><input id="dis_pur_gst_price'
				+ index
				+ '" type="hidden" name="Dis_pur_gst_price" value="'
				+ dis_pur_gst_price + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(8);
		newCell.innerHTML = qty + '<input id="qty' + index
				+ '" type="hidden" name="Qty" value="' + qty + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(9);
		newCell.innerHTML = tot_amt + '<input id="tot_amt' + index
				+ '" type="hidden" name="Tot_amt" value="' + tot_amt
				+ '"><input id="gstamt_with_qty' + index
				+ '" type="hidden" name="Gstamt_with_qty" value="'
				+ gstamt_with_qty + '"><input id="CessAmount_with_qty'
				+ index
				+ '" type="hidden" name="CessAmount_with_qty" value="'
				+ CessAmount_with_qty + '"><input id="cess_fix_amount_with_qty'
				+ index
				+ '" type="hidden" name="Cess_fix_amount_with_qty" value="'
				+ cess_fix_amount_with_qty + '">';
		newCell.setAttribute("align", "center");

		newCell = newRow.insertCell(10);
		newCell.innerHTML = "<img src='img/close.gif' onclick='deleteRow(\""
				+ applicationTable.id
				+ "\",this.parentNode.parentNode.rowIndex); '/>";

		tblObj.deleteRow(index);
	}
}

function findTotalQty() {
	var arr = document.getElementsByName('Qty');
	var qty = 0;
	for ( var i = 0; i < arr.length; i++) {
		if (parseInt(arr[i].value)) {
			qty += parseInt(arr[i].value);
			document.getElementById('TotalQty').value = qty;
			document.getElementById('TotalQtyDiv').innerHTML = qty;
		}
	}
}

function findTotal() {

	var ratearr = document.getElementsByName('Dis_pur_price');
	var GstamtArr = document.getElementsByName('Gstamt_with_qty');
	var QtyArr = document.getElementsByName('Qty');
	var CessAmt = document.getElementsByName('CessAmount_with_qty');
	var gstperArr = document.getElementsByName('Gst_per');
	var cess_fix_amt = document.getElementsByName('Cess_fix_amount_with_qty');
	var Tot_amtarr = document.getElementsByName('Tot_amt');
	/*var igst_status = document.getElementsByName('igst_status');*/
	

	var total_amt_with_tax = 0.0, total_gst = 0.0, tol_gst_amt_5 = 0.0, tol_gst_amt_12 = 0.0, tol_gst_amt_18 = 0.0, tol_gst_amt_28 = 0.0, tot_CessAmt = 0.0, tot_CessfixAmt = 0.0, taxable_amt_gst_non = 0.0, taxable_amt_gst_0 = 0.0, taxable_amt_gst_5 = 0.0, taxable_amt_gst_12 = 0.0, taxable_amt_gst_18 = 0.0, taxable_amt_gst_28 = 0.0;

	var gstArr_tot = 0.0, total_without_tax = 0.0;

	for ( var i = 0; i < Tot_amtarr.length; i++) {
		if (parseFloat(Tot_amtarr[i].value))
			total_amt_with_tax = total_amt_with_tax
					+ parseFloat(Tot_amtarr[i].value);
	}

	for ( var i = 0; i < GstamtArr.length; i++) {
		gstArr_tot = gstArr_tot + parseFloat(GstamtArr[i].value);

		total_gst = parseFloat(gstArr_tot);

	}

	for ( var i = 0; i < ratearr.length; i++) {
		if (parseFloat(ratearr[i].value))
			total_without_tax = total_without_tax
					+ parseFloat(ratearr[i].value)
					* parseFloat(QtyArr[i].value);
	}

	for ( var i = 0; i < CessAmt.length; i++) {
		tot_CessAmt = tot_CessAmt + parseFloat(CessAmt[i].value);

	}

	for ( var i = 0; i < cess_fix_amt.length; i++) {
		tot_CessfixAmt = tot_CessfixAmt + parseFloat(cess_fix_amt[i].value);

	}

	for ( var i = 0; i < GstamtArr.length; i++) {

		if (parseFloat(gstperArr[i].value) == 5) {
			tol_gst_amt_5 = tol_gst_amt_5 + parseFloat(GstamtArr[i].value);
		}

		if (parseFloat(gstperArr[i].value) == 12) {
			tol_gst_amt_12 = tol_gst_amt_12 + parseFloat(GstamtArr[i].value);
		}

		if (parseFloat(gstperArr[i].value) == 18) {
			tol_gst_amt_18 = tol_gst_amt_18 + parseFloat(GstamtArr[i].value);
		}

		if (parseFloat(gstperArr[i].value) == 28) {
			tol_gst_amt_28 = tol_gst_amt_28 + parseFloat(GstamtArr[i].value);
		}

	}

	for ( var i = 0; i < ratearr.length; i++) {

		if (parseFloat(gstperArr[i].value) == 0) {

			taxable_amt_gst_0 = taxable_amt_gst_0
					+ parseFloat(ratearr[i].value)
					* parseFloat(QtyArr[i].value);
		}
	}

	for ( var i = 0; i < ratearr.length; i++) {

		if (parseFloat(gstperArr[i].value) == 5) {

			taxable_amt_gst_5 = taxable_amt_gst_5
					+ parseFloat(ratearr[i].value)
					* parseFloat(QtyArr[i].value);
		}
	}

	for ( var i = 0; i < ratearr.length; i++) {

		if (parseFloat(gstperArr[i].value) == 12) {

			taxable_amt_gst_12 = taxable_amt_gst_12
					+ parseFloat(ratearr[i].value)
					* parseFloat(QtyArr[i].value);
		}
	}

	for ( var i = 0; i < gstperArr.length; i++) {

		if (parseFloat(ratearr[i].value) == 18) {

			taxable_amt_gst_18 = taxable_amt_gst_18
					+ parseFloat(ratearr[i].value)
					* parseFloat(QtyArr[i].value);
		}
	}

	for ( var i = 0; i < ratearr.length; i++) {

		if (parseFloat(gstperArr[i].value) == 28) {

			taxable_amt_gst_28 = taxable_amt_gst_28
					+ parseFloat(ratearr[i].value)
					* parseFloat(QtyArr[i].value);
		}
	}

	var s_c_gst = total_gst / 2;

	var tot_basic_amount = parseFloat(total_without_tax).toFixed(2);

	document.getElementById('totalAmountwithouttax_span').innerHTML = parseFloat(
			tot_basic_amount).toFixed(2);

	document.getElementById('totalAmountwithouttax').value = parseFloat(
			tot_basic_amount).toFixed(2);

	document.getElementById("gst_all_tax").value = total_gst.toFixed(2);

	document.getElementById('cess').value = parseFloat(tot_CessAmt).toFixed(2);
	document.getElementById('cess_span').innerHTML = parseFloat(tot_CessAmt)
			.toFixed(2);

	document.getElementById('cess_fix_amt').value = parseFloat(tot_CessfixAmt)
			.toFixed(2);
	document.getElementById('cess_fix_amt_span').innerHTML = parseFloat(
			tot_CessfixAmt).toFixed(2);

	document.getElementById('totalAmountwithtaxSpan').innerHTML = parseFloat(
			total_amt_with_tax).toFixed(2);
	document.getElementById('totalAmountwithtax').value = parseFloat(
			total_amt_with_tax).toFixed(2);

	

		document.getElementById("cgst_span").innerHTML = (s_c_gst).toFixed(2);

		document.getElementById("sgst_span").innerHTML = (s_c_gst).toFixed(2);
	

	document.getElementById('netAmountSpan').innerHTML = parseFloat(
			total_amt_with_tax).toFixed(2);

	document.getElementById('netAmount').value = parseFloat(total_amt_with_tax)
			.toFixed(2);

	var s_c_gst5 = tol_gst_amt_5 / 2;
	var s_c_gst12 = tol_gst_amt_12 / 2;
	var s_c_gst18 = tol_gst_amt_18 / 2;
	var s_c_gst28 = tol_gst_amt_28 / 2;

	document.getElementById('taxable_value_0').value = parseFloat(
			taxable_amt_gst_0).toFixed(2);

	// document.getElementById('vat0_span').innerHTML =
	// parseFloat(taxable_amt_gst_0).toFixed(2);

	document.getElementById('tax_amt_5').value = parseFloat(tol_gst_amt_5)
			.toFixed(2);

	document.getElementById('taxable_value_5').value = parseFloat(
			taxable_amt_gst_5).toFixed(2);

	/*
	 * document.getElementById('taxable_value_5_span').innerHTML = parseFloat(
	 * tax_amt_vat5).toFixed(2);
	 * 
	 * document.getElementById("s_vat5_span").innerHTML = s_c_gst5.toFixed(2);
	 * 
	 * document.getElementById("c_vat5_span").innerHTML = s_c_gst5.toFixed(2);
	 */

	/* ,,,,,,,,,,,,,,,,,,,,12vat,,,,,,,,,, */

	document.getElementById('tax_amt_12').value = parseFloat(tol_gst_amt_12)
			.toFixed(2);

	document.getElementById('taxable_value_12').value = parseFloat(
			taxable_amt_gst_12).toFixed(2);
	/*
	 * document.getElementById('taxable_value_12_span').innerHTML = parseFloat(
	 * taxable_amt_gst_12).toFixed(2);
	 * 
	 * document.getElementById("s_vat12_span").innerHTML = s_c_gst12.toFixed(2);
	 * 
	 * document.getElementById("c_vat12_span").innerHTML = s_c_gst12.toFixed(2);
	 */

	/* ,,,,,,,,,,,,,,,,,,,,18vat,,,,,,,,,, */

	document.getElementById('tax_amt_18').value = parseFloat(tol_gst_amt_18)
			.toFixed(2);

	document.getElementById('taxable_value_18').value = parseFloat(
			taxable_amt_gst_18).toFixed(2);

	/*
	 * document.getElementById('taxable_value_18_span').innerHTML = parseFloat(
	 * taxable_amt_gst_18).toFixed(2);
	 * 
	 * document.getElementById("s_vat18_span").innerHTML = s_c_gst18.toFixed(2);
	 * 
	 * document.getElementById("c_vat18_span").innerHTML = s_c_gst18.toFixed(2);
	 */

	/* ,,,,,,,,,,,,,,,,,,,,28vat,,,,,,,,,, */

	document.getElementById('tax_amt_28').value = parseFloat(tol_gst_amt_28)
			.toFixed(2);

	document.getElementById('taxable_value_28').value = parseFloat(
			taxable_amt_gst_28).toFixed(2);

	/*
	 * document.getElementById('taxable_value_28_span').innerHTML = parseFloat(
	 * taxable_amt_gst_28).toFixed(2);
	 * 
	 * document.getElementById("s_vat28_span").innerHTML = s_c_gst28.toFixed(2);
	 * 
	 * document.getElementById("c_vat28_span").innerHTML = s_c_gst28.toFixed(2);
	 */

	netamt();
	returnAmt(0);

}

function netamt() {

	var Transportation = document.getElementById("Transportation").value;

	if (Transportation != null && Transportation != "") {
		var aTotal = document.getElementById("totalAmountwithtax").value;
		var aTransportation = document.getElementById("Transportation").value;
		var afreight = document.getElementById("freight").value;

		var netAmount_val = 0;

		netAmount_val = (parseFloat(aTotal) + parseFloat(aTransportation) + parseFloat(afreight));

		document.getElementById("netAmount").value = netAmount_val.toFixed(2);
		document.getElementById("netAmountSpan").innerHTML = netAmount_val
				.toFixed(2);
		
		
		document.getElementById("final_amt").value = netAmount_val.toFixed(2);
		document.getElementById("final_amtSpan").innerHTML = netAmount_val
				.toFixed(2);

	} else {
		document.getElementById("NetDiscount").value = 0;
		return false;
	}

}

function convertrounfoff() {

	var roundoff = document.getElementById("roundoff").value;

	if (roundoff != null && roundoff != "") {
		var anetAmount = document.getElementById("netAmount").value;
		var aroundoff = document.getElementById("roundoff").value;

		var finlanetAmount_val = 0;

		finlanetAmount_val = (parseFloat(anetAmount) - parseFloat(aroundoff));

		document.getElementById("final_amt").value = finlanetAmount_val
				.toFixed(2);
		document.getElementById("final_amtSpan").innerHTML = finlanetAmount_val
				.toFixed(2);

	} else {
		document.getElementById("roundoff").value = 0;
		return false;
	}

}

function showHideDD(flag) {
	if (flag == 'DD' || flag == 'Cheque' || flag == 'Swap') {
		showHideTemplateByCheckBox(true, 'ddDiv');
	} else {
		showHideTemplateByCheckBox(false, 'ddDiv');
	}
	document.getElementById("ddno").value = "";
	document.getElementById("bankname").value = "";
	document.getElementById("ddDate").value = "";
	document.getElementById("dd_amount").value = "0";
	returnAmt(0);
}

function showHideTemplateByCheckBox(flag, htmlObj) {
	// alert(htmlObj);
	var htmlObj1 = document.getElementById(htmlObj);
	if (htmlObj1 != undefined) {
		if (flag) {
			htmlObj1.style.display = "inline";
		} else {
			htmlObj1.style.display = "none";
		}
	}
}

function returnAmt(aAmtPaid_a) {

	var paid_amount_val = document.getElementById("paid_amount").value;

	var dd_amount_val = document.getElementById("dd_amount").value;

	if (paid_amount_val != null && paid_amount_val != "") {

		var afinal_amt = document.getElementById("final_amt").value;

		var dd_amount = 0;

		if (dd_amount_val == "" || isNaN(dd_amount_val)) {

			dd_amount = 0;

		} else {
			dd_amount = dd_amount_val;
		}

		var total_paid_amt = parseFloat(paid_amount_val)
				+ parseFloat(dd_amount);

		var balance_amt = parseFloat(afinal_amt) - parseFloat(total_paid_amt);

		document.getElementById("returnAmount").value = balance_amt.toFixed(2);
		document.getElementById("returnAmountSpan").innerHTML = balance_amt
				.toFixed(2);
	} else {
		document.getElementById("returnAmount").value = "0";
		document.getElementById("paid_amount").focus();
	}
}

function checkCodeAvail(code) {

	if (code != "") {

		$
				.ajax({

					url : 'Item.CodeAvailAjax.jsp',
					data : 'icode=' + code,
					type : 'post',
					success : function(msg) {

						// alert(msg);

						$('#rev').html(msg);

						var check = document.getElementById("check").value;
						// alert(check);

						if (check == "done") {

							var duplicate_value = findDuplicateCode();

							if (duplicate_value == 0) {

								document.getElementById('item_id').value = document
										.getElementById('item_id_val').value;

								document.getElementById('item_name').value = document
										.getElementById('item_name_val').value;
								document.getElementById('cat_id').value = document
										.getElementById('cat_id_val').value;

								document.getElementById('cat_name').value = document
										.getElementById('cat_name_val').value;
								document.getElementById('measure_id').value = document
										.getElementById('measure_id_val').value;
								document.getElementById('measure_name').value = document
										.getElementById('measure_name_val').value;
								document.getElementById('gst_per').value = document
										.getElementById('gst_per_val').value;
								document.getElementById('cess_per').value = document
										.getElementById('cess_per_val').value;
								document.getElementById('cess_fix').value = document
										.getElementById('cess_fix_val').value;

								document.getElementById('pur_base_price').value = document
										.getElementById('pur_base_price_val').value;
								document.getElementById('pur_gst_price').value = document
										.getElementById('pur_gst_price_val').value;

								document.getElementById('hsn_code').value = document
										.getElementById('hsn_code_val').value;

								document.getElementById('pur_base_price')
										.focus();

							}
						} else {

							alert("Code is Incorrect");
							document.getElementById('item_code').value = a;
							document.getElementById('item_name').value = a;
							// document.getElementById('icode' + index).focus();
						}

					}
				});
	} else {
		document.getElementById('item_code').focus();
	}
}

function findDuplicateCode() {

	var arr = document.getElementsByName("Item_code");
	var ret = 0;

	for ( var i = 1; i <= arr.length; i++) {

		if (document.getElementById("item_code").value.toUpperCase() == document
				.getElementById("item_code" + i).value.toUpperCase()) {

			// alert(document.getElementById("itemCode" + i).value);

			ret = 1;
			alert("Same Code");

			document.getElementById('item_code').value = "";
			document.getElementById('item_name').value = "";
			// document.getElementById('icode' + preWorkExpIndex).focus();
		}
	}
	return ret;
}

function onlyNumberWithFloat(htmlEvent, allowChar) {
	var keynum;
	if (window.event) // IE
	{
		keynum = htmlEvent.keyCode;
	} else if (htmlEvent.which) // Netscape/Firefox/Opera
	{
		keynum = htmlEvent.which;
	}
	// alert(keynum);
	// alert(allowChar.charCodeAt(0));
	var code = '';
	if (allowChar != undefined) {
		code = allowChar.charCodeAt(0);
	}
	if (keynum < 46 || keynum > 57 || keynum == 47) {
		if (keynum != 8 && keynum != code) {
			return false;
		}
	}
}

function checkinvoiceno() {
	
	var spent_id = document.getElementById("pur_bill_id"). value;
	var invoiceno = document.getElementById("invoiceno").value;
	var c_y_session = document.getElementById("c_y_session").value;
	
		$.ajax({

			url : 'Check_Spent_Invoice_Ajax.jsp',
			data : 'invoiceno=' + invoiceno ,
			type : 'post',
			success : function(msg) {
				$('#checkinvoicenodiv').html(msg);

				var a2 = document.getElementById("billnum").value;
				
				if (a2 == "ok") {

					var a = "";

					alert("Invoice  No. is Already Entered");

					document.getElementById('invoiceno').value = a;
					document.getElementById('invoiceno').focus();
				} else {

				}
			}

		});
	
}
