function chequearLongitud(obj){
	if (obj.value.length > 10000) {
	obj.value = obj.value.substring(0, 10000);
	}
}

$(function() {
  $("#situacionEscolar").change(function(evt) {
    evt.preventDefault()   
    $.ajax( {
      type: "GET",
      url: "../ajax/obtenerEvaluacionRenovacion.do",
      data: { idSituacionEscolar: $("#situacionEscolar").val() },
      dataType: "json",
      success: function(data) {
    	  var options = '';
            options += '<option value="" selected="selected">Seleccione una opci&oacute;n...</option>'
            $(data.evaluaciones).each(function() {
                options += '<option value="' + this.id + '">' + this.valor + '</option>';
            });
             $("select#evaluacionRenovacion").html(options);
             deshabilitarEvaluacionPendiente();             
      }
    } );
    if($('#situacionEscolar').val().length == 0){
    	deshabilitarEvaluacionPendiente();
    }
  })
})
function deshabilitarEvaluacionPendiente(){
	document.getElementById("gustosTiempoLibre").disabled = false;
	document.getElementById("propositoAnioComienza").disabled = true;
	document.getElementById("motivoPendiente").value = "";
	document.getElementById("motivoPendiente").disabled = true;
	document.getElementById("motivoNoRenovacion").value = "";
	document.getElementById("motivoNoRenovacion").disabled = true;
	habilitarMotivoPendiente(document.getElementById("motivoPendiente"));
	document.getElementById("realizoEntrevista").checked = 0;
	document.getElementById("realizoEntrevista").disabled = true;
	document.getElementById("tipoContacto").value = "";
	document.getElementById("tipoContacto").disabled = true;
	habilitarMotivoTipoContacto(document.getElementById("tipoContacto"));
	//document.getElementById("observacionMateriasExamenes").disabled = true;
	//document.getElementById("observacionMateriasExamenes").value = "";
	//document.getElementById("realizadoVacaciones").disabled = true;
	//document.getElementById("realizadoVacaciones").value = "";
	document.getElementById("propositoAnioComienza").disabled = true;
	document.getElementById("propositoAnioComienza").value = "";
	//document.getElementById("propositoAnioComienzaList").disabled = true;
	//document.getElementById("propositoAnioComienzaList").value = "";
	document.getElementById("gustosTiempoLibre").disabled = true;
	document.getElementById("gustosTiempoLibre").value = "";
}

function habilitarMaterialCompletoCertificadoAlumnoRegular(obj){
	
	if(	((document.getElementById("fotocipiaBoletin").value == 1) || (document.getElementById("fotocipiaBoletin").value == 3))&&
		((obj.value == 1) || (obj.value == 3))&&
		((document.getElementById("firmaAutorizacionImagen").value == 1) || (document.getElementById("firmaAutorizacionImagen").value == 3))&&
		((document.getElementById("firmaActaCompromiso").value == 1) || (document.getElementById("firmaActaCompromiso").value == 3))&&
		((document.getElementById("firmaAutorizacionCierreCaja").value == 1) || (document.getElementById("firmaAutorizacionCierreCaja").value == 3)))
		
	{
		document.getElementById("materialCompleto").checked = 1
	}else{
		document.getElementById("materialCompleto").checked = 0

	}
}

function habilitarMaterialCompletoFotocipiaBoletin(obj){
	
	if(	((document.getElementById("certificadoAlumnoRegular").value == 1) || (document.getElementById("certificadoAlumnoRegular").value == 3))&&
		((obj.value == 1) || (obj.value == 3))&&
		((document.getElementById("firmaAutorizacionImagen").value == 1) || (document.getElementById("firmaAutorizacionImagen").value == 3))&&
		((document.getElementById("firmaActaCompromiso").value == 1) || (document.getElementById("firmaActaCompromiso").value == 3))&&
		((document.getElementById("firmaAutorizacionCierreCaja").value == 1) || (document.getElementById("firmaAutorizacionCierreCaja").value == 3)))
		
	{
		document.getElementById("materialCompleto").checked = 1
	}else{
		document.getElementById("materialCompleto").checked = 0

	}
}

function habilitarMaterialCompletoFirmaActaCompromiso(obj){
	
	if(	((document.getElementById("certificadoAlumnoRegular").value == 1) || (document.getElementById("certificadoAlumnoRegular").value == 3))&&
		((obj.value == 1) || (obj.value == 3))&&
		((document.getElementById("fotocipiaBoletin").value == 1) || (document.getElementById("fotocipiaBoletin").value == 3))&&
		((document.getElementById("firmaAutorizacionImagen").value == 1) || (document.getElementById("firmaAutorizacionImagen").value == 3))&&
		((document.getElementById("firmaAutorizacionCierreCaja").value == 1) || (document.getElementById("firmaAutorizacionCierreCaja").value == 3)))
		
	{
		document.getElementById("materialCompleto").checked = 1
	}else{
		document.getElementById("materialCompleto").checked = 0

	}
}

function habilitarMaterialCompletoFirmaAutorizacionCierreCaja(obj){
		
	if(	((document.getElementById("certificadoAlumnoRegular").value == 1) || (document.getElementById("certificadoAlumnoRegular").value == 3))&&
			((obj.value == 1) || (obj.value == 3))&&
			((document.getElementById("fotocipiaBoletin").value == 1) || (document.getElementById("fotocipiaBoletin").value == 3))&&
			((document.getElementById("firmaActaCompromiso").value == 1) || (document.getElementById("firmaActaCompromiso").value == 3))&&
			((document.getElementById("firmaAutorizacionImagen").value == 1) || (document.getElementById("firmaAutorizacionImagen").value == 3))
			)
			
		{
			document.getElementById("materialCompleto").checked = 1
		}else{
			document.getElementById("materialCompleto").checked = 0

		}
}

function habilitarMaterialCompletoFirmaAutorizacionImagen(obj){
	
	if(	((document.getElementById("certificadoAlumnoRegular").value == 1) || (document.getElementById("certificadoAlumnoRegular").value == 3))&&
			((obj.value == 1) || (obj.value == 3))&&
			((document.getElementById("fotocipiaBoletin").value == 1) || (document.getElementById("fotocipiaBoletin").value == 3))&&
			((document.getElementById("firmaActaCompromiso").value == 1) || (document.getElementById("firmaActaCompromiso").value == 3))&&
			((document.getElementById("firmaAutorizacionCierreCaja").value == 1) || (document.getElementById("firmaAutorizacionCierreCaja").value == 3)))
			
		{
			document.getElementById("materialCompleto").checked = 1
		}else{
			document.getElementById("materialCompleto").checked = 0

		}
}

function habilitarCamposBecado(obj){
	if(obj.disabled || obj.checked){
		document.getElementById("motivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("motivoAusencia").value = "";
		document.getElementById("otroMotivoAusencia").value= "";	
		document.getElementById("realizadoVacaciones").disabled = false;
	}
	else{
		document.getElementById("motivoAusencia").disabled = false;
		//document.getElementById("realizadoVacaciones").disabled = true;
		//document.getElementById("realizadoVacaciones").value= "";
	}
//	habilitarChecks(!(document.getElementById("participoRA").checked || obj.checked));	
}

function habilitarCamposRA(obj){
	
	if(obj.disabled || obj.checked){
		document.getElementById("motivoAusenciaRA").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").disabled = true;
		document.getElementById("motivoAusenciaRA").value ="";
		document.getElementById("otroMotivoAusenciaRA").value= "";
		document.getElementById("realizadoVacaciones").disabled = false;
		document.getElementById("raNoConvocado").checked = true;
		document.getElementById("motivoNoConvocatoria").disabled = true;
	}
	else{
		document.getElementById("motivoAusenciaRA").disabled = true;	
		//document.getElementById("realizadoVacaciones").disabled = true;
		//document.getElementById("realizadoVacaciones").value= "";
	}
//	habilitarChecks(!(document.getElementById("participoBecado").checked || obj.checked));	
}

//function habilitarChecks(valor){
//	document.getElementById("fotocipiaBoletin").disabled = valor;
//	}


function habilitarCamposRenovacion(obj){
	//antes PENDIENTE(3,"Pendiente");
	//ahora PENDIENTE(2,"Pendiente"),
	document.getElementById("propositoAnioComienza").disabled = false;
	document.getElementById("gustosTiempoLibre").disabled = false;
	if(obj.value == 2){		
		document.getElementById("excepcionR").disabled = true;
		document.getElementById("excepcionR").checked= false;
		document.getElementById("motivoPendiente").disabled = false;
		document.getElementById("motivoOtro").disabled = true;
		document.getElementById("motivoNoRenovacion").disabled = true;
		document.getElementById("motivoNoRenovacion").value= "";
		document.getElementById("evaluacionCobroBeca").disabled = true;
		document.getElementById("evaluacionCobroBeca").value= "";
		document.getElementById("realizoEntrevista").disabled = false;
//		document.getElementById("realizoEntrevista").checked = 0;
		document.getElementById("tipoContacto").disabled = false;
//		document.getElementById("tipoContacto").value= "";

//		document.getElementById("lugarEntrevista").disabled = true;
//		document.getElementById("lugarEntrevista").value = "";
		document.getElementById("certificadoAlumnoRegular").disabled = true;
		document.getElementById("certificadoAlumnoRegular").value= "";
		document.getElementById("firmaActaCompromiso").disabled = true;
		document.getElementById("firmaActaCompromiso").value= "";
		document.getElementById("firmaAutorizacionCierreCaja").disabled = true;
		document.getElementById("firmaAutorizacionCierreCaja").value= "";
		document.getElementById("firmaAutorizacionImagen").disabled = true;
		document.getElementById("firmaAutorizacionImagen").value= "";
		document.getElementById("fotocipiaBoletin").disabled = true;
		document.getElementById("fotocipiaBoletin").value= "";
//		document.getElementById("observacionMateriasExamenes").disabled = true;
//		document.getElementById("observacionMateriasExamenes").value = "";
//		document.getElementById("escolaridadCompromisoAnterior").disabled = true;
//		document.getElementById("escolaridadCompromisoAnterior").value= "";
//		document.getElementById("realizadoVacaciones").disabled = true;
//		document.getElementById("realizadoVacaciones").value= "";
		document.getElementById("propositoAnioComienza").disabled = true;
		document.getElementById("propositoAnioComienza").value= "";
//		document.getElementById("propositoAnioComienzaList").disabled = true;
//		document.getElementById("gustosTiempoLibre").disabled = true;
//		document.getElementById("gustosTiempoLibre").value = "";
		//document.getElementById("expectativasRA").disabled = true;
		//document.getElementById("expectativasRA").value= "";
	//	document.getElementById("destinoDinero").disabled = true;
	//	document.getElementById("destinoDinero").value= "";
		document.getElementById("proximaEntrevista").disabled = false;
		document.getElementById("horaProxEntrevista").disabled = false;
		document.getElementById("lugarProximaEntrevista").disabled = false;
		document.getElementById("entregaMaterial").disabled = true;
		document.getElementById("entregaMaterial").checked= false;
		document.getElementById("materialCompleto").checked= false;
		document.getElementById("motivoSuspension").value= "";
		document.getElementById("motivoSuspension").disabled = true;
		habilitarTipocontacto(document.getElementById("realizoEntrevista"));
			
	}
	//antes NORENUEVA(2,"No renueva"),
	//ahora NO_RENUEVA(1,"No renueva"),
	else if(obj.value == 1){
		document.getElementById("excepcionR").disabled = true;
		document.getElementById("excepcionR").checked= false;
		document.getElementById("motivoPendiente").disabled = true;
		document.getElementById("motivoPendiente").value= "";
		document.getElementById("motivoOtro").disabled = true;
		document.getElementById("motivoNoRenovacion").disabled = false;
		document.getElementById("evaluacionCobroBeca").disabled = true;
		document.getElementById("motivoPendiente").value= "";
		document.getElementById("realizoEntrevista").disabled = false;
//		document.getElementById("realizoEntrevista").checked = 0;
		document.getElementById("tipoContacto").disabled = false;
//		document.getElementById("tipoContacto").value= "";

//		document.getElementById("lugarEntrevista").disabled = true;
//		document.getElementById("lugarEntrevista").value = "";
		document.getElementById("certificadoAlumnoRegular").disabled = true;
		document.getElementById("certificadoAlumnoRegular").value= "";
		document.getElementById("firmaActaCompromiso").disabled = true;
		document.getElementById("firmaActaCompromiso").value= "";
		document.getElementById("firmaAutorizacionCierreCaja").disabled = true;
		document.getElementById("firmaAutorizacionCierreCaja").value= "";
		document.getElementById("firmaAutorizacionImagen").disabled = true;
		document.getElementById("firmaAutorizacionImagen").value= "";
		document.getElementById("fotocipiaBoletin").disabled = true;
		document.getElementById("fotocipiaBoletin").value= "";
//		document.getElementById("observacionMateriasExamenes").disabled = true;
//		document.getElementById("observacionMateriasExamenes").value = "";
//		document.getElementById("escolaridadCompromisoAnterior").disabled = true;
//		document.getElementById("escolaridadCompromisoAnterior").value= "";
//		document.getElementById("realizadoVacaciones").disabled = true;
//		document.getElementById("realizadoVacaciones").value= "";
		document.getElementById("propositoAnioComienza").disabled = true;
		document.getElementById("propositoAnioComienza").value= "";
//		document.getElementById("propositoAnioComienzaList").disabled = true;
//		document.getElementById("gustosTiempoLibre").disabled = true;
//		document.getElementById("gustosTiempoLibre").value = "";
		//document.getElementById("expectativasRA").disabled = true;
		//document.getElementById("expectativasRA").value= "";
//		document.getElementById("destinoDinero").disabled = true;
//		document.getElementById("destinoDinero").value= "";
		document.getElementById("proximaEntrevista").disabled = true;
		document.getElementById("proximaEntrevista").value= "";
		document.getElementById("horaProxEntrevista").disabled = true;
		document.getElementById("horaProxEntrevista").value= "";
		document.getElementById("lugarProximaEntrevista").disabled = true;
		document.getElementById("entregaMaterial").disabled = true;
		document.getElementById("entregaMaterial").checked= false;
		document.getElementById("materialCompleto").checked= false;
		document.getElementById("motivoSuspension").value= "";
		document.getElementById("motivoSuspension").disabled = true;
		habilitarTipocontacto(document.getElementById("realizoEntrevista"));
		
	}
	//antes RENUEVA(1,"Renueva"),
	//ahora RENUEVA(5,"Renueva")
	else if (obj.value == 5){
		document.getElementById("excepcionR").disabled = false;
		document.getElementById("motivoNoRenovacion").disabled = true;
		document.getElementById("motivoNoRenovacion").value= "";
		document.getElementById("motivoPendiente").disabled = true;
		document.getElementById("motivoPendiente").value= "";
		document.getElementById("motivoOtro").disabled = true;
		document.getElementById("evaluacionCobroBeca").disabled = false;
		document.getElementById("realizoEntrevista").disabled = true;
		document.getElementById("realizoEntrevista").checked = false;
		document.getElementById("tipoContacto").disabled = true;
		document.getElementById("tipoContacto").value = "";
		
		document.getElementById("lugarEntrevista").disabled = false;
		document.getElementById("certificadoAlumnoRegular").disabled = false;
		document.getElementById("firmaActaCompromiso").disabled = false;
		document.getElementById("firmaAutorizacionCierreCaja").disabled = false;
		document.getElementById("firmaAutorizacionImagen").disabled = false;
		document.getElementById("fotocipiaBoletin").disabled = false;
//		document.getElementById("observacionMateriasExamenes").disabled = false;
//		document.getElementById("escolaridadCompromisoAnterior").disabled = false;
		document.getElementById("realizadoVacaciones").disabled = false;
		document.getElementById("propositoAnioComienza").disabled = false;
//		document.getElementById("propositoAnioComienzaList").disabled = false;
//		document.getElementById("gustosTiempoLibre").disabled = false;
		//document.getElementById("expectativasRA").disabled = false;
//		document.getElementById("destinoDinero").disabled = false;
		document.getElementById("proximaEntrevista").disabled = false;
		document.getElementById("horaProxEntrevista").disabled = false;
		document.getElementById("lugarProximaEntrevista").disabled = false;
		document.getElementById("entregaMaterial").disabled = false;
		document.getElementById("participoRA").disabled = false;
		document.getElementById("participoBecado").disabled = false;
		document.getElementById("motivoAusencia").disabled = false;
		document.getElementById("motivoAusenciaRA").disabled = false;

	}else {
		document.getElementById("excepcionR").disabled = true;
		document.getElementById("excepcionR").checked= false;
		document.getElementById("motivoNoRenovacion").disabled = true;
		document.getElementById("motivoPendiente").disabled = true;
		document.getElementById("motivoOtro").disabled = true;
		document.getElementById("evaluacionCobroBeca").disabled = true;
		document.getElementById("realizoEntrevista").disabled = true;
		document.getElementById("tipoContacto").disabled = true;
		document.getElementById("certificadoAlumnoRegular").disabled = true;
		document.getElementById("certificadoAlumnoRegular").value= "";
		document.getElementById("firmaActaCompromiso").disabled = true;
		document.getElementById("firmaActaCompromiso").value= "";
		document.getElementById("firmaAutorizacionCierreCaja").disabled = true;
		document.getElementById("firmaAutorizacionCierreCaja").value= "";
		document.getElementById("firmaAutorizacionImagen").disabled = true;
		document.getElementById("firmaAutorizacionImagen").value= "";
		document.getElementById("fotocipiaBoletin").disabled = true;
		document.getElementById("fotocipiaBoletin").value= "";
//		document.getElementById("observacionMateriasExamenes").disabled = true;
//		document.getElementById("observacionMateriasExamenes").value = "";
//		document.getElementById("escolaridadCompromisoAnterior").disabled = true;
//		document.getElementById("escolaridadCompromisoAnterior").value= "";
//		document.getElementById("realizadoVacaciones").disabled = true;
//		document.getElementById("realizadoVacaciones").value= "";
		document.getElementById("propositoAnioComienza").disabled = true;
		document.getElementById("propositoAnioComienza").value= "";
//		document.getElementById("propositoAnioComienzaList").disabled = true;
//		document.getElementById("gustosTiempoLibre").disabled = true;
//		document.getElementById("gustosTiempoLibre").value = "";
	//	document.getElementById("expectativasRA").disabled = true;
	//	document.getElementById("expectativasRA").value= "";
	//	document.getElementById("destinoDinero").disabled = true;
	//	document.getElementById("destinoDinero").value= "";
		document.getElementById("proximaEntrevista").disabled = true;
		document.getElementById("proximaEntrevista").value= "";
		document.getElementById("horaProxEntrevista").disabled = true;
		document.getElementById("horaProxEntrevista").value= "";
		document.getElementById("lugarProximaEntrevista").disabled = true;
		document.getElementById("entregaMaterial").disabled = true;
		document.getElementById("entregaMaterial").checked= false;
		document.getElementById("materialCompleto").checked= false;
		document.getElementById("motivoSuspension").value= "";
		document.getElementById("motivoSuspension").disabled = true;
		habilitarTipocontacto(document.getElementById("realizoEntrevista"));
		document.getElementById("tipoContacto").disabled = true;
		
	}
		
	habilitarMotivoPendiente(document.getElementById("motivoPendiente"));
	habilitarMotivoTipoContacto(document.getElementById("tipoContacto"));
	habilitarInformacionPadrino(obj);	
}

function habilitarOtroMotivo(obj){
	if(obj.value == 4){
		document.getElementById("otroMotivoAusencia").disabled = false;
	}
	else{
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusencia").value = "";
	}
}

function habilitarOtroMotivoRA(obj){
	if(obj.value == 4){
		document.getElementById("otroMotivoAusenciaRA").disabled = false;
	}
	else{
		document.getElementById("otroMotivoAusenciaRA").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").value = "";
	}
}

function habilitarTipocontacto(valor){
	if(valor.checked){
		document.getElementById("realizoEntrevista").disabled = false;
		document.getElementById("tipoContacto").disabled = true;
		document.getElementById("tipoContacto").value = "";
		document.getElementById("participoBecado").disabled = false;
		document.getElementById("participoRA").disabled = false;
		document.getElementById("motivoAusencia").disabled = false;
		document.getElementById("motivoAusenciaRA").disabled = false;
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").disabled = false;

		document.getElementById("lugarEntrevista").disabled = false;
		document.getElementById("motivoTipoContactoOtro").disabled = true;
		document.getElementById("motivoTipoContactoOtro").value = "";
	}
	else{
		document.getElementById("tipoContacto").disabled = false;
		document.getElementById("participoBecado").disabled = false;
		document.getElementById("participoBecado").checked = false;
		document.getElementById("participoRA").disabled = true;
		document.getElementById("participoRA").checked = false;
		//document.getElementById("realizadoVacaciones").disabled = true;
		document.getElementById("motivoAusencia").disabled = true;
		document.getElementById("motivoAusencia").value = "";
		document.getElementById("motivoAusenciaRA").disabled = true;
		document.getElementById("motivoAusenciaRA").value = "";
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusencia").value = "";
		document.getElementById("otroMotivoAusenciaRA").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").value = "";

		document.getElementById("lugarEntrevista").disabled = true;
//		document.getElementById("motivoTipoContactoOtro").disabled = true;
//		document.getElementById("motivoTipoContactoOtro").value = "";	
		habilitarMotivoTipoContacto(document.getElementById("tipoContacto"));
	}
}


function habilitarMotivoPendiente(obj){
	if(obj.value == 3){
		document.getElementById("motivoOtro").disabled = false;
	}
	else{
		document.getElementById("motivoOtro").disabled = true;
//		document.getElementById("motivoOtro").value = "";	
	}
}

function habilitarMotivoTipoContacto(obj){
	if(obj.value == 5){	
		document.getElementById("motivoTipoContactoOtro").disabled = false;
	}
	else{
		document.getElementById("motivoTipoContactoOtro").disabled = true;
		document.getElementById("motivoTipoContactoOtro").value = "";
	
}
}

function habilitarMotivoSuspension(obj){
	if(obj.value == 2){
		document.getElementById("motivoSuspension").disabled = false;
		
	}
	else{
			document.getElementById("motivoSuspension").disabled = true;
			document.getElementById("motivoSuspension").value = "";
		}
}

function habilitarInformacionPadrino(obj){
	//antes RENUEVA(1,"Renueva"),
	//ahora RENUEVA(5,"Renueva")
	document.getElementById("propositoAnioComienza").disabled = false;
	document.getElementById("gustosTiempoLibre").disabled = false;
	if(obj.value == 5){
		//document.getElementById("observacionMateriasExamenes").disabled = false;
		document.getElementById("realizadoVacaciones").disabled = false;
		document.getElementById("propositoAnioComienza").disabled = false;
	//	document.getElementById("propositoAnioComienzaList").disabled = false;
		document.getElementById("gustosTiempoLibre").disabled = false;
	}else{
		//document.getElementById("observacionMateriasExamenes").disabled = true;
		//document.getElementById("observacionMateriasExamenes").value = "";
//		document.getElementById("realizadoVacaciones").disabled = true;
//		document.getElementById("realizadoVacaciones").value = "";
		document.getElementById("propositoAnioComienza").disabled = true;
		document.getElementById("propositoAnioComienza").value = "";
		//document.getElementById("propositoAnioComienzaList").disabled = true;
		//document.getElementById("propositoAnioComienzaList").value = "";
		document.getElementById("gustosTiempoLibre").disabled = true;
		document.getElementById("gustosTiempoLibre").value = "";
	}
}

function guardar(valor, valorPerfil){
	document.forms['altaEntrevistaIndividual'].valorPerfil.value = valorPerfil;
	document.forms['altaEntrevistaIndividual'].valorGuardar.value = valor;
	document.forms['altaEntrevistaIndividual'].submit();
}


function cargarDatos(){
	habilitarCamposRenovacion(document.getElementById("evaluacionRenovacion"));
	habilitarCamposBecado(document.getElementById("participoBecado"));
	habilitarCamposRA(document.getElementById("participoRA"));
	habilitarOtroMotivo(document.getElementById("motivoAusencia"));
	habilitarOtroMotivoRA(document.getElementById("motivoAusenciaRA"));
	habilitarMotivoSuspension(document.getElementById("evaluacionCobroBeca"));	
}