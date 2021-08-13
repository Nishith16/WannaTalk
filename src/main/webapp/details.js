let info = document.getElementById("info");
let refill = document.getElementById("refill");

let editBtn = document.getElementById("editBtn");
editBtn.addEventListener("click",function(){
	if(refill.style.display == "none"){
		refill.style.display = "block";
		info.style.display = "none";
	}
	else{	
		console.log('else running');
		refill.style.display = "none";
		info.style.display = "block";
	}
});
