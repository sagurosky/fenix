package org.cimientos.intranet.dao.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.InformeDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.utils.ConstantesInformes;
import org.cimientos.intranet.web.controller.EnvioInformeDTO;
import org.displaytag.properties.SortOrderEnum;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cimientos.intranet.enumerativos.AnioEscolar;

/**
 * @author plabaronnie
 *
 */
@Repository
public class InformeDaoImpl extends SpringHibernateDao<Informe> implements InformeDao {

	@Autowired
	public InformeDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		
	}

	@Override
	protected Class<Informe> getObjetoManejado() {
		return Informe.class;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.InformeDao#obtenerInformesPendientes()
	 */
	@Override
	public List<Informe> obtenerInformesPendientes(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		//el informe no debe estar en estado enviado
		criteria.add(Restrictions.ne("estado", EstadoInforme.ENVIADO));
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public  List<EnvioInformeDTO> obtenerInformesAEnviarAPadrinosFiltradosIndividuales(Long padrino, Long zonaId, Long estadoInformeId, String tipoInforme,
			CicloPrograma ciclo,int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		
		final DetachedCriteria criteria = DetachedCriteria.forClass(Informe.class);
		
		List<EstadoInforme> estadosEnviables = new ArrayList<EstadoInforme>();

		criteria.createAlias("becado", "becado");
		criteria.createAlias("beca", "beca");
		criteria.createAlias("beca.padrino", "padrino");
		if(ciclo != null)
			criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("padrino.tipo", TipoPadrino.INDIVIDUAL));
		criteria.add(Restrictions.eq("padrino.recibeInformesMasivos", true));
		criteria.setProjection(Projections.projectionList()
				.add(Projections.groupProperty("beca").as("beca"))
				.add(Projections.groupProperty("estado").as("estadoInforme"))
				.add(Projections.groupProperty("nombre").as("nombreInforme"))
				.add(Projections.rowCount(),"cantidad")).addOrder(Order.asc("beca.id"));

		
		//Filtro PADRINO
		if(padrino != null ){
			criteria.add(Restrictions.eq("padrino.id", padrino));
		}
		
		//Filtro ZONA
		if(zonaId != null){
			criteria.createAlias("beca.zona", "zonaBeca");
			criteria.add(Restrictions.eq("zonaBeca.id", zonaId));
		}
		
		//Filtro TIPOINFORME
		if((tipoInforme != null ) && (!"".equals(tipoInforme))){
			criteria.add(Restrictions.eq("nombre", getTipoInformeCriteria(tipoInforme)));
		}
		
		//Filtro ESTADOINFORME
		if(estadoInformeId != null){
			Integer estadoId = estadoInformeId.intValue();
			if (EstadoInforme.FINALIZADO.getId() == estadoId || EstadoInforme.NO_ENVIADO.getId() == estadoId || EstadoInforme.ENVIADO.getId() == estadoId){
				if (EstadoInforme.FINALIZADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estado",EstadoInforme.FINALIZADO));	
				}else if (EstadoInforme.ENVIADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estado",EstadoInforme.ENVIADO));
				}else if (EstadoInforme.NO_ENVIADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estado",EstadoInforme.NO_ENVIADO));
				}
			}else if (estadoId == 0){
				estadosEnviables.add(EstadoInforme.FINALIZADO);
				estadosEnviables.add(EstadoInforme.ENVIADO);
				estadosEnviables.add(EstadoInforme.NO_ENVIADO);
				criteria.add(Restrictions.in("estado",estadosEnviables));
			}
		}else{
			estadosEnviables.add(EstadoInforme.FINALIZADO);
			estadosEnviables.add(EstadoInforme.ENVIADO);
			estadosEnviables.add(EstadoInforme.NO_ENVIADO);
			criteria.add(Restrictions.in("estado",estadosEnviables));
		}
		
		if (sortCriterion != null) {
            if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
                criteria.addOrder(Order.asc(sortCriterion));
            }
            if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
                criteria.addOrder(Order.desc(sortCriterion));
            }
        }
		
	    criteria.setResultTransformer(Transformers.aliasToBean(EnvioInformeDTO.class));
		List<EnvioInformeDTO> informes = getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
		return informes;
	}

	@Override
	public List<Informe> obtenerInformesAAprobar(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		List<EstadoInforme> estadosEnviables = new ArrayList<EstadoInforme>();
		estadosEnviables.add(EstadoInforme.CORRECTORA);
		criteria.add(Restrictions.in("estado",estadosEnviables));
		List<Informe> informes = criteria.list();
		return informes;
	}

	@Override
	public List<Informe> obtenerInformesARevisar(PerfilRR rr,CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		List<EstadoInforme> estadosEnviables = new ArrayList<EstadoInforme>();
		estadosEnviables.add(EstadoInforme.REVISION);
		criteria.add(Restrictions.in("estado",estadosEnviables));
		criteria.add(Restrictions.eq("rrPerfil", rr));
		criteria.add(Restrictions.ne("nombre", ConstantesInformes.nombreInformeFP));
		criteria.add(Restrictions.ne("nombre", ConstantesInformes.nombreInformeIS1));
		List<Informe> informes = criteria.list();
		return informes;
	}

	@Override
	public List<Informe> obtenerInformesASupervisarYRevisar(PerfilRR rr,CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		List<EstadoInforme> estadosEnviables = new ArrayList<EstadoInforme>();
		estadosEnviables.add(EstadoInforme.SUPERVISOR);
		estadosEnviables.add(EstadoInforme.REVISION);
		criteria.add(Restrictions.in("estado",estadosEnviables));
		criteria.add(Restrictions.eq("rrPerfil", rr));
		criteria.add(Restrictions.ne("nombre", ConstantesInformes.nombreInformeFP));
		List<Informe> informes = criteria.list();
		return informes;
	}

	@Override
	public List<Informe> obtenerInformesConstruccion(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		List<EstadoInforme> estadosEnviables = new ArrayList<EstadoInforme>();	
		estadosEnviables.add(EstadoInforme.CONSTRUCCION);
		criteria.add(Restrictions.in("estado",estadosEnviables));
		List<Informe> informes = criteria.list();
		return informes;
	}

	@Override
	public List<Informe> obtenerTodosInformesPorEA(Long idEA, CicloPrograma ciclo, String nombre) {
		List<EstadoAlumno> estados = new ArrayList<EstadoAlumno>();
		estados.add(EstadoAlumno.CESADO);
		estados.add(EstadoAlumno.NO_INCORPORADO);
		estados.add(EstadoAlumno.NO_RENOVADO);
		estados.add(EstadoAlumno.EGRESADO);
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("becado", "becado");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("eaPerfil.id", idEA));
		criteria.add(Restrictions.eq("nombre", nombre));
		criteria.add(Restrictions.not(Restrictions.in("becado.estadoAlumno", estados)));
		return criteria.list();
	}

	@Override
	public List<Informe> obtenerInformesConstruccionPorEA(PerfilEA perfilEA,CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		List<EstadoInforme> estadosEnviables = new ArrayList<EstadoInforme>();
		estadosEnviables.add(EstadoInforme.CONSTRUCCION);
		criteria.add(Restrictions.in("estado",estadosEnviables));
		criteria.add(Restrictions.eq("eaPerfil", perfilEA));
		criteria.add(Restrictions.ne("nombre", ConstantesInformes.nombreInformeFP));
		List<Informe> informes = criteria.list();
		return informes;
	}

	@Override
	public List<EnvioInformeDTO> obtenerInformesAEnviarAPadrinosFiltradosCorporativos(Long padrino, Long zonaId, Long estadoInformeId, String tipoInforme,
			CicloPrograma ciclo, int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		
		final DetachedCriteria criteria = DetachedCriteria.forClass(Informe.class);
		List<EstadoInforme> estadosEnviables = new ArrayList<EstadoInforme>();
		
		//criteria.add(Restrictions.ne("nombre", ConstantesInformes.nombreComunicadoNoRenovacion));
		//criteria.add(Restrictions.ne("nombre", ConstantesInformes.nombreComunicadoPendiente));
		criteria.createAlias("becado", "becado");
		criteria.createAlias("beca", "beca");
		criteria.createAlias("beca.zona", "zona");
		criteria.createAlias("beca.padrino", "padrino");
		if(ciclo != null)
			criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("padrino.recibeInformesMasivos", true));
		criteria.add(Restrictions.eq("padrino.tipo", TipoPadrino.CORPORATIVO));
		criteria.setProjection(Projections.projectionList()
				.add(Projections.groupProperty("beca").as("beca"))
				.add(Projections.groupProperty("estado").as("estadoInforme"))
				.add(Projections.groupProperty("nombre").as("nombreInforme"))
				.add(Projections.rowCount(),"cantidad")).addOrder(Order.asc("beca.id"));
		
		//Filtro PADRINO
		if(padrino != null) {
			criteria.add(Restrictions.eq("padrino.id", padrino));
		}
		
		//Filtro ZONA
		if(zonaId != null){
			criteria.add(Restrictions.eq("zona.id", zonaId));
		}
		
		//Filtro TIPOINFORME
		if((tipoInforme != null ) && (!"".equals(tipoInforme))){
			criteria.add(Restrictions.eq("nombre", getTipoInformeCriteria(tipoInforme)));
		}
		
		//Filtro ESTADOINFORME
		if(estadoInformeId != null){
			Integer estadoId = estadoInformeId.intValue();
			if (EstadoInforme.FINALIZADO.getId() == estadoId || EstadoInforme.NO_ENVIADO.getId() == estadoId || EstadoInforme.ENVIADO.getId() == estadoId){
				if (EstadoInforme.FINALIZADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estado",EstadoInforme.FINALIZADO));	
				}else if (EstadoInforme.ENVIADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estado",EstadoInforme.ENVIADO));
				}else if (EstadoInforme.NO_ENVIADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estado",EstadoInforme.NO_ENVIADO));
				}
			}else if (estadoId == 0){
				estadosEnviables.add(EstadoInforme.FINALIZADO);
				estadosEnviables.add(EstadoInforme.ENVIADO);
				estadosEnviables.add(EstadoInforme.NO_ENVIADO);
				criteria.add(Restrictions.in("estado",estadosEnviables));
			}
		}else{
			estadosEnviables.add(EstadoInforme.FINALIZADO);
			estadosEnviables.add(EstadoInforme.ENVIADO);
			estadosEnviables.add(EstadoInforme.NO_ENVIADO);
			criteria.add(Restrictions.in("estado",estadosEnviables));
		}
		
	   if (sortCriterion != null) {
            if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
                criteria.addOrder(Order.asc(sortCriterion));
            }
            if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
                criteria.addOrder(Order.desc(sortCriterion));
            }
        }
		
	    criteria.setResultTransformer(Transformers.aliasToBean(EnvioInformeDTO.class));
		@SuppressWarnings("unchecked")
		List<EnvioInformeDTO> informes = getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
		return informes;
	}

	private Object getTipoInformeCriteria(String tipoInforme) {
		Object result = null;
		if (ConstantesInformes.nombreInformeFP.contains(tipoInforme)){
			return result = ConstantesInformes.nombreInformeFP;
		}
		if (ConstantesInformes.nombreInformeIS1.contains(tipoInforme)){
			return result = ConstantesInformes.nombreInformeIS1;
		}
		if (ConstantesInformes.nombreInformeIS2.contains(tipoInforme)){
			return result = ConstantesInformes.nombreInformeIS2;
		}
		if (ConstantesInformes.nombreInformeIS3.contains(tipoInforme)){
			return result = ConstantesInformes.nombreInformeIS3;
		}
		if (ConstantesInformes.nombreInformeCesacion.contains(tipoInforme)){
			return result = ConstantesInformes.nombreInformeCesacion;
		}
		if (ConstantesInformes.nombreInformeNoRenovado.contains(tipoInforme)){
			return result = ConstantesInformes.nombreInformeNoRenovado;
		}
		if (ConstantesInformes.nombreInformePendiente.contains(tipoInforme)){
			return result = ConstantesInformes.nombreInformePendiente;
		}
		if (ConstantesInformes.nombreComunicadoPendiente.contains(tipoInforme)){
			return result = ConstantesInformes.nombreComunicadoPendiente;
		}
		if (ConstantesInformes.nombreComunicadoNoRenovacion.contains(tipoInforme)){
			return result = ConstantesInformes.nombreComunicadoNoRenovacion;
		}
		return result;
	}
	
	@Override
	public Integer obtenerCantInformesPadrinosFiltradosAExportar(Boolean esIndividual, Long padrino, Long zonaId, Long estadoInformeId, String tipoInforme, CicloPrograma ciclo) {
		
		DetachedCriteria criteria = getCriteriaInformesFiltradosAExportar(esIndividual,padrino, zonaId, estadoInformeId, tipoInforme,ciclo);
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = results.size();
		
		return count;
	}
	
	private DetachedCriteria getCriteriaInformesFiltradosAExportar(boolean esIndividual, Long padrino, Long zonaId, Long estadoInformeId, String tipoInforme, CicloPrograma ciclo){
		DetachedCriteria criteria = DetachedCriteria.forClass(Informe.class);
		List<EstadoInforme> estadosEnviables = new ArrayList<EstadoInforme>();
		
		criteria.createAlias("becado", "becado");
		criteria.createAlias("beca", "beca");
		criteria.createAlias("beca.zona", "zona");
		criteria.createAlias("beca.padrino", "padrino");
		if(ciclo != null)
			criteria.add(Restrictions.eq("cicloActual", ciclo));
		
		if (esIndividual) {
			criteria.add(Restrictions.eq("padrino.tipo", TipoPadrino.INDIVIDUAL));
			//Filtro PADRINO
			if(padrino != null ){
				criteria.add(Restrictions.eq("padrino.id", padrino));
			}
		}else{
			criteria.add(Restrictions.eq("padrino.tipo", TipoPadrino.CORPORATIVO));
			//Filtro PADRINO
			if(padrino != null ){
				criteria.add(Restrictions.eq("padrino.id", padrino));			
			}
		}
		
		//Filtro ZONA
		if(zonaId != null){
			criteria.add(Restrictions.eq("zona.id", zonaId));
		}
		
		//Filtro TIPOINFORME
		if((tipoInforme != null ) && (!"".equals(tipoInforme))){
			criteria.add(Restrictions.eq("nombre", getTipoInformeCriteria(tipoInforme)));
		}
		
		//Filtro ESTADOINFORME
		if(estadoInformeId != null){
			Integer estadoId = estadoInformeId.intValue();
			if (EstadoInforme.FINALIZADO.getId() == estadoId || EstadoInforme.NO_ENVIADO.getId() == estadoId || EstadoInforme.ENVIADO.getId() == estadoId){
				if (EstadoInforme.FINALIZADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estado",EstadoInforme.FINALIZADO));	
				}else if (EstadoInforme.ENVIADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estado",EstadoInforme.ENVIADO));
				}else if (EstadoInforme.NO_ENVIADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estado",EstadoInforme.NO_ENVIADO));
				}
			}else if (estadoId == 0){
				estadosEnviables.add(EstadoInforme.FINALIZADO);
				estadosEnviables.add(EstadoInforme.ENVIADO);
				estadosEnviables.add(EstadoInforme.NO_ENVIADO);
				criteria.add(Restrictions.in("estado",estadosEnviables));
			}
		}else{
			estadosEnviables.add(EstadoInforme.FINALIZADO);
			estadosEnviables.add(EstadoInforme.ENVIADO);
			estadosEnviables.add(EstadoInforme.NO_ENVIADO);
			criteria.add(Restrictions.in("estado",estadosEnviables));
		}
		criteria.setProjection(Projections.projectionList()
				.add(Projections.groupProperty("beca").as("beca"))
				.add(Projections.groupProperty("estado").as("estadoInforme"))
				.add(Projections.groupProperty("nombre").as("nombreInforme"))
				.add(Projections.rowCount(),"cantidad")).addOrder(Order.asc("beca.id"));
		return criteria;
	}
	
	@Override
	public List<Informe> obtenerInformesAEnviar(Beca beca, EstadoInforme estado, String nombre) 
	{
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("beca", beca));
		criteria.add(Restrictions.eq("estado", estado));
		criteria.add(Restrictions.eq("nombre", nombre));
		List<Informe> informes = criteria.list();
		return informes;
	}

	@Override
	public List<Informe> obtenerInformesAReportar(List<Long> ciclo,  Integer tipoId, List<String> tipoInforme, 
			List<Integer> idEstado, List<Number> padrinoId, List<Number> zonaId,  
			String nombreAlumno, Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta,
			int firstResult, int maxResults,SortOrderEnum sortDirection, String sortCriterion, String eae) {

		DetachedCriteria criteria = getCriteriaInformesAReportar(ciclo,  tipoId, tipoInforme, idEstado, padrinoId, zonaId, nombreAlumno, 
																	idEA, idRR, anioEscolar, fechaDesde, fechaHasta,eae);
		
		if (sortCriterion != null) {
            if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
                criteria.addOrder(Order.asc(sortCriterion));
            }
            if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
                criteria.addOrder(Order.desc(sortCriterion));
            }
        }
		return getHibernateTemplate().findByCriteria(criteria,
                firstResult, maxResults);
	}

	@Override
	public int obtenerCantidadInformesAReportar(Integer tipoId, List<String> tipoInforme, List<Integer> idEstado, 
							List<Number> padrinoId, List<Number> zonaId, String nombreAlumno, List<Long> ciclo, 
							Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta, String eae) 
	{

		DetachedCriteria criteria = getCriteriaInformesAReportar(ciclo, tipoId, tipoInforme, idEstado, padrinoId, zonaId, nombreAlumno, 
														idEA, idRR, anioEscolar, fechaDesde, fechaHasta, eae);
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}
	
	private DetachedCriteria getCriteriaInformesAReportar(List<Long> ciclo,  Integer tipoId, List<String> tipoInforme, List<Integer> idEstado, 
															List<Number> padrinoId, List<Number> zonaId, String nombreAlumno, 
															Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta, String eae)
	{
		DetachedCriteria criteria = DetachedCriteria.forClass(Informe.class);
		criteria.createAlias("padrino", "padrino");
		criteria.createAlias("becado", "becado");
		
		if(ciclo != null){
			criteria.createAlias("cicloActual", "cicloActual");
			criteria.add(Restrictions.in("cicloActual.id", ciclo));
		}
		
		if(tipoId != null){
			
			criteria.add(Restrictions.eq("padrino.tipo", TipoPadrino.getTipoPadrino(tipoId)));
		}
		
		if(tipoInforme != null){
			criteria.add(Restrictions.in("nombre", tipoInforme));
		}
			
		if(idEstado != null){
			criteria.add(Restrictions.in("estado", EstadoInforme.getEstados(idEstado)));
		}
		
		if(padrinoId != null){
			criteria.add(Restrictions.in("padrino.id", padrinoId));
		}
		
		if(zonaId != null){
			criteria.createAlias("beca", "beca");
			criteria.createAlias("beca.zona", "zona");
			criteria.add(Restrictions.in("zona.id", zonaId));
		}
		
		if(nombreAlumno != null){
			criteria.createAlias("becado.datosPersonales", "persona");
			for ( String split : nombreAlumno.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("persona.nombre", "%"+split+"%"), Restrictions.like("persona.apellido", "%"+split+"%")));
		}
		
		//Filtro nuevo EA
		if (idEA!=null){
			criteria.createAlias("eaPerfil", "ea");
			criteria.add(Restrictions.eq("ea.idPerfilEA", idEA));
		}

		//Filtro nuevo RR
		if (idRR!=null){
			criteria.createAlias("rrPerfil", "rr");
			criteria.add(Restrictions.eq("rr.idPerfilRR", idRR));
		}

		//Filtro anioEscolar
		if (anioEscolar!=null){
			criteria.add(Restrictions.eq("becado.anioEscolar", anioEscolar));
		}

		if(eae!= null){
			if(eae.equals("todos") ){
				eae=null;
			}
		}
		
		if(eae!= null ){	
			criteria.add(Restrictions.eq("becado.eae",eae));
		}
		
		if (fechaDesde!=null){
			criteria.add(Restrictions.ge("fechaAlta", fechaDesde));
		}

		if (fechaHasta!=null){
			Calendar c = Calendar.getInstance();
			c.setTime(fechaHasta);
			c.set(Calendar.HOUR_OF_DAY, 23);
			c.set(Calendar.MINUTE, 59);
			c.set(Calendar.SECOND, 59);
			c.set(Calendar.MILLISECOND, 999);
			Date endOfDate = c.getTime();
		        
			criteria.add(Restrictions.le("fechaAlta", endOfDate));
		}
		
		return criteria;

	}

	@Override
	public Boolean verSiAlumnoTieneInformePorTipo(Long idAlumno, String tipoInforme) 
	{
		String sql = "select id from informe where tipo = '"+ tipoInforme +"' and becado = " +idAlumno;
		Query query = getSession().createSQLQuery(sql);
		if(!query.list().isEmpty())
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.InformeDao#obtenerInformesInconclusosAlumnosEa(org.cimientos.intranet.modelo.perfilEA.PerfilEA, java.util.List)
	 */
	@Override
	public List<Informe> obtenerInformesInconclusosAlumnosEa(
			PerfilEA eaAnterior, List<Long> idsAlumnos) {
		EstadoInforme[] estadosInconclusos = new EstadoInforme[]{EstadoInforme.CONSTRUCCION, EstadoInforme.SUPERVISOR,
				EstadoInforme.REVISION, EstadoInforme.CORRECTORA};
		Criteria criteria = getSession().createCriteria(Informe.class);
		criteria.add(Restrictions.eq("eaPerfil", eaAnterior));
		criteria.add(Restrictions.in("becado.id", idsAlumnos));
		criteria.add(Restrictions.in("estado", estadosInconclusos));
		return criteria.list();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.InformeDao#obtenerInformesInconclusosEasRR(org.cimientos.intranet.modelo.perfilRR.PerfilRR, java.util.List)
	 */
	@Override
	public List<Informe> obtenerInformesInconclusosEasRR(PerfilRR rrAnterior,
			List<Long> easIds) {
		EstadoInforme[] estadosInconclusos = new EstadoInforme[]{EstadoInforme.CONSTRUCCION, EstadoInforme.SUPERVISOR,
				EstadoInforme.REVISION, EstadoInforme.CORRECTORA};
		Criteria criteria = getSession().createCriteria(Informe.class);
		criteria.add(Restrictions.eq("rrPerfil", rrAnterior));
		criteria.add(Restrictions.in("eaPerfil.idPerfilEA", easIds));
		criteria.add(Restrictions.in("estado", estadosInconclusos));
		return criteria.list();
	}

	@Override
	public int obtenerCantidadInformesAAprobar(String correctora,
			Integer tipoId, String tipoInforme, Long rrId, Long eaId,
			String nombreAlumno, Long padrinoId, Long zonaId, CicloPrograma ciclo) 
	{
		DetachedCriteria criteria = getCriteriaInformesAAprobar(correctora, tipoId, tipoInforme, rrId, eaId,nombreAlumno, padrinoId, zonaId,ciclo);
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}
	
	private DetachedCriteria getCriteriaInformesAAprobar(String correctora,  Integer tipoId, String tipoInforme, Long idRR,Long idEA,
														 String nombreAlumno, Long padrinoId, Long zonaId, CicloPrograma ciclo)
	{
		DetachedCriteria criteria = DetachedCriteria.forClass(Informe.class);
		criteria.createAlias("padrino", "padrino");
		criteria.add(Restrictions.eq("estado", EstadoInforme.CORRECTORA));
		if(ciclo != null){
			criteria.add(Restrictions.eq("cicloActual", ciclo));
		}
		if(tipoId != null){
			
			criteria.add(Restrictions.eq("padrino.tipo", TipoPadrino.getTipoPadrino(tipoId)));
		}
		if(tipoInforme != null){
			criteria.add(Restrictions.eq("nombre", tipoInforme));
		}
			
		if(padrinoId != null){
			criteria.add(Restrictions.eq("padrino.id", padrinoId));
		}
		if(zonaId != null){
			criteria.createAlias("beca", "beca");
			criteria.createAlias("beca.zona", "zona");
			criteria.add(Restrictions.eq("zona.id", zonaId));
		}

		if(idRR != null){
			criteria.createAlias("rrPerfil", "rrPerfil");
			criteria.add(Restrictions.eq("rrPerfil.idPerfilRR", idRR));
		}
		if(idEA != null){
			criteria.createAlias("eaPerfil", "eaPerfil");
			criteria.add(Restrictions.eq("eaPerfil.idPerfilEA", idEA));
		}
		
		if(nombreAlumno != null && StringUtils.isNotBlank(nombreAlumno)){
			criteria.createAlias("becado", "alumno");
			criteria.createAlias("alumno.datosPersonales", "persona");
			for ( String split : nombreAlumno.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("persona.nombre", "%"+split+"%"), Restrictions.like("persona.apellido", "%"+split+"%")));
		}
		
		if(correctora != null && StringUtils.isNotBlank(correctora)){
			for ( String split : correctora.split(","))
				criteria.add(Restrictions.or(Restrictions.like("correctora", "%"+split+"%"), Restrictions.like("correctora", "%"+split+"%")));
		}
		return criteria;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Informe> obtenerInformesAAprobar(String correctora,
			Integer tipoId, String tipoInforme, Long eaId, Long rrId,
			String nombreAlumno, Long padrinoId, Long zonaId, int firstResult,
			int maxResults, SortOrderEnum sortDirection, String sortCriterion, CicloPrograma ciclo) {
		DetachedCriteria criteria = getCriteriaInformesAAprobar(correctora,  tipoId, tipoInforme, eaId, rrId, nombreAlumno, padrinoId, zonaId,ciclo);
	       if (sortCriterion != null) {
	            if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
	                criteria.addOrder(Order.asc(sortCriterion));
	            }
	            if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
	                criteria.addOrder(Order.desc(sortCriterion));
	            }
	        }
			return getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
	}
	
	@Override
	public int obtenerCantidadInformesActualizar(String tipoInforme, String nombreAlumno, PerfilEA perfilEA, CicloPrograma ciclo) 
	{
		DetachedCriteria criteria = getCriteriaInformesActualizar(tipoInforme, nombreAlumno, perfilEA,ciclo);
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}
	
	private DetachedCriteria getCriteriaInformesActualizar(String tipoInforme, String nombreAlumno, PerfilEA perfilEA, CicloPrograma ciclo)
	{
		DetachedCriteria criteria = DetachedCriteria.forClass(Informe.class);
		criteria.add(Restrictions.eq("eaPerfil", perfilEA));
		criteria.add(Restrictions.ne("nombre", ConstantesInformes.nombreInformeFP));
		criteria.add(Restrictions.eq("estado", EstadoInforme.CONSTRUCCION));
		
		if(ciclo != null){
			criteria.add(Restrictions.eq("cicloActual", ciclo));
		}
		
		if(tipoInforme != null){
			criteria.add(Restrictions.eq("nombre", tipoInforme));
		}
		if(nombreAlumno != null && StringUtils.isNotBlank(nombreAlumno)){
			criteria.createAlias("becado", "alumno");
			criteria.createAlias("alumno.datosPersonales", "persona");
			for ( String split : nombreAlumno.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("persona.nombre", "%"+split+"%"), Restrictions.like("persona.apellido", "%"+split+"%")));
		}
		return criteria;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Informe> obtenerInformesActualizar(String tipoInforme, String nombreAlumno,	PerfilEA perfilEA, int firstResult, 
													int maxResults, SortOrderEnum sortDirection, String sortCriterion,CicloPrograma ciclo) {
		DetachedCriteria criteria = getCriteriaInformesActualizar(tipoInforme, nombreAlumno, perfilEA, ciclo);
	       if (sortCriterion != null) {
	            if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
	                criteria.addOrder(Order.asc(sortCriterion));
	            }
	            if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
	                criteria.addOrder(Order.desc(sortCriterion));
	            }
	        }
			return getHibernateTemplate().findByCriteria(criteria,
	                firstResult, maxResults);
	}
	
	@Override
	public int obtenerCantidadInformesASupervisar(Integer tipoId, String tipoInforme, PerfilRR rr,String nombreAlumno, Long padrinoId, Long zonaId, CicloPrograma ciclo) 
	{
		DetachedCriteria criteria = getCriteriaInformesASupervisar(tipoId, tipoInforme, rr, nombreAlumno, padrinoId, zonaId, ciclo);
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}
	
	private DetachedCriteria getCriteriaInformesASupervisar(Integer tipoId, String tipoInforme, PerfilRR rr, 
															String nombreAlumno, Long padrinoId, Long zonaId, CicloPrograma ciclo)
	{
		DetachedCriteria criteria = DetachedCriteria.forClass(Informe.class);
		List<EstadoInforme> estadosEnviables = new ArrayList<EstadoInforme>();
		estadosEnviables.add(EstadoInforme.SUPERVISOR);
		estadosEnviables.add(EstadoInforme.REVISION);
		criteria.add(Restrictions.in("estado",estadosEnviables));
		criteria.add(Restrictions.eq("rrPerfil", rr));
		criteria.add(Restrictions.ne("nombre", ConstantesInformes.nombreInformeFP));
		criteria.createAlias("padrino", "padrino");
		if(tipoId != null){
			
			criteria.add(Restrictions.eq("padrino.tipo", TipoPadrino.getTipoPadrino(tipoId)));
		}
		if(tipoInforme != null){
			criteria.add(Restrictions.eq("nombre", tipoInforme));
		}
			
		if(padrinoId != null){
			criteria.add(Restrictions.eq("padrino.id", padrinoId));
		}
		if(ciclo != null){
			criteria.add(Restrictions.eq("cicloActual", ciclo));
		}
		if(zonaId != null){
			criteria.createAlias("beca", "beca");
			criteria.createAlias("beca.zona", "zona");
			criteria.add(Restrictions.eq("zona.id", zonaId));
		}

				
		if(nombreAlumno != null && StringUtils.isNotBlank(nombreAlumno)){
			criteria.createAlias("becado", "alumno");
			criteria.createAlias("alumno.datosPersonales", "persona");
			for ( String split : nombreAlumno.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("persona.nombre", "%"+split+"%"), Restrictions.like("persona.apellido", "%"+split+"%")));
		}
		return criteria;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Informe> obtenerInformesASupervisar(Integer tipoId, String tipoInforme,PerfilRR rr,
													String nombreAlumno, Long padrinoId, Long zonaId, int firstResult,
													int maxResults, SortOrderEnum sortDirection, String sortCriterion, CicloPrograma ciclo) {
		DetachedCriteria criteria = getCriteriaInformesASupervisar(tipoId, tipoInforme,rr, nombreAlumno, padrinoId, zonaId,  ciclo);
	       if (sortCriterion != null) {
	            if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
	                criteria.addOrder(Order.asc(sortCriterion));
	            }
	            if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
	                criteria.addOrder(Order.desc(sortCriterion));
	            }
	        }
			return getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
	}
	
}
