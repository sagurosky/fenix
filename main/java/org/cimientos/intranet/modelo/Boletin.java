package org.cimientos.intranet.modelo;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.cimientos.intranet.enumerativos.AnioEscolar;
import com.cimientos.intranet.enumerativos.CalificacionMateria;
import com.cimientos.intranet.enumerativos.ConductaAlumno;

/**
 * Boletin
 * @author msagarduy
 *
 */
@Entity
public class Boletin implements Serializable{

	@Id
	@GeneratedValue
	private Long id;
	
	@OneToMany
	private List<Trimestre> trimestres;
	
	@OneToOne
	private CicloPrograma ciclo;
	
	@ManyToMany
	private List<Materia> materias;
	
	@ManyToMany
	private List<Trimestre> previas;
	
	@ManyToMany
	private List<Materia> materiasPrevias;
	
	private Float inasistenciasPrimerTrimestre;
	
	private Float inasistenciasSegundoTrimestre;
	
	private Float inasistenciasTercerTrimestre;
	
	@Enumerated(EnumType.ORDINAL)
	private AnioEscolar ano;
	
	private boolean regular;
	
	private Float diasHabilesPrimerTrimestre;
	
	private Float diasHabilesSegundoTrimestre;
	
	private Float diasHabilesTercerTrimestre;
	
	@Enumerated(EnumType.ORDINAL)
	private ConductaAlumno conductaPrimerTrimestre;
	
	@Enumerated(EnumType.ORDINAL)
	private ConductaAlumno conductaSegundoTrimestre;
	
	@Enumerated(EnumType.ORDINAL)
	private ConductaAlumno conductaTercerTrimestre;
	
//	private boolean sinDatoAsistenciaPrimer;
//	
//	private boolean sinDatoAsistenciaSegundo;
//	
//	private boolean sinDatoAsistenciaTercer;
//	
//	private boolean sinDatoHabilesPrimer;
//	
//	private boolean sinDatoHabilesSegundo;
//	
//	private boolean sinDatoHabilesTercer;
	

	/**
	 * @return the conductaPrimerTrimestre
	 */
	public ConductaAlumno getConductaPrimerTrimestre() {
		return conductaPrimerTrimestre;
	}

	/**
	 * @param conductaPrimerTrimestre the conductaPrimerTrimestre to set
	 */
	public void setConductaPrimerTrimestre(ConductaAlumno conductaPrimerTrimestre) {
		this.conductaPrimerTrimestre = conductaPrimerTrimestre;
	}

	/**
	 * @return the conductaSegundoTrimestre
	 */
	public ConductaAlumno getConductaSegundoTrimestre() {
		return conductaSegundoTrimestre;
	}

	/**
	 * @param conductaSegundoTrimestre the conductaSegundoTrimestre to set
	 */
	public void setConductaSegundoTrimestre(ConductaAlumno conductaSegundoTrimestre) {
		this.conductaSegundoTrimestre = conductaSegundoTrimestre;
	}

	/**
	 * @return the conductaTercerTrimestre
	 */
	public ConductaAlumno getConductaTercerTrimestre() {
		return conductaTercerTrimestre;
	}

	/**
	 * @param conductaTercerTrimestre the conductaTercerTrimestre to set
	 */
	public void setConductaTercerTrimestre(ConductaAlumno conductaTercerTrimestre) {
		this.conductaTercerTrimestre = conductaTercerTrimestre;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	 
	public CicloPrograma getCiclo() {
		return ciclo;
	}

	public void setCiclo(CicloPrograma ciclo) {
		this.ciclo = ciclo;
	}

	public List<Trimestre> getTrimestres() {
		return trimestres;
	}

	public void setTrimestres(List<Trimestre> trimestres) {
		this.trimestres = trimestres;
	}

	public List<Materia> getMaterias() {
		return materias;
	}

	public void setMaterias(List<Materia> materias) {
		this.materias = materias;
	}



	/**
	 * @return the inasistenciasPrimerTrimestre
	 */
	public Float getInasistenciasPrimerTrimestre() {
		return inasistenciasPrimerTrimestre;
	}

	/**
	 * @return the inasistenciasSegundoTrimestre
	 */
	public Float getInasistenciasSegundoTrimestre() {
		return inasistenciasSegundoTrimestre;
	}

	/**
	 * @return the inasistenciasTercerTrimestre
	 */
	public Float getInasistenciasTercerTrimestre() {
		return inasistenciasTercerTrimestre;
	}

	public AnioEscolar getAno() {
		return ano;
	}

	public void setAno(AnioEscolar ano) {
		this.ano = ano;
	}



	/**
	 * @return the previas
	 */
	public List<Trimestre> getPrevias() {
		return previas;
	}

	/**
	 * @param previas the previas to set
	 */
	public void setPrevias(List<Trimestre> previas) {
		this.previas = previas;
	}

	/**
	 * @return the materiasPrevias
	 */
	public List<Materia> getMateriasPrevias() {
		return materiasPrevias;
	}

	/**
	 * @param materiasPrevias the materiasPrevias to set
	 */
	public void setMateriasPrevias(List<Materia> materiasPrevias) {
		this.materiasPrevias = materiasPrevias;
	}

	/**
	 * @return the regular
	 */
	public boolean isRegular() {
		return regular;
	}

	/**
	 * @param regular the regular to set
	 */
	public void setRegular(boolean regular) {
		this.regular = regular;
	}


	/**
	 * @return the diasHabilesPrimerTrimestre
	 */
	public Float getDiasHabilesPrimerTrimestre() {
		return diasHabilesPrimerTrimestre;
	}

	/**
	 * @param diasHabilesPrimerTrimestre the diasHabilesPrimerTrimestre to set
	 */
	public void setDiasHabilesPrimerTrimestre(Float diasHabilesPrimerTrimestre) {
		this.diasHabilesPrimerTrimestre = diasHabilesPrimerTrimestre;
	}

	/**
	 * @return the diasHabilesSegundoTrimestre
	 */
	public Float getDiasHabilesSegundoTrimestre() {
		return diasHabilesSegundoTrimestre;
	}

	/**
	 * @param diasHabilesSegundoTrimestre the diasHabilesSegundoTrimestre to set
	 */
	public void setDiasHabilesSegundoTrimestre(Float diasHabilesSegundoTrimestre) {
		this.diasHabilesSegundoTrimestre = diasHabilesSegundoTrimestre;
	}

	/**
	 * @return the diasHabilesTercerTrimestre
	 */
	public Float getDiasHabilesTercerTrimestre() {
		return diasHabilesTercerTrimestre;
	}

	/**
	 * @param diasHabilesTercerTrimestre the diasHabilesTercerTrimestre to set
	 */
	public void setDiasHabilesTercerTrimestre(Float diasHabilesTercerTrimestre) {
		this.diasHabilesTercerTrimestre = diasHabilesTercerTrimestre;
	}

	/**
	 * @param inasistenciasPrimerTrimestre the inasistenciasPrimerTrimestre to set
	 */
	public void setInasistenciasPrimerTrimestre(Float inasistenciasPrimerTrimestre) {
		this.inasistenciasPrimerTrimestre = inasistenciasPrimerTrimestre;
	}

	/**
	 * @param inasistenciasSegundoTrimestre the inasistenciasSegundoTrimestre to set
	 */
	public void setInasistenciasSegundoTrimestre(Float inasistenciasSegundoTrimestre) {
		this.inasistenciasSegundoTrimestre = inasistenciasSegundoTrimestre;
	}

	/**
	 * @param inasistenciasTercerTrimestre the inasistenciasTercerTrimestre to set
	 */
	public void setInasistenciasTercerTrimestre(Float inasistenciasTercerTrimestre) {
		this.inasistenciasTercerTrimestre = inasistenciasTercerTrimestre;
	}

	/**
	 * Retorna el total de inasistencias sumadas de todos los trimestres.
	 * @return
	 */
	public float getTotalInasistencias(){
		return (this.getInasistenciasPrimerTrimestre() != null ?  this.getInasistenciasPrimerTrimestre() : 0 ) +
			   (this.getInasistenciasSegundoTrimestre() != null ?  this.getInasistenciasSegundoTrimestre() : 0 )+
			   (this.getInasistenciasTercerTrimestre()!= null ?  this.getInasistenciasTercerTrimestre() : 0 );
	}
	
	/**
	 * Retorna el total de dias habiles sumados de los 3 trimestres.
	 * @return
	 */
	public float getTotalDiasHabiles(){
		return (this.getDiasHabilesPrimerTrimestre() != null ?  this.getDiasHabilesPrimerTrimestre() : 0 )+
				(this.getDiasHabilesSegundoTrimestre() != null ?  this.getDiasHabilesSegundoTrimestre() : 0 )+
				(this.getDiasHabilesTercerTrimestre()!= null ?  this.getDiasHabilesTercerTrimestre() : 0 );
	}
	
	/**
	 * Retorna si un boletin tiene notas cargadas en alguno de sus trimestres.
	 * Esto es util para cuando se debe mostrar las notas en un informe 
	 * ya que no basta con preguntar si el boletin es null.
	 * @return
	 */
	public boolean isNotasCargadas(){
		boolean tieneNotas = false;
		Iterator<Trimestre> it = getTrimestres().iterator();
		while (it.hasNext() && !tieneNotas) {
			Trimestre trim = it.next();
			Iterator<NotaMateria> it2 = trim.getMaterias().iterator();
			while (it2.hasNext() && !tieneNotas) {
				tieneNotas = it2.next().getCalificacion() != null || 
				(it2.next().getCalificacion()!= null && it2.next().getCalificacion().equals(CalificacionMateria.SIN_CARGAR));
			}
		}
		return tieneNotas;
	}


	
}
