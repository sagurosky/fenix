package org.cimientos.intranet.dto;

import java.util.List;

import org.cimientos.intranet.modelo.entrevistaTS.EntrevistaTS;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;

import com.cimientos.intranet.enumerativos.Convive;
import com.cimientos.intranet.enumerativos.NivelEducativo;
import com.cimientos.intranet.enumerativos.RecomendacionesTS;
import com.cimientos.intranet.enumerativos.Vinculo;



/**
 * Este DTO es para mapear los datos correspondiente a Entrevista Trabajador Social.
 *
 * @author cfigueroa
 * @since 01-abr-2011
 */
public class EntrevistaTSDTO {
	
	/** The entrevista ts. */
	private EntrevistaTS entrevistaTS;
	
	/** The vinculo f fs. */
	private List<Integer> vinculoFFs;
	
	/** The nombre fichas. */
	private List<String> nombreFichas;
	
	/** The apellido fichas. */
	private List<String> apellidoFichas;
	
	/** The edad fichas. */
	private List<String> edadFichas;
	
	/** The convive fichas. */
	private List<Integer> conviveFichas;
	
	/** The nivel educativo fichas. */
	private List<Integer> nivelEducativoFichas;
	
	/** The abandono repitencia fichas. */
	private List<String> abandonoRepitenciaFichas;
	
	/** The ocupacion laboral fichas. */
	private List<String> ocupacionLaboralFichas;
	
	/** The estabilidad laboral fichas. */
	private List<String> estabilidadLaboralFichas;
	
	/** The renumeracion fichas. */
	private List<String> renumeracionFichas;
	
	/** The otros ingresos fichas. */
	private List<String> otrosIngresosFichas;
	
	/** The lista recomendacion ts. */
	private List<RecomendacionesTS> listaRecomendacionTS;
	
	/** The edad alumno. */
	private Integer edadAlumno;
	
	/** The edad responsable. */
	private Integer edadResponsable;
	
	/** The localidades. */
	private List<Localidad> localidades;
	
	/** The list provincias. */
	private List<Provincia> listProvincias;
	
	/** The id ficha familiars. */
	private List<Long> idFichaFamiliars;
	
	/** The id alumno. */
	private Long idAlumno;
	
	/** The recomendacion ts id. */
	private Integer recomendacionTSId;
	
	/** The id motivo visita. */
	private Integer idMotivoVisita;
	
	/** The list vinculo. */
	private List<Vinculo> listVinculo;
	
	/** The list convive. */
	private List<Convive> listConvive;
	
	/** The list nivel educativo. */
	private List<NivelEducativo> listNivelEducativo;
	
	/** The is entrevista ts. */
	private Boolean isEntrevistaTS;
	
	/** The is detalle entrevista. */
	private Boolean isDetalleEntrevista;
	
	/** The observaciones ts list. */
	private List<String> observacionesTSList;
	
	/** The id motivo rechazo. */
	private Integer idMotivoRechazo;
	
	private Boolean seleccion;
	
	/**
	 * Gets the entrevista ts.
	 *
	 * @return the entrevista ts
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public EntrevistaTS getEntrevistaTS() {
		return entrevistaTS;
	}
	
	/**
	 * Sets the entrevista ts.
	 *
	 * @param entrevistaTS the new entrevista ts
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setEntrevistaTS(EntrevistaTS entrevistaTS) {
		this.entrevistaTS = entrevistaTS;
	}
	
	/**
	 * Gets the vinculo f fs.
	 *
	 * @return the vinculo f fs
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<Integer> getVinculoFFs() {
		return vinculoFFs;
	}
	
	/**
	 * Sets the vinculo f fs.
	 *
	 * @param vinculoFFs the new vinculo f fs
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setVinculoFFs(List<Integer> vinculoFFs) {
		this.vinculoFFs = vinculoFFs;
	}
	
	/**
	 * Gets the nombre fichas.
	 *
	 * @return the nombre fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<String> getNombreFichas() {
		return nombreFichas;
	}
	
	/**
	 * Sets the nombre fichas.
	 *
	 * @param nombreFichas the new nombre fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setNombreFichas(List<String> nombreFichas) {
		this.nombreFichas = nombreFichas;
	}
	
	/**
	 * Gets the apellido fichas.
	 *
	 * @return the apellido fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<String> getApellidoFichas() {
		return apellidoFichas;
	}
	
	/**
	 * Sets the apellido fichas.
	 *
	 * @param apellidoFichas the new apellido fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setApellidoFichas(List<String> apellidoFichas) {
		this.apellidoFichas = apellidoFichas;
	}
	
	/**
	 * Gets the edad fichas.
	 *
	 * @return the edad fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<String> getEdadFichas() {
		return edadFichas;
	}
	
	/**
	 * Sets the edad fichas.
	 *
	 * @param edadFichas the new edad fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setEdadFichas(List<String> edadFichas) {
		this.edadFichas = edadFichas;
	}
	
	/**
	 * Gets the convive fichas.
	 *
	 * @return the convive fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<Integer> getConviveFichas() {
		return conviveFichas;
	}
	
	/**
	 * Sets the convive fichas.
	 *
	 * @param conviveFichas the new convive fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setConviveFichas(List<Integer> conviveFichas) {
		this.conviveFichas = conviveFichas;
	}
	
	/**
	 * Gets the nivel educativo fichas.
	 *
	 * @return the nivel educativo fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<Integer> getNivelEducativoFichas() {
		return nivelEducativoFichas;
	}
	
	/**
	 * Sets the nivel educativo fichas.
	 *
	 * @param nivelEducativoFichas the new nivel educativo fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setNivelEducativoFichas(List<Integer> nivelEducativoFichas) {
		this.nivelEducativoFichas = nivelEducativoFichas;
	}
	
	/**
	 * Gets the abandono repitencia fichas.
	 *
	 * @return the abandono repitencia fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<String> getAbandonoRepitenciaFichas() {
		return abandonoRepitenciaFichas;
	}
	
	/**
	 * Sets the abandono repitencia fichas.
	 *
	 * @param abandonoRepitenciaFichas the new abandono repitencia fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setAbandonoRepitenciaFichas(List<String> abandonoRepitenciaFichas) {
		this.abandonoRepitenciaFichas = abandonoRepitenciaFichas;
	}
	
	/**
	 * Gets the ocupacion laboral fichas.
	 *
	 * @return the ocupacion laboral fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<String> getOcupacionLaboralFichas() {
		return ocupacionLaboralFichas;
	}
	
	/**
	 * Sets the ocupacion laboral fichas.
	 *
	 * @param ocupacionLaboralFichas the new ocupacion laboral fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setOcupacionLaboralFichas(List<String> ocupacionLaboralFichas) {
		this.ocupacionLaboralFichas = ocupacionLaboralFichas;
	}
	
	/**
	 * Gets the estabilidad laboral fichas.
	 *
	 * @return the estabilidad laboral fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<String> getEstabilidadLaboralFichas() {
		return estabilidadLaboralFichas;
	}
	
	/**
	 * Sets the estabilidad laboral fichas.
	 *
	 * @param estabilidadLaboralFichas the new estabilidad laboral fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setEstabilidadLaboralFichas(List<String> estabilidadLaboralFichas) {
		this.estabilidadLaboralFichas = estabilidadLaboralFichas;
	}
	
	/**
	 * Gets the renumeracion fichas.
	 *
	 * @return the renumeracion fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<String> getRenumeracionFichas() {
		return renumeracionFichas;
	}
	
	/**
	 * Sets the renumeracion fichas.
	 *
	 * @param renumeracionFichas the new renumeracion fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setRenumeracionFichas(List<String> renumeracionFichas) {
		this.renumeracionFichas = renumeracionFichas;
	}
	
	/**
	 * Gets the otros ingresos fichas.
	 *
	 * @return the otros ingresos fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<String> getOtrosIngresosFichas() {
		return otrosIngresosFichas;
	}
	
	/**
	 * Sets the otros ingresos fichas.
	 *
	 * @param otrosIngresosFichas the new otros ingresos fichas
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setOtrosIngresosFichas(List<String> otrosIngresosFichas) {
		this.otrosIngresosFichas = otrosIngresosFichas;
	}

	/**
	 * Gets the lista recomendacion ts.
	 *
	 * @return the lista recomendacion ts
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<RecomendacionesTS> getListaRecomendacionTS() {
		return listaRecomendacionTS;
	}

	/**
	 * Sets the lista recomendacion ts.
	 *
	 * @param listaRecomendacionTS the new lista recomendacion ts
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setListaRecomendacionTS(List<RecomendacionesTS> listaRecomendacionTS) {
		this.listaRecomendacionTS = listaRecomendacionTS;
	}

	/**
	 * Gets the edad alumno.
	 *
	 * @return the edad alumno
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public Integer getEdadAlumno() {
		return edadAlumno;
	}

	/**
	 * Sets the edad alumno.
	 *
	 * @param edadAlumno the new edad alumno
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setEdadAlumno(Integer edadAlumno) {
		this.edadAlumno = edadAlumno;
	}

	/**
	 * Gets the edad responsable.
	 *
	 * @return the edad responsable
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public Integer getEdadResponsable() {
		return edadResponsable;
	}

	/**
	 * Sets the edad responsable.
	 *
	 * @param edadResponsable the new edad responsable
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setEdadResponsable(Integer edadResponsable) {
		this.edadResponsable = edadResponsable;
	}

	
	/**
	 * Gets the localidades.
	 *
	 * @return the localidades
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<Localidad> getLocalidades() {
		return localidades;
	}

	/**
	 * Sets the localidades.
	 *
	 * @param localidades the new localidades
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setLocalidades(List<Localidad> localidades) {
		this.localidades = localidades;
	}

	/**
	 * Gets the list provincias.
	 *
	 * @return the list provincias
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public List<Provincia> getListProvincias() {
		return listProvincias;
	}

	/**
	 * Sets the list provincias.
	 *
	 * @param listProvincias the new list provincias
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void setListProvincias(List<Provincia> listProvincias) {
		this.listProvincias = listProvincias;
	}

	

	
	/**
	 * Gets the id ficha familiars.
	 *
	 * @return the id ficha familiars
	 * @since 04-abr-2011
	 * @author cfigueroa
	 */
	public List<Long> getIdFichaFamiliars() {
		return idFichaFamiliars;
	}

	/**
	 * Sets the id ficha familiars.
	 *
	 * @param idFichaFamiliars the new id ficha familiars
	 * @since 04-abr-2011
	 * @author cfigueroa
	 */
	public void setIdFichaFamiliars(List<Long> idFichaFamiliars) {
		this.idFichaFamiliars = idFichaFamiliars;
	}

	/**
	 * Gets the id alumno.
	 *
	 * @return the id alumno
	 * @since 04-abr-2011
	 * @author cfigueroa
	 */
	public Long getIdAlumno() {
		return idAlumno;
	}

	/**
	 * Sets the id alumno.
	 *
	 * @param idAlumno the new id alumno
	 * @since 04-abr-2011
	 * @author cfigueroa
	 */
	public void setIdAlumno(Long idAlumno) {
		this.idAlumno = idAlumno;
	}

	/**
	 * Gets the recomendacion ts id.
	 *
	 * @return the recomendacion ts id
	 * @since 04-abr-2011
	 * @author cfigueroa
	 */
	public Integer getRecomendacionTSId() {
		return recomendacionTSId;
	}

	/**
	 * Sets the recomendacion ts id.
	 *
	 * @param recomendacionTSId the new recomendacion ts id
	 * @since 04-abr-2011
	 * @author cfigueroa
	 */
	public void setRecomendacionTSId(Integer recomendacionTSId) {
		this.recomendacionTSId = recomendacionTSId;
	}

	/**
	 * Gets the id motivo visita.
	 *
	 * @return the id motivo visita
	 * @since 04-abr-2011
	 * @author cfigueroa
	 */
	public Integer getIdMotivoVisita() {
		return idMotivoVisita;
	}

	/**
	 * Sets the id motivo visita.
	 *
	 * @param idMotivoVisita the new id motivo visita
	 * @since 04-abr-2011
	 * @author cfigueroa
	 */
	public void setIdMotivoVisita(Integer idMotivoVisita) {
		this.idMotivoVisita = idMotivoVisita;
	}

	/**
	 * Gets the list vinculo.
	 *
	 * @return the list vinculo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public List<Vinculo> getListVinculo() {
		return listVinculo;
	}

	/**
	 * Sets the list vinculo.
	 *
	 * @param listVinculo the new list vinculo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setListVinculo(List<Vinculo> listVinculo) {
		this.listVinculo = listVinculo;
	}

	/**
	 * Gets the list convive.
	 *
	 * @return the list convive
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public List<Convive> getListConvive() {
		return listConvive;
	}

	/**
	 * Sets the list convive.
	 *
	 * @param listConvive the new list convive
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setListConvive(List<Convive> listConvive) {
		this.listConvive = listConvive;
	}

	/**
	 * Gets the list nivel educativo.
	 *
	 * @return the list nivel educativo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public List<NivelEducativo> getListNivelEducativo() {
		return listNivelEducativo;
	}

	/**
	 * Sets the list nivel educativo.
	 *
	 * @param listNivelEducativo the new list nivel educativo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setListNivelEducativo(List<NivelEducativo> listNivelEducativo) {
		this.listNivelEducativo = listNivelEducativo;
	}

	/**
	 * Gets the checks if is entrevista ts.
	 *
	 * @return the checks if is entrevista ts
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public Boolean getIsEntrevistaTS() {
		return isEntrevistaTS;
	}

	/**
	 * Sets the checks if is entrevista ts.
	 *
	 * @param isEntrevistaTS the new checks if is entrevista ts
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setIsEntrevistaTS(Boolean isEntrevistaTS) {
		this.isEntrevistaTS = isEntrevistaTS;
	}

	/**
	 * Gets the checks if is detalle entrevista.
	 *
	 * @return the checks if is detalle entrevista
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public Boolean getIsDetalleEntrevista() {
		return isDetalleEntrevista;
	}

	/**
	 * Sets the checks if is detalle entrevista.
	 *
	 * @param isDetalleEntrevista the new checks if is detalle entrevista
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setIsDetalleEntrevista(Boolean isDetalleEntrevista) {
		this.isDetalleEntrevista = isDetalleEntrevista;
	}

	/**
	 * Gets the observaciones ts list.
	 *
	 * @return the observaciones ts list
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public List<String> getObservacionesTSList() {
		return observacionesTSList;
	}

	/**
	 * Sets the observaciones ts list.
	 *
	 * @param observacionesTSList the new observaciones ts list
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setObservacionesTSList(List<String> observacionesTSList) {
		this.observacionesTSList = observacionesTSList;
	}

	/**
	 * Gets the id motivo rechazo.
	 *
	 * @return the id motivo rechazo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public Integer getIdMotivoRechazo() {
		return idMotivoRechazo;
	}

	/**
	 * Sets the id motivo rechazo.
	 *
	 * @param idMotivoRechazo the new id motivo rechazo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setIdMotivoRechazo(Integer idMotivoRechazo) {
		this.idMotivoRechazo = idMotivoRechazo;
	}

	public Boolean getSeleccion() {
		return seleccion;
	}

	public void setSeleccion(Boolean seleccion) {
		this.seleccion = seleccion;
	}

	

	

}
