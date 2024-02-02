<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
var counter = 0;
var contadorff=0;

function incrementarCounter(){
	
	counter++;
	//alert();
	
	
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

function chequearLongitudFF(obj){
	if (obj.value.length > 255) {
	obj.value = obj.value.substring(0, 255);
	}
}




$(document).ready(function(){
	
	
	//$("#color2").change(function(){
	//	$("#deConviveSN").val($(this).val());
	//	$("#valor2").val($(this).val());
 	//});
	//alert(counter);
	//alert(contadorff);
	$("#contadorFicha").val(counter);
	if(counter!=0 || contadorff!=0){
		document.getElementById("deNombreFF").value = document.getElementById("nombreFichas").value;	
	}
	
	
	
	//$("#deNombreFF").val("#nombreFichas");
	
	//document.getElementById("deConviveSN").value = document.getElementById("nombreFichas").value;
	
	
	$("#tablaFicha :text").css("width", "80px");
	
	$("#botonAgregarFicha").click(function () {
		var selectVinculo ='<select name="vinculoFFs" id="vinculo"><option ></option>'+
						   	'<c:forEach items="${listVinculo}" var="vinculo"><option value="${vinculo.id}" >${vinculo.valor}</option></c:forEach></select>';
		var selectConviveFichas ='<select name="conviveFichas" id="conviveFichas" ><option ></option>'+
								 '<c:forEach items="${listConvive}" var="convive"><option value="${convive.id}">${convive.valor}</option></c:forEach></select>';
		var selectNivelEducativo ='<select name="nivelEducativoFichas" id="nivelEducativoFichas" ><option></option>'+
								  '<c:forEach items="${listNivelEducativo}" var="nivelEducativo"><option value="${nivelEducativo.id}">${nivelEducativo.valor}</option></c:forEach></select>';						 
		
									  
		counter++;
		//contadorff++;
		contadorff=counter;
		$('#tbody').append('<tr id="fila' + counter + '">'+
				'<td><input type="checkbox" value="fila' + counter + '"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px">' + selectVinculo + '</td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" id="nombreFichas" name="nombreFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="apellidoFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" size="2" class="digits"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;">' + selectConviveFichas + '</td>'+
				'<td align="left" valign="middle" style="font-size: 12px;">' + selectNivelEducativo + '</td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="abandonoRepitenciaFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();"></td>'+
			'</tr>');
		
		$("#tablaFicha :text").css("width", "80px");
		$("#contadorFicha").val(contadorff);
		
		$("#nombreFichas").change(function(){
			//alert(2);
			$("#deNombreFF").val($(this).val());
			});
		
		//document.getElementById("deNombreFF").value = document.getElementById("nombreFichas").value;
		
		
	});

	$("#botonBorrarFicha").click(function () {
		
		
		
		
		
		var checks = $("#tablaFicha :checked");
		var i=0;
		for (i=0;i<checks.length;i++){
			$("#" + checks[i].value).remove();
		
			if(contadorff<=0){
				$("#contadorFicha").val(contadorff);		
			}else{
				contadorff--;
				$("#contadorFicha").val(contadorff);
			}
			
		}
    	
	});
	
});

</script>
</head>
<body>
<br></br>
<table id="tablaFicha" border="0" width="80%" style="font-size: x-small">
			
			<thead align="center" >
				<tr >
					<th></th>
					<th width="100px">V&iacute;nculo</th>
					<th width="100px">Nombre</th>
					<th width="100px">Apellido</th>
					<th width="100px">Edad</th>
					<th width="100px">Convive </th>
					<th width="100px">Max. nivel educativo alcanzado</th>
					<th width="100px">Motivo de abandono / repitencia</th>
					<th width="100px">(Si trabaja) Nombre de la ocupaci&oacute;n </th>
					<th width="100px">Estabilidad Laboral</th>
					<th width="100px">Remuneración</th>
					<th width="100px">Otros Ingresos(jubilaci&oacute;n/pensi&oacute;n/AuxHijo)</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:if test="${!empty entrevistaSeleccionDTO.perfilAlumno.fichaFamiliar}">
					<c:forEach items="${entrevistaSeleccionDTO.fichasFamiliares}" var="fichaFamiliar" varStatus="loop">
							<script>
								incrementarCounter();
								
							</script>
							<tr id="fila<c:out value="${loop.count}"/>">
								<td><input type="checkbox" value="fila<c:out value="${loop.count}"/>"></td>
								<td align="left" valign="middle" style="font-size: 12px;">
									<select name="vinculoFFs" id="vinculoFicha" >
										<c:forEach items="${listVinculo}" var="vinculoFicha">
											<c:choose>
												<c:when test="${fichaFamiliar.vinculo.id == vinculoFicha.id}">
														<option value="${vinculoFicha.id}" selected="selected">${vinculoFicha.valor}</option>
												</c:when>
												<c:otherwise>
														<option value="${vinculoFicha.id}">${vinculoFicha.valor}</option>
												</c:otherwise>	
											</c:choose>
										
										</c:forEach>
									</select>
								</td>
								<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="nombreFichas" id="nombreFichas" value="${fichaFamiliar.nombre}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
								<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="apellidoFichas" id="apellidoFichas"  value="${fichaFamiliar.apellido}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
								<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" size="2" id="edadFichas" value="${fichaFamiliar.edad}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
								
								<td align="left" valign="middle" style="font-size: 12px;">
								<select name="conviveFichas" id="conviveFichas" >
									<c:forEach items="${listConvive}" var="convive">
										<c:choose>
											<c:when test="${fichaFamiliar.convive.id == convive.id}">
												<option value="${convive.id}" selected="selected">${convive.valor}</option>
											</c:when>
											<c:otherwise>
													<option value="${convive.id}">${convive.valor}</option>
											</c:otherwise>	
										</c:choose>
									</c:forEach>
								</select>
								</td>
								<td align="left" valign="middle" style="font-size: 12px;">
								<select name="nivelEducativoFichas" id="nivelEducativoFichas" >
									<c:forEach items="${listNivelEducativo}" var="nivelEducativo">
										<c:choose>
											<c:when test="${fichaFamiliar.nivelEducativo.id == nivelEducativo.id}">
												<option value="${nivelEducativo.id}" selected="selected">${nivelEducativo.valor}</option>
											</c:when>
											<c:otherwise>
													<option value="${nivelEducativo.id}">${nivelEducativo.valor}</option>
											</c:otherwise>	
										</c:choose>
									</c:forEach>
								</select>
								</td>
								<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="abandonoRepitenciaFichas"  id="abandonoRepitenciaFichas" value="${fichaFamiliar.abandonoRepitencia}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
								<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" id="ocupacionLaboralFichas" value="${fichaFamiliar.ocupacionLaboral}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
								<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" id="estabilidadLaboralFichas"  value="${fichaFamiliar.estabilidadLaboral}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
								<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();" id="renumeracionFichas" value="${fichaFamiliar.renumeracion}"></td>
								<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();" id="otrosIngresosFichas" value="${fichaFamiliar.otrosIngresos}"></td>
							</tr>
					</c:forEach>
				</c:if>
		</tbody>
</table>

<br>

<table>
	<tr>
		<td>
			<input type="button" value="Agregar Familiar" id="botonAgregarFicha" class="ui-state-default ui-corner-all"/>
			<input type="hidden" id="contadorFicha" name="contadorFicha">
			<input type="hidden" id="deNombreFF" name="deNombreFF">
			<input type="button" value="Eliminar Familiar" id="botonBorrarFicha" class="ui-state-default ui-corner-all"/>
		</td>
	</tr>
</table>

<br><br>

<table>
	<tr>
		<td>
			<p><font color="green"><label>Relación con la vivienda *</label></font>
			<select name="relacionVivienda" id="relacionViviendaFicha" class="required">
				<option value="">Seleccione una opci&oacute;n:</option>
				<c:forEach items="${listRelacionVivienda}" var="relacionVivienda">
					<c:choose>
						<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idRelacionVivienda.id == relacionVivienda.id}">
								<option value="${relacionVivienda.id}" selected="selected">${relacionVivienda.valor}</option>
						</c:when>
						<c:otherwise>
								<option value="${relacionVivienda.id}">${relacionVivienda.valor}</option>
						</c:otherwise>	
					</c:choose>
				</c:forEach>
			</select></p>
			
			
				<input type="hidden"  name="perfilAlumno.responsable1.egresosTotales" id="egresosTotalesFicha"  
					value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.egresosTotales}">	
			
			
			<p><label>Ingresos Totales</label>
				<input name="entrevistaSeleccion.ingresosTotalesFichaFamiliar" id="ingresosTotales" 
					value="${entrevistaSeleccionDTO.entrevistaSeleccion.ingresosTotalesFichaFamiliar}" class="digits" disabled="disabled"/>	
			</p>
			
			<p><label>Observaciones Egresos/Ingresos</label>
				<form:textarea path="entrevistaSeleccion.observacionesEgresoIngreso" rows="4" cols="40" id="observacionesEgresoIngreso" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</p>
			
		</td>
	</tr>
</table>
<br></br>
</body>
</html>