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

<title>Alta Staff Cimientos</title>

<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<style type="text/css">
	label { width: 14em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
 	legend { width: 9em; float: left;font-size: 15px;padding-left: .1em}
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
	select { width: 140px }
</style>

<script>
var arrayBanco = new Array();

  $(document).ready(function(){
	  
    $("#altaPerfilStaff").validate();
    
    $("#fechaIngreso").datepicker({
    	  changeMonth: true,
    	  changeYear: true
    	  });
    
    $("#fechaBaja").datepicker({
  	  changeMonth: true,
  	  changeYear: true
  	  }); 
    
  });

function buscarSucursalesBanco(idBanco){
		
		$.ajax({
			url: "../ajax/buscarSucursalPorBancoID.do?bancoID="+idBanco,
			dataType: "json",
			data: {
				style: "full"
			},
			success:
				function(data) {
				$('#removerOption').remove();
					for(var i= 0 ; i < data.sucursales.length ; i++){
						arrayBanco[data.sucursales[i].id] = data.sucursales[i].banco; 		
						//Este metodo es que el popula el combo de sucursales
						populateComboSucursal(data.sucursales[i].id,data.sucursales[i].nombre);
					}
				
				}
		});
}
  
 function populateComboSucursal(idSucursal,nombre){
		
		var option = document.createElement('option');
		option.id="removerOption";
		option.text=nombre;
		option.title=nombre;
		option.value=idSucursal;
		var select=document.getElementById("sucursalID");
		try
		  {
		  	select.add(option,null); 
		  }
		catch(ex)
		  {
		  	select.add(option); 
		  }
}
</script>
 
<script>

$(function() {
	  $("#cuit_cuil").blur(function(evt) {
	    evt.preventDefault()   // make sure the hyperlink doesn't work per se
	    $.ajax( {
	      type: "GET",
	      url: "../ajax/validarCuilPersona.do",
	      data: { cuit_cuil: $("#cuit_cuil").val() },
	      dataType: "json",
	      success: function(data) {
	        if(!(data.existePersona)){
	        	url = "../persona/registrarPersonaView.do?popup=true&cuil="+document.getElementById("cuit_cuil").value;
	    		window.open(url, '_blank','width=600, height=650 ,scrollbars=YES');
	        	return false;
	        }
	      }
	    } )
	  })
	})

	
</script>
 
</head>

<body>

<form:form id="altaPerfilStaff" commandName="perfilStaff" modelAttribute="perfilStaff" cssClass="cmxform" action="guardarPerfilStaff.do" method="post">

<div id="main-content">
	<fieldset>
		<legend>Alta Staff Cimientos</legend>
	    <table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
	    	<tr>
		        <td>
		        	<p>
			        	<label>CUIL *</label>
			       		<input type="text" id="cuit_cuil" name="cuit_cuil" class=" required" value="${cuit_cuil}" maxlength="11">
		       		</p>	
		       	</td>
		    </tr>
		    <tr>
		    	<td>
		    		<p>
		    		<label>Banco *</label>
		    		<select name="bancoID" id="bancoID" class="required" onchange="buscarSucursalesBanco(this.value)">
				    	<option></option>
							<c:forEach var="banco" items="${bancos}" >
								<option value="${banco.id}">${banco.nombre}</option>
							</c:forEach>
				    </select>
		    		</p>
		    	</td>
		    </tr>
		    <tr>
		    	<td>
		    		<p>
		    		<label>Sucursal *</label>
		    		<select name="sucursalID">
		    		
		    		</select>
		    		</p>
		    	</td>
		    </tr>
		    <tr>
		        <td>
		        	<p>
		        		<label>Nro Cuenta </label>
	        			<input type="text" name="nroCuenta" id="nroCuenta" class="digits" />
	        		</p>	
	        	</td>
		    </tr>
		    <tr>
		        <td>
		        	<p>
			        	<label>Modalidad Contrataci&oacute;n *</label>
				          <select name="modalidadContratacionID" id="modalidadContratacion" class="required">
				            <option></option>
				            <c:forEach var="modalidad" items="${modalidadesContratacion}" >
								<option value="${modalidad.id}">${modalidad.valor}</option>
							</c:forEach>
				          </select>
				    </p>      
		        </td>
	      	</tr>
	      	<tr>
	      		<td>
	      			<p>
	      			<label>Dedicaci&oacute;n *</label>
	      			<select name="cargaHorariaID" id="cargaHoraria" class="required">
				        <option></option>
				        <c:forEach var="carga" items="${cargasHorarias}" >
							<option value="${carga.id}">${carga.valor}</option>
						</c:forEach>
				    </select>
	      			</p>
	      		</td>
	      	</tr>
		    <tr>
		        <td>
		        	<p>
		        	<label>Legajo</label>
		        	<input type="text" name="legajo" id="legajo" class="digits"/>
		        	</p>
		        </td>
		    </tr>
		    <tr>
		    	<td>&nbsp;</td>
		    </tr>
			<tr>
				<td>
					<table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
				    	<tr>
				            <td width="50" height="0" align="center" valign="middle"><input type="reset" class="ui-state-default ui-corner-all" value="Limpiar"/></td>
							<td width="50" height="0" align="center" valign="middle"><input type="submit" value="Guardar" class="ui-state-default ui-corner-all"/></td>
							<td width="50" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
						       													 onclick="location.href='../perfilStaff/listaPerfilStaff.do'; return false;"/></td>
				            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
						</tr>		
					</table> 
				</td>
			</tr>
		</table>
	</fieldset>
</div>
</form:form>	

</body>
</html>