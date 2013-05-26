function ocaEsp(){
	var name = document.getElementById("txtName");
	var eventoT = document.getElementById("eventoT");
	var eventoC = document.getElementById("eventoC");
	var eventoG = document.getElementById("eventoG");
	var txtInv = document.getElementById("txtInv");
	var fecha = document.getElementById("datepicker");
	
	if (validateName(name, 1) != true)
		return false;
		
	if (!eventoT.checked && !eventoC.checked  && !eventoG.checked){
		$('#errorProducto').show();
		return false;
	}else{
		$('#errorProducto').hide();
		
	}
	
	if (txtInv.value == ""){
		$('#errorInv').show();
		return false;
	}else{
		$('#errorInv').hide();
		
	}
	
	if (fecha.value == ""){
		$('#errorFecha').show();
		return false;
	}else{
		$('#errorFecha').hide();
		return true;
	}
	
	return true;
};