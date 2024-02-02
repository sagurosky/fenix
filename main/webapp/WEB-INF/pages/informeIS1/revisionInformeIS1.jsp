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
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#informeForm").validate({
   		invalidHandler: function(form, validator) {
		var errors = validator.numberOfInvalids();
		if (errors) {
			$.unblockUI();
		}
	}
});
 
});

function enviarForm(action){
	if(action == 'finalizar'){
		document.forms['informeForm'].action = "../informeIS1/actualizarInformeRevision.do?accion=" + action;
		$.blockUI();
		$('#informeForm').submit();
	}
	
}
</script>
<script type="text/javascript">
	function chequearLongitud(obj){
		if (obj.value.length > 10000) {
		obj.value = obj.value.substring(0, 10000);
		}
	}
</script>
<body>
<div id="main-content">
<form:form id="informeForm" commandName="informe" cssClass="cmxform"  modelAttribute="informe" action="" method="post">
<br>Estado del IS1: ${informe.estado.valor}<br>
<h1 id="titulo-informe">PROGRAMA DE FUTUROS EGRESADOS</h1>
<h1 id="titulo-informe">INFORME DE SEGUIMIENTO N° 1 - AÑO ${informe.cicloActual.nombre}</h1>
<h1 id="titulo-informe">${informe.becado.datosPersonales.nombre}&nbsp;${informe.becado.datosPersonales.apellido}</h1>
    <table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
		<tr>
			<td colspan="2"><h1 id="titulo-informe">Acerca del estudiante</h1></td>
		</tr>
		
					<tr>	
						<td nowrap="nowrap"><label>Localidad:</label></td>
						<td><label>${informe.becado.datosPersonales.localidad.nombre}</label></td>
					</tr>
					<tr>
						<td nowrap="nowrap"><label>Fecha de Nacimiento:</label></td>
						<td><label><fmt:formatDate value="${informe.becado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/></label></td>
					</tr>
					<tr>
						<td><label>Edad:</label></td>
						<td><label>${informe.edad}</label></td>
					</tr>
					<tr>	
						<td><label>Escuela:</label></td>
						<td><label>${informe.becado.escuela.nombre}</label>
						</td>
					</tr>	
					<tr>	
						<td nowrap="nowrap"><label>A&ntilde;o escolar que cursa:</label></td>
						<td><label>${informe.becado.anioEscolar.valor}</label></td>
					</tr>
					
					<tr>
						<td nowrap="nowrap"><label>Fecha estimada de egreso::</label></td>
						<td><label>${informe.anioEgreso}</label></td>						
					</tr>
					
					
					<c:if test="${!empty informe.becado.responsable2}">
						<tr>
							<td nowrap="nowrap"><label>Responsable Adulto:</label></td>						
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
							<td nowrap="nowrap"><label>Responsable Adulto:</label></td>						
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
						<td><label>Padrino:</label></td>
						<td><label>
							${informe.padrino.empresa.denominacion}			
							${informe.padrino.datosPersonales.nombre}&nbsp;${informe.padrino.datosPersonales.apellido}</label>
						</td>
					</tr> 
					
					<tr>
						<td nowrap="nowrap"><br><label>Información adicional del estudiante:</label></td>
					
						<td>					
							<textarea id="actividadesVacaciones" name="actividadesVacaciones"  rows=4 cols=100> ${informe.actividadesVacaciones}</textarea>
						</td>
					</tr>
					
					
					
					
					
					<tr>
						<td colspan="2"><h1 id="titulo-informe">Información Escolar</h1></td>
					</tr>
					
					
					<c:if test="${!empty informe.situacion}">
						<tr>
							<td nowrap="nowrap"><label>Situación escolar:</label></td>
							<td><label>${informe.situacion.valor}</label></td>
						</tr>
					</c:if>
					<c:if test="${!empty informe.becado.estadoRenovacion}">
						<tr>
							<td nowrap="nowrap"><label>Situación en el programa:</label></td>
							<td><label>${informe.er.evaluacionRenovacionMergeada.valor}</label></td>
						</tr>
					</c:if>
					
					<tr>
						<td nowrap="nowrap"><br><label>Detalle sobre la situación de renovación:</label></td>
					
						<td>					
							<textarea id="observacionesExcepcion" name="observacionesExcepcion"  rows=4 cols=100> ${informe.observacionesExcepcion}</textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><h1 id="titulo-informe">Acompañamiento</h1><br></td>
					</tr>
					<tr>
						<td nowrap="nowrap"><br><label>Propósito anual del acompañamiento:</label></td>	
						<td>					
							<textarea id="propositoAnioComienza" name="propositoAnioComienza"  rows=4 cols=100> ${informe.propositoAnioComienza}</textarea>
						</td>
					</tr>
					
					
							
				
    	
    			<tr>		
					<td colspan="2"><h1 id="titulo-informe">Información de la Escuela</h1></td>
				</tr>
				
				
				<tr>
					<td nowrap="nowrap"><label>Matrícula total:</label></td>
					<td><label>${informe.becado.escuela.matricula}</label></td>
					
				</tr>
				<tr>
					<td nowrap="nowrap"><label>Orientación:</label></td>
					<td><label>${informe.becado.escuela.orientacion}</label></td>
					
				</tr>
				<tr>
					<td nowrap="nowrap"><label>Descripción escuela:</label></td>
					<td><label>${informe.becado.escuela.observaciones}</label></td>
					
				</tr>
				<tr>
					<td nowrap="nowrap"><label>El Programa se implementa desde:</label></td>
					<td><label>${informe.becado.escuela.comienzoPBE.nombre}</label></td>
					
				</tr>
    	
		

									
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
<%-- 						<c:if test="${informe.fp.estado.valor == estadoInformeEnviado}"> --%>
							<td width="50" align="center" valign="middle">
								<input class="ui-state-default ui-corner-all " type="button" onclick="enviarForm('finalizar')" value="Finalizar" />
							</td>		  
							<td width="50" align="center" valign="middle">
								<input type="button" value="Volver" class="ui-state-default ui-corner-all" onclick="history.back();" />
							</td>
							<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
<%-- 						</c:if>
						<c:if test="${informe.fp.estado.valor != estadoInformeEnviado}">
							<td width="50" align="center" valign="middle">
							  	<center>
									<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="history.back();" />
								</center>
					       </td>
						</c:if> --%>
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