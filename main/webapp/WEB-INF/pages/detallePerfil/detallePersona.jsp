<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <table border="0">
       <thead>
   		<tr>
  			<td colspan="2">
				<label id="label">Datos Personales</label>
			</td>
		</tr>
		<tr>
		    <td  width="160px">
			<label id="label">Cuil-Cuit:</label>
			</td>
			<td  width="600px">
			<label>${persona.cuilCuit}</label>  
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Nombre:</label>
			</td>
			<td>
			<label>${persona.nombre}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Apellido:</label>
			</td>
			<td>
			<label>${persona.apellido}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">DNI:</label>
			</td>
			<td>
			<label>${persona.dni}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Direccion:</label>
			</td>
			<td>
			<label>${persona.direccion}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Codigo Postal:</label>
			</td>
			<td>
			<label>${persona.codigoPostal}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Telefono:</label>
			</td>
			<td>
			<label>${persona.telefono}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Celular:</label>
			</td>
			<td>
			<label>${persona.celular}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Fecha de Nacimiento:</label>
			</td>
			<td>
			<label><fmt:formatDate value="${persona.fechaNacimiento}" pattern="dd/MM/yyyy"/></label>
		</tr>
		<tr>
			<td>
			<label id="label">Sexo:</label>
			</td>
			<td>
			<label>${persona.sex}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Estado Civil:</label>
			</td>
			<td>
			<label>${persona.estadoCivil.valor}</label>
			</td>
			
		</tr>
		<tr>
			<td>
			<label id="label">Localidad:</label>
			</td>
			<td>
			<label>${persona.localidad.nombre}</label>
			</td>
			

		<tr>
			<td>
			<label id="label">E-mail:</label>
			</td>
			<td>
			<label>${persona.mail}</label>
			</td>
		</tr>					
		
</table>
</html>