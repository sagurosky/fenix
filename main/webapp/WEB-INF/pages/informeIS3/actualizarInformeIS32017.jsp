<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="mif" uri="/list-operator.tld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Modificación de Informe de Seguimiento Nro 3</title>
		<style>
	 			span{ background-color: yellow; }
		</style>		

		<style type="text/css">
			.ui-dropdownchecklist-text {
				font-size: 11px;
			}
			.errormsg {
				font-weight: bold; COLOR: red;
			}
		</style>
		<script type="text/javascript" src="<c:url value="/static/js/ui.dropdownchecklist.js"/>"></script>
		<script type="text/javascript" src="<c:url  value="/static/js/funcionesIS3.js"/>"></script>
		<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
		<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
		<script type="text/javascript" src="<c:url  value="/static/js/validador.js"/>"></script>			
		<script type="text/javascript">
			var estadoEntrevistaFinal = '3';		
			$(document).ready(function(){	
				$("#idMateriaInteres").dropdownchecklist({icon: {}, 
					width: 250, 
					maxDropHeight: 250,
					emptyText: "Seleccione al menos 1 opción ...",
					onComplete: function(selector) {
						var accion = document.forms['actualizarInformeIS3'].accion.value;
						var checkCount = 0;
						var values = "";
						for( i=0; i < selector.options.length; i++ ) {					        
							if ( selector.options[i].selected&& (selector.options[i].value != "")){
								checkCount += 1;	
								if ( values != "" )
									values += ",";
								values += selector.options[i].value;
							}
						}
						document.forms['actualizarInformeIS3'].materiasInteres.value = values;
						if(accion == ""){
							if(checkCount == 0)
								jConfirm('Como mínimo debes seleccionar 1 materia de interés', 'Aviso');
							else{
								if ( checkCount > 3 ) 
									jConfirm('Como máximo podés seleccionar 3 materias de interés', 'Aviso');	
							}
						}
					},
					onItemClick: function(checkbox){		
						var checkChequed = checkbox.attr("checked");	
						var check = (checkChequed) ? 1 : -1;
						var cantidad =  document.forms['actualizarInformeIS3'].cantMateriasInteres.value;
						var checkCount = parseInt(cantidad) + parseInt(check);	
						if ( checkCount > 3 ) {
							jConfirm('Como máximo podés seleccionar 3 materias de interés', 'Aviso');		
							throw rejected;
						}	
					   document.forms['actualizarInformeIS3'].cantMateriasInteres.value = checkCount;
					}
				});
				$("#idMateriaCuestan").dropdownchecklist({icon: {}, 
					width: 250, 
					maxDropHeight: 250,
					emptyText: "Seleccione al menos 1 opción ...",
					onComplete: function(selector) {
						var accion = document.forms['actualizarInformeIS3'].accion.value;			
						var checkCount = 0;
						var values = "";
						for( i=0; i < selector.options.length; i++ ) {					        
							if ( selector.options[i].selected&& (selector.options[i].value != "")){
								checkCount += 1;	
								if ( values != "" )
									values += ",";
								values += selector.options[i].value;
							}
						}
						document.forms['actualizarInformeIS3'].materiasCuestan.value = values;
						if(accion == ""){
							if(checkCount == 0)
								jConfirm('Como mínimo debes seleccionar 1 materia que le cuesta', 'Aviso');
							else{
								if ( checkCount > 3 ) 
									jConfirm('Como máximo podés seleccionar 3 materias que le cuestan', 'Aviso');	
							}
						}
					},
					onItemClick: function(checkbox){
						var checkChequed = checkbox.attr("checked");	
						var check = (checkChequed) ? 1 : -1;
						var cantidad =  document.forms['actualizarInformeIS3'].cantMateriasCuestan.value;
						var checkCount = parseInt(cantidad) + parseInt(check);	
						if ( checkCount > 3 ) {
							jConfirm('Como máximo podes seleccionar 3 materias que le cuestan', 'Aviso');		    	
							throw rejected;
						}	
					   document.forms['actualizarInformeIS3'].cantMateriasCuestan.value = checkCount; 		   
					}
				});
				
				$("#actualizarInformeIS3").validate({
					errorClass: 'errormsg',
					rules: {
						actividadAcompanamiento : {
							required:true
						},
						materiasCuestan: {
							required:true
						},
						materiasInteres: {
							required:true
						},
						idDetalleGastos: {
							required:true
						}			
					},
					messages: {							
						actividadAcompanamiento : {
							required:'Este campo es requerido'
						},	
						idDetalleGastos : {
							required:'Este campo es requerido'
						}		
					},	
					invalidHandler: function(form, validator) {
						var errors = validator.numberOfInvalids();
						if (errors) {
							$.unblockUI();
						}
					}
				});
		 
			});
	
			function setearMateriasSeleccionadas(selector, campo1, campo2){
				var checkCount = 0;
				var values = "";
				var valorCampo2 = parseInt(campo2.value);
				if(valorCampo2 != parseInt(0)){
					values = selector.val();
				}
				campo1.value = values;
			};
			
			function enviarForm(action, idIS3, idBecado){
				document.forms['actualizarInformeIS3'].accion.value = action;
				setearMateriasSeleccionadas($("#idMateriaInteres"), document.forms['actualizarInformeIS3'].materiasInteres, document.forms['actualizarInformeIS3'].cantMateriasInteres);
				setearMateriasSeleccionadas($("#idMateriaCuestan"), document.forms['actualizarInformeIS3'].materiasCuestan, document.forms['actualizarInformeIS3'].cantMateriasCuestan);
				if(action == 'guardar'){
					if(document.getElementById("estadoEntrevista").value == estadoEntrevistaFinal){
						if (document.getElementById("evalRenovacionBeca").value == "" ) { 
						  jAlert('warning', 'El informe no se puede Finalizar hasta que no se apruebe la entrevista Final', 'Atención!');
						}else{
							document.forms['actualizarInformeIS3'].action = "../informeIS3/finalizar.do";								
							$.blockUI();
							document.forms['actualizarInformeIS3'].accion.value = "";
							$('#actualizarInformeIS3').submit();
					  }
					}else{
						jAlert('warning', 'El informe no se puede Finalizar hasta que no se apruebe la entrevista Final', 'Atención!');
					}					
				}
				if(action == 'revisar'){ 		
					document.forms['actualizarInformeIS3'].action ="../informeIS3/modificarIS3.do";	
					$.blockUI();
					document.forms['actualizarInformeIS3'].submit();
				}	
				document.forms['actualizarInformeIS3'].idAlumno.value = idBecado;
				document.forms['actualizarInformeIS3'].idInformeIS3.value = idIS3;
			
			}
		</script>			
	</head>
	
	<body>
		<div id="main-content">
			<form id="actualizarInformeIS3" class="cmxform" action="" method="post">
				<h1 id="titulo-informe">:: Informe de Seguimiento Nº 3 ::</h1>
					<c:set var="urlRegreso" value="${urlRegreso}"></c:set>
  				<input type="hidden" id="estadoEntrevista" name="estadoEntrevista" value="${estadoEntrevista}"></input>
				<input type="hidden" id="evalRenovacionBeca" name="evalRenovacionBeca" value="${evalRenovacionBeca}"></input>
				<table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
					<tr>
						<td colspan="2">
							<label>${informe.estado.valor}</label>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<label>Ciclo lectivo</label>
							<label>${informe.cicloActual.nombre}</label>
						</td>
					</tr> 
					<tr>
						<td colspan="2">
							<h1 id="subtitulo-informe">Mis datos</h1>
						</td>
					</tr>
					<tr>
						<td>
							<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">		
								<tr>
									<td colspan="2">
										${becado.datosPersonales.nombre}&nbsp;${becado.datosPersonales.apellido}
									</td>
								</tr>		
								<c:if test="${tieneFoto == true}">
									<tr>				
										<td colspan="2">
											<img src="../fichaAlumno/mostrarImagen.do?dni=${becado.datosPersonales.dni}" width="100px">
										</td>
									</tr>
								</c:if>
								<c:if test="${tieneFoto == false}">			
									<tr>
										<td colspan="2">
											<img src="../fichaAlumno/mostrarImagen.do?dni=0" width="100px">
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<label>
												Recuerda que si no cargaste una foto, ésta es la que se enviará en el Informe al padrino.<img src="../static/images/atencion.gif" width=10>
											</label>
										</td>
									</tr>	
								</c:if>	
								<tr>
									<td colspan="2"> 
										Nací el: <fmt:formatDate value="${becado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										Tengo: ${edad} años
									</td>
								</tr>
								<tr>	
									<td colspan="2">
										Vivo en: ${becado.datosPersonales.localidad.nombre}
									</td>
								</tr>
								<tr>	
									<td>
										Mi escuela es: ${informe.becado.escuela.nombre}
									</td>
								</tr>
								<tr>	
									<td colspan="2">
										Curso: 
										<c:if test="${empty boletin}">
											${becado.anioEscolar.valor}
										</c:if>
										<c:if test="${!empty boletin}">
											${boletin.ano.valor}
										</c:if>
								</tr>		
								<c:if test="${!empty becado.responsable2}">
									<tr>
										<td colspan="2">
											Viene a las entrevistas:					
											${becado.responsable2.nombre }&nbsp;${becado.responsable2.apellido}
										</td>				
									</tr>
									<c:if test="${!empty becado.responsable2.idVinculo}">
										<tr>
											<td colspan="2">
												V&iacute;nculo: 
												${becado.responsable2.idVinculo.valor}
											</td>
										</tr>
									</c:if>
								</c:if>
								<c:if test="${empty becado.responsable2}">
									<tr>
										<td colspan="2">
											Viene a las entrevistas:				
											${becado.responsable1.nombre }&nbsp;${becado.responsable1.apellido}
										</td>					
									</tr>
									<c:if test="${!empty becado.responsable1.idVinculo}">
										<tr>
											<td colspan="2">
												V&iacute;nculo: 
												${becado.responsable1.idVinculo.valor}
											</td>
										</tr>
									</c:if>
								</c:if>
								<tr>
									<td colspan="2">
										Fecha incorporación al Programa: 
										${periodoFechaPBE}
									</td>
								</tr>	
								<c:if test="${!empty periodoFechaReincorporacionPBE}">
									<tr>
										<td colspan="2">
											Fecha reincorporación al Programa 
											${periodoFechaReincorporacionPBE}
										</td>
									</tr>
								</c:if>	
							</table>
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><h1 id="subtitulo-informe"><label>En el acompañamiento trabajamos ....</label></h1></td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea cols="60" rows="5"  class="required" name="actividadAcompanamiento" 
								onblur="eliminarEnter(this);chequearLongitudTextarea(this,1500);" 
								onkeypress="textareaSinEnter(event.keyCode,this);chequearLongitudTextarea(this,1500);"
								onkeyup="textareaSinEnter(event.keyCode,this);chequearLongitudTextarea(this,1500);">${actividadAcompanamiento}</textarea>					
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label>
								Debido al cambio de formato del IS3 la cantidad máxima de caracteres que podrás escribir en este campo es 1500.
							</label>
						</td>
					</tr>					

					<tr> 
						<td colspan="2"><h1 id="subtitulo-informe"><label>La beca la usé para ....</label></h1></td>
					</tr> 
					<tr>
						<td>
							<select name="idDetalleGastos" id="detallesGastos" multiple="multiple" size="6" style="color:#333; border:1px solid #666;font-family:Arial, Helvetica, sans-serif;">
								<c:forEach var="gasto" items="${listaDetalleGastos}">
									<c:choose>
										<c:when test="${mif:contiene(idDetalleGastos, gasto.id)}">
											<option selected="selected" id="detalleGasto" value="${gasto.id}">${gasto.valor}</option>
										</c:when>
										<c:otherwise>
											<option id="detalleGasto" value="${gasto.id}">${gasto.valor}</option>
										</c:otherwise>	
									</c:choose>							
								</c:forEach>
							</select>
						</td>
					</tr>

					<c:choose>
						<c:when test="${estadoEntrevista != '3' && tieneSuspensiones == false}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Tuve suspensión de beca</label></h1></td>
							</tr>
							<tr>
								<td>
									<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
										<tr>
											<td width="50">
												Cantidad:
											</td>
											<td>
												${informe.suspensionesCantidad}
											</td>
										</tr>
										<tr>
											<td>
												Mes/es:
											</td>
											<td>
												${informe.suspensionesPeriodo}
											</td>
										</tr>
										<tr>
											<td>
												Motivo/s:
											</td>
											<td width="800">
												${informe.suspensiones}
											</td>
										</tr>			
									</table>
								</td>
							</tr>						
						</c:when>											
						<c:when test="${estadoEntrevista == '3' && tieneSuspensiones == true}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Tuve suspensión de beca</label></h1></td>
							</tr>
							<tr>
								<td>
									<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
										<tr>
											<td width="50">
												Cantidad:
											</td>
											<td>
												${informe.suspensionesCantidad}
											</td>
										</tr>
										<tr>
											<td>
												Mes/es:
											</td>
											<td>
												${informe.suspensionesPeriodo}
											</td>
										</tr>
										<tr>
											<td>
												Motivo/s:
											</td>
											<td width="800">
												${informe.suspensiones}
											</td>
										</tr>			
									</table>
								</td>
							</tr>						
						</c:when>						
					</c:choose>									
							
					<tr>
						<td colspan="2"><h1 id="subtitulo-informe"><label>Mis preferencias</label></h1></td>
					</tr>
					<tr>
						<td>
							<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
								<tr>
									<td nowrap="nowrap">Materias que me interesan:</td>
									<td>
										<select id="idMateriaInteres" name="idMateriaInteres" multiple="multiple" style="width:100px; ">								
											<c:forEach var="materia" items="${listMateriasInteres}">
												<c:choose>
												<c:when test="${mif:contiene(idMateriaInteres, materia.id)}">
													<option selected="selected" id="materiaInteres" value="${materia.id}">${materia.nombre}</option>
												</c:when>
												<c:otherwise>
													<option id="materiaInteres" value="${materia.id}">${materia.nombre}</option>
												</c:otherwise>	
												</c:choose>	
											</c:forEach>
										</select>
									</td>
									<td nowrap="nowrap">Materias que me cuestan:</td>
									<td>
										<select id="idMateriaCuestan" name="idMateriaCuestan" multiple="multiple" style="width:150px; ">								
											<c:forEach var="materia" items="${listMateriasCuestan}">
												<c:choose>
												<c:when test="${mif:contiene(idMateriaCuestan, materia.id)}">
													<option selected="selected" id="materiaCuesta" value="${materia.id}">${materia.nombre}</option>
												</c:when>
												<c:otherwise>
													<option id="materiaCuesta" value="${materia.id}">${materia.nombre}</option>
												</c:otherwise>	
												</c:choose>	
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="hidden" class="required" name="materiasInteres" value="${materiasInteres}"></input>
										<input type="hidden" name="cantMateriasInteres" value="${cantMateriasInteres}"></input>
									</td>					
									<td colspan="2">
										<input type="hidden" class="required" name="materiasCuestan" value="${materiasCuestan}"></input>
										<input type="hidden" name="cantMateriasCuestan" value="${cantMateriasCuestan}"></input>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
								<tr>
									<td width="200px">Cantidad materias desaprobadas:</td>
									<td>
										<input type="text" class="required"  size="5" maxlength="2" onkeypress="return soloNumeros(this.event);" name="cantMateriasDesaprobadas"
											value="${cantMateriasDesaprobadas}"/>
									</td>
								</tr>
								<tr>
									<td>Cantidad inasistencias a la escuela:</td>
									<td>
										<input type="text" class="required" size="5" maxlength="5" onkeypress="return validarDecimal(event, this);" name="cantInasistencias"
											value="${cantInasistencias}"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					
					<!--tr>
						<td colspan="2"><h1 id="subtitulo-informe"><label>Mensaje al padrino</label></h1></td>
					</tr>
					<tr>
						<td>
							<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
								<tr>
									<td nowrap="nowrap">Querido padrino:</td>
									<td>
										<textarea cols="50" rows="5"  class="required" name="mensajePadrino" onblur="eliminarEnter(this);chequearLongitudTextarea(this,450);" 
											onkeypress="textareaSinEnter(event.keyCode,this);chequearLongitudTextarea(this,450);"
											onkeyup="textareaSinEnter(event.keyCode,this);chequearLongitudTextarea(this,450);">${mensajePadrino}</textarea>
									</td>
								</tr>
							</table>
						</td>
					</tr-->
					<!--tr>
						<td colspan="2">
							<label>
								Debido al cambio de formato del IS3 la cantidad máxima de caracteres que podrás escribir en este campo es 450.
							</label>
						</td>
					</tr-->
						
					<tr>
						<td colspan="2">
							<input type="hidden" name="mensajePadrino" id="mensajePadrino" value="">
							<h1 id="subtitulo-informe"><label>Resultado Año Escolar</label></h1>
						</td>
					</tr>
					<tr>
						<td colspan="2" width="860">
							${informe.situacionRenovacion}
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><h1 id="subtitulo-informe"><label>Situación renovación</label></h1></td>
					</tr>
					<tr>
						<td colspan="2">
							${informe.evalRenovacionBeca}
						</td>
					</tr>					
					
					<c:choose>
						<c:when test="${estadoEntrevista == '3' && evalRenovacionBeca == 'Fin participación PFE'}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Proyección año próximo</label></h1></td>
							</tr>
							<tr>
								<td colspan="2">
									${informe.proyAnioProximo}
								</td>
							</tr>							
						</c:when>
						<c:when test="${estadoEntrevista != '3' && evalRenovacionBeca == 'Fin participación PFE'}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Proyección año próximo</label></h1></td>
							</tr>							
							<tr>
								<td colspan="2">
									${informe.proyAnioProximo}
								</td>
							</tr>			
						</c:when>
					</c:choose>
					
					<c:choose>
						<c:when test="${estadoEntrevista == '3' && evalRenovacionBeca == 'No renueva'}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Motivo no renovación</label></h1></td>
							</tr>
							<tr>
								<td colspan="2">
									${informe.motivoNoRenovacion}
								</td>
							</tr>							
						</c:when>
						<c:when test="${estadoEntrevista != '3' && evalRenovacionBeca == 'No renueva'}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Motivo no renovación</label></h1></td>
							</tr>							
							<tr>
								<td colspan="2">
									${informe.motivoNoRenovacion}
								</td>
							</tr>			
						</c:when>						
					</c:choose>
		
					<tr>
			      	    <td>&nbsp;</td>
			       	    <td>&nbsp;</td>
			      	</tr>
			     	<tr>
			        	<td>&nbsp;</td>
			    	    <td>&nbsp;</td>
			    	</tr>
			    	
					<tr>
	  					<td colspan="2">
	  				 		<table width="900" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
	      						<tr>
				      				<c:if test="${valorPerfil == 'superUsuario' && informe.estado.valor == estadoConstruccion}">
				              			<td width="50" height="0" align="center" valign="middle">
					  	  					<input class="ui-state-default ui-corner-all " onclick="enviarForm('revisar','${idInformeIS3}','${becado.id}')" type="button" value="Guardar" />
					  	  				</td>	
					  	  				<td width="50" height="0" align="center" valign="middle">
							  	  			<input class="ui-state-default ui-corner-all " onclick="enviarForm('guardar','${idInformeIS3}','${becado.id}')" type="button" value="Finalizar"/>
							  	  		</td>
						  	  		</c:if>
						  	  		<c:if test="${valorPerfil == 'superUsuario' && informe.estado.valor == estadoFinalizado}">
							  	  		<td width="50" height="0" align="center" valign="middle">
					  	  					<input class="ui-state-default ui-corner-all " onclick="enviarForm('revisar','${idInformeIS3}','${becado.id}')" type="button" value="Construcción" />
					  	  			</td>
							  	  		<td width="50" height="0" align="center" valign="middle">
							  	  			<input class="ui-state-default ui-corner-all " onclick="enviarForm('guardar','${idInformeIS3}','${becado.id}')" type="button" value="Guardar"/>
							  	  		</td>				  	  		
							  	  	</c:if>
						    		<c:if test="${valorPerfil != 'superUsuario'}">	 						
		       							<td width="50" height="0" align="center" valign="middle">											
											<input class="ui-state-default ui-corner-all " onclick="enviarForm('revisar','${idInformeIS3}','${becado.id}')" type="button" value="Construcción" />
										</td>
								      	<td width="50" height="0" align="center" valign="middle">
											<input class="ui-state-default ui-corner-all " onclick="enviarForm('guardar','${idInformeIS3}','${becado.id}')" type="button" value="Guardar"/>
								 		</td>	 		
								 	</c:if>  
									<td width="50" align="center" valign="middle">										
										<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="history.back();" />								
								    </td>
									<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
								</tr>
							</table> 
						</td>
					</tr>
				</table>
				<input type="hidden" name="idEi" value="${idEi}"></input>
				<input type="hidden" name="accion"></input>
				<input type="hidden" name="edad" value="${edad}"></input>
				<input type="hidden" name="idAlumno" value="${becado.id}"></input>
				<input type="hidden" name="urlRegreso" value="${urlRegreso}"></input>
				<input type="hidden" name="idInformeIS3" value="${idInformeIS3}"></input>				
			</form>
		</div>
	</body>
</html>