	//PIZZA SIZE
function getReceipt() {
	// This initializes our string so it can get passed from  
	// function to function, growing line by line into a full receipt
	var text1 = "<h3>You Ordered:</h3>";
	var runningTotal = 0;
	var sizeTotal = 0;
	var sizeArray = document.getElementsByClassName("size");
	for (var i = 0; i < sizeArray.length; i++) {
		if (sizeArray[i].checked) {
			var selectedSize = sizeArray[i].value;
			text1 = text1+selectedSize+"<br>";
		}
	}
	if (selectedSize === "Personal Pizza") {
		sizeTotal = 6;
	} else if (selectedSize === "Medium Pizza") {
		sizeTotal = 10;
	} else if (selectedSize === "Large Pizza") {
		sizeTotal = 14;
	} else if (selectedSize === "X-Large Pizza") {
		sizeTotal = 16;
	}
	runningTotal = sizeTotal;
	console.log(selectedSize+" = $"+sizeTotal+".00");
	console.log("subtotal: $"+runningTotal+".00");
	document.getElementById("showText").innerHTML=(text1);
	
	//runningTotal+= getCrust();
	getCrust();
	getSauce();
	//runningTotal+= getCheese();
	getCheese();
	//runningTotal+= getMeat();
	getMeat();
	//runningTotal+= getVeggie();
	getVeggie();
	document.getElementById("totalPrice").innerHTML = "<h3>Total: <strong>$"+runningTotal+".00"+"</strong></h3>";
	
	// All three of these variables will be passed on to each function
};	
	
	//CRUST
function getCrust(){
    var runningTotal=0;
	var text1 = "Crust: ";
	var selectedCrust = [];
	var crustArray = document.getElementsByClassName("crust");
	for (var l = 0; l<crustArray.length; l++){
		if (crustArray[l].checked){
			selectedCrust.push(crustArray[l].value);
            console.log("selected crust item: ("+crustArray[l].value+")");
            text1 += crustArray[l].value+"<br>";
        //Stuffed Crust Total
            if (crustArray[l].value=="Cheese Stuffed"){
                runningTotal = runningTotal + 3;
                console.log("subtotal: $"+runningTotal+".00");
            }    
        }
            
        
	}

	
	document.getElementById("showText").innerHTML+=(text1);
	return runningTotal;
	console.log("WHATS HAPPENING HERE"+ runningTotal);
};

	//SAUCE
function getSauce(runningTotal){
	var text1 = "Sauce: ";
	var selectedSauce = [];
	var sauceArray = document.getElementsByClassName("sauce");
	for (var m = 0; m<sauceArray.length; m++){
		if (sauceArray[m].checked){
			selectedSauce.push(sauceArray[m].value);
			console.log("selected sauce item: ("+sauceArray[m].value+")");
		text1 += sauceArray[m].value+"<br>";
		}
	}
	document.getElementById("showText").innerHTML+=(text1);
};




	//CHEESE
function getCheese(){
	var runningTotal=0;
	var text1 = "";
	var selectedCheese = [];
	var cheeseArray = document.getElementsByClassName("cheese");
	for (var n = 0; n<cheeseArray.length; n++){
		if (cheeseArray[n].checked){
			selectedCheese.push(cheeseArray[n].value);
			console.log("selected cheese item: ("+cheeseArray[n].value+")");
            text1 += cheeseArray[n].value+"<br>";
        //extra cheese total
            if (cheeseArray[n].value=="Extra Cheese"){
                runningTotal = runningTotal + 3;
                console.log("subtotal: $"+runningTotal+".00");
            }
        }
        
	}
	document.getElementById("showText").innerHTML+=(text1);
	return runningTotal;
	console.log("WHATS HAPPENING HERE with cheese"+ runningTotal);
};


	//MEAT
function getMeat(runningTotal) {
	var runningTotal=0;
	var text1 = "";
	var meatTotal = 0;
	var selectedMeat = [];
	var meatArray = document.getElementsByClassName("meats");
	for (var j = 0; j < meatArray.length; j++) {
		if (meatArray[j].checked) {
			selectedMeat.push(meatArray[j].value);
			console.log("selected meat item: ("+meatArray[j].value+")");
			text1 += meatArray[j].value+"<br>";
		}
	}
	var meatCount = selectedMeat.length;
	if (meatCount > 1) {
		meatTotal = (meatCount - 1);
	} else {
		meatTotal = 0;
	}
	runningTotal = (runningTotal + meatTotal);
	console.log("total selected meat items: "+meatCount);
	console.log(meatCount+" meat - 1 free meat = "+"$"+meatTotal+".00");
	console.log("meat text1: "+text1);
	console.log("subtotal: "+"$"+runningTotal+".00");
	document.getElementById("showText").innerHTML+=(text1);
	return runningTotal;
	console.log("WHATS HAPPENING HERE with meat"+ runningTotal);
	//document.getElementById("showText").innerHTML=text1;
	//document.getElementById("totalPrice").innerHTML = "<h3>Total: <strong>$"+runningTotal+".00"+"</strong></h3>";
};

	//VEGGIE
function getVeggie() {
	var runningTotal =0;
	var text1 = "";
	var veggieTotal = 0;
	var selectedVeggie = [];
	var veggieArray = document.getElementsByClassName("veggie");
	for (var k = 0; k < veggieArray.length; k++) {
		if (veggieArray[k].checked) {
			selectedVeggie.push(veggieArray[k].value);
			console.log("selected veggie item: ("+veggieArray[k].value+")");
			text1 += veggieArray[k].value+"<br>";
		}
	}
	var veggieCount = selectedVeggie.length;
	if (veggieCount > 1) {
		veggieTotal = (veggieCount - 1);
	} else {
		veggieTotal = 0;
	}
	runningTotal = (runningTotal + veggieTotal);
	console.log("total selected veggie items: "+veggieCount);
	console.log(veggieCount+" veggie - 1 free veggie = "+"$"+veggieTotal+".00");
	console.log("veggie text1: "+text1);
	console.log("Purchase Total: "+"$"+runningTotal+".00");
	//document.getElementById("showText").innerHTML=text1;
	//document.getElementById("totalPrice").innerHTML = "<h3>Total: <strong>$"+runningTotal+".00"+"</strong></h3>";
	document.getElementById("showText").innerHTML+=(text1);
	return runningTotal;
	console.log("WHATS HAPPENING HERE with meat"+ runningTotal);
};
function clearAll(){
    document.getElementById("options").reset();
    document.getElementById("showText").innerHTML="";
	document.getElementById("totalPrice").innerHTML="";
    
}