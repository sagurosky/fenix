<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page import="java.util.ArrayList"%>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Espacio de acompañamiento</title>



<script>
function confirmacionBoletin(idAlumno, colorBoletin)
{
	if(colorBoletin == 'gray')
	{
	jConfirm('Recordá que para generar el boletín tenés que contar con todas las notas, sino quedará incompleto.'+ 
			 'Por lo tanto, si no tenés el boletín en mano, no hagas click acá', 'Confirmación', function(result){
	    if (result) 
		{
	    	enviarForm('boletin', idAlumno);
	    } 
	    else 
		{
	      return false;
	    }
	  });
	}
	else
	{
		enviarForm('boletin', idAlumno);
	}
}

</script>
<script type="text/javascript">
	function enviarForm(action, id){
		
		if(action=='lista'){
			document.forms['becadosForm'].action = "../entrevistas/listaEntrevistasViewFebrero.do";
		}else if(action=='boletin'){
			document.forms['becadosForm'].action = "../entrevistas/registrarBoletinView.do";
			//document.forms['becadosForm'].action = action="<c:url value='../becadosPorEa/modificarDatosBoletin.jsp' />";
		}else if(action=='alta'){
		
			document.forms['becadosForm'].action = "../entrevistas/registrarEntrevistasView.do?tipo=m";
			
		}else if(action=='pagos'){
			document.forms['becadosForm'].action = "../entrevistas/listaPagosView.do";
		}
		
		document.forms['becadosForm'].idAlumno.value = id;
		document.forms['becadosForm'].submit();
	}


	function validarGrupal(){
		document.forms['becadosForm'].submit();			
	}
	
</script>


<link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/dataTables.jqueryui.min.css">

<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.23/js/dataTables.jqueryui.min.js"></script>
<style>
th { white-space: nowrap; }

body {
font-family: Arial, Verdana; 

}

thead, tfoot {
    display: table-header-group;
}
</style>

<script type="text/javascript">
$(document).ready(function() {  
	
    $('#example tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" size=7 placeholder="Buscar" />' );
    } );
 
    // DataTable
   var table=$('#example').DataTable( {
    	
	   "oLanguage": {
			"sLengthMenu": 'Mostrar <select>'+
			'<option value="10">10</option>' +
			'<option value="25">25</option>' +
			'<option value="50">50</option>'+
			'<option value="75">75</option>'+
			'<option value="100">100</option>'+
			'<option value="-1">Todos</option>'+
			'</select> registros por hoja',
			"sZeroRecords": "No se encontraron registros",
			"sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
			"sInfoEmtpy": "Mostrando 0 registros",
			"sInfoFiltered": "(filtrado de _MAX_ registros totales)",
			"sSearch": "Buscar",
			"oPaginate": {
				"sFirst":    "Primera",
				"sPrevious": "Anterior",
				"sNext":     "Siguiente",
				"sLast":     "Ultima"
			}
			
			},
			"iDisplayLength": 10,
	    
	    
	    
	   
	    
        
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

<div id="main-content">
<form id="becadosForm" class="becadosForm" action="<c:url value='/entrevistas/registrarEntrevistaGrupalView.do' />" method="post">
		<table id="example" class="display" style="width:75%">
	
			<thead>
				<tr>
					<th>id</th>
					<th>Zona</th>
					<th>Alumno</th>
					<th>Foto</th>
					<th>DNI</th>
					<th>Escuela</th>
					<th>Año Escolar</th>
					<th>Generar Entrevista</th>					
					
				</tr>
				
			</thead>
			<tfoot>
				<tr>
					<th>id</th>
					<th>Zona</th>
					<th>Alumno</th>
					<th>Foto</th>
					<th>DNI</th>
					<th>Escuela</th>
					<th>Año Escolar</th>
					<th>Generar Entrevista</th>					
					
				</tr>
				
			</tfoot>
			<tbody>
			<% 
	
			   	Connection cn = null;
			    CallableStatement cl = null;
			    ResultSet rs = null;
			    Long becados=0L;
			    Long totalBe=0L;
				String situacionEscolarPA="";
			    
				cn = null;
			   	cl = null;
			   	rs = null;
			   	String call="";
			   	
			   	call="select entrevista.perfil_alumno, (select zona_cimientos.id from zona_cimientos,escuela where zona_cimientos.id=escuela.zona_cimientos_id and escuela.id=entrevista.escuela_alumno) as zona_id,			   	(select zona_cimientos.nombre from zona_cimientos,escuela where zona_cimientos.id=escuela.zona_cimientos_id and escuela.id=entrevista.escuela_alumno) as zona_nombre,			   	(select concat(persona.apellido, ' ', persona.nombre) from persona where entrevista.perfil_alumno=persona.perfil_alumno) as becado,			   	(select persona.dni from persona where entrevista.perfil_alumno=persona.perfil_alumno) as dni,			   	(select escuela.nombre from escuela where escuela.id=entrevista.escuela_alumno) as escuela,			   	(select anio_escolar.anio_escolar from anio_escolar where anio_escolar.id_anio=entrevista.anio_escolar) as anio_escolar			   	 from entrevista where entrevista.ea=53 and entrevista.periodo_de_pago=365";			
			   	cn = Conexion.getConexion();
			    cl = cn.prepareCall(call); 
			    
			    rs = cl.executeQuery();
			    while (rs.next()) {%>
			    	<tr>
				    	<td style="font-size: 14px"><%= rs.getString("perfil_alumno") %></td>
				    	<td style="font-size: 14px"><%= rs.getString("zona_nombre") %></td>
				    	<td style="font-size: 14px"><%= rs.getString("becado") %></td>
				    	<td align="center" valign="middle" style="font-size: 14px"><img src="../fichaAlumno/mostrarImagen.do?dni=<%= rs.getString("dni") %>" width="75px"></td>
				    	<td style="font-size: 14px"><%= rs.getString("dni") %></td>
				    	<td style="font-size: 14px"><%= rs.getString("escuela") %></td>
				    	<td style="font-size: 14px"><%= rs.getString("anio_escolar") %></td>
				    	<td style="font-size: 14px"><a href="detallePostPFE.jsp?id=<%= rs.getString("perfil_alumno") %>&ciclo=<%= rs.getString("becado") %>" ><%= rs.getString("zona_nombre") %></a></td>
				    	
			    	</tr>
				<%} 
				Conexion.cerrarCall(cl);
		        Conexion.cerrarConexion(cn);%>
   		</tbody>	
	</table>
		
	

	
	<input type="hidden" name="idAlumno" />
	<input type="hidden" id="alumnosSeleccionados" name="alumnosSeleccionados"/>
</form>
</div>
</body>
</html>