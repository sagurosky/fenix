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

<title>Encargado de Acompañamiento</title>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
	
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script type="text/javascript">

$(function(){
	
	$("#fechaNacimiento").datepicker({
	 	  changeMonth: true,
	 	  changeYear: true,
	 	  yearRange:'1920:'+ new Date()	
	});
										 	  
	$("#altaPerfilEA").validate();

});

var index = 0;

function agregarInput(){
	index++;
	var inputZona = '<input name="zonasCimientos" type="text" id="zona'+ index +'"><input name="nombreZona" id="nombreZona'+ index +'"><br>';
	$("#zonasEA").append(inputZona);
	
	autoCompleteZona(index);
}

function agregarZona(nombre,id){
	index++;
	var inputZona = '<input name="zonasCimientos" type="text" id="zona'+ index +'" value="'+ id +' "><input name="nombreZona" value="'+ nombre +'" id="nombreZona'+ index +'"><br>';
	$("#zonasEA").append(inputZona);

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
	if( $("#redirigir").val() == 'modificar' ){
		document.forms['altaPerfilEA'].action = "../perfilEA/guardarCambiosPerfilEA.do";
	}else{
		document.forms['altaPerfilEA'].action = "../perfilEA/guardarPerfilEA.do"
	}
	$("#altaPerfilEA").submit();
}
</script>

</head>

<body>

<form:form id="altaPerfilEA" name="altaPerfilEA" class="cmxform" commandName="perfilEA" modelAttribute="perfilEA" action="guardarPerfilEA.do" method="post">
	<input id="redirigir" type="hidden" value="${redirigir}"/>
	<form:hidden path="idPerfilEA"/>
	<form:hidden path="datosPersonales.id"/>
<div id="right-content">
    <br />
    <br />

    <h1>Ficha de Encargado de Acompañamiento</h1>

    <table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">

		<tr>
			<td><label for="nombre">Nombre:</label></td>
			<td><label name="nombre">${persona.apellido},${persona.nombre}</label></td>
		</tr>
	    
	  	<tr>
        <td>Zonas Cimientos</td>
        <td id="zonasEA">
        	<c:forEach items="${persona.perfilEA.zona}" var="zona">
        		<script>
        			agregarZona('${zona.nombre}','${zona.id}');
        		</script>
        	</c:forEach>
        </td>
      	</tr>
      	<tr>
      		<td></td>
      		<td>
      			<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
					<a  onclick="agregarInput()"> 
					<span class="ui-icon ui-icon-plus" > 
					</span></a>				
				</div>
      		</td>
      	</tr>
      	<tr>
      		<td></td><td></td>
      	</tr>
	    		
      <tr>
        <td colspan="2">
        <table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
          <tr>
            <td width="50" align="center" valign="middle"><input type="button" onclick="enviarForm()" value="Guardar" class="ui-state-default ui-corner-all" /></td>
            <td width="50" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
		       onclick="location.href='../perfilEA/listaPerfilEA.do'; return false;" /></td>
            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
          </tr>
		
		 </table>      
</td>
</tr>	
</table>
</div>
</form:form>
</body>
</html>