package org.cimientos.intranet.utils.pagos;

import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;

public class ArchivoPagoBecaSantander extends ArchivoPago{

private String[] columnas = new String[]{"CBU", "CUIT", "Nombre", "Importe"};
	

	
	public ArchivoPagoBecaSantander(List<Pago> pagos) {
		super();
		this.setNombre("Santander");
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
			columna[0] = "'"+this.getSucursal(entry.getKey());
			columna[1] = this.getNroCuenta(entry.getKey());
			columna[2] = this.getNombre(entry.getKey());
			columna[3] = this.getImporte(entry.getKey());
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
				//sucursal = becado.getResponsable1().getSucursalBanco().getNumeroSucursal();
				sucursal = becado.getResponsable1().getCelular();
			}
			return sucursal;
	}
	
	/**
	 * @param pago
	 * @return
	 */
	protected String getNroCuenta(PerfilAlumno becado) {
		
		//String nroCuenta = super.getNroCuenta(becado);
		String nroCuenta = becado.getResponsable1().getCuilCuit();
		//return "0000" + nroCuenta;
		return nroCuenta;
	}

	
}
