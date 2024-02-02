<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Historial Pago</title>
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

<script type="text/javascript">
$(document).ready(function(){
    //$('#tContabilidad').DataTable();
    var table=$('#tContabilidad').DataTable( {
    	
    	"order": [[ 0, "asc" ]],
    	
    	"columns": [
   	              { "width": "1%" },
   	             { "width": "1%" },
   	            { "width": "1%" },
   	           { "width": "1%" }    
   	            ],
    	
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
 	    }
 	   
});
}); 
</script>

</head>
<body>
<font face="Arial" size="2">
<center>
	<h3>Historial de Pago</h3>
		<%
		    Long id= Long.parseLong(request.getParameter("id"));	    	
	    	Connection cn = null;
	    	CallableStatement cl = null;
	    	ResultSet rs = null;
			cn = null;
		   	cl = null;
		   	rs = null;		   			    
		    String call = "{CALL SP_TraerDatoPago(?)}";
	    	cn = Conexion.getConexion();
	        cl = cn.prepareCall(call);
	        cl.setLong(1, id);
		    rs = cl.executeQuery();		    
		    while (rs.next()) {%> 
	    		<table>
		    		<tr>
			    		<td>Becado: <%=rs.getString("persona.apellido")+ " " + rs.getString("persona.nombre") %></td>
			    		<td>RA: <%=rs.getString("responsable_adulto.apellido")+ " " + rs.getString("responsable_adulto.nombre") %></td>
			    	</tr>
			    	<tr>	
			    		<td>Zona: <%=rs.getString("zona_cimientos.nombre") %></td>
			    		<td>Periodo: <%=rs.getString("periodo.nombre")+" "+rs.getString("ciclo_programa.nombre") %></td> 
					</tr>
				</table>
	    	<%}%>	    		    	
			<table id="tContabilidad" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Fecha</th>
						<th>Estado</th>
						<th>Detalle</th>
						<th>Usuario</th>				
					</tr>
				</thead>
				
				<tbody>			
				<%cn = null;
			   	cl = null;
			   	rs = null;		   			    
			    call = "{CALL SP_TraerHistorialPago(?)}";
		    	cn = Conexion.getConexion();
		        cl = cn.prepareCall(call);
		        cl.setLong(1, id);
			    rs = cl.executeQuery();		    
			    while (rs.next()) { %>	             
			    	<tr>
				    	<td nowrap="nowrap"><%=rs.getString("fecha").substring(0,10)%></td>
				    	<td nowrap="nowrap"><%=rs.getString("estado")%></td>
				    	<td nowrap="nowrap"><%=rs.getString("motivo")%></td>
				    	<td nowrap="nowrap"><%=rs.getString("usuario")%></td>			    	
			    	</tr>		   	
				<%}
				Conexion.cerrarCall(cl);
			    Conexion.cerrarConexion(cn);%>	  		
   			</tbody>
		</table>
</center>		
</font>
</body>
</html>