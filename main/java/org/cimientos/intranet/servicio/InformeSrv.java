package org.cimientos.intranet.servicio;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.cimientos.intranet.dao.BoletinDao;
import org.cimientos.intranet.dao.InformeDao;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.FichaFamiliar;
import org.cimientos.intranet.modelo.Materia;
import org.cimientos.intranet.modelo.NotaMateria;
import org.cimientos.intranet.modelo.Trimestre;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.FichaPresentacion;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeCesacion;
import org.cimientos.intranet.modelo.informe.InformeIS1;
import org.cimientos.intranet.modelo.informe.InformeIS2;
import org.cimientos.intranet.modelo.informe.InformeIS3;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.seleccion.BoletinSeleccion;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.web.controller.Conexion;
import org.cimientos.intranet.web.controller.EnvioInformeDTO;
import org.displaytag.properties.SortOrderEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.lang.StringUtils;

import com.cimientos.intranet.dto.FichaFamiliarDTO;
import com.cimientos.intranet.dto.MateriaDTO;
import com.cimientos.intranet.dto.ReporteInformeDTO;
import com.cimientos.intranet.dto.ReporteInformeFPDTO;
import com.cimientos.intranet.dto.ReporteInformeICDTO;
import com.cimientos.intranet.dto.ReporteInformeIS1DTO;
import com.cimientos.intranet.dto.ReporteInformeIS3DTO;
import com.cimientos.intranet.dto.ReporteInformeIS2DTO;
import com.cimientos.intranet.enumerativos.AnioEscolar;
import com.cimientos.intranet.enumerativos.CalificacionMateria;
import com.cimientos.intranet.enumerativos.Convive;
import com.cimientos.intranet.enumerativos.EspacioApoyo;

import org.cimientos.intranet.servicio.MateriaSrv;



@Service
@Transactional
public class InformeSrv {
	
	@Autowired
	private InformeDao informeDao;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;
	
	@Autowired
	private BoletinDao boletinDao;
	
	@Autowired
	private MateriaSrv srvMateria;
	
	private static final String PATRON_FECHA = "dd/MM/yyyy";
	

	public int obtenerCantInformesPadrinosFiltradasAExportar(Boolean esIndividual, Long padrinoId, Long zonaId, Long estadoInformeId, String tipoInforme, CicloPrograma ciclo) {
		Integer count = informeDao.obtenerCantInformesPadrinosFiltradosAExportar(esIndividual, padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo);
		return count;
	}
	/**
	 * @return
	 */
	public List<Informe> obtenerInformesPendientes() {
		return informeDao.obtenerInformesPendientes(srvCiclo.obtenerCicloActual());
	}
	
	public List<EnvioInformeDTO> obtenerInformesAEnviarAPadrinosFiltradosIndividuales(Long padrinoId, Long zonaId, Long estadoInformeId, String tipoInforme,
			CicloPrograma ciclo, int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		return informeDao.obtenerInformesAEnviarAPadrinosFiltradosIndividuales(padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo, firstResult,maxResults,sortDirection,sortCriterion);
	}
	
	public List<EnvioInformeDTO> obtenerInformesAEnviarAPadrinosFiltradosCorporativos(Long padrinoId, Long zonaId, Long estadoInformeId, String tipoInforme,
			CicloPrograma ciclo, int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		return informeDao.obtenerInformesAEnviarAPadrinosFiltradosCorporativos(padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo, firstResult,maxResults,sortDirection,sortCriterion);
	}
	
	public List<Informe> obtenerInformesAAprobar() {
		return informeDao.obtenerInformesAAprobar(srvCiclo.obtenerCicloActual());
	}
	
	public List<Informe> obtenerInformesConstruccion() {
		return informeDao.obtenerInformesConstruccion(srvCiclo.obtenerCicloActual());
	}
	
	public List<Informe> obtenerInformesARevisar(PerfilRR rr) {
		return informeDao.obtenerInformesARevisar(rr,srvCiclo.obtenerCicloActual());
	}
	
	public List<Informe> obtenerInformesASupervisarYRevisar(PerfilRR rr) {
		return informeDao.obtenerInformesASupervisarYRevisar(rr,srvCiclo.obtenerCicloActual());
	}
	
	public Informe obtenerInforme(Long idInforme){
		return informeDao.obtener(idInforme);
	}
	
	public List<Informe> obtenerGrupo(List<Long> ids){
		return informeDao.obtenerGrupo("id", ids);
	}
	

	public void guardarInforme(Informe informe){
		informeDao.guardar(informe);
		informeDao.flush();
	}
	

	public void eliminarInforme(Informe informe){
		informeDao.eliminar(informe);
	}

	public List<Informe> obtenerTodos() {
		return informeDao.obtenerTodos();
	}

	public List<Informe> obtenerTodosInformesPorEA(Long idEA, CicloPrograma ciclo, String nombre) {
		return informeDao.obtenerTodosInformesPorEA(idEA, ciclo, nombre);
	}

	public List<Informe> obtenerInformesConstruccionPorEA(PerfilEA perfilEA) {
		return informeDao.obtenerInformesConstruccionPorEA(perfilEA,srvCiclo.obtenerCicloActual());
	}
	
	public List<Informe> obtenerInformesAEnviar(Beca beca, EstadoInforme estado, String nombre){
		return informeDao.obtenerInformesAEnviar(beca, estado, nombre);
	}
	
	public List<ReporteInformeDTO> obtenerInformesAReportar(List<Long> ciclo,  Integer tipoId,
			List<String> tipoInforme, List<Integer> idEstado, List<Number> padrinoId, List<Number> zonaId, String nombreAlumno,
			Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion, String eae){
		
		List<Informe> informes = informeDao.obtenerInformesAReportar(ciclo, tipoId, tipoInforme, idEstado, padrinoId, zonaId, nombreAlumno,
																idEA, idRR, anioEscolar, fechaDesde, fechaHasta,
																firstResult, maxResults, sortDirection, sortCriterion,eae);	
		return this.cargaReporteInformeDTO(informes);
		
	}
	
	public int obtenerCantidadInformesAReportar(List<Long> ciclo, 
			Integer tipoId, List<String> tipoInforme, List<Integer> idEstado, List<Number> padrinoId, List<Number> zonaId, 
			String nombreAlumno, Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta, String eae ){
		
		return informeDao.obtenerCantidadInformesAReportar(tipoId, tipoInforme,idEstado, padrinoId, zonaId, nombreAlumno, ciclo, 
															idEA, idRR, anioEscolar, fechaDesde, fechaHasta,eae);
	}
	
	public List<ReporteInformeDTO> cargaReporteInformeDTO(List<Informe> informes){
		List<ReporteInformeDTO> informesDTO = new ArrayList<ReporteInformeDTO>();
		ReporteInformeDTO reporteDTO = null;		
		for (Informe informe : informes){
			reporteDTO = new ReporteInformeDTO();
			reporteDTO.setId(informe.getId());
			reporteDTO.setIdAlumno(informe.getBecado().getId());
			reporteDTO.setApellidoAlumno(informe.getBecado().getDatosPersonales().getApellido());
			reporteDTO.setNombreAlumno(informe.getBecado().getDatosPersonales().getNombre());
			reporteDTO.setTipoInforme(informe.getNombre());
			reporteDTO.setTipoPadrino(informe.getPadrino().getTipo().getValor());
			reporteDTO.setAnioEscolar(informe.getBecado().getAnioEscolar().getValor());			
			reporteDTO.setEscuelaNombre(informe.getBecado().getEscuela().getNombre());
			reporteDTO.setIdEscuelaAlumno(informe.getBecado().getEscuela().getId());			
			if(informe.getPadrino().getDatosPersonales() != null){
				reporteDTO.setPadrino(informe.getPadrino().getDatosPersonales().getApellido() + ", " + informe.getPadrino().getDatosPersonales().getNombre());
			}
			else
				reporteDTO.setPadrino(informe.getPadrino().getEmpresa().getDenominacion());
			String zona = "";
			String eae="";
			try {
				zona = informe.getBecado().getEscuela().getLocalidad().getZona().getNombre();
				eae = informe.getBecado().getEscuela().getLocalidad().getZona().getEae();
				
			} catch (Exception e) {
				////System.out.println("Alumno " + informe.getBecado().getDatosPersonales().getApellidoNombre());
			}		
			
			reporteDTO.setZona(zona);
			reporteDTO.setEae(eae);
			if(informe.getCorrectora() != null)
				reporteDTO.setCorrectora(informe.getCorrectora());
			reporteDTO.setCicloActual(informe.getCicloActual().getNombre());
			reporteDTO.setEstadoInforme(informe.getEstado().getValor());
			if(informe.getFechaAlta() != null)
				reporteDTO.setFechaCreacion(Formateador.formatearFecha(informe.getFechaAlta(), PATRON_FECHA));
			if(informe.getFechaUltimaModificacion() != null)
				reporteDTO.setFechaUltimaModificacion(Formateador.formatearFecha(informe.getFechaUltimaModificacion(), PATRON_FECHA));
			if(informe.getFechaEnvio() != null)
				reporteDTO.setFechaEnvio(Formateador.formatearFecha(informe.getFechaEnvio(), PATRON_FECHA));
			if(informe.getFechaCambioUltimoEstado() != null)
				reporteDTO.setFechaUltimoCambioEstado(Formateador.formatearFecha(informe.getFechaCambioUltimoEstado(), PATRON_FECHA));
			if(informe.getEaPerfil() != null)
				reporteDTO.setEa(informe.getEaPerfil().getDatosPersonales().getApellidoNombre());
			if(informe.getRrPerfil() != null)
				reporteDTO.setRr(informe.getRrPerfil().getDatosPersonales().getApellidoNombre());
			reporteDTO.setCicloInforme(informe.getCicloActual().getId());
			informesDTO.add(reporteDTO);
		}
		return informesDTO;
	}
	
	public Boolean verSiAlumnoTieneInformePorTipo(Long idAlumno, String tipoInforme){
		return informeDao.verSiAlumnoTieneInformePorTipo(idAlumno, tipoInforme);
	}
	/**
	 * @param eaAnterior
	 * @param idsAlumnosSeleccionados
	 * @return
	 */
	public List<Informe> obtenerInformesInconclusosAlumnosEa(
			PerfilEA eaAnterior, List<Long> idsAlumnos) {
		return informeDao.obtenerInformesInconclusosAlumnosEa(eaAnterior, idsAlumnos);
	}
	/**
	 * @param rrAnterior
	 * @param easIds
	 * @return
	 */
	public List<Informe> obtenerInformesInconclusosEasRR(PerfilRR rrAnterior,List<Long> easIds) {
		return informeDao.obtenerInformesInconclusosEasRR(rrAnterior, easIds);
	}
	
	public Integer obtenerCantidadInformesAAprobar(String correctora, Integer tipoId, String tipoInforme,
			Long rrId,Long eaId,String nombreAlumno,Long padrinoId,Long zonaId, CicloPrograma ciclo){
		return informeDao.obtenerCantidadInformesAAprobar(correctora, tipoId, tipoInforme, rrId, eaId, nombreAlumno, padrinoId, zonaId, ciclo);
	}
	
	public List<ReporteInformeDTO> obtenerInformesAAprobar(String correctora,  Integer tipoId, String tipoInforme, Long eaId, Long rrId,String nombreAlumno,
			 Long padrinoId, Long zonaId, int firstResult, int maxResults,SortOrderEnum sortDirection, 
			 String sortCriterion, CicloPrograma ciclo){
		
		List<Informe> informes = informeDao.obtenerInformesAAprobar(correctora, tipoId, tipoInforme, eaId, rrId, nombreAlumno, padrinoId, zonaId, firstResult, maxResults, sortDirection, sortCriterion, ciclo);
		return this.cargaReporteInformeDTO(informes);
		
	}
	
	public Integer obtenerCantidadInformesActualizar(String tipoInforme, String nombreAlumno, 
			PerfilEA perfilEA, CicloPrograma ciclo){
		return informeDao.obtenerCantidadInformesActualizar(tipoInforme, nombreAlumno, perfilEA, ciclo);
	}
	
	public List<ReporteInformeDTO> obtenerInformesActualizar(String tipoInforme, String nombreAlumno, PerfilEA perfilEA,
								int firstResult, int maxResults,SortOrderEnum sortDirection, 
								String sortCriterion, CicloPrograma ciclo){
		
		List<Informe> informes = informeDao.obtenerInformesActualizar(tipoInforme, nombreAlumno, perfilEA, firstResult, maxResults, sortDirection, sortCriterion, ciclo);
		return this.cargaReporteInformeDTO(informes);
		
	}
	
	public Integer obtenerCantidadInformesASupervisar(Integer tipoId, String tipoInforme, PerfilRR rr,
			String nombreAlumno,Long padrinoId, Long zonaId, CicloPrograma ciclo){
		return informeDao.obtenerCantidadInformesASupervisar(tipoId, tipoInforme, rr, nombreAlumno, padrinoId, zonaId,ciclo);
	}
	
	public List<ReporteInformeDTO> obtenerInformesASupervisar(Integer tipoId, String tipoInforme, PerfilRR rr,String nombreAlumno,
			 Long padrinoId, Long zonaId, int firstResult, int maxResults,SortOrderEnum sortDirection,
			 String sortCriterion, CicloPrograma ciclo){
		
		List<Informe> informes = informeDao.obtenerInformesASupervisar(tipoId, tipoInforme, rr, nombreAlumno, padrinoId, zonaId, firstResult, maxResults, sortDirection, sortCriterion,ciclo);
		return this.cargaReporteInformeDTO(informes);		
	}
	
	/**
	 * @param alumno, ciclo
	 * @return boletin
	 */
	public Boletin getBoletinCicloInforme(PerfilAlumno alumno, CicloPrograma ciclo) {
		return boletinDao.obtenerBoletinCicloInforme(alumno, ciclo);
	}
	
	public List<ReporteInformeFPDTO> obtenerInformesFPAReportar(List<Long> ciclo,  Integer tipoId,
			List<String> tipoInforme, List<Integer> idEstado, List<Number> padrinoId, List<Number> zonaId, String nombreAlumno,
			Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion, String eae){
		
		List<Informe> informes = informeDao.obtenerInformesAReportar(ciclo, tipoId, tipoInforme, idEstado, padrinoId, zonaId, nombreAlumno,
																idEA, idRR, anioEscolar, fechaDesde, fechaHasta,
																firstResult, maxResults, sortDirection, sortCriterion, eae);	
		return this.cargaInformeFPDTO(informes);
		
	}	
	
	public List<ReporteInformeFPDTO> cargaInformeFPDTO(List<Informe> informes){
		List<ReporteInformeFPDTO> informesDTO = new ArrayList<ReporteInformeFPDTO>();
		ReporteInformeFPDTO reporteDTO = null;
		for (Informe informe : informes){
			reporteDTO = new ReporteInformeFPDTO();			
			reporteDTO.setId(informe.getId());			
			reporteDTO.setTipoInforme(informe.getNombre());			
			reporteDTO.setCicloActual(informe.getCicloActual().getNombre());			
			reporteDTO.setEstadoInforme(informe.getEstado().getValor());
			reporteDTO.setEae(informe.getBecado().getEae());
			if(informe.getFechaCambioUltimoEstado() != null)
				reporteDTO.setFechaUltimoCambioEstado(Formateador.formatearFecha(informe.getFechaCambioUltimoEstado(), PATRON_FECHA));
			if(informe.getFechaEnvio() != null)
				reporteDTO.setFechaEnvio(Formateador.formatearFecha(informe.getFechaEnvio(), PATRON_FECHA));
			reporteDTO.setTipoPadrino(informe.getPadrino().getTipo().getValor());			
			if(informe.getPadrino().getDatosPersonales() != null)
				reporteDTO.setPadrino(informe.getPadrino().getDatosPersonales().getApellido() + ", " + informe.getPadrino().getDatosPersonales().getNombre());
			else
				reporteDTO.setPadrino(informe.getPadrino().getEmpresa().getDenominacion());
			if(informe.getPadrino() != null){
				if(informe.getPadrino().getTipo().equals(TipoPadrino.CORPORATIVO)){
					reporteDTO.setContacto(informe.getPadrino().getEmpresa().getContacto1());
					reporteDTO.setMail(informe.getPadrino().getEmpresa().getMailContacto1());
				}
				else{
					reporteDTO.setContacto(informe.getPadrino().getDatosPersonales().getNombre());
					reporteDTO.setMail(informe.getPadrino().getDatosPersonales().getMail());
				}
			}
			if(informe.getPadrino().getNroCtesPlataformaContable() !=null){
				reporteDTO.setNroCtesPlataformaContable(informe.getPadrino().getNroCtesPlataformaContable());
			}else{
				reporteDTO.setNroCtesPlataformaContable((long) 0);
			}
			reporteDTO.setIdAlumno(informe.getBecado().getId());			
			reporteDTO.setApellidoAlumno(informe.getBecado().getDatosPersonales().getApellido());
			reporteDTO.setNombreAlumno(informe.getBecado().getDatosPersonales().getNombre());			
			reporteDTO.setDNI(informe.getBecado().getDatosPersonales().getDni().toString());			
			reporteDTO.setFechaNacimiento(Formateador.formatearFecha(informe.getBecado().getDatosPersonales().getFechaNacimiento(), PATRON_FECHA));
			reporteDTO.setLocalidad(informe.getBecado().getDatosPersonales().getLocalidad().getNombre());
			reporteDTO.setAnioEscolar(informe.getBecado().getAnioEscolar().getValor());		
			reporteDTO.setAnioAdicional(informe.getBecado().getAnioAdicional()?"Si" : "No");
			reporteDTO.setEscuelaNombre(informe.getBecado().getEscuela().getNombre());
			//reporteDTO.setEscuelaLocalidad(informe.getBecado().getEscuela().getLocalidad().getNombre());	
			reporteDTO.setEscuelaLocalidad(informe.getBecado().getEscuela().getZonaCimientos().getNombre());	
			reporteDTO.setEae(informe.getBecado().getEscuela().getZonaCimientos().getEae());
			// verificar si existe RA2
			if (informe.getBecado().getResponsable2() !=null){
				reporteDTO.setResponsable(informe.getBecado().getResponsable2().getApellido() + " " + informe.getBecado().getResponsable2().getNombre());
				if(informe.getBecado().getResponsable2().getIdVinculo() != null){
					reporteDTO.setVinculo(informe.getBecado().getResponsable2().getIdVinculo().getValor());
				}
			
			}
			else{
				reporteDTO.setResponsable(informe.getBecado().getResponsable1().getApellido() + " " + informe.getBecado().getResponsable1().getNombre());
				if(informe.getBecado().getResponsable1().getIdVinculo() != null){
					reporteDTO.setVinculo(informe.getBecado().getResponsable1().getIdVinculo().getValor());					
				}
			}						
			if(informe.getFechaPBE() != null)
				reporteDTO.setFechaPBE(Formateador.formatearFecha(informe.getFechaPBE(), PATRON_FECHA));			
			if(informe.getFechaReincorporacionPBE() != null)
				reporteDTO.setFechaReincorporacionPBE(Formateador.formatearFecha(informe.getFechaReincorporacionPBE(), PATRON_FECHA));			
			if(informe.getRrPerfil() != null)
				reporteDTO.setRr(informe.getRrPerfil().getDatosPersonales().getApellidoNombre());
			if(informe.getEaPerfil() != null)
				reporteDTO.setEa(informe.getEaPerfil().getDatosPersonales().getApellidoNombre());
			FichaPresentacion fp = (FichaPresentacion) informe;
			reporteDTO.setEdad(fp.getEdad().toString());
			
			reporteDTO.setMateriasInteres(fp.getMateriasInteres());
			
			reporteDTO.setVosMismo(fp.getVosMismo());
			reporteDTO.setCuandoTermine(fp.getCuandoTermine());
			reporteDTO.setSituacionEscolar(fp.getSituacionEscolar());
			reporteDTO.setIncorporacion(fp.getIncorporacion());
			reporteDTO.setObservacionesNoIncorporacion(fp.getObservacionesNoIncorporacion());
			reporteDTO.setPropositoAnual(fp.getPropositoAnual());
			//reporteDTO.setMatriculaTotal(fp.getMatriculaTotal());
			//reporteDTO.setOrientacion(fp.getOrientacion());
			//reporteDTO.setDescripcionEscuela(fp.getDescripcionEscuela());
			//reporteDTO.setAnioIncorporacion(fp.getAnioIncorporacion());
			
			
			this.setBoletinFP(fp, reporteDTO);
			this.setFichaFamiliar(fp, reporteDTO);
			informesDTO.add(reporteDTO);
		}
		return informesDTO;
	}	
	
	private void setBoletinFP(FichaPresentacion fp, ReporteInformeFPDTO reporteDTO){		
		if(fp.getIncluirBoletinCheck()){
			reporteDTO.setIncluirBoletin("Si");			
			if(fp.getBoletinSeleccions().size() != 0){
				List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
				for (BoletinSeleccion boletinMatriaSeleccion : fp.getBoletinSeleccions()){
					MateriaDTO materiaDTO = new MateriaDTO();					
					if(StringUtils.isNotBlank(boletinMatriaSeleccion.getMateria().getNombre()))
						materiaDTO.setNombre(boletinMatriaSeleccion.getMateria().getNombre());
					else
						materiaDTO.setNombre("-");
					
					if (boletinMatriaSeleccion.getNotaPrimTrim() != null)
						materiaDTO.setNotaPrimero(String.valueOf(boletinMatriaSeleccion.getNotaPrimTrim()));
					else
						materiaDTO.setNotaPrimero("-");
	
					if (boletinMatriaSeleccion.getNotaSegTrim() != null)
						materiaDTO.setNotaSegundo(String.valueOf(boletinMatriaSeleccion.getNotaSegTrim()));
					else
						materiaDTO.setNotaSegundo("-");
	
					if (boletinMatriaSeleccion.getNotaTerTrim() != null)
						materiaDTO.setNotaTercero(String.valueOf(boletinMatriaSeleccion.getNotaTerTrim()));
					else
						materiaDTO.setNotaTercero("-");
	
					if (boletinMatriaSeleccion.getNotaFinal() != null)
						materiaDTO.setNotaFin(String.valueOf(boletinMatriaSeleccion.getNotaFinal()));
					else
						materiaDTO.setNotaFin("-");
	
					if (boletinMatriaSeleccion.getNotaDiciembre() != null)
						materiaDTO.setNotaDic(String.valueOf(boletinMatriaSeleccion.getNotaDiciembre()));
					else
						materiaDTO.setNotaDic("-");
	
					if (boletinMatriaSeleccion.getNotaMarzo() != null)
						materiaDTO.setNotaMarzo(String.valueOf(boletinMatriaSeleccion.getNotaMarzo()));
					else
						materiaDTO.setNotaMarzo("-");
	
					reporteDTO.addMateria(materiaDTO);
					materias.add(materiaDTO);	
				}
				reporteDTO.setMaterias(materias);
			}
			else
				reporteDTO.setMaterias(null);
		}
		else{
			reporteDTO.setMaterias(null);
			reporteDTO.setIncluirBoletin("No");
		}	
	}
	
	private void setFichaFamiliar(FichaPresentacion fp, ReporteInformeFPDTO reporteDTO){
		if(fp.getConvivientes().size() != 0){
			reporteDTO.setCantidadConvivientes(String.valueOf(fp.getConvivientes().size()));
			List<FichaFamiliarDTO> fichas = new ArrayList<FichaFamiliarDTO>();
			for (FichaFamiliar fichaFamiliar : fp.getConvivientes()) {
				if(fichaFamiliar.getConvive()!= null)
					if(fichaFamiliar.getConvive().equals(Convive.SI)){
						FichaFamiliarDTO fichaDTO = new FichaFamiliarDTO();
						if(fichaFamiliar.getEdad() != null)
							fichaDTO.setEdad(String.valueOf(fichaFamiliar.getEdad()));
						else
							fichaDTO.setEdad("-");
						if(fichaFamiliar.getNombre() != null && fichaFamiliar.getApellido() != null)
							fichaDTO.setNombreApellido(fichaFamiliar.getNombre() + " " + fichaFamiliar.getApellido());
						else if(fichaFamiliar.getNombre() == null && fichaFamiliar.getApellido() != null)
								fichaDTO.setNombreApellido(fichaFamiliar.getApellido());
							else if(fichaFamiliar.getNombre() != null && fichaFamiliar.getApellido() == null)
									fichaDTO.setNombreApellido(fichaFamiliar.getNombre());
								else
									fichaDTO.setNombreApellido("");					
						if(fichaFamiliar.getNivelEducativo() != null)
							fichaDTO.setNivelEstudio(fichaFamiliar.getNivelEducativo().getValor());
						else
							fichaDTO.setNivelEstudio("-");
						if(fichaFamiliar.getVinculo() != null)
							fichaDTO.setVinculo(fichaFamiliar.getVinculo().getValor());
						else
							fichaDTO.setVinculo("-");
						if(StringUtils.isNotBlank(fichaFamiliar.getOcupacionLaboral()))
							fichaDTO.setOcupacion(fichaFamiliar.getOcupacionLaboral());
						else
							fichaDTO.setOcupacion("-");
						reporteDTO.addFicha(fichaDTO);
						fichas.add(fichaDTO);
					}
			}
			reporteDTO.setConvivientes(fichas);
		}
		else{
			reporteDTO.setConvivientes(null);	
			reporteDTO.setCantidadConvivientes("0");
		}
	}
	public List<ReporteInformeIS2DTO> obtenerInformesIS2AReportar(List<Long> ciclo,  Integer tipoId,
			List<String> tipoInforme, List<Integer> idEstado, List<Number> padrinoId, List<Number> zonaId, String nombreAlumno,
			Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion, String eae){
		
		List<Informe> informes = informeDao.obtenerInformesAReportar(ciclo, tipoId, tipoInforme, idEstado, padrinoId, zonaId, nombreAlumno,
																idEA, idRR, anioEscolar, fechaDesde, fechaHasta,
																firstResult, maxResults, sortDirection, sortCriterion, eae);	
		return this.cargaInformeIS2DTO(informes);
		
	}	
	
	public List<ReporteInformeIS2DTO> cargaInformeIS2DTO(List<Informe> informes){
		String materia="";
		String materiasCuestan="";
		long lDescMateria=0;	
		List<Materia> listaMaterias = new ArrayList<Materia>();
		listaMaterias = srvMateria.obtenerTodos();
		
		List<ReporteInformeIS2DTO> informesDTO = new ArrayList<ReporteInformeIS2DTO>();
		ReporteInformeIS2DTO reporteDTO = null;
		
		for (Informe informe : informes){
			
			reporteDTO = new ReporteInformeIS2DTO();			
			reporteDTO.setId(informe.getId());			
			reporteDTO.setTipoInforme(informe.getNombre());			
			reporteDTO.setCicloActual(informe.getCicloActual().getNombre());			
			reporteDTO.setEstadoInforme(informe.getEstado().getValor());			
			if(informe.getFechaCambioUltimoEstado() != null)
				reporteDTO.setFechaUltimoCambioEstado(Formateador.formatearFecha(informe.getFechaCambioUltimoEstado(), PATRON_FECHA));
			if(informe.getFechaEnvio() != null)
				reporteDTO.setFechaEnvio(Formateador.formatearFecha(informe.getFechaEnvio(), PATRON_FECHA));
			reporteDTO.setTipoPadrino(informe.getPadrino().getTipo().getValor());			
			if(informe.getPadrino().getDatosPersonales() != null)
				reporteDTO.setPadrino(informe.getPadrino().getDatosPersonales().getApellido() + ", " + informe.getPadrino().getDatosPersonales().getNombre());
			else
				reporteDTO.setPadrino(informe.getPadrino().getEmpresa().getDenominacion());
			if(informe.getPadrino() != null){
				if(informe.getPadrino().getTipo().equals(TipoPadrino.CORPORATIVO)){
					if(informe.getPadrino().getEmpresa().getContacto1() != null){
						reporteDTO.setContacto(informe.getPadrino().getEmpresa().getContacto1());
					}
					if(informe.getPadrino().getEmpresa().getMailContacto1() !=null){
						reporteDTO.setMail(informe.getPadrino().getEmpresa().getMailContacto1());
					}
					
				}
				else{
					reporteDTO.setContacto(informe.getPadrino().getDatosPersonales().getNombre());
					if(informe.getPadrino().getDatosPersonales().getMail() != null){
						reporteDTO.setMail(informe.getPadrino().getDatosPersonales().getMail());
					}
				}
			}
			if(informe.getPadrino().getNroCtesPlataformaContable() !=null){
				reporteDTO.setNroCtesPlataformaContable(informe.getPadrino().getNroCtesPlataformaContable());
			}else{
				reporteDTO.setNroCtesPlataformaContable((long) 0);
			}
			reporteDTO.setIdAlumno(informe.getBecado().getId());			
			reporteDTO.setApellidoAlumno(informe.getBecado().getDatosPersonales().getApellido());
			reporteDTO.setNombreAlumno(informe.getBecado().getDatosPersonales().getNombre());			
			reporteDTO.setDni(informe.getBecado().getDatosPersonales().getDni().toString());			
			reporteDTO.setFechaNacimiento(Formateador.formatearFecha(informe.getBecado().getDatosPersonales().getFechaNacimiento(), PATRON_FECHA));
			reporteDTO.setLocalidad(informe.getBecado().getDatosPersonales().getLocalidad().getNombre());
			
			reporteDTO.setAnioEscolar(informe.getBecado().getAnioEscolar().getValor());		
			reporteDTO.setAnioAdicional(informe.getBecado().getAnioAdicional()?"Si" : "No");
			reporteDTO.setEscuelaNombre(informe.getBecado().getEscuela().getNombre());
			reporteDTO.setEscuelaLocalidad(informe.getBecado().getEscuela().getZonaCimientos().getNombre());	
			reporteDTO.setEae(informe.getBecado().getEscuela().getZonaCimientos().getEae());
			// verificar si existe RA2
			if (informe.getBecado().getResponsable2() !=null){
				reporteDTO.setResponsable(informe.getBecado().getResponsable2().getApellido() + " " + informe.getBecado().getResponsable2().getNombre());
				if(informe.getBecado().getResponsable2().getIdVinculo() != null){
					reporteDTO.setVinculo(informe.getBecado().getResponsable2().getIdVinculo().getValor());
				}
			
			}
			else{
				reporteDTO.setResponsable(informe.getBecado().getResponsable1().getApellido() + " " + informe.getBecado().getResponsable1().getNombre());
				if(informe.getBecado().getResponsable1().getIdVinculo() != null){
					reporteDTO.setVinculo(informe.getBecado().getResponsable1().getIdVinculo().getValor());					
				}
			}				
			if(informe.getFechaPBE() != null)
				reporteDTO.setFechaPBE(Formateador.formatearFecha(informe.getFechaPBE(), PATRON_FECHA));
			if(informe.getFechaReincorporacionPBE() != null)
				reporteDTO.setFechaReincorporacionPBE(Formateador.formatearFecha(informe.getFechaReincorporacionPBE(), PATRON_FECHA));
			if(informe.getRrPerfil() != null)
				reporteDTO.setRr(informe.getRrPerfil().getDatosPersonales().getApellidoNombre());
			if(informe.getEaPerfil() != null){
				reporteDTO.setEa(informe.getEaPerfil().getDatosPersonales().getApellidoNombre());
			}			
			if(informe.getBecado().getEscuela().getModalidadTrabajoEscuela() != null){
				reporteDTO.setModalidadTrabajoEscuela(informe.getBecado().getEscuela().getModalidadTrabajoEscuela().getValor());
			}
			if(informe.getBecado().getEscuela().getMatricula() != null){
				reporteDTO.setMatriculaTotalEscuela(informe.getBecado().getEscuela().getMatricula().toString());
			}
			if(informe.getBecado().getEscuela().getComienzoPBE() != null){
				reporteDTO.setProgramaImplemntacion(informe.getBecado().getEscuela().getComienzoPBE().getNombre().toString());
			}
			if(informe.getBecado().getEscuela().getIndicadorRepitencia() != null){
				reporteDTO.setIndicadorRepitenciaEscuela(informe.getBecado().getEscuela().getIndicadorRepitencia().toString());
			}
			if(informe.getBecado().getEscuela().getIndicadorAbandono() != null){
				reporteDTO.setIndicadorAbandonoEscuela(informe.getBecado().getEscuela().getIndicadorAbandono().toString());
			}
			if(informe.getBecado().getEscuela().getPorcentajeInasistencia() != null){
				reporteDTO.setPorcentajeInasistenciaEscuela(informe.getBecado().getEscuela().getPorcentajeInasistencia().toString());
			}
			
			InformeIS2 is2 = (InformeIS2) informe;
			if(is2.getMensajePadrino() !=null){
				reporteDTO.setQueridoPadrino(is2.getMensajePadrino().toString());
			}			
			reporteDTO.setEdad(is2.getEdad().toString());
			if(is2.getActividadAcompanamiento() != null){
				reporteDTO.setAcompaniamientoTrabajamos(is2.getActividadAcompanamiento().toString());
			}			
			
			
			
			if(is2.getMateriasCuestan() != null){
				materia=is2.getMateriasCuestan().toString();
				// reporteDTO.setMateriasCuestan(is2.getMateriasCuestan().toString());
				String descMateria="";
				
				for(int i = 0; i<materia.length(); i++){
					if (!",".equals(materia.substring(i,i+1))) {
						
						descMateria=descMateria + materia.substring(i,i+1);
						
					}
					else
					{
						lDescMateria = Long.parseLong(descMateria);					
						if (materiasCuestan == ""){
							materiasCuestan=this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						else
						{
							materiasCuestan=materiasCuestan + ", " + this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						descMateria="";
					}
					if(i==((materia.length())-1)){
						lDescMateria = Long.parseLong(descMateria);					
						if (materiasCuestan == ""){
							materiasCuestan=this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						else
						{
							materiasCuestan=materiasCuestan + ", " + this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						descMateria="";
					}					
				}	
				reporteDTO.setMateriasCuestan(materiasCuestan);
				materia="";
				materiasCuestan="";				
			}

			if(is2.getMateriasInteres() != null){
				
				materia=is2.getMateriasInteres().toString();
				// reporteDTO.setMateriasCuestan(is2.getMateriasCuestan().toString());
				String descMateria="";
				
				for(int i = 0; i<materia.length(); i++){
					if (!",".equals(materia.substring(i,i+1))) {
						
						descMateria=descMateria + materia.substring(i,i+1);
						
					}
					else
					{
						lDescMateria = Long.parseLong(descMateria);					
						if (materiasCuestan == ""){
							materiasCuestan=this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						else
						{
							materiasCuestan=materiasCuestan + ", " + this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						descMateria="";
					}
					if(i==((materia.length())-1)){
						lDescMateria = Long.parseLong(descMateria);					
						if (materiasCuestan == ""){
							materiasCuestan=this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						else
						{
							materiasCuestan=materiasCuestan + ", " + this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						descMateria="";
					}					
				}	
				reporteDTO.setMateriasInteresan(materiasCuestan);
				materia="";
				materiasCuestan="";				
				
			}
			if(is2.getCantidadBecados() != null){
				reporteDTO.setBecadosCimientosEscuela(is2.getCantidadBecados());
			}
			if(is2.getMateriasDesaprobadas() != null){
				reporteDTO.setCantidadMateriasDesaprobadas(is2.getMateriasDesaprobadas().toString());
			}
			if(is2.getInasistencias() != null){
				reporteDTO.setCantidadInasistencia(is2.getInasistencias().toString());
			}
			
			if(is2.getActividadAcompanamiento()!=null){
				reporteDTO.setAcompaniamientoTrabajamos(is2.getActividadAcompanamiento().toString());
			}
			if(is2.getQtam()!=null){
				reporteDTO.setQtam(is2.getQtam().toString());
			}
			if(is2.getOsme()!=null){
				reporteDTO.setOsme(is2.getOsme().toString());
			}
			if(is2.getSarpepe()!=null){
				reporteDTO.setSarpepe(is2.getSarpepe().toString());
			}
			if(is2.getHsTrabajarA�o()!=null){
				reporteDTO.setHsTrabajarAnio(is2.getHsTrabajarA�o().toString());
			}
			
			if(is2.getPropositoAnual()!=null){
				reporteDTO.setPropositoAnual(is2.getPropositoAnual().toString());
			}
			if(is2.getIamp()!=null){
				reporteDTO.setIamp(is2.getIamp().toString());
			}
			
			
			//2022
			if(is2.getTarang()!=null){
				reporteDTO.setTarang(is2.getTarang().toString());
			}
			if(is2.getVtepa()!=null){
				reporteDTO.setVtepa(is2.getVtepa().toString());
			}
			if(is2.getVtepb()!=null){
				reporteDTO.setVtepb(is2.getVtepb().toString());
			}
			
			if(is2.getVtepc()!=null){
				reporteDTO.setVtepc(is2.getVtepc().toString());
			}
			if(is2.getVtepd()!=null){
				reporteDTO.setVtepd(is2.getVtepd().toString());
			}
			if(is2.getVtepe()!=null){
				reporteDTO.setVtepe(is2.getVtepe().toString());
			}
			if(is2.getVtepf()!=null){
				reporteDTO.setVtepf(is2.getVtepf().toString());
			}
			if(is2.getVtepg()!=null){
				reporteDTO.setVtepg(is2.getVtepg().toString());
			}
			if(is2.getVteph()!=null){
				reporteDTO.setVteph(is2.getVteph().toString());
			}
			if(is2.getVtepi()!=null){
				reporteDTO.setVtepi(is2.getVtepi().toString());
			}
			if(is2.getIatarni()!=null){
				reporteDTO.setIatarni(is2.getIatarni().toString());
			}
			if(is2.getMp()!=null){
				reporteDTO.setMp(is2.getMp().toString());
			}
			if(is2.getSus()!=null){
				reporteDTO.setSus(is2.getSus().toString());
			}
			if(is2.getIge()!=null){
				reporteDTO.setIge(is2.getIge().toString());
			}
			
			if(is2.getPaa()!=null){
				reporteDTO.setPaa(is2.getPaa());
			}
			
			if(is2.getBoletinActual()!=null){
				reporteDTO.setBoletinActual(is2.getBecado().getBoletin().getId());
			}
			
			
			informesDTO.add(reporteDTO);
		}
		
		return informesDTO;
	}	
	
	public List<ReporteInformeIS3DTO> obtenerInformesIS3AReportar(List<Long> ciclo,  Integer tipoId,
			List<String> tipoInforme, List<Integer> idEstado, List<Number> padrinoId, List<Number> zonaId, String nombreAlumno,
			Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion, String eae){
		
		List<Informe> informes = informeDao.obtenerInformesAReportar(ciclo, tipoId, tipoInforme, idEstado, padrinoId, zonaId, nombreAlumno,
																idEA, idRR, anioEscolar, fechaDesde, fechaHasta,
																firstResult, maxResults, sortDirection, sortCriterion,eae);	
		return this.cargaInformeIS3DTO(informes);
		
	}
	
	
	public List<ReporteInformeIS3DTO> cargaInformeIS3DTO(List<Informe> informes){
		String materia="";
		String materiasCuestan="";
		long lDescMateria=0;	
		List<Materia> listaMaterias = new ArrayList<Materia>();
		listaMaterias = srvMateria.obtenerTodos();
		
		List<ReporteInformeIS3DTO> informesDTO = new ArrayList<ReporteInformeIS3DTO>();
		ReporteInformeIS3DTO reporteDTO = null;
		
		for (Informe informe : informes){
			
			reporteDTO = new ReporteInformeIS3DTO();			
			reporteDTO.setId(informe.getId());			
			reporteDTO.setTipoInforme(informe.getNombre());			
			reporteDTO.setCicloActual(informe.getCicloActual().getNombre());			
			reporteDTO.setEstadoInforme(informe.getEstado().getValor());			
			if(informe.getFechaCambioUltimoEstado() != null)
				reporteDTO.setFechaUltimoCambioEstado(Formateador.formatearFecha(informe.getFechaCambioUltimoEstado(), PATRON_FECHA));
			if(informe.getFechaEnvio() != null)
				reporteDTO.setFechaEnvio(Formateador.formatearFecha(informe.getFechaEnvio(), PATRON_FECHA));
			reporteDTO.setTipoPadrino(informe.getPadrino().getTipo().getValor());			
			if(informe.getPadrino().getDatosPersonales() != null)
				reporteDTO.setPadrino(informe.getPadrino().getDatosPersonales().getApellido() + ", " + informe.getPadrino().getDatosPersonales().getNombre());
			else
				reporteDTO.setPadrino(informe.getPadrino().getEmpresa().getDenominacion());
			if(informe.getPadrino() != null){
				if(informe.getPadrino().getTipo().equals(TipoPadrino.CORPORATIVO)){
					if(informe.getPadrino().getEmpresa().getContacto1() != null){
						reporteDTO.setContacto(informe.getPadrino().getEmpresa().getContacto1());
					}
					if(informe.getPadrino().getEmpresa().getMailContacto1() !=null){
						reporteDTO.setMail(informe.getPadrino().getEmpresa().getMailContacto1());
					}
					
				}
				else{
					reporteDTO.setContacto(informe.getPadrino().getDatosPersonales().getNombre());
					if(informe.getPadrino().getDatosPersonales().getMail() != null){
						reporteDTO.setMail(informe.getPadrino().getDatosPersonales().getMail());
					}
				}
			}
			if(informe.getPadrino().getNroCtesPlataformaContable() !=null){
				reporteDTO.setNroCtesPlataformaContable(informe.getPadrino().getNroCtesPlataformaContable());
			}else{
				reporteDTO.setNroCtesPlataformaContable((long) 0);
			}
			reporteDTO.setIdAlumno(informe.getBecado().getId());			
			reporteDTO.setApellidoAlumno(informe.getBecado().getDatosPersonales().getApellido());
			reporteDTO.setNombreAlumno(informe.getBecado().getDatosPersonales().getNombre());			
			reporteDTO.setDni(informe.getBecado().getDatosPersonales().getDni().toString());			
			reporteDTO.setFechaNacimiento(Formateador.formatearFecha(informe.getBecado().getDatosPersonales().getFechaNacimiento(), PATRON_FECHA));
			reporteDTO.setLocalidad(informe.getBecado().getDatosPersonales().getLocalidad().getNombre());
			reporteDTO.setAnioEscolar(informe.getBecado().getAnioEscolar().getValor());		
			reporteDTO.setAnioAdicional(informe.getBecado().getAnioAdicional()?"Si" : "No");
			reporteDTO.setEscuelaNombre(informe.getBecado().getEscuela().getNombre());
			reporteDTO.setEscuelaLocalidad(informe.getBecado().getEscuela().getZonaCimientos().getNombre());	
			reporteDTO.setEae(informe.getBecado().getEscuela().getZonaCimientos().getEae());
			reporteDTO.setResponsable(informe.getBecado().getResponsable1().getApellido() + " " + informe.getBecado().getResponsable1().getNombre());
			// verificar si existe RA2
			if (informe.getBecado().getResponsable2() !=null){
				reporteDTO.setResponsable(informe.getBecado().getResponsable2().getApellido() + " " + informe.getBecado().getResponsable2().getNombre());
				if(informe.getBecado().getResponsable2().getIdVinculo() != null){
					reporteDTO.setVinculo(informe.getBecado().getResponsable2().getIdVinculo().getValor());
				}
			
			}
			else{
				reporteDTO.setResponsable(informe.getBecado().getResponsable1().getApellido() + " " + informe.getBecado().getResponsable1().getNombre());
				if(informe.getBecado().getResponsable1().getIdVinculo() != null){
					reporteDTO.setVinculo(informe.getBecado().getResponsable1().getIdVinculo().getValor());					
				}
			}
			if(informe.getFechaPBE() != null)
				reporteDTO.setFechaPBE(Formateador.formatearFecha(informe.getFechaPBE(), PATRON_FECHA));
			if(informe.getFechaReincorporacionPBE() != null)
				reporteDTO.setFechaReincorporacionPBE(Formateador.formatearFecha(informe.getFechaReincorporacionPBE(), PATRON_FECHA));
			if(informe.getRrPerfil() != null)
				reporteDTO.setRr(informe.getRrPerfil().getDatosPersonales().getApellidoNombre());
			if(informe.getEaPerfil() != null){
				reporteDTO.setEa(informe.getEaPerfil().getDatosPersonales().getApellidoNombre());
			}			
			
			
			
			
			InformeIS3 is3 = (InformeIS3) informe;					
			
			if (is3.getMensajePadrino() != null){
				reporteDTO.setQueridoPadrino(is3.getMensajePadrino().toString());
			}
			reporteDTO.setEdad(is3.getEdad().toString());
			if(is3.getActividadAcompanamiento() != null){
				reporteDTO.setAcompaniamientoTrabajamos(is3.getActividadAcompanamiento().toString());
			}			
			
			reporteDTO.setHsTrabajarAnio(is3.getHsTrabajarA�o());
			reporteDTO.setSarpepe(is3.getSarpepe());
			reporteDTO.setOsme(is3.getOsme());
			reporteDTO.setAcompaniamientoTrabajamos(is3.getQtam());
			reporteDTO.setAlo(is3.getAlo());
			
			
			
			if(is3.getMateriasCuestan() != null){
				materia=is3.getMateriasCuestan().toString();
				// reporteDTO.setMateriasCuestan(is2.getMateriasCuestan().toString());
				String descMateria="";
				
				for(int i = 0; i<materia.length(); i++){
					if (!",".equals(materia.substring(i,i+1))) {
						
						descMateria=descMateria + materia.substring(i,i+1);
						
					}
					else
					{
						lDescMateria = Long.parseLong(descMateria);					
						if (materiasCuestan == ""){
							materiasCuestan=this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						else
						{
							materiasCuestan=materiasCuestan + ", " + this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						descMateria="";
					}
					if(i==((materia.length())-1)){
						lDescMateria = Long.parseLong(descMateria);					
						if (materiasCuestan == ""){
							materiasCuestan=this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						else
						{
							materiasCuestan=materiasCuestan + ", " + this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						descMateria="";
					}					
				}	
				reporteDTO.setMateriasCuestan(materiasCuestan);
				materia="";
				materiasCuestan="";				
			}

			if(is3.getMateriasInteres() != null){
				
				materia=is3.getMateriasInteres().toString();
				// reporteDTO.setMateriasCuestan(is2.getMateriasCuestan().toString());
				String descMateria="";
				
				for(int i = 0; i<materia.length(); i++){
					if (!",".equals(materia.substring(i,i+1))) {
						
						descMateria=descMateria + materia.substring(i,i+1);
						
					}
					else
					{
						lDescMateria = Long.parseLong(descMateria);					
						if (materiasCuestan == ""){
							materiasCuestan=this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						else
						{
							materiasCuestan=materiasCuestan + ", " + this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						descMateria="";
					}
					if(i==((materia.length())-1)){
						lDescMateria = Long.parseLong(descMateria);					
						if (materiasCuestan == ""){
							materiasCuestan=this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						else
						{
							materiasCuestan=materiasCuestan + ", " + this.obtenerMateriaSeleccionada(listaMaterias, lDescMateria);
						}
						descMateria="";
					}					
				}	
				reporteDTO.setMateriasInteresan(materiasCuestan);
				materia="";
				materiasCuestan="";				
				
			}
			
			if(is3.getMateriasDesaprobadas() != null){
				reporteDTO.setCantidadMateriasDesaprobadas(is3.getMateriasDesaprobadas().toString());
			}
			if(is3.getInasistencias() != null){
				reporteDTO.setCantidadInasistencia(is3.getInasistencias().toString());
			}
			
			if (is3.getUtilizacionBeca() != null){
				reporteDTO.setUtilizacionBeca(is3.getUtilizacionBeca().toString());
				
			}
			
			if (is3.getSuspensionesCantidad() !=null){
				reporteDTO.setCantidadSuspensiones(is3.getSuspensionesCantidad().toString());				
			}
			
			if (is3.getSuspensionesPeriodo() !=null){
				reporteDTO.setMesesSuspensiones(is3.getSuspensionesPeriodo().toString());
			}
			
			if (is3.getSuspensiones() !=null){
				reporteDTO.setMotivosSuspension(is3.getSuspensiones().toString());
			}
			
			if(is3.getSituacionRenovacion() !=null){
				reporteDTO.setSituacionRenovacion(is3.getSituacionRenovacion());
			}
			if(is3.getMotivoNoRenovacion() !=null){
				reporteDTO.setMotivoNoRenovacion(is3.getMotivoNoRenovacion());
			}
			if(is3.getProyAnioProximo() !=null){
				reporteDTO.setProyeccionAnoProximoFinPBE(is3.getProyAnioProximo());
			}
			
			if (is3.getEvalRenovacionBeca()!=null){
				reporteDTO.setResultadoAnoEscolar(is3.getEvalRenovacionBeca());
				
			}
			
			if(is3.getTarang() !=null){
				reporteDTO.setTarang(is3.getTarang());
			}
			if(is3.getPaa() !=null){
				reporteDTO.setPaa(is3.getPaa());
			}
			
			if(is3.getVtepa() !=null){
				reporteDTO.setVtepa(is3.getVtepa());
			}
			if(is3.getVtepb() !=null){
				reporteDTO.setVtepb(is3.getVtepb());
			}
			if(is3.getVtepc() !=null){
				reporteDTO.setVtepc(is3.getVtepc());
			}
			if(is3.getVtepd() !=null){
				reporteDTO.setVtepd(is3.getVtepd());
			}
			if(is3.getVtepe() !=null){
				reporteDTO.setVtepe(is3.getVtepe());
			}
			if(is3.getVtepf() !=null){
				reporteDTO.setVtepf(is3.getVtepf());
			}
			if(is3.getVtepg() !=null){
				reporteDTO.setVtepg(is3.getVtepg());
			}
			if(is3.getVteph() !=null){
				reporteDTO.setVteph(is3.getVteph());
			}
			if(is3.getVtepi() !=null){
				reporteDTO.setVtepi(is3.getVtepi());
			}
			
			if(is3.getIatarni() !=null){
				reporteDTO.setIatarni(is3.getIatarni());
			}
			
			Connection cn0 = null;
			
			String materiasPendientes="";
			try {  
	            String query="select materia,anio_escolar from previas_nuevo p where ja<>'Aprobado' and di<>'Aprobado' and fb<>'Aprobado' and ma<>'Aprobado' and mam<>'Aprobado' and idbecado="+ is3.getBecado().getId();
	            cn0 = Conexion.getConexion();
	            Statement st = cn0.createStatement();
	            ResultSet rs0 = st.executeQuery(query);        
			    
	            while (rs0.next()) {	                    
	            	materiasPendientes=materiasPendientes+rs0.getString("materia")+" - "+rs0.getString("anio_escolar")+", ";
		            
	            }
	           //entrevistaIndividual.setMp(materiasPendientes);
	           
	           
	            reporteDTO.setMp(materiasPendientes);
	            
	           st.close();
	           
	            
		        Conexion.cerrarConexion(cn0);
	        } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
		        Conexion.cerrarConexion(cn0);
			}
			
			
			String suspensiones="0";
			try {  
	            String query="select count(id) as suspensiones from entrevista e where e.fecha_carga>='2023-01-01' and e.evaluacion_cobro_beca=1 and e.perfil_alumno="+is3.getBecado().getId();
	            cn0 = Conexion.getConexion();
	            Statement st = cn0.createStatement();
	            ResultSet rs0 = st.executeQuery(query);         
			    
	            while (rs0.next()) {	                    
	            	suspensiones=rs0.getString("suspensiones");
		            
	            }
	            reporteDTO.setSus(suspensiones);
	            
	           st.close();
	            
		        Conexion.cerrarConexion(cn0);
	        } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
		        Conexion.cerrarConexion(cn0);
			}
			
			
			
			
			
			
			if(is3.getIge() !=null){
				reporteDTO.setIge(is3.getIge());
			}
			
			
			
			
			informesDTO.add(reporteDTO);
		}
		return informesDTO;
	}	
	
	public List<ReporteInformeICDTO> obtenerInformesICAReportar(List<Long> ciclo,  Integer tipoId,
			List<String> tipoInforme, List<Integer> idEstado, List<Number> padrinoId, List<Number> zonaId, String nombreAlumno,
			Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion, String eae){
		
		List<Informe> informes = informeDao.obtenerInformesAReportar(ciclo, tipoId, tipoInforme, idEstado, padrinoId, zonaId, nombreAlumno,
																idEA, idRR, anioEscolar, fechaDesde, fechaHasta,
																firstResult, maxResults, sortDirection, sortCriterion,eae);	
		return this.cargaInformeICDTO(informes);
		
	}
	
	
	public List<ReporteInformeICDTO> cargaInformeICDTO(List<Informe> informes){
		
		
		
		List<ReporteInformeICDTO> informesDTO = new ArrayList<ReporteInformeICDTO>();
		ReporteInformeICDTO reporteDTO = null;
		
		for (Informe informe : informes){
			
			reporteDTO = new ReporteInformeICDTO();			
			reporteDTO.setId(informe.getId());			
			reporteDTO.setTipoInforme(informe.getNombre());			
			reporteDTO.setCicloActual(informe.getCicloActual().getNombre());			
			reporteDTO.setEstadoInforme(informe.getEstado().getValor());			
			if(informe.getFechaCambioUltimoEstado() != null)
				reporteDTO.setFechaUltimoCambioEstado(Formateador.formatearFecha(informe.getFechaCambioUltimoEstado(), PATRON_FECHA));
			if(informe.getFechaEnvio() != null)
				reporteDTO.setFechaEnvio(Formateador.formatearFecha(informe.getFechaEnvio(), PATRON_FECHA));
			reporteDTO.setTipoPadrino(informe.getPadrino().getTipo().getValor());			
			if(informe.getPadrino().getDatosPersonales() != null)
				reporteDTO.setPadrino(informe.getPadrino().getDatosPersonales().getApellido() + ", " + informe.getPadrino().getDatosPersonales().getNombre());
			else
				reporteDTO.setPadrino(informe.getPadrino().getEmpresa().getDenominacion());
			if(informe.getPadrino() != null){
				if(informe.getPadrino().getTipo().equals(TipoPadrino.CORPORATIVO)){
					if(informe.getPadrino().getEmpresa().getContacto1() != null){
						reporteDTO.setContacto(informe.getPadrino().getEmpresa().getContacto1());
					}
					if(informe.getPadrino().getEmpresa().getMailContacto1() !=null){
						reporteDTO.setMail(informe.getPadrino().getEmpresa().getMailContacto1());
					}
					
				}
				else{
					reporteDTO.setContacto(informe.getPadrino().getDatosPersonales().getNombre());
					if(informe.getPadrino().getDatosPersonales().getMail() != null){
						reporteDTO.setMail(informe.getPadrino().getDatosPersonales().getMail());
					}
				}
			}
			if(informe.getPadrino().getNroCtesPlataformaContable() !=null){
				reporteDTO.setNroCtesPlataformaContable(informe.getPadrino().getNroCtesPlataformaContable());
			}else{
				reporteDTO.setNroCtesPlataformaContable((long) 0);
			}
				
			reporteDTO.setIdAlumno(informe.getBecado().getId());			
			reporteDTO.setApellidoAlumno(informe.getBecado().getDatosPersonales().getApellido());
			reporteDTO.setNombreAlumno(informe.getBecado().getDatosPersonales().getNombre());			
			reporteDTO.setDni(informe.getBecado().getDatosPersonales().getDni().toString());			
			reporteDTO.setFechaNacimiento(Formateador.formatearFecha(informe.getBecado().getDatosPersonales().getFechaNacimiento(), PATRON_FECHA));
			reporteDTO.setLocalidad(informe.getBecado().getDatosPersonales().getLocalidad().getNombre());
			reporteDTO.setAnioEscolar(informe.getBecado().getAnioEscolar().getValor());		
			reporteDTO.setAnioAdicional(informe.getBecado().getAnioAdicional()?"Si" : "No");
			reporteDTO.setEscuelaNombre(informe.getBecado().getEscuela().getNombre());
			reporteDTO.setEscuelaLocalidad(informe.getBecado().getEscuela().getZonaCimientos().getNombre());	
			reporteDTO.setResponsable(informe.getBecado().getResponsable1().getApellido() + " " + informe.getBecado().getResponsable1().getNombre());
			reporteDTO.setEae(informe.getBecado().getEscuela().getZonaCimientos().getEae());
			// verificar si existe RA2
			if (informe.getBecado().getResponsable2() !=null){
				reporteDTO.setResponsable(informe.getBecado().getResponsable2().getApellido() + " " + informe.getBecado().getResponsable2().getNombre());
				if(informe.getBecado().getResponsable2().getIdVinculo() != null){
					reporteDTO.setVinculo(informe.getBecado().getResponsable2().getIdVinculo().getValor());
				}
			
			}
			else{
				reporteDTO.setResponsable(informe.getBecado().getResponsable1().getApellido() + " " + informe.getBecado().getResponsable1().getNombre());
				if(informe.getBecado().getResponsable1().getIdVinculo() != null){
					reporteDTO.setVinculo(informe.getBecado().getResponsable1().getIdVinculo().getValor());					
				}
			}
			if(informe.getFechaPBE() != null)
				reporteDTO.setFechaPBE(Formateador.formatearFecha(informe.getFechaPBE(), PATRON_FECHA));
			if(informe.getFechaReincorporacionPBE() != null)
				reporteDTO.setFechaReincorporacionPBE(Formateador.formatearFecha(informe.getFechaReincorporacionPBE(), PATRON_FECHA));		
			if(informe.getRrPerfil() != null)
				reporteDTO.setRr(informe.getRrPerfil().getDatosPersonales().getApellidoNombre());
			if(informe.getEaPerfil() != null){
				reporteDTO.setEa(informe.getEaPerfil().getDatosPersonales().getApellidoNombre());
			}			
			
						
			InformeCesacion ic = (InformeCesacion) informe;					
			
			if (ic.getMesCesacion() != null){
				reporteDTO.setMesCesacion(ic.getMesCesacion().toString());
			}			
			if (ic.getMotivoCesacion() != null){
				reporteDTO.setMotivoCesacion(ic.getMotivoCesacion().toString());
			}
			reporteDTO.setEdad(ic.getEdad().toString());
			if(ic.getComentariosCesacion() != null){
				reporteDTO.setComentariosCesacion(ic.getComentariosCesacion().toString());
			}						
			if(ic.getEsfuerzo() != null){
				reporteDTO.setEsfuerzo(ic.getEsfuerzo().getValor());
			}			
			if(ic.getConducta() != null){
				reporteDTO.setConducta(ic.getConducta().getValor());
			}			
			if (ic.getCompromisoRa() != null){
				reporteDTO.setCompromisoRAEscolaridad(ic.getCompromisoRa().getValor());				
			}			
			if (ic.getAsistenciaBecadoAEntrevista() !=null){
				reporteDTO.setAsistioBecadoEntrevista(ic.getAsistenciaBecadoAEntrevista().getValor()) ;				
			}			
			if (ic.getPresentacionMaterial() !=null){
				reporteDTO.setPresentacionMaterial(ic.getPresentacionMaterial().getValor()) ;
			}			
			if (ic.getCompromisoEscolaridadPBE() !=null){
				reporteDTO.setCompromisoAlumnoPrograma(ic.getCompromisoEscolaridadPBE().getValor()) ;
			}			
			if(ic.getAsistenciaRAEntrevista() !=null){
				reporteDTO.setAsistenciaRAEntrevista(ic.getAsistenciaRAEntrevista().getValor()) ;
			}
			if(ic.getCompromisoRaPBE() !=null){
				reporteDTO.setCompromisoRAPrograma(ic.getCompromisoRaPBE().getValor()) ;
			}
			if(ic.getActividadAcompanamiento() !=null){
				reporteDTO.setActividadAcompanamiento(ic.getActividadAcompanamiento().toString());
			}			
			if(ic.getObservaciones() !=null){
				reporteDTO.setObservacionesGenerales(ic.getObservaciones().toString());
			}
			if(ic.getCompromisoEscolaridad() !=null){
				reporteDTO.setCompromisoAlumnoEscolaridad(ic.getCompromisoEscolaridad().getValor());
			}
			if(ic.getDetalle() !=null){
				reporteDTO.setDestinoDineroBeca(ic.getDetalle().toString());								
			}			
			if(ic.getDetallePagosSuspendidos() !=null){
				reporteDTO.setSuspensionesDeBeca(ic.getDetallePagosSuspendidos().toString());				
			}
			if(ic.getComentariosCesacion() !=null){
				reporteDTO.setComentariosCesacion(ic.getComentariosCesacion().toString());
			}
			
			if(ic.getMateriasAprobadas() !=null){
				reporteDTO.setMateriasAprobadas(ic.getMateriasAprobadas().toString());
								
			}
			if(ic.getMateriasDesaprobadas() !=null){
				reporteDTO.setMateriasDesaprobadas(ic.getMateriasDesaprobadas().toString());
								
			}
			
			if(ic.getDatosEstimadosCheck() !=null){
				reporteDTO.setDatosEstimadosCheck(ic.getDatosEstimadosCheck());
			}else{
				reporteDTO.setDatosEstimadosCheck(false);
			}
			
			if (ic.getInasistencias() !=null){
				reporteDTO.setInasistencias2(ic.getInasistencias());
			}else{
				reporteDTO.setInasistencias2((float) 0);
			}
			
			
			Boletin boletinAnioAnterior = informe.getBecado().getBoletin(); 
						
			// Boletin
			
			if(boletinAnioAnterior != null){	
				
				// Previas
				
				List<MateriaDTO> previas = new ArrayList<MateriaDTO>();
				
				if(boletinAnioAnterior.getPrevias() != null && boletinAnioAnterior.getPrevias().size() > 0){			
					List<NotaMateria> notasPreviasMarzo = new ArrayList<NotaMateria>();
					List<NotaMateria> notasPreviasJulio = new ArrayList<NotaMateria>();
					List<NotaMateria> notasPreviasDiciembre = new ArrayList<NotaMateria>();
					
					Trimestre previasJulio = boletinAnioAnterior.getPrevias().get(0);
					Trimestre previasDiciembre = boletinAnioAnterior.getPrevias().get(1);
					Trimestre previasMarzo = boletinAnioAnterior.getPrevias().get(2);
					
					for (NotaMateria notaMateria : previasMarzo.getMaterias()) {
						notasPreviasMarzo.add(notaMateria);
					}
					for (NotaMateria notaMateria : previasJulio.getMaterias()) {
						notasPreviasJulio.add(notaMateria);
					}
					for (NotaMateria notaMateria : previasDiciembre.getMaterias()) {
						notasPreviasDiciembre.add(notaMateria);
					}
					
					for (int i = 0; i < boletinAnioAnterior.getMateriasPrevias().size(); i++) {
						Materia materiaP = boletinAnioAnterior.getMateriasPrevias().get(i);
						MateriaDTO materiaDTO = new MateriaDTO();
						NotaMateria notaMarzo = notasPreviasMarzo.get(i);
						NotaMateria notaJulio = notasPreviasJulio.get(i);
						NotaMateria notaDic = notasPreviasDiciembre.get(i);
											
						if (materiaP.equals(notaMarzo.getMateria())) {
							materiaDTO.setNombre(notaMarzo.getMateria().getNombre());
							materiaDTO.setCiclo(notaMarzo.getCiclo());
							if(CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaMarzo.getCalificacion())
									|| CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaJulio.getCalificacion())
									|| CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaDic.getCalificacion())){
								materiaDTO.setNotaMarzo(notaMarzo.getCalificacion().getValor());
								materiaDTO.setNotaFin(notaJulio.getCalificacion().getValor());
								materiaDTO.setNotaDic(notaDic.getCalificacion().getValor());
							}
							previas.add(materiaDTO);
						}					
					}
				}
								
				reporteDTO.setPreviasDTO(previas);
				
				// boletin anterior
				
				List<NotaMateria> notasPrimero = new ArrayList<NotaMateria>();
				List<NotaMateria> notasSegundo = new ArrayList<NotaMateria>();
				List<NotaMateria> notasTercero = new ArrayList<NotaMateria>();
				List<NotaMateria> notasFin = new ArrayList<NotaMateria>();
				List<NotaMateria> notasDiciembre = new ArrayList<NotaMateria>();
				List<NotaMateria> notasMarzo = new ArrayList<NotaMateria>();
	
				List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
				
				if (isUnTrimestreConMaterias(boletinAnioAnterior) || isBoletinSinMaterias(boletinAnioAnterior)) {
					
					Trimestre primero = boletinAnioAnterior.getTrimestres().get(0);
					Trimestre segundo = boletinAnioAnterior.getTrimestres().get(1);
					Trimestre tercero = boletinAnioAnterior.getTrimestres().get(2);
					Trimestre fin = boletinAnioAnterior.getTrimestres().get(3);
					Trimestre diciembre = boletinAnioAnterior.getTrimestres().get(4);
					Trimestre marzo = boletinAnioAnterior.getTrimestres().get(5);
					
					for (NotaMateria notaMateria : primero.getMaterias()) {
						notasPrimero.add(notaMateria);
	
					}
					for (NotaMateria notaMateria : segundo.getMaterias()) {
						notasSegundo.add(notaMateria);
					}
					for (NotaMateria notaMateria : tercero.getMaterias()) {
						notasTercero.add(notaMateria);
					}
					for (NotaMateria notaMateria : fin.getMaterias()) {
						notasFin.add(notaMateria);
					}
					for (NotaMateria notaMateria : diciembre.getMaterias()) {
						notasDiciembre.add(notaMateria);
					}
					for (NotaMateria notaMateria : marzo.getMaterias()) {
						notasMarzo.add(notaMateria);
					}
				
					for (int i = 0; i < boletinAnioAnterior.getMaterias().size(); i++) {
						
						Materia materia1 = boletinAnioAnterior.getMaterias().get(i);
						MateriaDTO materiaDTO = new MateriaDTO();
						NotaMateria notaPri = notasPrimero.get(i);
						NotaMateria notaSeg = notasSegundo.get(i);
						NotaMateria notaTerc = notasTercero.get(i);
						NotaMateria notaFin = notasFin.get(i);
						NotaMateria notaDic = notasDiciembre.get(i);
						NotaMateria notaMarzo = notasMarzo.get(i);
					
						if (materia1.equals(notaPri.getMateria())) {
							if(CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaPri.getCalificacion())){
								this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia1);
							}
							else{
								if(CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaSeg.getCalificacion())){
									this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia1);
								}
								else{
									if(CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaTerc.getCalificacion())){
										this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia1);
									}
									else{
										materiaDTO = null;
									}
								}
							}
						}								
						if(materiaDTO != null){
							materias.add(materiaDTO);				
						}							
					}			
				}			
				
				reporteDTO.setMateriasDto(materias);
				
			
			// conducta
			
			
				String conducta="";
				String diasHabiles="";
				Float totalDiasHabiles=(float) 0;
				if (boletinAnioAnterior.getConductaPrimerTrimestre()!=null){
					conducta=boletinAnioAnterior.getConductaPrimerTrimestre().getValor();
				}
				
				if (boletinAnioAnterior.getConductaSegundoTrimestre()!=null){
					conducta=conducta+", "+boletinAnioAnterior.getConductaSegundoTrimestre().getValor();							
				}			
				if (boletinAnioAnterior.getConductaTercerTrimestre()!=null){
					conducta=conducta+", "+boletinAnioAnterior.getConductaTercerTrimestre().getValor();								
				}			
				reporteDTO.setConductaB(conducta);
							
				
				// dias habiles
				
				
				
				Float diasHabiles1T=(float)0;
				Float diasHabiles2T=(float)0;
				Float diasHabiles3T=(float)0;
				
				String diasHabiles1S="";
				String diasHabiles2S="";
				String diasHabiles3S="";
				
				
				
				if (boletinAnioAnterior.getDiasHabilesPrimerTrimestre() !=null){
					
					diasHabiles1T= Float.parseFloat(boletinAnioAnterior.getDiasHabilesPrimerTrimestre().toString());
					diasHabiles1S=boletinAnioAnterior.getDiasHabilesPrimerTrimestre().toString();
					
				}
				
				if (boletinAnioAnterior.getDiasHabilesSegundoTrimestre() !=null){
					
					diasHabiles2T=Float.parseFloat(boletinAnioAnterior.getDiasHabilesSegundoTrimestre().toString());
					diasHabiles2S=boletinAnioAnterior.getDiasHabilesSegundoTrimestre().toString();
				
				}
					
				if (boletinAnioAnterior.getDiasHabilesTercerTrimestre() !=null){
					
					diasHabiles3T=Float.parseFloat(boletinAnioAnterior.getDiasHabilesTercerTrimestre().toString());
					diasHabiles3S=boletinAnioAnterior.getDiasHabilesTercerTrimestre().toString();
				
				}
					
				if (diasHabiles1S==""){
					
					diasHabiles1S="Sin dato";
					
				}
				
				if (diasHabiles2S==""){
					
					diasHabiles2S="Sin dato";
					
				}
				
				if (diasHabiles3S==""){
					
					diasHabiles3S="Sin dato";
					
				}
				
				diasHabiles=diasHabiles1S+", " + diasHabiles2S+", "+ diasHabiles3S;
				totalDiasHabiles=diasHabiles1T+diasHabiles2T+diasHabiles3T;
				
				reporteDTO.setDiasHabiles(diasHabiles);
				reporteDTO.setDiasHabilesFinales(totalDiasHabiles);
				
				diasHabiles="";				
				totalDiasHabiles=(float) 0;
				diasHabiles1S="";
				diasHabiles1T=(float)0;
				diasHabiles2S="";
				diasHabiles2T=(float)0;
				diasHabiles3S="";
				diasHabiles3T=(float)0;
				totalDiasHabiles=(float)0;
					
				
				// inasistencias
				
				if (boletinAnioAnterior.getInasistenciasPrimerTrimestre() !=null){
	
					diasHabiles1S=boletinAnioAnterior.getInasistenciasPrimerTrimestre().toString();
					diasHabiles1T=Float.parseFloat(boletinAnioAnterior.getInasistenciasPrimerTrimestre().toString());
									
				}
				
				if (boletinAnioAnterior.getInasistenciasSegundoTrimestre() !=null){
					
					diasHabiles2S=boletinAnioAnterior.getInasistenciasSegundoTrimestre().toString();
					diasHabiles2T=Float.parseFloat(boletinAnioAnterior.getInasistenciasSegundoTrimestre().toString());
						
				}
				if (boletinAnioAnterior.getInasistenciasTercerTrimestre() !=null){
					
					diasHabiles3S=boletinAnioAnterior.getInasistenciasTercerTrimestre().toString();
					diasHabiles3T=Float.parseFloat(boletinAnioAnterior.getInasistenciasTercerTrimestre().toString());
					
				}
				
				if (diasHabiles1S==""){
					
					diasHabiles1S="Sin dato";
					
				}
				
				if (diasHabiles2S==""){
					
					diasHabiles2S="Sin dato";
					
				}
				
				if (diasHabiles3S==""){
					
					diasHabiles3S="Sin dato";
					
				}
				
				
				diasHabiles=diasHabiles1S+", " + diasHabiles2S+", "+ diasHabiles3S;
				totalDiasHabiles=diasHabiles1T+diasHabiles2T+diasHabiles3T;
				
				reporteDTO.setInasistencias(diasHabiles);
				reporteDTO.setInasistencasFinales(totalDiasHabiles);
				
				
				
				
				}
			
			
			informesDTO.add(reporteDTO);
		}
		

		
		
		return informesDTO;
	}	
	
	
	public List<ReporteInformeIS1DTO> obtenerInformesIS1AReportar(List<Long> ciclo,  Integer tipoId,
			List<String> tipoInforme, List<Integer> idEstado, List<Number> padrinoId, List<Number> zonaId, String nombreAlumno,
			Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion, String eae){
		
		List<Informe> informes = informeDao.obtenerInformesAReportar(ciclo, tipoId, tipoInforme, idEstado, padrinoId, zonaId, nombreAlumno,
																idEA, idRR, anioEscolar, fechaDesde, fechaHasta,
																firstResult, maxResults, sortDirection, sortCriterion,eae);	
		return this.cargaInformeIS1DTO(informes);
		
	}	
	
	public List<ReporteInformeIS1DTO> cargaInformeIS1DTO(List<Informe> informes){
			
		
		
		List<ReporteInformeIS1DTO> informesDTO = new ArrayList<ReporteInformeIS1DTO>();
		ReporteInformeIS1DTO reporteDTO = null;
		
		for (Informe informe : informes){
			
			reporteDTO = new ReporteInformeIS1DTO();			
			reporteDTO.setId(informe.getId());			
			reporteDTO.setTipoInforme(informe.getNombre());			
			reporteDTO.setCicloActual(informe.getCicloActual().getNombre());			
			reporteDTO.setEstadoInforme(informe.getEstado().getValor());			
			if(informe.getFechaCambioUltimoEstado() != null)
				reporteDTO.setFechaUltimoCambioEstado(Formateador.formatearFecha(informe.getFechaCambioUltimoEstado(), PATRON_FECHA));
			if(informe.getFechaEnvio() != null)
				reporteDTO.setFechaEnvio(Formateador.formatearFecha(informe.getFechaEnvio(), PATRON_FECHA));
			reporteDTO.setTipoPadrino(informe.getPadrino().getTipo().getValor());		
			if(informe.getPadrino().getDatosPersonales() != null)
				reporteDTO.setPadrino(informe.getPadrino().getDatosPersonales().getApellido() + ", " + informe.getPadrino().getDatosPersonales().getNombre());
			else
				reporteDTO.setPadrino(informe.getPadrino().getEmpresa().getDenominacion());
			if(informe.getPadrino() != null){
				if(informe.getPadrino().getTipo().equals(TipoPadrino.CORPORATIVO)){
					if(informe.getPadrino().getEmpresa().getContacto1() != null){
						reporteDTO.setContacto(informe.getPadrino().getEmpresa().getContacto1());
					}
					if(informe.getPadrino().getEmpresa().getMailContacto1() !=null){
						reporteDTO.setMail(informe.getPadrino().getEmpresa().getMailContacto1());
					}
					
				}
				else{
					reporteDTO.setContacto(informe.getPadrino().getDatosPersonales().getNombre());
					if(informe.getPadrino().getDatosPersonales().getMail() != null){
						reporteDTO.setMail(informe.getPadrino().getDatosPersonales().getMail());
					}
				}
			}
			if(informe.getPadrino().getNroCtesPlataformaContable() !=null){
				reporteDTO.setNroCtesPlataformaContable(informe.getPadrino().getNroCtesPlataformaContable());
			}else{
				reporteDTO.setNroCtesPlataformaContable((long) 0);
			}
			
			
			reporteDTO.setIdAlumno(informe.getBecado().getId());			
			reporteDTO.setApellidoAlumno(informe.getBecado().getDatosPersonales().getApellido());
			reporteDTO.setNombreAlumno(informe.getBecado().getDatosPersonales().getNombre());			
			reporteDTO.setDni(informe.getBecado().getDatosPersonales().getDni().toString());			
			reporteDTO.setFechaNacimiento(Formateador.formatearFecha(informe.getBecado().getDatosPersonales().getFechaNacimiento(), PATRON_FECHA));
			reporteDTO.setLocalidad(informe.getBecado().getDatosPersonales().getLocalidad().getNombre());
			reporteDTO.setAnioEscolar(informe.getBecado().getAnioEscolar().getValor());		
			reporteDTO.setAnioAdicional(informe.getBecado().getAnioAdicional()?"Si" : "No");
			reporteDTO.setEscuelaNombre(informe.getBecado().getEscuela().getNombre());
			reporteDTO.setEscuelaLocalidad(informe.getBecado().getEscuela().getZonaCimientos().getNombre());	
			reporteDTO.setResponsable(informe.getBecado().getResponsable1().getApellido() + " " + informe.getBecado().getResponsable1().getNombre());
			reporteDTO.setEae(informe.getBecado().getEscuela().getZonaCimientos().getEae());
			// verificar si existe RA2
			if (informe.getBecado().getResponsable2() !=null){
				reporteDTO.setResponsable(informe.getBecado().getResponsable2().getApellido() + " " + informe.getBecado().getResponsable2().getNombre());
				if(informe.getBecado().getResponsable2().getIdVinculo() != null){
					reporteDTO.setVinculo(informe.getBecado().getResponsable2().getIdVinculo().getValor());
				}
			
			}
			else{
				reporteDTO.setResponsable(informe.getBecado().getResponsable1().getApellido() + " " + informe.getBecado().getResponsable1().getNombre());
				if(informe.getBecado().getResponsable1().getIdVinculo() != null){
					reporteDTO.setVinculo(informe.getBecado().getResponsable1().getIdVinculo().getValor());					
				}
			}
			if(informe.getFechaPBE() != null)
				reporteDTO.setFechaPBE(Formateador.formatearFecha(informe.getFechaPBE(), PATRON_FECHA));
			if(informe.getRrPerfil() != null)
				reporteDTO.setRr(informe.getRrPerfil().getDatosPersonales().getApellidoNombre());
			if(informe.getEaPerfil() != null){
				reporteDTO.setEa(informe.getEaPerfil().getDatosPersonales().getApellidoNombre());
			}			
			
			
			InformeIS1 is1 = (InformeIS1) informe;
			reporteDTO.setEdad(is1.getEdad().toString());
			
			
			//reporteDTO.setTiempoLibreGusta(is1.getGustosTiempoLibreListString().toString());
			//reporteDTO.setPropositoAnioComienza(is1.getPropositoAnioComienzaListString().toString());
			reporteDTO.setPropositoAnioComienza(is1.getPropositoAnioComienza().toString());
			reporteDTO.setTiempoLibreGusta(is1.getActividadesVacaciones());
			reporteDTO.setObservacionesExcepcion(is1.getObservacionesExcepcion());
			
			
			reporteDTO.setInfoEscuela(is1.getBecado().getEscuela().getObservaciones());			
			//reporteDTO.setEspacioEscuela(is1.getBecado().getEscuela().getEspacioApoyo());
			
			reporteDTO.setProposito(is1.getPropositoAnioComienza());
			reporteDTO.setHabiliaddes(is1.getHsTrabajarA�o());
			
			if(is1.getBecado().getEscuela().getEspacioApoyo()!= null)
				reporteDTO.setEspacioEscuela(parsearListaEspacios(informe.getBecado().getEscuela().getEspacioApoyo()));
			
			
			String conducta="";
			String diasHabiles="";			
			Float totalDiasHabiles=(float) 0;
			
			if (is1.getBoletinAnioAnterior() != null){
			
				if (is1.getBoletinAnioAnterior().getConductaPrimerTrimestre()!=null){
					conducta=is1.getBoletinAnioAnterior().getConductaPrimerTrimestre().getValor();							
				}
				else{
					conducta="-";
				}
				if (is1.getBoletinAnioAnterior().getConductaSegundoTrimestre()!=null){
					conducta=conducta+", "+is1.getBoletinAnioAnterior().getConductaSegundoTrimestre().getValor();							
				}
				else{
					conducta=conducta+", -";
				}
				if (is1.getBoletinAnioAnterior().getConductaTercerTrimestre()!=null){
					conducta=conducta+", "+is1.getBoletinAnioAnterior().getConductaTercerTrimestre().getValor();							
				}
				else{
					conducta=conducta+", -";
				}
				reporteDTO.setConducta(conducta);
							
				
				
				
				Float diasHabiles1T=(float)0;
				Float diasHabiles2T=(float)0;
				Float diasHabiles3T=(float)0;
				
				String diasHabiles1S="";
				String diasHabiles2S="";
				String diasHabiles3S="";
				
				
				// dias h�biles
				
				if (is1.getBoletinAnioAnterior().getDiasHabilesPrimerTrimestre() !=null){
					
					diasHabiles1T= Float.parseFloat(is1.getBoletinAnioAnterior().getDiasHabilesPrimerTrimestre().toString());
					diasHabiles1S=is1.getBoletinAnioAnterior().getDiasHabilesPrimerTrimestre().toString();
					
				}
				
				if (is1.getBoletinAnioAnterior().getDiasHabilesSegundoTrimestre() !=null){
					
					diasHabiles2T=Float.parseFloat(is1.getBoletinAnioAnterior().getDiasHabilesSegundoTrimestre().toString());
					diasHabiles2S=is1.getBoletinAnioAnterior().getDiasHabilesSegundoTrimestre().toString();
				
				}
					
				if (is1.getBoletinAnioAnterior().getDiasHabilesTercerTrimestre() !=null){
					
					diasHabiles3T=Float.parseFloat(is1.getBoletinAnioAnterior().getDiasHabilesTercerTrimestre().toString());
					diasHabiles3S=is1.getBoletinAnioAnterior().getDiasHabilesTercerTrimestre().toString();
				
				}
					
				if (diasHabiles1S==""){
					
					diasHabiles1S="Sin dato";
					
				}
				
				if (diasHabiles2S==""){
					
					diasHabiles2S="Sin dato";
					
				}
				
				if (diasHabiles3S==""){
					
					diasHabiles3S="Sin dato";
					
				}
				
				diasHabiles=diasHabiles1S+", " + diasHabiles2S+", "+ diasHabiles3S;
				totalDiasHabiles=diasHabiles1T+diasHabiles2T+diasHabiles3T;
				
				
				
				reporteDTO.setDiasHabiles(diasHabiles);
				reporteDTO.setDiasHabilesFinales(totalDiasHabiles);
				
				diasHabiles="";			
				totalDiasHabiles=(float) 0;		
				diasHabiles1S="";
				diasHabiles1T=(float)0;
				diasHabiles2S="";
				diasHabiles2T=(float)0;
				diasHabiles3S="";
				diasHabiles3T=(float)0;
				totalDiasHabiles=(float)0;
					
				
				// inasistencias
				
				if (is1.getBoletinAnioAnterior().getInasistenciasPrimerTrimestre() !=null){
	
					diasHabiles1S=is1.getBoletinAnioAnterior().getInasistenciasPrimerTrimestre().toString();
					diasHabiles1T=Float.parseFloat(is1.getBoletinAnioAnterior().getInasistenciasPrimerTrimestre().toString());
									
				}
				
				if (is1.getBoletinAnioAnterior().getInasistenciasSegundoTrimestre() !=null){
					
					diasHabiles2S=is1.getBoletinAnioAnterior().getInasistenciasSegundoTrimestre().toString();
					diasHabiles2T=Float.parseFloat(is1.getBoletinAnioAnterior().getInasistenciasSegundoTrimestre().toString());
						
				}
				if (is1.getBoletinAnioAnterior().getInasistenciasTercerTrimestre() !=null){
					
					diasHabiles3S=is1.getBoletinAnioAnterior().getInasistenciasTercerTrimestre().toString();
					diasHabiles3T=Float.parseFloat(is1.getBoletinAnioAnterior().getInasistenciasTercerTrimestre().toString());
					
				}
				
				if (diasHabiles1S==""){
					
					diasHabiles1S="Sin dato";
					
				}
				
				if (diasHabiles2S==""){
					
					diasHabiles2S="Sin dato";
					
				}
				
				if (diasHabiles3S==""){
					
					diasHabiles3S="Sin dato";
					
				}
				
				
				diasHabiles=diasHabiles1S+", " + diasHabiles2S+", "+ diasHabiles3S;
				totalDiasHabiles=diasHabiles1T+diasHabiles2T+diasHabiles3T;
				
				reporteDTO.setInasistencias(diasHabiles);
				reporteDTO.setInasistencasFinales(totalDiasHabiles);
							
							
				// boletin anterior
				
				reporteDTO.setBoletinAnioAnterior(is1.getBoletinAnioAnterior());
				
				Boletin boletinAnioAnterior = is1.getBoletinAnioAnterior();
				
				// previas
							
				List<MateriaDTO> previas = new ArrayList<MateriaDTO>();
				
				if(boletinAnioAnterior.getPrevias() != null && boletinAnioAnterior.getPrevias().size() > 0){			
					List<NotaMateria> notasPreviasMarzo = new ArrayList<NotaMateria>();
					List<NotaMateria> notasPreviasJulio = new ArrayList<NotaMateria>();
					List<NotaMateria> notasPreviasDiciembre = new ArrayList<NotaMateria>();
					
					Trimestre previasJulio = boletinAnioAnterior.getPrevias().get(0);
					Trimestre previasDiciembre = boletinAnioAnterior.getPrevias().get(1);
					Trimestre previasMarzo = boletinAnioAnterior.getPrevias().get(2);
					
					for (NotaMateria notaMateria : previasMarzo.getMaterias()) {
						notasPreviasMarzo.add(notaMateria);
					}
					for (NotaMateria notaMateria : previasJulio.getMaterias()) {
						notasPreviasJulio.add(notaMateria);
					}
					for (NotaMateria notaMateria : previasDiciembre.getMaterias()) {
						notasPreviasDiciembre.add(notaMateria);
					}
					
					for (int i = 0; i < boletinAnioAnterior.getMateriasPrevias().size(); i++) {
						Materia materiaP = boletinAnioAnterior.getMateriasPrevias().get(i);
						MateriaDTO materiaDTO = new MateriaDTO();
						NotaMateria notaMarzo = notasPreviasMarzo.get(i);
						NotaMateria notaJulio = notasPreviasJulio.get(i);
						NotaMateria notaDic = notasPreviasDiciembre.get(i);
											
						if (materiaP.equals(notaMarzo.getMateria())) {
							materiaDTO.setNombre(notaMarzo.getMateria().getNombre());
							materiaDTO.setCiclo(notaMarzo.getCiclo());
							if(CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaMarzo.getCalificacion())
									|| CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaJulio.getCalificacion())
									|| CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaDic.getCalificacion())){
								materiaDTO.setNotaMarzo(notaMarzo.getCalificacion().getValor());
								materiaDTO.setNotaFin(notaJulio.getCalificacion().getValor());
								materiaDTO.setNotaDic(notaDic.getCalificacion().getValor());
							}
							previas.add(materiaDTO);
						}					
					}
				}
				
				
				reporteDTO.setPreviasDTO(previas);
				
							
				// boletin
							
				List<NotaMateria> notasPrimero = new ArrayList<NotaMateria>();
				List<NotaMateria> notasSegundo = new ArrayList<NotaMateria>();
				List<NotaMateria> notasTercero = new ArrayList<NotaMateria>();
				List<NotaMateria> notasFin = new ArrayList<NotaMateria>();
				List<NotaMateria> notasDiciembre = new ArrayList<NotaMateria>();
				List<NotaMateria> notasMarzo = new ArrayList<NotaMateria>();
	
				List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
				
				if (isUnTrimestreConMaterias(boletinAnioAnterior) || isBoletinSinMaterias(boletinAnioAnterior)) {
					
					Trimestre primero = boletinAnioAnterior.getTrimestres().get(0);
					Trimestre segundo = boletinAnioAnterior.getTrimestres().get(1);
					Trimestre tercero = boletinAnioAnterior.getTrimestres().get(2);
					Trimestre fin = boletinAnioAnterior.getTrimestres().get(3);
					Trimestre diciembre = boletinAnioAnterior.getTrimestres().get(4);
					Trimestre marzo = boletinAnioAnterior.getTrimestres().get(5);
					
					for (NotaMateria notaMateria : primero.getMaterias()) {
						notasPrimero.add(notaMateria);
	
					}
					for (NotaMateria notaMateria : segundo.getMaterias()) {
						notasSegundo.add(notaMateria);
					}
					for (NotaMateria notaMateria : tercero.getMaterias()) {
						notasTercero.add(notaMateria);
					}
					for (NotaMateria notaMateria : fin.getMaterias()) {
						notasFin.add(notaMateria);
					}
					for (NotaMateria notaMateria : diciembre.getMaterias()) {
						notasDiciembre.add(notaMateria);
					}
					for (NotaMateria notaMateria : marzo.getMaterias()) {
						notasMarzo.add(notaMateria);
					}
				
					for (int i = 0; i < boletinAnioAnterior.getMaterias().size(); i++) {
						
						Materia materia1 = boletinAnioAnterior.getMaterias().get(i);
						MateriaDTO materiaDTO = new MateriaDTO();
						NotaMateria notaPri = notasPrimero.get(i);
						NotaMateria notaSeg = notasSegundo.get(i);
						NotaMateria notaTerc = notasTercero.get(i);
						NotaMateria notaFin = notasFin.get(i);
						NotaMateria notaDic = notasDiciembre.get(i);
						NotaMateria notaMarzo = notasMarzo.get(i);
					
						if (materia1.equals(notaPri.getMateria())) {
							if(CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaPri.getCalificacion())){
								this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia1);
							}
							else{
								if(CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaSeg.getCalificacion())){
									this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia1);
								}
								else{
									if(CalificacionMateria.getListaCalificacionesAptasParaBoletinExportarIS1().contains(notaTerc.getCalificacion())){
										this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia1);
									}
									else{
										materiaDTO = null;
									}
								}
							}
						}								
						if(materiaDTO != null){
							materias.add(materiaDTO);				
						}							
					}			
				}			
				reporteDTO.setMateriasDto(materias);			
			}
				informesDTO.add(reporteDTO);
				
		}
		return informesDTO;
	}	
	
	
	
	
	private void getMateriaParaBoletinIS1(MateriaDTO materiaDTO, NotaMateria notaPri, NotaMateria notaSeg, 
			NotaMateria notaTerc, NotaMateria notaFin, NotaMateria notaDic, NotaMateria notaMarzo, 
			Materia materiaBoletin){
		
		materiaDTO.setNombre(notaPri.getMateria().getNombre());
		materiaDTO.setNotaPrimero(notaPri.getCalificacion().getValor());
		materiaDTO.setNotaSegundo(notaSeg.getCalificacion().getValor());		
		materiaDTO.setNotaTercero(notaTerc.getCalificacion().getValor());
		materiaDTO.setNotaFin(notaFin.getCalificacion().getValor());
		materiaDTO.setNotaDic(notaDic.getCalificacion().getValor());
		materiaDTO.setNotaMarzo(notaMarzo.getCalificacion().getValor());				
	}
	
	
	
	
		private Boolean isUnTrimestreConMaterias(Boletin boletin)
		{
			Boolean tieneUnTrimestreCargado = false;
				
				Trimestre primero = boletin.getTrimestres().get(0);
				Trimestre segundo = boletin.getTrimestres().get(1);
				Trimestre tercero = boletin.getTrimestres().get(2);
				Trimestre fin = boletin.getTrimestres().get(3);
				Trimestre diciembre = boletin.getTrimestres().get(4);
				Trimestre marzo = boletin.getTrimestres().get(5);
					
				if ((primero.getMaterias().size() != 0)
						|| (segundo.getMaterias().size() != 0)
						|| (tercero.getMaterias().size() != 0)
						|| (fin.getMaterias().size() != 0)
						|| (diciembre.getMaterias().size() != 0)
						|| (marzo.getMaterias().size() != 0)) {
					tieneUnTrimestreCargado = true;
				}
			
			return tieneUnTrimestreCargado;
		}
		
		private Boolean isBoletinSinMaterias(Boletin boletin)
		{
			Trimestre primero = boletin.getTrimestres().get(0);
			Trimestre segundo = boletin.getTrimestres().get(1);
			Trimestre tercero = boletin.getTrimestres().get(2);
			Trimestre fin = boletin.getTrimestres().get(3);
			Trimestre diciembre = boletin.getTrimestres().get(4);
			Trimestre marzo = boletin.getTrimestres().get(5);
			Boolean boletinSinMaterias = false;
			
			if((primero.getMaterias().size() != 0) && (segundo.getMaterias().size() != 0) 
				&& (tercero.getMaterias().size() != 0) && (fin.getMaterias().size() != 0) && (diciembre.getMaterias().size() != 0)
				&& (marzo.getMaterias().size() != 0))
			{
				boletinSinMaterias = true;
			}
			return boletinSinMaterias;
		}
		
		
	private String obtenerMateriaSeleccionada(List<Materia> listaMaterias, Long pos){
		int i = 0;
		String materia = "";
		boolean encontro = false;
		while (i< listaMaterias.size() && !encontro) {
			if(listaMaterias.get(i).getId().equals(pos)){
				materia = listaMaterias.get(i).getNombre();
				encontro = true;
			}
			i++;
		}
		return materia;
	}
	
	private String parsearListaEspacios(List<EspacioApoyo> espacioApoyo) {
		StringBuffer valor = new StringBuffer("");
		if(!espacioApoyo.isEmpty()){
			for (EspacioApoyo espacio : espacioApoyo) {
				valor.append( espacio.getValor().toLowerCase() + ", ");			
			}
			valor.replace(0, espacioApoyo.get(0).getValor().length(), espacioApoyo.get(0).getValor());		
			valor.deleteCharAt(valor.lastIndexOf(","));
			valor.deleteCharAt(valor.length() - 1);
			valor.append(".");			
		}
		return valor.toString();
	}
	
}
