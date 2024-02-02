package org.cimientos.intranet.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;

import com.cimientos.intranet.enumerativos.EstadoPago;

public class PagoDTO {
	
	private Long id;
	
	private PerfilAlumno becado;
	
	private ResponsableAdulto responsable;
	
	private Double monto;
	
	private Double extra;
	
	private Date fechaExportacion;
	
	private String fechaString;
	
	private EstadoPago estado;
	
	private String motivo;
	
	private String idPeriodos;
	
	private List<Periodo> listaPeriodos;
	
	private Double montoTotal;
	
	private String cicloNombre;
	
	private Periodo periodo;	
	
	private EstadoPago estadoPago;
	
		
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCicloNombre() {
		return cicloNombre;
	}

	public void setCicloNombre(String cicloNombre) {
		this.cicloNombre = cicloNombre;
	}

	public String getNotificarFallido() {
		return new String ("<div  style=\"width:0.5cm\" class=\"ui-state-default ui-corner-all\">" + 
		"<a  onclick=\"showFallidoDialog(\'"+ getBecado().getId() + "\',\'" + getFechaString() + "\');\">" + 
		"<span class=\"ui-icon ui-icon-alert\" ></span></a></div>");
	}

	public String getBecadoCompleto() {
		String nombreApellidoBecado = (getBecado().getDatosPersonales().getNombre() != null ? getBecado().getDatosPersonales().getApellido() + ", "
				+ getBecado().getDatosPersonales().getNombre() : getBecado().getDatosPersonales().getApellido());
		return nombreApellidoBecado;
	}
	
	public String getNombreRa() {
		String nombreApellidoRA = (getResponsable().getNombre() != null ? getResponsable().getApellido() + ", "
				+ getResponsable().getNombre() : getResponsable().getApellido());
		return nombreApellidoRA;
	}
	
	public String getEstadoCuenta() {
		String estadoCuenta = null;
		if (getResponsable().getEstadoCuenta() != null){
			estadoCuenta = getResponsable().getEstadoCuenta().getValor();
		}
	return estadoCuenta;
	}
	
	public Long getBecadoId() {
		Long becadoId = getBecado().getId();
	return becadoId;
	}
	
	public String getPeriodosConcatenados() {
		String periodos = "";
		for (Periodo periodo : getListaPeriodos()) {
		periodos += periodo.getNombre() + ";";
		}
		return periodos;
	}
	
	public String getZona() {
		String zona = "";
		try {
			zona = getBecado().getEscuela().getLocalidad().getZona().getNombre();
		} catch (Exception e) {
			// TODO: handle exception
			//System.out.println("Alumno  ");
		}
		return zona;
	}
	
	
	public String getFechaString() {
		return this.fechaString;
	}
	
	public void setFechaString(String fechaString) {
		this.fechaString = fechaString;
	}

	/**
	 * @return the becado
	 */
	public PerfilAlumno getBecado() {
		return becado;
	}

	/**
	 * @param becado the becado to set
	 */
	public void setBecado(PerfilAlumno becado) {
		this.becado = becado;
	}

	/**
	 * @return the responsable
	 */
	public ResponsableAdulto getResponsable() {
		return responsable;
	}

	/**
	 * @param responsable the responsable to set
	 */
	public void setResponsable(ResponsableAdulto responsable) {
		this.responsable = responsable;
	}

	/**
	 * @return the monto
	 */
	public Double getMonto() {
		return monto;
	}

	/**
	 * @param monto the monto to set
	 */
	public void setMonto(Double monto) {
		this.monto = monto;
	}

	/**
	 * @return the extra
	 */
	public Double getExtra() {
		return extra;
	}

	/**
	 * @param extra the extra to set
	 */
	public void setExtra(Double extra) {
		this.extra = extra;
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
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		
		if (fechaExportacion!=null)
			setFechaString(formatter.format(fechaExportacion));
		else
			setFechaString("");	//!!!
	}

	/**
	 * @return the estadoPago
	 */
	public EstadoPago getEstado() {
		return estado;
	}

	/**
	 * @param estadoPago the estadoPago to set
	 */
	public void setEstado(EstadoPago estadoPago) {
		this.estado = estadoPago;
	}

	/**
	 * @return the motivo
	 */
	public String getMotivo() {
		return motivo;
	}

	/**
	 * @param motivo the motivo to set
	 */
	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}


	/**
	 * @return the idPeriodos
	 */
	public String getIdPeriodos() {
		return idPeriodos;
	}
	
	public String getBanco() {
		String banco="";
		//System.out.println(getResponsable().getId());
		if (getResponsable().getBanco().getNombre()!=null){
			banco=getResponsable().getBanco().getNombre();
		}
		else{
			
			//System.out.println("banco null");
		}
		
		return banco;
	}
	
	

	/**
	 * @param idPeriodos the idPeriodos to set
	 */
	public void setIdPeriodos(String idPeriodos) {
		this.idPeriodos = idPeriodos;
	}

	/**
	 * @return the listaPeriodos
	 */
	public List<Periodo> getListaPeriodos() {
		return listaPeriodos;
	}

	/**
	 * @param listaPeriodos the listaPeriodos to set
	 */
	public void setListaPeriodos(List<Periodo> listaPeriodos) {
		this.listaPeriodos = listaPeriodos;
	}

	/**
	 * @return
	 */
	public Double getMontoMasExtra(){
		Double montoTotal = (getMonto()!= null ? getMonto() + ( getExtra() != null ? getExtra() : 0) : 0);
		return montoTotal;
	}

	/**
	 * @return the montoTotal
	 */
	public Double getMontoTotal() {
		return montoTotal;
	}

	/**
	 * @param montoTotal the montoTotal to set
	 */
	public void setMontoTotal(Double montoTotal) {
		this.montoTotal = montoTotal;
	}

	public Periodo getPeriodo() {
		return periodo;
	}

	public void setPeriodo(Periodo periodo) {
		this.periodo = periodo;
	}
	
	public EstadoPago getEstadoPago() {
		return estadoPago;
	}

	/**
	 * @param estadoPago the estadoPago to set
	 */
	public void setEstadoPago(EstadoPago estadoPago) {
		this.estadoPago = estadoPago;
	}
	
	public String getIdsPeriodosConcatenados() {
		String periodos = "";
		for (Periodo periodo : getListaPeriodos()) {
			periodos += periodo.getId() + ",";
		}
		return periodos;
	}
	
	public String getCantidadPeriodos(){
		return String.valueOf(getListaPeriodos().size());
	}
	
	public String getAgregarMontoExtra() {
		return new String ("<div  style=\"width:0.5cm\" class=\"ui-state-default ui-corner-all\">" + 
		"<a onclick=\"showFallidoDialog(\'"+ getBecado().getId() + "\',\'" + getIdsPeriodosConcatenados() + "\',\'" + getCantidadPeriodos() + "\');\" " +
		"title=\"Agregar Monto Extra\">" + 
		"<span class=\"ui-icon ui-icon-circle-plus\" title=\"Agregar Monto Extra\"></span></a></div>");
	}

}
