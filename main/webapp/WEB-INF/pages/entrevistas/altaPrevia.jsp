<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Registrar Materias Previas ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script type="text/javascript">

	function guardarNotas(action,id)
	{

		  var idsPrimerTrimestre = new Array();
		  var idsSegundoTrimestre = new Array();
		  var idsTercerTrimestre = new Array();
		  var idsCuartoTrimestre = new Array();
		  var idsQuintoTrimestre = new Array();

		  var idsEstadosMarzo = new Array();
		  var idsEstadosJulio = new Array();
		  var idsEstadosDiciembre = new Array();
		  var idsEstadosMesaAdicional = new Array();
		  var idsEstadosComentarios = new Array();
		  
		  var notasPrimerTrimestre = new Array();
		  var notasSegundoTrimestre = new Array();
		  var notasTercerTrimestre = new Array();
		  var notasCuartoTrimestre = new Array();
		  var notasQuintoTrimestre = new Array();

		  
		  
		  var indice=0;
		  var filasIds = $('#tabla td[name="idsJulio"]').each(function(){ idsPrimerTrimestre[indice] = $(this).text(); indice++; });
		  indice=0;
		  var filasIds = $('#tabla td[name="idsDiciembre"]').each(function(){ idsSegundoTrimestre[indice] = $(this).text(); indice++; });
		  indice=0;
		  var filasIds = $('#tabla td[name="idsMarzo"]').each(function(){ idsTercerTrimestre[indice] = $(this).text(); indice++; });
		  indice=0;
		  var filasIds = $('#tabla td[name="idsMesaAdicional"]').each(function(){ idsCuartoTrimestre[indice] = $(this).text(); indice++; });
		  indice=0;
		  var filasIds = $('#tabla td[name="idsComentarios"]').each(function(){ idsQuintoTrimestre[indice] = $(this).text(); indice++; });
		  
		  
		  indice=0;
		  var filasIds = $('#tabla select[name="estadosMarzo"]').each(function(){ idsEstadosMarzo[indice] = $(this).val(); indice++; });
		  indice=0;
		  var filasIds = $('#tabla select[name="estadosJulio"]').each(function(){ idsEstadosJulio[indice] = $(this).val(); indice++; });
		  indice=0;
		  var filasIds = $('#tabla select[name="estadosDiciembre"]').each(function(){ idsEstadosDiciembre[indice] = $(this).val(); indice++; });
		  indice=0;
		  var filasIds = $('#tabla select[name="estadosMesaAdicional"]').each(function(){ idsEstadosMesaAdicional[indice] = $(this).val(); indice++; });
		  indice=0;
		  var filasIds = $('#tabla select[name="estadosComentarios"]').each(function(){ idsEstadosComentarios[indice] = $(this).val(); indice++; });
		  
		  indice=0;
		  var filasNotas = $('#tabla input[name="notasJulio"]').each(function(){ notasPrimerTrimestre[indice] = $(this).val(); indice++; });
		  indice=0;
		  var filasNotas = $('#tabla input[name="notasDiciembre"]').each(function(){ notasSegundoTrimestre[indice] = $(this).val(); indice++; });
		  indice=0;
		  var filasNotas = $('#tabla input[name="notasMarzo"]').each(function(){ notasTercerTrimestre[indice] = $(this).val(); indice++; });
		  indice=0;
		  var filasNotas = $('#tabla input[name="notasMesaAdicional"]').each(function(){ notasCuartoTrimestre[indice] = $(this).val(); indice++; });		
		  indice=0;
		  var filasNotas = $('#tabla input[name="notasComentarios"]').each(function(){ notasQuintoTrimestre[indice] = $(this).val(); indice++; });
		  
		if(action = 'ids')
		{
			document.forms['altaNotaPrevia'].action = "../entrevistas/registrarDatosNotaPrevia.do";
				
		}
		
		document.forms['altaNotaPrevia'].idAlumno.value = id;
		document.forms['altaNotaPrevia'].idsJulio.value = idsPrimerTrimestre;
		document.forms['altaNotaPrevia'].idsDiciembre.value = idsSegundoTrimestre;
		document.forms['altaNotaPrevia'].idsMarzo.value = idsTercerTrimestre;
		
		document.forms['altaNotaPrevia'].idsMesaAdicional.value = idsCuartoTrimestre;
		document.forms['altaNotaPrevia'].idsComentarios.value = idsQuintoTrimestre;
		
		document.forms['altaNotaPrevia'].notasJulio.value = notasPrimerTrimestre;
		document.forms['altaNotaPrevia'].notasDiciembre.value = notasSegundoTrimestre;
		document.forms['altaNotaPrevia'].notasMarzo.value = notasTercerTrimestre;
		document.forms['altaNotaPrevia'].notasMesaAdicional.value = notasCuartoTrimestre;
		document.forms['altaNotaPrevia'].notasComentarios.value = notasQuintoTrimestre;
		
		document.forms['altaNotaPrevia'].idsEstadoMarzo.value = idsEstadosMarzo;
		document.forms['altaNotaPrevia'].idsEstadoJulio.value = idsEstadosJulio;
		document.forms['altaNotaPrevia'].idsEstadoDiciembre.value = idsEstadosDiciembre;
		document.forms['altaNotaPrevia'].idsEstadoMesaAdicional.value = idsEstadosMesaAdicional;
		document.forms['altaNotaPrevia'].idsEstadoComentarios.value = idsEstadosComentarios;
		
		document.forms['altaNotaPrevia'].submit();

	}
</script>
</head>
<body>

<form id="altaNotaPrevia" action="<c:url value='/entrevistas/registrarDatosNotaPrevia.do' />" method="post">
<h1 id="titulo-informe-popup">Registro de Notas</h1>
<br></br>
	
			<h1>${trimestre.nombre}:</h1>
			<br></br>
		
			<c:if test="${!empty notaPreviasJulio}">
				
				<table id="tabla">
				<c:forEach var="notaMateria"  items="${notaPreviasJulio}">
					<tr>
						<td ><label>${notaMateria.materia.nombre}&nbsp;${notaMateria.ciclo}</label></td>
						<td name="idsJulio" style="visibility: hidden;" >${notaMateria.id}</td>
						<td >
				        	<input type="hidden" id="calificacion" name="notasJulio" value="15">
								
						</td>	
						
						<td >
							<select id="estado" name="estadosJulio">
								<c:forEach items="${estados}" var="estadoMateria">
									<c:if test="${estadoMateria.id == notaMateria.estado.id}">
										<option selected="selected" value="${estadoMateria.id}">${estadoMateria.valor}</option>
									</c:if>
									<c:if test="${estadoMateria.id != notaMateria.estado.id}">
										<option value="${estadoMateria.id}">${estadoMateria.valor}</option>
									</c:if>										
								</c:forEach>
							</select>
						</td>
													
						
					</tr>
				</c:forEach>
				</table>
				
			</c:if>
			<c:if test="${!empty notaPreviasDiciembre}">
				<table id="tabla">
				<c:forEach var="notaMateria" items="${notaPreviasDiciembre}">
				
					<tr>
						<td ><label>${notaMateria.materia.nombre}&nbsp;${notaMateria.ciclo}</label></td>
						<td name="idsDiciembre" style="visibility: hidden;" >${notaMateria.id}</td>
						<td >				        	
							<input type="hidden" id="calificacion" name="notasDiciembre" value="15">
						
						</td>
						<td >
							<select id="estado" name="estadosDiciembre">
								<c:forEach items="${estados}" var="estadoMateria">
									<c:if test="${estadoMateria.id == notaMateria.estado.id}">
										<option selected="selected" value="${estadoMateria.id}">${estadoMateria.valor}</option>
									</c:if>
									<c:if test="${estadoMateria.id != notaMateria.estado.id}">
										<option value="${estadoMateria.id}">${estadoMateria.valor}</option>
									</c:if>										
								</c:forEach>
							</select>
						</td>

					</tr>				
				</c:forEach>
				</table>
			</c:if>
			<c:if test="${!empty notaPreviasMarzo}">
				<table id="tabla">
				<c:forEach var="notaMateria" items="${notaPreviasMarzo}">
					<tr>
						<td ><label>${notaMateria.materia.nombre}&nbsp;${notaMateria.ciclo}</label></td>
						<td name="idsMarzo" style="visibility: hidden;" >${notaMateria.id}</td>
						<td>				        	
							<input type="hidden" id="calificacion" name="notasMarzo" value="15">
						
						</td>
						<td>
							<select id="estado" name="estadosMarzo">
								<c:forEach items="${estados}" var="estadoMateria">
									<c:if test="${estadoMateria.id == notaMateria.estado.id}">
										<option selected="selected" value="${estadoMateria.id}">${estadoMateria.valor}</option>
									</c:if>
									<c:if test="${estadoMateria.id != notaMateria.estado.id}">
										<option value="${estadoMateria.id}">${estadoMateria.valor}</option>
									</c:if>										
								</c:forEach>
							</select>
						</td>
						
					</tr>				
				</c:forEach>
				</table>
			</c:if>
			
			
			<!-- PONER NUEVAMENTE TODO ESTO CUANDO HAYAN CARGADO TODOS LOS BOLETINES 2017
			
			<c:if test="${!empty notaPreviasMesaAdicional}">
				<table id="tabla">
				<c:forEach var="notaMateria" items="${notaPreviasMesaAdicional}">
					<tr>
						<td ><label>${notaMateria.materia.nombre}&nbsp;${notaMateria.ciclo}</label></td>
						<td name="idsMesaAdicional" style="visibility: hidden;" >${notaMateria.id}</td>
						<td >				        	
						<select id="calificacion" name="notasMesaAdicional">
								<c:forEach var="calif" items="${calificaciones}">
									<c:if test="${calif.id == notaMateria.calificacion.id}">
										<option selected="selected" value="${calif.id}">${calif.valor}</option>
									</c:if>
									<c:if test="${calif.id != notaMateria.calificacion.id}">
										<option value="${calif.id}">${calif.valor}</option>
									</c:if>					
								</c:forEach>
							</select>
						</td>
						<td>
							<select id="estado" name="estadosMesaAdicional">
								<c:forEach items="${estados}" var="estadoMateria">
									<c:if test="${estadoMateria.id == notaMateria.estado.id}">
										<option selected="selected" value="${estadoMateria.id}">${estadoMateria.valor}</option>
									</c:if>
									<c:if test="${estadoMateria.id != notaMateria.estado.id}">
										<option value="${estadoMateria.id}">${estadoMateria.valor}</option>
									</c:if>										
								</c:forEach>
							</select>
						</td>
						
					</tr>				
				</c:forEach>
				</table>
			</c:if>
			
			
			<c:if test="${!empty notaPreviasComentarios}">
				<table id="tabla">
				<c:forEach var="notaMateria" items="${notaPreviasComentarios}">
					<tr>
						<td ><label>${notaMateria.materia.nombre}&nbsp;${notaMateria.ciclo}</label></td>
						<td name="idsComentarios" style="visibility: hidden;" >${notaMateria.id}</td>
						<td colspan="2">				        	
						<textarea cols="50" rows="7" id="estadosComentarios2" name="estadosComentarios2">${notaMateria.nota}</textarea>
						<select id="calificacion" name="notasComentarios" style="visibility:hidden">
							<c:forEach var="calif" items="${calificaciones}">
								<c:if test="${calif.id == notaMateria.calificacion.id}">
									<option selected="selected" value="${calif.id}">${calif.valor}</option>
								</c:if>
								<c:if test="${calif.id != notaMateria.calificacion.id}">
									<option value="${calif.id}">${calif.valor}</option>
								</c:if>					
							</c:forEach>
						</select>												
						<select id="estado" name="estadosComentarios" style="visibility:hidden">
							<c:forEach items="${estados}" var="estadoMateria">
								<c:if test="${estadoMateria.id == notaMateria.estado.id}">
									<option selected="selected" value="${estadoMateria.id}">${estadoMateria.valor}</option>
								</c:if>
								<c:if test="${estadoMateria.id != notaMateria.estado.id}">
									<option value="${estadoMateria.id}">${estadoMateria.valor}</option>
								</c:if>										
							</c:forEach>
						</select>														
						</td>						
					</tr>				
				</c:forEach>
				</table>
			</c:if>
	 		<-->
        <table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-botons-small">
          <tr>
            <td width="50" height="0" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="button" onclick="guardarNotas('ids', '${alumno.id}');"  value="Registrar" /></td>
			<td width="50" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
		       onclick="location.href='../entrevistas/modificarBoletinView.do?idAlumno=${alumno.id}'; return false;" /></td>
            <td width="292"  align="center" valign="middle">&nbsp;</td>
			<td>
				<input type="hidden" name="idAlumno" value="${alumno.id}"/>
				<input type="hidden" name="idsJulio" value="${idsPrimerTrimestre}"/>
				<input type="hidden" name="idsDiciembre" value="${idsSegundoTrimestre}"/>
				<input type="hidden" name="idsMarzo" value="${idsTercerTrimestre}"/>
				<input type="hidden" name="idsMesaAdicional" value="${idsCuartoTrimestre}"/>
				<input type="hidden" name="idsComentarios" value="${idsQuintoTrimestre}"/>
				
				<input type="hidden" name="notasJulio" value="${notasPrimerTrimestre}"/>
				<input type="hidden" name="notasDiciembre" value="${notasSegundoTrimestre}"/>
				<input type="hidden" name="notasMarzo" value="${notasTercerTrimestre}"/>
				<input type="hidden" name="notasMesaAdicional" value="${notasCuartoTrimestre}"/>
				<input type="hidden" name="notasComentarios" value="${notasQuintoTrimestre}"/>
				
				<input type="hidden" name="idsEstadoMarzo" value="${idsEstadosMarzo}"/>
				<input type="hidden" name="idsEstadoJulio" value="${idsEstadosJulio}"/>
				<input type="hidden" name="idsEstadoDiciembre" value="${idsEstadosDiciembre}"/>
				<input type="hidden" name="idsEstadoMesaAdicional" value="${idsEstadosMesaAdicional}"/>
				<input type="hidden" name="idsEstadoComentarios" value="${idsEstadosComentarios}"/>
			
		    </td>
		</tr>
		</table>      	
		
</form>

</body>
</html>