package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.PerfilPadrinoDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.displaytag.properties.SortOrderEnum;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author plabaronnie
 * Clase que implementa los metodos de la interfaz PadrinoDao. 
 * Utilizada para generar consultas a la DB.
 * Extiende {@link SpringHibernateDao}
 * 
 */
@Repository
public class PerfilPadrinoDaoImpl extends SpringHibernateDao<PerfilPadrino> implements PerfilPadrinoDao

{
	/**
	 * @param sessionFactory Objeto para abrir una sesion a la DB.
	 * Constructor de la clase.
	 */
	@Autowired
	public PerfilPadrinoDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);

	}

	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<PerfilPadrino> getObjetoManejado() {
			return PerfilPadrino.class;
	}

	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PadrinoDao#obtenerPadrinosActivos()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PerfilPadrino> obtenerPadrinosActivos() {
		DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PadrinoDao#obtenerPadrino(java.lang.String, java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PerfilPadrino obtenerPadrino(String nombre, String id) {
	
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.eq("denominacion", nombre));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));
		final List<PerfilPadrino> padrinos = getHibernateTemplate().findByCriteria(criteria);

		if (padrinos != null && !padrinos.isEmpty()){
			return padrinos.get(0);
		} else {
			return null;

		}

	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PadrinoDao#obtenerPadrinoPorIgualNombre(java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PerfilPadrino obtenerPadrinoPorIgualNombre(String nombre) 
	{
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("empresa.denominacion", "nombre");
		criteria.add(Restrictions.eq("nombre", nombre));
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));
		
		final List<PerfilPadrino> padrinos = getHibernateTemplate().findByCriteria(criteria);

		if (padrinos != null && !padrinos.isEmpty()){
			return padrinos.get(0);
		} else {
			return null;

		}

	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilPadrinoDao#buscarPorIgualCUIT(java.lang.String)
	 */
	@Override
	public PerfilPadrino buscarPorIgualCUIT(String cuit_cuil, Long id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("empresa", "empresa");
		criteria.add(Restrictions.eq("empresa.CUIT", cuit_cuil));
		if(id != null){
			criteria.add(Restrictions.ne("id", id));
		}
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));

		final List<PerfilPadrino> padrinos = getHibernateTemplate().findByCriteria(criteria);

		if (padrinos != null && !padrinos.isEmpty()){
			return padrinos.get(0);
		} else {
			return null;

		}
	}
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilPadrinoDao#buscarPorIgualCUIT(java.lang.String)
	 */
	@Override
	public PerfilPadrino buscarPorIgualCUIL(String cuit_cuil, Long id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("datosPersonales", "datosPersonales");
		criteria.add(Restrictions.eq("datosPersonales.cuilCuit", cuit_cuil));
		if(id != null){
			criteria.add(Restrictions.ne("id", id));
		}
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));

		final List<PerfilPadrino> padrinos = getHibernateTemplate().findByCriteria(criteria);

		if (padrinos != null && !padrinos.isEmpty()){
			return padrinos.get(0);
		} else {
			return null;

		}
	}
	
	
	
	@Override
	public PerfilPadrino buscarPorCUIT(String cuit_cuil) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("empresa", "empresa", CriteriaSpecification.LEFT_JOIN);
		criteria.createAlias("datosPersonales", "persona", CriteriaSpecification.LEFT_JOIN);
		Disjunction disjunction = Restrictions.disjunction(); 
		disjunction.add(Restrictions.eq("empresa.CUIT", cuit_cuil)); 
		disjunction.add(Restrictions.eq("persona.cuilCuit", cuit_cuil)); 
		criteria.add(disjunction);
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));

		final List<PerfilPadrino> padrinos = getHibernateTemplate().findByCriteria(criteria);

		if (padrinos != null && !padrinos.isEmpty()){
			return padrinos.get(0);
		} else {
			return null;

		}
	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilPadrinoDao#buscarPorNombreDenominacion(java.lang.String, int)
	 */
	@Override
	public List<PerfilPadrino> buscarPorNombreDenominacion(String texto,
			int cantidadMax) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.setMaxResults(cantidadMax);
		criteria.add(Restrictions.eq("activo", true));
		criteria.createAlias("empresa", "empresa", CriteriaSpecification.LEFT_JOIN);
		criteria.createAlias("datosPersonales", "persona", CriteriaSpecification.LEFT_JOIN);
		Disjunction disjunction = Restrictions.disjunction(); 
		disjunction.add(Restrictions.or(Restrictions.like("persona.nombre", "%"+texto+"%"), Restrictions.like("persona.apellido", "%"+texto+"%")));
		disjunction.add(Restrictions.like("empresa.denominacion", "%"+texto+"%"));
		criteria.add(disjunction);
		return criteria.list();
	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilPadrinoDao#obtenerCantidadPadrinosAExportar(java.lang.Integer, java.lang.String, java.lang.Long)
	 */
	@Override
	public int obtenerCantidadPadrinosAExportar(Integer idTipo,
			String cuitCuil, Long padrinoId) {
		DetachedCriteria criteria = getCriteriaPadrinosAExportar(idTipo, cuitCuil, padrinoId);
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilPadrinoDao#obtenerPadrinosAExportar(java.lang.Integer, java.lang.String, java.lang.Long, int, int, org.displaytag.properties.SortOrderEnum, java.lang.String)
	 */
	@Override
	public List<PerfilPadrino> obtenerPadrinosAExportar(Integer idTipo,
			String cuitCuil, Long padrinoId, int firstResult, int maxResults,
			SortOrderEnum sortDirection, String sortCriterion) {
		DetachedCriteria criteria = getCriteriaPadrinosAExportar(idTipo, cuitCuil, padrinoId);
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
	
	/**
	 * @param ciclo
	 * @param idTipoPadrino
	 * @param idEstado
	 * @param idPeriodo
	 * @param tipoBecaId
	 * @param padrinoId
	 * @param zonaId
	 * @return
	 */
	private DetachedCriteria getCriteriaPadrinosAExportar(Integer idTipo,
			String cuitCuil, Long padrinoId) {
		DetachedCriteria criteria = DetachedCriteria.forClass(PerfilPadrino.class);
		
		criteria.add(Restrictions.eq("activo", true));
		
		if(padrinoId != null){
			criteria.add(Restrictions.eq("id", padrinoId));
		}
		
		if(idTipo != null){	
			criteria.add(Restrictions.eq("tipo", TipoPadrino.getTipoPadrino(idTipo)));
		}
		
		if(StringUtils.isNotBlank(cuitCuil)){
			criteria.createAlias("empresa", "empresa", CriteriaSpecification.LEFT_JOIN);
			criteria.createAlias("datosPersonales", "persona", CriteriaSpecification.LEFT_JOIN);
			Disjunction disjunction = Restrictions.disjunction(); 
			disjunction.add(Restrictions.like("persona.cuilCuit", "%" + cuitCuil +"%"));
			disjunction.add(Restrictions.like("empresa.CUIT",  "%" + cuitCuil+"%"));
			criteria.add(disjunction);
		}

		return criteria;
	}


	@Override
	public List<PerfilPadrino> buscarTodosPorNombreDenominacion(String texto,int cantidadMax) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.setMaxResults(cantidadMax);
		criteria.createAlias("empresa", "empresa", CriteriaSpecification.LEFT_JOIN);
		criteria.createAlias("datosPersonales", "persona", CriteriaSpecification.LEFT_JOIN);
		Disjunction disjunction = Restrictions.disjunction(); 
		disjunction.add(Restrictions.or(Restrictions.like("persona.nombre", "%"+texto+"%"), Restrictions.like("persona.apellido", "%"+texto+"%")));
		disjunction.add(Restrictions.like("empresa.denominacion", "%"+texto+"%"));
		criteria.add(disjunction);
		return criteria.list();
	}

}
