/**
 * 
 */
package org.cimientos.intranet.utils.pagos;

import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;

/**
 * Esta clase representa un archivo de Pago de Beca para banco Industrial.
 * Genera una lista de arreglos de String (cada una representaria una linea en un archivo).
 * @author plabaronnie
 *
 */
public class ArchivoPagoBecaIndustrial extends ArchivoPago{
	
	private String[] columnas = new String[]{"Sucursal", "Numero de Cuenta", "Nombre", "Importe","DNI"};
	

	
	public ArchivoPagoBecaIndustrial(List<Pago> pagos) {
		super();
		this.setNombre("Industrial");
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
			columna[0] = this.getSucursal(entry.getKey());
			columna[1] = this.getNroCuenta(entry.getKey());
			columna[2] = this.getNombre(entry.getKey());
			columna[3] = this.getImporte(entry.getKey());
			columna[4] = String.valueOf(this.getDNI(entry.getKey()));
			datos.add(columna);
		}
	}


	/**
	 * @param pago
	 * @return
	 */
	private String getSucursal(PerfilAlumno becado) {
			String sucursal ="0";
			if(becado.getResponsable1() != null && becado.getResponsable1().getSucursalBanco() != null){
				sucursal = becado.getResponsable1().getSucursalBanco().getNumeroSucursal();
			}
			return sucursal;
	}
	
	private Integer getDNI(PerfilAlumno becado) {
		Integer dni;
		
			dni = becado.getResponsable1().getDni();
		
		return dni;
}
	
	/**
	 * @param pago
	 * @return
	 */
	protected String getNroCuenta(PerfilAlumno becado) {
		String nroCuenta = super.getNroCuenta(becado);
		return "0000" + nroCuenta;
	}



	

}
