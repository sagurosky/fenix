/**
 * 
 */
package org.cimientos.intranet.modelo.convocado;

import org.cimientos.intranet.modelo.candidato.convocatoria.ConvocatoriaSeleccion;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.cimientos.intranet.enumerativos.entrevista.EstadoEntrevista;
import com.googlecode.ehcache.annotations.Cacheable;

/**
 * @author nlopez
 *
 */
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE, region="org.cimientos.intranet.modelo.convocado.CandidatoDTO")
public class CandidatoDTO { // CADA CONVOCADO ES UN ALUMNO, (PerfilAlumno).

	private Long id;
	
	PerfilAlumno perfilAlumno;
	
	ConvocatoriaSeleccion convocatoria;
	
	private EstadoEntrevista estadoEntrevista;
	
	
	
//	List<EntrevistaSeleccion> listEntrevistaSelecciones;

	@Cacheable(cacheName = "org.cimientos.intranet.modelo.perfil.PerfilAlumno")
	public PerfilAlumno getPerfilAlumno() {
		return perfilAlumno;
	}

	/**
	 * @param perfilAlumno the perfilAlumno to set
	 */
	public void setPerfilAlumno(PerfilAlumno perfilAlumno) {
		this.perfilAlumno = perfilAlumno;
	}

//	/**
//	 * @return the convocatoria
//	 */
//	public Convocatoria getConvocatoria() {
//		return convocatoria; 
//	}
//
//	/**
//	 * @param convocatoria the convocatoria to set
//	 */
//	public void setConvocatoria(Convocatoria convocatoria) {
//		this.convocatoria = convocatoria;
//	}

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
	 * @return the convocatoria
	 */
	public ConvocatoriaSeleccion getConvocatoria() {
		return convocatoria;
	}

	/**
	 * @param convocatoria the convocatoria to set
	 */
	public void setConvocatoria(ConvocatoriaSeleccion convocatoria) {
		this.convocatoria = convocatoria;
	}

	/**
	 * @return the estadoEntrevista
	 */
	public EstadoEntrevista getEstadoEntrevista() {
		return estadoEntrevista;
	}

	/**
	 * @param estadoEntrevista the estadoEntrevista to set
	 */
	public void setEstadoEntrevista(EstadoEntrevista estadoEntrevista) {
		this.estadoEntrevista = estadoEntrevista;
	}

}
