<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/funcionesCuil.js"/>"></script>
<style type="text/css">
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
</style>	
<title>Alta de Perfil TS</title>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<script>
	var digito;
	function generarCuil(valueRadio)
	{
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		value = $('#dni').val();
		
		if(valueRadio == "true")
		{ //Masculino			
			cuil = value;
			xy = 20;
			cuil = calcular( xy, cuil);
		}
		else
		{
			if(valueRadio == "false")
			{							//fememino
				cuil = value;
				xy = 27;
				cuil = calcular( xy, cuil );
			}
		}
		
		if(isNaN( digito ))
		{
			$('#cuil').val(" ");
		}
		else
		{
			$('#cuil').val(cuil);
		}
					
	}
	

	
	function formatear(xy, cuil, digito) {
		return (xy + "-" + cuil + "-" + digito);		
		
		}
	
	function validar () {
		var error = false; /* No se detecto error hasta el momento, no se vio que falten datos */
		var faltantes = "Faltan: ";

		if (document.getElementById("dni").value == ""){
			error = true;
			faltantes += " N° de Documento \n";
			}
		
		if (error == true) {			/* Si hay error es porque entre en algun if, entonces muestro con alert lo que falta y devuelvo false para que no funcione el submit del formulario */
				alert (faltantes);
				return false;			/* El submit del formulario no funciona porque tiene un return validar() <-- y return false hace que no submitee que es lo que pasa en este caso */
			} else {
					return true;
				}
	}

</script>
<script type="text/javascript">
var counter =1;

function incrementarCounter(){
	counter++;
}

$(function(){
	
	verificarCuil();
	
	$("#fechaNacimiento").datepicker({
	 	  changeMonth: true,
	 	  changeYear: true,
	 	  yearRange:'1920:'+ new Date()	
	});
										 	  
	$("#altaPerfilTS").validate();

	$("#eliminarLocalidad").click(function () {
		var checks = $(".esCheck");
		for (i = 0; i < checks.length; i++){
			if(checks[i].checked){
				$("#" + checks[i].value).remove();
			}
		}
    });
	
});

var index = 0;

function agregarInput(){
	index++;
	var inputZona = '<tr id="fila'+ counter +'"><td><input type="checkbox" value="fila'+ counter +'" class="esCheck">&nbsp;<input name="zonasCimientos" type="hidden" id="zona'+ index +'" value="0"><input name="nombreZona" id="nombreZona'+ index +'"></td></tr>';
	$("#zonasTS").append(inputZona);
	incrementarCounter();
	autoCompleteZona(index);
}

function agregarZona(nombre,id){
	index++;
	var inputZona = '<tr id="fila'+ counter +'"><td><input type="checkbox" value="fila'+ counter +'" class="esCheck">&nbsp;<input name="zonasCimientos" type="hidden" id="zona'+ index +'" value="'+ id +' "><input name="nombreZona" value="'+ nombre +'" id="nombreZona'+ index +'"></td></tr>';
	$("#zonasTS").append(inputZona);
	incrementarCounter();
	autoCompleteZona(index);
}

function autoCompleteZona(index){
	$("#nombreZona"+index).keypress(function(){
		$('#zona'+index).val(0);
		$('#nombreZona'+index).autocomplete({
			source: function(request, response) {
						$.ajax({
							url: "../ajax/buscarZonaPorNombre.do",
							dataType: "json",
							data: {
								style: "full",
								maxRows: 15,
								name_startsWith: request.term
							},
							success: function(data) {
								response($.map(data.zonas, function(item) {
									return {
										label: item.nombre,
										value: item.nombre,
										id: item.id
									}
								}))
							}
						})
			},
			select: function(event, ui) {
				$('#zona'+index).val(ui.item.id);
			},
			open: function() {
				$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
			},
			close: function() {
				$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
			}
		});
	});
}	
function enviarForm(){
		if( $("#redirigir").val() == 'alta' ){
			document.forms['altaPerfilTS'].action = "../perfilTS/guardarPerfilTS.do";
		}else{
			document.forms['altaPerfilTS'].action = "../perfilTS/guardarCambiosPerfilTS.do"
		}
		$("#altaPerfilTS").submit();
	}
</script>

<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>


 
</head>

<body>

<form:form id="altaPerfilTS" name="altaPerfilTS" class="cmxform" commandName="perfilTS" modelAttribute="perfilTS" action="guardarPerfilTS.do" method="post">
	<input id="redirigir" type="hidden" value="${redirigir}"/>
	<form:hidden path="idPerfilTS"/>
	<form:hidden path="datosPersonales.id"/>	
<div id="right-content">
    <br />
	<fieldset>
	<legend>Modificar Datos Personales TS</legend>
		 <table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">

		<tr>
			<td><label for="nombre">Nombre *</label></td>
			<td><input type="text" name="datosPersonales.nombre" cssClass="required" value="${perfilTS.datosPersonales.nombre}"/></td>
		</tr>
		
		<tr>
			<td><label for="apellido">Apellido *</label></td>
			<td><input type="text" name="datosPersonales.apellido" cssClass="text-input required" value="${perfilTS.datosPersonales.apellido}"/></td>
		</tr>
		
		<tr>
			<td><label for="dni">DNI *</label></td>
			<td><input type="text" id="dni" name="datosPersonales.dni" maxlength="9" cssClass="digit text-input required" value="${perfilTS.datosPersonales.dni}"/></td>
		</tr>
		
		<tr>
	        <td width="150"><label> CUIT/CUIL *</label></td>
	        <td width="670"><input type="text" id="cuil" name="datosPersonales.cuilCuit" cssClass="text-input required" value="${perfilTS.datosPersonales.cuilCuit }"/></td>
	    </tr>
		
		<tr>
			<td><label for="direccion">Direccion *</label></td>
			<td><input type="text" name="datosPersonales.direccion" cssClass="text-input required" value="${perfilTS.datosPersonales.direccion }"/></td>
		</tr>
		<tr>
			<td><label for="codigoPostal">Codigo Postal *</label></td>
			<td><input type="text" name="datosPersonales.codigoPostal" cssClass="text-input required" value="${perfilTS.datosPersonales.codigoPostal }"/></td>
		</tr>
		<tr>
			<td><label for="telefono">Telefono *</label></td>
			<td><input type="text" name="datosPersonales.telefono" cssClass="text-input required" value="${perfilTS.datosPersonales.telefono}"/></td>
		</tr>
		<tr>
			<td><label for="celular">Celular</label></td>
			<td><input type="text" name="datosPersonales.celular" cssClass="text-input" value="${perfilTS.datosPersonales.celular }"/></td>
		</tr>
		<tr>
			<td><label for="fechaNacimiento">Fecha de Nacimiento*</label></td>
			<td><input name="datosPersonales.fechaNacimiento" id="fechaNacimiento" class=" date required" value="<fmt:formatDate value="${perfilTS.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>" /> dd/mm/aaaa<br></td>
		</tr>
		<tr>
			<td>
				<label for="sexo">Sexo </label></td>
				<td>	<c:choose>
							<c:when test="${perfilTS.datosPersonales.sexo == true}">
								M<input name="datosPersonales.sexo" type="radio" value="true" checked="checked" class="required" onfocus="generarCuil(this.value)"/>
								F<input name="datosPersonales.sexo" type="radio" value="false" onfocus="generarCuil(this.value)"/>
							</c:when>
							<c:otherwise>
								M<input name="datosPersonales.sexo" type="radio" value="true" class="required" onfocus="generarCuil(this.value)"/>
								F<input name="datosPersonales.sexo" type="radio" checked="checked" value="false" onfocus="generarCuil(this.value)"/>
							</c:otherwise>
						</c:choose>
				
			</td>
		</tr>
		
		<tr>
			<td><label>Estado Civil</label></td>
			<td><select name="estado" id="estadoCivil" style="width: 145px;">
						<c:forEach items="${estadosCiviles}" var="estado">
							<c:choose>
								<c:when test="${perfilTS.datosPersonales.estadoCivil.id == estado.id}">
									<option value="${estado.id}" selected="selected">${estado.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${estado.id}">${estado.valor}</option>
								</c:otherwise>	
							</c:choose>
						</c:forEach>
					</select>
			</td>
		</tr>
		<tr>
			<td><label for="mail">E-mail</label></td>
			<td><input type="text" name="datosPersonales.mail" id="mail"  value="${perfilTS.datosPersonales.mail}"/></td>
		</tr>
		<tr>
	     	<td colspan="2">&nbsp;</td>
	     </tr>
		 <tr>
		    <td valign="top">Zonas Cimientos</td>
		     <td>
		      	<table id="zonasTS">
		        	<c:if test="${empty perfilTS.zonas}">
		       			<tr id="fila0">
		       				<td>
		       					<input type="checkbox" value="fila0" class="esCheck">
		       					<input name="zonasCimientos" type="hidden" id="zona0">
		       					<input name="nombreZona"  id="nombreZona0" class="required"></td>
		       			</tr>
		       			<script>
		       			autoCompleteZona(0);
		       			</script>
		       		</c:if>
			        	<c:forEach items="${perfilTS.zonas}" var="zona">
			        		<script>
			        			agregarZona('${zona.nombre}','${zona.id}');
			        		</script>
			        	</c:forEach>
		        	</table>
		        </td>
	      	</tr>
	      	<tr>
	      		<td colspan="2">&nbsp;</td>
	      	</tr>
	      	<tr>
	      		<td colspan="2"><input type="button" value="Agregar" onclick="agregarInput()" class="ui-state-default ui-corner-all">
	      						<input type="button" value="Eliminar" id="eliminarLocalidad" class="ui-state-default ui-corner-all"></td>
	      	</tr>
	      	<tr>
	      		<td colspan="2">&nbsp;</td>
	      	</tr>
	</table>
	
</fieldset>
<br><br>
  <table  align="center"  >
          <tr>
            <td ><input type="button" onclick="enviarForm()" value="Guardar" class="ui-state-default ui-corner-all" /></td>
            <td ><input type="button" value="Volver" class="ui-state-default ui-corner-all" 
		       onclick="location.href='../perfilTS/listaPerfilTS.do'; return false;" /></td>
            
          </tr>
		
		 </table>	       
</div>
</form:form>
</body>
</html>