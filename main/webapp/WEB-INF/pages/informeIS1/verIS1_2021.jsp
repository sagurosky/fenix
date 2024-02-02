<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>:: Informe de Seguimiento Nº 1 ::</title>
</head>

<body>
<div id="main-content">

<br><br>
<form:form id="informeForm" commandName="informe" cssClass="cmxform"  modelAttribute="informe">
 <c:if test="${informe.estado.valor != estadoInformeRevision}">
  	
		<label>
			<font color="red">Este Informe no puede ser modificado. De necesitar hacer algún cambio es preciso modificar<br> el estado de la entrevista 
			de renovación que lo generó. Para ello, contacte a un super usuario.</font>
		</label>
	
</c:if>
<c:if test="${informe.estado.valor == estadoInformeRevision}">
  	
		<label>
			<font color="red">Este Informe no puede ser modificado. Solo DI puede cambiar el estado del mismo.</font>
		</label>
	
</c:if>
<br>Estado del IS1: ${informe.estado.valor}<br>
<h1 id="titulo-informe">PROGRAMA DE FUTUROS EGRESADOS</h1>
<h1 id="titulo-informe">INFORME DE SEGUIMIENTO N° 1 - AÑO ${informe.cicloActual.nombre}</h1>
<h1 id="titulo-informe">${informe.becado.datosPersonales.nombre}&nbsp;${informe.becado.datosPersonales.apellido}</h1>		

		<table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
		<tr>
			<td colspan="2"><h1 id="titulo-informe">Datos del Alumno</h1></td>
		</tr>
		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
					<tr>
						<td><label>Fecha de Nacimiento:</label></td>
						<td><label><fmt:formatDate value="${informe.becado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/></label></td>
					</tr>
					<tr>
						<td><label>Edad:</label></td>
						<td><label>${informe.edad}</label></td>
					</tr>
					<tr>	
						<td><label>A&ntilde;o que cursa:</label></td>
						<td><label>${informe.becado.anioEscolar.valor}</label></td>
					</tr>
					<tr>		
						<td><label>Año adicional:</label></td>
						<td>
							<input type="checkbox" name="anioAdicional"
								<c:if test="${informe.becado.anioAdicional}"> checked="checked" </c:if> 
							id="anioAdicional"  disabled="true">
						</td>
					</tr>
					<tr>
						<td><label>A&ntilde;o estimado de egreso:</label></td>
						<td><label>${informe.anioEgreso}</label></td>						
					</tr>
					<tr>	
						<td><label>Localidad:</label></td>
						<td><label>${informe.becado.datosPersonales.localidad.nombre}</label></td>
					</tr>
					<tr>	
						<td><label>Escuela:</label></td>
						<td><label>${informe.becado.escuela.nombre}</label>
						</td>
					</tr>	
					<c:if test="${!empty informe.becado.responsable2}">
						<tr>
							<td><label>Responsable Adulto:</label></td>						
							<td><label>${informe.becado.responsable2.nombre },&nbsp;${informe.becado.responsable2.apellido}</label>					
						</tr>
						<c:if test="${!empty informe.becado.responsable2.idVinculo}">
							<tr>
								<td><label>V&iacute;nculo:</label></td>
								<td><label>${informe.becado.responsable2.idVinculo.valor}</label></td>
							</tr>
						</c:if>
					</c:if>
					<c:if test="${empty informe.becado.responsable2}">
						<tr>
							<td><label>Responsable Adulto:</label></td>						
							<td><label>${informe.becado.responsable1.nombre },&nbsp;${informe.becado.responsable1.apellido}</label>					
						</tr>
						<c:if test="${!empty informe.becado.responsable1.idVinculo}">
							<tr>
								<td><label>V&iacute;nculo:</label></td>
								<td><label>${informe.becado.responsable1.idVinculo.valor}</label></td>
							</tr>
						</c:if>
					</c:if>
					<tr>	
						<td><label>Fecha Incorporación al Programa:</label></td>
						<td><label>
						${informe.fechaPBE}</label>
							
						</td>
					</tr>
					<tr>	
						<td><label>Padrino:</label></td>
						<td><label>
							${informe.padrino.empresa.denominacion}			
							${informe.padrino.datosPersonales.nombre}&nbsp;${informe.padrino.datosPersonales.apellido}</label>
						</td>
					</tr> 
					
					<tr>
						<td colspan="2"><h1 id="titulo-informe">Situación Escolar</h1></td>
					</tr>
					
					
					<c:if test="${!empty informe.situacion}">
						<tr>
							<td><label>Situación escolar:</label></td>
							<td><label>${informe.situacion.valor}</label></td>
						</tr>
					</c:if>
					<c:if test="${!empty informe.becado.estadoRenovacion}">
						<tr>
							<td><label>Situación en el programa:</label></td>
							<td><label>${informe.er.evaluacionRenovacionMergeada.valor}</label></td>
						</tr>
					</c:if>		
				</table>
			</td>
		</tr>   	
    	
    			
		<c:if test="${!empty informe.boletinAnioAnterior}">
			<tr>
				<td colspan="2"><h1 id="titulo-informe">Bolet&iacute;n de calificaciones a&ntilde;o anterior</h1></td>
			</tr>
			<tr>			
			<td colspan="2">
				<table>	
					<tr>
						<td>
							<label>
								Recuerda que las materias y/o asistencias, días hábiles que contengan en todos los trimestres los valores "No aplica" y/o "No existe" y/o "Sin dato", no serán agregados al PDF para el padrino.
							</label>
						</td>
					</tr>
				</table>
				<jsp:include page="/WEB-INF/pages/informes/boletinView.jsp"></jsp:include>
			</td>
			</tr>			
		</c:if>
		
		<c:if test="${!empty informe.boletinAnioAnterior.materiasPrevias}">			
			<tr>			
				<td colspan="2">
					<jsp:include page="/WEB-INF/pages/informes/previasView.jsp"></jsp:include>
				</td>
			</tr>			
		</c:if>		



		<tr>
					<td><label><br>Información acerca de la escuela:</label>
				</tr>
				<tr>
				
					<td>${informe.becado.escuela.observaciones}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><label>Espacios de apoyo a la escolaridad con los que cuenta la escuela: :</label></td>													
				</tr>
				<tr>
					<td>
						<form:select path="espacioApoyo" disabled="true">
						<form:options items="${informe.becado.escuela.espacioApoyo}" itemLabel="valor" itemValue="id"/>				
						</form:select>
					</td>	
				</tr>
		
		

      	<c:if test="${!empty informe.propositoAnioComienza}">      				
			<tr>
				<td><br><label>Propósito anual del Alumno:</label></td>
			</tr>
			<tr>
				<td>					
					${informe.propositoAnioComienza}
				</td>
			</tr>
		</c:if>		
		
		
		<c:if test="${!empty informe.hsTrabajarAño}">      				
			<tr>
				<td><br><label>Habilidades para trabajar durante el año:</label></td>
			</tr>
			<tr>
				<td>					
					${informe.hsTrabajarAño}
				</td>
			</tr>
		</c:if>	

		
		<c:if test="${!empty informe.actividadesVacaciones}">
			<tr>
				<td ><br><label>Un dato curioso del estudiante</label></td>
			</tr>
			<tr>
				<td >					
					${informe.actividadesVacaciones}
				</td>
			</tr>
		</c:if>
									
		<tr>
      	    
       	    <td colspan="2"><br><br>Aviso: el contenido de este informe es confidencial y no podrá ser reproducido de ninguna forma sin previa autorización por parte de Cimientos</td>
      	</tr>
      	<tr>      	    
       	    <td></td>
       	    <td nowrap="nowrap">
       	    	${informe.eaPerfil.datosPersonales.nombre} ${informe.eaPerfil.datosPersonales.apellido}
       	    <br>Encargado de Acompañamiento<br>Programa Futuros Egresados - Cimientos</td>
      	</tr>
      	
     	
      	<tr>
 	       <td colspan="2">
				<table width="900" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
 	       			<tr>
					  <td width="50" align="center" valign="middle">
					  	<center>
							<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="history.back();" />
						</center>
				       </td>
 	       			</tr>
 	       		</table>			
	       </td>
	   </tr>
	</table>
	<input type="hidden" name="id" value="${informe.id}"></input>
	<input type="hidden" name="er.id" value="${informe.er.id}"></input>
	<input type="hidden" name="eaPerfil.idPerfilEA" value="${informe.eaPerfil.idPerfilEA}"></input>
	<input type="hidden" name="estado" value="${informe.estado}"></input>
	<input type="hidden" name="padrino.id" value="${informe.padrino.id}"></input>
	<input type="hidden" name="becado.id" value="${informe.becado.id}"></input>	
	<input type="hidden" name="urlInforme" value="${urlInforme}"></input>
	<input type="hidden" name="edad" value="${informe.edad}"></input>
	<input type="hidden" name="nombre" value="${informe.nombre}"></input>
	<c:if test="${informe.boletinAnioAnterior != null}">
		<input type="hidden" name="boletinAnioAnterior.id" value="${informe.boletinAnioAnterior.id}"></input>
	</c:if>
</form:form>
</div>
</body>
</html>