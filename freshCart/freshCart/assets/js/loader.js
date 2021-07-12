
function myFunction() {
    myVar = setTimeout(showPage, 1000);
}

function showPage() {
    document.getElementById("loader").style.display = "none";
    document.getElementById("myDiv").style.display = "block";
}

var blink = document.getElementById('blink');
setInterval(function () {
	if(blink) blink.style.opacity = (blink.style.opacity == 0 ? 1 : 0);
}, 1300);

function CallButtonEvent(id) {
    alert("Product Id: " + id);
    PageMethods.GetData(id);
}

function deleteProduct(id) {
    alert("Product of admin id :" + id);
	PageMethods.Removeproduct_table(id);
}

function deleteProductFromCart(id) { // delete any product from the product table
    alert("Product Id: " + id);
    PageMethods.removeIdCart(id);
}

function blockunblockCust(id) { // block and ublock the cutomers
    alert("customer of admin id :" + id);
	PageMethods.blockUnblocCust(id);
}

function removeSupplier(id) { // remove the supplier
    alert("customer of admin id :" + id);
	PageMethods.removeSupplier_(id);
}

function removeCouponJS(id) { // remove the coupon
    alert("Remove coupon Id :" + id);
	PageMethods.removeCoupon(id);
	document.getElementById(id).value = "Remove coupon sucessfully";
	
}
function applycoupon(id) { // add coupon
    alert("add coupon id :" + id );
	var textBoxTex = document.getElementById(id).value;
	if(textBoxTex == ""){
		document.getElementById(id).value = "Text box empty";
		return;
	}
	else if(textBoxTex.length>3){
		document.getElementById(id).value = "Enter value(1 to 100)";
		return;
	}
	else {
		for(var i =0; i < textBoxTex.length; i++){
			if(textBoxTex.charAt(i)<'0' || textBoxTex.charAt(i) > '9'){
				document.getElementById(id).value = "Value not valid";
				return;
			}
		}
	}
	if(parseInt(textBoxTex)<0 || parseInt(textBoxTex)>100){ // check is user enter value from 1 to 100 if not display warning
		document.getElementById(id).value = "Enter value(1 to 100)";
		return;
	}
	PageMethods.applycoupon_(id, textBoxTex);
	document.getElementById(id).value = "Update sucessfully";
}

function restructCust(id) { // block and unblock the customer
    alert("Block and unblock the customer Id :" + id);
	PageMethods.blockUnblockCust(id);
}

function orderDelivered(id){ // function for order delivered
	alert("order delivered order Id :" + id);
	PageMethods.orderDeliveredCS(id);
	
}



