<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="mif" uri="/list-operator.tld" %>

<script type="text/javascript">
function enableDisableAbondono(value){
	if(value == "true"){
		$('#idAnioAbandono').removeAttr('disabled');
		$('#idAnioAbandono').addClass('required');
		$('#motivoAbandono').removeAttr('disabled');
	}else{
		$('#idAnioAbandono').attr('disabled','disabled');
		$('#idAnioAbandono').removeClass('required');
		$('#motivoAbandono').attr('disabled','disabled');
		$('#motivoAbandono').val('');
	}
}

function enableDisableInput(value){
	if(value == "true"){
		$('#idAnioRepitio').removeAttr('disabled');
		$('#idAnioRepitio').addClass('required');
		$('#motivoRepitencia').removeAttr('disabled');
		
	}else{
		$('#idAnioRepitio').attr('disabled','disabled');
		$('#idAnioRepitio').removeClass('required');
		$('#motivoRepitencia').attr('disabled','disabled');
		$('#motivoRepitencia').val('');
	}
}
</script>
    
<table align="left">
  <tr>
  		<td colspan="3"></td>
  </tr>
  <tr>
    <td>
    	<table>    		
   			<c:if test="${accion == 'ver' && !empty aniosRepitio}">
   				<tr>
	    			<td valign="top" align="left" colspan="2">
				    	<p>
				    		<label>Repitió</label>
				    			Si<input type="radio" id="entrevistaSeleccion.repitio" name="entrevistaSeleccion.repitio" 
								  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.repitio}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="true"> 
								No<input type="radio" id="entrevistaSeleccion.repitio" name="entrevistaSeleccion.repitio"
								  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.repitio == false}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="false">
						</p>
	    			</td>
    			</tr>
    			<tr>    			
	    			<td valign="top" colspan="2">
				    	<p>
				    		<label>Años que repitió</label>
				    			<textarea rows="4" cols="40">${aniosRepitio}</textarea>									
						</p>
	    			</td>
    			</tr>
   			</c:if>
   			<c:if test="${accion != 'ver' || (accion == 'ver' && empty aniosRepitio)}">
   				<tr>
	    			<td valign="top" align="left">
				    	<p>
				    		<label>Repitió</label>
				    			Si<input type="radio" id="entrevistaSeleccion.repitio" name="entrevistaSeleccion.repitio" 
								  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.repitio}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="true"> 
								No<input type="radio" id="entrevistaSeleccion.repitio" name="entrevistaSeleccion.repitio"
								  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.repitio == false}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="false">
						</p>
	    			</td>
	    			<td valign="top">
				    	<p>
				    		<label>&nbsp;&nbsp;Años que repitió</label>
							<form:select path="idAnioRepitio" multiple="multiple" size="4" disabled="disabled">
								<form:options items="${listAnioEscolar}" itemLabel="valor" itemValue="id"/>		
							</form:select>					
						</p>
	    			</td>
    			</tr>
    		</c:if>
    		<tr>
    			<td colspan="2">
					<p>
						<label>Motivo de repitencia</label>
							<form:textarea path="entrevistaSeleccion.motivoRepitencia" rows="4" cols="40" disabled="true" id="motivoRepitencia" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
					</p>
    			</td>
    		</tr>
    		<c:if test="${accion == 'ver' && !empty aniosAbandono}">
	    		<tr>
					<td valign="top" align="left" colspan="2">
					    <p>
						    <label>Abandonó</label>
								Si <input type="radio" id="abandonoAnio" name="entrevistaSeleccion.abandono" 
								<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono}"> checked="checked"</c:if> onclick="enableDisableAbondono(this.value)"  value="true" > 
								No<input type="radio" id="abandonoAnio1" name="entrevistaSeleccion.abandono"
								<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono == false}"> checked="checked"</c:if> onclick="enableDisableAbondono(this.value)" value="false" >
						</p>
					</td>
				</tr>
				<tr>
					<td valign="top" colspan="2">				    
				    	<p>
				    		<label>Años que abandono</label>
					 			<textarea rows="4" cols="40">${aniosAbandono}</textarea>			
						</p>
		    		</td>
			    </tr>
	    		</c:if>
    			<c:if test="${accion != 'ver' || (accion == 'ver' && empty aniosAbandono)}">
	    			<tr>
						<td valign="top" align="left">
						    <p>
							    <label>Abandonó</label>
									Si <input type="radio" id="abandonoAnio" name="entrevistaSeleccion.abandono" 
									<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono}"> checked="checked"</c:if> onclick="enableDisableAbondono(this.value)"  value="true" > 
									No<input type="radio" id="abandonoAnio1" name="entrevistaSeleccion.abandono"
									<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono == false}"> checked="checked"</c:if> onclick="enableDisableAbondono(this.value)" value="false" >
							</p>
						</td>
						<td valign="top">	
					    	<p>
					    		<label>&nbsp;&nbsp;Años de abandono</label>
								<form:select path="idAnioAbandono" multiple="multiple" size="4" disabled="disabled">
									<form:options items="${listAnioEscolar}" itemLabel="valor" itemValue="id"/>		
								</form:select>
							</p>
						</td>
					</tr>
				</c:if>
	  			<tr>
				  	<td colspan="2">
				  		<p>
				    		<label>Motivo de abandono</label>
				    			<form:textarea path="entrevistaSeleccion.motivoAbandono" rows="4" cols="40" id="motivoAbandono" disabled="true" onkeypress="chequearLongitud(this);" onblur="chequearLongitud(this);"/>
								< name="idConducta" id="conducta" value="0">
						</p>
				  	</td>
	 			</tr>
				<tr>
				    <td colspan="2">
				    	<p>
				    		<label>Conducta</label>
				    			<select name="idConducta" id="conducta">
				    				<option value="">Seleccione una opci&oacute;n:</option>
				    				<c:forEach items="${listConducta}" var="conducta">
				    					<c:choose>
											<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.conducta.id == conducta.id}">
												<option value="${conducta.id}" selected="selected">${conducta.valor}</option>
											</c:when>
											<c:otherwise>
												<option value="${conducta.id}">${conducta.valor}</option>
											</c:otherwise>	
										</c:choose>
				    				</c:forEach>
				    			</select>
						</p>
				    </td>
				</tr>
			</table>