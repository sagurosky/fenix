<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>..:: Alta de Beca ::..</title>

<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
  <script>
  $(document).ready(function(){  
  //  $("#altaBeca").validate();
    $("#fechaAlta").datepicker({
  	  changeMonth: true,
  	  changeYear: true,
 	  yearRange:'-1:+1'
  	  });
  });
  
  
  
  
  
  
  
  $(document).ready(function(){
		//$("#registraPersona").validate(); DMS 15/9/22 reemplazo validate por valid de la funcion enviar (daba error)
	    $("#fechaAlta").datepicker({
	  		changeMonth: true, 
	  		changeYear: true,
	  		 yearRange:'-1:+1'
		});
	});


	//DMS 6	/9/22 antes de hacer un submit doy vuelta el valor de la fecha para que el validador
	//funcione bien, luego lo normalizo para que llegue bien al controlador

	function enviar(){
		
		voltearFecha();
		 
		 
		  if($("#altaBeca").valid()){
				voltearFecha();
				document.getElementById("altaBeca").submit(); 
			}else voltearFecha();
	}

	function voltearFecha(){
		  var fecha=$("#fechaAlta").val();
		  fecha=fecha.toString();
		  var dia=fecha.slice(0,2);
		  var mes=fecha.slice(3,5);
		  var anio=fecha.slice(6,10);
		  var barra=fecha.slice(2,3);
		fecha=mes+barra+dia+barra+anio;  
		document.getElementById("fechaAlta").value=fecha;
		console.log(fecha);
	}
  
  
  
  
  
  
  
</script>
<script>
function chequearLongitud(obj){
	if (obj.value.length > 10000) {
	obj.value = obj.value.substring(0, 10000);
	}
}

$(function() {
	  $("#ciclo").change(function(evt) {
	    evt.preventDefault()   
	    $.ajax( {
	      type: "GET",
	      url: "../ajax/obtenerListaPeriodos.do",
	      data: { idCiclo: $("#ciclo").val() },
	      dataType: "json",
	      success: function(data) {
	    	  var options = '';
	            options += '<option value="" selected="selected">Seleccione un periodo</option>'
	            $(data.periodos).each(function() {
	                options += '<option value="' + this.id + '">' + this.nombre + '</option>';
	            });
	             $("select#periodo").html(options);
	        	
	      }
	    } )
	  })
	})

</script>
<script type="text/javascript">
	$(function() {
		$("#padrino").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarPadrinosPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						maxRows: 15,
						name_startsWith: request.term
					},
					success: function(data) {
						response($.map(data.padrinos, function(item) {
							return {
								label: item.nombre,
								value: item.nombre,
								id: item.id
							}
						}))
					}
				})
			},
			minLength: 2,
			select: function(event, ui) {
				$("#idPadrino").val(ui.item.id);
			},
			open: function() {
				$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
			},
			close: function() {
				$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
			}
		});
	});
	</script>

</head>
<body>

<form id="altaBeca" class="cmxform" action="<c:url value='/beca/altaBeca.do' />" method="post">
<div id="right-content">

    <br />

    <br />
<fieldset style="font-size: 12px; width:980px;">
  <legend>Alta de Beca</legend>
       <table border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
	        <td width="180">Padrino*</td>
	        <td width="620">
			<input type="text" id="padrino" class="text-input required" name="padrino" value="">
			<input name="idPadrino" id="idPadrino" type="hidden">
			</td>
	    </tr>
		<tr>
	    <td>Ciclo*</td>
        <td><label>
         <select id="ciclo" name="ciclo" class="required">
				<option value="" selected="selected">Seleccione un ciclo</option>
				<c:forEach var="ciclo" items="${ciclos}">
					<option id="test" value="${ciclo.id}">${ciclo.nombre}</option>
				</c:forEach>
			</select>
        </label></td>
      	</tr>
      	<tr>
	    <td>Mes Incorporac. Beca*</td>
        <td><label>
         <select id="periodo" name="periodo" class="required">
				<option value="" selected="selected">Seleccione un periodo</option>
				<c:forEach var="periodo" items="${periodos}">
					<option value="${periodo.id}">${periodo.nombre}</option>
				</c:forEach>
			</select>
        </label></td>
      	</tr>
		<tr>
	    <td>Zona*</td>
        <td><label>
         <select id="zona" name="zona" class="required">
				<option value="" selected="selected">Seleccione una zona</option>
				<c:forEach var="zona" items="${zonas}">
					<option value="${zona.id}">${zona.nombre}</option>
				</c:forEach>
			</select>
        </label></td>
      	</tr>
		<tr>
	    <td>Tipo Beca</td>
        <td><label>
         <select id="tipo" name="tipo">
				<option value="" selected="selected">Seleccione un tipo</option>
				<c:forEach var="tipo" items="${tipos}">
					<option value="${tipo.id}">${tipo.valor}</option>
				</c:forEach>
			</select>
        </label></td>
      	</tr>      	
		<tr>
	    <td>Estado*</td>
        <td><label>
         <select id="estado" name="estado" class="required">
				<option value="" selected="selected">Seleccione un estado</option>
				<c:forEach var="estado" items="${estados}">
					<option value="${estado.id}">${estado.valor}</option>
				</c:forEach>
			</select>
        </label></td>
      	</tr>
		<tr>
        <td>Cantidad*</td>
        <td><input type="text" id="cantidad" name="cantidad" class="text-input digits required" value="${cantidad}"></td>
	    </tr>
		<tr>
        <td>Fecha Confirmaci&oacute;n</td>
        <td>
        	<input name="fechaAlta" id="fechaAlta" class="text-input date" value="<fmt:formatDate value="${fechaAlta}" pattern="dd/MM/yyyy"/>" /> dd/mm/aaaa
        	<input name="fechaModif" id="fechaModif" class="text-input date" type="hidden"value="<fmt:formatDate value="${fechaAlta}" pattern="dd/MM/yyyy"/>" /> 
        </td>
	    </tr>	
		<tr>
			<td>Comentarios:</td>
		   	<td><textarea cols="60" rows="5"  name="comentarios" name="comentarios" onkeypress="chequearLongitud(this);" onblur="chequearLongitud(this);">${comentarios}</textarea></td>
		</tr>	    	
      	<tr>
        <td>&nbsp;</td>
     	   <td>&nbsp;</td>
      	</tr>
</table>
     	    
</fieldset>	
<table width="800" border="0" align="left" cellpadding="0" cellspacing="0" id="table-botons-small">
        <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        </tr>
       	<tr>
          	<td ><input class="ui-state-default ui-corner-all " type="submit" value="Registrar" /></td>
          	<td><input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../beca/listaBecasView.do'; return false;" /></td>
          	<td width="600" height="30" align="center" valign="middle">&nbsp;</td>
       	</tr>

</table>  
</div>	
		</form>
	
	
	<input type="hidden" name="idBeca" />

</body>
</html>