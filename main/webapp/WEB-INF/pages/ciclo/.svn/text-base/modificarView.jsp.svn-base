<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Modificar Ciclo ::..</title>
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script> 
<script type="text/javascript" src="<c:url value="/static/js/table/funcionesTabla.js"/>"></script>
<script type="text/javascript">
var oTable;

$(document).ready(function() {
	
	 oTable = $('#laTabla').dataTable({
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="25">25</option>' +
		'<option value="50">50</option>'+
		'<option value="75">75</option>'+
		'<option value="100">100</option>'+
		'<option value="-1">Todos</option>'+
		'</select> registros por hoja',
		"sZeroRecords": "No se encontraron registros",
		"sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
		"sInfoEmtpy": "Mostrando 0 registros",
		"sInfoFiltered": "(filtrado de _MAX_ registros totales)",
		"sSearch": "Buscar",
		"oPaginate": {
			"sFirst":    "Primera",
			"sPrevious": "Anterior",
			"sNext":     "Siguiente",
			"sLast":     "Ultima"
		}
		
		},
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25,
		"sDom": '<"H"l>rt<"F"ip>'
		                    		
	});
	


} );
</script>
 <script>
  $(document).ready(function(){
    $("#modificarCiclo").validate();
    $('#fechaInicio').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'2000:2100'
	});
	$('#fechaFin').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'2000:2100'
	});
	$('#fecha1IS2').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'2000:2100'
	});
	$('#fecha2IS2').datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange:'2000:2100'
		});	
	$('#fechalimite1').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'2000:2100'
	});
	$('#fechalimite2').datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange:'2000:2100'
		});
	$('#fecha1T').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'2000:2100'
	});
	$('#fecha2T').datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange:'2000:2100'
		});
	$('#fecha3T').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'2000:2100'
	});			
  });
 </script>
 <script type="text/javascript">
function enviarForm(action, id){
	if(action=='modificar'){
		document.forms['periodoForm'].action = "../ciclo/modificarPeriodoView.do";
		document.forms['periodoForm'].idPeriodo.value = id;
		document.forms['periodoForm'].submit();
	}else if(action=='eliminar'){
		jConfirm('Esta seguro de que desea eliminar el periodo ?', 'Confirmación', function(result){
		    if (result) {
		    	document.forms['periodoForm'].action = "../ciclo/eliminarPeriodo.do";
		    	document.forms['periodoForm'].idPeriodo.value = id;
		    	document.forms['periodoForm'].submit();
		    } else {
		      return false;
		    }
		  });
		
	}else if(action=='agregarPeriodo'){
		document.forms['periodoForm'].action = "../ciclo/registrarPeriodoView.do";
		document.forms['periodoForm'].idCiclo.value = id;
		document.forms['periodoForm'].submit();
	}else if(action=='modificarCiclo'){
		document.forms['periodoForm'].action = "../ciclo/modificar.do";
		document.forms['periodoForm'].idCiclo.value = id;
		document.forms['periodoForm'].submit();
	}
}
</script>
</head>
<body>
<div id="main-content">
<form:form name="periodoForm" method="post">

    <c:set var="editable" value="${ciclo.estado.id != 2 && ciclo.estado.id != 3 }"></c:set>
    <h1><c:if test="${!editable}">Informaci&oacute;n</c:if> <c:if test="${editable}">Modificaci&oacute;n</c:if> de Ciclo</h1>
 
    <table width="200" border="0" align="left" cellpadding="0" id="table-forms">
   		<tr>
	        <td width="200"><label>Nombre:</label></td>
	        <td width="600">
	        	<c:if test="${!editable}">
	        		<label>${ciclo.nombre}</label>
	        	</c:if>
	        	<c:if test="${editable}">
	        		<input name="nombre"  <c:if test="${!editable}">readonly="readonly"</c:if> id="nombre" type="text" value="${ciclo.nombre}" class="text-input required"/>
	        	</c:if>
	        </td>
	    </tr>
	        
    	<tr>
        	<td><label>Fecha Inicial:</label></td>
        	<td>
        	<c:if test="${!editable}">
        		<label><fmt:formatDate value="${ciclo.fechaInicio}" pattern="dd/MM/yyyy "/></label>
        	</c:if>
        	<c:if test="${editable}">
        		<input type="text" name="fechaInicio" id="fechaInicio" value="<fmt:formatDate value="${ciclo.fechaInicio}" pattern="dd/MM/yyyy "/>" class="text-input required" />
			</c:if>
			</td>	   
	    </tr>
	    
	    <tr>
        	<td><label>Fecha de Fin:</label></td>
        	<td>
       	 	<c:if test="${!editable}">
        		<label><fmt:formatDate value="${ciclo.fechaFin}" pattern="dd/MM/yyyy "/></label>
        	</c:if>
        	<c:if test="${editable}">        
        		<input type="text" name="fechaFin" id="fechaFin" value="<fmt:formatDate value="${ciclo.fechaFin}" pattern="dd/MM/yyyy "/>" class="text-input required" />
			</c:if>
			</td>	   
	    </tr>
	    
   		<tr>
	        <td><label>Monto Beca:</label></td>
	        <td>
	        	<c:if test="${!editable}">
	        		<label>${ciclo.montoBeca}</label>
	        	</c:if>
	        	<c:if test="${editable}">	
	        		<input type="text" name="montoBeca" onkeypress="return validarDecimal(event, this);"  id="montoBeca" value="${ciclo.montoBeca}" class="text-input required">
	         	</c:if>
	         </td>
	    </tr>
	     
      		     
	    <tr>
        	<td><label>Primer Fecha IS2</label></td>
        	<td>
        	<c:if test="${!editable}">
        		<label><fmt:formatDate value="${ciclo.fecha1IS2}" pattern="dd/MM/yyyy "/></label> 
	   		 </c:if>
	   		 <c:if test="${editable}">
				<input type="text" class="text-input required" value="<fmt:formatDate value="${ciclo.fecha1IS2}" pattern="dd/MM/yyyy "/>" id="fecha1IS2" name="fecha1IS2"/>
	    	</c:if>	
	   		 </td>   
	   </tr>
	   
	   <tr>
	    	<td><label>Primer Fecha Límite</label></td>
	    	<td>
	    	<c:if test="${!editable}">
	    		<label><fmt:formatDate value="${ciclo.fechalimite1}" pattern="dd/MM/yyyy "/></label>
	    	</c:if>
	    	<c:if test="${editable}">
	    		<input type="text" name="fechalimite1" id="fechalimite1" class="text-input required" value="<fmt:formatDate value="${ciclo.fechalimite1}" pattern="dd/MM/yyyy "/>" />    
	    	</c:if>
	    	</td>
		   	    
		</tr>
	    
	    <tr>
        	<td><label>Segunda Fecha IS2</label></td>
        	<td>
        	<c:if test="${!editable}">
        		<label><fmt:formatDate value="${ciclo.fecha2IS2}" pattern="dd/MM/yyyy "/></label> 
	   		 </c:if>
	   		 <c:if test="${editable}">
				<input type="text" class="text-input required" value="<fmt:formatDate value="${ciclo.fecha2IS2}" pattern="dd/MM/yyyy "/>" id="fecha2IS2" name="fecha2IS2"/>
	    	</c:if>	
	    	</td>
	    </tr>
	    
	    <tr>
	    	<td><label>Segunda Fecha Límite</label></td>
	    	<td>
	    	<c:if test="${!editable}">
	    		<label><fmt:formatDate value="${ciclo.fechalimite2}" pattern="dd/MM/yyyy "/></label>
	    	</c:if>
			<c:if test="${editable}">    
        		<input type="text" name="fechalimite2" id="fechalimite2" class="text-input required" value="<fmt:formatDate value="${ciclo.fechalimite2}" pattern="dd/MM/yyyy "/>" />	    	
	    	</c:if>	
	    	</td>    	
      	</tr>
      	
      	<tr>
        	<td><label>Fecha 1º Trimestre</label></td>
	    	<c:if test="${!editable}">
        		<td><label><fmt:formatDate value="${ciclo.fecha1T}" pattern="dd/MM/yyyy "/></label></td>
	    	</c:if>
	   		<c:if test="${editable}">
				<td>
					<input type="text"  class="text-input required" value="<fmt:formatDate value="${ciclo.fecha1T}" pattern="dd/MM/yyyy "/>" 
						id="fecha1T" name="fecha1T"/>
				</td>	    
	    	</c:if>	    
		</tr>
      	
      	<tr>
        	<td><label>Fecha 2º Trimestre</label></td>
	    
	    	<c:if test="${!editable}">
	    		<td><label><fmt:formatDate value="${ciclo.fecha2T}" pattern="dd/MM/yyyy "/></label></td>
	    	</c:if>
	   		<c:if test="${editable}">
	    		<td>
					<input type="text"  class="text-input required" value="<fmt:formatDate value="${ciclo.fecha2T}" pattern="dd/MM/yyyy "/>" 
						id="fecha2T" name="fecha2T"/>
				</td>	    
	    	</c:if>	
      	</tr>
      	
      	<tr>
        	<td><label>Fecha 3º Trimestre</label></td>
	    	<c:if test="${!editable}">
	    		<td><label><fmt:formatDate value="${ciclo.fecha3T}" pattern="dd/MM/yyyy "/></label></td>	    
		    </c:if>
		   	<c:if test="${editable}">
				<td>
					<input type="text"  class="text-input required" value="<fmt:formatDate value="${ciclo.fecha3T}" pattern="dd/MM/yyyy "/>" 
						id="fecha3T" name="fecha3T"/>
				</td>	    
	    	</c:if>	
      	</tr>
      	
      	<tr>
      		<td>&nbsp;</td>
     	    <td>&nbsp;</td>
      	</tr>
      	
		<tr>
			<td style="vertical-align: top" colspan="2">
			<!-- Titulo de la Tabla -->
			<div class="ui-state-default ui-corner-all" align="center">
			<h2 align="center">Periodos</h2>
			</div>
			<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" style="background-color: #C0C2FF"> 
			<thead align="center">
			<tr id="fxs" style="display: none;">
					
					<c:forEach begin="0" end="2" var="loop">
						<td>
							<div class="ui-state-default ui-corner-all" style="height: 40px;">
								<div title="subtotalizar columna"> 
									<a href="#ancla" onclick="subtotalizarColumna(${loop})">subtotalizar</a>				
								</div>
								<div title="agrupar columna"> 
									<a href="#" onclick="agruparColumna(${loop})">agrupar</a>				
								</div>
							</div>
						</td>
					</c:forEach>
						<td>
						<div class="ui-state-default ui-corner-all" style="width: auto; height: 40px;">
						</div>
					</td>
				</tr>
				<!-- Botones para mostrar funciones	-->
				<tr>
					<c:forEach begin="0" end="2">
						<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
							<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
							</span></a></div>
						</td>
					</c:forEach>
				</tr>
				<!-- Columnas -->
				<tr>
					<th>Nombre</th>
					<th>Fecha Inicial</th>
					<th>Fecha de Finalización</th>
					<c:if test="${editable}">
						<th>Acciones</th>
					</c:if>
				</tr>    	    
	    		<tr>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>	
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				</tr>
				</thead>
	   			<tbody align="center">
					<c:forEach items="${ciclo.periodos}" var="periodo">
						<tr>
							<td align="center" valign="top" style="font-size: 14px">&nbsp;${periodo.nombre}&nbsp;</td>
							<td align="center" nowrap="nowrap"  style="font-size: 14px; font-weight: bold">&nbsp;
								  <fmt:formatDate value="${periodo.fechaInicio}" pattern="dd/MM/yyyy"/>&nbsp;
							</td>
							<td align="center" nowrap="nowrap"  style="font-size: 14px; font-weight: bold">&nbsp;
								<fmt:formatDate value="${periodo.fechaFin}" pattern="dd/MM/yyyy"/>&nbsp;
							</td>
							<td align="center"  style="border: 0">
							<table>
								<c:if test="${editable}">
									<tr>
									<td>
										<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
											<a  onclick="enviarForm('modificar','${periodo.id}')"> 
											<span class="ui-icon ui-icon-pencil" > 
											</span></a>				
										</div>
									</td>
									<td>
										<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
											<a  onclick="enviarForm('eliminar','${periodo.id}')" > 
											<span class="ui-icon ui-icon-trash" > 
											</span></a>				
										</div>
									</td>
									</tr>
									</c:if>	
									</table>
									</c:forEach>
								</tbody>
							</table>
    
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
        	<table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
          	<tr>
          	<c:if test="${ciclo.estado.id != 2 && ciclo.estado.id != 3 }">
            	<td width="50" height="0" align="center" valign="middle"><input class="ui-state-default ui-corner-all " onclick="enviarForm('modificarCiclo','${ciclo.id}')"  type="button" value="Modificar Ciclo" /></td>
            	<td width="50" align="center" valign="middle"><input type="button" value="Agregar Periodos" class="ui-state-default ui-corner-all" onclick="enviarForm('agregarPeriodo','${ciclo.id}')" /></td>
            </c:if>	
            	<td width="50" align="center" valign="middle"><input type="button" value="Volver" class="ui-state-default ui-corner-all" onclick="location.href='../ciclo/listaCiclos.do'; return false;" /></td>
            	<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
          	</tr>
		 	</table>  
		 	</td>
		 </tr>	    
</table>
<input type="hidden" value="${ciclo.id}" name="idCiclo"/> 
<input type="hidden" value="${periodo.id}" name="idPeriodo"/> 
</form:form>
</div>
</body>
</html>