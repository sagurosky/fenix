function validarCheckDatosEstimadosBoletin(obj)
{
	if(obj == true)
	{
		$("#materiasAprobadas").addClass("required");
		$("#materiasDesaprobadas").addClass("required");
		$("#inasistencias").addClass("required");
		$("#obsBoletin").addClass("required");
	}
	else
	{
		$("#materiasAprobadas").removeClass("required");
		$("#materiasDesaprobadas").removeClass("required");
		$("#inasistencias").removeClass("required");
		$("#obsBoletin").removeClass("required");
	}	
}

function habilitarDatosEstimadosBoletin()
{
	var datosEstimados = $("#datosEstimadosCheck").is(":checked");
	if(datosEstimados == true)
	{
		$("#materiasAprobadas").removeAttr("disabled");
		$("#materiasDesaprobadas").removeAttr("disabled");
		$("#inasistencias").removeAttr("disabled");
		$("#obsBoletin").removeAttr("disabled");
	}
	else
	{
		$("#materiasAprobadas").attr("disabled","disabled");
		$("#materiasDesaprobadas").attr("disabled","disabled");
		$("#inasistencias").attr("disabled","disabled");
		$("#obsBoletin").attr("disabled","disabled");
	}
}

function habilitarSituacionRenovacion()
{
	var motivoNoRenovacion = $("#motivoNoRenovacion").val();
	var evaluacionRenovacionBeca = $("#evalRenovacionBeca").val();
	var estadoEntrevista = $("#estadoEntrevista").val();
	if(motivoNoRenovacion == "" && evaluacionRenovacionBeca == "")
	{
		if(estadoEntrevista != 'Finalizada')
		{
			$("#situacionRenovacion").attr("disabled", "disabled");
		}
	}
	else
	{
		if(estadoEntrevista != 'Finalizada')
		{
			$("#situacionRenovacion").attr("disabled", "disabled");
		}
		else
		{
			$("#situacionRenovacion").removeAttr("disabled");
		}
	}
}

function habilitarProyeccionObservacionesAnioProximo()
{
	var evaluacionRenovacionFinal = $("#evalRenovacionBeca").val();
	var estadoEntrevista = $("#estadoEntrevista").val();
	if(evaluacionRenovacionFinal != 'Fin participación PFE' )
	{
		if(estadoEntrevista != 'Finalizada')
		{	
			$("#proyAnioProximo").attr("disabled","disabled");
			$("#observaciones").attr("disabled","disabled");
		}
	}
	else
	{
		if(estadoEntrevista == 'Finalizada')
		{
			$("#proyAnioProximo").removeAttr("disabled");
			$("#observaciones").removeAttr("disabled");
		}
		else
		{
			$("#proyAnioProximo").attr("disabled","disabled");
			$("#observaciones").attr("disabled","disabled");
		}
	}
		
}

function cargarDatos()
{
	habilitarSituacionRenovacion();
	habilitarProyeccionObservacionesAnioProximo();
	habilitarDatosEstimadosBoletin();
}