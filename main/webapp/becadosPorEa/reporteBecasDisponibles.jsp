<%@page import="org.cimientos.intranet.modelo.ReporteBecaDisposible"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@page import="org.cimientos.intranet.modelo.perfilEA.BecadoController"%>
<%@page import="org.cimientos.intranet.modelo.Beca.*"%>
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






<style>

body {
font-family: Arial, Verdana; 
}

th, td { }
    div.dataTables_wrapper {
        margin: 0 auto;
    }
    
 
    div.container {
        width: 80%;
    }
    
thead, tfoot {
    display: table-header-group;
}
</style>

<script type="text/javascript">
$(document).ready(function() {  
	
    $('#tContabilidad tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" size="7" placeholder="Buscar" />' );
    } );
 
    // DataTable
   var table=$('#tContabilidad').DataTable( {
    	
	   
	   
	   
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
            total7 = api
                .column( 7 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal7 = api
                .column( 7, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 7 ).footer() ).html(
                pageTotal7 +' ( '+ total7 +')'
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
<link rel="stylesheet" href="<c:url  value="/static/css/styles.css"/>" media="all">
</head>
<body>
<table  style="width: 100%; height: auto;" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="2">
			<jsp:include page="/WEB-INF/pages/includes/header.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<jsp:include page="/WEB-INF/pages/includes/menu.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td valign="top" style="width: 200px; height: 500px; background-color: #7C7C7C;" >
			<jsp:include page="${menu}"></jsp:include>
		</td>
			<td style="background-color: #FFF; vertical-align: top;">
				<div id="body" style="background-color: #FFF; vertical-align: top;">
					<c:if test="${error != null || mensaje != null}">
						<div id="mensaje-content">
							<table id="mensaje" >
								<tr >
									<td>
										<jsp:include page="/WEB-INF/pages/includes/mensajes.jsp"></jsp:include>
									</td>
								</tr>
							</table>
						</div>
					</c:if>

<% 	
	String mes="";
	String anio="";
	mes=request.getParameter("mes");
	anio=request.getParameter("anio");	
	System.out.println("mes de p: "+mes);
	System.out.println("año de p: "+anio);
	if(anio==null){
		Calendar c1 = Calendar.getInstance();
		Calendar c = new GregorianCalendar();		
		anio = Integer.toString(c.get(Calendar.YEAR));
		if (c.get(Calendar.MONTH)+1<10){
			mes = "0"+Integer.toString(c.get(Calendar.MONTH)+1);
		}else{
			mes = Integer.toString(c.get(Calendar.MONTH)+1);
		}
	}
	System.out.println("mes: "+mes);
	System.out.println("año: "+anio);
%>					
<center>
<h3 style="background-color:#7FC2D8;">Reporte de becas disponibles</h3>
<br>
	<form id="frmReportes" method="post" action="reporteBecasDisponibles.jsp">	
		
		
		<input type="text" id="anio" name="anio" maxlength="4" size="2" value="<%=anio %>">
		<input type="submit"  id="generar" name="generar" class="classnameboton" value="Buscar" >		
	</form>
	<br><br>
<table id="tContabilidad" class="display" cellspacing="0" width="70%">
	<thead>
		<tr>								
			<th>Ciclo</th>					
			<th>Padrino</th>
			<th>Tipo<br>Padrino</th>
			
			<th>Período</th>
			<th>Estado<br>Beca</th>
			<th>Zona</th>
			<th>Tipo</th>
			<th>Cantidad<br>Becas</th>
			<th>Beca<br> Asignada</th>			
			<th>Vacantes</th>
			
			
															
		</tr>
	</thead>
	<tfoot>
         <tr>
         	<th>Ciclo</th>					
			<th>Padrino</th>
			<th>Tipo<br>Padrino</th>
			
			<th>Período</th>
			<th>Estado<br>Beca</th>
			<th>Zona</th>
			<th>Tipo</th>
			<th>Cantidad<br>Becas</th>
			<th>Beca<br> Asignada</th>			
			<th>Vacantes</th>

					
         </tr>
     </tfoot>
	<tbody>	
	<% 
	
	ArrayList<ReporteBecaDisposible> listaRBD= new ArrayList<ReporteBecaDisposible>();
	
	Connection cn = null;
    CallableStatement cl = null;
    ResultSet rs = null;
    Long becados=0L;
    Long totalBe=0L;
    
	cn = null;
   	cl = null;
   	rs = null;
   	//String call = "{CALL SP_TraerBecasDisponiblesIndividuos(?)}";
	String call="select ciclo_programa.nombre, beca.padrino, persona.apellido,persona.nombre, " 
			+ " if((perfil_padrino.tipo= 0), 'Corporativo', 'Individuo') as tipo_padrino, "
			+ " perfil_padrino.nro_ctes_plataforma_contable, beca.estado,periodo.nombre, "
			+ " if((beca.estado= 0), 'Estimada',if((beca.estado= 1),'Confirmada','Inactiva')) as beca_estado, "
			+ " zona_cimientos.nombre, "
			+ " if((beca.tipo= 0), 'Local',if((beca.tipo= 1),'Interior', 'Patagonia')) as tipo_beca, "
			+ " beca.cantidad_asignada,beca.cantidad,DATE_FORMAT(beca.fecha_alta,'%d/%m/%Y') as fecha_alta, " 
			+ " beca.cantidad-beca.cantidad_asignada as diferencia "
			+ " from beca,ciclo_programa,periodo,zona_cimientos,perfil_padrino,persona "
			+ " where ciclo_programa.id=beca.ciclo and periodo.id=beca.periodo_pago and ciclo_programa.nombre= " + anio 
			+ " and zona_cimientos.id=beca.zona "
			+ " and perfil_padrino.id=beca.padrino "
			+ " and persona.id=perfil_padrino.datos_personales "
			+ " and beca.estado<>2 "
			+ " and beca.activo=1 "
			+ " order by padrino;";

   	
   	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    //cl.setString(1, anio);
    rs = cl.executeQuery();    while (rs.next()) {
    	ReporteBecaDisposible rBD = new ReporteBecaDisposible();
    	rBD.setCiclo(rs.getString("ciclo_programa.nombre"));
    	rBD.setPadrino(rs.getString("persona.apellido") +", "+rs.getString("persona.nombre"));
    	rBD.setTipoPadrino(rs.getString("tipo_padrino"));
    	rBD.setPeriodo(rs.getString("periodo.nombre"));
    	rBD.setEstado(rs.getString("beca_estado"));
    	rBD.setZona(rs.getString("zona_cimientos.nombre"));
    	rBD.setTipo(rs.getString("tipo_beca"));
    	rBD.setCantidadBecas(Long.parseLong(rs.getString("beca.cantidad")));
    	rBD.setBecasAsignadas(Long.parseLong(rs.getString("beca.cantidad_asignada")));
    	rBD.setDiferencia(Long.parseLong(rs.getString("beca.cantidad"))-Long.parseLong(rs.getString("beca.cantidad_asignada")));
    	listaRBD.add(rBD);
    }	
    	
    
    Conexion.cerrarCall(cl);
    Conexion.cerrarConexion(cn);
        becados=0L;
	totalBe=0L;    
	cn = null;
   	cl = null;
   	rs = null;
   	//call = "{CALL SP_TraerBecasDisponiblesCorpo(?)}";
	call= "select ciclo_programa.nombre, beca.padrino, empresa.denominacion,empresa.id, " 
			+" if((perfil_padrino.tipo= 0), 'Corporativo', 'Individuo') as tipo_padrino, " 
			+" perfil_padrino.nro_ctes_plataforma_contable, beca.estado,periodo.nombre, "
			+" if((beca.estado= 0), 'Estimada',if((beca.estado= 1),'Confirmada', 'Inactiva')) as beca_estado, "
			+" zona_cimientos.nombre, "
			+" if((beca.tipo= 0), 'Local',if((beca.tipo= 1),'Interior', 'Patagonia')) as tipo_beca, "
			+" beca.cantidad_asignada,beca.cantidad,DATE_FORMAT(beca.fecha_alta,'%d/%m/%Y') as fecha_alta, " 
			+" beca.cantidad-beca.cantidad_asignada as diferencia "
			+" from beca,ciclo_programa,periodo,zona_cimientos,perfil_padrino,empresa "
			+" where ciclo_programa.id=beca.ciclo and periodo.id=beca.periodo_pago and ciclo_programa.nombre= " + anio
			+" and zona_cimientos.id=beca.zona "
			+" and perfil_padrino.id=beca.padrino "
			+" and empresa.id=perfil_padrino.empresa "
			+" and beca.estado<>2 "
			+" and beca.activo=1 "
			+" order by empresa.denominacion;";
   	
			System.out.println("######:"+call);
   	
   	
   	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    //cl.setString(1, anio);
    rs = cl.executeQuery();
    while (rs.next()) {
    	ReporteBecaDisposible rBD = new ReporteBecaDisposible();
    	rBD.setCiclo(rs.getString("ciclo_programa.nombre"));
    	rBD.setPadrino(rs.getString("empresa.denominacion"));
    	rBD.setTipoPadrino(rs.getString("tipo_padrino"));
    	rBD.setPeriodo(rs.getString("periodo.nombre"));
    	rBD.setEstado(rs.getString("beca_estado"));
    	rBD.setZona(rs.getString("zona_cimientos.nombre"));
    	rBD.setTipo(rs.getString("tipo_beca"));
    	rBD.setCantidadBecas(Long.parseLong(rs.getString("beca.cantidad")));
    	rBD.setBecasAsignadas(Long.parseLong(rs.getString("beca.cantidad_asignada")));
    	rBD.setDiferencia(Long.parseLong(rs.getString("beca.cantidad"))-Long.parseLong(rs.getString("beca.cantidad_asignada")));
    	listaRBD.add(rBD);
    }
    Conexion.cerrarCall(cl);
    Conexion.cerrarConexion(cn);
    for (ReporteBecaDisposible rBD : listaRBD) {
	%>	
    	<tr>
			<td  align="left" ><%=rBD.getCiclo()%></td>	    
		    <td  align="left"  ><%=rBD.getPadrino()%></td>
		    <td align="left"  ><%=rBD.getTipoPadrino()%></td>		    
		    <td align="left"  ><%=rBD.getPeriodo()%></td>
		    <td align="left"  ><%=rBD.getEstado()%></td>	    
		    <td align="left"  ><%=rBD.getZona()%></td>
		    <td align="left"  ><%=rBD.getTipo()%></td>	    
		    <td  align="center"  ><%=rBD.getCantidadBecas()%></td>
		    <td  align="center"  ><%=rBD.getBecasAsignadas()%></td>
		    <td  align="center"  ><%=rBD.getDiferencia()%></td>	    		
        </tr>	
    <%}%>
	</tbody>
	</table>
	</center>
	</div>
	</td>
</tr>
</table>
</body>
</html>