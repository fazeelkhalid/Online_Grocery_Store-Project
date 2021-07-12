
function myFunction() {
    myVar = setTimeout(showPage, 1000);
}

function showPage() {
    document.getElementById("loader").style.display = "none";
    document.getElementById("myDiv").style.display = "block";
}

var blink = document.getElementById('blink');
setInterval(function () {
    blink.style.opacity = (blink.style.opacity == 0 ? 1 : 0);
}, 1300);

function CallButtonEvent(id) {
    alert("Product Id: " + id);
    PageMethods.GetData(id);
}

function deleteProduct(id) {
    alert("Product of admin id :" + id);
	PageMethods.Removeproduct_table(id);
}

function deleteProductFromCart(id) {
    alert("Product Id: " + id);
    PageMethods.removeIdCart(id);
}


