package org.cimientos.intranet.modelo;

public class ReporteBecaDisposible {
	
	private String ciclo;
	private String padrino;
	private String tipoPadrino;
	private String periodo;
	private String estado;
	private String zona;
	private String tipo;
	private Long cantidadBecas;
	private Long becasAsignadas;
	private Long diferencia;
	
	public ReporteBecaDisposible() {
		super();
	}

	public ReporteBecaDisposible(String ciclo, String padrino,
			String tipoPadrino, String periodo, String estado, String zona,
			String tipo, Long cantidadBecas, Long becasAsignadas,
			Long diferencia) {
		super();
		this.ciclo = ciclo;
		this.padrino = padrino;
		this.tipoPadrino = tipoPadrino;
		this.periodo = periodo;
		this.estado = estado;
		this.zona = zona;
		this.tipo = tipo;
		this.cantidadBecas = cantidadBecas;
		this.becasAsignadas = becasAsignadas;
		this.diferencia = diferencia;
	}

	public String getCiclo() {
		return ciclo;
	}

	public void setCiclo(String ciclo) {
		this.ciclo = ciclo;
	}

	public String getPadrino() {
		return padrino;
	}

	public void setPadrino(String padrino) {
		this.padrino = padrino;
	}

	public String getTipoPadrino() {
		return tipoPadrino;
	}

	public void setTipoPadrino(String tipoPadrino) {
		this.tipoPadrino = tipoPadrino;
	}

	public String getPeriodo() {
		return periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getZona() {
		return zona;
	}

	public void setZona(String zona) {
		this.zona = zona;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Long getCantidadBecas() {
		return cantidadBecas;
	}

	public void setCantidadBecas(Long cantidadBecas) {
		this.cantidadBecas = cantidadBecas;
	}

	public Long getBecasAsignadas() {
		return becasAsignadas;
	}

	public void setBecasAsignadas(Long becasAsignadas) {
		this.becasAsignadas = becasAsignadas;
	}

	public Long getDiferencia() {
		return diferencia;
	}

	public void setDiferencia(Long diferencia) {
		this.diferencia = diferencia;
	}
	
	
	

	
}
