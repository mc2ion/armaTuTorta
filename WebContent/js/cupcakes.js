$(document).ready(function(){
  var sabor = "";
  var unPonque = true;
  var unPonqueAux = true;
  
  var unaCubierta = true;
  
  $("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });


  $("#bt1").click(function(){
	$(".block").hide();
	$(".block-2").show();
	mostrarPaso2()
  });
  
  $("#bt2").click(function(){
	$(".block-2").hide();
	$(".block-3").show();
	$("#pasoImgBase").attr('src',"./images/paso_cupcakes_3.png");
});
  
   $("#bt3").click(function(){
	$(".block-3").hide();
	$(".block-4").show();
	$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4.png");
  });
  
   $("#bt4").click(function(){
	var value = $("input:radio[name=cubierta]:checked").val();
	if (value == '1'){
		$(".block-4").hide();
		$(".block-5").show();
	}else if(value == '2'){
		$(".block-4").hide();
		$(".block-5").show();
	}else{
		$(".block-4").hide();
		$(".step6").text("Paso 5");
		$(".block-6").show();
	}	
	$("#pasoImgBase").attr('src',"./images/paso_cupcakes_5.png");
	
  });
  
  $("#bt5").click(function(){
	$(".block-5").hide();
	$(".block-6").show();
	$("#pasoImgBase").attr('src',"./images/paso_cupcakes_6.png");
	
  });
  
  /* Click en cualquier radio button del paso 1*/
  $(".rdB1").click(function(){
	$("#bt1Disable").hide();
	$("#bt1").show();
  });
  
  /* Click en cualquier radio button del paso 2*/
  $(".rdB2").click(function(){
	$("#bt2Disable").hide();
	$("#bt2").show();
  });
  
  /* Click en cualquier radio button del paso 3*/
   $(".rdB3").click(function(){
	$("#bt3Disable").hide();
	$("#bt3").show();
	var value = $("input:radio[name=sabor]:checked").val();
	if (value == 1)
		sabor = "./images/cupcakes/ponque_chocolate.png";
	else if (value == 2)
		sabor = "./images/cupcakes/ponque_vainilla.png";
	else if (value == 3)
		sabor = "./images/cupcakes/ponque_vainilla_chispas.png";
	else if (value == 4)
		sabor = "./images/cupcakes/ponque_zanahoria.png";
	else if (value == 5)
		sabor = "./images/cupcakes/ponque_limon.png";
	else if (value == 6)
		sabor = "./images/cupcakes/ponque_red.png";
	else if (value == 7)
		sabor = "./images/cupcakes/ponque_chocolate_fuge.png";
	else if (value == 8){
		unPonque = false;
		$("#pasoImgSabor").hide();
		$("#pasoImgSabor1").attr('src',"./images/cupcakes/ponque_red.png");
		$("#pasoImgSabor2").attr('src',"./images/cupcakes/ponque_vainilla.png");
		$("#pasoImgSabor3").attr('src',"./images/cupcakes/ponque_chocolate.png");
		$("#pasoImgSabor1").show();
		$("#pasoImgSabor2").show();
		$("#pasoImgSabor3").show();
		return;
	}
	unPonque = true;
	$("#pasoImgSabor").attr('src', sabor);
	$("#pasoImgSabor").show();
	$("#pasoImgSabor1").hide();
	$("#pasoImgSabor2").hide();
	$("#pasoImgSabor3").hide();
  });
  
  /* Click en cualquier radio button del paso 4*/
  $(".rdB4").click(function(){
	$("#bt4Disable").hide();
	$("#bt4").show();
	/* Cubierta escogida */
	var value = $("input:radio[name=cubierta]:checked").val();
	if (value == 1){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4.png");
		if (!unPonque){
			$("#pasoImgCubierta1").attr('src',"./images/cupcakes/crema_mantequilla_blanco.png");
			$("#pasoImgCubierta2").attr('src',"./images/cupcakes/crema_mantequilla_blanco.png");
			$("#pasoImgCubierta3").attr('src',"./images/cupcakes/crema_mantequilla_blanco.png");
			$("#pasoImgCubierta1").show();
			$("#pasoImgCubierta2").show();
			$("#pasoImgCubierta3").show();
			$("#pasoImgCubierta").hide();
			return;
		}else
			$("#pasoImgCubierta").attr('src',"./images/cupcakes/crema_mantequilla_blanco.png");
	}
	else if (value == 2){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4.png");
		if (!unPonque){
			$("#pasoImgCubierta1").attr('src',"./images/cupcakes/glaseado_general.png");
			$("#pasoImgCubierta2").attr('src',"./images/cupcakes/glaseado_general.png");
			$("#pasoImgCubierta3").attr('src',"./images/cupcakes/glaseado_general.png");
			$("#pasoImgCubierta1").show();
			$("#pasoImgCubierta2").show();
			$("#pasoImgCubierta3").show();
			$("#pasoImgCubierta").hide();
			return;
		}else
			$("#pasoImgCubierta").attr('src',"./images/cupcakes/glaseado_general.png");
	}
	else if (value == 3){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4_block5.png");
		if (!unPonque){
			$("#pasoImgCubierta1").attr('src',"./images/cupcakes/crema_chocolate.png");
			$("#pasoImgCubierta2").attr('src',"./images/cupcakes/crema_chocolate.png");
			$("#pasoImgCubierta3").attr('src',"./images/cupcakes/crema_chocolate.png");
			$("#pasoImgCubierta1").show();
			$("#pasoImgCubierta2").show();
			$("#pasoImgCubierta3").show();
			$("#pasoImgCubierta").hide();
			return;
		}else
			$("#pasoImgCubierta").attr('src',"./images/cupcakes/crema_chocolate.png");
	}
	else if (value == 4){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4_block5.png");
		if (!unPonque){
			$("#pasoImgCubierta1").attr('src',"./images/cupcakes/crema_queso_crema.png");
			$("#pasoImgCubierta2").attr('src',"./images/cupcakes/crema_queso_crema.png");
			$("#pasoImgCubierta3").attr('src',"./images/cupcakes/crema_queso_crema.png");
			$("#pasoImgCubierta1").show();
			$("#pasoImgCubierta2").show();
			$("#pasoImgCubierta3").show();
			$("#pasoImgCubierta").hide();
			return;
		}else
			$("#pasoImgCubierta").attr('src',"./images/cupcakes/crema_queso_crema.png");
	}
	else if (value == 5){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4_block5.png");
		if (!unPonque){
			$("#pasoImgCubierta1").attr('src',"./images/cupcakes/crema_limon.png");
			$("#pasoImgCubierta2").attr('src',"./images/cupcakes/crema_limon.png");
			$("#pasoImgCubierta3").attr('src',"./images/cupcakes/crema_limon.png");
			$("#pasoImgCubierta1").show();
			$("#pasoImgCubierta2").show();
			$("#pasoImgCubierta3").show();
			$("#pasoImgCubierta").hide();
			return;
		}else
			$("#pasoImgCubierta").attr('src',"./images/cupcakes/crema_limon.png");
	}
	else if (value == 6){
		unaCubierta = false;
		
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4_block5.png");
		/* Si ya habia pintado 3 ponque, solo pinto las cubiertas*/
		if (!unPonque){
			$("#pasoImgCubierta1").attr('src',"./images/cupcakes/crema_limon.png");
			$("#pasoImgCubierta2").attr('src',"./images/cupcakes/crema_chocolate.png");
			$("#pasoImgCubierta3").attr('src',"./images/cupcakes/glaseado_general.png");
			$("#pasoImgCubierta1").show();
			$("#pasoImgCubierta2").show();
			$("#pasoImgCubierta3").show();
			$("#pasoImgCubierta").hide();
			return;
		}
		/* Sino, debo pintar las 3 cubiertas y los 3 ponques*/
		else{
			unPonqueAux = false;
			$("#pasoImgCubierta1").attr('src',"./images/cupcakes/crema_limon.png");
			$("#pasoImgCubierta2").attr('src',"./images/cupcakes/crema_chocolate.png");
			$("#pasoImgCubierta3").attr('src',"./images/cupcakes/glaseado_general.png");
			$("#pasoImgCubierta1").show();
			$("#pasoImgCubierta2").show();
			$("#pasoImgCubierta3").show();
			
			$("#pasoImgSabor1").attr('src',sabor);
			$("#pasoImgSabor2").attr('src',sabor);
			$("#pasoImgSabor3").attr('src',sabor);
			$("#pasoImgSabor1").show();
			$("#pasoImgSabor2").show();
			$("#pasoImgSabor3").show();
		
			$("#pasoImgCubierta").hide();
			return;
		}
	}
	
	unaCubierta = true;
		
	$("#pasoImgSabor1").hide();
	$("#pasoImgSabor2").hide();
	$("#pasoImgSabor3").hide();
	$("#pasoImgCubierta1").hide();
	$("#pasoImgCubierta2").hide();
	$("#pasoImgCubierta3").hide();
	$("#pasoImgCubierta").show();
  });
  
  
  /* Click en cualquier radio button del paso 5*/
  $(".rdB5").click(function(){
	$("#bt5Disable").hide();
	$("#bt5").show();
	var valueC = $("input:radio[name=cubierta]:checked").val();
	var value = $(this).val();
	var color = "";
	var checked = $(this).is(':checked');
	
	if (value == 9){
		if (checked){
			$("input:checkbox[id != surt]").attr("disabled",true);
			$("input:checkbox[id != surt]").attr('checked', false);
			
		}
		else{
			$("input:checkbox").removeAttr("disabled");
			eliminarPonquesVarios();
			eliminarColoresVarios();
		}
	}
	
	/* Cubierta de mantequilla */
	if (valueC == 1){
		/* Color escogido */
		if (value == 1){
			/* Verifico si hay 1 o 3 ponques dibujados */
			color = "./images/cupcakes/crema_mantequilla_azul.png";
		}
		else if (value == 2){
			color = "./images/cupcakes/crema_mantequilla_verde.png";
		}
		else if (value == 3){
			color = "./images/cupcakes/crema_mantequilla_rosado.png";
		}
		else if (value == 4){
			color = "./images/cupcakes/crema_mantequilla_morado.png";
		}
		else if (value == 5){
			color = "./images/cupcakes/crema_mantequilla_rojo.png";
		}
		else if (value == 6){
			color = "./images/cupcakes/crema_mantequilla_fucsia.png";
		}
		else if (value == 7){
			color = "./images/cupcakes/crema_mantequilla_amarillo.png";
		}
		else if (value == 8)
			color = "./images/cupcakes/crema_mantequilla_blanco.png";
		/*Si se escogen colores surtidos se verifica si ya habian  3 ponques dibujados*/
		else if (value == 9){
			unaCubierta = false;
			if (checked){
				/* Solo se pintan los 3 colores diferentes*/
				if (!unPonqueAux){
					$("#pasoImgColor1").attr('src',"./images/cupcakes/crema_mantequilla_morado.png");
					$("#pasoImgColor2").attr('src',"./images/cupcakes/crema_mantequilla_amarillo.png");
					$("#pasoImgColor3").attr('src',"./images/cupcakes/crema_mantequilla_verde.png");
					$("#pasoImgColor1").show();
					$("#pasoImgColor2").show();
					$("#pasoImgColor3").show();
					$("#pasoImgColor").hide();
					$("#pasoImgSabor").show();
					$("#pasoImgCubierta").show();
					return;
				}
				/* Se debe pintar los 3 ponques y las 3 cubiertas de colores variados */
				else{	
					$("#pasoImgColor1").attr('src',"./images/cupcakes/crema_mantequilla_morado.png");
					$("#pasoImgColor2").attr('src',"./images/cupcakes/crema_mantequilla_amarillo.png");
					$("#pasoImgColor3").attr('src',"./images/cupcakes/crema_mantequilla_verde.png");
					$("#pasoImgColor1").show();
					$("#pasoImgColor2").show();
					$("#pasoImgColor3").show();
					$("#pasoImgColor").hide();
					
					$("#pasoImgSabor1").attr('src',sabor);
					$("#pasoImgSabor2").attr('src',sabor);
					$("#pasoImgSabor3").attr('src',sabor);
					$("#pasoImgSabor1").show();
					$("#pasoImgSabor2").show();
					$("#pasoImgSabor3").show();
					$("#pasoImgSabor").hide();
					$("#pasoImgCubierta").hide();
					return;
				}
			}
		}
	}else{
		if (value == 1)
			color = "./images/cupcakes/glaseado_azul.png";
		else if (value == 2)
			color =  "./images/cupcakes/glaseado_verde.png";
		else if (value == 3)
			color = "./images/cupcakes/glaseado_rosado.png";
		else if (value == 4)
			color = "./images/cupcakes/glaseado_morado.png";
		else if (value == 5)
			color = "./images/cupcakes/glaseado_rojo.png";
		else if (value == 6)
			color = "./images/cupcakes/glaseado_fucsia.png";
		else if (value == 7)
			color = "./images/cupcakes/glaseado_amarillo.png";
		else if (value == 8)
			color = "./images/cupcakes/glaseado_blanco.png";
		else if (value == 9)
			color = "./images/cupcakes/glaseado_fucsia.png";
	}
	
	if (!unPonqueAux){
		if (checked){
			$("#pasoImgColor1").attr('src',color);
			$("#pasoImgColor2").attr('src',color);
			$("#pasoImgColor3").attr('src',color);
			$("#pasoImgColor1").show();
			$("#pasoImgColor2").show();
			$("#pasoImgColor3").show();
			$("#pasoImgColor").hide();
		}
		else{
			eliminarColoresVarios();
			eliminarPonquesVarios();
			$("#pasoImgColor").attr('src',color);
			$("#pasoImgColor").show();
			$("#pasoImgSabor").show();
		}
	}else{
		if (checked){
			$("#pasoImgColor").attr('src',color);
			$("#pasoImgColor").show();
			$("#pasoImgSabor").show();
		}else{
			$("#pasoImgColor").hide();
			mostrarPonque();
			mostrarCubierta();
		}
	
	}
	
	
  });
  
  /* Click en cualquier radio button del paso 6*/  
  $(".rdB6").click(function(){
	$("#bt6Disable").hide();
	$("#bt6").show();
	var valueCubierta = $("input:radio[name=cubierta]:checked").val();
		
	var value = $("input:radio[name=decoracion]:checked").val();
	if (value == 1){
		if (valueCubierta == 1)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate.png");
		else if (valueCubierta == 2)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_glaseado.png");
		else if (valueCubierta == 3)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate.png");
		else if (valueCubierta == 4)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_crema_limon.png");
		else if (valueCubierta == 5)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_crema_limon.png");
		else if (valueCubierta == 6)
		{
			$("#pasoImgDecoracion1").attr('src',"./images/cupcakes/chispas_chocolate_crema_limon.png");
			$("#pasoImgDecoracion2").attr('src',"./images/cupcakes/chispas_chocolate.png");
			$("#pasoImgDecoracion3").attr('src',"./images/cupcakes/chispas_chocolate_glaseado.png");
			$("#pasoImgDecoracion1").show();
			$("#pasoImgDecoracion2").show();
			$("#pasoImgDecoracion3").show();
			$("#pasoImgDecoracion").hide();
			return;
		}
	}
	else if (value == 2){
		if (valueCubierta == 1)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_blanco.png");
		else if (valueCubierta == 2)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_blanco_glaseado.png");
		else if (valueCubierta == 3)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_blanco.png");
		else if (valueCubierta == 4)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_blanco_limon.png");
		else if (valueCubierta == 5)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_blanco_limon.png");
		else if (valueCubierta == 6)
		{
			$("#pasoImgDecoracion1").attr('src',"./images/cupcakes/chispas_chocolate_blanco_limon.png");
			$("#pasoImgDecoracion2").attr('src',"./images/cupcakes/chispas_chocolate_blanco.png");
			$("#pasoImgDecoracion3").attr('src',"./images/cupcakes/chispas_chocolate_blanco_glaseado.png");
			$("#pasoImgDecoracion1").show();
			$("#pasoImgDecoracion2").show();
			$("#pasoImgDecoracion3").show();
			$("#pasoImgDecoracion").hide();
			return;
		}
	}
	else if (value == 3){
		if (valueCubierta == 1)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_colores.png");
		else if (valueCubierta == 2)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_colores_glaseado.png");
		else if (valueCubierta == 3)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_colores.png");
		else if (valueCubierta == 4)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_colores_limon.png");
		else if (valueCubierta == 5)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_colores_limon.png");
		else if (valueCubierta == 6){
			$("#pasoImgDecoracion1").attr('src',"./images/cupcakes/chispas_colores_limon.png");
			$("#pasoImgDecoracion2").attr('src',"./images/cupcakes/chispas_colores.png");
			$("#pasoImgDecoracion3").attr('src',"./images/cupcakes/chispas_colores_glaseado.png");
			$("#pasoImgDecoracion1").show();
			$("#pasoImgDecoracion2").show();
			$("#pasoImgDecoracion3").show();
			$("#pasoImgDecoracion").hide();
			return;
		}
	}
	else if (value == 4)	{
		if (valueCubierta == 1)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_surtidas.png");
		else if (valueCubierta == 2)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_surtidas_glaseado.png");
		else if (valueCubierta == 3)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_surtidas.png");
		else if (valueCubierta == 4)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_surtidas_limon.png");
		else if (valueCubierta == 5)
			$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_surtidas_limon.png");
		else if (valueCubierta == 6){
			$("#pasoImgDecoracion1").attr('src',"./images/cupcakes/chispas_surtidas_limon.png");
			$("#pasoImgDecoracion2").attr('src',"./images/cupcakes/chispas_surtidas.png");
			$("#pasoImgDecoracion3").attr('src',"./images/cupcakes/chispas_surtidas_glaseado.png");
			$("#pasoImgDecoracion1").show();
			$("#pasoImgDecoracion2").show();
			$("#pasoImgDecoracion3").show();
			$("#pasoImgDecoracion").hide();
			return;
		}
	}
	else if (value == 5){
		$("#pasoImgDecoracion").hide();
		return;
	}
	
	$("#pasoImgDecoracion").show();
  });
  
   function eliminarCubiertas(){
		$("#pasoImgCubierta1").hide();
		$("#pasoImgCubierta2").hide();
		$("#pasoImgCubierta3").hide();
  }

  
  function eliminarColoresVarios(){
		$("#pasoImgColor1").hide();
		$("#pasoImgColor2").hide();
		$("#pasoImgColor3").hide();
  }
  
  function eliminarPonquesVarios(){
		$("#pasoImgSabor1").hide();
		$("#pasoImgSabor2").hide();
		$("#pasoImgSabor3").hide();
  }
  
  function eliminarPonque(){
		$("#pasoImgSabor").hide();
  }
  
  function mostrarPonque(){
		$("#pasoImgSabor").show();
  }
  
   function mostrarCubierta(){
		$("#pasoImgCubierta").show();
  }
  
  function eliminarCubierta(){
		$("#pasoImgCubierta").hide();
   }
  
  function mostrarColor(){
		$("#pasoImgColor").show();
  }
  
  function eliminarColor(){
		$("#pasoImgColor").hide();
   }
   
   function mostrarPaso2(){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_2.png");
	}
	
	function mostrarPaso3(){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_3.png");
	}
	
	function mostrarPaso4(){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4.png");
	}
 
  
   
  
  
  
  
  

  
  
  $("#backLink").click(function(event) {
		$(".block").show();
		$(".block-2").hide();
		$(".rdB2").attr('checked', false);
		$("#bt2Disable").show();
		$("#bt2").hide();
   });
   
   $("#backLink2").click(function(event) {
		$(".block-2").show();
		$(".block-3").hide();
		eliminarPonque();
		mostrarPaso2();
		$(".rdB3").attr('checked', false);
		$("#bt3Disable").show();
		$("#bt3").hide();
		
   });
   
   $("#backLink3").click(function(event) {
		$(".block-3").show();
		$(".block-4").hide();
		if (unPonque){
			if (unaCubierta){
				eliminarCubierta();
			}else{
				eliminarCubiertas();
				eliminarPonquesVarios();
				mostrarPonque();
			}
		}else{
			eliminarCubiertas();
		}
		mostrarPaso3();
		$(".rdB4").attr('checked', false);
		$("#bt4Disable").show();
		$("#bt4").hide();
	

   });
   
   $("#backLink4").click(function(event) {
		$(".block-4").show();
		$(".block-5").hide();
		mostrarPaso4();
		$(".rdB5").attr('checked', false);
		$("#bt5Disable").show();
		$("#bt5").hide();
		
		
   });
   
   $("#backLink5").click(function(event) {
		$(".block-5").show();
		$(".block-6").hide();
   });
   
});
