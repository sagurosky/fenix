<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		
		var selectVinculo ='<select name="vinculoFFs" id="vinculo"><option ></option>'+
							'<c:forEach items="${entrevistaTSDTO.listVinculo}" var="vinculo"><option value="${vinculo.id}" >${vinculo.valor}</option></c:forEach></select>';
		var selectConviveFichas ='<select name="conviveFichas" id="conviveFichas" ><option ></option>'+
									'<c:forEach items="${entrevistaTSDTO.listConvive}" var="convive"><option value="${convive.id}">${convive.valor}</option></c:forEach></select>';
		var selectNivelEducativo ='<select name="nivelEducativoFichas" id="nivelEducativoFichas" ><option></option>'+
									'<c:forEach items="${entrevistaTSDTO.listNivelEducativo}" var="nivelEducativo"><option value="${nivelEducativo.id}">${nivelEducativo.valor}</option></c:forEach></select>';						 
		
		counter++;
		
		$('#tbody').append('<tr id="fila' + counter + '">'+
				'<td><input type="checkbox" value="fila' + counter + '"></td>'+
				'<td align="center" valign="middle" style="font-size: 12px">' + selectVinculo + '</td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="nombreFichas"></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="apellidoFichas"  ></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" size="2" ></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;">' + selectConviveFichas + '</td>'+
				'<td align="center" valign="middle" style="font-size: 12px;">' + selectNivelEducativo + '</td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="abandonoRepitenciaFichas" ></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" ></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" ></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();"></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();"></td>'+
				'<td align="center" valign="middle" style="font-size: 12px;"><textarea name="observacionesTSList" rows="2" cols="40" id="observacionesTS" style="font-stretch: normal;"></textarea></td>'+
			'</tr>');
		
		$("#tablaFicha :text").css("width", "80px");
		
	});

	$("#botonBorrar").click(function () {
		var checks = $("#tablaFicha :checked");
		var i=0;
		for (i=0;i<checks.length;i++){
			$("#" + checks[i].value).remove();
		}
    });
	
});
</script>
</head>
<body>
<div id="div04">
<fieldset style="width: auto;">
<table id="tablaFicha" border="0" width="auto" style="font-size: x-small">
			
		<thead align="center">
			<tr>
				<th></th>
				<th>Vinculo</th>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Edad</th>
				<th>Convive </th>
				<th>Max. nivel educativo alcanzado</th>
				<th>Motivo de abandono / repitencia</th>
				<th>(Si trabaja) Nombre de la ocupacion </th>
				<th>Estabilidad Laboral</th>
				<th>Remuneración</th>
				<th>Otros Ingresos(jubilacion/pension/AuxHijo)</th>
				<th>Observaciones TS</th>
			</tr>
		</thead>
		
		<tbody id="tbody">
			<c:choose>
				<c:when test="${!empty entrevistaTSDTO.entrevistaTS.perfilAlumno.fichaFamiliar}">
					<c:forEach items="${entrevistaTSDTO.entrevistaTS.perfilAlumno.fichaFamiliar}" var="ficha" varStatus="loop">
						<input type="hidden" name="idFichaFamiliars" id="fiidFichaFamiliars" value="${ficha.id}">
						<script>
							incrementarCounter();
						</script>
						
						<!-- counter empieza en 1 y loop en 0, entonces tomo loop.index +1 -->
						<tr id="fila${loop.index +1}">
							<td><input type="checkbox" value="fila${loop.index +1}"></td>
							
							<td align="center" valign="middle" style="font-size: 12px;">
								<select name="vinculoFFs" id="vinculo">
									<option ></option>
									<c:forEach items="${entrevistaTSDTO.listVinculo}" var="vinculo">
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
							
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="nombreFichas" value="${ficha.nombre}"></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="apellidoFichas" value="${ficha.apellido}"></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" value="${ficha.edad}" size="2"></td>
							
							<td align="center" valign="middle" style="font-size: 12px;">
								<select name="conviveFichas" id="conviveFichas" >
									<option ></option>
									<c:forEach items="${entrevistaTSDTO.listConvive}" var="convive">
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
							</td>
							
							<td align="center" valign="middle" style="font-size: 12px;">
								<select name="nivelEducativoFichas" id="nivelEducativoFichas" >
									<option></option>
									<c:forEach items="${entrevistaTSDTO.listNivelEducativo}" var="nivelEducativo">
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
							
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="abandonoRepitenciaFichas" value="${ficha.abandonoRepitencia}"></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" value="${ficha.ocupacionLaboral}"></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" value="${ficha.estabilidadLaboral}"></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();" value="${ficha.renumeracion}"></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();" value="${ficha.otrosIngresos}"></td>
							<td align="center" valign="middle" style="font-size: 12px;"><textarea name="observacionesTSList" rows="2" cols="40" id="observacionesTS" style="font-stretch: normal;">${ficha.observacionesTS}</textarea></td>
							
						</tr>
						
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					
					<script>
						incrementarCounter();
					</script>
						
					<tr id="fila1">
							<td><input type="checkbox" value="fila1"></td>
							
							<td align="center" valign="middle" style="font-size: 12px;">
								<select name="vinculoFFs" id="vinculo">
									<option ></option>
									<c:forEach items="${entrevistaTSDTO.listVinculo}" var="vinculo">
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
							
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="nombreFichas" value=""></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="apellidoFichas" value=""></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" value="" size="2"></td>
							
							<td align="center" valign="middle" style="font-size: 12px;">
								<select name="conviveFichas" id="conviveFichas" >
									<option ></option>
									<c:forEach items="${entrevistaTSDTO.listConvive}" var="convive">
										<option value="${convive.id}">${convive.valor}</option>
									</c:forEach>
								</select>
							</td>
							
							<td align="center" valign="middle" style="font-size: 12px;">
								<select name="nivelEducativoFichas" id="nivelEducativoFichas" >
									<option></option>
									<c:forEach items="${entrevistaTSDTO.listNivelEducativo}" var="nivelEducativo">
										<option value="${nivelEducativo.id}">${nivelEducativo.valor}</option>
									</c:forEach>
								</select>
							</td>
							
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="abandonoRepitenciaFichas" value=""></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" value=""></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" value=""></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();" value=""></td>
							<td align="center" valign="middle" style="font-size: 12px;"><input type="text" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();" value=""></td>
							<td align="center" valign="middle" style="font-size: 12px;"><textarea name="observacionesTSList" rows="2" cols="40" id="observacionesTS" style="font-stretch: normal;"></textarea></td>
					</tr>
						
				</c:otherwise>
			</c:choose>
		</tbody>
			
</table>
<br></br>
<div align="left">
	<input type="button" value="Agregar Familiar" id="botonAgregar" class="ui-state-default ui-corner-all"/>
	<input type="button" value="Eliminar Familiar" id="botonBorrar" class="ui-state-default ui-corner-all"/>
</div>
<br></br>
	
</fieldset>
</div>
</body>
</html>