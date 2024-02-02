<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="springl" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
	..:: Alta de Cuenta ::..
</title>
  <script>
  $(document).ready(function(){
    $('form').validate({    
    	submitHandler: function(form) {
    		var cuilIngresado = $("#prefijoCuil").val() + $("#dniCuil").val()+ $("#postfijoCuil").val();
		    $.ajax( {
			      type: "GET",
			      url: "../cuenta/validarCuilCreacionCuenta.do",
			      data: { cuil: cuilIngresado },
			      dataType: "json",
			      success: function(data) {
			    	var mensaje = "";  
			        if((data.existeCuenta)){
			        	mensaje = "Ya existe un n° de cuenta asociado al cuil ingresado. ";
			        }
			        
		    		jConfirm(mensaje + 'Desea dar de alta esta cuenta?', 'Confirmación', function(result){
					    if (result) {
					    	 form.submit();         

					    } else {
					      return false;
					    }
					  });
			        
			      }
			    } )
    		
    		
    		

    	} 
    });
  });
</script>
<script>

	   
$(function() {
	  $("#banco").change(function(evt) {
	    evt.preventDefault()   
	    $.ajax( {
	      type: "GET",
	      url: "../ajax/obtenerListaSucursales.do",
	      data: { idBanco: $("#banco").val() },
	      dataType: "json",
	      success: function(data) {
	    	  var options = '';
	            options += '<option value="" selected="selected">Seleccione sucursal</option>'
	            $(data.sucursales).each(function() {
	                options += '<option value="' + this.id + '">' + this.numeroSucursal + '</option>';
	            });
	             $("select#sucursal").html(options);
	        	
	      }
	    } )
	  })
	})

</script>
<script>
function completarCuil(dni){
	$('#dniCuil').val(dni);
	
}
</script>
</head>
<body>
<form id="altaCta" name="altaCta" class="cmxform" action="<c:url value='/cuenta/guardarCuenta.do' />" method="post">
<div id="right-content">
    <br />
    <br />
    <h1>Alta de Cuenta</h1>
    <table width="90" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
	    <td width="120">Banco*</td>
        <td width="669">
         <select id="banco" name="banco" class="required">
				<option value="" selected="selected">Seleccione banco</option>
				<c:forEach var="banco" items="${bancos}">
					<option value="${banco.id}">${banco.nombre}</option>
				</c:forEach>
			</select>
        </td>
      	</tr>
<!--      	<tr>-->
<!--	        <td>Sexo</td>-->
<!--	        <td>-->
<!--	        <input id="sexo" type="radio" name="sexo" value="1">M-->
<!--			<input id="sexo" type="radio" name="sexo" value="2">F-->
<!--			</td>       		-->
<!--     	-->
<!--      	</tr>-->
		<tr>
	        <td >Numero de DU</td>
	        <td >
			<input type="text" id="du" name="du" onchange="completarCuil(this.value)" maxlength="8" size="25" class="text-input digits">
			</td>
	    </tr>
		<tr>
	        <td >Numero de CUIL*</td>
	        <td >
			<input type="text"  size="2" maxlength="2" id="prefijoCuil" class="text-input digits required" name="prefijoCuil">&nbsp;-&nbsp;
			<input type="text" size="8" maxlength="8" id="dniCuil" class="text-input digits required" name="dniCuil">&nbsp;-&nbsp;
			<input type="text" size="1" maxlength="1" id="postfijoCuil" class="text-input digits required" name="postfijoCuil">
			</td>
	    </tr>	    
		<tr>
        <td>Numero de cuenta*</td>
        <td><input type="text" id="nroCuenta" name="nroCuenta" class="text-input digits required" size="25"></td>
	    </tr>
      	<tr>
	    <td>Codigo de sucursal*</td>
        <td><label>
         <select id="sucursal" name="sucursal" class="required">
				<option value="" selected="selected">Seleccione sucursal</option>
				<c:forEach var="sucursal" items="${sucursales}">
					<option value="${sucursal.id}">${sucursal.numeroSucursal}</option>
				</c:forEach>
			</select>
        </label></td>
      	</tr>
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
            	<td width="50" align="center" valign="middle"><input class="ui-state-default ui-corner-all " id="boton_alta" type="submit" value="Registrar" /></td>
            	<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
          	</tr>

		 	</table>      
</td>
</tr>				
</table>		
</div>	
		</form>
</body>
</html>