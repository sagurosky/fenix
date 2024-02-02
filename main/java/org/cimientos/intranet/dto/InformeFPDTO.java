package org.cimientos.intranet.dto;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import com.cimientos.intranet.dto.FichaFamiliarDTO;
import com.cimientos.intranet.dto.MateriaDTO;


public class InformeFPDTO {

	
	//Datos Restantes
	private String anioActual;
	
	private String materiasInteres;
	
	private List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
	
	private String alumno;
	
	private String anio;
	
	private String fechaAlta;
	
	private String fechaPBE;
	
	private String fechaNacimiento;
		
	private String edad;
	
	private String localidad;
	
	private String responsable;
		
	private String escuela;
	
	private String escuelaLocalidad;
	
	private String padrino;
		
	private String relacion;
	
	private String comentarios;
	
	private String pathImg;
		
	private List<FichaFamiliarDTO> convivientes = new ArrayList<FichaFamiliarDTO>();
	
	private String fechaReincorporacionPBE;
	
	private String anioEgreso;
	
	private String eae;
	
	//2018
	
			private String informacionEscuela;
			private String propositoAnual;
			private String tiempoLibre;
			private String espacioEscuela;
			private String materiasCuestan;
			private String ea;
			private String mailEA;
			
			
	//2021
			
			private String titulo;
			private String footer;
			private String foto;
			private String observacionesExcepcion;
			private String matriculaTotal;
			private String orientacion;
			private String descripcionEscuela;
			private String anioIncorporacion;
			private String vosMismo;
			private String cuandoTermine;
			
	//2023
			
			private String realizadoVacaciones;
			
			private String situacionEscolar;
			
			private String incorporacion;

			private String observacionesNoIncorporacion;
			
			
			
			
			
	public String getObservacionesNoIncorporacion() {
				return observacionesNoIncorporacion;
			}

			public void setObservacionesNoIncorporacion(String observacionesNoIncorporacion) {
				this.observacionesNoIncorporacion = observacionesNoIncorporacion;
			}

	public String getIncorporacion() {
				return incorporacion;
			}

			public void setIncorporacion(String incorporacion) {
				this.incorporacion = incorporacion;
			}

	public String getSituacionEscolar() {
				return situacionEscolar;
			}

			public void setSituacionEscolar(String situacionEscolar) {
				this.situacionEscolar = situacionEscolar;
			}

	public String getRealizadoVacaciones() {
				return realizadoVacaciones;
			}

			public void setRealizadoVacaciones(String realizadoVacaciones) {
				this.realizadoVacaciones = realizadoVacaciones;
			}

	public String getCuandoTermine() {
				return cuandoTermine;
			}

			public void setCuandoTermine(String cuandoTermine) {
				this.cuandoTermine = cuandoTermine;
			}

	public String getVosMismo() {
				return vosMismo;
			}

			public void setVosMismo(String vosMismo) {
				this.vosMismo = vosMismo;
			}

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

	public String getMailEA() {
				return mailEA;
			}

			public void setMailEA(String mailEA) {
				this.mailEA = mailEA;
			}

			public void setAnioEgreso(String anioEgreso) {
				this.anioEgreso = anioEgreso;
			}

	public String getEa() {
				return ea;
			}

			public void setEa(String ea) {
				this.ea = ea;
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

	public String getAnioActual() {
		return anioActual;
	}

	public void setAnioActual(String anioActual) {
		this.anioActual = anioActual;
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

	public String getEscuela() {
		return escuela;
	}

	public void setEscuela(String escuela) {
		this.escuela = escuela;
	}

	public String getEscuelaLocalidad() {
		return escuelaLocalidad;
	}

	public void setEscuelaLocalidad(String escuelaLocalidad) {
		this.escuelaLocalidad = escuelaLocalidad;
	}


	public String getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(String fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public String getPadrino() {
		return padrino;
	}

	public void setPadrino(String padrino) {
		this.padrino = padrino;
	}

	public String getRelacion() {
		return relacion;
	}

	public void setRelacion(String relacion) {
		this.relacion = relacion;
	}

	public String getComentarios() {
		return comentarios;
	}

	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	public String getAnio() {
		return anio;
	}

	public void setAnio(String anio) {
		this.anio = anio;
	}

	public String getPathImg() {
		return pathImg;
	}

	public void setPathImg(String pathImg) {
		this.pathImg = pathImg;
	}

	public String getAlumno() {
		return alumno;
	}

	public void setAlumno(String alumno) {
		this.alumno = alumno;
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

	public JRDataSource getFicha()   
    {       
        return new JRBeanCollectionDataSource(convivientes);   
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
	
	public JRDataSource getBoletin()   
    {       
        return new JRBeanCollectionDataSource(materias);   
    } 
	
	public void addMateria(MateriaDTO materia)   
	{       
	   this.materias.add(materia);   
	}

	public String getFechaReincorporacionPBE() {
		return fechaReincorporacionPBE;
	}

	public void setFechaReincorporacionPBE(String fechaReincorporacionPBE) {
		this.fechaReincorporacionPBE = fechaReincorporacionPBE;
	}
	
public String getAnioEgreso() {
		
		//long posibleAnioEgreso=0;
		//long anioAdicional=0;
		//if (is2.getAnioAdicional()=="No"){
		//	anioAdicional=1;
		//}
		//posibleAnioEgreso=7-anioAdicional-Long.parseLong(this.anio.substring(0, 1));
		//posibleAnioEgreso=Long.parseLong(this.anioActual)+posibleAnioEgreso;	
		//this.anioEgreso=String.valueOf(posibleAnioEgreso);
		//System.out.println(this.anioEgreso);
		
		return anioEgreso;
	}

	public void setAnioEgreso(long anioEgreso) {
		//this.anioEgreso = anioEgreso;
		// calculo año posible de egreso
		long posibleAnioEgreso=0;
		long anioAdicional=anioEgreso;
		//if (is2.getAnioAdicional()=="No"){
		//	anioAdicional=1;
		//}
		
		
		
		if (anio.equals("-")){
			this.anioEgreso=String.valueOf(this.anioActual);
		}else{
			if (Long.parseLong(this.anio.substring(0, 1))==7){
				anioAdicional=0;
			}
			if (this.anio.equals("7º primaria")){
				posibleAnioEgreso=7-anioAdicional-1;
			}else{
				posibleAnioEgreso=7-anioAdicional-Long.parseLong(this.anio.substring(0, 1));
			}
			
			if(this.eae.equals("7/5")){
				posibleAnioEgreso--;
			}
			
			posibleAnioEgreso=Long.parseLong(this.anioActual)+posibleAnioEgreso;	
			this.anioEgreso=String.valueOf(posibleAnioEgreso);
		}
		
		//System.out.println(this.anioEgreso);
	}
	
}

