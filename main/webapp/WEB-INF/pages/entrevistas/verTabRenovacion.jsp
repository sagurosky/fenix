<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table id="table-informe">
	<tr>
		<td nowrap="nowrap" width="28%">
			<label>Prop�sito anual del Acompa�amiento</label>
			<br><font size="1">(Este campo va al Informe)</font>			
		</td>
		<td>
			<form:textarea path="propositoAnioComienza" rows="4" cols="60" disabled="true" cssStyle="width:98%"/>
			
		</td>
	</tr>
	<!-- 
	<tr>	
		<td colspan="2">
			<font size="1">Por favor elige la opci�n que mejor refleje el prop�sito planteado para el a�o que comienza 
							para ser incluido en el Informe a padrino.</font>			
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Prop�sito anual del Acompa�amiento</label></td>
		<td>			
			<form:select path="propositoAnioComienzaList" id="propositoAnioComienzaList" disabled="true" class="required">
				<form:options items="${propositoAnioComienzaList}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	-->
	<tr>
		<td nowrap="nowrap" >
			<label>En el tiempo libre le gusta</label>
			<br><font size="1">(Este campo va al Informe)</font>
		</td>
		<td>			
			<form:select path="gustosTiempoLibre" id="gustosTiempoLibre" disabled="true" class="required">
				<form:options items="${gustosTiempoLibre}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
</table>