$(document).ready(function() {
	var priceTotal = 0;
	var priceTotalAux = 0;
	
	$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });

	$("#bt1").click(function(){
		$(".block").hide();
		$(".block-2").show();
		mostrarPaso2();
		setPriceTotal();
	});
  
	$("#bt2").click(function(){
		$(".block-2").hide();
		$(".block-3").show();
		mostrarPaso3();	
		setPriceTotal();
	});
  
	$("#bt3").click(function(){
		$(".block-3").hide();
		$(".block-4").show();
		mostrarPaso4();
		setPriceTotal();
	});
  
	$("#bt4").click(function(){
		var value = $("input:radio[name=4]:checked").val();
		setPriceTotal();
		if (value == '-'){
			$(".block-4").hide();
			$(".block-6").show();
			mostrarPaso6_block5();
		}else{
			$(".block-4").hide();
			$(".block-5").show();
			mostrarPaso5();
		}	
		
	});
  
	$("#bt5").click(function(){
		$(".block-5").hide();
		$(".block-6").show();
		mostrarPaso6();
		setPriceTotal();
	});
  
	$(".rdB1").click(function(){
		$("#bt1Disable").hide();
		$("#bt1").show();
		var j = $(this).val();
		getPrice(1,j);
	});
	
	function getPrice(i,j){
		var priceAux = priceTotal;
		var selectIdAux = '.price-int' + i+j;
		var price = $(selectIdAux).text();
		priceAux = priceAux + Number(price);
		var priceText = priceAux + '.00';
		$('.price').text(priceText);
		priceTotalAux = priceAux;
		
	}
	
	function deletePrice(i,j){
		var priceAux = priceTotal;
		var priceText = priceAux + '.00';
		$('.price').text(priceText);
		priceTotalAux = priceAux;
		
	}
	
	function setPriceTotal(){
		priceTotal = priceTotalAux;
		
	}
	
	$('#target').submit(function() {
	  var priceText = priceTotalAux + '.00';
	  $("#priceCake").val(priceText);
	  return true;
	});
	
	
	
	$(".rdB2").click(function(){
		$("#bt2Disable").hide();
		$("#bt2").show();
		var j = $(this).val();
		getPrice(2,j);
	});
  
   $(".rdB3").click(function(){
	$("#bt3Disable").hide();
	$("#bt3").show();
	var j = $(this).val();
	getPrice(3,j);
	var value = $("input:radio[name=3]:checked").val();
	$("#pasoImgCubierta").show();
	if (value == 1)
		$("#pasoImgSabor").attr('src',"./images/tortas/ponque_chocolate.png");
	else if (value == 2)
		$("#pasoImgSabor").attr('src',"./images/tortas/ponque_vainilla.png");
	else if (value == 3)
		$("#pasoImgSabor").attr('src',"./images/tortas/ponque_almendras.png");
	else if (value == 4)
		$("#pasoImgSabor").attr('src',"./images/tortas/ponque_marmoleada.png");
	else if (value == 5)
		$("#pasoImgSabor").attr('src',"./images/tortas/ponque_zanahoria.png");
	else if (value == 6)
		$("#pasoImgSabor").attr('src',"./images/tortas/ponque_naranja.png");
	else if (value == 7)
		$("#pasoImgSabor").attr('src',"./images/tortas/ponque_chocolateFudge.png");
	$("#pasoImgSabor").show();
	
	
  });
  
  $(".rdB4").click(function(){
	$("#bt4Disable").hide();
	$("#bt4").show();
	var j = $(this).val();
	getPrice(4,j);
	var value = $("input:radio[name=4]:checked").val();
	if (value == 1)
		$("#pasoImgCapas").attr('src',"./images/tortas/1_capa_general.png");
	else if (value == 2)
		$("#pasoImgCapas").attr('src',"./images/tortas/2_capa_general.png");
	else if (value == 3)
		$("#pasoImgCapas").attr('src',"./images/tortas/3_capa_general.png");
	else{
		$("#pasoImgCapas").hide();
		mostrarPaso4_block5();
		return;
	}
	$("#pasoImgCapas").show();
	mostrarPaso4();
  });
  
  $(".rdB5").click(function(){
	$("#bt5Disable").hide();
	$("#bt5").show();
	var j = $(this).val();
	var checked = $(this).is(':checked');
	if (checked)
		getPrice(5,j);
	else
		deletePrice(5,j);
	mostrarSaborCapa(this);
	
  });
  
  $(".rdB6").click(function(){
	$("#bt6Disable").hide();
	$("#bt6").show();
	var j = $(this).val();
	getPrice(6,j);
	mostrarSaborCubierta(this);
	
  });
  
	function mostrarSaborCapa(element){
		var value = $(element).val();
		var checked = $(element).is(':checked');
		var valueCapas = $("input:radio[name=4]:checked").val();
		if (checked){
			if (value == 1){
				$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_capas_chocolate.png");
			}
			else if (value == 2){
				$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_capas_arequipe.png");
			}
			else if (value == 3){
				$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_capas_nutella.png");
			}
			else if (value == 4){
				$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_capas_chanti_melocoton.png");
			}
			else if (value == 5){
				$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_capas_chanti_fresa.png");
			}
			else if (value == 6){
				$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_crema_oreo.png");
			}
			else if (value == 7){
				$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_almendras.png");
			}
			else if (value == 8){
				$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_chispas_chocolate.png");
			}
			else if (value == 9){
				$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_crema_cereza_chocolate.png");
			}
		}else{
			$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_capa_general.png");
		}
  }
  
  function mostrarSaborCubierta(element){
		var value = $(element).val();
		if (value == 1){
			$("#pasoImgCubierta").attr('src',"./images/tortas/chocolate.png");
		}
		else if (value == 2){
			$("#pasoImgCubierta").attr('src',"./images/tortas/arequipe.png");
		}
		else if (value == 3){
			$("#pasoImgCubierta").attr('src',"./images/tortas/chantilli_fresa_2.png");
		}
		else if (value == 4){
			$("#pasoImgCubierta").attr('src',"./images/tortas/chantilli_melocoton.png");
		}
		else if (value == 5){
			$("#pasoImgCubierta").attr('src',"./images/tortas/crema_chantilly.png");
		}
		else if (value == 6){
			$("#pasoImgCubierta").attr('src',"./images/tortas/almendras.png");
		}
		else if (value == 7){
			$("#pasoImgCubierta").attr('src',"./images/tortas/crema_oreo.png");
		}
		else if (value == 8){
			$("#pasoImgCubierta").attr('src',"./images/tortas/chocolate.png");
		}
		
  }
  
  $("input:checkbox").click(function() {
	var value = $("input:radio[name=4]:checked").val();
	var bol = $("input:checkbox:checked").length >= value;     
	$("input:checkbox").not(":checked").attr("disabled",bol);
  });
  
  
  /* Funciones q permiten echar para atras */
  
  $("#backLink1").click(function(event) {
		mostrarPaso1();
		$(".block").show();
		$(".block-2").hide();
		$(".rdB2").attr('checked', false);
		$("#bt2Disable").show();
		$("#bt2").hide();
   });
   
   $("#backLink2").click(function(event) {
		mostrarPaso2();
		eliminarTorta();
		$(".block-2").show();
		$(".block-3").hide();
		$(".rdB3").attr('checked', false);
		$("#bt3Disable").show();
		$("#bt3").hide();
   });
   
   $("#backLink3").click(function(event) {
		mostrarPaso3();
		eliminarCapa();
		$(".block-3").show();
		$(".block-4").hide();
		$(".rdB4").attr('checked', false);
		$("#bt4Disable").show();
		$("#bt4").hide();
   });
   
   $("#backLink4").click(function(event) {
		mostrarPaso4();
		$(".block-5").hide();
		$(".block-4").show();
		$(".rdB5").removeAttr('disabled');
		$(".rdB5").attr('checked', false);
		$("#bt5Disable").show();
		$("#bt5").hide();
		eliminarRelleno();
	
   });
   
   $("#backLink5").click(function(event) {
		var valueCubierta = $("input:radio[name=4]:checked").val();
		eliminarCubierta();
		if (valueCubierta == "-"){
			mostrarPaso4_block5();
			$(".block-4").show();
			$(".block-6").hide();
		}else{
			mostrarPaso5();
			$(".block-5").show();
			$(".block-6").hide();
		}
		$(".rdB6").attr('checked', false);
		$("#bt6Disable").show();
		$("#bt6").hide();
		
   });
   /* ---------------------------------*/
   
   /* Imagenes pasos */
	function mostrarPaso1(){
		$("#pasoImgBase").attr('src',"./images/paso_torta.png");
	}
	
	function mostrarPaso2(){
		$("#pasoImgBase").attr('src',"./images/paso_torta_2.png");
	}
	
	function mostrarPaso3(){
		$("#pasoImgBase").attr('src',"./images/paso_torta_3.png");
	}
	
	function mostrarPaso4(){
		$("#pasoImgBase").attr('src',"./images/paso_torta_4.png");
	}
	
	function mostrarPaso4_block5(){
		$("#pasoImgBase").attr('src',"./images/paso_torta_4_block5.png");
	}
	
	function mostrarPaso5(){
		$("#pasoImgBase").attr('src',"./images/paso_torta_5.png");
	}
	
	function mostrarPaso6(){
		$("#pasoImgBase").attr('src',"./images/paso_torta_6.png");
	}
	
	function mostrarPaso6_block5(){
		$("#pasoImgBase").attr('src',"./images/paso_torta_6_block5.png");
	}
	/* -- Fin funciones de images pasos -- */
  
  
	function eliminarTorta(){
		$("#pasoImgSabor").hide();
		$("#pasoImgCubierta").hide();
	}
	
	function eliminarCapa(){
		$("#pasoImgCapas").hide();
	}
	
	function eliminarRelleno(){
		var valueCapas = $("input:radio[name=4]:checked").val();
		$("#pasoImgCapas").attr('src',"./images/tortas/"+ valueCapas +"_capa_general.png");
	}
	
	function eliminarCubierta(){
		$("#pasoImgCubierta").attr('src',"./images/tortas/capa_general.png");
	}
   
});
