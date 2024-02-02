<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de Becas por Ea</title>


<body>

<% 
	String mes = request.getParameter("mes");
	String anio = request.getParameter("anio");
if (mes!=null){
		
	}else{
		mes="07";
	}
	if (anio!=null){
		
	}else{
		anio="2017";
	}
%>	

<h3 style="background-color:#7FC2D8;">Listado Becados por EA</h3>

<table id="tContabilidad">
	
		<tr>								
			<th>Ea</th>			
			<th>Incorporados</th>						
			<th>Renovados</th>
			<th>Activos</th>
			<th>Cesados</th>
			<th>No Renovados</th>
			<th>Total</th>												
		</tr>
	
	
	<% 
	
	
	String desde=anio+"-"+mes+"-01";
   	String hasta="";
   	Long total=0L;
	if (mes.equals("01") ||mes.equals("03") ||mes.equals("05") ||mes.equals("07") ||mes.equals("08") ||mes.equals("10") ||mes.equals("12")){
   		hasta=anio+"-"+mes+"-31";	
   	}
	if (mes.equals("04") ||mes.equals("06") ||mes.equals("09") ||mes.equals("11")){
		hasta=anio+"-"+mes+"-30";
   	}
	if (mes.equals("02")){
		hasta=anio+"-"+mes+"-28";
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
   	String call = "{CALL SP_TraerTodosLosEas}";
	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    //cl.setString(1, mes);
    //cl.setString(2, anio);
    rs = cl.executeQuery();
    while (rs.next()) {    	
    %>
	   <tr>
	    <td nowrap="nowrap"   align="left"><%=rs.getString("persona.apellido") + " " +rs.getString("persona.nombre")%></td>		
    	<%	System.out.println(rs.getString("id"));
    	total=0L;
    	Long activos=0L;
    	String ok="";
    	Connection cn2 = null;
        CallableStatement cl2 = null;
        ResultSet rs2 = null;       
    	cn2 = null;
       	cl2 = null;
       	rs2 = null;
       	String call2 = "{CALL SP_TraerIncorporadosPorEA(?)}";
    	cn2 = Conexion.getConexion();
        cl2 = cn2.prepareCall(call2); 
        cl2.setString(1,rs.getString("id") );
        //cl.setString(2, anio);
        rs2 = cl2.executeQuery();
        while (rs2.next()) {
        	total=total+ Long.parseLong(rs2.getString("incorporados"));
        	activos=activos +Long.parseLong(rs2.getString("incorporados"));
        	ok="ok";
    %>	
	<td nowrap="nowrap" align="center"><%=rs2.getString("incorporados")%></td>							    
	<%}
        Conexion.cerrarCall(cl2);
        Conexion.cerrarConexion(cn2);
        if(!ok.equals("ok")){%>
        	<td nowrap="nowrap" align="center"></td>
        <%}
        ok="";
        System.out.println(rs.getString("id"));    	       
    	cn2 = null;
       	cl2 = null;
       	rs2 = null;
       	call2 = "{CALL SP_TraerRenovadosPorEA(?)}";
    	cn2 = Conexion.getConexion();
        cl2 = cn2.prepareCall(call2); 
        cl2.setString(1,rs.getString("id") );
        //cl.setString(2, anio);
        rs2 = cl2.executeQuery();
        while (rs2.next()) {
        	total=total+ Long.parseLong(rs2.getString("renovados"));
        	activos=activos+Long.parseLong(rs2.getString("renovados"));
        	ok="ok";
      %>  	
    	<td nowrap="nowrap" align="center"><%=rs2.getString("renovados")%></td>
    	<td nowrap="nowrap" align="center"><%=activos%></td>
    <%}
        Conexion.cerrarCall(cl2);
        Conexion.cerrarConexion(cn2);
        if(!ok.equals("ok")){%>
    		<td nowrap="nowrap" align="center"></td>
    		<td nowrap="nowrap" align="center"><%=activos%></td>
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
		<td nowrap="nowrap" align="center"></td>
	<%}
		ok="";
        System.out.println(rs.getString("id"));    	       
    	cn2 = null;
       	cl2 = null;
       	rs2 = null;
       	call2 = "{CALL SP_TraerNoRenovadosPorEA(?,?,?)}";
    	cn2 = Conexion.getConexion();
        cl2 = cn2.prepareCall(call2); 
        cl2.setString(1,rs.getString("id") );
        cl2.setString(2, desde);
        cl2.setString(3, hasta);
        rs2 = cl2.executeQuery();
        while (rs2.next()) {
        	total=total+ Long.parseLong(rs2.getString("no_renovados"));
        	ok="ok";
      %>  	
    	<td nowrap="nowrap" align="center"><%=rs2.getString("no_renovados")%></td>
    <%}
        Conexion.cerrarCall(cl2);
        Conexion.cerrarConexion(cn2);
        if(!ok.equals("ok")){%>
		<td nowrap="nowrap" align="center"></td>
	<%}
		ok="";
    %>
    	<td align="center"><%=total %></td>
    </tr>
    <% System.out.println("--------------------------------");
    }
    Conexion.cerrarCall(cl);
    Conexion.cerrarConexion(cn);
    System.out.println("excel");
    response.setContentType("application/vnd.ms-excel");
	response.setDateHeader("Expires", 0);
	response.setHeader("CacheControl", "Private");
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "No-cache");
	response.setHeader("Pragma", "store");
	response.setHeader("Cache-Control", "store");
	response.setHeader("Content-Disposition", "attachment; filename=BecadosPorEA.xls");	
	%>	  		
	
</table>


</body>
</html>