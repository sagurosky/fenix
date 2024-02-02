<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@page import="org.cimientos.intranet.modelo.perfilEA.BecadoController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>


 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Becas Disponibles</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css ">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/dataTables.jqueryui.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>	
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.11/js/dataTables.jqueryui.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>


<link rel="stylesheet" href="<c:url  value="/static/css/styles.css"/>" media="all">

<!-- 2018
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css ">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/dataTables.jqueryui.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">



<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>	
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.11/js/dataTables.jqueryui.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
 -->

<style>
th { white-space: nowrap; }
body {
font-family: Arial, Verdana; 
}
</style>

<script type="text/javascript">
$(document).ready(function() {  
	
    $('#tContabilidad tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Buscar '+title+'" />' );
    } );
 
    // DataTable
   var table=$('#tContabilidad').DataTable( {
    	
	   language: {
	        processing:     "Procesando...",
	        search:         "Buscar:",
	        lengthMenu:     "Mostrar _MENU_ registros",
	        info:           "Mostrando _START_ de _END_ de _TOTAL_ registros",
	        infoEmpty:      "Mostrando 0 de 0 registros",
	        infoFiltered:   "(filtrado de _MAX_ registros en total)",
	        infoPostFix:    "",
	        loadingRecords: "Procesando...",
	        zeroRecords:    "Sin registros",
	        emptyTable:     "Sin registros",
	        paginate: {
	            first:      "Primer",
	            previous:   "Anterior",
	            next:       "Próxima",
	            last:       "Última"
	        }	        
	    },
	    
	    dom: 'Blfrtip',
	    buttons: [
	              'copy', 
	              {
	                  extend: 'csv',
	                  text: 'csv',
	                  extension: '.csv',
	                  exportOptions: {
	                      modifier: {
	                          page: 'current'
	                      }
	                  },
	                  title: 'becas disponibles'
	              }, 
	               
	              'print',
	              {
	                  extend: 'excel',
	                  text: 'excel',
	                  extension: '.xlsx',
	                  exportOptions: {
	                      modifier: {
	                          page: 'current'
	                      }
	                  },
	                  title: 'becados por ea'
	              }
	          ],
	    
	    
	    "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
 
            // Total over all pages
            total8 = api
                .column( 8 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal8 = api
                .column( 8, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 8 ).footer() ).html(
                pageTotal8 +' ( '+ total8 +')'
            );

            
            // Total over all pages
            total9 = api
                .column( 9 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal9 = api
                .column( 9, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 9 ).footer() ).html(
                pageTotal9 +' ( '+ total9 +')'
            );

            // Total over all pages
            total10 = api
                .column( 10 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal10 = api
                .column( 10, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 10 ).footer() ).html(
                pageTotal10 +' ( '+ total10 +')'
            );
            
        }
        
     }); 
    // Apply the search
    table.columns().every( function () {
        var that = this;
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
} );
</script>









</head>

<body>


<% 
	String mes = request.getParameter("mes");
	String anio = request.getParameter("anio");	
	if (anio!=null){
		anio = request.getParameter("anio");
	}else{
		anio="2019";
	}	
%>	
<center>
<h3 style="background-color:#7FC2D8;">Reporte de becas disponibles Nuevo</h3>
<br>
	<form id="frmReportes" method="post" action="reporteBecasDisponibles.do">	
		
		
		<input type="text" id="anio" name="anio" maxlength="4" size="2" value="<%=anio %>">
		<input type="submit"  id="generar" name="generar" class="classnameboton" value="Buscar" >		
	</form>
	<br><br>
<table id="tContabilidad" class="display" cellspacing="0" width="100%">
	<thead>
		<tr>								
			<th>Ciclo</th>					
			<th>Padrino</th>
			<th>Tipo</th>
			
			<th>Período</th>
			<th>Estado Beca</th>
			<th>Zona</th>
			<th>Tipo</th>
			<th>Cantidad Becas</th>
			<th>Beca Asignada</th>			
			<th>Vacantes</th>
			<th>Fecha Alta</th>
			
															
		</tr>
	</thead>
	<tfoot>
         <tr>
         	<th>Ciclo</th>					
			<th>Padrino</th>
			<th>Tipo</th>
			
			<th>Período</th>
			<th>Estado Beca</th>
			<th>Zona</th>
			<th>Tipo</th>			
			<th>Cantidad Becas</th>
			<th>Beca Asignada</th>
			<th>Vacantes</th>
			<th>Fecha Alta</th>		
         </tr>
     </tfoot>
	<tbody>	
	<% 
	
	
	Connection cn = null;
    CallableStatement cl = null;
    ResultSet rs = null;
    Long becados=0L;
    Long totalBe=0L;
    
	cn = null;
   	cl = null;
   	rs = null;
   	String call = "{CALL SP_TraerBecasDisponiblesIndividuos(?)}";
	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    cl.setString(1, anio);
    rs = cl.executeQuery();
    while (rs.next()) {
    	
    %>
	   <tr>
		<td  align="left" ><%=rs.getString("ciclo_programa.nombre")%></td>	    
	    <td  align="left"  ><%=rs.getString("persona.apellido") +", "+rs.getString("persona.nombre")%></td>
	    <td  align="left"  ><%=rs.getString("tipo_padrino")%></td>
	    
	    <td  align="left"  ><%=rs.getString("periodo.nombre")%></td>
	    <td  align="left"  ><%=rs.getString("beca_estado")%></td>	    
	    <td  align="left"  ><%=rs.getString("zona_cimientos.nombre")%></td>
	    <td  align="left"  ><%=rs.getString("tipo_beca")%></td>	    
	    <td  align="center"  ><%=rs.getString("beca.cantidad")%></td>
	    <td  align="center"  ><%=rs.getString("beca.cantidad_asignada")%></td>
	    <td  align="center"  ><%=Long.parseLong(rs.getString("beca.cantidad"))-Long.parseLong(rs.getString("beca.cantidad_asignada"))%></td>
	    <td  align="left"  ><%=rs.getString("fecha_alta")%></td>		
        </tr>
    <%
    }
    Conexion.cerrarCall(cl);
    Conexion.cerrarConexion(cn);
    

	cn = null;
	cl = null;
    rs = null;
    becados=0L;
	totalBe=0L;
    
	cn = null;
   	cl = null;
   	rs = null;
   	call = "{CALL SP_TraerBecasDisponiblesCorpo(?)}";
	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    cl.setString(1, anio);
    rs = cl.executeQuery();
    while (rs.next()) {
    	
    %>
	   <tr  >
		<td nowrap="nowrap" align="left" ><%=rs.getString("ciclo_programa.nombre")%></td>	    
	    <td  align="left"  ><%=rs.getString("empresa.denominacion")%></td>
	    <td align="left"  ><%=rs.getString("tipo_padrino")%></td>
	    
	    <td align="left"  ><%=rs.getString("periodo.nombre")%></td>
	    <td align="left"  ><%=rs.getString("beca_estado")%></td>	    
	    <td align="left"  ><%=rs.getString("zona_cimientos.nombre")%></td>
	    <td align="left"  ><%=rs.getString("tipo_beca")%></td>	    
	    <td  align="center"  ><%=rs.getString("beca.cantidad")%></td>
	    <td  align="center"  ><%=rs.getString("beca.cantidad_asignada")%></td>
	    <td  align="center"  ><%=Long.parseLong(rs.getString("beca.cantidad"))-Long.parseLong(rs.getString("beca.cantidad_asignada"))%></td>
	    <td  align="left"  ><%=rs.getString("fecha_alta")%></td>		
        </tr>
    <%
    }
    Conexion.cerrarCall(cl);
    Conexion.cerrarConexion(cn);%>	
    
    
    	  	
    	
	</tbody>
</table>

</center>


 


</body>
</html>