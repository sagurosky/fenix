<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@page import="java.util.ArrayList"%>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%
  String becado=request.getParameter("becado");
  String zona=request.getParameter("zona");	
  String idBecado=request.getParameter("idBecado");
  String individual="";
  String grupal="";
  String dupla="";
  String otro="";
  String telefonico="";
  String[] te=request.getParameterValues("test[]");
	for (int i=0; i<te.length; i++){
	if (te[i].equals("Individual")){
		individual="si";
	}
	if (te[i].equals("Grupal")){
		grupal="si";
	}
	if (te[i].equals("Virtual")){
	//System.out.println("dupla");
	dupla="si";

	}
	if (te[i].equals("Otro")){
		otro="si";
	}
	if (te[i].equals("Telefonico")){
		telefonico="si";
	}
	//System.out.println(te[i]);

}
	String qma=request.getParameter("qma");
	String qmd=request.getParameter("qmd");
	String qmqnsp=request.getParameter("qmqnsp");
	String qmqnhm=request.getParameter("qmqnhm");
	String qmqa=request.getParameter("qmqa");
	String materiasAdeuda=request.getParameter("materiasAdeuda");
	String evaluacion=request.getParameter("evaluacion");
	String apoyoEscolar=request.getParameter("apoyoEscolar");
	String ciclo=request.getParameter("ciclo");
	ciclo="2021";
	System.out.println(ciclo);
	String periodo=request.getParameter("periodo");
	String fase=request.getParameter("fase");
	String fechaActualizacion2=request.getParameter("fase2");
	String egreso=request.getParameter("egreso");
	//String telefonico=request.getParameter("telefonico");
	String planAccion=request.getParameter("planAccion");
	String observacionesOficina=request.getParameter("observacionesOficina");
	String egreso2="";
 	if(egreso.equals("Egreso Pendiente")){
 		egreso2="2";
 	}else{
 		if(egreso.equals("Egreso Efectivo")){
 			egreso2="3";
 		}else{
 			if(egreso.equals("0")){
 			egreso2="2";
 		}}
 	}	 		
 	System.out.println("SEA: "+egreso2);
	System.out.println("ciclo: "+ciclo);
	String enBase="0";
	if (qma.equals("")){
		qma="0";
	}
	if (qmd.equals("")){
		qmd="0";
	}
	if (qmqnsp.equals("")){
		qmqnsp="0";
	}
	if (qmqnhm.equals("")){
		qmqnhm="0";
	}
	if (qmqa.equals("")){
		qmqa="0";
	}
	
	
	String periodoEgreso="";
	
	
	if (ciclo==null || ciclo.equals("2019")){
		if (periodo.equals("Marzo")){periodoEgreso="346";}
		if (periodo.equals("Abril")){periodoEgreso="347";}
		if (periodo.equals("Mayo")){periodoEgreso="348";}
		if (periodo.equals("Junio")){periodoEgreso="349";}
		if (periodo.equals("Julio")){periodoEgreso="350";}
		if (periodo.equals("Agosto")){periodoEgreso="351";}
		if (periodo.equals("Septiembre")){periodoEgreso="352";}
		if (periodo.equals("Octubre")){periodoEgreso="353";}
		if (periodo.equals("Noviembre")){periodoEgreso="354";}
		if (periodo.equals("Diciembre")){periodoEgreso="355";}
	}
	
	if (ciclo.equals("2020")){
		if (periodo.equals("Marzo")){periodoEgreso="356";}
		if (periodo.equals("Abril")){periodoEgreso="357";}
		if (periodo.equals("Mayo")){periodoEgreso="358";}
		if (periodo.equals("Junio")){periodoEgreso="359";}
		if (periodo.equals("Julio")){periodoEgreso="360";}
		if (periodo.equals("Agosto")){periodoEgreso="361";}
		if (periodo.equals("Septiembre")){periodoEgreso="362";}
		if (periodo.equals("Octubre")){periodoEgreso="363";}
		if (periodo.equals("Noviembre")){periodoEgreso="364";}
		if (periodo.equals("Diciembre")){periodoEgreso="365";}
	}
	
	if (ciclo.equals("2021")){
		if (periodo.equals("Marzo")){periodoEgreso="366";}
		if (periodo.equals("Abril")){periodoEgreso="367";}
		if (periodo.equals("Mayo")){periodoEgreso="368";}
		if (periodo.equals("Junio")){periodoEgreso="369";}
		if (periodo.equals("Julio")){periodoEgreso="370";}
		if (periodo.equals("Agosto")){periodoEgreso="371";}
		if (periodo.equals("Septiembre")){periodoEgreso="372";}
		if (periodo.equals("Octubre")){periodoEgreso="373";}
		if (periodo.equals("Noviembre")){periodoEgreso="374";}
		if (periodo.equals("Diciembre")){periodoEgreso="375";}
	}
	
	if (ciclo.equals("2022")){
		if (periodo.equals("Marzo")){periodoEgreso="376";}
		if (periodo.equals("Abril")){periodoEgreso="377";}
		if (periodo.equals("Mayo")){periodoEgreso="378";}
		if (periodo.equals("Junio")){periodoEgreso="379";}
		if (periodo.equals("Julio")){periodoEgreso="380";}
		if (periodo.equals("Agosto")){periodoEgreso="381";}
		if (periodo.equals("Septiembre")){periodoEgreso="382";}
		if (periodo.equals("Octubre")){periodoEgreso="383";}
		if (periodo.equals("Noviembre")){periodoEgreso="384";}
		if (periodo.equals("Diciembre")){periodoEgreso="385";}
	}
	
	if (ciclo.equals("2023")){
		if (periodo.equals("Marzo")){periodoEgreso="386";}
		if (periodo.equals("Abril")){periodoEgreso="387";}
		if (periodo.equals("Mayo")){periodoEgreso="388";}
		if (periodo.equals("Junio")){periodoEgreso="389";}
		if (periodo.equals("Julio")){periodoEgreso="390";}
		if (periodo.equals("Agosto")){periodoEgreso="391";}
		if (periodo.equals("Septiembre")){periodoEgreso="392";}
		if (periodo.equals("Octubre")){periodoEgreso="393";}
		if (periodo.equals("Noviembre")){periodoEgreso="394";}
		if (periodo.equals("Diciembre")){periodoEgreso="395";}
	}

	
	if (ciclo.equals("2018")){
		if (periodo.equals("Marzo")){periodoEgreso="336";}
		if (periodo.equals("Abril")){periodoEgreso="337";}
		if (periodo.equals("Mayo")){periodoEgreso="338";}
		if (periodo.equals("Junio")){periodoEgreso="339";}
		if (periodo.equals("Julio")){periodoEgreso="340";}
		if (periodo.equals("Agosto")){periodoEgreso="341";}
		if (periodo.equals("Septiembre")){periodoEgreso="342";}
		if (periodo.equals("Octubre")){periodoEgreso="343";}
		if (periodo.equals("Noviembre")){periodoEgreso="344";}
		if (periodo.equals("Diciembre")){periodoEgreso="345";}
	}
	if (ciclo.equals("2017")){
		if (periodo.equals("Marzo")){periodoEgreso="326";}
		if (periodo.equals("Abril")){periodoEgreso="327";}
		if (periodo.equals("Mayo")){periodoEgreso="328";}
		if (periodo.equals("Junio")){periodoEgreso="329";}
		if (periodo.equals("Julio")){periodoEgreso="330";}
		if (periodo.equals("Agosto")){periodoEgreso="331";}
		if (periodo.equals("Septiembre")){periodoEgreso="332";}
		if (periodo.equals("Octubre")){periodoEgreso="333";}
		if (periodo.equals("Noviembre")){periodoEgreso="334";}
		if (periodo.equals("Diciembre")){periodoEgreso="345";}
	}
	if (ciclo.equals("2016")){
		if (periodo.equals("Marzo")){periodoEgreso="316";}
		if (periodo.equals("Abril")){periodoEgreso="317";}
		if (periodo.equals("Mayo")){periodoEgreso="318";}
		if (periodo.equals("Junio")){periodoEgreso="319";}
		if (periodo.equals("Julio")){periodoEgreso="320";}
		if (periodo.equals("Agosto")){periodoEgreso="321";}
		if (periodo.equals("Septiembre")){periodoEgreso="322";}
		if (periodo.equals("Octubre")){periodoEgreso="323";}
		if (periodo.equals("Noviembre")){periodoEgreso="324";}
		if (periodo.equals("Diciembre")){periodoEgreso="325";}
	}
	if (ciclo.equals("2015")){
		if (periodo.equals("Marzo")){periodoEgreso="306";}
		if (periodo.equals("Abril")){periodoEgreso="307";}
		if (periodo.equals("Mayo")){periodoEgreso="308";}
		if (periodo.equals("Junio")){periodoEgreso="309";}
		if (periodo.equals("Julio")){periodoEgreso="310";}
		if (periodo.equals("Agosto")){periodoEgreso="311";}
		if (periodo.equals("Septiembre")){periodoEgreso="312";}
		if (periodo.equals("Octubre")){periodoEgreso="313";}
		if (periodo.equals("Noviembre")){periodoEgreso="314";}
		if (periodo.equals("Diciembre")){periodoEgreso="355";}
	}
	if (ciclo.equals("2014")){
		if (periodo.equals("Marzo")){periodoEgreso="296";}
		if (periodo.equals("Abril")){periodoEgreso="297";}
		if (periodo.equals("Mayo")){periodoEgreso="298";}
		if (periodo.equals("Junio")){periodoEgreso="299";}
		if (periodo.equals("Julio")){periodoEgreso="300";}
		if (periodo.equals("Agosto")){periodoEgreso="301";}
		if (periodo.equals("Septiembre")){periodoEgreso="302";}
		if (periodo.equals("Octubre")){periodoEgreso="303";}
		if (periodo.equals("Noviembre")){periodoEgreso="304";}
		if (periodo.equals("Diciembre")){periodoEgreso="305";}
	}
	if (ciclo.equals("2013")){
		if (periodo.equals("Marzo")){periodoEgreso="286";}
		if (periodo.equals("Abril")){periodoEgreso="287";}
		if (periodo.equals("Mayo")){periodoEgreso="288";}
		if (periodo.equals("Junio")){periodoEgreso="289";}
		if (periodo.equals("Julio")){periodoEgreso="290";}
		if (periodo.equals("Agosto")){periodoEgreso="291";}
		if (periodo.equals("Septiembre")){periodoEgreso="292";}
		if (periodo.equals("Octubre")){periodoEgreso="293";}
		if (periodo.equals("Noviembre")){periodoEgreso="294";}
		if (periodo.equals("Diciembre")){periodoEgreso="295";}
	}
	if (ciclo.equals("2012")){
		if (periodo.equals("Marzo")){periodoEgreso="276";}
		if (periodo.equals("Abril")){periodoEgreso="277";}
		if (periodo.equals("Mayo")){periodoEgreso="278";}
		if (periodo.equals("Junio")){periodoEgreso="279";}
		if (periodo.equals("Julio")){periodoEgreso="280";}
		if (periodo.equals("Agosto")){periodoEgreso="281";}
		if (periodo.equals("Septiembre")){periodoEgreso="282";}
		if (periodo.equals("Octubre")){periodoEgreso="283";}
		if (periodo.equals("Noviembre")){periodoEgreso="284";}
		if (periodo.equals("Diciembre")){periodoEgreso="285";}
	}
	if (ciclo.equals("2011")){
		if (periodo.equals("Marzo")){periodoEgreso="266";}
		if (periodo.equals("Abril")){periodoEgreso="267";}
		if (periodo.equals("Mayo")){periodoEgreso="268";}
		if (periodo.equals("Junio")){periodoEgreso="269";}
		if (periodo.equals("Julio")){periodoEgreso="270";}
		if (periodo.equals("Agosto")){periodoEgreso="271";}
		if (periodo.equals("Septiembre")){periodoEgreso="272";}
		if (periodo.equals("Octubre")){periodoEgreso="273";}
		if (periodo.equals("Noviembre")){periodoEgreso="274";}
		if (periodo.equals("Diciembre")){periodoEgreso="275";}
	}
	if (ciclo.equals("2010")){
		if (periodo.equals("Marzo")){periodoEgreso="256";}
		if (periodo.equals("Abril")){periodoEgreso="257";}
		if (periodo.equals("Mayo")){periodoEgreso="258";}
		if (periodo.equals("Junio")){periodoEgreso="259";}
		if (periodo.equals("Julio")){periodoEgreso="260";}
		if (periodo.equals("Agosto")){periodoEgreso="261";}
		if (periodo.equals("Septiembre")){periodoEgreso="262";}
		if (periodo.equals("Octubre")){periodoEgreso="263";}
		if (periodo.equals("Noviembre")){periodoEgreso="264";}
		if (periodo.equals("Diciembre")){periodoEgreso="265";}
	}
// alta en base
	Connection cn = null;
    CallableStatement cl = null;
    ResultSet rs = null;
    cn = null;
   	cl = null;
   	rs = null;
   	String call = "SELECT * FROM post_pfe where idBecado="+idBecado;
	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    rs = cl.executeQuery();
    while (rs.next()) {
		enBase=rs.getString("id");
	}
	//System.out.println("b "+idBecado);
	//System.out.println("qma "+qma);
	//System.out.println("qmd "+qmd);
	//System.out.println("qmqnsp "+qmqnsp);
	//System.out.println("qmqnhm "+qmqnhm);
	//System.out.println("qmqa "+qmqa);
	//System.out.println("materias adeuda "+materiasAdeuda);
	//System.out.println("indi " +individual);
	//System.out.println("gru "+ grupal);
	//System.out.println("dupla "+dupla);
	//System.out.println("telefonico "+telefonico);
	//System.out.println("otro "+otro);
	//System.out.println("eval "+evaluacion);
	//System.out.println("apoyo "+apoyoEscolar);
	//System.out.println("plan accion "+planAccion);
	Statement st = cn.createStatement();
	if(enBase.equals("0")){
		st.executeUpdate("insert into post_pfe (idBecado,qma,qmd,qmqnsp,qmqnhm,qmqa,materias_adeuda,individual,grupal,dupla,otro,evaluacion,apoyo_escolar, ciclo,periodo,observaciones_oficina,egreso,telefonico,plan_accion) values('"+idBecado+"','"+qma+"','"+qmd+"','"+qmqnsp+"','"+qmqnhm+"','"+qmqa+"','"+materiasAdeuda+"','"+individual+"','"+grupal+"','"+dupla+"','"+otro+"','"+evaluacion+"','"+apoyoEscolar+"','"+ciclo+"','"+periodo+"','"+observacionesOficina+"','"+egreso+"','"+telefonico+"','"+planAccion+"')");				
		st.executeUpdate("update perfil_alumno set ultima_actualizacion='"+fechaActualizacion2+"' where id="+idBecado);
		if(egreso2.equals("3")){
			st.executeUpdate("update perfil_alumno set situacion_escolar=3, periodo_de_egreso='"+ periodoEgreso+"' where id="+idBecado);
		}
		if(egreso2.equals("2")){
			st.executeUpdate("update perfil_alumno set situacion_escolar=2 where id="+idBecado);
		}
		st.close();	
	}else{
		st.executeUpdate("update post_pfe set qma='"+qma+"',qmd='"+qmd+"',qmqnsp='"+qmqnsp+"',qmqnhm='"+qmqnhm+"',qmqa='"+qmqa+"',materias_adeuda='"+materiasAdeuda+"',individual='"+individual+"',grupal='"+grupal+"',dupla='"+dupla+"',otro='"+otro+"',evaluacion='"+evaluacion+"',apoyo_escolar='"+"',plan_accion='"+planAccion+"',ciclo='"+ciclo+"',periodo='"+periodo+"',telefonico='"+telefonico+"',observaciones_oficina='"+observacionesOficina+"',egreso='"+egreso+"' where idBecado="+idBecado);	
		st.executeUpdate("update perfil_alumno set ultima_actualizacion='"+fechaActualizacion2+"' where id="+idBecado);		
		if(egreso2.equals("3")){
			st.executeUpdate("update perfil_alumno set situacion_escolar=3, periodo_de_egreso='"+ periodoEgreso+"' where id="+idBecado);
		}
		if(egreso2.equals("2")){
			st.executeUpdate("update perfil_alumno set situacion_escolar=2 where id="+idBecado);
		}
		
		st.close();	
	}
	Conexion.cerrarConexion(cn);
	System.out.println("altaPostPFE idbecado= "+idBecado);
	System.out.println("altaPostPFE ciclo= "+ciclo);
	//response.sendRedirect("detallePostPFE.jsp?id="+idBecado+"&ciclo="+ciclo);
	response.sendRedirect("postPFE.jsp?ciclo=33");
%>						
