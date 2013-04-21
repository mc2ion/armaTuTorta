$(document).ready(function() {
	var price = 0;
	var LastMarq = 0;
	var cantVieja = 15;
	
	$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });

	
	$(".dulcesTortasCheck").click(function() {
		
		$("input:checkbox.dulcesTortasCheck:").each(function()
		{
			if (this.checked){
				var sThisVal = $(this).val();
				var selectId = '.sel' + sThisVal;
				$(selectId).show();
			}else{
				var sThisVal = $(this).val();
				var selectId = '.sel' + sThisVal;
				$(selectId).hide();
				var selectIdAux = '.selDulcesTortas' + sThisVal;
				$(selectIdAux).val(0);
				cambiarPrecio(1);
				
			}
		});
		verificarCheckboxes();
	});
	

	
	function cambiarPrecio(index){
		if (index == 1){
			var priceTotal = 0;
			$("input:checkbox.dulcesTortasCheck:").each(function()
			{
				if (this.checked){
					var sThisVal = $(this).val();
					var selectId = '.selDulcesTortas' + sThisVal;
					var cant = $(selectId).val();
					var selectIdAux = '.price-int' + sThisVal;
					var price = $(selectIdAux).text();
					var total = Number(price) * Number(cant);
					priceTotal = priceTotal + total;
					
				}
			});
			var priceText = priceTotal + '.00';
			$('.price').text(priceText);
		}else{
			var priceTotal = 0;
			$("input:checkbox.dulcesTortasCheck:").each(function()
			{
				if (this.checked){
					var sThisVal = $(this).val();
					var selectId = '.selDulcesTortas' + sThisVal;
					var cant = $(selectId).val();
					if (cant == '0'){
						$('.dt-button-dis').show();
						$('.dt-button').hide();
					}
					else{
						$('.dt-button-dis').hide();
						$('.dt-button').show();
					}
					var selectIdAux = '.price-int' + sThisVal;
					var price = $(selectIdAux).text();
					var total = Number(price) * Number(cant);
					priceTotal = priceTotal + total;
					
				}
			});
			var priceText = priceTotal + '.00';
			$('.price').text(priceText);
		}
	}
	
	
	$('select').change(function(){
		cambiarPrecio(2);
	});
	
	function verificarCheckboxes(){
		var checkboxes = document.getElementsByClassName('dulcesTortasCheck');
		var cont = 0; 
		for (var x=0; x < checkboxes.length; x++) {
			if (checkboxes[x].checked) {
			cont = cont + 1;
			}
		}
		if (cont == 0){
			$('.dt-button-dis').show();
			$('.dt-button').hide();
		}
	}
	
	

  
	
	
	
});
