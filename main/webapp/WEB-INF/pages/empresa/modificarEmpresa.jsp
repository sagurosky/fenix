<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value="/static/css/demos.css"/>" media="all" />
<title>..:: Modificar Organizaci&oacute;n ::..</title>
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

</head>
<body >
<div id="main-content">
<fieldset style="font-size: 12px; width:980px;">
<legend>Modificar Organizaci&oacute;n</legend>

<form class="cmxform" id="form1" action="<c:url value='/empresa/modificar.do' />" method="post">
    <table width="90" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
   		
   		<tr>
	        <td width="120">CUIT (*)</td>
	        <td width="680"><input type="text" id="nuevoCuit" maxlength="11" name="cuit" class="text-input digits required" value="${CUIT}"></td>
	    </tr>
    	<tr>
        <td>Denominaci&oacute;n (*)</td>
        <td><input type="text" name="denominacion" id="denominacion" class="text-input required" value="${empresa.denominacion}"/></td>
	    </tr>
	    <tr>
        <td>Contacto (*)</td>
        <td><input type="text" name="contacto1" id="contacto1" class="text-input required" value="${empresa.contacto1}"/></td>
	    </tr>
	   	<tr>
			<td colspan="2">
				<label style="width:980px;font-size:10px;"><b>Recuerda que como destinatario del mail saldrá todo lo que esté antes de la primera coma (,)</b></label>
				
			</td>
		</tr>
	   	<tr>
			<td colspan="2">
				
				<label style="width:980px;font-size:10px;"><b>NO incluir punto y coma en el campo Contacto, ya que el destinatario llegará vacío</b></label>
			</td>
		</tr>
   		<tr>
        <td>Mail de contacto (*)</td>
        <td><input name="mailContacto1" id="mailContacto1" class="text-input required" value="${empresa.mailContacto1}"/></td>
	    </tr>
	    <tr>
			<td colspan="2">
				<label style="width:980px;font-size:10px;"><b>Recuerda que las direcciones de mail deben separarse con punto y coma (;)</b></label>
			</td>
		</tr>
		<tr>
        <td>Fecha de alta (*)</td>
        <td><input id="fechaAlta" name="fechaAlta" class="text-input required" value="<fmt:formatDate value="${empresa.fechaAlta}" pattern="dd/MM/yyyy"/>" /> dd/mm/aaaa<br></td>
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
            	<td width="50" align="left" valign="middle">
            			<c:if test="${empresa.id != null}">
							<input class="ui-state-default ui-corner-all "  type="submit" value="Modificar" />
						</c:if>
						<c:if test="${empresa.id == null}">
							<input class="ui-state-default ui-corner-all "  type="submit" value="Guardar" />
						</c:if>			
				</td>    
				<td width="50" align="left" valign="middle">
				<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../empresa/listaEmpresasView.do'; return false;" />        		
            	</td>
            	<td width="292" height="30" align="left" valign="middle">&nbsp;</td>
          	</tr>
      	
</table>

<input type="hidden" value="${empresa.id}" name="idEmpresa"/>

       
	
</form>
</fieldset>
     
</div>
</body>
</html>