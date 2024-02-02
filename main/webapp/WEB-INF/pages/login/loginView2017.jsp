<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<link rel="stylesheet" href="<c:url  value="/static/css/ui-lightness/jquery-ui-1.8.5.custom.css"/>"	media="all"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>..:: Login ::..</title>
<style>
#html { background:#EFEEEE; }
#body {
    margin:50px auto;
    width: auto;
    height:auto;
    background:#EFEEEE;
}
#header-photo-logo {
	position: relative;
	clear: both;
	margin: 0px;
	height: 100px;
	width: 180px;
	background: #EFEEEE url(../static/images/logocimientos.jpg);
}ARAPPS01
</style>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; font:italic;  padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
<script>
  $(document).ready(function(){
    $("#loginView").validate();
  });
  var esIE6 = false;
  var esIE7 = false; 
  function navegador(){
  	esIE6 = false;
	esIE7 = false;
	esIE8 = false;
	safari = false;
	user = navigator.userAgent.toLowerCase();
	if(user.indexOf("msie 6") != -1) {
		esIE6 = true;
	}else if(user.indexOf("msie 7") != -1){
		esIE7 = true;
	}else if(user.indexOf("msie 8") != -1){
		esIE8 = true;
	}else if(user.indexOf("safari") != -1){
		safari = true;
	}
  } 
  
	function inicio(){
 		if (esIE6 || esIE7 || safari){
 			document.getElementById('div_mensaje_navegador').style.display = 'none';
 			document.getElementById('principal').style.display = 'inline';
 		}else if(esIE8){
 			document.getElementById('div_mensaje_IE8').style.display = 'inline';
 			document.getElementById('principal').style.display = 'none';
 
 	 	 	}else{
 			document.getElementById('div_mensaje_navegador').style.display = 'inline';
 			document.getElementById('principal').style.display = 'none';
 				}
 	}  
</script>
</head>
<body onload="javascript:navegador(); inicio();">
	<div>
		<c:if test="${param.error != null}">
			<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
			<p><span class="ui-icon ui-icon-alert"
				style="float: left; margin-right: .3em;"></span> <strong><s:message code="${param.error}"/></strong></p>
			</div>
		</c:if>
		<c:if test="${param.mensaje != null}">
		<div class="ui-widget"> 
			<div class="ui-state-highlight ui-corner-all"
				style="margin-top: 10px; padding: 0 .7em;">
			<p><span class="ui-icon ui-icon-info"
				style="float: left; margin-right: .3em;"> </span> 
				<strong><s:message code="${param.mensaje}"/></strong></p>
			</div>
			</div>
		</c:if>
	</div>
	<div id="principal">
	
		<form method="post" id="loginView" action="<c:url value='/j_spring_security_check'/>"> 	
			<br /><br /><br /><br />		
			<table align="center" border="1" cellspacing="0">	
				<tr>
					<td align="center">						
						<div style="background-image: url('../static/images/loginHeader.JPG'); height: 149px; width: 592px; padding: 0px;">
							<table align="center" border="0" cellspacing="0">
						 		<tr>
									<td align="left" valign="top" height="74" width="291"></td>
						  			<td></td>
								</tr>
								<tr>
						  			<td></td>
						  			<td align="right" valign="middle" height="74" width="291">
										<font color="#99135E" style="font-size:18pt; font: oblique">Fénix - Testing</font> <font size="1" color="black">v.2.20180220</font>
						  			</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>			
				<tr>
					<td>
						<div style="background-color: #b37fa5; height: 185px; _width:500px width: 553px; padding: 20px; ">					
							<table align="center">
								<tr>
									<td align="right">
										<h3><label><b><font color="#E3D7E2" style="">Login</font></b></label></h3> 
									</td>
								</tr>
								<tr>
									<td >
										<span style="position: relative; _width:400px width:500px;">						
											<br/>
											<p> 
												<label class="ui-content" for="j_username"><b><font color="#E3D7E2" style="font: italic">Usuario</font></b></label> 
												<input name="j_username" id="j_username" class="required" /> 
											</p> 
											<p> 
												<label for="j_password"><b><font color="#E3D7E2">Contraseña</font></b></label> 
												<input type="password" id="j_password" maxlength="12" name="j_password" class="required" /> 
											</p>
											
											<p align="center">
									        	<input type="submit" value="Ingresar" class="ui-state-default ui-corner-all"/>								
											</p>					
										</span>											
									</td>
								</tr>
							</table>			 	
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="div_mensaje_navegador" style="display:none; text-align: center">
		<table align="center" border="1" cellspacing="0" >
			<tr>
				<td align="center">
					<label style="text-align: center; font-family: tahoma; font-size: 12px; color:red">
						Para poder utilizar correctamente esta aplicación debes instalar un plugin siguiendo el instructivo que te fue enviado por mail o bien ingresar a la aplicación utilizando Internet Explorer.
					</label>
				</td>
			</tr>
		</table>
	</div>
	<div id="div_mensaje_IE8" style="display:none; text-align: center">
		<table align="left" border="0" cellspacing="0" >
			<tr>
				<td nowrap="nowrap" align="center">
					<label >
						Para poder utilizar correctamente esta aplicación debes presionar el ícono que se encuentra arriba a la derecha de la barra de direcciones "Compatibilidad...." 
					</label>
				</td>
			</tr>
			<tr>
				<td align="center">
					<div style="background-image: url('../static/images/vistaCompatibilidad.png'); height: 114px; width: 545px; padding: 0px">
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>