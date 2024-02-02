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
<title>Listado de Becas por Ea</title>
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
            total4 = api
                .column( 4 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal4 = api
                .column( 4, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 4 ).footer() ).html(
                pageTotal4 +' ( '+ total4 +')'
            );

            
            // Total over all pages
            total3 = api
                .column( 3 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal3 = api
                .column( 3, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 3 ).footer() ).html(
                pageTotal3 +' ( '+ total3 +')'
            );

            // Total over all pages
            total2 = api
                .column( 2 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal2 = api
                .column( 2, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 2 ).footer() ).html(
                pageTotal2 +' ( '+ total2 +')'
            );
            // Total over all pages
            total1 = api
                .column( 1 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal1 = api
                .column( 1, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 1 ).footer() ).html(
                pageTotal1 +' ( '+ total1 +')'
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
  //$( function mensaje(p1) {
  $(document).ready(function mensaje(p1) {  
  
  $( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( "#fila" ).on( "click", function() {
      $( "#dialog" ).dialog( "open" );
    });
  } );
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
	String mes = request.getParameter("mes");
	String anio = request.getParameter("anio");
	System.out.println(mes);
	System.out.println(anio);
if (mes!=null){
		
	}else{
		mes="09";
	}
	if (anio!=null){
		
	}else{
		anio="2017";
	}
%>	
<center>
<h3 style="background-color:#7FC2D8;">Listado Becados por EA</h3>
<br>
	<form id="frmReportes" method="post" action="listadoBecadosPorEa.jsp">	
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
		Año:<select id="anio" name="anio">
			<option value="2017">2017</option>
			<option value="2016">2016</option>
			<option value="2015">2015</option>
			<option value="2014">2014</option>
			<option value="2013">2013</option>
			<option value="2012">2012</option>
			<option value="2011">2011</option>
			<option value="2010">2010</option>		
		</select>	
		<input type="submit"  id="generar" name="generar" class="classnameboton" value="Buscar" >		
	</form>
	<br><br>
<table id="tContabilidad" class="display" cellspacing="0" width="100%">
	<thead>
		<tr>								
			<th>Ea</th>					
			<th>Activos</th>
			<th>Bajas</th>
			<th>Total</th>
			<th>Suspendidos</th>												
		</tr>
	</thead>
	<tfoot>
         <tr>
         	<th>Ea</th>					
			<th>Activos</th>
			<th>Bajas</th>
			<th>Total</th>
			<th>Suspendidos</th>		
         </tr>
     </tfoot>
	<tbody>	
	<% 
	
	
	String desde=anio+"-"+mes+"-01";
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
	
	
   	System.out.println(hasta);
	Connection cn = null;
    CallableStatement cl = null;
    ResultSet rs = null;
    Long becados=0L;
    Long totalBe=0L;
    
	cn = null;
   	cl = null;
   	rs = null;
   	String call = "{CALL SP_TraerTodosLosEas(?,?)}";
	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    cl.setString(1, desde);
    cl.setString(2, hasta);
    System.out.println(desde);
    System.out.println(hasta);
    System.out.println(fechaAnterior);
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
	   <tr  >
	    <td nowrap="nowrap" align="left" onclick="datosGuia('<%= rs.getString("id") %>')" ><%=rs.getString("persona.apellido") + " " +rs.getString("persona.nombre")%></td>		
    <%	
        ok="";
        System.out.println(rs.getString("id"));    	       
    	cn2 = null;
       	cl2 = null;
       	rs2 = null;
       	System.out.println(fechaAnterior);
       	call2 = "{CALL SP_TraerRenovadosPorEA(?,?)}";
    	cn2 = Conexion.getConexion();
        cl2 = cn2.prepareCall(call2); 
        cl2.setString(1,rs.getString("id") );
        cl2.setString(2, fechaAnterior);
        rs2 = cl2.executeQuery();
        while (rs2.next()) {
        	total=total+ Long.parseLong(rs2.getString("renovados"));
        	
        	ok="ok";
      %>  	
    	<td nowrap="nowrap" align="center"><%=rs2.getString("renovados")%></td>    	
    <%}
        Conexion.cerrarCall(cl2);
        Conexion.cerrarConexion(cn2);
        if(!ok.equals("ok")){%>
    		<td nowrap="nowrap" align="center">0</td>    		
    <%}
    	ok="";
        System.out.println(rs.getString("id"));    	       
    	cn2 = null;
       	cl2 = null;
       	rs2 = null;
       	System.out.println(hasta);
       	call2 = "{CALL SP_TraerCesadossPorEA(?,?,?)}";
    	cn2 = Conexion.getConexion();
        cl2 = cn2.prepareCall(call2); 
        cl2.setString(1,rs.getString("id") );
        cl2.setString(2, desde);
        cl2.setString(3, hasta);
        rs2 = cl2.executeQuery();
        while (rs2.next()) {
        	total=total+ Long.parseLong(rs2.getString("cesados"));
        	ok="ok";
      %>  	
    	<td nowrap="nowrap" align="center"><%=rs2.getString("cesados")%></td>
    <%}
        Conexion.cerrarCall(cl2);
        Conexion.cerrarConexion(cn2);
        if(!ok.equals("ok")){%>
		<td nowrap="nowrap" align="center">0</td>	
	<%}
		ok="";
    %>
    	<td align="center"><%=total %></td>
    	
    <%
    	ok="";
    	System.out.println(rs.getString("id"));    	       
		cn2 = null;
	   	cl2 = null;
	   	rs2 = null;
	   	System.out.println(hasta);
	   	call2 = "{CALL SP_TraerSuspendidosPorEA(?,?,?)}";
		cn2 = Conexion.getConexion();
	    cl2 = cn2.prepareCall(call2); 
	    cl2.setString(1,rs.getString("id") );
	    cl2.setString(2, desde);
	    cl2.setString(3, hasta);
	    rs2 = cl2.executeQuery();
	    while (rs2.next()) {	    	
	    	ok="ok";       
    %>     	
    	<td nowrap="nowrap" align="center"><%=rs2.getString("suspendidos")%></td>	
    <%}
        Conexion.cerrarCall(cl2);
        Conexion.cerrarConexion(cn2);
        if(!ok.equals("ok")){%>
		<td nowrap="nowrap" align="center">0</td>	
	<%}
		ok="";
    %>	
    </tr>
    <% System.out.println("--------------------------------");
    }
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