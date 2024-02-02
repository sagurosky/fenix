<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>entrevista seleccion</title>
</head>
<body>
ENTREVISTA DE SELECCION 
<table>
		<tr>
			<td>
			<label>Problemas de salud del becado?</label>
			Si<input type="radio" id="entrevistaSeleccion.saludBecado" name="entrevistaSeleccion.saludBecado" 
			  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludBecado}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="true"> 
			No<input type="radio" id="entrevistaSeleccion.saludBecado" name="entrevistaSeleccion.saludBecado"
			  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludBecado == false}"> checked="checked"</c:if> value="false">			
			</td>
		</tr>
		<tr>
			<td>
			<label>Cuales?</label>
				<form:textarea path="entrevistaSeleccion.saludBecadoCual" rows="4" cols="40" id="saludBecadoCual" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			
			</td>	
		</tr>
    		
</table>
<table>
		<tr>
			<td>
			<label>Problemas de salud Familiar?</label>
			Si<input type="radio" id="entrevistaSeleccion.saludFamilia" name="entrevistaSeleccion.saludFamilia" 
			  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludFamilia}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="true"> 
			No<input type="radio" id="entrevistaSeleccion.saludFamilia" name="entrevistaSeleccion.saludFamilia"
			  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludFamilia == false}"> checked="checked"</c:if> value="false">			
			</td>
		</tr>
		<tr>	
			<td>
			<label>Cuales?</label>
				<form:textarea path="entrevistaSeleccion.saludFamiliarCual" rows="4" cols="40" id="saludFamiliarCual" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			
			</td>	
		</tr>
    		
</table>
<br><br>

<br></br>
	<p><label>Información complementaria y evaluación</label>
		<form:textarea path="entrevistaSeleccion.observacionesGenerales" rows="4" cols="40" id="observacionesGenerales" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
	</p>
<br></br>
	<p><label>Uso del tiempo libre</label>
		<select name="tiempoLibre" id="tiempoLibre">
					<c:choose>
    					<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Salir con amigos'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos" selected="selected">Salir con amigos</option>															
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Escuchar música'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música" selected="selected">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>															
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Estar con la familia'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia" selected="selected">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>																
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Hacer actividades artísticas'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas" selected="selected">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>														
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Hacer deporte'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte" selected="selected">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>																
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Leer'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer" selected="selected">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>													
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Navegar en internet'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet" selected="selected">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>														
					    </c:when>
					    
					    <c:otherwise>						 									
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>	
					    </c:otherwise>
					</c:choose>
				</select>	
	</p>
		<br></br>
	<p><label>Cuando termine la secundaria me gustaría</label>
		<textarea rows="4" cols="40" id="cuandoTermine" name="cuandoTermine" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.cuandoTermine}</textarea>
	</p>
<br></br>
	<p><label>Vos mismo</label>		
		<textarea rows="4" cols="40" id="vosMismo" name="vosMismo" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.vosMismo}</textarea>
	</p>
	
<br></br>
	<p><label>Trabajás?</label>
		<textarea rows="4" cols="40" id="trabajas" name="trabajas" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.trabajas}</textarea>
	</p>
<br></br>
	<p><label>En Qué?</label>
		<textarea rows="4" cols="40" id="enQue" name="enQue" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.enQue}</textarea>
	</p>
<br></br>
	<p><label>Responsabilidad</label>
		<textarea rows="4" cols="40" id="responsabilidad" name="responsabilidad" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.responsabilidad}</textarea>
	</p>
<br></br>
	<p><label>Repetiste?</label>
		<textarea rows="4" cols="40" id="repetiste" name="repetiste" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.repetiste}</textarea>
	</p>
<br></br>
	<p><label>Por qué repetiste?</label>
		<textarea rows="4" cols="40" id="porQueRepetiste" name="porQueRepetiste" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.porQueRepetiste}</textarea>
	</p>				
<br></br>
	<p><label>Abandonaste?</label>
		<textarea rows="4" cols="40" id="abandonaste" name="abandonaste" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.abandonaste}</textarea>
	</p>
<br></br>
	<p><label>Por qué abandonaste?</label>
		<textarea rows="4" cols="40" id="porQueAbandonaste" name="porQueAbandonaste" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.porQueAbandonaste}</textarea>
	</p>		
<br></br>
	<p><label>Situación Escolar Año Pasado</label>
		<textarea rows="4" cols="40" id="situacionEscolarAnioPasado" name="situacionEscolarAnioPasado" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.situacionEscolarAnioPasado}</textarea>
	</p>
<br></br>
	<p><label>Previas</label>
		<textarea rows="4" cols="40" id="previas" name="previas" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.previas}</textarea>
	</p>
<br></br>
	<p><label>Cuáles Previas</label>
		<textarea rows="4" cols="40" id="cualesPrevias" name="cualesPrevias" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.cualesPrevias}</textarea>
	</p>	
<br></br>
	<p><label>Desempeño</label>
		<textarea rows="4" cols="40" id="desempenio" name="desempenio" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.desempenio}</textarea>
	</p>
<br></br>
	<p><label>Por qué desempeño?</label>
		<textarea rows="4" cols="40" id="porQueDesempenio" name=porQueDesempenio onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.porQueDesempenio}</textarea>
	</p>		
<br></br>
	<p><label>Faltas</label>
		<textarea rows="4" cols="40" id="faltas" name="faltas" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.faltas}</textarea>
	</p>	
<br></br>
	<p><label>Motivos de faltas</label>
		<textarea rows="4" cols="40" id="motivosFaltas" name="motivoFaltas" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.motivoFaltas}</textarea>
	</p>			
<br></br>
	<p><label>Materias Preferidas</label>
		<textarea rows="4" cols="40" id="materiasPreferidas" name="materiasPreferidas" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.materiasPreferidas}</textarea>	
		</p>	
<br></br>
	<p><label>Materias Cuestan</label>
		<textarea rows="4" cols="40" id="materiaCuesta" name="materiaCuesta" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.materiaCuesta}</textarea>
	</p>	
<br></br>
	<p><label>Comentario Adicional</label>
		<textarea rows="4" cols="40" id="comentarioAdicional" name="comentarioAdicional" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.comentarioAdicional}</textarea>
	</p>
<br></br>
	<p><label>Aportar PFE</label>
		<textarea rows="4" cols="40" id="aportarPFE" name="aportarPFE" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.aportarPFE}</textarea>
	</p>		
<br></br>
	<p><label>Cognitivo</label>
		<textarea rows="4" cols="40" id="cognitivo" name="cognitivo" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.cognitivo}</textarea>
	</p>
<br></br>
	<p><label>riesgo Extra Escolar</label>
		<textarea rows="4" cols="40" id="riesgoExtraEscolar" name="riesgoExtraEscolar" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.riesgoExtraEscolar}</textarea>
	</p>		
</body>
</html>