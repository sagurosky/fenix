<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.cimientos.intranet.web.controller.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
try{
	String s[]=null;
	
	Connection cn = null;
	cn = Conexion.getConexion();
	String query = (String)request.getParameter("q");
	String solapa=request.getParameter("s");
	String columna=request.getParameter("c");
	String intCode=request.getParameter("intCode");
	String usuario=request.getParameter("usuario");
	//System.out.println(query);
	Statement st=cn.createStatement();	
    CallableStatement cl = null;
    ResultSet rs = null;
	//String seleccion= AutocompletarDB.llamadaBD(solapa,columna);
	String seleccion="";
	//System.out.println(seleccion);
	
	////System.out.println(solapa);
	////System.out.println(columna);
	////System.out.println(usuario);
	// solapa 2
	query=query.trim();
	
	if(query.equals(" "))
	{
		query="";
	}
	
	seleccion="select id,nombre from zona_cimientos where nombre like '%"+query+"%'";
	/*
	seleccion=seleccion.replace("P_CODIGO", query);
	seleccion=seleccion.replace("P_DESC"  , query);
	seleccion=seleccion.replace(":user"  , "'"+usuario+"'");
	if (columna!="Estado"){
		if (intCode!=null){
			seleccion=seleccion.replace("CODIGO_INTERNO"  , "'"+intCode+"'");
		}	
	}else{
		if (intCode!=null){
			seleccion=seleccion.replace("CODIGO_REGISTRO"  ,  "'"+intCode+"'");
		}	
	}	
	//System.out.println(intCode);
	*/
	//System.out.println(seleccion);
	String call = seleccion;
    cn = Conexion.getConexion();
    cl = cn.prepareCall(call);
    rs = cl.executeQuery();	
	List li = new ArrayList();
	while(rs.next())
	{
		li.add(rs.getString(1)+"==>"+rs.getString(2));
					
			////System.out.println(rs.getString(1)+" "+rs.getString(2));
	}
	String[] str = new String[li.size()];
	Iterator it = li.iterator();
	int i = 0;
	while(it.hasNext())
	{
		String p = (String)it.next();
		str[i] = p;
		i++;
	}
	//jQuery related start
	//String query = (String)request.getParameter("q");
	int cnt=1;
	for(int j=0;j<str.length;j++)
	{
		//if(str[j].toUpperCase().startsWith(query.toUpperCase()))
		//{
			out.print(str[j]+"\n");
			
			cnt++;
		//}
	}
	if (str.length<=0){
		out.print("NO EXISTE"+"\n");
	}
	//jQuery related end
	rs.close();
	st.close();
	cn.close();
	}
	catch(Exception e){
	e.printStackTrace();
}
%>
