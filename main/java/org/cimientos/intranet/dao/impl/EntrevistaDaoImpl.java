package org.cimientos.intranet.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.log4j.Logger;
import org.cimientos.intranet.dao.EntrevistaDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.EstadoCiclo;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.Entrevista;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaFinal;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaGrupal;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaReIncorporacion;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaRenovacion;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.displaytag.properties.SortOrderEnum;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cimientos.intranet.enumerativos.AnioEscolar;
import com.cimientos.intranet.enumerativos.SituacionEscolarMergeada;
import com.cimientos.intranet.enumerativos.entrevista.EstadoEntrevista;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionCobroBeca;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionIncorporacion;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionFinal;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionMergeada;
import com.cimientos.intranet.enumerativos.entrevista.FormaEntrevista;
import com.cimientos.intranet.enumerativos.entrevista.MotivoCesacion;
import com.cimientos.intranet.enumerativos.entrevista.MotivoIncorporacionPendiente;
import com.cimientos.intranet.enumerativos.entrevista.MotivoNoRenovacion;
import com.cimientos.intranet.enumerativos.entrevista.MotivoPendiente;
import com.cimientos.intranet.enumerativos.entrevista.MotivoSuspension;
import com.cimientos.intranet.enumerativos.entrevista.TipoEntrevista;
import com.cimientos.intranet.enumerativos.entrevista.motivoNoIncorporacion;

@Repository
public class EntrevistaDaoImpl extends SpringHibernateDao<Entrevista> implements EntrevistaDao{
	private static final Logger log = Logger.getLogger(EntrevistaDaoImpl.class);

	@Autowired
	public EntrevistaDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<Entrevista> getObjetoManejado() {
		return Entrevista.class;
	}

	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasIndividuales() {
		return getHibernateTemplate().loadAll(EntrevistaIndividual.class);
	}

	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasAAprobar(Long idRR) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		//las entrevistas en estado supervisor
		criteria.add(Restrictions.eq("estadoEntrevista", EstadoEntrevista.SUPERVISOR));
		criteria.add(Restrictions.eq("rr.id", idRR));
		return criteria.list();
	}

	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasIndividualesPorId(Long idAlumno, List<Long> periodos) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("perfilAlumno.id", idAlumno));
		criteria.add(Restrictions.in("periodoDePago.id", periodos));
		return criteria.list();
	}

	@Override
	public EntrevistaIndividual obtenerEntrevistasIndividualesPorAlumno(Long idAlumno,EstadoAlumno estado, CicloPrograma cicloPrograma) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("perfilAlumno.id", idAlumno));
		criteria.add(Restrictions.eq("evaluacionCobroBeca", EvaluacionCobroBeca.CESADO));
		criteria.add(Restrictions.in("periodoDePago", cicloPrograma.getPeriodos()));
		List<EntrevistaIndividual> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (EntrevistaIndividual) result.get(0);	
		}
	}
	
	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasPorId(String string,List<Long> entrevistasIds) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.in("id", entrevistasIds));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public EntrevistaIndividual obtenerInformeCesacion(Long idBecado) 
	{
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("perfilAlumno.id", idBecado));
		criteria.add(Restrictions.eq("estadoEntrevista", EstadoEntrevista.FINALIZADA));
		criteria.add(Restrictions.eq("evaluacionCobroBeca", EvaluacionCobroBeca.CESADO));
		criteria.add(Restrictions.isNotNull("compromisoRA"));
		criteria.add(Restrictions.isNotNull("motivoCesacion"));
		criteria.add(Restrictions.isNotNull("fechaEntrevista"));
		List<EntrevistaIndividual> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (EntrevistaIndividual) result.get(0);	
		}
		
		
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EntrevistaDao#obtenerEntrevistasGrupales()
	 */
	@Override
	public List<EntrevistaGrupal> obtenerEntrevistasGrupales() {
		return getHibernateTemplate().loadAll(EntrevistaGrupal.class);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EntrevistaDao#obtenerEntrevistaGrupal(java.lang.Long)
	 */
	@Override
	public EntrevistaGrupal obtenerEntrevistaGrupal(Long id) {
		return getHibernateTemplate().load(EntrevistaGrupal.class, id);
	}

	@Override
	public List<EntrevistaGrupal> obtenerEntrevistasGrupalesPorEa(Long idPerfilEA, CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(EntrevistaGrupal.class);
		criteria.add(Restrictions.eq("ea.id", idPerfilEA));
		//criteria.add(Restrictions.ge("fechaEntrevista", cicloActual.getFechaInicio()));
		//criteria.add(Restrictions.le("fechaEntrevista", cicloActual.getFechaFin()));
		criteria.createAlias("ea.datosPersonales", "datosPersonales");
		criteria.addOrder(Order.desc("fechaEntrevista")).addOrder(Order.asc("datosPersonales.apellido"));
		return criteria.list();
	}
	
	@Override
	public List<EntrevistaGrupal> obtenerEntrevistasGrupalesTodas(CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(EntrevistaGrupal.class);
		
		criteria.add(Restrictions.ge("fechaEntrevista", cicloActual.getFechaInicio()));
		criteria.add(Restrictions.le("fechaEntrevista", cicloActual.getFechaFin()));
		
		criteria.addOrder(Order.desc("fechaEntrevista"));
		return criteria.list();
	}

	@Override
	public List<EntrevistaIndividual> obtenerEntrevistaPorTipo(Long id,List<Long> periodosIds, TipoEntrevista tipo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.in("periodoDePago.id", periodosIds));
		criteria.add(Restrictions.eq("tipoEntrevista", tipo));
		criteria.add(Restrictions.eq("perfilAlumno.id", id));
		return criteria.list();
	}

	@Override
	public List<EntrevistaIndividual> obtenerEntrevistaPorTipo(Long idPerfilAlumno,	TipoEntrevista tipo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("tipoEntrevista", tipo));
		criteria.add(Restrictions.eq("perfilAlumno.id", idPerfilAlumno));
		return criteria.list();
	}

	@Override
	public List<EntrevistaIndividual> obtenerTodasEntrevistasPorEa(Long idEA, List<Long> periodosIds) {
		List<EstadoAlumno> estados = new ArrayList<EstadoAlumno>();
		estados.add(EstadoAlumno.CESADO);
		estados.add(EstadoAlumno.NO_INCORPORADO);
		estados.add(EstadoAlumno.NO_RENOVADO);
		estados.add(EstadoAlumno.EGRESADO);
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("perfilAlumno", "perfilAlumno");
		criteria.add(Restrictions.in("periodoDePago.id", periodosIds));
		criteria.add(Restrictions.eq("ea.id", idEA));
		criteria.add(Restrictions.not(Restrictions.in("perfilAlumno.estadoAlumno", estados)));
		return criteria.list();
	}

	@Override
	public EntrevistaIndividual obtenerUltimaEntrevista(PerfilAlumno p,	List<Long> periodosIds) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("periodoDePago", "periodoDePago");
		criteria.add(Restrictions.in("periodoDePago.id", periodosIds));
		criteria.add(Restrictions.eq("perfilAlumno", p));
		criteria.addOrder(Order.desc("periodoDePago.fechaInicio"));
		List<EntrevistaIndividual> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (EntrevistaIndividual) result.get(0);	
		}
	}

	@Override
	public EntrevistaIndividual obtenerEntrevistasCesacion(Long idPerfilAlumno,CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("perfilAlumno.id", idPerfilAlumno));
		criteria.add(Restrictions.eq("evaluacionCobroBeca", EvaluacionCobroBeca.CESADO));
		List<EntrevistaIndividual> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (EntrevistaIndividual) result.get(0);	
		}
	}

	@Override
	public EntrevistaIndividual obtenerEntrevistasIncorporacion(Long idPerfilAlumno, CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(EntrevistaReIncorporacion.class);
		criteria.add(Restrictions.eq("perfilAlumno.id", idPerfilAlumno));
		criteria.add(Restrictions.eq("incorporacion", EvaluacionIncorporacion.NOINCORPORA));
		List<EntrevistaIndividual> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (EntrevistaIndividual) result.get(0);	
		}
	}

	@Override
	public EntrevistaIndividual obtenerEntrevistasRenovacion(Long idPerfilAlumno, CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(EntrevistaRenovacion.class);
		criteria.add(Restrictions.eq("perfilAlumno.id", idPerfilAlumno));		
//		criteria.add(Restrictions.eq("evaluacionRenovacion", EvaluacionRenovacion.NORENUEVA));
		criteria.add(Restrictions.eq("evaluacionRenovacionMergeada", EvaluacionRenovacionMergeada.NO_RENUEVA));
		List<EntrevistaIndividual> result = criteria.list();
		if(result.isEmpty()){
			criteria = getSession().createCriteria(EntrevistaFinal.class);
			criteria.add(Restrictions.eq("perfilAlumno.id", idPerfilAlumno));		
			criteria.add(Restrictions.or(Restrictions.eq("evaluacionRenovacionFinal", EvaluacionRenovacionFinal.NO_RENUEVA),
					Restrictions.eq("evaluacionRenovacionFinal", EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE)));
			result = criteria.list();
			if(!result.isEmpty())
				return (EntrevistaIndividual) result.get(0);
			else
				return null;
		}else{
			return (EntrevistaIndividual) result.get(0);	
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EntrevistaDao#obtenerEntrevistasAExportar()
	 */
	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasAExportar(List<CicloPrograma> ciclo, List<Integer > tipoId, List<Integer> idEstado, List<Integer> idSituacion, 
			List<Long> idPeriodo, 
			Integer idForma, Long padrinoId, Long zonaId, Long rrId, Long eaId, String nombreAlumno, List<Integer> anio, Boolean adicional,
			Long escuelaId, List <Integer> idsEstadoRenovacion, List<Integer >idsMotivoNoRenovacion,
			List <Integer> idsMotivoPendiente, List <Integer> idsMotivoSuspension, List <Integer> idsMotivoCesacion,
			List <Integer> idsEstadoIncorporacion, List <Integer> idsMotivoIncorporacionPendiente, List <Integer> idsMotivoNoIncorporacion,
			List <Integer> idsEstadoEntrevista, List <Integer> idsSituacioneEscolares,			
			int firstResult, int maxResults,SortOrderEnum sortDirection, String sortCriterion, String eae) {
		
		DetachedCriteria criteria = getCriteriaEntrevistasAExportar(ciclo, tipoId, idEstado, idSituacion, idPeriodo, idForma, padrinoId,
				zonaId, rrId, eaId, nombreAlumno, anio, adicional, 
				escuelaId, idsEstadoRenovacion, idsMotivoNoRenovacion,idsMotivoPendiente, idsMotivoSuspension, idsMotivoCesacion, idsEstadoIncorporacion, 
				idsMotivoIncorporacionPendiente, idsMotivoNoIncorporacion, idsEstadoEntrevista, idsSituacioneEscolares,eae);
		
		if (sortCriterion != null) {
            if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
                criteria.addOrder(Order.asc(sortCriterion));
            }
            if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
                criteria.addOrder(Order.desc(sortCriterion));
            }
        }
		return getHibernateTemplate().findByCriteria(criteria,firstResult, maxResults);
	}


	@Override
	public int obtenerCantidadEntrevistasAExportar(List<CicloPrograma> ciclo, List<Integer > tipoId, 
			List<Integer> idEstado, List<Integer> idSituacion, List<Long> idPeriodo, Integer idForma, Long padrinoId, Long zonaId, Long rrId, Long eaId,
			String nombreAlumno, List<Integer> anio, Boolean adicional, 
			Long escuelaId, List <Integer> idsEstadoRenovacion, List<Integer >idMotivoNoRenovacion,
			List <Integer> idsMotivoPendiente, List <Integer> idsMotivoSuspension, List <Integer> idsMotivoCesacion,
			List <Integer> idsEstadoIncorporacion, List <Integer> idsMotivoIncorporacionPendiente, List <Integer> idsMotivoNoIncorporacion,
			List <Integer> idsEstadoEntrevista, List <Integer> idsSituacioneEscolares, String eae
			) {
		DetachedCriteria criteria = getCriteriaEntrevistasAExportar(ciclo, tipoId, idEstado, idSituacion, idPeriodo, idForma, padrinoId, zonaId,
				rrId, eaId, nombreAlumno, anio, adicional, 
				escuelaId, idsEstadoRenovacion, idMotivoNoRenovacion, idsMotivoPendiente, idsMotivoSuspension, idsMotivoCesacion, idsEstadoIncorporacion, 
				idsMotivoIncorporacionPendiente, idsMotivoNoIncorporacion, idsEstadoEntrevista, idsSituacioneEscolares,eae);
		
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}
	
	/**
	 * Obtiene la cantidad total de entrevistas a exportar
	 * @param ciclo
	 * @param nombreAlumno 
	 * @param adicional 
	 * @param anio 
	 * @return
	 */
	private DetachedCriteria getCriteriaEntrevistasAExportar(List<CicloPrograma> ciclo, List<Integer> tipoId, List<Integer> idEstado, List<Integer> idSituacion, 
			List<Long> idPeriodo, Integer idForma, Long padrinoId, Long zonaId, Long rrId, Long eaId, String nombreAlumno, List<Integer> anio, Boolean adicional,
			Long escuelaId, List <Integer> idsEstadoRenovacion, List<Integer >idsMotivoNoRenovacion,
			List <Integer> idsMotivoPendiente, List <Integer> idsMotivoSuspension, List <Integer> idsMotivoCesacion,
			List <Integer> idsEstadoIncorporacion, List <Integer> idsMotivoIncorporacionPendiente, List <Integer> idsMotivoNoIncorporacion,
			List <Integer> idsEstadoEntrevista, List <Integer> idsSituacionesEscolares, String eae){
		
		DetachedCriteria criteria = null;
		criteria = DetachedCriteria.forClass(EntrevistaIndividual.class);
		
		//Si elegi un solo tipo, elijo el tipo de entidad correspondiente
		if (tipoId!=null && tipoId.size()==1){			
			if (TipoEntrevista.getTipoEntrevista(tipoId.get(0))==TipoEntrevista.FINAL){
				criteria = DetachedCriteria.forClass(EntrevistaFinal.class);
				//Filtro estadoRenovacion
				if(idsEstadoRenovacion != null){
					criteria.add(Restrictions.in("evaluacionRenovacionFinal", EvaluacionRenovacionMergeada.getEvaluacionesRenovacionMergeada(idsEstadoRenovacion)));
				}				
			}
			else 
				if (TipoEntrevista.getTipoEntrevista(tipoId.get(0))==TipoEntrevista.INCORPORACION){
					criteria = DetachedCriteria.forClass(EntrevistaReIncorporacion.class);
				} 
				else 
					if (TipoEntrevista.getTipoEntrevista(tipoId.get(0))==TipoEntrevista.RENOVACION){
						criteria = DetachedCriteria.forClass(EntrevistaRenovacion.class);

						//Filtro estadoRenovacion
						if(idsEstadoRenovacion != null){
							criteria.add(Restrictions.in("evaluacionRenovacionMergeada", EvaluacionRenovacionMergeada.getEvaluacionesRenovacionMergeada(idsEstadoRenovacion)));
						}
					}
		}
		
		if(ciclo != null && ciclo.size()>0){
			criteria.createAlias("periodoDePago", "periodo");
			criteria.add(Restrictions.in("periodo.ciclo", ciclo));
		}
		
		if(eae!= null){
			if(eae.equals("todos") ){
				eae=null;
			}
		}
						
		
		
		if(tipoId != null){
			criteria.add(Restrictions.in("tipoEntrevista", TipoEntrevista.getTiposEntrevista(tipoId)));
		}
		
		if(idEstado != null){
			criteria.add(Restrictions.in("evaluacionCobroBeca", EvaluacionCobroBeca.getEvaluacionesCobroBeca(idEstado)));
		}

		if(idSituacion != null){
			final org.hibernate.type.Type[] types = new org.hibernate.type.Type[idSituacion.size()];
			Arrays.fill(types, org.hibernate.Hibernate.INTEGER);
			
			Integer[] idsLocalSituacion = new Integer[idSituacion.size()];
			final StringBuilder questionMarks= new StringBuilder();

			for (int i=0; i<idSituacion.size(); i++){
				//Restar -1 xq son enumerativos
				idsLocalSituacion[i] = idSituacion.get(i)-1;
				
				if (i>0) 
					questionMarks.append(",");
				questionMarks.append("?");				
			}
			criteria.add(Restrictions.sqlRestriction("{alias}.id in (select id_entrevista from situacion_crisis crisis where id_entrevista = {alias}.id and situacion in ("+questionMarks+") )", 
							idsLocalSituacion, types));
		}
		
		if(idPeriodo != null && idPeriodo.size() > 0){
			criteria.add(Restrictions.in("periodoDePago.id", idPeriodo));
		}

		if(padrinoId != null){
			criteria.createAlias("exportacionEspecial", "exportacion");
			criteria.add(Restrictions.eq("exportacion.idPadrino", padrinoId));
		}
		if(idForma != null){
			if(idForma.equals(FormaEntrevista.GRUPAL.getId())){
				criteria.add(Restrictions.isNotNull("entrevistaGrupal"));
			}else {
				criteria.add(Restrictions.isNull("entrevistaGrupal"));
			}
		}

		criteria.createAlias("escuelaAlumno", "escuela");
		if(zonaId != null){
			criteria.createAlias("escuela.localidad", "localidad");
			criteria.createAlias("localidad.zona", "zona");
			criteria.add(Restrictions.eq("zona.id", zonaId));
		}
		if(rrId != null){
			criteria.createAlias("rr", "rr");
			criteria.add(Restrictions.eq("rr.idPerfilRR", rrId));
		}
		if(eaId != null){
			criteria.createAlias("ea", "ea");
			criteria.add(Restrictions.eq("ea.idPerfilEA", eaId));
		}
		
		criteria.createAlias("perfilAlumno", "alumno");
		criteria.add(Restrictions.isNotNull("alumno.datosPersonales"));
		if(eae!= null ){	
			criteria.add(Restrictions.eq("alumno.eae",eae));
		}
		if(nombreAlumno != null){
			criteria.createAlias("alumno.datosPersonales", "persona");
			for ( String split : nombreAlumno.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("persona.nombre", "%"+split+"%"), Restrictions.like("persona.apellido", "%"+split+"%")));
		}
		
		if(anio != null){
			criteria.add(Restrictions.in("anioEscolar", AnioEscolar.getAniosEscolares(anio)));
		}
		
		if(adicional != null)
			criteria.add(Restrictions.eq("alumno.anioAdicional", adicional));
		
		if (escuelaId != null){
			criteria.add(Restrictions.eq("escuela.id", escuelaId));
		}
		
		//Filtro estadoRenovacion
		//Sube a tipo de entrevista xq son campos diferentes segun sea entrevista final o renovacion
//		if(idsEstadoRenovacion != null){
//			criteria.add(Restrictions.in("evaluacionRenovacionMergeada", EvaluacionRenovacionMergeada.getEvaluacionesRenovacionMergeada(idsEstadoRenovacion)));
//		}
		
		//Filtro motivosNoRenovacion
		if(idsMotivoNoRenovacion != null){
			criteria.add(Restrictions.in("motivoNoRenovacion", MotivoNoRenovacion.getMotivosNoRenovacion(idsMotivoNoRenovacion)));
		}

		//Filtro motivosPendiente
		if(idsMotivoPendiente != null){
			criteria.add(Restrictions.in("motivoPendiente", MotivoPendiente.getMotivosPendientes(idsMotivoPendiente)));
		}
		
		//Filtro motivosSuspension
		if(idsMotivoSuspension != null){
			criteria.add(Restrictions.eq("evaluacionCobroBeca", EvaluacionCobroBeca.SUSPENDIDO));		//Tambien filtrar x esta property??
			criteria.add(Restrictions.in("motivoSuspension", MotivoSuspension.getMotivosSuspension(idsMotivoSuspension)));
		}

		//Filtro motivosCesacion
		if(idsMotivoCesacion != null){
			criteria.add(Restrictions.eq("evaluacionCobroBeca", EvaluacionCobroBeca.CESADO));		//Tambien filtrar x esta property??
			criteria.add(Restrictions.in("motivoCesacion", MotivoCesacion.getMotivosCesacion(idsMotivoCesacion)));
		}

		//Filtro estadosIncorporacion
		if(idsEstadoIncorporacion != null){
			criteria.add(Restrictions.in("incorporacion", EvaluacionIncorporacion.getEvaluacionesIncorporacion(idsEstadoIncorporacion)));
		}

		//Filtro MotivoIncorporacionPendiente
		if(idsMotivoIncorporacionPendiente != null){
			criteria.add(Restrictions.in("motivoPendiente", MotivoIncorporacionPendiente.getMotivosIncorporacionPendiente(idsMotivoIncorporacionPendiente)));
		}

		//Filtro MotivoNoIncorporacion
		if(idsMotivoNoIncorporacion != null){
			criteria.add(Restrictions.in("motivoNoIncorporacion", motivoNoIncorporacion.getMotivosNoIncorporacion(idsMotivoNoIncorporacion)));
		}
		
		//Filtro EstadoEntrevista
		if(idsEstadoEntrevista != null){
			criteria.add(Restrictions.in("estadoEntrevista", EstadoEntrevista.getEstadosEntrevista(idsEstadoEntrevista)));
		}

		//Filtro EstadoEntrevista
		if(idsSituacionesEscolares != null){
			criteria.add(Restrictions.in("situacionEscolarMergeada", SituacionEscolarMergeada.getSituacionesEscolares(idsSituacionesEscolares)));
		}
		
		return criteria;

	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EntrevistaDao#obtenerEntrevistasInconclusasAlumnosEa(org.cimientos.intranet.modelo.perfilEA.PerfilEA, java.util.List)
	 */
	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasInconclusasAlumnosEa(
			PerfilEA eaAnterior, List<Long> idAlumnos) {
		EstadoEntrevista[] estadosInconclusos = new EstadoEntrevista[]{EstadoEntrevista.CONSTRUCCION, EstadoEntrevista.SUPERVISOR};
		Criteria criteria = getSession().createCriteria(EntrevistaIndividual.class);
		criteria.add(Restrictions.eq("ea", eaAnterior));
		criteria.add(Restrictions.in("perfilAlumno.id", idAlumnos));
		criteria.add(Restrictions.in("estadoEntrevista", estadosInconclusos));
		return criteria.list();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EntrevistaDao#obtenerEntrevistasInconclusasEasRR(org.cimientos.intranet.modelo.perfilRR.PerfilRR, java.util.List)
	 */
	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasInconclusasEasRR(
			PerfilRR rrAnterior, List<Long> easIds) {
		EstadoEntrevista[] estadosInconclusos = new EstadoEntrevista[]{EstadoEntrevista.CONSTRUCCION, EstadoEntrevista.SUPERVISOR};
		Criteria criteria = getSession().createCriteria(EntrevistaIndividual.class);
		criteria.add(Restrictions.eq("rr", rrAnterior));
		criteria.add(Restrictions.in("ea.id", easIds));
		criteria.add(Restrictions.in("estadoEntrevista", estadosInconclusos));
		return criteria.list();
	}
	
	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasCesacionPorZonaCicloPeriodo(Long idZona, Long cicloActual, Long periodo) 
	{
		
		String sql = " select entrevista.id, b.id, z.id, ee.id, c.id "+
					 " from entrevista join exportacion_especial as ee on entrevista.exportacion_especial = ee.id " + 
					 " join beca as b on ee.id_beca = b.id " +
					 " join zona_cimientos as z on z.id = b.zona " +
					 " join ciclo_programa as c on c.id = b.ciclo " +
					 " where entrevista.tipo = 'individual' " +
					 " and entrevista.evaluacion_cobro_beca = 3 and b.periodo_pago = " + periodo + " and b.ciclo = " + cicloActual + 
					 " and b.zona = " + idZona;
		

		SQLQuery query = getSession().createSQLQuery(sql);
		return query.list();
		
	}

	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasConPagoSuspendidoPorAlumno(Long idAlumno) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("perfilAlumno.id", idAlumno));
		criteria.add(Restrictions.eq("evaluacionCobroBeca", EvaluacionCobroBeca.SUSPENDIDO));
		criteria.createAlias("periodoDePago", "periodo");
		criteria.createAlias("periodo.ciclo", "ciclo");
		criteria.add(Restrictions.eq("ciclo.estado", EstadoCiclo.ACTUAL));
		criteria.add(Restrictions.eq("estadoEntrevista", EstadoEntrevista.FINALIZADA));
		return criteria.list();
	}
	
	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasPorAlumno(Long idAlumno, CicloPrograma cicloPrograma, String orden) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("perfilAlumno.id", idAlumno));
		criteria.add(Restrictions.in("periodoDePago", cicloPrograma.getPeriodos()));
		if(orden.equals("descendiente"))
			criteria.addOrder(Order.desc("fechaCarga"));
		else
			criteria.addOrder(Order.asc("fechaCarga"));
		return  criteria.list();
		
	}
	
	@Override
	public List<EntrevistaGrupal> obtenerEntrevistasGrupalesPorRR(Long idPerfilRR, CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(EntrevistaGrupal.class);
		criteria.add(Restrictions.eq("rr.id", idPerfilRR));
		criteria.add(Restrictions.ge("fechaEntrevista", cicloActual.getFechaInicio()));
		criteria.add(Restrictions.le("fechaEntrevista", cicloActual.getFechaFin()));
		criteria.createAlias("rr.datosPersonales", "datosPersonales");
		criteria.addOrder(Order.desc("fechaEntrevista")).addOrder(Order.asc("datosPersonales.apellido"));
		return criteria.list();
	}
	
	@Override
	public List<EntrevistaIndividual> obtenerEntrevistasMensualesPorAlumno(Long idAlumno, CicloPrograma cicloPrograma) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		TipoEntrevista[] tiposEntrevista = new TipoEntrevista[]{TipoEntrevista.MENSUAL, TipoEntrevista.FINAL};
		criteria.add(Restrictions.eq("perfilAlumno.id", idAlumno));
		criteria.add(Restrictions.in("periodoDePago", cicloPrograma.getPeriodos()));
		criteria.add(Restrictions.in("tipoEntrevista", tiposEntrevista));
		return  criteria.list();
		
	}
	
	@Override
	public void guardarEntrevistas(List<EntrevistaIndividual> entrevistas) {
		getHibernateTemplate().saveOrUpdateAll(entrevistas);
	}
	
	@Override
	public List<EntrevistaIndividual> obtenerTodasEntrevistasPorAlumno(Long idAlumno, String orden) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("perfilAlumno.id", idAlumno));
		if(orden.equals("descendiente"))
			criteria.addOrder(Order.desc("fechaCarga"));
		else
			criteria.addOrder(Order.asc("fechaCarga"));
		return  criteria.list();
	}

}
