<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<label>MATERIAS QUE ME GUSTAN</label>
<table >
		<thead>
			<tr>
				<th align="left"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td >
					<p><label >Lengua</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaLengua" id="perfilAlumno.materiaLengua"
						<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaLengua}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td >
					<p><label >Matemática</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaMatem" id="perfilAlumno.materiaMatem"
						 <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaMatem}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td >
					<p><label >Ciencias Sociales</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaCiencSociales" id="perfilAlumno.materiaCiencSociales"
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaCiencSociales}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td >
					<p><label >Inglés / Lengua Extranjera</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaInglesLengExt" id="perfilAlumno.materiaInglesLengExt"
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaInglesLengExt}"> checked="checked"</c:if>>
				</td>
			</tr>
					<tr>
				<td >
					<p><label >Educación Física</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaEduFisica" id="perfilAlumno.materiaEduFisica"
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaEduFisica}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td >
					<p><label >Educación Artística</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaEduArt" id="perfilAlumno.materiaEduArt"
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaEduArt}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td >
					<p><label >Ciencias Naturales</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaCienciasNaturales" id="perfilAlumno.materiaCienciasNaturales"
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaCienciasNaturales}"> checked="checked"</c:if>>
				</td>
			</tr>
			
			
			
				
		</tbody>
	</table>
<label>MATERIAS QUE ME MAS ME CUESTAN</label>
<table >
		<thead>
			<tr>
				<th align="left"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td >
					<p><label >Lengua</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaLenguaC" id="perfilAlumno.materiaLenguaC"
						<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaLenguaC}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td >
					<p><label >Matemática</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaMatemC" id="perfilAlumno.materiaMatemC"
						 <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaMatemC}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td >
					<p><label >Ciencias Sociales</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaCiencSocialesC" id="perfilAlumno.materiaCiencSocialesC"
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaCiencSocialesC}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td >
					<p><label >Inglés / Lengua Extranjera</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaInglesLengExtC" id="perfilAlumno.materiaInglesLengExtC"
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaInglesLengExtC}"> checked="checked"</c:if>>
				</td>
			</tr>
					<tr>
				<td >
					<p><label >Educación Física</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaEduFisicaC" id="perfilAlumno.materiaEduFisicaC"
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaEduFisicaC}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td >
					<p><label >Educación Artística</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaEduArtC" id="perfilAlumno.materiaEduArtC"
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaEduArtC}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td >
					<p><label >Ciencias Naturales</label> 
					</p>
				</td>
				<td>
					<input type="checkbox" 	name="entrevistaSeleccion.materiaCienciasNaturalesC" id="perfilAlumno.materiaCienciasNaturalesC"
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaCienciasNaturalesC}"> checked="checked"</c:if>>
				</td>
			</tr>
			
			
			
				
		</tbody>
	</table>	