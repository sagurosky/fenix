<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" href="<c:url value="/static/css/demos.css"/>" media="all" />
<title>..:: Modificar Beca ::..</title>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
	<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
	</style>
  <script>
  $(document).ready(function(){
    $("#form1").validate();
    $("#fechaAlta").datepicker({
    	  changeMonth: true,
    	  changeYear: true
    	  });
  });
  </script>
  <script>
  function chequearLongitud(obj){
		if (obj.value.length > 250) {
		obj.value = obj.value.substring(0, 250);
		}
	}
  
$(function() {
	  $("#ciclo").change(function(evt) {
	    evt.preventDefault()   // make sure the hyperlink doesn't work per se
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

<form class="cmxform" id="form1" action="<c:url value='/beca/modificar.do' />" method="post"> 
<div id="right-content">

    <br />

    <br />
<fieldset style="font-size: 12px; width:980px;">
  <legend>Detalle de Beca</legend>
    <table border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
	        <td width="180">Padrino:</td>
	        <td width="669">
			<c:if test="${beca.padrino.empresa != null}">
			<input type="text" style="width: 500px; border=0" id="padrino" name="padrino" class="text-input required" value="${beca.padrino.empresa.denominacion}"/>
			</c:if>
			<c:if test="${beca.padrino.empresa == null}">
			<input type="text" style="width: 500px; border: 0px" id="padrino" name="padrino" class="text-input required" value="${beca.padrino.datosPersonales.apellido},${beca.padrino.datosPersonales.nombre}"/>
			</c:if>
			
	    </tr>
	    <tr>
	    	<td>Id Plataforma Contable:</td>
	    	<td>
	    		<input type="text" style="width: 500px; border: 0px" id="idP" name="idP" readonly="readonly" value="${beca.padrino.nroCtesPlataformaContable}">
	    </tr>
		<tr>
		<tr>
	    	<td>Tipo Padrino:</td>
	    	<td>
	    		<input type="text" style="width: 500px; border: 0px" id="idtp" name="idtp" readonly="readonly" value="${beca.padrino.tipo.valor}">
	    </tr>			
		<tr>
	    	<td>Mes Incorporac. Beca:</td>
	        <td>
				<input type="text" style="width: 500px; border: 0px" id="mib" name="mib" readonly="readonly" value="${beca.periodoPago.nombre}">        
	        </td>        
      	</tr>
      	<tr>		
		    <td>Ciclo:</td>
	        <td>
				<input type="text" style="width: 500px; border: 0px" id="ciclo" name="ciclo" readonly="readonly" value="${beca.ciclo.nombre}">        
	        </td>
      	</tr>
		<tr>
		    <td>Estado:</td>
	        <td>
				<input type="text" style="width: 500px; border: 0px" id="est" name="est" readonly="readonly" value="${beca.estado.valor}">        
	        </td>        
      	</tr>
		<tr>
		    <td>Zona:</td>
	        <td>
				<input type="text" style="width: 500px; border: 0px" id="zona" name="zona" readonly="readonly" value="${beca.zona.nombre}">        
	        </td>        
      	</tr>
		<tr>
	    	<td>Tipo Beca:</td>
	    	<td>
				<input type="text" style="width: 500px; border: 0px" id="tipob" name="tipob" readonly="readonly" value="${beca.tipo.descripcion}">        
	        </td>	
        
      	</tr>        	
		
		<tr>
        	<td>Cantidad:</td>
        	<td><input type="text" style="width: 500px; border: 0px" id="cantidad" name="cantidad" class="text-input digits required" value="${beca.cantidad}"></td>
	    </tr>
		<tr>
        	<td>Fecha Confirmaci&oacute;n:</td>
        		<td><input type="text" name="fechaAlta" style="width: 500px; border: 0px" id="fechaAlta" readonly="readonly"  value="<fmt:formatDate value="${beca.fechaAlta}" pattern="dd/MM/yyyy"/>" /></td>
	    </tr>	
		<tr>
			<td>Comentarios:</td>
		   	<td><textarea cols="60" rows="5" readonly="readonly" name="comentarios" name="comentarios" onkeypress="chequearLongitud(this);">${beca.comentarios}</textarea></td>
		</tr>		
      	<tr>
        <td>&nbsp;</td>
     	   <td>&nbsp;</td>
      	</tr>
      	<tr>
        	<td colspan="2">
				
</table>	
</fieldset>
<table width="800" border="0" align="left" cellpadding="0" cellspacing="0" id="table-botons-small">
         <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      	</tr>
        <tr>
    	   	<td width="50" height="0" align="left" valign="middle">
           	<input type="hidden" value="${beca.id}" name="idBeca"/>
        	<c:if test="${beca.id != null}">
	 		
			</c:if></td>
 	      	<td width="50" align="left" valign="middle"><c:if test="${beca.id == null}">
			
			</c:if></td>
			<!-- td width="50" align="left" valign="middle"><input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../beca/listaBecasView.do'; return false;" /></td-->
       		<td width="600" height="30" align="left" valign="middle">&nbsp;</td>
   		</tr>

		 	</table>      	
</div>	
<input name="idPadrino" id="idPadrino" type="hidden" value="${beca.padrino.id}">
	</form>
	

</body>
</html>