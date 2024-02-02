<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@page import="java.util.ArrayList"%>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pago de Becas</title>
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
	
    $('#tContabilidad tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" size=7 placeholder="Buscar" />' );
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
	                  title: 'becados por ea'
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
            total5 = api
                .column( 5 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal5 = api
                .column( 5, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 5 ).footer() ).html(
                pageTotal5 +' ( '+ total5 +')'
            );

            
            // Total over all pages
            total6 = api
                .column( 6 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal6 = api
                .column( 6, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 6 ).footer() ).html(
                pageTotal6 +' ( '+ total6 +')'
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

<script>
$(function() {
	$("#zona").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarZonaPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.zonas, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							zona: item.zona
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#rr").removeAttr('disabled');
			$("#idZona").val(ui.item.id);
			$("#zona").text(ui.item.zona);
		}
	});
});
$(function() {
	$("#rr").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarRRPorNombreYZonaOrNombre.do?idZona=" + $("#idZona").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.rrs, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							rr: item.rr
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#ea").removeAttr('disabled');
			$("#idRR").val(ui.item.id);
			$("#rr").text(ui.item.rr);
		}
	});
});

$(function() {
	$("#ea").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEAPorNombreYRROrNombre.do?idRR=" + $("#idRR").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.eas, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							ea: item.ea
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idEA").val(ui.item.id);
			$("#ea").text(ui.item.ea);
		}
	});
});
</script>



<link rel="stylesheet"
	href="<c:url  value="/static/css/styles.css"/>" media="all">

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
	if(mes==null){
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
<h3 style="background-color:#7FC2D8;">Pago de Becas</h3>
<br>
	<form id="frmReportes" method="post" action="pagoDeBecas.jsp">	
		Mes:<select id="mes" name="mes">
			<%if (mes.equals("01")){
				%>
				<option value="01" selected="selected">Enero</option>	
			<%}else{%>
				<option value="01">Enero</option>
			<%} %>
			<%if (mes.equals("02")){
				%>
				<option value="02" selected="selected">Febrero</option>	
			<%}else{%>
				<option value="02">Febrero</option>
			<%} %>
			<%if (mes.equals("03")){
				%>
				<option value="03" selected="selected">Marzo</option>	
			<%}else{%>
				<option value="03">Marzo</option>
			<%} %>
			<%if (mes.equals("04")){
				%>
				<option value="04" selected="selected">Abril</option>	
			<%}else{%>
				<option value="04">Abril</option>
			<%} %>
			<%if (mes.equals("05")){
				%>
				<option value="05" selected="selected">Mayo</option>	
			<%}else{%>
				<option value="05">Mayo</option>
			<%} %>
			<%if (mes.equals("06")){
				%>
				<option value="06" selected="selected">Junio</option>	
			<%}else{%>
				<option value="06">Junio</option>
			<%} %>
			<%if (mes.equals("07")){
				%>
				<option value="07" selected="selected">Julio</option>	
			<%}else{%>
				<option value="07">Julio</option>
			<%} %>
			<%if (mes.equals("08")){
				%>
				<option value="08" selected="selected">Agosto</option>	
			<%}else{%>
				<option value="08">Agosto</option>
			<%} %>
			<%if (mes.equals("09")){
				%>
				<option value="09" selected="selected">Septiembre</option>	
			<%}else{%>
				<option value="09">Septiembre</option>
			<%} %>
			<%if (mes.equals("10")){
				%>
				<option value="10" selected="selected">Octubre</option>	
			<%}else{%>
				<option value="10">Octubre</option>
			<%} %>
			<%if (mes.equals("11")){
				%>
				<option value="11" selected="selected">Noviembre</option>	
			<%}else{%>
				<option value="11">Noviembre</option>
			<%} %>
			<%if (mes.equals("12")){
				%>
				<option value="12" selected="selected">Diciembre</option>	
			<%}else{%>
				<option value="12">Diciembre</option>
			<%} %>
			
		</select>	
		AÑO:<input type="text" id="anio" name="anio" size="5" value="<%=anio%>">			
		
				
		<input type="submit"  id="generar" name="generar" class="classnameboton" value="Buscar" >		
	</form>
	<br><br>
<table id="tContabilidad" class="display" cellspacing="0" width="100%">
	<thead>
		<tr>								
			<th>RR</th>
			<th>Zona</th>					
			<th>EA</th>
			<th>Banco</th>
			<th>Becados</th>
			<th>ctivos</th>
			<th>Entrevistas<br>Cargadas</th>
			<th>Aprobados</th>
			<th>Suspendidos</th>
			<th>Cesados<br>Pendientes<br>No Renovados</th>
															
		</tr>
	</thead>
	<tfoot>
         <tr>
         	<th>RR</th>
			<th>Zona</th>					
			<th>EA</th>
			<th>Banco</th>
			<th>AB</th>
			<th>AB<br>Activos</th>
			<th>Entrevistas<br>Cargadas</th>
			<th>AB<br>Aprobados</th>
			<th>AB<br>Suspendidos</th>
			<th>AB<br>Cesados<br>Pendientes<br>No Renovados</th>	
         </tr>
     </tfoot>
	<tbody>	
	<% 
	
	
	String desde=anio+"-"+mes+"-01";
   	System.out.println("desde: "+desde);
	String hasta="";
   	Long total=0L;
   	String mesAnterior="";
   	String diaAnterior="";
   	String anioAnterior="";
   	String fechaAnterior="";
	if(mes.equals("12")){
		if (anio.equals("2010")){
			anioAnterior="2009";
		}
		if (anio.equals("2011")){
			anioAnterior="2010";
		}
		if (anio.equals("2012")){
			anioAnterior="2011";
		}
		if (anio.equals("2013")){
			anioAnterior="2012";
		}
		if (anio.equals("2014")){
			anioAnterior="2013";
		}
		if (anio.equals("2015")){
			anioAnterior="2014";
		}
		if (anio.equals("2016")){
			anioAnterior="2015";
		}
		if (anio.equals("2017")){
			anioAnterior="2016";
		}
		if (anio.equals("2018")){
			anioAnterior="2017";
		}
		if (anio.equals("2019")){
			anioAnterior="2018";
		}
		if (anio.equals("2020")){
			anioAnterior="2019";
		}
		if (anio.equals("2021")){
			anioAnterior="2020";
		}
		if (anio.equals("2022")){
			anioAnterior="2021";
		}
		if (anio.equals("2023")){
			anioAnterior="2022";
		}
	}else{
		anioAnterior=anio;
	}
   	
	
	
	if (mes.equals("01")){
		hasta=anio+"-"+mes+"-31";	
		mesAnterior="02";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("02")){
		hasta=anio+"-"+mes+"-28";	
		mesAnterior="03";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("03")){
		hasta=anio+"-"+mes+"-31";	
		mesAnterior="04";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("04")){
		hasta=anio+"-"+mes+"-30";	
		mesAnterior="05";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("05")){
		hasta=anio+"-"+mes+"-31";	
		mesAnterior="06";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("06")){
		hasta=anio+"-"+mes+"-30";	
		mesAnterior="07";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("07")){
		hasta=anio+"-"+mes+"-31";	
		mesAnterior="08";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("08")){
		hasta=anio+"-"+mes+"-31";	
		mesAnterior="09";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("09")){
		hasta=anio+"-"+mes+"-30";	
		mesAnterior="10";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("10")){
		hasta=anio+"-"+mes+"-31";	
		mesAnterior="11";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("11")){
		hasta=anio+"-"+mes+"-30";	
		mesAnterior="12";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	if (mes.equals("12")){
		hasta=anio+"-"+mes+"-31";	
		mesAnterior="01";
		fechaAnterior=anioAnterior+"-"+mesAnterior+"-01";
	}
	
	
   	System.out.println("hasta: "+hasta);
   	System.out.println("fecha anterior: "+fechaAnterior);
   	Connection cn = null;
    CallableStatement cl = null;
    ResultSet rs = null;
    Long becados=0L;
    Long totalBe=0L;
    
	cn = null;
   	cl = null;
   	rs = null;
   	String call = "{CALL SP_TraerBecadosActivos(?,?)}";
	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    cl.setString(1, desde);
    cl.setString(2, fechaAnterior);        
    rs = cl.executeQuery();
    while (rs.next()) {
    	total=0L;
    	Connection cn2 = null;
        CallableStatement cl2 = null;
        ResultSet rs2 = null;       
    	cn2 = null;
       	cl2 = null;
       	rs2 = null;
       	String call2="";
       	String ok="";
    %>
    <tr>
    	<% if(rs.getString("entrevista")!=null){%>
		    <td style="color:green;"><%= rs.getString("rr") %></td>
		    <td style="color:green;" nowrap="nowrap" align="left"><%= rs.getString("zona") %></td>	    	
	    	<td style="color:green;"><%= rs.getString("ea") %></td>
	    	<td style="color:green;" nowrap="nowrap" align="left"><%= rs.getString("banco.nombre") %></td>
	    	<td style="color:green;" align="left"><%= rs.getString("persona.apellido")+" " + rs.getString("persona.nombre") %></td>
	    	<td style="color:green;" align="center">1</td>
	    	<% if(rs.getString("entrevista")!=null){ %><td style="color:green;" align="center">1</td><%}else{ %><td style="color:green;" align="center">0</td><%} %>
	    	<% if(rs.getString("aprobado")!=null){ %><td style="color:green;" align="center">1</td><%}else{ %><td style="color:green;" align="center">0</td><%} %>
	    	<% if(rs.getString("suspendido")!=null){ %><td style="color:green;" align="center">1</td><%}else{ %><td style="color:green;" align="center">0</td><%} %>
	    	<% if(rs.getString("cesado")!=null){ %><td style="color:green;" align="center">1</td><%}else{ %><td style="color:green;" align="center">0</td><%} %>
    	<%}else{ %>
    		<td style="color:red;"><%= rs.getString("rr") %></td>
		    <td style="color:red;" nowrap="nowrap" align="left"><%= rs.getString("zona") %></td>	    	
	    	<td style="color:red;"><%= rs.getString("ea") %></td>
	    	<td style="color:red;" nowrap="nowrap" align="left"><%= rs.getString("banco.nombre") %></td>
	    	<td style="color:red;" align="left"><%= rs.getString("persona.apellido")+" " + rs.getString("persona.nombre") %></td>
	    	<td style="color:red;" align="center">1</td>
	    	<% if(rs.getString("entrevista")!=null){ %><td style="color:red;" align="center">1</td><%}else{ %><td style="color:red;" align="center">0</td><%} %>
	    	<% if(rs.getString("aprobado")!=null){ %><td style="color:red;" align="center">1</td><%}else{ %><td style="color:red;" align="center">0</td><%} %>
	    	<% if(rs.getString("suspendido")!=null){ %><td style="color:red;" align="center">1</td><%}else{ %><td style="color:red;" align="center">0</td><%} %>
	    	<% if(rs.getString("cesado")!=null){ %><td style="color:red;" align="center">1</td><%}else{ %><td style="color:red;" align="center">0</td><%} %>
    	
    	<%} %>
    </tr>
    	  		
	<%} 
		Conexion.cerrarCall(cl);
        Conexion.cerrarConexion(cn);%>
	</tbody>
	</table>
	</center>
	</div>
</td>
</tr>

</table>
 
</body>
</html>