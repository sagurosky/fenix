/**
 * 
 */
package org.cimientos.intranet.utils.pagos;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;

/**
 * @author plabaronnie
 *
 */
public abstract class ArchivoPago {

	
	protected List<String[]> datos = new ArrayList<String[]>();
	
	protected String nombre;
	
	protected String cuit;
	
	protected String cbu;
	
	protected Map<PerfilAlumno, Double> pagosAgrupados = new HashMap<PerfilAlumno, Double>();
	
	/**
	 * Agrupa los pagos por becado
	 * 
	 * @param pagos
	 */
	protected void agruparPagos(List<Pago> pagos){
		for (Pago pago : pagos) {
			PerfilAlumno becado = pago.getBecado();
			  double total;
			  if(pagosAgrupados.containsKey(becado))
			     total = pagosAgrupados.get(becado);
			  else
			     total = 0;
			  total += pago.getMonto() + (pago.getExtra() != null ? pago.getExtra() : 0);
			  pagosAgrupados.put(becado,total);
		}
	}

	/**
	 * @return the datos
	 */
	public List<String[]> getDatos() {
		return datos;
	}

	/**
	 * @param datos the datos to set
	 */
	public void setDatos(List<String[]> datos) {
		this.datos = datos;
	}

	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	
	protected String getCuit(PerfilAlumno becado) {
		String cuit="";
		if(becado.getResponsable1() != null && becado.getResponsable1().getCuilCuit()!= null){
			cuit = becado.getResponsable1().getCuilCuit();
		}
		return cuit;
	}

	public void setCbu(String cbu) {
		this.cuit = cbu;
	}

	protected String getCbu(PerfilAlumno becado) {
		String cbu="";
		if(becado.getResponsable1() != null && becado.getResponsable1().getNroCuenta()!= null){			
			if(becado.getResponsable1().getBanco().getId()==2){
				cbu="";
			}else{
				cbu = "0"+becado.getResponsable1().getCelular().substring(0, 8)+"000"+becado.getResponsable1().getCelular().substring(8, 22);
			}
		}
		return cbu;
	}

	public void setCuit(String cuit) {
		this.cuit = cuit;
	}

	
	/**
	 * @param pago
	 * @return
	 */
	protected String getImporte(PerfilAlumno becado) {
		String importe ="0";
		if(pagosAgrupados.get(becado) != null){
			DecimalFormatSymbols coma = new DecimalFormatSymbols();
			coma.setDecimalSeparator(',');
			DecimalFormat formatodecimal = new DecimalFormat("0.00",coma);
			importe = formatodecimal.format(pagosAgrupados.get(becado));
		}
		return importe;
	}
	
	/**
	 * @param pago
	 * @return
	 */
	protected String getNroCuenta(PerfilAlumno becado) {
		String nroCuenta ="0";
		if(becado.getResponsable1() != null && becado.getResponsable1().getNroCuenta()!= null){		
			nroCuenta = becado.getResponsable1().getNroCuenta();
			
			/* sacado 
			/ if(becado.getResponsable1().getBanco().getId()!=2){
			/ 	nroCuenta="";
			/ }
			*/
		}
		return nroCuenta;
	}
	
	/**
	 * @param pago
	 * @return
	 */
	protected String getNombre(PerfilAlumno becado) {
		String nombre ="-";
		if(becado.getResponsable1() != null){
			nombre = StringUtils.capitalize( becado.getResponsable1().getApellido()) + " ";
			nombre += StringUtils.capitalize(becado.getResponsable1().getNombre()) ;
		}
		return nombre;
	}
}
