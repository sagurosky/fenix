package org.cimientos.intranet.web.controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

public class AutocompletarDB {
	
	 // metodo para buscar el select a la FA_TBL_DEFINICION_SG_PA_VW
    public static ArrayList<ZonaCimientos> obtenerZonas(){			    
    	ArrayList<ZonaCimientos> lista = new ArrayList<ZonaCimientos>();
    	//El array que contendra todos nuestros productos
    	String seleccion=null;
        Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        try {
            //Nombre del procedimiento almacenado	            
            String call = "select id,nombre from zona_cimientos order by nombre";
            cn = Conexion.getConexion();
            cl = cn.prepareCall(call);
            //La sentencia lo almacenamos en un resulset
            rs = cl.executeQuery();
            //Consultamos si hay datos para recorrerlo
            //e insertarlo en nuestro array
            while (rs.next()) {	                
                //seleccion=rs.getString("CON_PARAMETROS");	                
            	ZonaCimientos zona = new ZonaCimientos();
            	zona.setId(Long.parseLong(rs.getString(1)));
            	zona.setNombre(rs.getString(2));
            	lista.add(zona);
            }
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }
        return lista;    				    	
    }
	
	
	
	
}
