package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.ConvocadoDao;
import org.cimientos.intranet.dto.ConvocadoDTO;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.candidato.convocatoria.Convocatoria;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.displaytag.properties.SortOrderEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cimientos.intranet.enumerativos.AnioEscolar;
import com.cimientos.intranet.enumerativos.RecomendacionesTS;
import com.cimientos.intranet.enumerativos.entrevista.MotivoEnvioTS;


@Service
@Transactional
public class ConvocadoSrv {
	
	@Autowired
	private ConvocadoDao convocadoDao;
	
	/**
	 * Lista convocados.
	 *
	 * @return the list
	 * @since 15-mar-2011
	 * @author cfigueroa
	 * @param recomendacionesTS 
	 * @param motivoEnvioTS 
	 * @param ts 
	 * @param estadoAlumno 
	 * @param nombreAlumno 
	 * @param convocatoria 
	 * @param escuela 
	 * @param zona 
	 * @param cicloPrograma 
	 * @param list 
	 * @param anio 
	 */
	public List<ConvocadoDTO> listaConvocados(int firstResult, int maxResults,
            								 SortOrderEnum sortDirection, String sortCriterion, 
            								 List<EstadoAlumno> list, CicloPrograma cicloPrograma, 
            								 ZonaCimientos zona, Escuela escuela, 
            								 Convocatoria convocatoria, String nombreAlumno, 
            								 EstadoAlumno estadoAlumno, PerfilTS ts, 
            								 MotivoEnvioTS motivoEnvioTS, 
            								 RecomendacionesTS recomendacionesTS, AnioEscolar anio, String eae){
		
		
		
		return convocadoDao.listaConvocados(firstResult,maxResults,sortDirection,sortCriterion,
											list,cicloPrograma,zona,escuela,convocatoria,nombreAlumno,estadoAlumno,ts,motivoEnvioTS,recomendacionesTS,anio,eae);
	}
	
	/**
	 * Cantidad convocado.
	 *
	 * @return the integer
	 * @since 28-abr-2011
	 * @author cfigueroa
	 * @param list 
	 * @param recomendacionesTS 
	 * @param motivoEnvioTS 
	 * @param ts 
	 * @param estadoAlumno 
	 * @param nombreAlumno 
	 * @param convocatoria 
	 * @param escuela 
	 * @param zona 
	 * @param cicloPrograma 
	 * @param anio 
	 */
	public Integer cantidadConvocado(List<EstadoAlumno> list, CicloPrograma cicloPrograma, ZonaCimientos zona, 
									 Escuela escuela, Convocatoria convocatoria, 
									 String nombreAlumno, EstadoAlumno estadoAlumno, 
									 PerfilTS ts, MotivoEnvioTS motivoEnvioTS, 
									 RecomendacionesTS recomendacionesTS, AnioEscolar anio, String eae){
		return convocadoDao.cantidadConvocados(list,cicloPrograma,zona,escuela,convocatoria,nombreAlumno,estadoAlumno,ts,motivoEnvioTS,recomendacionesTS,anio,eae);
	}
}
