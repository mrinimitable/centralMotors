

function autoFocus(bill_id) {

	var item_code = document.getElementById("item_code").value;
	var item_id = document.getElementById("item_id").value;
	var cat_name = document.getElementById("cat_name").value;
	var cat_id = document.getElementById("cat_id").value;
	var gst_per = document.getElementById("gst_per").value;
	var gst_sale_price = document.getElementById("gst_sale_price").value;
	var quantity = document.getElementById("quantity").value;
	var tot_amt = document.getElementById("tot_amt").value;

	var session_year = document.getElementById("session_year").value;
	var creator_id_fk = document.getElementById("creator_id_fk").value;
	var saleing_date = document.getElementById("saleing_date").value;

	if (item_code == "") {
		alert("Select any Name or Insert qty value");
		document.getElementById("item_code").value = "";
		document.getElementById("item_id").value = "";
		document.getElementById("cat_name").value = "";
		document.getElementById("cat_id").value = "0";
		document.getElementById("gst_per").value = "0.0";
		document.getElementById("gst_sale_price").value = "0.0";
		document.getElementById("quantity").value = "0.0";
		document.getElementById("tot_amt").value = "0.0";
		;

	} else if (gst_sale_price == "" || gst_sale_price < 0
			|| isNaN(gst_sale_price)) {
		alert("Insert Sale Price ");
		document.getElementById("gst_sale_price").value = "0";
		document.getElementById("gst_sale_price").focus();
	} else if (quantity == "" || quantity <= 0 || isNaN(quantity)) {
		alert("Insert qty value");
		document.getElementById("quantity").value = "0";
		document.getElementById("quantity").focus();
	} else {

		// setAmount();

		var applicationTable = document.getElementById("tableScroll");

		var newRow = applicationTable.insertRow(preWorkExpIndex - 1);

		// alert(preWorkExpIndex);

		var newCell = newRow.insertCell(0);

		newCell.innerHTML = item_code.toUpperCase() + '<input id="item_code'
				+ preWorkExpIndex + '" type="hidden" name="Item_code" value="'
				+ item_code + '"><input id="cat_name' + preWorkExpIndex
				+ '" type="hidden" name="Cat_name" value="' + cat_name
				+ '"><input id="cat_id' + preWorkExpIndex
				+ '" type="hidden" name="Cat_id" value="' + cat_id
				+ '"><input id="gst_per' + preWorkExpIndex
				+ '" type="hidden" name="Gst_per" value="' + gst_per + '"><input id="item_id' + preWorkExpIndex
				+ '" type="hidden" name="Item_id" value="' + item_id + '">';
		newCell.setAttribute("align", "center");	

				

		var newCell = newRow.insertCell(1);
		newCell.innerHTML = gst_sale_price + '<input id="gst_sale_price'
				+ preWorkExpIndex
				+ '" type="hidden" name="Gst_sale_price" value="'
				+ gst_sale_price + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(2);
		newCell.innerHTML = quantity + '<input id="quantity' + preWorkExpIndex
				+ '" type="hidden" name="Quantity" value="' + quantity + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(3);
		newCell.innerHTML = tot_amt + '<input id="tot_amt' + preWorkExpIndex
				+ '" type="hidden" name="Tot_amt" value="' + tot_amt + '">';
		newCell.setAttribute("align", "center");

		newCell = newRow.insertCell(4);
		newCell.innerHTML = "<img src='img/close.gif' onclick='deleteRow(\""
				+ applicationTable.id
				+ "\",this.parentNode.parentNode.rowIndex); '/>";
				
		
		

		document.getElementById("item_code").value = "";
		document.getElementById("item_id").value = "";
		document.getElementById("cat_name").value = "";
		document.getElementById("cat_id").value = "0";
		document.getElementById("gst_per").value = "0.0";
		document.getElementById("gst_sale_price").value = "0.0";
		document.getElementById("quantity").value = "0.0";
		document.getElementById("tot_amt").value = "0.0";
		document.getElementById("item_code").focus();
		preWorkExpIndex++;

		addProductIntoBill(bill_id, item_code, item_id, cat_name, cat_id,
				gst_per, gst_sale_price, quantity, tot_amt, session_year,
				creator_id_fk, saleing_date);
		

		findTotal();
		
		window.location.reload();
		// findTotalQty();

	}
}

function addProductIntoBill(bill_id, item_code, item_id, cat_name, cat_id,
		gst_per, gst_sale_price, quantity, tot_amt, session_year,
		creator_id_fk, saleing_date) {

	$.ajax({
		url : "new_item_insert_ajax.jsp",
		data : "bill_id=" + bill_id + "&&item_code=" + item_code + "&&item_id="
				+ item_id + "&&cat_name=" + cat_name + "&&cat_id=" + cat_id
				+ "&&gst_per=" + gst_per + "&&gst_sale_price=" + gst_sale_price
				+ "&&quantity=" + quantity + "&&tot_amt=" + tot_amt
				+ "&&session_year=" + session_year + "&&creator_id_fk="
				+ creator_id_fk + "&&saleing_date=" + saleing_date,
		type : "post",
		success : function(msg) {

			// alert(msg);
			$('#rev').html(msg);
			window.location.reload();

		}
	});

}

function deleteRow(tableObjId, i, btnId) {

	var btnObj = document.getElementById(btnId);
	var tblObj = document.getElementById(tableObjId);
	preWorkExpIndex--;

	tblObj.deleteRow(i - 1);

	if (btnObj != null) {
		if (tblObj.rows.length <= 5) {
			btnObj.disabled = "";
		}
	}

	findTotal();
	// findTotalQty();

	manageRow(i);
}

function manageRow(rowNo) {

	var applicationTable = document.getElementById("tableScroll");
	var tblObj = document.getElementById(applicationTable.id);

	for ( var index = rowNo; index <= tblObj.rows.length; index++) {
		j = index + 1;

		var item_code = document.getElementById("item_code" + j).value;
		var item_id = document.getElementById("item_id" + j).value;
		var cat_name = document.getElementById("cat_name" + j).value;
		var cat_id = document.getElementById("cat_id" + j).value;
		var gst_per = document.getElementById("gst_per" + j).value;
		var gst_sale_price = document.getElementById("gst_sale_price" + j).value;
		var quantity = document.getElementById("quantity" + j).value;
		var tot_amt = document.getElementById("tot_amt" + j).value;

		var newRow = applicationTable.insertRow(index - 1);
		// alert(index);

		var newCell = newRow.insertCell(0);

		newCell.innerHTML = item_code.toUpperCase() + '<input id="item_code'
				+ index + '" type="hidden" name="Item_code" value="'
				+ item_code + '"> <input id="cat_name' + index
				+ '" type="hidden" name="Cat_name" value="' + cat_name
				+ '"><input id="cat_id' + index
				+ '" type="hidden" name="Cat_id" value="' + cat_id
				+ '"><input id="gst_per' + index
				+ '" type="hidden" name="Gst_per" value="' + gst_per + '"><input id="item_id' + index
				+ '" type="hidden" name="Item_id" value="' + item_id + '">';
		newCell.setAttribute("align", "center");					

		var newCell = newRow.insertCell(1);
		newCell.innerHTML = gst_sale_price + '<input id="gst_sale_price'
				+ index
				+ '" type="hidden" name="Gst_sale_price" value="'
				+ gst_sale_price + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(2);
		newCell.innerHTML = quantity + '<input id="quantity' + index
				+ '" type="hidden" name="Quantity" value="' + quantity + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(3);
		newCell.innerHTML = tot_amt + '<input id="tot_amt' + index
				+ '" type="hidden" name="Tot_amt" value="' + tot_amt + '">';
		newCell.setAttribute("align", "center");

		newCell = newRow.insertCell(4);
		newCell.innerHTML = "<img src='img/close.gif' onclick='deleteRow(\""
				+ applicationTable.id
				+ "\",this.parentNode.parentNode.rowIndex); '/>";

		tblObj.deleteRow(index);

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

								/*
								 * document.getElementById('item_name').value =
								 * document
								 * .getElementById('item_name_val').value;
								 */

								document.getElementById('cat_id').value = document
										.getElementById('cat_id_val').value;

								document.getElementById('cat_name').value = document
										.getElementById('model_name_val').value;

								document.getElementById('gst_per').value = document
										.getElementById('gst_per_val').value;

								document.getElementById('gst_sale_price').value = document
										.getElementById('gst_sale_price_val').value;

								document.getElementById('quantity').focus();

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