$(document).ready(function(){
	var sabor = "";
	var unPonque = true;
	var unPonqueAux = true;
	var unaCubierta = true;
	var coloresSurtidos = false;

	/* Cambio de las secciones y la imagen del paso asociado*/
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
		var value = $("input:radio[name=cubierta]:checked").val();
		if (value == '1'){
			$(".block-4").hide();
			$(".block-5").show();
		}else if(value == '2'){
			$(".block-4").hide();
			$(".block-5").show();
		}else{
			$(".block-4").hide();
			$("#pasoImgBase").attr('src',"./images/paso_cupcakes_6_block5.png");
			$(".block-6").show();
			return;
		}	
		mostrarPaso5();
	});
  
	$("#bt5").click(function(){
		$(".block-5").hide();
		$(".block-6").show();
		mostrarPaso6();
	});
	
	/*-----------------------------------*/
	
	
	/* Desbloqueo de los botones siguientes */
	
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
		mostrarImgPonque();
	});
	
	/* Click en cualquier radio button del paso 4*/
	$(".rdB4").click(function(){
		$("#bt4Disable").hide();
		$("#bt4").show();
		mostrarImgCubierta();
	});
	
	
	$(".rdB5").click(function(){
		$("#bt5Disable").hide();
		$("#bt5").show();
		mostrarImgColor(this);
	});
	
	
	/* Click en cualquier radio button del paso 6*/  
	$(".rdB6").click(function(){
		$("#bt6Disable").hide();
		$("#bt6").show();
		mostrarImgDecoracion();
	});
  
	/* -----------------------------------*/
	
	function mostrarImgPonque(){
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
			$("#pasoImgSabor1").attr('src',"./images/cupcakes/ponque_red.png");
			$("#pasoImgSabor2").attr('src',"./images/cupcakes/ponque_vainilla.png");
			$("#pasoImgSabor3").attr('src',"./images/cupcakes/ponque_chocolate.png");
			$("#pasoImgSabor1").show();
			$("#pasoImgSabor2").show();
			$("#pasoImgSabor3").show();
			
			$("#pasoImgSabor").hide();
			return;
		}
		unPonque = true;
		$("#pasoImgSabor").attr('src', sabor);
		$("#pasoImgSabor").show();
		$("#pasoImgSabor1").hide();
		$("#pasoImgSabor2").hide();
		$("#pasoImgSabor3").hide();
	}
	
	function mostrarImgCubierta(){
	
		unaCubierta = true;
		unPonqueAux = true;
	
		/* Cubierta escogida */
		var value = $("input:radio[name=cubierta]:checked").val();
		var cubierta = "";
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4.png");
		if (value == 1){
			cubierta = "./images/cupcakes/crema_mantequilla_general.png";
		}
		else if (value == 2){
			cubierta = "./images/cupcakes/glaseado_general.png";
		}
		else if (value == 3){
			$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4_block5.png");
			cubierta = "./images/cupcakes/crema_chocolate.png";
		}
		else if (value == 4){
			$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4_block5.png");
			cubierta = "./images/cupcakes/crema_queso_crema.png";
		}
		else if (value == 5){
			$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4_block5.png");
			cubierta = "./images/cupcakes/crema_limon.png";
		}
		else if (value == 6){
			unaCubierta = false;
			$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4_block5.png");
			/* Si ya habia pintado 3 ponques, solo pinto las cubiertas*/
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
			
				$("#pasoImgSabor").hide();
				$("#pasoImgCubierta").hide();
				return;
			}
		}

				
		if (unPonque){
			$("#pasoImgCubierta").attr('src',cubierta);
				
			$("#pasoImgSabor1").hide();
			$("#pasoImgSabor2").hide();
			$("#pasoImgSabor3").hide();
			$("#pasoImgCubierta1").hide();
			$("#pasoImgCubierta2").hide();
			$("#pasoImgCubierta3").hide();
			
			$("#pasoImgSabor").show();
			$("#pasoImgCubierta").show();
		}else{
			$("#pasoImgCubierta1").attr('src',cubierta);
			$("#pasoImgCubierta2").attr('src',cubierta);
			$("#pasoImgCubierta3").attr('src',cubierta);
			$("#pasoImgCubierta1").show();
			$("#pasoImgCubierta2").show();
			$("#pasoImgCubierta3").show();
			
			$("#pasoImgCubierta").hide();
		}
	}
	
	
	function mostrarImgColor(element){
		var valueC = $("input:radio[name=cubierta]:checked").val();
		var value = $(element).val();
		var color = "";
		var checked = $(element).is(':checked');
		coloresSurtidos = false;
		

		
		/*Bloquear los otros checkbox si se escoge "surtidos" */
		if (value == 9){
			/* Si se esta seleccionado se bloquean*/
			if (checked){
				$("input:checkbox[id != surt]").attr("disabled",true);
				$("input:checkbox[id != surt]").attr('checked', false);
			}
			/* Si se esta deseleccionando se vuelven a habilitar todos los checkbox */
			else{
				$("input:checkbox").removeAttr("disabled");
			}
		}

		/* Cubierta de mantequilla */
		if (valueC == 1){
			/* Color escogido */
			if (value == 1){
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
				coloresSurtidos = true;
				/* Se verifica si se está seleccionando o deseleccionando la opcion*/
				if (checked){
					/* Solo se pintan los 3 colores diferentes*/
					if (!unPonqueAux || !unPonque){
						$("#pasoImgColor1").attr('src',"./images/cupcakes/crema_mantequilla_morado.png");
						$("#pasoImgColor2").attr('src',"./images/cupcakes/crema_mantequilla_amarillo.png");
						$("#pasoImgColor3").attr('src',"./images/cupcakes/crema_mantequilla_verde.png");
						$("#pasoImgColor1").show();
						$("#pasoImgColor2").show();
						$("#pasoImgColor3").show();
						$("#pasoImgColor").hide();
						$("#pasoImgSabor").hide();
						$("#pasoImgCubierta").hide();
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
				}else{
					/* Verifico si antes habia 1 ponque o 3*/
					if (!unPonqueAux || !unPonque){
						/* Eliminio los colores surtidos*/
						$("#pasoImgColor1").hide();
						$("#pasoImgColor2").hide();
						$("#pasoImgColor3").hide();
					}else{
						/* Elimino los colores surtidos, los 3 ponques. Muestro uno solo y una sola cobertura*/
						$("#pasoImgColor1").hide();
						$("#pasoImgColor2").hide();
						$("#pasoImgColor3").hide();
						
						$("#pasoImgSabor1").hide();
						$("#pasoImgSabor2").hide();
						$("#pasoImgSabor3").hide();
						
						$("#pasoImgSabor").show();
						$("#pasoImgCubierta").show();
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
			else if (value == 9){
				coloresSurtidos = true;
				/* Se verifica si se está seleccionando o deseleccionando la opcion*/
				if (checked){
					/* Solo se pintan los 3 colores diferentes*/
					if (!unPonqueAux || !unPonque){
						$("#pasoImgColor1").attr('src',"./images/cupcakes/glaseado_morado.png");
						$("#pasoImgColor2").attr('src',"./images/cupcakes/glaseado_amarillo.png");
						$("#pasoImgColor3").attr('src',"./images/cupcakes/glaseado_blanco.png");
						$("#pasoImgColor1").show();
						$("#pasoImgColor2").show();
						$("#pasoImgColor3").show();
						$("#pasoImgColor").hide();
						$("#pasoImgSabor").hide();
						$("#pasoImgCubierta").hide();
						return;
					}
					/* Se debe pintar los 3 ponques y las 3 cubiertas de colores variados */
					else{	
						$("#pasoImgColor1").attr('src',"./images/cupcakes/glaseado_morado.png");
						$("#pasoImgColor2").attr('src',"./images/cupcakes/glaseado_amarillo.png");
						$("#pasoImgColor3").attr('src',"./images/cupcakes/glaseado_blanco.png");
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
				}else{
					/* Verifico si antes habia 1 ponque o 3*/
					if (!unPonqueAux || !unPonque){
						/* Eliminio los colores surtidos*/
						$("#pasoImgColor1").hide();
						$("#pasoImgColor2").hide();
						$("#pasoImgColor3").hide();
					}else{
						/* Elimino los colores surtidos, los 3 ponques. Muestro uno solo y una sola cobertura*/
						$("#pasoImgColor1").hide();
						$("#pasoImgColor2").hide();
						$("#pasoImgColor3").hide();
						
						$("#pasoImgSabor1").hide();
						$("#pasoImgSabor2").hide();
						$("#pasoImgSabor3").hide();
						
						$("#pasoImgSabor").show();
						$("#pasoImgCubierta").show();
					}
				}

			}
		}

		/* Para pintar los colores verifico si habian 3 ponques o uno, para pintar la cantidad correcta de capas */
		if (!unPonqueAux || !unPonque){
			if (checked){
				$("#pasoImgColor1").attr('src',color);
				$("#pasoImgColor2").attr('src',color);
				$("#pasoImgColor3").attr('src',color);
				$("#pasoImgColor1").show();
				$("#pasoImgColor2").show();
				$("#pasoImgColor3").show();
				$("#pasoImgColor").hide();
				mostrarSabores();
			}
			else{
				eliminarColoresVarios();
				mostrarCubiertas();
				mostrarPonques();
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
	}

	
	function mostrarImgDecoracion(){
		/* Obtengo el valor de la cubierta escogida */
		var valueCubierta = $("input:radio[name=cubierta]:checked").val();
		/* Valor de la decoracion escogida*/
		var value = $("input:radio[name=decoracion]:checked").val();
		
		if (value == 1){
			/* Verifico cual cubierta se escogio para mostrar la imagen correspondiente de la decoracion */
			if (valueCubierta == 1 || valueCubierta == 3 ){
				$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate.png");
			}
			else if (valueCubierta == 2){
				$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_glaseado.png");
			}
			else if (valueCubierta == 4 || valueCubierta == 5){
				$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_crema_limon.png");
			}
			else if (valueCubierta == 5){
				$("#pasoImgDecoracion").attr('src',"./images/cupcakes/chispas_chocolate_crema_limon.png");
			}
			else if (valueCubierta == 6)
			{
				decoracionSurt = true;
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
				decoracionSurt = true;
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
				decoracionSurt = true;
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
				decoracionSurt = true;
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
		decoracionSurt = false;
		$("#pasoImgDecoracion").show();
		eliminarDecoraciones();
	}
	
	/* Funciones auxiliares */

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
	
	function mostrarPonques(){
		$("#pasoImgSabor1").show();
		$("#pasoImgSabor2").show();
		$("#pasoImgSabor3").show();
	}

	function mostrarCubierta(){
		$("#pasoImgCubierta").show();
	}
	
	function mostrarCubiertas(){
		$("#pasoImgCubierta1").show();
		$("#pasoImgCubierta2").show();
		$("#pasoImgCubierta3").show();
	}
	
	function mostrarDecoraciones(){
		$("#pasoImgDecoracion1").show();
		$("#pasoImgDecoracion2").show();
		$("#pasoImgDecoracion3").show();
	}

	function eliminarDecoraciones(){
		$("#pasoImgDecoracion1").hide();
		$("#pasoImgDecoracion2").hide();
		$("#pasoImgDecoracion3").hide();
	}

	function mostrarDecoracion(){
		$("#pasoImgDecoracion").show();
	}

	function eliminarDecoracion(){
		$("#pasoImgDecoracion").hide();
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
	/* ----- Fin funciones auxiliares ----- */
	
	/* Imagenes pasos */
	function mostrarPaso1(){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes.png");
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
	
	function mostrarPaso4_block5(){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_4_block5.png");
	}
	
	function mostrarPaso5(){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_5.png");
	}
	
	function mostrarPaso6(){
		$("#pasoImgBase").attr('src',"./images/paso_cupcakes_6.png");
	}
	/* -- Fin funciones de images pasos -- */
  
  
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
		$(".block-2").show();
		$(".block-3").hide();
		mostrarPaso2();
		$(".rdB3").attr('checked', false);
		$("#bt3Disable").show();
		$("#bt3").hide();
		
		/* Eliminar ponque*/
		if (unPonque)
			eliminarPonque();
		else	
			eliminarPonquesVarios();
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
		if (coloresSurtidos){
			/* Si antes habian 3 ponque solo elimino los colores*/
			if (!unPonqueAux || !unPonque){
				eliminarColoresVarios();
			/* Sino elimino los colores y los ponque y solo pinto uno solo*/
			}else{
				eliminarColoresVarios();
				eliminarPonquesVarios();
				mostrarPonque();
				mostrarCubierta();
			}
		}else{
			if (!unPonqueAux || !unPonque)
				eliminarColoresVarios();
			else
				eliminarColor();
		}
		$(".rdB5").removeAttr('disabled');
		$(".rdB5").attr('checked', false);
		$("#bt5Disable").show();
		$("#bt5").hide();
	});
	
	 $("#backLink5").click(function(event) {
		var valueCubierta = $("input:radio[name=cubierta]:checked").val();
		eliminarDecoracion();
		$(".rdB6").attr('checked', false);
		if (valueCubierta == 1){
			mostrarPaso5();
			$(".block-5").show();
			$(".block-6").hide();
			return;
		}
		else if (valueCubierta == 2){
			mostrarPaso5();
			$(".block-5").show();
			$(".block-6").hide();
			return;
		}else
		{
			mostrarPaso4_block5();
			$(".block-4").show();
			$(".block-6").hide();
			return;
		}
		$("#bt6Disable").show();
		$("#bt6").hide();
	});
	
	/* -- Fin funciones para echar para atras -- */

});