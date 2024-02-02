<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    	 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
function chequearDigitos(obj){
	if (obj.value != '1' && obj.value != '2' && obj.value != '3' && obj.value != '4' && obj.value != '5' && obj.value != '6'
		&& obj.value != '7' && obj.value != '8' && obj.value != '9' && obj.value != '10') {
		obj.value = '';
	}
}
</script>

<table>
			<thead>
				<tr>
					<th>Materias</th>
					
					<th>Nota Final</th>
					
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty entrevistaSeleccionDTO.entrevistaSeleccion.boletinSeleccions }">
						<c:forEach items="${listMaterias}" var="materia">
							<tr>
								<!-- cambiar a materia.nombre -->
								<td><input type="hidden" name="idMateria" value="${materia.id}">${materia.nombre}</td>
								<td><input type="hidden" name="notaPrimTrim" class="digits" size="10" maxlength="2" value="0">
								<input type="hidden" name="notaSegTrim" class="digits" size="10" maxlength="2" value="0">
								<input type="hidden" name="notaTerTrim" class="digits" size="10" maxlength="2" value="0">
								<input type="text" name="notaFinal" class="digits"  size="10" maxlength="2" onchange="chequearDigitos(this);">
								<input type="hidden" name="notaDiciembre" class="digits" size="10" maxlength="2" value="0">
								<input type="hidden" name="notaMarzo" class="digits" size="10" maxlength="2" value="0"></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach items="${entrevistaSeleccionDTO.entrevistaSeleccion.boletinSeleccions }" var="boletin">
							<tr>
								<td>
									<input type="hidden" name="idMateria" value="${boletin.materia.id}">${boletin.materia.nombre}
									<input type="hidden" name="idBoletinSeleccions" value="${boletin.id}"> 
								</td>
								<td><input type="hidden" name="notaPrimTrim" class="digits" value="${boletin.notaPrimTrim}" size="10" maxlength="2" onchange="chequearDigitos(this);">
								<input type="hidden" name="notaSegTrim" class="digits" value="${boletin.notaSegTrim}" size="10" maxlength="2" onchange="chequearDigitos(this);">
								<input type="hidden" name="notaTerTrim" class="digits" value="${boletin.notaTerTrim}" size="10" maxlength="2" onchange="chequearDigitos(this);">
								<input type="text" name="notaFinal" class="digits" value="${boletin.notaFinal}" size="10" maxlength="2" onchange="chequearDigitos(this);">
								<input type="hidden" name="notaDiciembre" class="digits" value="${boletin.notaDiciembre}" size="10" maxlength="2" onchange="chequearDigitos(this);">
								<input type="hidden" name="notaMarzo" class="digits" value="${boletin.notaMarzo}" size="10" maxlength="2" onchange="chequearDigitos(this);"></td>
							</tr>
						</c:forEach>	
					</c:otherwise>
				</c:choose>
				
		   </tbody>
</table>
<br><br>
<table>
	<tr><td><h1 align="left" id="titulo-informe">Carga de Boletín</h1></td></tr>
				<tr>
					<td>Boletín cargado actualmente si querés podes cargar uno nuevo. Si ves el logo de Cimientos es porque aún no lo cargaste.</td>
				</tr>
				<tr>	
					
					<td>			
					<a href="../entrevistaSeleccion/mostrarImagen.do?dni=${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}" target="_blank"> <img src="../entrevistaSeleccion/mostrarImagen.do?dni=${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}" width="100px"></a></td>			
				</tr>
				<tr>
					<td><center>Subir boletín
					<input name="foto" id="foto" type="file" onchange="validarExtension()"></center></td>
					
				</tr>		
				<tr>
					<td colspan="2"><font color="red">El tamaño de la foto del boletín no debe superar los 100kb y la extension debe ser "jpg"</font></td>
				</tr>

</table>
<br></br>
<table>
	<tr>
		<td valign="top">
			<p><label>Materias Previas</label>
				<form:textarea path="entrevistaSeleccion.observacionesMaterias" rows="3" cols="40" id="observacionesMaterias" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</p>
		</td>
	</tr>	
</table>