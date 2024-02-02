<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@taglib prefix="display" uri="http://displaytag.sf.net"%>
    
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="<c:url value="/static/js/jquery.dialog.detail.js"/>"></script>
<style type="text/css">
	table#exportacion{  
	background-color: #C0C2FF;
	border: 0;
	}
</style>


<script type="text/javascript">
$(function() {
	$("#padrinoBeca").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarPadrinosPorNombre.do?",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.padrinos, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							padrino: item.padrino
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idPadrinoBeca").val(ui.item.id);
			$("#padrinoBeca").text(ui.item.padrino);
		}
	});
});

</script>

<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>

<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de Padrinos</title>

<script type="text/javascript">
function enviarForm(action, id){
	if(action=='modificar'){
		document.forms['padrinoForm'].action = "../perfilPadrino/modificarPadrinoView.do";
		document.forms['padrinoForm'].idPadrino.value = id;
		document.forms['padrinoForm'].submit();
	}else if(action=='eliminar'){
		jConfirm('Esta seguro de que desea eliminar el padrino ?', 'Confirmación', function(result){
		    if (result) {
				document.forms['padrinoForm'].action = "../perfilPadrino/eliminarPadrino.do";
				document.forms['padrinoForm'].idPadrino.value = id;
				document.forms['padrinoForm'].submit();
		    } else {
		      return false;
		    }
		  });
	}else if(action=='alta'){
		document.forms['padrinoForm'].action = "../perfilPadrino/altaPadrinoView.do";
		document.forms['padrinoForm'].submit();
	}
	
}

function validarFiltros(){
	
	if($('#cuitCuil').val() == ''){
		$('#cuitCuil').removeAttr('value');
	}
	if($('#padrinoBeca').val() == ''){
		$('#idPadrinoBeca').removeAttr('value');
	}
	document.forms['padrinoForm'].action = "../perfilPadrino/listaPadrinosView.do";	
	document.forms['padrinoForm'].submit();
	
}
</script>

<script type="text/javascript">
    var confirmed = false;
    $(function () {
        /* Search functionality */
        var oTable = $('#padrino').dataTable({
            "bPaginate":false,
            "bLengthChange":false,
            "bFilter":true,
            "bSort":false,
            "bInfo":false,
            "bAutoWidth":false,
            "bStateSave":false
        });
        $("thead input").keyup(function () {
            /* Filter on the column (the index) of this element */
            oTable.fnFilter(this.value, $("thead input").index(this));
        });


        $("thead input").focus(function () {
            if (this.className == "search_init") {
                this.className = "";
                this.value = "";
            }
        });


        $("thead input").blur(function (i) {
            if (this.value == "") {
                this.className = "search_init";
                this.value = asInitVals[$("thead input").index(this)];
            }
        });
    });
</script>

</head>
<body>

<br><br>
<center><h3>Listado de Padrinos</h3></center>
<br><br>
<form method="post" id="padrinoForm" name="padrinoForm" action="<c:url value="/perfilPadrino/listaPadrinosView.do"/>">
<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:980px;">
<table id="table-informe" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">

		<tr align="center">

			<td align="left" style="font-size: 13px; font-weight: bold">CUIT/CUIL:</td>
			<td align="left">
				<input type="text" id="cuitCuil" value="${cuitCuil}" name="cuitCuil" size="21" maxlength="11">
			</td>
		</tr>
		<tr align="center">

			<td align="left" style="font-size: 13px; font-weight: bold">Padrino:</td>
			<td align="left">
				<input type="text" id="padrinoBeca" value="${padrinoBeca}" name="padrinoBeca" size="21">
				<input value="${idPadrinoBeca}" name="idPadrinoBeca" id="idPadrinoBeca" type="hidden">
			</td>
		</tr>
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Tipo Padrino:</td>
			<td align="left">
					 <select id="tipoId" name="tipoId" class="required" style="width:150px;">
						<option value="0">Todos</option>
						<c:forEach var="tipo" items="${tipos}">
							<c:if test="${tipo.id == tipoId}">
								<option selected="selected" id="tipo" value="${tipo.id}">${tipo.valor}</option>
							</c:if>
							<c:if test="${tipo.id != tipoId}">
							<option id="tipo" value="${tipo.id}">${tipo.valor}</option>
							</c:if>
						</c:forEach>
 					</select>
			</td>
		</tr>	
		<tr align="center">
			<td colspan="4">
				<input align="middle" id="buscar" type="submit" onclick="validarFiltros()" value="Buscar" class="ui-state-default ui-corner-all" ></input>
			</td>
		</tr>			

	</table>
	</fieldset>
<br><br>
<CENTER style="width: 1100px;">
	<table align="center">
		<tr>
			<td>
				<input align="middle" id="buscar" type="button" value="Alta" style="width:60px;height:23px;font-size: 15px" class="ui-state-default ui-corner-all" onclick="enviarForm('alta','')" ></input>
			</td>
		</tr>
	</table>
	<br>
<display:table export="true" class="displayTags_wrapper" style="font-size: 12px; margin-left: 50px; margin-right: 50px;width:1000px; background-color: #C0C2FF;"  id="padrino" name="padrinos" requestURI="" pagesize="50">  
    
    
    <display:column property="cuilCuit"   title="CUIT/CUIL" />
    <display:column property="nombre" title="Nombre" />
    
    <display:column   title="Id Plat" sortProperty="idPlataforma" headerClass="sortable">
    	${padrino.nroCtesPlataformaContable}
    </display:column>
    
    
    
    <display:column property="tipo"   title="Tipo" />
	<display:column  title="Fecha Alta"><fmt:formatDate value='${padrino.fechaAlta}' pattern='dd/MM/yyyy'/> </display:column>
	<display:column title="Acciones" media="html">
				<table>
				<tr>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('modificar','${padrino.id}')"> 
						<span class="ui-icon ui-icon-pencil" > 
						</span></a>				
					</div>
				</td>
			
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('eliminar','${padrino.id}')" > 
						<span class="ui-icon ui-icon-trash" > 
						</span></a>				
					</div>
				</td>	
				</tr>
				</table>	
	</display:column>
				

    <display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.item_name" value="padrino" />  
    <display:setProperty name="paging.banner.items_names" value="padrinos" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
	<display:setProperty name="export.excel.filename" value="padrinos.xls" />
	
</display:table>
<br><br>
<table align="center">
	<tr>
		<td>
			<input align="middle" id="buscar" type="button" value="Alta" style="width:60px;height:23px;font-size: 15px" class="ui-state-default ui-corner-all" onclick="enviarForm('alta','')" ></input>
		</td>
	</tr>
</table>
</CENTER>
<input type="hidden" name="idPadrino" />
</form>

<center>
</center>
</body>
</html>

