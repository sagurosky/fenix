/**
 * 
 */
package org.cimientos.intranet.utils.pagos;

import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;

/**
 * Esta clase representa un archivo de Pago de Beca para banco Galicia.
 * Genera una lista de arreglos de String (cada una representaria una linea en un archivo).
 * @author plabaronnie
 *
 */
public class ArchivoPagoBecaGalicia extends ArchivoPago{
	
	private String[] columnas = new String[]{"Cuenta", "Nombre", "Importe", "Concepto"};
	

	private static final String CONCEPTO = "09";
	
	
	public ArchivoPagoBecaGalicia(List<Pago> pagos) {
		super();
		this.setNombre("Galicia");
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
			columna[0] = this.getNroCuenta(entry.getKey());
			columna[1] = this.getNombre(entry.getKey());
			columna[2] = this.getImporte(entry.getKey());
			columna[3] = CONCEPTO;
			datos.add(columna);
		}
	}



	

}
