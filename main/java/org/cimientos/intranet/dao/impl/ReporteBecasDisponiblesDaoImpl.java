package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.ReporteBecasDisponiblesDAO;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.EstadoBeca;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.utils.ConstantesInformes;
import org.displaytag.properties.SortOrderEnum;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * The Class ReporteBecasDisponiblesDaoImpl.
 */
@Repository
public class ReporteBecasDisponiblesDaoImpl extends SpringHibernateDao<Beca>
		implements ReporteBecasDisponiblesDAO {
	
	/**
	 * Instantiates a new reporte becas disponibles dao impl.
	 *
	 * @param sessionFactory the session factory
	 * @since 04-may-2011
	 * @author cfigueroa
	 */
	@Autowired
	public ReporteBecasDisponiblesDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<Beca> getObjetoManejado() {
		return Beca.class;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ReporteBecasDisponiblesDAO#cantidadBecasDisponibles(java.util.List)
	 */
	@Override
	public Integer cantidadBecasDisponibles(List<EstadoBeca> estadoBecas,CicloPrograma cicloPrograma, 
											EstadoBeca estadoBeca, Periodo periodo, 
											ZonaCimientos zona, PerfilPadrino padrino, Integer idTipo, boolean db) {
		Criteria criteria = getSession().createCriteria(Beca.class);
		//crea los criteria para los filtros de busqueda
		createCriteriaFiltros(cicloPrograma, estadoBeca, periodo, zona,
				padrino, idTipo,db, criteria);
		
		
		criteria.add(Restrictions.eq("activo", true));
		criteria.add(Restrictions.ne("estado",EstadoBeca.INACTIVA));
		criteria.setProjection(Projections.rowCount());
		return (Integer) criteria.list().get(0);
	}

	/**
	 * Creates the criteria filtros.
	 *
	 * @param cicloPrograma the ciclo programa
	 * @param estadoBeca the estado beca
	 * @param periodo the periodo
	 * @param zona the zona
	 * @param padrino the padrino
	 * @param criteria the criteria
	 * @since 05-may-2011
	 * @author cfigueroa
	 */
	private void createCriteriaFiltros(CicloPrograma cicloPrograma,
			EstadoBeca estadoBeca, Periodo periodo, ZonaCimientos zona,
			PerfilPadrino padrino,Integer idTipoPadrino, boolean db, Criteria criteria) {
		
		criteria.createAlias("padrino", "padrino");
		
		if(db){
			//System.out.println(db);
			//criteria.add(Restrictions.le("cantidad", 10));
			
		}
		
		if(cicloPrograma != null ){
			criteria.add(Restrictions.eq("ciclo", cicloPrograma));
		}
		if(estadoBeca != null ){
			criteria.add(Restrictions.eq("estado", estadoBeca));
		}
		if(periodo != null){
			criteria.add(Restrictions.eq("periodoPago",periodo));
		}
		if(zona != null){
			criteria.add(Restrictions.eq("zona", zona));
		}
		if(padrino != null ){
			criteria.add(Restrictions.eq("padrino",padrino));
		}
		     
		 if(idTipoPadrino != null){        
             criteria.add(Restrictions.eq("padrino.tipo", TipoPadrino.getTipoPadrino(idTipoPadrino)));
		 }
		 
		
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ReporteBecasDisponiblesDAO#becasDisponibles(java.util.List, int, int, org.displaytag.properties.SortOrderEnum, java.lang.String)
	 */
	@Override
	public List<Beca> becasDisponibles(List<EstadoBeca> estadoBecas,
			int firstResult, int maxResults, SortOrderEnum sortDirection,
			String sortCriterion, CicloPrograma cicloPrograma, 
			EstadoBeca estadoBeca, Periodo periodo, ZonaCimientos zona, PerfilPadrino padrino, Integer idTipo, boolean db) {
		Criteria criteria = getSession().createCriteria(Beca.class);
		//crea los criteria para los filtros de busqueda
		
		String sortBy = sortCriterion;
		
		//System.out.println(db);
		
		if (sortBy !=null){
			if (sortBy.equals("nroCtesPlataformaContable")){
				sortBy="padrino.nroCtesPlataformaContable";
			}
			/*
			if (sortBy.equals("padrino")){
				sortBy="padrino.apellido";
			}
			if (sortBy.equals("zona")){
				sortBy="zona";
			}
			*/
			if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
	            criteria.addOrder(Order.asc(sortBy));
	        }
	        if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
	            criteria.addOrder(Order.desc(sortBy));
	        }
		}   
		/* anterior que funciona para idplataforma
			
			if (StringUtils.isNotBlank(sortCriterion)) {
				if (sortDirection.equals(SortOrderEnum.DESCENDING)){
		    		criteria.addOrder(Order.desc("padrino.idPlataforma"));
				}
		    	else{
		    		criteria.addOrder(Order.asc("padrino.idPlataforma"));
		    	}			
			}
			*/
		createCriteriaFiltros(cicloPrograma, estadoBeca, periodo, zona, padrino, idTipo,db, criteria);
		criteria.add(Restrictions.eq("activo", true));
		criteria.add(Restrictions.ne("estado", EstadoBeca.INACTIVA));
		
		criteria.setFirstResult(firstResult);
		criteria.setMaxResults(maxResults);
		return criteria.list();
	}
	
}
