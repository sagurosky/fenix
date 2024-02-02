package com.cimientos.intranet.dto;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.modelo.Periodo;



public class ReporteInformeFPDTO{

	private Long id;
	
	private String tipoInforme;
	
	private String cicloActual;
	
	private String estadoInforme;	
	
	private String fechaUltimoCambioEstado;
	
	private String fechaEnvio;
	
	private String tipoPadrino;
	
	private String padrino;
	
	private String contacto;
	
	private String mail;
	
	private Long idAlumno; 	
	
	private String apellidoAlumno;
	
	private String nombreAlumno;	
	
	private String dni;
	
	private String fechaNacimiento;
	
	private String edad;
	
	private String localidad;
	
	private String anioEscolar;
	
	private String anioAdicional;
	
	private String escuelaNombre;
	
	private String escuelaLocalidad;
	
	private String responsable;
	
	private String vinculo;
	
	private String fechaPBE;
	
	private String rr;
	
	private String ea;
	
	private String materiasInteres;
	
	private String incluirBoletin;
	
	private List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
	
	private String cantidadConvivientes;
	
	private List<FichaFamiliarDTO> convivientes = new ArrayList<FichaFamiliarDTO>();
	
	private Long nroCtesPlataformaContable;
	
	private Periodo mesIncorp;
	
	private String fechaReincorporacionPBE;
	
	private String fechaUltimaModificacion;
	
	private String eae;
	
	//2018
	
		private String informacionEscuela;
		private String espacioEscuela;
		private String materiasCuestan;
		private String tiempoLibre;
		private String propositoAnual;
		
		
	//2021
		private String vosMismo;
		private String cuandoTermine;
	
		
		//2021
		
		private String titulo;
		private String footer;
		private String foto;
		private String observacionesExcepcion;
		private String matriculaTotal;
		private String orientacion;
		private String descripcionEscuela;
		private String anioIncorporacion;
		
//2023
		
		private String realizadoVacaciones;
		
		private String situacionEscolar;
		
		private String incorporacion;

		private String observacionesNoIncorporacion;
			
	
		
		
	
	
	public String getTitulo() {
			return titulo;
		}

		public void setTitulo(String titulo) {
			this.titulo = titulo;
		}

		public String getFooter() {
			return footer;
		}

		public void setFooter(String footer) {
			this.footer = footer;
		}

		public String getFoto() {
			return foto;
		}

		public void setFoto(String foto) {
			this.foto = foto;
		}

		public String getObservacionesExcepcion() {
			return observacionesExcepcion;
		}

		public void setObservacionesExcepcion(String observacionesExcepcion) {
			this.observacionesExcepcion = observacionesExcepcion;
		}

		public String getMatriculaTotal() {
			return matriculaTotal;
		}

		public void setMatriculaTotal(String matriculaTotal) {
			this.matriculaTotal = matriculaTotal;
		}

		public String getOrientacion() {
			return orientacion;
		}

		public void setOrientacion(String orientacion) {
			this.orientacion = orientacion;
		}

		public String getDescripcionEscuela() {
			return descripcionEscuela;
		}

		public void setDescripcionEscuela(String descripcionEscuela) {
			this.descripcionEscuela = descripcionEscuela;
		}

		public String getAnioIncorporacion() {
			return anioIncorporacion;
		}

		public void setAnioIncorporacion(String anioIncorporacion) {
			this.anioIncorporacion = anioIncorporacion;
		}

		public String getRealizadoVacaciones() {
			return realizadoVacaciones;
		}

		public void setRealizadoVacaciones(String realizadoVacaciones) {
			this.realizadoVacaciones = realizadoVacaciones;
		}

		public String getSituacionEscolar() {
			return situacionEscolar;
		}

		public void setSituacionEscolar(String situacionEscolar) {
			this.situacionEscolar = situacionEscolar;
		}

		public String getIncorporacion() {
			return incorporacion;
		}

		public void setIncorporacion(String incorporacion) {
			this.incorporacion = incorporacion;
		}

		public String getObservacionesNoIncorporacion() {
			return observacionesNoIncorporacion;
		}

		public void setObservacionesNoIncorporacion(String observacionesNoIncorporacion) {
			this.observacionesNoIncorporacion = observacionesNoIncorporacion;
		}

	public String getVosMismo() {
			return vosMismo;
		}

		public void setVosMismo(String vosMismo) {
			this.vosMismo = vosMismo;
		}

		public String getCuandoTermine() {
			return cuandoTermine;
		}

		public void setCuandoTermine(String cuandoTermine) {
			this.cuandoTermine = cuandoTermine;
		}

	public String getInformacionEscuela() {
			return informacionEscuela;
		}

		public void setInformacionEscuela(String informacionEscuela) {
			this.informacionEscuela = informacionEscuela;
		}

		public String getEspacioEscuela() {
			return espacioEscuela;
		}

		public void setEspacioEscuela(String espacioEscuela) {
			this.espacioEscuela = espacioEscuela;
		}

		public String getMateriasCuestan() {
			return materiasCuestan;
		}

		public void setMateriasCuestan(String materiasCuestan) {
			this.materiasCuestan = materiasCuestan;
		}

		public String getTiempoLibre() {
			return tiempoLibre;
		}

		public void setTiempoLibre(String tiempoLibre) {
			this.tiempoLibre = tiempoLibre;
		}

		public String getPropositoAnual() {
			return propositoAnual;
		}

		public void setPropositoAnual(String propositoAnual) {
			this.propositoAnual = propositoAnual;
		}

	public String getEae() {
		return eae;
	}

	public void setEae(String eae) {
		this.eae = eae;
	}

	public String getFechaUltimaModificacion() {
		return fechaUltimaModificacion;
	}

	public void setFechaUltimaModificacion(String fechaUltimaModificacion) {
		this.fechaUltimaModificacion = fechaUltimaModificacion;
	}
	
	
	public Periodo getMesIncorp() {
		return mesIncorp;
	}

	public void setMesIncorp(Periodo mesIncorp) {
		this.mesIncorp = mesIncorp;
	}

	public String getVinculo() {
		return vinculo;
	}

	public void setVinculo(String vinculo) {
		this.vinculo = vinculo;
	}

	public String getCantidadConvivientes() {
		return cantidadConvivientes;
	}

	public void setCantidadConvivientes(String cantidadConvivientes) {
		this.cantidadConvivientes = cantidadConvivientes;
	}

	public String getIncluirBoletin() {
		return incluirBoletin;
	}

	public void setIncluirBoletin(String incluirBoletin) {
		this.incluirBoletin = incluirBoletin;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getAnioAdicional() {
		return anioAdicional;
	}

	public void setAnioAdicional(String anioAdicional) {
		this.anioAdicional = anioAdicional;
	}


	
	
	public String getAnioEscolar() {
		return anioEscolar;
	}

	public void setAnioEscolar(String anioEscolar) {
		this.anioEscolar = anioEscolar;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getApellidoAlumno() {
		return apellidoAlumno;
	}

	public void setApellidoAlumno(String apellidoAlumno) {
		this.apellidoAlumno = apellidoAlumno;
	}

	public String getNombreAlumno() {
		return nombreAlumno;
	}

	public void setNombreAlumno(String nombreAlumno) {
		this.nombreAlumno = nombreAlumno;
	}

	public String getTipoInforme() {
		return tipoInforme;
	}

	public void setTipoInforme(String tipoInforme) {
		this.tipoInforme = tipoInforme;
	}

	public String getTipoPadrino() {
		return tipoPadrino;
	}

	public void setTipoPadrino(String tipoPadrino) {
		this.tipoPadrino = tipoPadrino;
	}

	public String getEstadoInforme() {
		return estadoInforme;
	}

	public void setEstadoInforme(String estadoInforme) {
		this.estadoInforme = estadoInforme;
	}

	public String getDNI() {
		return dni;
	}

	public void setDNI(String DNI) {
		this.dni = DNI;
	}

	public String getFechaUltimoCambioEstado() {
		return fechaUltimoCambioEstado;
	}

	public void setFechaUltimoCambioEstado(String fechaUltimoCambioEstado) {
		this.fechaUltimoCambioEstado = fechaUltimoCambioEstado;
	}

	public String getFechaEnvio() {
		return fechaEnvio;
	}

	public void setFechaEnvio(String fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
	}

	public String getCicloActual() {
		return cicloActual;
	}

	public void setCicloActual(String cicloActual) {
		this.cicloActual = cicloActual;
	}

	public String getEa() {
		return ea;
	}

	public void setEa(String ea) {
		this.ea = ea;
	}

	public String getRr() {
		return rr;
	}

	public void setRr(String rr) {
		this.rr = rr;
	}
	

	public Long getIdAlumno() {
		return idAlumno;
	}

	public void setIdAlumno(Long idAlumno) {
		this.idAlumno = idAlumno;
	}
	
	public String getEscuelaNombre() {
		return escuelaNombre;
	}

	public void setEscuelaNombre(String escuelaNombre) {
		this.escuelaNombre = escuelaNombre;
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}
	
	public String getFechaPBE() {
		return fechaPBE;
	}

	public void setFechaPBE(String fechaPBE) {
		this.fechaPBE = fechaPBE;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getEdad() {
		return edad;
	}

	public void setEdad(String edad) {
		this.edad = edad;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public String getEscuelaLocalidad() {
		return escuelaLocalidad;
	}

	public void setEscuelaLocalidad(String escuelaLocalidad) {
		this.escuelaLocalidad = escuelaLocalidad;
	}

	public String getPadrino() {
		return padrino;
	}

	public void setPadrino(String padrino) {
		this.padrino = padrino;
	}

	public String getResponsable() {
		return responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	public String getMateriasInteres() {
		return materiasInteres;
	}

	public void setMateriasInteres(String materiasInteres) {
		this.materiasInteres = materiasInteres;
	}
	
	public List<FichaFamiliarDTO> getConvivientes() {
		return convivientes;
	}

	public void setConvivientes(List<FichaFamiliarDTO> convivientes) {
		this.convivientes = convivientes;
	}
	
	public void addFicha(FichaFamiliarDTO ficha)   
	{       
	   this.convivientes.add(ficha);   
	}

	public List<MateriaDTO> getMaterias() {
		return materias;
	}

	public void setMaterias(List<MateriaDTO> materias) {
		this.materias = materias;
	} 	
	
	public void addMateria(MateriaDTO materia)   
	{       
	   this.materias.add(materia);   
	}

	public Long getNroCtesPlataformaContable() {
		return nroCtesPlataformaContable;
	}

	public void setNroCtesPlataformaContable(Long nroCtesPlataformaContable) {
		this.nroCtesPlataformaContable = nroCtesPlataformaContable;
	}

	public String getContacto() {
		return contacto;
	}

	public void setContacto(String contacto) {
		this.contacto = contacto;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	

	public String getFechaReincorporacionPBE() {
		return fechaReincorporacionPBE;
	}

	public void setFechaReincorporacionPBE(String fechaReincorporacionPBE) {
		this.fechaReincorporacionPBE = fechaReincorporacionPBE;
	}	
}
