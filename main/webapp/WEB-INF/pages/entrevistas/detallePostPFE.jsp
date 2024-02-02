<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@page import="java.util.ArrayList"%>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Post PFE</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css ">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/dataTables.jqueryui.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">



<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>	
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.11/js/dataTables.jqueryui.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>

<style>
th { white-space: nowrap; }

thead, tfoot {
    display: table-header-group;
}
.sinborde {
  border: 0;
}

</style>
<link rel="stylesheet" href="<c:url  value="/static/css/styles.css"/>" media="all">
<script>
$(document).ready(function(){
  $("#qmd").change(function(){
	var valor1 = parseFloat($("#qmd").val());
	var valor2 = parseFloat($("#qmqnsp").val());
	var valor3 = parseFloat($("#qmqnhm").val());
	var total=0;
	if (isNaN(valor1)){
		valor1=0;
	}
	if (isNaN(valor2)){
		valor2=0;
	}
	if (isNaN(valor3)){
		valor3=0;
	}
	if(valor1>15){
			alert("El valor debe ser entre 0 y 15");
	}		
	total=valor1+valor2+valor3;
	$("#qmqa").val(total);
  });
});
</script>
<script>
$(document).ready(function(){
	$("#modificar").click(function(){		
		var isChecked1 = document.getElementById('te1').checked;
		var isChecked2 = document.getElementById('te2').checked;
		var isChecked3 = document.getElementById('te3').checked;
		var isChecked4 = document.getElementById('te4').checked;
		var isChecked5 = document.getElementById('te5').checked;	
		if (!isChecked1 && !isChecked2 & !isChecked3 && !isChecked4 && !isChecked5){
			alert('Falta seleccionar Tipo de encuentro ');  
			return false;				
		}
	});
});
</script>
<script>
$(document).ready(function(){
  $("#qmqnsp").change(function(){
	var valor1 = parseFloat($("#qmd").val());
	var valor2 = parseFloat($("#qmqnsp").val());
	var valor3 = parseFloat($("#qmqnhm").val());
	var total=0;
	if (isNaN(valor1)){
		valor1=0;
	}
	if (isNaN(valor2)){
		valor2=0;
	}
	if (isNaN(valor3)){
		valor3=0;
	}
	if(valor2>15){
		alert("El valor debe ser entre 0 y 15");
	}	
	total=valor1+valor2+valor3;
	$("#qmqa").val(total);
  });
});
</script>
<script>
$(document).ready(function(){
  $("#egreso").change(function(){
	var eg=$("#egreso").val();
	
	if(eg=="Egreso Efectivo"){		
		$("#ciclo").prop( "disabled", false );
		$("#ciclo").val("2019");
		$("#periodo").prop( "disabled", false );
		$("#periodo").val("Diciembre");
		$("#planAccion").val(" ");
		
		$("#planAccion").prop( "disabled", true );
	}	
	if(eg=="Egreso Pendiente"){		
		$("#ciclo").val("0");
		$("#periodo").val("0");
		$("#ciclo").prop( "disabled", true );
		$("#periodo").prop( "disabled", true );
		$("#planAccion").val("");
		$("#planAccion").prop( "disabled", false );
	}	
  });
 }) ;
</script>
<script>
$(document).ready(function(){
  $("#qmqnhm").change(function(){
	var valor1 = parseFloat($("#qmd").val());
	var valor2 = parseFloat($("#qmqnsp").val());
	var valor3 = parseFloat($("#qmqnhm").val());
	var total=0;
	if (isNaN(valor1)){
		valor1=0;
	}
	if (isNaN(valor2)){
		valor2=0;
	}
	if (isNaN(valor3)){
		valor3=0;
	}
	if(valor3>15){
			alert("El valor debe ser entre 0 y 15");
	}	
	total=valor1+valor2+valor3;
	$("#qmqa").val(total);
  });
});
</script>

<script>
jQuery(document).ready(function($) {
  var requiredCheckboxes = $(':checkbox[required]');
  requiredCheckboxes.on('change', function(e) {
    var checkboxGroup = requiredCheckboxes.filter('[name="' + $(this).attr('name') + '"]');
    var isChecked = checkboxGroup.is(':checked');
    checkboxGroup.prop('required', !isChecked);
  });
});
</script>

</head>
<body style="font-family: Arial, Verdana;font-size:16px; ">
<%
Calendar fecha = new GregorianCalendar();
int ano = fecha.get(Calendar.YEAR);
int mes1 = fecha.get(Calendar.MONTH);
int dia = fecha.get(Calendar.DAY_OF_MONTH);
int hora = fecha.get(Calendar.HOUR_OF_DAY);
int minuto = fecha.get(Calendar.MINUTE);
int segundo = fecha.get(Calendar.SECOND);
String fechaActualizacion2="";
if (mes1<10){	
	fechaActualizacion2=ano + "/" + (mes1+1) + "/" + dia;
}else{
	fechaActualizacion2=ano + "/" + (mes1+1) + "/" + dia;
}
String cicloJSP=request.getParameter("ciclo");
System.out.println(cicloJSP);
%>
<table  style="width: 100%; height: auto;" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="2">
			<jsp:include page="/WEB-INF/pages/includes/header.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<jsp:include page="/WEB-INF/pages/includes/menu.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td valign="top" style="width: 200px; height: 500px; background-color: #7C7C7C;" >
			<jsp:include page="${menu}"></jsp:include></td>
			<td style="background-color: #FFF; vertical-align: top;">
				<div id="body" style="background-color: #FFF; vertical-align: top;">
					<c:if test="${error != null || mensaje != null}">
						<div id="mensaje-content">
							<table id="mensaje" >
								<tr >
									<td>
										<jsp:include page="/WEB-INF/pages/includes/mensajes.jsp"></jsp:include>
									</td>
								</tr>
							</table>
						</div>
					</c:if>
					
					<% 
						ArrayList<String> anio = new ArrayList<String>();
						anio.add(0,"Seleccionar");
						anio.add(1,"2021");
						anio.add(1,"2020");
						anio.add(2,"2019");
						anio.add(3,"2018");
						anio.add(4,"2017");
						anio.add(5,"2016");
						anio.add(6,"2015");
						anio.add(7,"2014");
						anio.add(8,"2013");
						anio.add(9,"2012");
						anio.add(10,"2011");
						anio.add(11,"2010");		
						ArrayList<String> mes = new ArrayList<String>();
						mes.add(0,"Seleccionar");						
						mes.add(1,"Marzo");
						mes.add(2,"Abril");
						mes.add(3,"Mayo");
						mes.add(4,"Junio");
						mes.add(5,"Julio");
						mes.add(6,"Agosto");
						mes.add(7,"Septiembre");
						mes.add(8,"Octubre");		
						mes.add(9,"Noviembre");		
						mes.add(10,"Diciembre");								
						Connection cn = null;
						CallableStatement cl = null;
						ResultSet rs = null;
						String becado="";
						String zona="";
						String escuela="";
						String periodo="";
						String ciclo="";
						String situacionEscolar="";
						String estadoAlumno="";
						String ultimaActualizacion="";
						String boletinPostPfe="";
						String dni="";
						String aprobarPago="no";
						String idBecado=request.getParameter("id");
						String ra="";
						String revertirPago="no";
						String cicloEgreso="";
						String periodoEgreso="";
						String situacionEscolarCodigo="";
						String rr="";
						String periodoPago="";
						String planAccion="";
						if(cicloJSP.equals("29")){
							periodoPago="345";
						}
						if(cicloJSP.equals("30")){
							periodoPago="355";
						}
						if(cicloJSP.equals("31")){
							periodoPago="365";
						}
						if(cicloJSP.equals("32")){
							periodoPago="375";
						}
						cn = null;
						cl = null;
						rs = null;
						System.out.println("PP: "+periodoPago);
						System.out.println("id: "+request.getParameter("id"));
						String call = "SELECT * FROM perfil_alumno,persona, estado_alumno,escuela,zona_cimientos,entrevista, ciclo_programa, periodo, evaluacion_renovacion_final, situacion_escolar where perfil_alumno.id=persona.perfil_alumno and perfil_alumno.estado_alumno=estado_alumno.id_estado and perfil_alumno.escuela=escuela.id and escuela.zona_cimientos_id=zona_cimientos.id and entrevista.perfil_alumno=perfil_alumno.id and entrevista.periodo_de_pago='"+periodoPago +"' and entrevista.evaluacion_renovacion_final=3 and periodo.id=entrevista.periodo_de_pago and ciclo_programa.id=periodo.ciclo_id and evaluacion_renovacion_final.codigo=entrevista.evaluacion_renovacion_final and  situacion_escolar.codigo=entrevista.situacion_escolar_mergeada and perfil_alumno.id="+request.getParameter("id");
						cn = Conexion.getConexion();
						cl = cn.prepareCall(call); 
						
						rs = cl.executeQuery();
						while (rs.next()) {
							becado=rs.getString("persona.apellido")+ " "+ rs.getString("persona.nombre");
							zona=rs.getString("zona_cimientos.nombre");
							escuela=rs.getString("escuela.nombre");
							periodo=rs.getString("periodo.nombre");
							System.out.println("periodo.nombre:"+periodo);
							ciclo=rs.getString("ciclo_programa.nombre");
							situacionEscolar=rs.getString("situacion_escolar.nombre");
							rr=rs.getString("entrevista.rr");
							estadoAlumno=rs.getString("estado_alumno.estado_alumno");
							situacionEscolarCodigo=rs.getString("situacion_escolar.codigo");							
							if (rs.getString("perfil_alumno.ultima_actualizacion")!=null){
								ultimaActualizacion=rs.getString("perfil_alumno.ultima_actualizacion");
							}		
							
							dni=rs.getString("persona.dni");							
							ra=rs.getString("perfil_alumno.responsable1");
							
							if(rs.getString("perfil_alumno.aprobar_pago")!=null){
								aprobarPago=rs.getString("perfil_alumno.aprobar_pago");
							}else{
								aprobarPago="no";
							}	
							if(rs.getString("perfil_alumno.boletin_post_pfe")!=null){
									boletinPostPfe=rs.getString("perfil_alumno.boletin_post_pfe");
							}else{
								boletinPostPfe="";
							}
							if(rs.getString("perfil_alumno.revertir_pago")!=null){
								revertirPago=rs.getString("perfil_alumno.revertir_pago");
							}else{
								revertirPago="no";
							}	
							//System.out.println(idBecado);
							//System.out.println(ra);
							
						} 
							Conexion.cerrarCall(cl);
							Conexion.cerrarConexion(cn);
							
							String qma="";
							String qmd="";
							String qmqnsp="";
							String qmqnhm="";
							String qmqa="";
							String materiasAdeuda="";
							String individual="";
							String grupal="";
							String dupla="";
							String telefonico="";
							String otro="";
							String evaluacion="";
							String apoyoEscolar="";
							String observacionesOficina="";
							String egreso="";
							String egreso2="";
							
							call ="SELECT * from post_pfe,perfil_alumno where post_pfe.idBecado=perfil_alumno.id and idBecado="+idBecado;
							cn = Conexion.getConexion();
							cl = cn.prepareCall(call); 
						
							rs = cl.executeQuery();
							String periodo2="";
							String ciclo2="";
							while (rs.next()) {
								qma=rs.getString("qma");
								qmd=rs.getString("qmd");
								qmqnsp=rs.getString("qmqnsp");
								qmqnhm=rs.getString("qmqnhm");
								qmqa=rs.getString("qmqa");
								materiasAdeuda=rs.getString("materias_adeuda");
								individual=rs.getString("individual");
								dupla=rs.getString("dupla");
								grupal=rs.getString("grupal");
								telefonico=rs.getString("telefonico");
								otro=rs.getString("otro");
								evaluacion=rs.getString("evaluacion");
								apoyoEscolar=rs.getString("apoyo_escolar");
								ciclo2=rs.getString("ciclo");
								periodo2=rs.getString("periodo");								
								planAccion=rs.getString("plan_accion");
								if (rs.getString("egreso")!=null){
									egreso=rs.getString("egreso");
								}else{
									egreso="No";
								}										
								egreso2=rs.getString("situacion_escolar");								
								if (rs.getString("fecha_ultima_actualizacion")!=null){
									ultimaActualizacion=rs.getString("fecha_ultima_actualizacion");
								}
								if (rs.getString("observaciones_oficina")!=null){
									observacionesOficina=rs.getString("observaciones_oficina");
								}
							}
							//System.out.println("c: "+ciclo);
							//System.out.println("p "+periodo);
							Conexion.cerrarCall(cl);
							Conexion.cerrarConexion(cn);
							
						%>	
						<center><h3>DATOS POST PFE</h3></center>
						<form id="frmPostPFE" method="post" action="altaPostPFE.jsp">
							<fieldset>
								<table>
									<tr><td colpsan=2><strong>Datos del becado</strong></td></tr>
									<tr><td>Alumno:</td><td><%= becado %>
									<input type="hidden" id="becado" name="becado" value="<%= becado %>">
									</td></tr>
									<tr><td>DNI:</td><td><%= dni %>
									<input type="hidden" id="dni" name="dni" value="<%= dni %>">
									</td></tr>			
									<tr><td>Zona:</td><td><%= zona %>
									<input type="hidden" id="zona" name="zona" value="<%= zona %>">
									</td></tr>
									<tr><td>Escuela:</td><td><%= escuela %>
									<input type="hidden" id="escuela" name="escuela" value="<%= escuela %>"></td></tr>
									<tr><td><br></td> </tr>
									
									<tr><td colspan=2><strong>Datos &uacute;ltima entrevista de acompa&ntilde;amiento</strong></td></tr>
									<tr><td>Per&iacute;odo:</td><td><%= periodo %> <%= ciclo  %></td></tr>
									<tr><td>Situaci&oacute;n escolar Diciembre:</td><td><%= situacionEscolar %></td></tr>									
									<tr><td>Estado del alumno:</td><td><%= estadoAlumno  %></td></tr>
									
									<% if(!situacionEscolarCodigo.equals("3")){%>
										<tr><td><br></td> </tr>									
										<tr><td colspan=2><strong>Acompa&ntilde;amiento post PFE</strong></td></tr>										
										
										<tr>
											<td>Cantidad de materias aprobadas: (de 0 a 15)</td><td> 
												
												<input type="number" id="qma" name="qma" value="<%= qma %>" min="0" max="15">
											</td>			
										</tr>
										<tr>
											<td>Cantidad de materias desaprobadas: (de 0 a 15)</td><td> 
												<input type="number" id="qmd" name="qmd" value="<%= qmd %>" min="0" max="15">
												
											</td>			
										</tr>	
										<tr>	
											<td>Cantidad de materias que no se present&oacute;: (de 0 a 15)</td><td> 
												<input type="number" id="qmqnsp" name="qmqnsp" value="<%= qmqnsp %>" min="0" max="15">
											</td>
										</tr>	
										<tr>	
											<td>Cantidad de materias que no hubo mesa: (de 0 a 15)</td><td> 
												<input type="number" id="qmqnhm" name="qmqnhm" value="<%= qmqnhm %>" min="0" max="15">
											</td>
										</tr>		
										<tr>
											<td>Cantidad de materias que adeuda:</td><td> 
												<input type="text" id="qmqa" name="qmqa" size=4 readonly class="sinborde" value="<%=qmqa%>">	
											</td>			
										</tr>
										<tr>
											<td>Nombre de las materias que adeuda:
											<br><font color=red>Campo obligatorio</font></td><td>							
											<textarea rows="5" cols="50" id="materiasAdeuda" name="materiasAdeuda" required><%=materiasAdeuda%></textarea></td>
										</tr>								
										<tr><td></td> </tr>							
										<tr>
											<td colspan=2><strong>Estrategia de acompa&ntilde;amiento</strong>
											</td>
										</tr>	
										<tr>
											<td>Tipo de encuentro
											<br><font color=red>Campo obligatorio</font></td>
											<td>
												<%if (individual.equals("si")){%>
													<input type="checkbox" name="test[]" id="te1" value="Individual"  checked> Presencial Individual<br>
												<%}else{%>
													<input type="checkbox" name="test[]" id="te1" value="Individual" >Presencial Individual<br>
												<%}%>
												<%if (grupal.equals("si")){%>
													<input type="checkbox" name="test[]" id="te2" value="Grupal"  checked>Presencial Grupal<br>
												<%}else{%>
													<input type="checkbox" name="test[]" id="te2" value="Grupal" >Presencial Grupal<br>
												<%}%>
												<%if (dupla.equals("si")){%>	
													<input type="checkbox" name="test[]" id="te3" value="Dupla"  checked>Presencial en Dupla<br>
												<%}else{%>
													<input type="checkbox" name="test[]" id="te3" value="Dupla" >Presencial en Dupla<br>
												<%}%>
												<%if (telefonico.equals("si")){%>	
													<input type="checkbox" name="test[]" id="te5" value="Telefonico"  checked>Contacto telefónico<br>
												<%}else{%>
													<input type="checkbox" name="test[]" id="te5" value="Telefonico" >Contacto telefónico<br>
												<%}%>
												<%if (otro.equals("si")){%>	
													<input type="checkbox" name="test[]" id="te4" value="Otro" checked> Otro
												<%}else{%>
													<input type="checkbox" name="test[]" id="te4" value="Otro" > Otro
												<%}%>
											</td>
										</tr>
										<tr><td></td> </tr>
										
										<tr>
											<td>Estrategia de Acompañamiento desarrollada:
											<br><font color=red>Campo obligatorio</font></td>
											<td><textarea rows="5" cols="50" id="evaluacion" name="evaluacion" required><%=evaluacion%></textarea>
											</td>
										</tr>
										<tr><td><br></td> </tr>
										<tr>
											<td>Asisti&oacute; a clases de apoyo escolar?:</td>
											<td>
												<select id="apoyoEscolar" name="apoyoEscolar">
													<option value="0">Seleccion�</option>
													<%if(apoyoEscolar.equals("si")){%>
														<option value="Si" selected=se�ected>Si</option>
														<option value="No">No</option>
													<%}else{%>
														<option value="Si" >Si</option>
														<option value="No" selected=se�ected>No</option>
													<%}%>
												</select>	
											</td>
										</tr>
									<%}else{%>
								
										<input type="hidden" id="qma" name="qma" value="0" min="0" max="15">
								
										<input type="hidden" id="qmd" name="qmd" value="0" min="0" max="15">
								
										<input type="hidden" id="qmqnsp" name="qmqnsp" value="0" min="0" max="15">
								
										<input type="hidden" id="qmqnhm" name="qmqnhm" value="0" min="0" max="15">
								
										<input type="hidden" id="qmqa" name="qmqa" size=4  value="0">	
								
										<input type="hidden" id="materiasAdeuda" name="materiasAdeuda" value="">
										<input type="hidden" name="test[]" id="te1" value="Individual">
										<input type="hidden" name="test[]" id="te2" value="Grupal" >
										<input type="hidden" name="test[]" id="te3" value="Dupla" >
										<input type="hidden" name="test[]" id="te4" value="Otro">
									
										<input type="hidden" id="evaluacion" name="evaluacion" value="">
									
										<input type="hidden" id="apoyoEscolar" name="apoyoEscolar" value="">
											
									
									<%}%>
									
									<tr><td><br></td> </tr>
									<tr>
										<td><strong>Situación Fin de Participación</strong></td>
									
									<tr>
										<td>Situación Escolar Actual:</td><td> 
											<select id="egreso" name="egreso">												
												<option value="0">Seleccionar</option>
												<%if(egreso2.equals("3") ){%>
													<option value="Egreso Efectivo" selected=selected>Egreso Efectivo</option>
													<option value="Egreso Pendiente">Egreso Pendiente</option>
												<%}else{
														if(egreso2.equals("2")){%>
														<option value="Egreso Efectivo" >Egreso Efectivo</option>
														<option value="Egreso Pendiente" selected=selected>Egreso Pendiente</option>
													<%}else{%>														
														<option value="Egreso Efectivo" >Egreso Efectivo</option>
														<option value="Egreso Pendiente">Egreso Pendiente</option>
												<%}}%>
											</select>												
										</td>			
									</tr>
									<tr>
										<td>Ciclo Egreso</td><td> 
											<select id="ciclo" name="ciclo">
												<option value="0">Seleccionar</option>
												<% for (int x=1;x<11;x++){ 			
													if(ciclo2.equals(anio.get(x))){%>
														<option value="<%=anio.get(x) %>" selected="selected"><%=anio.get(x) %></option>	
													<%}else{ %>  		
														<option value="<%=anio.get(x) %>"><%=anio.get(x) %></option>
													<%}}%> 
											</select>	
										</td>			
									</tr>
									<tr>
										<td>Per&iacute;odo egreso</td><td> 
											<select id="periodo" name="periodo">
												<option value="0">Seleccionar</option>
												<% for (int x=1;x<11;x++){ 			
														if(periodo2.equals(mes.get(x))){%>
															<option value="<%=mes.get(x) %>" selected="selected"><%=mes.get(x) %></option>	
														<%}else{ %>  		
															<option value="<%=mes.get(x) %>"><%=mes.get(x) %></option>
														<%}} %> 
											</select>
										</td>			
									</tr>
									<tr>
										<td>Plan de Acción Acordado con el AB
										<br><font color=red>Esta información va a ser utilizada por el equipo de oficina<br>
										para relevamiento telefónico posterior. Por favor, agregar<br>
										toda información relevante de fechas, materias, estrategias<br>
										acordadas con el AB.</font></td>																	
										<td> 
											<textarea rows="5" cols="50" id="planAccion" name="planAccion"><%=planAccion%></textarea>
										</td>			
									</tr>	
									<tr>
										<td>Fecha actualizaci&oacute;n situaci&oacute;n escolar</td><td> 
											<input type="text" id="fase" name="fase" size=7 value="<%= ultimaActualizacion  %>" class="sinborde" readonly>	
											<input type="hidden" id="fase2" name="fase2" size=7 value="<%= fechaActualizacion2 %>" >	
										</td>			
									</tr>
									<tr>
										<td>Observaciones oficina</td>
									</tr>	
									<tr>
										<td> 
											<td><textarea rows="5" cols="50" id="observacionesOficina" name="observacionesOficina"><%=observacionesOficina%></textarea>
										</td>			
									</tr>			
								</table>
								
   

								<br>
								<input type="hidden" id="idBecado" name="idBecado" value="<%= idBecado%>">
								
								<center><input type="submit" id="modificar" name="modificar" value="Modificar datos">
								<br><br>
								</center>
							</fieldset>	
						</form>	
						<br>							
						<fieldset>
							<center>
								<br>					
								<strong>BOLETIN POST PFE</strong>
								<br><br>	
								<% String archivo="http://fenix.cimientos.org/boletinesPostPFE/"+boletinPostPfe;%>
								<a href="<%=archivo%>" target="_blank"><img src="<%=archivo%>" width="100"></a>
								<br><br>		
								<strong>Subir bolet&iacute;n</strong>
								<br>
								<form action="subirBoletinPFE.jsp" enctype="MULTIPART/FORM-DATA" method="post">
									<input type="file" name="file" />
									<input type="submit" value="Subir bolet&iacute;n" />												
								</form>
										
							<br>
						</fieldset>	
						<br>
						<fieldset>
							<center>
								<br>
								<strong>PAGO POST PFE</strong>
								<br><br>
								<form id="frmAprobarPago" action="aprobarPagoPostPFE.jsp" method="post">	
									<input type="hidden" id="idRr" name="idRr" value="<%= rr%>">
									<input type="hidden" id="aprobarPago" name="aprobarPago" value="<%= aprobarPago%>">
									<input type="hidden" id="idBecadoAprobar" name="idBecadoAprobar" value="<%= idBecado%>">
									<input type="hidden" id="becadoAprobarNombre" name="becadoAprobarNombre" value="<%= becado%>">
									<input type="hidden" id="becadoAprobarZona" name="becadoAprobarZona" value="<%= zona%>">
									<input type="hidden" id="ra" name="ra" value="<%= ra%>">
									<input type="hidden" id="rp" name="rp" value="<%= revertirPago%>">
									<input type="hidden" id="ciclo" name="ciclo" value="<%= ciclo%>">
									Mes de pago:
												<select id="mesPago" name="mesPago">
													<option value="356">Marzo</option>
													<option value="357">Abril</option>
													<option value="358">Mayo</option>
													<option value="359">Junio</option>
													<option value="360">Julio</option>
													<option value="361">Agosto</option>
													<option value="362">Septiembre</option>
													<option value="363">Octubre</option>
													<option value="364">Noviembre</option>
													<option value="365">Diciembre</option>
												</select>
									<% 																	
										System.out.println(boletinPostPfe);
										System.out.println(aprobarPago);
										System.out.println(revertirPago);
										
										if(!boletinPostPfe.equals("") && aprobarPago.equals("si") && revertirPago.equals("no")){%>
										
										<sec:authorize access="hasRole('RR') or hasRole('SuperUsuario') or hasRole('SYS')" >
											
											<input type="submit" id="finalizar" name="finalizar" value="Finalizar Pago">
										</sec:authorize>
									<%}%>
									<% 								
										if(!boletinPostPfe.equals("") && aprobarPago.equals("no")){%>
										<sec:authorize access="hasRole('EA') or hasRole('SuperUsuario') or hasRole('SYS') or hasRole('RR')">
											<input type="submit" id="aprobarPago" name="aprobarPago" value="Aprobar Pago">
										</sec:authorize>								
									<%}%>
									<% 								
										if(revertirPago.equals("si")){%>
										<sec:authorize access="hasRole('SuperUsuario') or hasRole('SYS') or hasRole('RR')">										
											<input type="submit" id="aprobarPago" name="aprobarPago" value="Revertir Pago">
										</sec:authorize>								
									<%}%>
								</form>	
								<br>
								</center>
						</fieldset>	
						<br><br>
					
					
					
				</div>	
			</td>
	</tr>
</table>
