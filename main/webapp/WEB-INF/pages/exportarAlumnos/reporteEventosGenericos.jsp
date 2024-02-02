<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.cimientos.intranet.modelo.evento.eventoGenerico.EventoGenericoDto" %>
<%@ page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css" title="currentStyle">
			@import "/static/DataTables-1.9.4/media/css/demo_page.css";
			@import "/static/DataTables-1.9.4/media/css/demo_table_jui.css";
			@import "/static/DataTables-1.9.4/examples/examples_support/themes/smoothness/jquery-ui-1.8.4.custom.css";
		</style>
		<script type="text/javascript" language="javascript" src="/static/DataTables-1.9.4/media/js/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="/static/DataTables-1.9.4/media/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="/static/js/jquery-1.4.2.min.js"></script>
		<script src="/static/js/jquery.autocomplete.js"></script>	
		<script>
			
		var asInitVals = new Array();
		 
		$(document).ready(function() {
			
			oTable = $('#teg').dataTable({
				"bPaginate": true,
				"bJQueryUI": true,
				"sPaginationType": "full_numbers",
				"bAutoWidth": true
				
				//"sScrollX": "100%",
			    //"sScrollXInner": "110%"

			});
		   
		     
		    $("tfoot input").keyup( function () {
		        /* Filter on the column (the index) of this element */
		        oTable.fnFilter( this.value, $("tfoot input").index(this) );
		    } );
		     
		     
		     
		    /*
		     * Support functions to provide a little bit of 'user friendlyness' to the textboxes in 
		     * the footer
		     */
		    $("tfoot input").each( function (i) {
		        asInitVals[i] = this.value;
		    } );
		     
		    $("tfoot input").focus( function () {
		        if ( this.className == "search_init" )
		        {
		            this.className = "";
		            this.value = "";
		        }
		    } );
		     
		    $("tfoot input").blur( function (i) {
		        if ( this.value == "" )
		        {
		            this.className = "search_init";
		            this.value = asInitVals[$("tfoot input").index(this)];
		        }
		    } );
		} );

		
		
		</script>


</head>

<body>
<br><br>
<center><h3>Listado de Eventos Genéricos</h3></center>
<br><br>
<center>
<form method="post" name="formEx" id="formEx" action="<c:url value='/exportarAlumnos/listaAlumnosExportar.do'/>">
	<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:800px;">
		<table id="table-EG" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="800px">
			<tr align="center">
	 			<td align="left" style="font-size: 13px; font-weight: bold">RR:</td>
				<td align="left">
					<input id="rr" width="150px;" type="text" name="rr" />
				</td>
				<td align="left" style="font-size: 13px; font-weight: bold">EA:</td>
				<td align="left">
					<input id="ea" width="150px;" type="text" name="ea" />
				</td>		
			</tr>
			<tr align="center">
	 			<td align="left" style="font-size: 13px; font-weight: bold">Zona:</td>
				<td align="left">
					<input id="zona" width="150px;" type="text" name="zona" />
				</td>
				<td align="left" style="font-size: 13px; font-weight: bold">Lugar Encuentro:</td>
				<td align="left">
					<input id="lugar" width="150px;" type="text" name="lugar" />
				</td>		
			</tr>
			<tr align="center">
	 			<td align="left" style="font-size: 13px; font-weight: bold">Tipo Evento:</td>
				<td align="left">
					<input id="tipo" width="150px;" type="text" name="tipo" />
				</td>
				<td align="left" style="font-size: 13px; font-weight: bold">Evaluación General:</td>
				<td align="left">
					<input id="eval" width="150px;" type="text" name="eval" />
				</td>		
			</tr>
			<tr></tr>
			<tr align="center">
			<td colspan="4">
				<input align="middle" id="buscar" type="button"  value="Buscar" class="ui-state-default ui-corner-all" ></input>
			</td>			
		</tr>
		</table> 
		
	</fieldset>
</form>
</center>
<br><br>
<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:800px;">
<div class="demo_jui">
<table cellpadding="0" cellspacing="0" border="0" class="display" id="teg">
	<thead>
		<tr>
			<th>Ciclo</th>
			<th>RR</th>
			<th>EA</th>
			<th>Zona</th>
			<th>Lugar Encuentro</th>
			<th>Tipo Evento</th>
			<th>Contenido Abordado</th>						
			<th>Evaluación General</th>
		</tr>
	</thead>
	<tfoot>
	
	
		<tr>
			<th><input type="text" name="search_engine"  class="search_init" /></th>
			<th><input type="text" name="search_browser"  class="search_init" /></th>
			<th><input type="text" name="search_platform" class="search_init" /></th>
			<th><input type="text" name="search_version" class="search_init" /></th>
			<th><input type="text" name="search_grade"  class="search_init" /></th>
			<th><input type="text" name="search_grade"  class="search_init" /></th>
			<th><input type="text" name="search_grade"  class="search_init" /></th>
			<th><input type="text" name="search_grade" class="search_init" /></th>
		</tr>
	</tfoot>
	
	
	<tbody>
		<%
                            ArrayList<EventoGenericoDto> lista =EventoGenericoDto.obtenerListado();
                            for (EventoGenericoDto ev : lista) {
                %>
                <tr>
                    <td><%= ev.getCiclo()%></td>
                    <td><%= ev.getRr()%></td>
                    <td><%= ev.getEa()%></td>
                    <td><%= ev.getZona()%></td>
                    <td><%= ev.getLugarEncuentro()%></td>
                    <td><%= ev.getTipoEvento()%></td>
                    <td><%= ev.getContenidos()%></td>
                    <td><%= ev.getEvaluacion()%></td>
                    
                </tr>
                <%
                            }
                %>							
	</tbody>
	
	
</table>
</div>


</fieldset>






</body>
</html>