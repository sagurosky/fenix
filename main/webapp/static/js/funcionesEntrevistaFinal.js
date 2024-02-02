function chequearLongitud(obj){
	if (obj.value.length > 10000) {
	obj.value = obj.value.substring(0, 10000);
	}
}


$(function() {
	
	  $("#resultadoAnioEscolar").change(function(evt) {
		  
	    evt.preventDefault()   
	    $.ajax( {
	    	
	      type: "GET",
	      url: "../ajax/obtenerEvaluacionRenovacionFinal.do",
	      data: { idResultadoAnioEscolar: $("#resultadoAnioEscolar").val(),
	    	  	  ultimoAnio: $("#ultimoAnio").val()},
	      dataType: "json",
	      success: function(data) {
	    	  var options = '';
	            options += '<option value="" selected="selected">Seleccione una opci&oacute;n...</option>'
	            $(data.evaluaciones).each(function() {
	                options += '<option value="' + this.id + '">' + this.valor + '</option>';
	            });
	             $("select#evaluacionRenovacionFinal").html(options);
	             habilitarRenovacion(document.getElementById("evaluacionRenovacionFinal"));
	      }
	    } )
	  })
	})

function habilitarCamposBecado(obj){
	if(obj.checked){
		document.getElementById("motivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("motivoAusencia").value = "";
		document.getElementById("otroMotivoAusencia").value= "";
	}
	else{
		document.getElementById("motivoAusencia").disabled = false;
	}
	habilitarChecks(!(document.getElementById("participoRA").checked || obj.checked));	
}

function habilitarCamposRA(obj){
	
	if(obj.checked){
		
		document.getElementById("motivoAusenciaRA").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").disabled = true;
		document.getElementById("motivoAusenciaRA").value ="";
		document.getElementById("otroMotivoAusenciaRA").value= "";
		document.getElementById("raNoConvocado").checked = true;
		document.getElementById("motivoNoConvocatoria").disabled = true;
	}
	else{
		document.getElementById("motivoAusenciaRA").disabled = true;
	}
	habilitarChecks(!(document.getElementById("participoBecado").checked || obj.checked));	
}

function habilitarChecks(valor){
	document.getElementById("cuadernoComunicados").disabled = valor;
	document.getElementById("certificadoAsistencia").disabled = valor;
	document.getElementById("carpeta").disabled = valor;
	document.getElementById("informeProfesores").disabled = valor;
	document.getElementById("rendicionGastos").disabled = valor;
	document.getElementById("boletin").disabled = valor;
	document.getElementById("materiaBoletin").disabled = true;
	
	if (valor){
		document.getElementById("cuadernoComunicados").value = "";
		document.getElementById("certificadoAsistencia").value = "";
		document.getElementById("carpeta").value = "";
		document.getElementById("informeProfesores").value = "";
		document.getElementById("rendicionGastos").checked = false;
		document.getElementById("boletin").value = "";
		document.getElementById("cantidadInasistencias").disabled = true;
		document.getElementById("materialCompleto").checked = false;
		document.getElementById("detalleGastos").value = "";
		document.getElementById("detalleGastos").disabled = true;
		document.getElementById("boletin").value = "";
		document.getElementById("cantidadInasistencias").value = 0;
		document.getElementById("motivoInasistencia").value = "";
		document.getElementById("materiaBoletin").value = "";
	}
}

function habilitarMaterialCompletoInformeProfesores(obj){
	
	if(	((document.getElementById("certificadoAsistencia").value == 1) || (document.getElementById("certificadoAsistencia").value == 3))&&
		((obj.value == 1) || (obj.value == 3))&&
		((document.getElementById("cuadernoComunicados").value == 1) || (document.getElementById("cuadernoComunicados").value == 3))&&
		((document.getElementById("carpeta").value == 1) || (document.getElementById("carpeta").value == 3))&&
		((document.getElementById("boletin").value == 1) || (document.getElementById("boletin").value == 3)))
		
	{
		document.getElementById("materialCompleto").checked = 1
	}else{
		document.getElementById("materialCompleto").checked = 0
	}
	habilitarMateriasBoletin(obj);
}

function habilitarMaterialCompletoBoletin(obj){

	if(	((document.getElementById("certificadoAsistencia").value == 1) || (document.getElementById("certificadoAsistencia").value == 3))&&
		((obj.value == 1) || (obj.value == 3))&&
		((document.getElementById("informeProfesores").value == 1) || (document.getElementById("informeProfesores").value == 3))&&
		((document.getElementById("carpeta").value == 1) || (document.getElementById("carpeta").value == 3))&&
		((document.getElementById("cuadernoComunicados").value == 1) || (document.getElementById("cuadernoComunicados").value == 3)))
		
	{
		document.getElementById("materialCompleto").checked = 1
	}else{
		document.getElementById("materialCompleto").checked = 0

	}
}

function habilitarMaterialCompletocuadernoComunicados(obj){
	
	if(	((document.getElementById("certificadoAsistencia").value == 1) || (document.getElementById("certificadoAsistencia").value == 3))&&
		((obj.value == 1) || (obj.value == 3))&&
		((document.getElementById("informeProfesores").value == 1) || (document.getElementById("informeProfesores").value == 3))&&
		((document.getElementById("carpeta").value == 1) || (document.getElementById("carpeta").value == 3))&&
		((document.getElementById("boletin").value == 1) || (document.getElementById("boletin").value == 3)))
		
	{
		document.getElementById("materialCompleto").checked = 1
	}else{
		document.getElementById("materialCompleto").checked = 0

	}
}

function habilitarMaterialCompletoCarpeta(obj){
	
	if(	((document.getElementById("certificadoAsistencia").value == 1) || (document.getElementById("certificadoAsistencia").value == 3))&&
		((obj.value == 1) || (obj.value == 3))&&
		((document.getElementById("informeProfesores").value == 1) || (document.getElementById("informeProfesores").value == 3))&&
		((document.getElementById("cuadernoComunicados").value == 1) || (document.getElementById("cuadernoComunicados").value == 3))&&
		((document.getElementById("boletin").value == 1) || (document.getElementById("boletin").value == 3)))
		
	{
		document.getElementById("materialCompleto").checked = 1
	}else{
		document.getElementById("materialCompleto").checked = 0

	}
}

function habilitarCantInasistencias(obj){
	
	if(obj.value == 1){
		document.getElementById("cantidadInasistencias").disabled = false;
				
	}else{
		document.getElementById("cantidadInasistencias").disabled = true;
		document.getElementById("motivoInasistencia").disabled = true;
		document.getElementById("cantidadInasistencias").value = 0;
		document.getElementById("motivoInasistencia").value = "";

	}
	if(	((document.getElementById("cuadernoComunicados").value == 1) || (document.getElementById("cuadernoComunicados").value == 3))&&
			((obj.value == 1) || (obj.value == 3))&&
			((document.getElementById("informeProfesores").value == 1) || (document.getElementById("informeProfesores").value == 3))&&
			((document.getElementById("carpeta").value == 1) || (document.getElementById("carpeta").value == 3))&&
			((document.getElementById("boletin").value == 1) || (document.getElementById("boletin").value == 3)))
			
		{
			document.getElementById("materialCompleto").checked = 1
		}else{
			document.getElementById("materialCompleto").checked = 0

		}
}

function habilitarMotivoInasistencias(obj){	
	if((obj.value == 0.0)||( obj.value == 0)){
		document.getElementById("motivoInasistencia").disabled = true;
		document.getElementById("motivoInasistencia").value = "";
	}else{
		document.getElementById("motivoInasistencia").disabled = false;
	}
}

function habilitarMotivos(obj){
	if(obj.value == 2){
		document.getElementById("motivoSuspension").disabled = false;
	}
	else{
		document.getElementById("motivoSuspension").disabled = true;
		document.getElementById("motivoSuspension").value = "";
	}
}

function habilitarOtrosMotivos(obj){
	if(obj.value == 4){
		document.getElementById("otroMotivoAusencia").disabled = false;
	}
	else{
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusencia").value = "";
	}
	
}

function habilitarOtrosMotivosRA(obj){
	if(obj.value == 4){
		document.getElementById("otroMotivoAusenciaRA").disabled = false;
	}
	else{
		document.getElementById("otroMotivoAusenciaRA").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").value = "";
	}
	
}

function habilitarDetalleGastos(obj){
	if(obj.checked){
		document.getElementById("detalleGastos").disabled = false;
	}else{
		document.getElementById("detalleGastos").disabled = true;
		document.getElementById("detalleGastos").value = "";
	}
}

function habilitarProyeccion(obj){
	if(obj.value == 4){
//		document.getElementById("proyAnioProximo").disabled = false;
		document.getElementById("cambioEscuelaProxAnio").disabled = true;
		document.getElementById("cambioEscuelaProxAnio").value = "";
		document.getElementById("modCursaProxAnio").disabled = true;
		document.getElementById("modCursaProxAnio").value = "";
	}
	else{
//		document.getElementById("proyAnioProximo").disabled = true;
//		document.getElementById("proyAnioProximo").value = "";
		document.getElementById("cambioEscuelaProxAnio").disabled = false;
		document.getElementById("modCursaProxAnio").disabled = false;
	}
}



function habilitarRenovacion(obj){
	if(obj.value == 1){
		document.getElementById("motivoNoRenovacion").disabled = false;
	}
	else{
		document.getElementById("motivoNoRenovacion").disabled = true;
		document.getElementById("motivoNoRenovacion").value = "";
	}
	if (obj.value ==4){
		document.getElementById("proyAnioProximo").disabled = false;
		document.getElementById("cambioEscuelaProxAnio").disabled = true;
		document.getElementById("cambioEscuelaProxAnio").value = "";
		document.getElementById("modCursaProxAnio").disabled = true;
		document.getElementById("modCursaProxAnio").value = "";
	}
	else{
		document.getElementById("proyAnioProximo").disabled = true;
		document.getElementById("proyAnioProximo").value = "";
		document.getElementById("cambioEscuelaProxAnio").disabled = false;
		document.getElementById("modCursaProxAnio").disabled = false;
	}
}

function habilitarMateriasBoletin(obj){
	if((obj.value == 1)){
		document.getElementById("materiaBoletin").disabled = false;
	}else{
		document.getElementById("materiaBoletin").disabled = true;
		document.getElementById("materiaBoletin").value = "";
	}
}
function cargarDatos(sextoAnio, tipoPerfil, eae,anioEscolar,anioAdicional){
	
	if((sextoAnio != 'false') && (tipoPerfil == 'ea') && (eae == '6/6')){
		jAlert('warning', 'Esta es la &uacute;ltima entrevista del becado. Recorda chequear antes de enviarla a supervisar ' +
				'si el becado realmente finaliza o cuenta con un a&ntilde;o adicional', 'ATENCION!');
	}
		
	if((anioAdicional == 'false') &&  (tipoPerfil == 'ea') && (eae == '7/5') && (anioEscolar == 'QUINTO_SEC')){
		jAlert('warning', 'Esta es la &uacute;ltima entrevista del becado. Recorda chequear antes de enviarla a supervisar ' +
				'si el becado realmente finaliza o cuenta con un a&ntilde;o adicional', 'ATENCION!');
	}
	
	
	habilitarCamposBecado(document.getElementById("participoBecado"));
	habilitarCamposRA(document.getElementById("participoRA"));
	habilitarMotivos(document.getElementById("evaluacionCobroBeca"));
	habilitarOtrosMotivos(document.getElementById("motivoAusencia"));
	habilitarOtrosMotivosRA(document.getElementById("motivoAusenciaRA"));
	habilitarProyeccion(document.getElementById("resultadoAnioEscolar"));
	habilitarRenovacion(document.getElementById("evaluacionRenovacionFinal"));
	habilitarMateriasBoletin(document.getElementById("informeProfesores"));
	habilitarCantInasistencias(document.getElementById("certificadoAsistencia"));
	habilitarMotivoInasistencias(document.getElementById("cantidadInasistencias"));
	habilitarDetalleGastos(document.getElementById("rendicionGastos"));
	//habilitarOpcionesRenovacion(document.getElementById("resultadoAnioEscolar"));
}