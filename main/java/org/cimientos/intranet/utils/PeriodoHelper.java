/**
 * 
 */
package org.cimientos.intranet.utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.web.controller.Conexion;

/**
 * @author plabaronnie
 *
 */
public class PeriodoHelper {

	/**
	 * Valida que las fechas del periodo que se va a crear o modificar
	 * no se superpongan con las de los periodos existentes de ese ciclo
	 * @param periodosCiclo
	 * @param fechaDesdeNueva
	 * @param fechaHastaNueva
	 * @return resultado validacion
	 */
	public static boolean validarFechasPeriodo(Long idPeriodo, List<Periodo> periodosCiclo, Date fechaDesdeNueva, Date fechaHastaNueva){
		java.sql.Date fechaNuevaDesde = new java.sql.Date(fechaDesdeNueva.getTime());
		java.sql.Date fechaNuevaHasta = new java.sql.Date(fechaHastaNueva.getTime());
		if(!periodosCiclo.isEmpty()){
			for (Periodo periodo : periodosCiclo) {
				//si es el mismo periodo paso
				if(idPeriodo == null || !periodo.getId().equals(idPeriodo)){
					java.sql.Date periodoInicio = new java.sql.Date( periodo.getFechaInicio().getTime());
					java.sql.Date periodoFin = new java.sql.Date( periodo.getFechaFin().getTime());
					if((fechaNuevaDesde.after(periodoInicio) && fechaNuevaDesde.before(periodoFin))||
							(fechaNuevaHasta.after(periodoInicio) && fechaNuevaHasta.before(periodoFin))){
						return false;
					}
				}
					
			}
			
		}	
			
		return true;
	}
	
	/**
	 * Valida que las fechas del periodo se encuentren dentro de las fechas inicio y fin del ciclo
	 * 
	 * @param ciclo
	 * @param fechaDesdeNueva
	 * @param fechaHastaNueva
	 * @return resultado validacion
	 */
	public static boolean validarFechasPeriodoConFechasCiclo(CicloPrograma ciclo, Date fechaDesdeNueva, Date fechaHastaNueva){
		return fechaDesdeNueva.compareTo(ciclo.getFechaInicio()) >= 0 && fechaHastaNueva.compareTo(ciclo.getFechaFin())<= 0;
	}
	/**
	 * Reordena los periodos segun su fecha desde y hasta
	 * 
	 * @param periodosCiclo
	 */
	public static void reordenarPeriodos(List<Periodo> periodosCiclo){
		Collections.sort(periodosCiclo, new PeriodoOrdenadoPorFecha());
		int orden = 1;
		for (Periodo periodo : periodosCiclo) {
			periodo.setOrden(orden);
			orden ++;
		}
	}
	
	/**
	 * Retorna el periodo que corresponde a la fecha actual
	 * 
	 * @param periodosCiclo
	 * @return el periodo actual
	 */
	public static Periodo getPeriodoActual(List<Periodo> periodosCiclo, Date fecha){
		Iterator<Periodo> iter = periodosCiclo.iterator();
		boolean encontre = false;
		Periodo periodo = null;
		
		while (iter.hasNext() && !encontre) {
			periodo = iter.next();
			if(fecha.compareTo(periodo.getFechaInicio()) >= 0 && fecha.compareTo(periodo.getFechaFin()) <= 0){

				encontre = true;
			}
		}

		return periodo;

	}
	
	public static Periodo getPeriodoActual2(List<Periodo> periodosCiclo, Date fecha){
		Iterator<Periodo> iter = periodosCiclo.iterator();
		boolean encontre = false;
		Periodo periodo = null;
		
		while (iter.hasNext() && !encontre) {
			periodo = iter.next();
			//if(fecha.compareTo(periodo.getFechaInicio()) >= 0 && fecha.compareTo(periodo.getFechaFin()) <= 0){
				//if(fecha.before(periodo.getFechaInicio()) && fecha.after(periodo.getFechaFin())){
					if(fecha.after(periodo.getFechaInicio()) && fecha.before(periodo.getFechaFin()) ){
				encontre = true;
			}
		}

		return periodo;

	}
	public static Long periodoActual3( Date fecha){
		//Instanciamos el objeto Calendar
		//en fecha obtenemos la fecha y hora del sistema
		Calendar fechaHoy = new GregorianCalendar();
		//Obtenemos el valor del año, mes, día,
		//hora, minuto y segundo del sistema
		//usando el método get y el parámetro correspondiente
		int año = fechaHoy.get(Calendar.YEAR);
		int mes = fechaHoy.get(Calendar.MONTH);
		int dia = fechaHoy.get(Calendar.DAY_OF_MONTH);
		int hora = fechaHoy.get(Calendar.HOUR_OF_DAY);
		int minuto = fechaHoy.get(Calendar.MINUTE);
		int segundo = fechaHoy.get(Calendar.SECOND);
		//System.out.println("++++++++++++++++++++++++++++++++++++++++++++");
		//System.out.print("Fecha y Hora de ingreso: "+ dia + "/" + (mes+1) + "/" + año);
		//System.out.printf(" %02d:%02d:%02d %n",hora, minuto, segundo);		
		String fechaActual=año + "-" + (mes+1) + "-" + dia;//+" "+hora+":"+minuto+":"+segundo;
		//System.out.println(fechaActual);
		//System.out.println(fecha);
		Long periodoActual=0L;
		Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        String call=null;
		try{
			
	        call = "{CALL SP_BuscarPeriodoActual(?)}";
	        cn = Conexion.getConexion();
	        cl = cn.prepareCall(call);
	        cl.setString(1, fechaActual);            
	        rs = cl.executeQuery();		                        
	        while (rs.next()) {
	        	 periodoActual= Long.parseLong(rs.getString(1));            	                        	
	        }
	        Conexion.cerrarCall(cl);
	        Conexion.cerrarConexion(cn);
		}
	        
	     catch (SQLException e) {
	        e.printStackTrace();
	        Conexion.cerrarCall(cl);
	        Conexion.cerrarConexion(cn);
	     }		
		
		

		return periodoActual;

	}
	
	
	public static String obtenerIdsPeriodos(List<Periodo> periodos){
		String result = "";
		for (Periodo periodo : periodos) {
			result = result + periodo.getId() + ",";
		}
		
		if(result.length() > 0)
			return result.substring(0, result.length() -1);
		else
			return result;
		
	}
	
	
	public static List<Long> obtenerListaIdsPeriodos(List<Periodo> periodos){
		ArrayList<Long> result = new ArrayList<Long>();
		for (Periodo periodo : periodos) {
			result.add(periodo.getId());			
		}		
		return result;
	}

	
	/**
	 * Obtiene el periodo con el orden pasado como parametro. Si el periodo no existe retorna el ultimo periodo
	 * @param list - periodos 
	 * @param i - orden
	 * @return Periodo
	 */
	public static Periodo obtenerPeriodoPorOrden(List<Periodo> periodos, int i) {
		for (Periodo periodo : periodos) {
			if(periodo.getOrden().equals(i))
				return periodo;
		}
		return periodos.get(periodos.size());
	}
	
	/**
	 * Obtner periodo por id
	 *
	 * @param periodos the periodos
	 * @param idPeriodo the id periodo
	 * @return Si no encuentra el periodo  devuelve null
	 * @since 05-may-2011
	 * @author cfigueroa
	 */
	public static Periodo obtenerPeriodoPorId(List<Periodo> periodos,Long idPeriodo){
		for (Periodo periodo : periodos) {
			if(periodo.getId().equals(idPeriodo)){
				return periodo;
			}
		}
		return null;
	}

}
