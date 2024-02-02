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
public class ArchivoPagoBecaXGalicia extends ArchivoPago{
	
	private String[] columnas = new String[]{"Nombre", "Cuit", "FechaDispo", "TipoCC", "Moneda","Cta","CBU","Codigo","Tipo","Importe","Leyenda","Identif","FechaProceso","CodigoConcepto"};
	

	private static final String CONCEPTO = "09";
	
	
	public ArchivoPagoBecaXGalicia(List<Pago> pagos, String fd, String fp, String bancoSeleccionado) {
		super();
		this.setNombre("2-Detalle");
		this.agruparPagos(pagos);
		this.generarDatos(fd,fp, bancoSeleccionado);
	}

	/**
	 * @param pagos
	 */
	private void generarDatos(String fd, String fp, String bancoSeleccionado) {
//		datos.add(columnas);
		String nombreApellido="";		
		for (Map.Entry<PerfilAlumno, Double> entry : pagosAgrupados.entrySet()) {
			nombreApellido="";		
			String[] columna = new String[columnas.length];
			nombreApellido=this.getNombre(entry.getKey()).toUpperCase();
			nombreApellido=nombreApellido.replace("Ñ", "N");
			nombreApellido=nombreApellido.replace("Á", "A");
			nombreApellido=nombreApellido.replace("É", "E");
			nombreApellido=nombreApellido.replace("Í", "I");
			nombreApellido=nombreApellido.replace("Ó", "O");
			nombreApellido=nombreApellido.replace("Ú", "U");
			nombreApellido=nombreApellido.replace(".", " ");			
			columna[0] = nombreApellido; // nombre
			columna[1] = this.getCuit(entry.getKey()); // cuit
			columna[2] = fd; //fecha dispo
			columna[3] = "A"; //tipocc
			columna[4] = "1"; //moneda
			if (bancoSeleccionado.equals("Galicia")){
				columna[5] =this.getNroCuenta(entry.getKey()); //cta
			}else{
				columna[5] = "";
			}
			if (bancoSeleccionado.equals("Galicia")){
				columna[6] =""; // cbu
			}else{
				columna[6] = this.getCbu(entry.getKey()); //cbu
			}			
			columna[7] = "32"; //codigo
			columna[8] = "1"; // tipo
			columna[9] = this.getImporte(entry.getKey())+"00"; // iporte
			columna[10] = ""; // leyenda
			columna[11] = CONCEPTO; // identi
			columna[12] = fp; // fechaproc
			columna[13] = "1"; // codigo concepto			 
			datos.add(columna);
		}
	}



	

}
