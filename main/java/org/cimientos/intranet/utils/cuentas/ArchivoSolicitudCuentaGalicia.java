package org.cimientos.intranet.utils.cuentas;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.utils.Formateador;

import com.cimientos.intranet.enumerativos.TipoDni;

/**
 * Esta clase representa un archivo de solicitud de apertura de cuenta para banco Galicia.
 * Genera una lista de arreglos de String (cada una representaria una linea en un archivo).
 * @author plabaronnie
 *
 */
public class ArchivoSolicitudCuentaGalicia extends ArchivoCuenta{
	
	private static final String CABA = "CABA";

	private static final String CIUDAD_AUTON_BSAS = "CIUDAD AUTONOMA BUENOS AI";

	private static final String CAPITAL_FEDERAL = "CAPITAL FEDERAL";

	//private String[] columnas = new String[]{"Apellido","Nombre","Tipo de Documento","Nro. de documento",
	//		"Sexo",	"Fecha de nacimiento",	"Nacionalidad",	"Nro. de Cuil",	"Ingresos",
	//		"Calle",	"Nro. de calle",	"Piso",	"Localidad",	"Cod. Postal",	"Provincia",
	//		"Nro. de Planta",	"Sucursal de pago",	"Telefono", "Codigo de Area", "Tipo Tel", "email"};
	
	private String[] columnas = new String[]{"Apellido","Nombre","Tipo de Documento","Nro. de documento",
			"Sexo",	"Fecha de nacimiento",	"Nacionalidad",	"Nro. de Cuil",	"Ingresos",
			"Calle",	"Nro. de calle",	"Piso",	"Localidad",	"Cod. Postal",	"Provincia",
			"Nro. de Planta",	"Sucursal de pago",	"Telefono", "Codigo de Area", "Tipo Tel", "email"};
	
	//private String nombreHoja = "datosminimos";
	private String nombreHoja = "Carga de Datos";
	
	public ArchivoSolicitudCuentaGalicia(List<ResponsableAdulto> responsables,/* List<PerfilStaff> staff, */ CicloPrograma cicloActual) {
		super();
		DummyDatosFaltantes.completarDatosFaltantes(responsables/*, staff*/);
		this.generarDatos(responsables, /*staff,*/ cicloActual);
	}

	/**
	 * @param pagos
	 */
	private void generarDatos(List<ResponsableAdulto> responsables, /*List<PerfilStaff> staff,*/ CicloPrograma ciclo) {
		for (ResponsableAdulto responsable : responsables) {
			String[] columna = new String[columnas.length];
			String apellido=getApellido(responsable.getApellido().toUpperCase());
			String nombre=this.getNombre(responsable.getNombre().toUpperCase());
			String calle=this.getCalle(responsable.getCalle().toUpperCase());
			String localidad= this.getLocalidad(responsable.getIdLocalidad()).toUpperCase();
			String provincia=this.getProvincia(responsable.getIdLocalidad()).toUpperCase();
			apellido=apellido.replace("Ñ", "N");
			apellido=apellido.replace("Á", "A");
			apellido=apellido.replace("É", "E");
			apellido=apellido.replace("Í", "I");
			apellido=apellido.replace("Ó", "O");
			apellido=apellido.replace("Ú", "U");
			apellido=apellido.replace(".", " ");
			apellido=apellido.replace("Ä", "A");
			apellido=apellido.replace("Ë", "E");
			apellido=apellido.replace("Ï", "I");
			apellido=apellido.replace("Ö", "O");
			apellido=apellido.replace("Ü", "U");
			
			nombre=nombre.replace("Ñ", "N");
			nombre=nombre.replace("Á", "A");
			nombre=nombre.replace("É", "E");
			nombre=nombre.replace("Í", "I");
			nombre=nombre.replace("Ó", "O");
			nombre=nombre.replace("Ú", "U");
			nombre=nombre.replace(".", " ");
			nombre=nombre.replace("Ä", "A");
			nombre=nombre.replace("Ë", "E");
			nombre=nombre.replace("Ï", "I");
			nombre=nombre.replace("Ö", "O");
			nombre=nombre.replace("Ü", "U");
			
			calle=calle.replace("Ñ", "N");
			calle=calle.replace("Á", "A");
			calle=calle.replace("É", "E");
			calle=calle.replace("Í", "I");
			calle=calle.replace("Ó", "O");
			calle=calle.replace("Ú", "U");
			calle=calle.replace(".", " ");
			calle=calle.replace("-", " ");
			calle=calle.replace("°", " ");
			calle=calle.replace("'", " ");
			calle=calle.replace(",", " ");
			calle=calle.replace("Ä", "A");
			calle=calle.replace("Ë", "E");
			calle=calle.replace("Ï", "I");
			calle=calle.replace("Ö", "O");
			calle=calle.replace("Ü", "U");
			
			localidad=localidad.replace("Ñ", "N");
			localidad=localidad.replace("Á", "A");
			localidad=localidad.replace("É", "E");
			localidad=localidad.replace("Í", "I");
			localidad=localidad.replace("Ó", "O");
			localidad=localidad.replace("Ú", "U");
			localidad=localidad.replace(".", " ");
			localidad=localidad.replace("-", " ");
			localidad=localidad.replace("°", " ");
			localidad=localidad.replace("'", " ");
			localidad=localidad.replace(",", " ");
			localidad=localidad.replace("Ä", "A");
			localidad=localidad.replace("Ë", "E");
			localidad=localidad.replace("Ï", "I");
			localidad=localidad.replace("Ö", "O");
			localidad=localidad.replace("Ü", "U");
			
			provincia=provincia.replace("Ñ", "N");
			provincia=provincia.replace("Á", "A");
			provincia=provincia.replace("É", "E");
			provincia=provincia.replace("Í", "I");
			provincia=provincia.replace("Ó", "O");
			provincia=provincia.replace("Ú", "U");
			provincia=provincia.replace(".", " ");
			provincia=provincia.replace("-", " ");
			provincia=provincia.replace("°", " ");
			provincia=provincia.replace("'", " ");
			provincia=provincia.replace(",", " ");
			provincia=provincia.replace("Ä", "A");
			provincia=provincia.replace("Ë", "E");
			provincia=provincia.replace("Ï", "I");
			provincia=provincia.replace("Ö", "O");
			provincia=provincia.replace("Ü", "U");
			
			
			
			
			
			columna[0] = apellido; 
			columna[1] = nombre; 
			//columna[2] = this.getTipoDNI(responsable.getIdTipoDni()); 
			//columna[3] = this.getNroDocumento(responsable.getDni());
			columna[2] = this.getSexo(responsable.getSexo());
			//columna[5] = this.getFechaNacimiento(responsable.getFechaNacimiento());
			//columna[6] = this.getNacionalidad("Argentina");
			columna[3] = this.getNroCuil(responsable.getCuilCuit());
			columna[4] = this.getIngresos(ciclo);
			//columna[9] = calle;
			//columna[10] = this.getNroCalle(responsable.getNroCalle());
			//columna[11] = this.getPiso(responsable.getPiso());
			//columna[12] = localidad;
			//columna[13] = this.getCodPostal(responsable.getCodigoPostal());
			//columna[14] = provincia;
			//columna[15] = this.getNroPlanta();
			columna[5] = this.getSucursalPago(responsable.getSucursalBanco().getNumeroSucursal());
			//columna[17] = this.getTelefono(responsable.getTelefono());
			columna[6] = "37230500";
			columna[7] = "11";
			//columna[19] = "F";
			//columna[20] = "pfe@cimientos.org";
			
			datos.add(columna);
		}
		
		

		
//		for (PerfilStaff pstaff : staff) {
//			String[] columna = new String[columnas.length];
//			columna[0] = this.getApellido(pstaff.getDatosPersonales().getApellido());
//			columna[1] = this.getNombre(pstaff.getDatosPersonales().getNombre());
//			columna[2] = this.getTipoDNI(pstaff.getIdTipoDni());
//			columna[3] = this.getNroDocumento(pstaff.getDatosPersonales().getDni());
//			columna[4] = this.getSexo(pstaff.getDatosPersonales().getSex());
//			columna[5] = this.getFechaNacimiento(pstaff.getDatosPersonales().getFechaNacimiento());
//			columna[6] = this.getNacionalidad(pstaff.getNacionalidad());
//			columna[7] = this.getNroCuil(pstaff.getCuilTitularCuenta());
//			columna[8] = this.getIngresos(ciclo);
//			columna[9] = this.getCalle(pstaff.getCalle());
//			columna[10] = this.getNroCalle(pstaff.getNroCalle());
//			columna[11] = this.getPiso(pstaff.getPiso());
//			columna[12] = this.getLocalidad(pstaff.getDatosPersonales().getLocalidad());
//			columna[13] = this.getCodPostal(pstaff.getCodigoPostal());
//			columna[14] = this.getProvincia(pstaff.getDatosPersonales().getLocalidad());
//			columna[15] = this.getNroPlanta();
//			columna[16] = this.getSucursalPago(pstaff.getSucursalPago());
//			columna[17] = this.getTelefono(pstaff.getDatosPersonales().getTelefono());
//			datos.add(columna);
//		}
	
	}



	/**
	 * @param montoIngreso
	 * @return
	 */
	private String getIngresos(CicloPrograma ciclo) {
		String montoBeca = getMontoBecaCicloActual(ciclo);
		if(montoBeca != null){
			int i = montoBeca.indexOf('.');
			return montoBeca.substring(0, i);
		}
		return "";
	}

	/**
	 * @param provincia 
	 * @param idLocalidad
	 * @return
	 */
	private String getProvincia(Localidad localidad) {
		if(localidad != null && localidad.getProvincia()!= null ){
			if(localidad.getNombre().equals(CABA)){
				return CAPITAL_FEDERAL;
			}
			return Formateador.quitarAcentos( localidad.getProvincia().getDescripcion() ).toUpperCase();
		}
		return "";
	}



	/**
	 * @param telefono1
	 * @return
	 */
	private String getTelefono(String telefono1) {
		if(StringUtils.isNotBlank( telefono1)){
			return telefono1;
		}
		return "";
	}

	/**
	 * @param string
	 * @return
	 */
	private String getSucursalPago(String sucursal) {
		if(StringUtils.isNotBlank( sucursal)){
			return StringUtils.leftPad(sucursal, 5, '0');
		}
		return "";
	}

	/**
	 * @param string
	 * @return
	 */
	private String getNroPlanta() {
		return "0000";
	}


	/**
	 * @param idLocalidad
	 * @return
	 */
	private String getLocalidad(Localidad localidad) {
		if(localidad != null){
			if(localidad.getNombre().equals(CABA)){
				return CIUDAD_AUTON_BSAS;
			}
			return Formateador.quitarAcentos( localidad.getNombre()).toUpperCase();
		}
		return "";
	}



	/**
	 * @param string
	 * @return
	 */
	private String getNacionalidad(String string) {
		if(StringUtils.isNotBlank(string)){
			return string.toUpperCase();
		}
		return "";
	}

	/**
	 * @param fechaNacimiento
	 * @return
	 */
	private String getFechaNacimiento(Date fechaNacimiento) {
		if(fechaNacimiento != null){
			return Formateador.formatearFecha(fechaNacimiento, "yyyyMMdd");
		}
		return "";
	}



	/**
	 * @param idTipoDni
	 * @return
	 */
	protected String getTipoDNI(TipoDni idTipoDni) {
		if(idTipoDni != null){
			if(idTipoDni.equals(TipoDni.DNI)){
				return "DU";
			}
			return idTipoDni.getValor();
		}
		return "";
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

	/**
	 * @param nombre
	 * @return
	 */
	protected String getNombre(String nombre) {
		if(nombre.length() > 30){
			nombre = nombre.substring(0, 29);
		}
		nombre = Formateador.quitarAcentos(nombre);
		return nombre.toUpperCase();
	}

	/**
	 * @param apellido
	 * @return
	 */
	protected String getApellido(String apellido) {
		if(apellido.length() > 30){
			apellido = apellido.substring(0, 29);
		}
		apellido = Formateador.quitarAcentos(apellido);
		return apellido.toUpperCase();
	}	

	/**
	 * @param direccion
	 * @return
	 */
	protected String getCalle(String calle) {
		if(StringUtils.isNotBlank( calle)){
			return Formateador.quitarAcentos(calle).toUpperCase();
		}
		return "";
	}
	
	
	protected String getNroCalle(String nroCalle) {
		if(nroCalle.length() == 0){
			nroCalle = "SN";
		}		
		return nroCalle;
	}
	
	
}
