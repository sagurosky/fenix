package org.cimientos.intranet.utils;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dto.ExportacionEntrevistaDTO;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaFinal;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaReIncorporacion;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaRenovacion;
import org.springframework.stereotype.Component;

import com.cimientos.intranet.enumerativos.entrevista.ContenidosAbordados;
import com.cimientos.intranet.enumerativos.entrevista.DetalleGastos;
import com.cimientos.intranet.enumerativos.entrevista.EstrategiaComplementaria;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionMergeada;
import com.cimientos.intranet.enumerativos.entrevista.GustosTiempoLibre;
import com.cimientos.intranet.enumerativos.entrevista.SituacionCrisis;
import com.cimientos.intranet.enumerativos.entrevista.TipoEntrevista;
import com.cimientos.intranet.enumerativos.entrevista.PropositoAnioComienza;

/**
 * @author plabaronnie
 *
 */
@Component
public class ExportacionEspecialHelper {
	
	private static final String NO_APLICA = "No aplica";
	private static final String GRUPAL = "Grupal";
	private static final String INDIVIDUAL = "Individual";
	private static final String SI = "Si";
	private static final String NO = "No";
	private static final String PATRON_FECHA = "dd/MM/yyyy";
	
	public List<ExportacionEntrevistaDTO> obtenerListaExportacion(List<EntrevistaIndividual> entrevistas){
		List<ExportacionEntrevistaDTO> entrevistasExportacion = new ArrayList<ExportacionEntrevistaDTO>();
		ExportacionEntrevistaDTO export = null;		
		for (EntrevistaIndividual entrevista : entrevistas) {		
			export = new ExportacionEntrevistaDTO(); 
			export.setIdAlumno(getIdAlumno(entrevista));
			export.setTipoEntrevista(getTipoEntrevista(entrevista));
			export.setFormaEntrevista(getFormaEntrevista(entrevista));
			export.setZonaCimientos(getZonaCimientos(entrevista));
			export.setEa(getEa(entrevista));
			export.setResponsableRegional(getResponsableRegional(entrevista));
			export.setApellidoAlumno(getApellidoAlumno(entrevista));
			export.setNombreAlumno(getNombreAlumno(entrevista));
			export.setNumeroDocumentoAlumno(getNumeroDocumentoAlumno(entrevista));
			export.setEdad(getEdad(entrevista));
			export.setSexo(getSexo(entrevista));
			export.setCicloLectivo(getCicloLectivo(entrevista));
			export.setIncorporacion(getIncorporacion(entrevista));
			export.setMotivoIncorporacionPendiente(getMotivoIncorporacionPendiente(entrevista));
			export.setOtroMotivoPendiente(getOtroMotivoPendiente(entrevista));
			//null
			export.setMotivoNoIncorporacion(getMotivoNoIncorporacion(entrevista));
			//null
			export.setSituacionEscolarDiciembre(getSituacionEscolarDiciembre(entrevista));
			//null
			export.setSituacionRenovacionDiciembre(getSituacionRenovacionDiciembre(entrevista));
			export.setSituacionEscolar(getSituacionEscolar(entrevista));
			export.setSituacionRenovacion(getSituacionRenovacion(entrevista));
			//null
			export.setMotivoPendiente(getMotivoPendiente(entrevista));
			export.setOtroMotivo(getOtroMotivo(entrevista));
			//null
			export.setMotivoNoRenovacion(getMotivoNoRenovacion(entrevista));
			export.setRealizoEntrevista(getRealizoEntrevista(entrevista));
			//null
			export.setTipoContacto(getTipoContacto(entrevista));
			export.setObservacionesMateriasExamenes(getObservacionesMateriasExamenes(entrevista));
			export.setEscolaridadCompromisoAnterior(getEscolaridadCompromisoAnterior(entrevista));
			export.setPeriodoEntrevista(getPeriodoEntrevista(entrevista));
			export.setEstadoAlumno(getEstadoAlumno(entrevista));
			export.setFechaAltaBeca(getFechaAltaBeca(entrevista));
			//null
			export.setFechaIncorporacionPBE(getFechaIncorporacionPBE(entrevista));
			export.setFechaEntrevista(getFechaEntrevista(entrevista));
			export.setFechaCargaEntrevista(getFechaCargaEntrevista(entrevista));
			//puede ser null
			export.setEntrevistaReprogramada(getEntrevistaReprogramada(entrevista));
			export.setLugarEntrevista(getLugarEntrevista(entrevista));
			export.setParticipoBecado(getParticipoBecado(entrevista));
			//puede ser null
			export.setMotivoAusenciaBecado(getMotivoAusenciaBecado(entrevista));
			export.setOtroMotivoAusenciaBecado(getOtroMotivoAusenciaBecado(entrevista));
			export.setParticipoRA(getParticipoRA(entrevista));
			//puede ser null
			export.setMotivoAusenciaRA(getMotivoAusenciaRA(entrevista));
			export.setOtroMotivoAusenciaRA(getOtroMotivoAusenciaRA(entrevista));
			export.setEscuela(getEscuela(entrevista));
			//puede ser null
			
			export.setAnioEscolar(getAnioEscolar(entrevista));
			export.setAnioAdicional(getAnioAdicional(entrevista));
			export.setMateriasFechasDiciembre(getMateriasFechasDiciembre(entrevista));
			export.setMateriasFechasFebreroMarzo(getMateriasFechasFebreroMarzo(entrevista));

			export.setCantidadInasistencias(getCantidadInasistencias(entrevista));
			export.setMotivoInasistencias(getMotivoInasistencias(entrevista));

			export.setMaterialCompleto(getMaterialCompleto(entrevista));
			export.setRendicionGastos(getRendicionGastos(entrevista));
			//puede ser null
			export.setDetalleGastos(getDetalleGastos(entrevista));

			export.setEvaluacionPropositoAnual(getEvaluacionPropositoAnual(entrevista));
			export.setResultadoAnioEscolar(getResultadoAnioEscolar(entrevista));
			export.setCambioEscuelaProximoAnio(getCambioEscuelaProximoAnio(entrevista));
			export.setProyeccionAnioProximoFinalizacionPBE(getProyeccionAnioProximoFinalizacionPBE(entrevista));
			//null
			export.setFechaEntrevistaFebreroMarzo(getFechaEntrevistaFebreroMarzo(entrevista));
			export.setHoraEntrevistaFebreroMarzo(getHoraEntrevistaFebreroMarzo(entrevista));
			export.setLugarEntrevistaFebreroMarzo(getLugarEntrevistaFebreroMarzo(entrevista));
			export.setEvolucionMesAnterior(getEvolucionMesAnterior(entrevista));
			export.setLogros(getLogros(entrevista));
			export.setDificultades(getDificultades(entrevista));
			export.setProposito(getProposito(entrevista));
			//null
			export.setContenidosAbordados(getContenidosAbordados(entrevista));
			//null
			export.setCompromisoRAEscolaridad(getCompromisoRAEscolaridad(entrevista));
			//null
			export.setRecomendacionEstrategiaComplementaria(getRecomendacionEstrategiaComplementaria(entrevista));
			//null
			export.setSituacionCrisis(getSituacionCrisis(entrevista));
			export.setExpectativasRA(getExpectativasRA(entrevista));
			export.setDestinoDineroBeca(getDestinoDineroBeca(entrevista));
			//null
			export.setFechaProximaEntrevista(getFechaProximaEntrevista(entrevista));
			export.setHoraProximaEntrevista(getHoraProximaEntrevista(entrevista));
			//null
			export.setLugarProximaEntrevista(getLugarProximaEntrevista(entrevista));
			//null
			export.setEvaluacionCobroBeca(getEvaluacionCobroBeca(entrevista));
			export.setComentariosRevision(getComentariosRevision(entrevista));
			//null
			export.setEstadoPago(getEstadoPago(entrevista));
			//null
			export.setMotivoSuspension(getMotivoSuspension(entrevista));
			//null
			export.setMotivoCesacion(getMotivoCesacion(entrevista));
			export.setObservacionesGrales(getObservacionesGrales(entrevista));
			export.setPrevias(getPrevias(entrevista));
			export.setPreviasCuales(getPreviasCuales(entrevista));
			export.setPadrino(getPadrino(entrevista));
			export.setTipoPadrino(getTipoPadrino(entrevista));
			export.setQuienCargoEntrevista(getQuienCargoEntrevista(entrevista));
			export.setEstadoEntrevista(getEstadoEntrevista(entrevista));
			
			export.setOtroTipoContacto(getOtroTipoContacto(entrevista));
			export.setOtroMotivoNoIncorporacion(getOtroMotivoNoIncorporacion(entrevista));
		
			export.setPropositoAnioComienzaList(getPropositoAnioComienzaList(entrevista));
			
			export.setIdEntrevista(getIdEntrevista(entrevista));
			export.setIdTipoEntrevista(getIdTipoEntrevista(entrevista));
			
			entrevistasExportacion.add(export);

			export = null;
			entrevista = null;
		}
		entrevistas = null;
		return entrevistasExportacion;
	}

	private String getAnioAdicional(EntrevistaIndividual entrevista) {
		if(entrevista.getPerfilAlumno().getAnioAdicional() != null)
			return entrevista.getPerfilAlumno().getAnioAdicional()?"Si":"No";
		else
			return "No";
	}

	/**
	 * @param entrevista
	 * @return
	 */
	private String getOtroMotivoNoIncorporacion(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getMotivoNoIncorporacionOtro();
		}
		return valor;
	}

	/**
	 * @param entrevista
	 * @return
	 */
	public String getOtroTipoContacto(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getMotivoTipoContactoOtro();
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getMotivoTipoContactoOtro();
		}
		return valor;
	}

	/**
	 * @param entrevista
	 * @return
	 */
	private String getEstadoEntrevista(EntrevistaIndividual entrevista) {
		return entrevista.getEstadoEntrevista().getValor();
	}

	/**
	 * @return the idAlumno
	 */
	private static Long getIdAlumno(EntrevistaIndividual entrevista) {
		return entrevista.getPerfilAlumno().getId();
	}

	/**
	 * @return the idBeca
	 */
	public Long getIdBeca(EntrevistaIndividual entrevista) {
		return entrevista.getExportacionEspecial().getIdBeca();
	}

	/**
	 * @return the idInforme
	 */
	public Long getIdInforme(EntrevistaIndividual entrevista) {
		return entrevista.getExportacionEspecial().getIdInforme();
	}

	/**
	 * @return the tipoEntrevista
	 */
	public String getTipoEntrevista(EntrevistaIndividual entrevista) {
		return entrevista.getTipoEntrevista().getValor();
	}

	/**
	 * @return the formaEntrevista
	 */
	public String getFormaEntrevista(EntrevistaIndividual entrevista) {
		if(entrevista.getEntrevistaGrupal() != null){
			return GRUPAL;
		}
		return INDIVIDUAL;
	}
	/**
	 * @return the zonaCimientos
	 */
	public String getZonaCimientos(EntrevistaIndividual entrevista) {
		return entrevista.getEscuelaAlumno().getLocalidad().getZona().getNombre();
	}

	/**
	 * @return the ea
	 */
	public String getEa(EntrevistaIndividual entrevista) {
		if(entrevista.getEa()!= null){
			return entrevista.getEa().getDatosPersonales().getApellido() + ", " 
			+ entrevista.getEa().getDatosPersonales().getNombre();
		}
		return entrevista.getId().toString();
		
	}

	/**
	 * @return the responsableRegional
	 */
	public String getResponsableRegional(EntrevistaIndividual entrevista) {
		return entrevista.getRr().getDatosPersonales().getApellido() + ", " 
		+ entrevista.getRr().getDatosPersonales().getNombre();
	}

	/**
	 * @return the apellidoAlumno
	 */
	public String getApellidoAlumno(EntrevistaIndividual entrevista) {
		return entrevista.getPerfilAlumno().getDatosPersonales().getApellido();
	}

	/**
	 * @return the nombreAlumno
	 */
	public String getNombreAlumno(EntrevistaIndividual entrevista) {
		return entrevista.getPerfilAlumno().getDatosPersonales().getNombre();
	}

	/**
	 * @return the tipoDocumentoAlumno
	 */
	public String getTipoDocumentoAlumno(EntrevistaIndividual entrevista) {
		return entrevista.getPerfilAlumno().getDatosPersonales().getTipoDni() != null ? entrevista.getPerfilAlumno().getDatosPersonales().getTipoDni().getValor() : "";
	}

	/**
	 * @return the numeroDocumentoAlumno
	 */
	public Integer getNumeroDocumentoAlumno(EntrevistaIndividual entrevista) {
		return entrevista.getPerfilAlumno().getDatosPersonales().getDni();
	}

	/**
	 * @return the edad
	 */
	public Integer getEdad(EntrevistaIndividual entrevista) {
		return entrevista.getExportacionEspecial().getEdad();
	}

	/**
	 * @return the sexo
	 */
	public String getSexo(EntrevistaIndividual entrevista) {
		return entrevista.getPerfilAlumno().getDatosPersonales().getSex();
	}

	/**
	 * @return the cicloLectivo
	 */
	public String getCicloLectivo(EntrevistaIndividual entrevista) {
		return entrevista.getPeriodoDePago() != null ? entrevista.getPeriodoDePago().getCiclo().getNombre() : "";
	}

	/**
	 * @return the incorporacion
	 */
	public String getIncorporacion(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getIncorporacion() != null ? 
					((EntrevistaReIncorporacion)entrevista).getIncorporacion().getValor()
					: "";
		}
		return valor;
	}

	/**
	 * @return the motivoNoIncorporacion
	 */
	public String getMotivoNoIncorporacion(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getMotivoNoIncorporacion() != null ?
					((EntrevistaReIncorporacion)entrevista).getMotivoNoIncorporacion().getValor()
					: "";
		}
		return valor;
	}

	/**
	 * @return the observacionesNoIncorporacion
	 */
	public String getObservacionesNoIncorporacion(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getObservacionesNoIncorporacion();
		}
		return valor;
	}

	/**
	 * @return the situacionEscolarDiciembre
	 */
	public String getSituacionEscolarDiciembre(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getSituacionEscolarDiciembre() != null ?
					((EntrevistaRenovacion)entrevista).getSituacionEscolarDiciembre().getValor()
					: "";
		}
		return valor;
	}

	/**
	 * @return the situacionRenovacionDiciembre
	 */
	public String getSituacionRenovacionDiciembre(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getEvaluacionRenovacionFinal() != null ?
					((EntrevistaRenovacion)entrevista).getEvaluacionRenovacionFinal().getValor() :
						"";
		}
		return valor;
	}

	/**
	 * @return the situacionEscolar
	 */
	public String getSituacionEscolar(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getSituacionEscolarMergeada() != null ?
							((EntrevistaRenovacion)entrevista).getSituacionEscolarMergeada().getValor():
								"";
		}
		return valor;
	}

	/**
	 * @return the situacionRenovacion
	 */
	public String getSituacionRenovacion(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getEvaluacionRenovacionMergeada() != null ? 
					((EntrevistaRenovacion)entrevista).getEvaluacionRenovacionMergeada().getValor() :
						"";
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getEvaluacionRenovacionFinal() != null ?
					((EntrevistaFinal)entrevista).getEvaluacionRenovacionFinal().getValor() :
						"";
		}
		return valor;
	}

	/**
	 * @return the motivoPendiente
	 */
	public String getMotivoPendiente(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getMotivoPendiente() != null ?
					 ((EntrevistaRenovacion)entrevista).getMotivoPendiente().getValor():
						 "";
		}
		return valor;
	}

	/**
	 * @return the otroMotivo
	 */
	public String getOtroMotivo(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getMotivoOtro();
		}
		return valor;
	}

	/**
	 * @return the motivoNoRenovacion
	 */
	public String getMotivoNoRenovacion(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getMotivoNoRenovacion() != null ?
					((EntrevistaRenovacion)entrevista).getMotivoNoRenovacion().getValor() :"";
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getMotivoNoRenovacion()!= null ?
					((EntrevistaFinal)entrevista).getMotivoNoRenovacion().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the realizoEntrevista
	 */
	public String getRealizoEntrevista(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = (((EntrevistaRenovacion)entrevista).isRealizoEntrevista()? SI : NO);
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = (((EntrevistaReIncorporacion)entrevista).isRealizoEntrevista()? SI : NO);
		}
		return valor;
	}

	/**
	 * @return the tipoContacto
	 */
	public String getTipoContacto(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getTipoContacto() != null ?
					((EntrevistaRenovacion)entrevista).getTipoContacto().getValor() :"";
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getTipoContacto() != null ?
					((EntrevistaReIncorporacion)entrevista).getTipoContacto().getValor()
					: "";
		}
		return valor;
	}

	/**
	 * @return the observacionesMateriasExamenes
	 */
	public String getObservacionesMateriasExamenes(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getObservacionMateriasExamenes();
		}
		return valor;
	}

	/**
	 * @return the escolaridadCompromisoAnterior
	 */
	public String getEscolaridadCompromisoAnterior(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getEscolaridadCompromisoAnterior();
		}
		return valor;
	}

	/**
	 * @return the sintesisRealizadoVacaciones
	 */
	public String getSintesisRealizadoVacaciones(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getRealizadoVacaciones();
		}
		return valor;
	}

	/**
	 * @return the propositoAnioComienza
	 */
	public String getPropositoAnioComienza(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getPropositoAnioComienza();
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getProposito();
		}
		return valor;
	}

	/**
	 * @return the periodoEntrevista
	 */
	public String getPeriodoEntrevista(EntrevistaIndividual entrevista) {
		return entrevista.getPeriodoDePago() != null ? entrevista.getPeriodoDePago().getNombre() : "";
	}

	/**
	 * @return the estadoAlumno
	 */
	public String getEstadoAlumno(EntrevistaIndividual entrevista) {
		return entrevista.getPerfilAlumno().getEstadoAlumno().getValor();
	}

	/**
	 * @return the fechaAltaBeca
	 */
	public String getFechaAltaBeca(EntrevistaIndividual entrevista) {
		return (entrevista.getFechaAltaBeca() != null ? Formateador.formatearFecha(entrevista.getFechaAltaBeca(), PATRON_FECHA) : "");
	}

	/**
	 * @return the fechaIncorporacionPBE
	 */
	public String getFechaIncorporacionPBE(EntrevistaIndividual entrevista) {
		return entrevista.getPerfilAlumno().getFechaPBE() != null ? 
				Formateador.formatearFecha(entrevista.getPerfilAlumno().getFechaPBE(), PATRON_FECHA) :
					"";
	}
	
	/**
	 * @return the fechaEntrevista
	 */
	public String getFechaEntrevista(EntrevistaIndividual entrevista) {
		if(entrevista.getFechaEntrevista()!= null){
			return Formateador.formatearFecha(entrevista.getFechaEntrevista(), PATRON_FECHA) ;
		}
		return "";
	}

	/**
	 * @return the fechaCargaEntrevista
	 */
	public String getFechaCargaEntrevista(EntrevistaIndividual entrevista) {
		return Formateador.formatearFecha(entrevista.getFechaCarga() , PATRON_FECHA) ;
	}

	/**
	 * @return the entrevistaReprogramada
	 */
	public String getEntrevistaReprogramada(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = entrevista.getEntrevistaReprogramada() != null ? 
					entrevista.getEntrevistaReprogramada().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the lugarEntrevista
	 */
	public String getLugarEntrevista(EntrevistaIndividual entrevista) {
		return entrevista.getLugarEntrevista() != null ? entrevista.getLugarEntrevista().getNombre() : "";
	}

	/**
	 * @return the participoBecado
	 */
	public String getParticipoBecado(EntrevistaIndividual entrevista) {
		return entrevista.isParticipoBecado()? SI : NO;
	}

	/**
	 * @return the motivoAusenciaBecado
	 */
	public String getMotivoAusenciaBecado(EntrevistaIndividual entrevista) {
		return entrevista.getMotivoAusencia() != null ? entrevista.getMotivoAusencia().getValor() : "";
	}

	/**
	 * @return the otroMotivoAusenciaBecado
	 */
	public String getOtroMotivoAusenciaBecado(EntrevistaIndividual entrevista) {
		return entrevista.getOtroMotivoAusencia();
	}

	/**
	 * @return the participoRA
	 */
	public String getParticipoRA(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getEntrevistaGrupal() == null){
			valor = entrevista.isParticipoRA()? SI : NO;
		}
		return valor;
	}

	/**
	 * @return the motivoAusenciaRA
	 */
	public String getMotivoAusenciaRA(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getEntrevistaGrupal() == null){
			valor = entrevista.getMotivoAusenciaRA() != null? entrevista.getMotivoAusenciaRA().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the otroMotivoAusenciaRA
	 */
	public String getOtroMotivoAusenciaRA(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getEntrevistaGrupal() == null){
			valor = entrevista.getOtroMotivoAusenciaRA();
		}
		return valor;
	}
	
	/**
	 * @return the escuela
	 */
	public String getEscuela(EntrevistaIndividual entrevista) {
		return entrevista.getEscuelaAlumno().getNombre();
	}

	/**
	 * @return the modalidad
	 */
	public String getModalidad(EntrevistaIndividual entrevista) {
		return entrevista.getModalidad() != null ? entrevista.getModalidad().getValor() : "";
	}

	/**
	 * @return the anioEscolar
	 */
	public String getAnioEscolar(EntrevistaIndividual entrevista) {
		return entrevista.getAnioEscolar().getValor();
	}

	/**
	 * @return the materiasFechasDiciembre
	 */
	public String getMateriasFechasDiciembre(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getMateriasRendirDiciembre();
		}
		return valor;
	}

	/**
	 * @return the materiasFechasFebreroMarzo
	 */
	public String getMateriasFechasFebreroMarzo(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getMateriasRendirFebMarzo();
		}
		return valor;
	}

	/**
	 * @return the carpeta
	 */
	public String getCarpeta(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) 
				|| entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = entrevista.getCarpeta() != null ? entrevista.getCarpeta().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the cuadernoComunicados
	 */
	public String getCuadernoComunicados(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) || 
				entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = entrevista.getCuadernoComunicados() != null ? entrevista.getCuadernoComunicados().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the boletin
	 */
	public String getBoletin(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = ((EntrevistaIndividual)entrevista).getBoletin() != null ? ((EntrevistaIndividual)entrevista).getBoletin().getValor(): "";
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getBoletin() != null ? ((EntrevistaFinal)entrevista).getBoletin().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the informeProfesores
	 */
	public String getInformeProfesores(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) || 
				entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = entrevista.getInformeProfesores() != null ? entrevista.getInformeProfesores().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the materia
	 */
	public String getMateria(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = ((EntrevistaIndividual)entrevista).getMateriaBoletin() != null ? ((EntrevistaIndividual)entrevista).getMateriaBoletin().getNombre() : "";
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getMateriaBoletin() != null ? ((EntrevistaFinal)entrevista).getMateriaBoletin().getNombre() : "";
		}
		return valor;
	}

	/**
	 * @return the certificadoAsistencia
	 */
	public String getCertificadoAsistencia(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = entrevista.getCertificadoAsistencia() != null? entrevista.getCertificadoAsistencia().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the cantidadInasistencias
	 */
	public String getCantidadInasistencias(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) || entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = entrevista.getCantidadInasistencias()!= null ? Float.toString(entrevista.getCantidadInasistencias()) : "";
		}
		return valor;
	}

	/**
	 * @return the motivoInasistencias
	 */
	public String getMotivoInasistencias(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = ((EntrevistaIndividual)entrevista).getMotivoInasistencia();
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getMotivoInasistencia();
		}
		return valor;
	}

	/**
	 * @return the certificadoAlumnoRegular
	 */
	public String getCertificadoAlumnoRegular(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION) || 
				entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = entrevista.getCertificadoAlumnoRegular() != null ? entrevista.getCertificadoAlumnoRegular().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the fotocopiaBoletin
	 */
	public String getFotocopiaBoletin(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION) || 
				entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = entrevista.getFotocipiaBoletin() != null ? entrevista.getFotocipiaBoletin().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the firmaCompromiso
	 */
	public String getFirmaCompromiso(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION) ||
				entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = entrevista.getFirmaActaCompromiso() != null ? entrevista.getFirmaActaCompromiso().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the firmaAutorizacionCierreCaja
	 */
	public String getFirmaAutorizacionCierreCaja(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION) || 
				entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = entrevista.getFirmaAutorizacionCierreCaja() != null ? entrevista.getFirmaAutorizacionCierreCaja().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the firmaAutorizacionImagen
	 */
	public String getFirmaAutorizacionImagen(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION) || 
				entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = entrevista.getFirmaAutorizacionImagen() != null ? entrevista.getFirmaAutorizacionImagen().getValor() :"";
		}
		return valor;
	}

	/**
	 * @return the materialCompleto
	 */
	public String getMaterialCompleto(EntrevistaIndividual entrevista) {
		return entrevista.isMaterialCompleto()? SI : NO;
	}

	/**
	 * @return the rendicionGastos
	 */
	public String getRendicionGastos(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = ((EntrevistaIndividual)entrevista).isRendicionGastos() ? SI : NO;
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).isRendicionGastos() ? SI : NO;
		}
		return valor;
	}

	/**
	 * @return the detalleGastos
	 */
	public String getDetalleGastos(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){ 
			valor = new StringBuffer();
			if(!entrevista.getDetalleGastos().isEmpty()){
				for (DetalleGastos detalle : entrevista.getDetalleGastos()) {
					valor.append( detalle.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}
			
		}
		return valor.toString();
	}

	/**
	 * @return the autoevaluacionBecado
	 */
	public String getAutoevaluacionBecado(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).isRendicionGastos() ? SI : NO;
		}
		return valor;
	}

	/**
	 * @return the evaluacionPropositoAnual
	 */
	public String getEvaluacionPropositoAnual(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getEvaluacionProposito();
		}
		return valor;
	}

	/**
	 * @return the resultadoAnioEscolar
	 */
	public String getResultadoAnioEscolar(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
//			valor = ((EntrevistaFinal)entrevista).getResultadoAnioEscolar() != null ?((EntrevistaFinal)entrevista).getResultadoAnioEscolar().getValor() : "";
			valor = ((EntrevistaFinal)entrevista).getSituacionEscolarMergeada() != null ?((EntrevistaFinal)entrevista).getSituacionEscolarMergeada().getValor() : "";
		}
		return valor;
	}
	
	/**
	 * @return the cambioEscuelaProximoAnio
	 */
	public String getCambioEscuelaProximoAnio(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getCambioEscuelaProxAnio();
		}
		return valor;
	}

	/**
	 * @return the modalidadCursadaProximoAnio
	 */
	public String getModalidadCursadaProximoAnio(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getModCursaProxAnio();
		}
		return valor;
	}

	/**
	 * @return the proyeccionAnioProximoFinalizacionPBE
	 */
	public String getProyeccionAnioProximoFinalizacionPBE(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL) 
				&& ((EntrevistaFinal)entrevista).getProyAnioProximo() != null){
			valor = ((EntrevistaFinal)entrevista).getProyAnioProximo().getValor();
		}
		return valor;
	}

	/**
	 * @return the fechaEntrevistaFebreroMarzo
	 */
	public String getFechaEntrevistaFebreroMarzo(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			EntrevistaFinal entrevFinal = (EntrevistaFinal)entrevista;
			valor = entrevFinal.getFechaEntrevFebMarzo() != null ?
					Formateador.formatearFecha( ((EntrevistaFinal)entrevista).getFechaEntrevFebMarzo(), PATRON_FECHA)
					: "";
		}
		return valor;
	}

	/**
	 * @return the horaEntrevistaFebreroMarzo
	 */
	public String getHoraEntrevistaFebreroMarzo(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getHoraProxEntrevista();
		}
		return valor;
	}

	/**
	 * @return the lugarEntrevistaFebreroMarzo
	 */
	public String getLugarEntrevistaFebreroMarzo(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getLugarProximaEntrevista() != null ? ((EntrevistaFinal)entrevista).getLugarProximaEntrevista().getNombre()
					: "";
		}
		return valor;
	}

	/**
	 * @return the evolucionMesAnterior
	 */
	public String getEvolucionMesAnterior(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = ((EntrevistaIndividual)entrevista).getEvolucionMesAnterior();
		}
		return valor;
	}

	/**
	 * @return the logros
	 */
	public String getLogros(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = ((EntrevistaIndividual)entrevista).getLogros();
		}
		return valor;
	}

	/**
	 * @return the dificultades
	 */
	public String getDificultades(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = ((EntrevistaIndividual)entrevista).getDificultades();
		}
		return valor;
	}

	/**
	 * @return the proposito
	 */
	public String getProposito(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = ((EntrevistaIndividual)entrevista).getProposito();
		}
		return valor;
	}

	/**
	 * @return the contenidosAbordados
	 */
	public String getContenidosAbordados(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = new StringBuffer();
			if(!entrevista.getContenidosAbordados().isEmpty()){
				for (ContenidosAbordados contenido : entrevista.getContenidosAbordados()) {
					valor.append( contenido.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}	
		}
		return valor.toString();
	}

	/**
	 * @return the compromisoRAEscolaridad
	 */
	public String getCompromisoRAEscolaridad(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = entrevista.getCompromisoRA() != null ? entrevista.getCompromisoRA().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the recomendacionEstrategiaComplementaria
	 */
	public String getRecomendacionEstrategiaComplementaria(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) ){
			valor = new StringBuffer();
			if(!entrevista.getEstrategiaComp().isEmpty()){
				for (EstrategiaComplementaria estrategia : entrevista.getEstrategiaComp()) {
					valor.append( estrategia.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}
			
		}
		return valor.toString();
	}

	/**
	 * @return the situacionCrisis
	 */
	public String getSituacionCrisis(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = new StringBuffer();
			if(!entrevista.getSituacionCrisis().isEmpty()){
				for (SituacionCrisis crisis : entrevista.getSituacionCrisis()) {
					valor.append( crisis.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}
		}
		return valor.toString();
	}

	/**
	 * @return the expectativasRA
	 */
	public String getExpectativasRA(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getExpectativasRA();
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getExpectativasRA();
		}
		return valor;
	}

	/**
	 * @return the destinoDineroBeca
	 */
	public String getDestinoDineroBeca(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION) 
				|| entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = new StringBuffer();
			if(!entrevista.getDestinoDinero().isEmpty()){
				for (DetalleGastos destino : entrevista.getDestinoDinero()) {
					valor.append( destino.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}	
		}
		return valor.toString();
	}

	/**
	 * @return the fechaProximaEntrevista
	 */
	public String getFechaProximaEntrevista(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(!entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL) ){
			valor = entrevista.getProximaEntrevista()!= null? Formateador.formatearFecha( entrevista.getProximaEntrevista(), PATRON_FECHA)
					: "";
		}
		return valor;
	}

	/**
	 * @return the horaProximaEntrevista
	 */
	public String getHoraProximaEntrevista(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(!entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL) ){
			valor = entrevista.getHoraProxEntrevista();
		}
		return valor;
	}

	/**
	 * @return the lugarProximaEntrevista
	 */
	public String getLugarProximaEntrevista(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(!entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL) ){
			valor = entrevista.getLugarProximaEntrevista() != null ? entrevista.getLugarProximaEntrevista().getNombre()
					: "";
		}
		return valor;
	}

	/**
	 * @return the entregaMaterialCimientos
	 */
	public String getEntregaMaterialCimientos(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).isEntregaMaterial() ? SI : NO;
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).isEntregaMaterial() ? SI : NO;
		}
		return valor;
	}

	/**
	 * @return the evaluacionCobroBeca
	 */
	public String getEvaluacionCobroBeca(EntrevistaIndividual entrevista) {
		return entrevista.getEvaluacionCobroBeca() != null ? entrevista.getEvaluacionCobroBeca().getValor() :"";
	}

	/**
	 * @return the estadoPago
	 */
	public String getEstadoPago(EntrevistaIndividual entrevista) {
		return entrevista.getEvaluacionCobroBeca() != null ? entrevista.getEvaluacionCobroBeca().getValor() :"";

	}

	/**
	 * @return the motivoSuspension
	 */
	public String getMotivoSuspension(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(!entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)
			|| !entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){			
				valor = entrevista.getMotivoSuspension() != null ?  entrevista.getMotivoSuspension().getValor() : "";
		}
		else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
				EntrevistaRenovacion er = (EntrevistaRenovacion)entrevista;
				if(er.getEvaluacionRenovacionMergeada() != null)
					if (er.getEvaluacionRenovacionMergeada().equals(EvaluacionRenovacionMergeada.RENUEVA)){
						valor = entrevista.getMotivoSuspension() != null ?  entrevista.getMotivoSuspension().getValor() : "";
					}
				else{
					valor = "";
				}
		}
		return valor;
	}

	/**
	 * @return the motivoCesacion
	 */
	public String getMotivoCesacion(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = entrevista.getMotivoCesacion() != null ? entrevista.getMotivoCesacion().getValor() : "";
		}
		return valor;
	}

	/**
	 * @return the observacionesGrales
	 */
	public String getObservacionesGrales(EntrevistaIndividual entrevista) {
		return entrevista.getObservacionesGenerales();
	}

	/**
	 * @return the pagaEntrevista
	 */
	public String getPagaEntrevista(EntrevistaIndividual entrevista) {
		return entrevista.isPagaEntrevista() ? SI : NO;
	}

	/**
	 * @return the previas
	 */
	public String getPrevias(EntrevistaIndividual entrevista) {
		return entrevista.getExportacionEspecial().isPrevias() ? SI : NO;
	}

	/**
	 * @return the previasCuales
	 */
	public String getPreviasCuales(EntrevistaIndividual entrevista) {
		return entrevista.getExportacionEspecial().getNombresPrevias();
	}

	/**
	 * @return the padrino
	 */
	public String getPadrino(EntrevistaIndividual entrevista) {
		return entrevista.getExportacionEspecial().getPadrino();
	}

	/**
	 * @return the tipoPadrino
	 */
	public String getTipoPadrino(EntrevistaIndividual entrevista) {
		return entrevista.getExportacionEspecial().getTipoPadrino();
	}

	/**
	 * @return the quienCargoEntrevista
	 */
	public String getQuienCargoEntrevista(EntrevistaIndividual entrevista) {
		return entrevista.getEa().getDatosPersonales().getApellido() + ", " + entrevista.getEa().getDatosPersonales().getNombre();
	}
	
	/**
	 * @return the motivoIncorporacionPendient
	 */
	public String getMotivoIncorporacionPendiente(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getMotivoPendiente() != null ?
					((EntrevistaReIncorporacion)entrevista).getMotivoPendiente().getValor()
					: "";
		}
		return valor;
	}
	
	/**
	 * @param entrevista
	 * @return
	 */
	private String getOtroMotivoPendiente(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getMotivoOtroPendiente();
		}
		return valor;
	}
	
	/**
	 * @return the observacionesGrales
	 */
	public String getComentariosRevision(EntrevistaIndividual entrevista) {
		return entrevista.getComentariosRevision();
	}
	
	/**
	 * @return the propositoAnioComienzaList
	 */
	public String getPropositoAnioComienzaList(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){ 
			valor = new StringBuffer();
			EntrevistaRenovacion entrevistaRenovacion = (EntrevistaRenovacion)entrevista;
			if(!entrevistaRenovacion.getPropositoAnioComienzaList().isEmpty()){
				for (PropositoAnioComienza proposito : entrevistaRenovacion.getPropositoAnioComienzaList()) {
					valor.append( proposito.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}
			
		}
		return valor.toString();
	}
	
	/**
	 * @return the propositoAnioComienzaList
	 */
	public String getGustosTiempoLibre(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){ 
			valor = new StringBuffer();
			EntrevistaRenovacion entrevistaRenovacion = (EntrevistaRenovacion)entrevista;
			if(!entrevistaRenovacion.getGustosTiempoLibre().isEmpty()){
				for (GustosTiempoLibre gustos : entrevistaRenovacion.getGustosTiempoLibre()) {
					valor.append( gustos.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}
			
		}
		return valor.toString();
	}
	
	/**
	 * @return the idEntrevista
	 */
	private static Long getIdEntrevista(EntrevistaIndividual entrevista) {
		return entrevista.getId();
	}
	
	/**
	 * @return the idTipoEntrevista
	 */
	private static Long getIdTipoEntrevista(EntrevistaIndividual entrevista) {
		return entrevista.getTipoEntrevista().getId().longValue();
	}
}
