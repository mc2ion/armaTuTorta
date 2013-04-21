$(document).ready(function() {
	$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });

	$("#bt1").click(function(){
		$(".block").hide();
		$(".block-2").show();
		mostrarPaso2();
	});
  
	$("#bt2").click(function(){
		$(".block-2").hide();
		$(".block-3").show();
		mostrarPaso3();	
	});
  
	$("#bt3").click(function(){
		$(".block-3").hide();
		$(".block-4").show();
		mostrarPaso4();
	});
  
	$("#bt4").click(function(){
		var value = $("input:radio[name=capas]:checked").val();
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
	});
  
	$(".rdB1").click(function(){
		$("#bt1Disable").hide();
		$("#bt1").show();
	});
  
	$(".rdB2").click(function(){
		$("#bt2Disable").hide();
		$("#bt2").show();
	});
  
   $(".rdB3").click(function(){
	$("#bt3Disable").hide();
	$("#bt3").show();
	var value = $("input:radio[name=sabor]:checked").val();
	if (value == 1)
		$("#pasoImgSabor").attr('src',"./images/tortas/torta_chocolate.png");
	else if (value == 2)
		$("#pasoImgSabor").attr('src',"./images/tortas/torta_vainilla.png");
	else if (value == 3)
		$("#pasoImgSabor").attr('src',"./images/tortas/torta_almendras.png");
	else if (value == 4)
		$("#pasoImgSabor").attr('src',"./images/tortas/torta_marmoleada.png");
	else if (value == 5)
		$("#pasoImgSabor").attr('src',"./images/tortas/torta_zanahoria.png");
	else if (value == 6)
		$("#pasoImgSabor").attr('src',"./images/tortas/torta_naranja.png");
	else if (value == 7)
		$("#pasoImgSabor").attr('src',"./images/tortas/torta_chocolate_fudge.png");
	$("#pasoImgSabor").show();
	
	
  });
  
  $(".rdB4").click(function(){
	$("#bt4Disable").hide();
	$("#bt4").show();
	var value = $("input:radio[name=capas]:checked").val();
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
  });
  
  $(".rdB5").click(function(){
	$("#bt5Disable").hide();
	$("#bt5").show();
  });
  
  $("input:checkbox").click(function() {
	var value = $("input:radio[name=capas]:checked").val();
	var bol = $("input:checkbox:checked").length >= value;     
	$("input:checkbox").not(":checked").attr("disabled",bol);
  });
  
  
  /* Funciones q permiten echar para atras */
  
  $("#backLink").click(function(event) {
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
		eliminarRelleno();
		$(".block-4").show();
		$(".block-5").hide();
		$(".rdB5").removeAttr('disabled');
		$(".rdB5").attr('checked', false);
		$("#bt5Disable").show();
		$("#bt5").hide();
   });
   
   $("#backLink5").click(function(event) {
		var valueCubierta = $("input:radio[name=capas]:checked").val();
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
	}
	
	function eliminarCapa(){
		$("#pasoImgCapas").hide();
	}
	
	function eliminarRelleno(){
		$("#pasoImgRelleno").hide();
	}
	
	function eliminarCubierta(){
		$("#pasoImgCubierta").hide();
	}
   
});
