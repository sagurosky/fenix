package org.cimientos.intranet.utils.cuentas;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.utils.Formateador;

import com.cimientos.intranet.enumerativos.TipoDni;

/**
 * Esta clase representa un archivo de solicitud de apertura de cuenta para banco Galicia.
 * Genera una lista de arreglos de String (cada una representaria una linea en un archivo).
 * @author plabaronnie
 *
 */
public class ArchivoSolicitudCuentaMacro extends ArchivoCuenta{
	
	private String[] columnas = new String[]{"Nombre", "Apellido", "Calle","Nro", "Dto", "P","S",
			"EstadoCivil", "CP", "TD", "Nro doc", "DGI", "Nro DGI",	"Suc", "S. Bruto",	
			"Nacimiento", "Legajo"
	};
	
	private String nombreHoja = "Macro";


	public ArchivoSolicitudCuentaMacro(List<ResponsableAdulto> responsables, /*List<PerfilStaff> staff,*/ CicloPrograma cicloActual) {
		super();
		DummyDatosFaltantes.completarDatosFaltantes(responsables/*, staff*/);
		this.generarDatos(responsables, /*staff, */ cicloActual);
	}

	/**
	 * @param pagos
	 */
	private void generarDatos(List<ResponsableAdulto> responsables, /*List<PerfilStaff> staff,*/ CicloPrograma ciclo) {
		for (ResponsableAdulto responsable : responsables) {
			String[] columna = new String[columnas.length];
			columna[0] = this.getNombre(responsable.getNombre());
			columna[1] = this.getApellido(responsable.getApellido());
			columna[2] = this.getCalle(responsable.getCalle());
			columna[3] = this.getNroCalle(responsable.getNroCalle());
			columna[4] = this.getDto(responsable.getDpto());
			columna[5] = this.getPiso(responsable.getPiso());
			columna[6] = this.getSexo(responsable.getSexo());
			columna[7] = this.getEstadoCivil();
			columna[8] = this.getCodPostal(responsable.getCodigoPostal());
			columna[9] = this.getTipoDNI(responsable.getIdTipoDni());
			columna[10] = this.getNroDocumento(responsable.getDni());
			columna[11] = this.getDGI();
			columna[12] = this.getNroCuil(responsable.getCuilCuit());
			columna[13] = this.getSucursal(responsable.getSucursalBanco().getNumeroSucursal());
			columna[14] = this.getSueldoBruto(ciclo);
			columna[15] = this.getFechaNacimiento(responsable.getFechaNacimiento());
			columna[16] = this.getLegajo(responsable.getIdAlumno()!= null ? responsable.getIdAlumno().getId() : responsable.getId());
			datos.add(columna);
		}
		
//		for (PerfilStaff pstaff : staff) {
//			String[] columna = new String[columnas.length];
//			columna[0] = this.getNombre(pstaff.getDatosPersonales().getNombre());
//			columna[1] = this.getApellido(pstaff.getDatosPersonales().getApellido());
//			columna[2] = this.getCalle(pstaff.getCalle());
//			columna[3] = this.getNroCalle(pstaff.getNroCalle());
//			columna[4] = this.getDto(pstaff.getDpto());
//			columna[5] = this.getPiso(pstaff.getPiso());
//			columna[6] = this.getSexo(pstaff.getDatosPersonales().getSex());
//			columna[7] = this.getEstadoCivil();
//			columna[8] = this.getCodPostal(pstaff.getCodigoPostal());
//			columna[9] = this.getTipoDNI(pstaff.getIdTipoDni());
//			columna[10] = this.getNroDocumento(pstaff.getDatosPersonales().getDni());
//			columna[11] = this.getDGI();
//			columna[12] = this.getNroCuil(pstaff.getDatosPersonales().getCuilCuit());
//			columna[13] = this.getSucursal(pstaff.getSucursalPago());
//			columna[14] = this.getSueldoBruto(ciclo);
//			columna[15] = this.getFechaNacimiento(pstaff.getDatosPersonales().getFechaNacimiento());
//			columna[16] = this.getLegajo(pstaff.getId());
//			datos.add(columna);
//		}
	
	}


	/**
	 * @param string
	 * @return
	 */
	private String getLegajo(Long legajo) {
		if(legajo != null){
			return Long.toString(legajo);
		}
		return "";
	}

	/**
	 * @param string
	 * @return
	 */
	private String getSueldoBruto(CicloPrograma ciclo) {
		String montoBeca = getMontoBecaCicloActual(ciclo);
		int i = montoBeca.indexOf('.');
		montoBeca = montoBeca.substring(0, i);
		return montoBeca.concat("00");
	}

	/**
	 * @return
	 */
	private String getDGI() {
		return "08";
	}

	/**
	 * @param idEstadoCivil
	 * @return
	 */
	private String getEstadoCivil() {
		return "Soltero";
	}

	/**
	 * @param direccion
	 * @return
	 */
	private String getDto(String direccion) {
		if(StringUtils.isNotEmpty(direccion)){
			return direccion;
		}
		return "0";
	}



	/**
	 * @param string
	 * @return
	 */
	private String getSucursal(String sucursal) {
		if(StringUtils.isNotBlank( sucursal)){
			return sucursal;
		}
		return "";
	}





	/**
	 * @param fechaNacimiento
	 * @return
	 */
	private String getFechaNacimiento(Date fechaNacimiento) {
		if(fechaNacimiento != null){
			return Formateador.formatearFechas(fechaNacimiento, "dd/MM/yyyy");
		}
		return "";
	}

	

	/**
	 * @param idTipoDni
	 * @return
	 */
	protected String getTipoDNI(TipoDni idTipoDni) {
		return "01";
	}


	/**
	 * @return the nombreHoja
	 */
	public String getNombreHoja() {
		return nombreHoja;
	}

	/**
	 * @param nombreHoja the nombreHoja to set
	 */
	public void setNombreHoja(String nombreHoja) {
		this.nombreHoja = nombreHoja;
	}




	

}
