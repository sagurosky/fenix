/**
 * 
 */
package org.cimientos.intranet.dto;

import java.io.Serializable;
import java.util.Date;

import org.cimientos.intranet.modelo.EstadoCuenta;

/**
 * @author plabaronnie
 *
 */
public class CreacionCuentaDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String STAFF = "Staff";
	public static final String RA = "Responsable";
	
	public CreacionCuentaDTO(){
	}
	
    public CreacionCuentaDTO(Long id, String nombre, String email, String phone, String apellidoAlumno, String apellidoRR,
    		String nroCuenta, String nroCuil, Integer nroDocumento, Date fechaExportacion, EstadoCuenta estado, String localidad,
    		String motivoFallido, String nombreRR, String provincia, String tipoPersona, String zona, String banco) {  
        this.id = id;  
        this.Nombre = nombre;  
        this.apellido = email;  
        this.apellidoAlumno = apellidoAlumno;
        this.apellidoRR = apellidoRR;
        this.nroCuenta = nroCuenta;
        this.nroCuil = nroCuil;
        this.nroDocumento = nroDocumento;
        this.fechaExportacion = fechaExportacion;
        this.estado = estado;
        this.localidad = localidad;
        this.motivoFallido = motivoFallido;
        this.NombreRR = nombreRR;
        this.provincia = provincia; 
        this.tipoPersona = tipoPersona;
        this.zona = zona;
        this.banco = banco;
    }
	
    private String totalRows; 
    
	public String getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(String totalRows) {
		this.totalRows = totalRows;
	}

	public String getNotificarFallido() {
		if(getEstado() == null || (getEstado() != null && !getEstado().equals(EstadoCuenta.ACTIVA))){
			return new String ("<div  style=\"width:0.5cm\" class=\"ui-state-default ui-corner-all\">" + 
			"<a  onclick=\"showFallidoDialog(\'"+ getId()+ "\',\'" + getTipoPersona() + "\')\">" + 
			"<span class=\"ui-icon ui-icon-alert\" ></span></a></div>");
		}else return "" ;	
	}

	private Long id;
	
	//nombre ra o responsable
	private String Nombre;
	
	//apellido ra o responsable
	private String apellido;
	
	private Integer nroDocumento;
	
	private String nroCuil;
	
	private String localidad;
	
	private String provincia;
	
	private String tipoPersona;
	
	private EstadoCuenta estado;
	
	private Date fechaExportacion;
	
	private String nroCuenta;
	
	private String 	motivoFallido;
	
	//nombre alumno
	private String NombreAlumno;
	
	//apellido alumno
	private String apellidoAlumno;
	
	//nombre rr
	private String NombreRR;
	
	//apellido rr
	private String apellidoRR;
	
	
	private String zona;
	
	private Long idAlumno;
	
	private String banco;

	/**
	 * @return nombre + apellido alumno
	 * @author esalvador
	 */
	public String getBecado() {
		String nombreApellidoAlumno = (getNombreAlumno() != null ? getApellidoAlumno() + ", "
				+ getNombreAlumno() : getApellidoAlumno());
		return nombreApellidoAlumno;
	}
	
	/**
	 * @return nombre + apellido rr
	 * @author esalvador
	 */
	public String getRr() {
		String nombreApellidoRR = (getNombreRR() != null ? getApellidoRR() + ", "
				+ getNombreRR() : getApellidoRR());
		return nombreApellidoRR;
	}
	
	/**
	 * @return nombre + apellido titular
	 */
	public String getTitular() {
		String nombreApellidoTitular = (getApellido() != null ? getApellido() + ", "
				+ getNombre() : getNombre());
		return nombreApellidoTitular;
	}
	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return Nombre;
	}

	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	/**
	 * @return the apellido
	 */
	public String getApellido() {
		return apellido;
	}

	/**
	 * @param apellido the apellido to set
	 */
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	/**
	 * @return the nroDocumento
	 */
	public Integer getNroDocumento() {
		return nroDocumento;
	}

	/**
	 * @param nroDocumento the nroDocumento to set
	 */
	public void setNroDocumento(Integer nroDocumento) {
		this.nroDocumento = nroDocumento;
	}

	/**
	 * @return the nroCuil
	 */
	public String getNroCuil() {
		return nroCuil;
	}

	/**
	 * @param nroCuil the nroCuil to set
	 */
	public void setNroCuil(String nroCuil) {
		this.nroCuil = nroCuil;
	}

	/**
	 * @return the localidad
	 */
	public String getLocalidad() {
		return localidad;
	}

	/**
	 * @param localidad the localidad to set
	 */
	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	/**
	 * @return the provincia
	 */
	public String getProvincia() {
		return provincia;
	}

	/**
	 * @param provincia the provincia to set
	 */
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	/**
	 * @return the tipoPersona
	 */
	public String getTipoPersona() {
		return tipoPersona;
	}

	/**
	 * @param tipoPersona the tipoPersona to set
	 */
	public void setTipoPersona(String tipoPersona) {
		this.tipoPersona = tipoPersona;
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}


	/**
	 * @return the fechaExportacion
	 */
	public Date getFechaExportacion() {
		return fechaExportacion;
	}

	/**
	 * @param fechaExportacion the fechaExportacion to set
	 */
	public void setFechaExportacion(Date fechaExportacion) {
		this.fechaExportacion = fechaExportacion;
	}

	/**
	 * @return the nroCuenta
	 */
	public String getNroCuenta() {
		return nroCuenta;
	}

	/**
	 * @param nroCuenta the nroCuenta to set
	 */
	public void setNroCuenta(String nroCuenta) {
		this.nroCuenta = nroCuenta;
	}

	/**
	 * @return the estado
	 */
	public EstadoCuenta getEstado() {
		return estado;
	}

	/**
	 * @param estado the estado to set
	 */
	public void setEstado(EstadoCuenta estado) {
		this.estado = estado;
	}

	/**
	 * @return the motivoFallido
	 */
	public String getMotivoFallido() {
		return motivoFallido;
	}

	/**
	 * @param motivoFallido the motivoFallido to set
	 */
	public void setMotivoFallido(String motivoFallido) {
		this.motivoFallido = motivoFallido;
	}

	/**
	 * @return the nombreAlumno
	 */
	public String getNombreAlumno() {
		return NombreAlumno;
	}

	/**
	 * @param nombreAlumno the nombreAlumno to set
	 */
	public void setNombreAlumno(String nombreAlumno) {
		NombreAlumno = nombreAlumno;
	}

	/**
	 * @return the apellidoAlumno
	 */
	public String getApellidoAlumno() {
		return apellidoAlumno;
	}

	/**
	 * @param apellidoAlumno the apellidoAlumno to set
	 */
	public void setApellidoAlumno(String apellidoAlumno) {
		this.apellidoAlumno = apellidoAlumno;
	}

	/**
	 * @return the zona
	 */
	public String getZona() {
		return zona;
	}

	/**
	 * @param zona the zona to set
	 */
	public void setZona(String zona) {
		this.zona = zona;
	}

	/**
	 * @return the nombreRR
	 */
	public String getNombreRR() {
		return NombreRR;
	}

	/**
	 * @param nombreRR the nombreRR to set
	 */
	public void setNombreRR(String nombreRR) {
		NombreRR = nombreRR;
	}

	/**
	 * @return the apellidoRR
	 */
	public String getApellidoRR() {
		return apellidoRR;
	}

	/**
	 * @param apellidoRR the apellidoRR to set
	 */
	public void setApellidoRR(String apellidoRR) {
		this.apellidoRR = apellidoRR;
	}

	public Long getIdAlumno() {
		return idAlumno;
	}

	public void setIdAlumno(Long idAlumno) {
		this.idAlumno = idAlumno;
	}
	
	public String getBanco (){
		return banco;
	}

	public void setBanco(String banco){
		this.banco = banco;		
	}
}
