<%@page import="org.cimientos.intranet.modelo.perfil.PerfilAlumno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
    
    <%@ page import="java.util.List" %>
<%@ page import="org.cimientos.intranet.modelo.FichaFamiliar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
var counter = 0;

function incrementarCounter(){
	counter++;
}

function sumarIngreso(){
	var ingresoTotal = 0;
	
	var arrayValores = $(".ingreso");
	var i = 0;
	for(i; i < arrayValores.length; i++){
		var monto = parseInt(arrayValores[i].value);
		if(isNaN(monto)){
			
		}else{
			ingresoTotal += monto;
		}
	}
	$('#ingresosTotales').val(ingresoTotal);
}

$(document).ready(function(){

	sumarIngreso();
	
	$("#tablaFicha :text").css("width", "80px");
	
	$("#botonAgregar").click(function () {
		
		var selectVinculo ='<select name="vinculoFFs" id="vinculo" class="form-control"><option ></option>'+
							'<c:forEach items="${listVinculo}" var="vinculo"><option value="${vinculo.id}" >${vinculo.valor}</option></c:forEach></select>';
		var selectConviveFichas ='<select name="conviveFichas" id="conviveFichas" hidden><option value="0"></option>'+
									'<c:forEach items="${listConvive}" var="convive"><option value="${convive.id}">${convive.valor}</option></c:forEach></select>';
		var selectNivelEducativo ='<select name="nivelEducativoFichas" id="nivelEducativoFichas" class="form-control"><option></option>'+
									'<c:forEach items="${listNivelEducativo}" var="nivelEducativo"><option value="${nivelEducativo.id}">${nivelEducativo.valor}</option></c:forEach></select>';						 
		  
		var selectCondicionLaborall='<select name="nivelEducativoFichas" id="nivelEducativoFichas" class="form-control"><option></option>'+
		'<c:forEach items="${listNivelEducativo}" var="nivelEducativo"><option value="${nivelEducativo.id}">${nivelEducativo.valor}</option></c:forEach></select>';						 
		  							
		
//DMS tuve que ´ponerlo todo en una linea porque me daba error en el navegador, no reconocia los option.									
			var selectCondicionLaboral=	'<select  name="estabilidadLaboralFichas"  class="form-control "><option value="">Seleccione una opci&oacute;n:</option><option value="Trabaja" >Trabaja</option><option value="Desempleado/a">Desempleado/a</option><option value="Jubilado/a">Jubilado/a</option><option value="Pensionado/a">Pensionado/a</option><option value="Ama de casa">Ama de casa</option><option value="Estudiante">Estudiante</option>'+
									+'</select>';
		
									
		var selectTipoDeContratacion='<select  name="abandonoRepitenciaFichas"  class="form-control "><option value="" >Seleccione una opci&oacute;n:</option><option value="Formal, relación de dependencia" >Formal, relación de dependencia</option><option value="Formal, contrato temporario">Formal, contrato temporario</option><option value="Informal">Informal</option><option value="Monotributista/autónomo">Monotributista/autónomo</option><option value="Otro">Otro</option><option value="No Aplica">No Aplica</option>'+					
									+'</select>';
		counter++;
		
		$('#tbody').append('<tr id="fila' + counter + '">'+
				'<td><input type="checkbox" value="fila' + counter + '"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px">' + selectVinculo + '</td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="nombreFichas" class="form-control"></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="apellidoFichas" class="form-control" ></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" size="2" class="digits form-control">' + selectConviveFichas +' </td>'+
				
				'<td align="center" valign="middle" style="font-size: 12px;">' + selectNivelEducativo + '</td>'+
				'<td align="center" valign="middle" style="font-size: 12px;">'+selectCondicionLaboral+'</td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" class="form-control"></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;">'+selectTipoDeContratacion+'</td>'+
				'<input type="hidden" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();">'+
				'<input type="hidden" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();">'+
			'</tr>');
		
		$("#tablaFicha :text").css("width", "80px");
		
	});
	
	
	
//DMS funcion modificada

	$("#botonBorrar").click(function () {
			
			//agrego linea porque fallaba al borrar un registro (contadorff queda en 0 si no agrego familiar)
			contadorff=counter;
			
			var checks = $("#tablaFicha :checked");
			var i=0;
			for (i=0;i<checks.length;i++){
				
				//agrego condicion porque checks[i].value trae varios datos
				if(checks[i].value.substr(0,4)=="fila"){
					$("#" + checks[i].value).remove();
					if(contadorff<=0){
						$("#contadorFicha").val(contadorff);		
					}else{
						contadorff--;
						$("#contadorFicha").val(contadorff);
					}
				}
				
				
				
			}
	    	
		});
	
	
	
});
</script>
<style>
td
{
/* border:solid 1px #ddd; */
}


/* Estilos para el input */
.form-control {
    display: block;
    width: 100%;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

/* Estilo para el input cuando está enfocado */
.form-control:focus {
    border-color: #66afe9;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
}

</style>
</head>
<body>
<div id="div04">
<table id="tablaFicha" border="0" width="100%" style="font-size: x-small" cellspacing="1" cellpadding="1">
			
		<thead align="center">
			<tr >
<!-- 				<th width="150px"></th> -->
				<th  ></th>
				<th  >&nbsp;Vinculo&nbsp;</th>
				<th >&nbsp;Nombre&nbsp;</th>
				<th>&nbsp;Apellido&nbsp;</th>
				<th >&nbsp;Edad&nbsp;</th>
<!-- 				<th width="150px">&nbsp;Convive&nbsp;</th> -->
				<th >&nbsp;Max. nivel educativo alcanzado&nbsp;</th>
				<th >&nbsp;Condición Laboral&nbsp;</th>
				<th >&nbsp;Ocupación&nbsp;</th>
				<th >&nbsp;Tipo de contratación&nbsp;</th>
<!-- 				<th width="150px">&nbsp;Remuneración&nbsp;</th> -->
<!-- 				<th width="150px">&nbsp;Otros Ingresos (jubilación / pensión / AuxHijo)&nbsp;</th> -->
			</tr>
		</thead>
		
		<tbody id="tbody">
		
		
		
								<%
								//DMS necesito tener al candidato al inicio de la lista, por alguna razón muchas veces llega mal, este código ordena la lista   
								// Obtener la lista de fichas familiares del request
								
									PerfilAlumno perfilAlumno = (PerfilAlumno) request.getAttribute("perfilAlumno");
								   List<FichaFamiliar> fichas = perfilAlumno.getFichaFamiliar();

								
								
								   // Ordenar la lista moviendo el elemento con vinculoFicha.valor=="candidato" al principio
									if (fichas != null) {
											   java.util.Collections.sort(fichas, new java.util.Comparator<org.cimientos.intranet.modelo.FichaFamiliar>() {
									     		public int compare(org.cimientos.intranet.modelo.FichaFamiliar ficha1, org.cimientos.intranet.modelo.FichaFamiliar ficha2) {
									           // Poner el elemento con vinculoFicha.valor=="candidato" primero
									           if (ficha1.getVinculo().getValor().equals("Candidato")||ficha1.getVinculo().getValor().equals("Candidata/o")) {
									               
									        	   return -1; // Poner ficha1 antes de ficha2
									           } else if ((ficha2.getVinculo().getValor().equals("Candidato")||ficha2.getVinculo().getValor().equals("Candidata/o"))) {
									        	   
									        	   return 1; // Poner ficha2 antes de ficha1
									           }
									           // En otros casos, no cambia el orden
									           return 0;
									       }
									   });
									}
								%>
		
		
		
		
		
		
		
		
			<c:choose>
				<c:when test="${!empty perfilAlumno.fichaFamiliar}">
					<c:forEach items="${perfilAlumno.fichaFamiliar}" var="ficha" varStatus="loop">
					
						<script>
							incrementarCounter();
						</script>
						
						<!-- counter empieza en 1 y loop en 0, entonces tomo loop.index +1 -->
						<tr id="fila${loop.index +1}">
							<td><input type="checkbox" value="fila${loop.index +1}" width="2%" ></td>
							
							<td align="center" valign="middle" style="font-size: 12px;" >
								<select name="vinculoFFs" id="vinculo" class="form-control ">
									<option ></option>
									<c:forEach items="${listVinculo}" var="vinculo">
										<c:choose>
											<c:when test="${ficha.vinculo.id == vinculo.id}">
												<option value="${vinculo.id}" selected="selected">${vinculo.valor}</option>
											</c:when>
											<c:otherwise>
												<option value="${vinculo.id}" >${vinculo.valor}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</td>
							
							<td align="center" valign="middle" style="font-size: 12px;"><input  type="text" class="form-control "  name="nombreFichas"  value="${ficha.nombre}"></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" class="form-control "name="apellidoFichas" value="${ficha.apellido}"></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" class="form-control "  name="edadFichas" value="${ficha.edad}" size="2" class="digits"></td>
							
<!-- 							<td align="left" valign="middle" style="font-size: 12px;"> -->
								<select name="conviveFichas" id="conviveFichas" hidden>
									<option ></option>
									<c:forEach items="${listConvive}" var="convive">
										<c:choose>
											<c:when test="${ficha.convive.id == convive.id}">
												<option value="${convive.id}" selected="selected">${convive.valor}</option>
											</c:when>
											<c:otherwise>
												<option value="${convive.id}">${convive.valor}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
<!-- 							</td> -->
							
							<td align="center" valign="middle" style="font-size: 12px;">
								<select name="nivelEducativoFichas" id="nivelEducativoFichas"class="form-control " >
									<option></option>
									<c:forEach items="${listNivelEducativo}" var="nivelEducativo">
										<c:choose>
											<c:when test="${ficha.nivelEducativo.id == nivelEducativo.id}">
												<option value="${nivelEducativo.id}" selected="selected">${nivelEducativo.valor}</option>
											</c:when>
											<c:otherwise>
												<option value="${nivelEducativo.id}">${nivelEducativo.valor}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</td>
							
							
							
							
							<td align="center" valign="middle" style="font-size: 12px;">
								<select  class="form-control "name="estabilidadLaboralFichas" >
									<c:choose>
	    								<c:when test="${ficha.estabilidadLaboral == 'Trabaja'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" selected>Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a">Jubilado/a</option>
											<option value="Pensionado/a">Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
										</c:when>
										<c:when test="${ficha.estabilidadLaboral == 'Desempleado/a'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a"selected>Desempleado/a</option>
											<option value="Jubilado/a">Jubilado/a</option>
											<option value="Pensionado/a">Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
										</c:when>
										<c:when test="${ficha.estabilidadLaboral == 'Jubilado/a'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a" selected>Jubilado/a</option>
											<option value="Pensionado/a">Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
										</c:when>
										<c:when test="${ficha.estabilidadLaboral == 'Pensionado/a'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a" >Jubilado/a</option>
											<option value="Pensionado/a" selected>Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
										</c:when>
										<c:when test="${ficha.estabilidadLaboral == 'Ama de casa'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a" >Jubilado/a</option>
											<option value="Pensionado/a" >Pensionado/a</option>
											<option value="Ama de casa"selected>Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
										</c:when>
										<c:when test="${ficha.estabilidadLaboral == 'Estudiante'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a" >Jubilado/a</option>
											<option value="Pensionado/a" >Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante"selected>Estudiante</option>
										</c:when>
									<c:otherwise>
											<option value="" selected>Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a">Jubilado/a</option>
											<option value="Pensionado/a">Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
									</c:otherwise>	
								</c:choose>
							</select>
							
							</td>
							
							

							
							
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" class="form-control "name="ocupacionLaboralFichas" value="${ficha.ocupacionLaboral}"></td>
							
							
							<td align="center" valign="middle" style="font-size: 12px;">
							<select  class="form-control "name="abandonoRepitenciaFichas" >
									<c:choose>
	    								<c:when test="${ficha.abandonoRepitencia == 'Formal, relación de dependencia'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" selected>Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal">Informal</option>
											<option value="Monotributista/autónomo">Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
										</c:when>
										<c:when test="${ficha.abandonoRepitencia == 'Formal, contrato temporario'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario"selected>Formal, contrato temporario</option>
											<option value="Informal">Informal</option>
											<option value="Monotributista/autónomo">Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
											<option value="Otro">No Aplica</option>
										</c:when>
										<c:when test="${ficha.abandonoRepitencia == 'Informal'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal" selected>Informal</option>
											<option value="Monotributista/autónomo">Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
											<option value="Otro">No Aplica</option>
										</c:when>
										<c:when test="${ficha.abandonoRepitencia == 'Monotributista/autónomo'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal" >Informal</option>
											<option value="Monotributista/autónomo" selected>Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
											<option value="Otro">No Aplica</option>
										</c:when>
										<c:when test="${ficha.abandonoRepitencia == 'Otro'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal" >Informal</option>
											<option value="Monotributista/autónomo" >Monotributista/autónomo</option>
											<option value="Otro"selected>Otro</option>
											<option value="Otro">No Aplica</option>
										</c:when>
										<c:when test="${(ficha.abandonoRepitencia == 'No Aplica')||(ficha.abandonoRepitencia == '0')||(ficha.abandonoRepitencia == null)||(ficha.abandonoRepitencia == '')}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal" >Informal</option>
											<option value="Monotributista/autónomo" >Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
											<option value="Otro"selected>No Aplica</option>
										</c:when>
										
									<c:otherwise>
											<option value="" selected>Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal">Informal</option>
											<option value="Monotributista/autónomo">Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
											<option value="Otro">No Aplica</option>
									</c:otherwise>	
								</c:choose>
							</select>
							
							
							
							</td>
							
							
							<td align="left" valign="middle" style="font-size: 12px;"><input type="hidden" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();" value="${ficha.renumeracion}"></td>
							<td align="left" valign="middle" style="font-size: 12px;"><input type="hidden" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();" value="${ficha.otrosIngresos}"></td>
						</tr>
						
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					
					<script>
						incrementarCounter();
					</script>
						
					<tr id="fila1">
							<td><input type="checkbox" value="fila1"></td>
							
							<td align="left" valign="middle" style="font-size: 12px;">
								<select name="vinculoFFs" id="vinculo" class="form-control">
									<option ></option>
									<c:forEach items="${listVinculo}" var="vinculo">
										<c:choose>
											<c:when test="${ficha.vinculo.id == vinculo.id}">
												<option value="${vinculo.id}" selected="selected">${vinculo.valor}</option>
											</c:when>
											<c:otherwise>
												<option value="${vinculo.id}" >${vinculo.valor}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</td>
							
							<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="nombreFichas" value=""class="form-control"></td>
							<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="apellidoFichas" value=""class="form-control"></td>
							<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" value="" size="2" class="digits form-control"></td>
							
<!-- 							<td align="left" valign="middle" style="font-size: 12px;"> -->
								<select name="conviveFichas" id="conviveFichas" hidden>
									<option ></option>
									<c:forEach items="${listConvive}" var="convive">
										<option value="${convive.id}">${convive.valor}</option>
									</c:forEach>
								</select>
<!-- 							</td> -->
							
							<td align="left" valign="middle" style="font-size: 12px;">
								<select name="nivelEducativoFichas" id="nivelEducativoFichas" class="form-control">
									<option></option>
									<c:forEach items="${listNivelEducativo}" var="nivelEducativo">
										<option value="${nivelEducativo.id}">${nivelEducativo.valor}</option>
									</c:forEach>
								</select>
							</td>
							
<!-- 							<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" value=""class="form-control"></td> -->
							<td align="center" valign="middle" style="font-size: 12px;">
								<select  class="form-control "name="estabilidadLaboralFichas" >
									<c:choose>
	    								<c:when test="${ficha.estabilidadLaboral == 'Trabaja'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" selected>Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a">Jubilado/a</option>
											<option value="Pensionado/a">Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
										</c:when>
										<c:when test="${ficha.estabilidadLaboral == 'Desempleado/a'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a"selected>Desempleado/a</option>
											<option value="Jubilado/a">Jubilado/a</option>
											<option value="Pensionado/a">Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
										</c:when>
										<c:when test="${ficha.estabilidadLaboral == 'Jubilado/a'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a" selected>Jubilado/a</option>
											<option value="Pensionado/a">Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
										</c:when>
										<c:when test="${ficha.estabilidadLaboral == 'Pensionado/a'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a" >Jubilado/a</option>
											<option value="Pensionado/a" selected>Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
										</c:when>
										<c:when test="${ficha.estabilidadLaboral == 'Ama de casa'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a" >Jubilado/a</option>
											<option value="Pensionado/a" >Pensionado/a</option>
											<option value="Ama de casa"selected>Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
										</c:when>
										<c:when test="${ficha.estabilidadLaboral == 'Estudiante'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a" >Jubilado/a</option>
											<option value="Pensionado/a" >Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante"selected>Estudiante</option>
										</c:when>
									<c:otherwise>
											<option value="" selected>Seleccione una opci&oacute;n:</option>
											<option value="Trabaja" >Trabaja</option>
											<option value="Desempleado/a">Desempleado/a</option>
											<option value="Jubilado/a">Jubilado/a</option>
											<option value="Pensionado/a">Pensionado/a</option>
											<option value="Ama de casa">Ama de casa</option>
											<option value="Estudiante">Estudiante</option>
									</c:otherwise>	
								</c:choose>
							</select>
							
							</td>
							<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" value=""class="form-control"></td>

							
<!-- 							<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" value=""class="form-control"></td> -->
							<td align="center" valign="middle" style="font-size: 12px;">
							<select  class="form-control "name="abandonoRepitenciaFichas" >
									<c:choose>
	    								<c:when test="${ficha.abandonoRepitencia == 'Formal, relación de dependencia'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" selected>Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal">Informal</option>
											<option value="Monotributista/autónomo">Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
										</c:when>
										<c:when test="${ficha.abandonoRepitencia == 'Formal, contrato temporario'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario"selected>Formal, contrato temporario</option>
											<option value="Informal">Informal</option>
											<option value="Monotributista/autónomo">Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
										</c:when>
										<c:when test="${ficha.abandonoRepitencia == 'Informal'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal" selected>Informal</option>
											<option value="Monotributista/autónomo">Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
										</c:when>
										<c:when test="${ficha.abandonoRepitencia == 'Monotributista/autónomo'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal" >Informal</option>
											<option value="Monotributista/autónomo" selected>Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
										</c:when>
										<c:when test="${ficha.abandonoRepitencia == 'Otro'}">
											<option value="">Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal" >Informal</option>
											<option value="Monotributista/autónomo" >Monotributista/autónomo</option>
											<option value="Otro"selected>Otro</option>
										</c:when>
										
									<c:otherwise>
											<option value="" selected>Seleccione una opci&oacute;n:</option>
											<option value="Formal, relación de dependencia" >Formal, relación de dependencia</option>
											<option value="Formal, contrato temporario">Formal, contrato temporario</option>
											<option value="Informal">Informal</option>
											<option value="Monotributista/autónomo">Monotributista/autónomo</option>
											<option value="Otro">Otro</option>
									</c:otherwise>	
								</c:choose>
							</select>
							
							
							
							</td>
							<td align="left" valign="middle" style="font-size: 12px;"><input type="hidden" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();" value=""></td>
							<td align="left" valign="middle" style="font-size: 12px;"><input type="hidden" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();" value=""></td>
					</tr>
						
				</c:otherwise>
			</c:choose>
		</tbody>
			
</table>
<br></br>
<div align="left">
	<input type="button" value="Agregar Familiar" id="botonAgregar" class="ui-state-default ui-corner-all "/>
	<input type="button" value="Eliminar Familiar" id="botonBorrar" class="ui-state-default ui-corner-all "/>
</div>
<br><br>


<br><br>
<table>
	<tr>
		<td>
<!-- 			Relación con la vivienda -->
		</td>
		<td>
			<select name="relacionVivienda" id="relacionVivienda" class="required" hidden>
				<c:forEach items="${listRelacionVivienda}" var="relacionVivienda">
					<c:choose>
						<c:when test="${perfilAlumno.responsable1.idRelacionVivienda.id == relacionVivienda.id}">
							<option value="${relacionVivienda.id}" selected="selected">${relacionVivienda.valor}</option>
						</c:when>
						<c:otherwise>
								<option value="${relacionVivienda.id}">${relacionVivienda.valor}</option>
						</c:otherwise>	
					</c:choose>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>			
<!-- 			Ingresos Totales -->
		</td>
		<td>
			<input type="hidden" id="ingresosTotales" class="required digits"  disabled="disabled"/>	
		</td>
	</tr>
	<tr>
		<td>			
<!-- 			<font color="green">Egresos Totales *</font> -->
		</td>
		<td>
			<input type="hidden" id="egresosTotales"  name="responsable1.egresosTotales"  class="required" class="digits" value="${perfilAlumno.responsable1.egresosTotales}" >	
		</td>
	</tr>
	<tr>
		<td style="height: 10px; width: 500px;" colspan="2"></td>
	</tr>
</table>

</div>

</body>

</html>