<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<script src="<c:url value="/static/js/jquery.filestyle.js" />" type="text/javascript">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Importar Archivo Cuentas</title>

<script type="text/javascript">


var oTable2;
var selected =  new Array();


$(document).ready(function() {

	$('#botonGenerar').click( function() {
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable2));
		if(selected.length < 1){
	        jAlert('warning', 'Por favor seleccione al menos 1 pago.', 'Atención!');
			return false;
		}
		  jConfirm('Esta seguro de que desea generar el archivo de Pagos con los pagos seleccionados?', 'Confirmación', function(result){
			    if (result) {
			    	jQuery("#pagosSeleccionados").val(selected);  
			    	document.forms['form'].action = "../pago/generarArchivoPagos.do";
					document.forms['form'].submit();
					var idBanco = $("#banco").val();
					oTable2.fnReloadAjax( "../pago/obtenerPagosPorBanco.do?idBanco=" + idBanco + "&selectedPagos=" + selected );
			    } else {
			      return false;
			    }
			  });
		
	} );

		$("#banco").change(function(evt) {
			var idBanco = $("#banco").val();
			if(idBanco == 0){
				$("#botonImportar").attr('disabled',true);
			}else{
				$("#botonImportar").attr('disabled',false);
			}	
		})

} );

</script>

<script type="text/javascript" charset="utf-8"> 
  $(function() {     
      $("input.file_1").filestyle({ 
          imageheight : 22,
          imagewidth : 82,
          width : 100
      });
     
  });
</script> 
<style type="text/css"> 
 
.file_1 {
}
#sidebar {
  width: 0px;
}
#content {
  width: 770px;
}
</style> 
  
<style type="text/css">
label { width: 10em; float: left; }
label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
p { clear: both; }
.submit { margin-left: 12em; }
em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
  <script>
  $(document).ready(function(){
    $("#altaCuentas").validate();
  });
  </script>

</head>
<body>
<div id="main-content">
<form method="post" id="altaCuentas" name="altaCuentas" class="cmxform" action="<c:url value="/cuenta/importarArchivo.do"/>" enctype="multipart/form-data">
<br><br>
<center><h3>Importar Archivo Cuentas</h3></center>
<br><br>
	<div id="">
	<table align="center">
		<tr align="center">
			<td class="inicio" align="center" style="font-size: 14px; font-weight: bold">Banco:</td>
			<td align="center">
		         <select id="banco" name="banco" class="required">
						<option value="0" selected="selected">Todos</option>
						<c:forEach var="banco" items="${bancos}">
							<option id="banco" value="${banco.id}">${banco.nombre}</option>
						</c:forEach>
					</select>
			</td>
			<td>
				&nbsp;
				&nbsp;
			</td>
		</tr>
	</table>
	</div>
<br><br>
	<div id="">
	<table align="center">
		<tr align="center">
		<tr align="center">
			<td class="inicio" align="center" style="font-size: 14px; font-weight: bold">Archivo:</td>
			<td align="center">
				<input type="file" name="archivo" class="file_1" />
			</td>
			<td>
				<input  value="Examinar" type="submit" class="ui-state-default ui-corner-all"	/>
				<input id="botonImportar" value="Aceptar" type="submit" class="ui-state-default ui-corner-all" />
				
			</td>
		</tr>
		</tr>
	</table>
	</div>
	 
	
</form>
</div>
</body>
</html>