/**
 * 
 */
package org.cimientos.intranet.utils.pagos;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;

/**
 * Esta clase representa un archivo de Pago de Beca para banco Macro.
 * Genera una lista de arreglos de String (cada una representaria una linea en un archivo).
 * @author plabaronnie
 *
 */
public class ArchivoPagoBecaMacro extends ArchivoPago{
	
	private String[] columnas = new String[]{"Nro Doc", "Nro Cta", "Importe"};
	

	
	public ArchivoPagoBecaMacro(List<Pago> pagos) {
		super();
		this.setNombre("Macro");
		this.agruparPagos(pagos);
		this.generarDatos();
	}

	/**
	 * @param pagos
	 */
	private void generarDatos() {
//		datos.add(columnas);
		for (Map.Entry<PerfilAlumno, Double> entry : pagosAgrupados.entrySet()) {
			String[] columna = new String[columnas.length];
			columna[0] = this.getNroDocumento(entry.getKey());
			columna[1] = this.getNroCuenta(entry.getKey());
			columna[2] = this.getImporte(entry.getKey());
			datos.add(columna);
		}
	}



	/**
	 * @param pago
	 * @return
	 */
	private String getNroDocumento(PerfilAlumno becado) {
		String nroDoc = "0";
		if(becado.getResponsable1() != null && becado.getResponsable1().getDni() != null){
			nroDoc =  becado.getResponsable1().getDni().toString();
		}		
		return nroDoc;
	}

	/**
	 * @param pago
	 * @return
	 */
	protected String getImporte(PerfilAlumno becado) {
		String importe = super.getImporte(becado);
		return StringUtils.remove(importe, ',');
	}
	

}
