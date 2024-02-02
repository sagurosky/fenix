package org.cimientos.intranet.dao.impl;


import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.PerfilStaffDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.EstadoCuenta;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfilstaff.PerfilStaff;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.utils.ConstantesDisplayTagSorting;
import org.displaytag.properties.SortOrderEnum;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PerfilStaffDaoImpl extends SpringHibernateDao<PerfilStaff> implements PerfilStaffDao{

	
	
	/**
	 * @param sessionFactory
	 */
	@Autowired
	public PerfilStaffDaoImpl(SessionFactory sessionFactory) 
	{
		super(sessionFactory);
	}

	@Override
	protected Class<PerfilStaff> getObjetoManejado() 
	{
		return PerfilStaff.class;
	}
	
	@Override
	public boolean existeStaffPorPersona(Persona persona) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("datosPersonales", persona));
		return !criteria.list().isEmpty();
	}

	/**
	 * @author esalvador
	 **/
	@Override
	public List<PerfilStaff> obtenerPerfilStaffPorNombre(String nombre) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.like("titularCuenta", nombre, MatchMode.ANYWHERE));
		
		List<PerfilStaff> staff = getHibernateTemplate().findByCriteria(criteria);
		return staff;
	}
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilStaffDao#obtenerStaffSinNroCuenta()
	 */
	@Override
	public List<PerfilStaff> obtenerStaffSinNroCuenta(Banco banco) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		if(banco != null){
			criteria.add(Restrictions.eq("banco", banco));
		}
		criteria.add(Restrictions.isNull("nroCuenta"));
		Disjunction disjunction = Restrictions.disjunction();
		disjunction.add(Restrictions.isNull("estadoCuenta"));
		disjunction.add(Restrictions.eq("estadoCuenta", EstadoCuenta.NO_SOLICITADA));
		disjunction.add(Restrictions.eq("estadoCuenta", EstadoCuenta.CORREGIDA));
		criteria.add(disjunction);
		return getHibernateTemplate().findByCriteria(criteria);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilStaffDao#obtenerStaffPorCuils(java.util.Set)
	 */
	@Override
	public List<PerfilStaff> obtenerStaffPorCuils(Set<String> cuils) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.or(Restrictions.isNull("nroCuenta"),Restrictions.eq("nroCuenta","")));
		criteria.add(Restrictions.in("cuilTitularCuenta", cuils));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilStaffDao#obtenerPerfilStaffPorCuil(java.lang.String)
	 */
	@Override
	public PerfilStaff obtenerPerfilStaffPorCuil(String cuil) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.eq("cuilTitularCuenta", cuil));
		List<PerfilStaff> staff = getHibernateTemplate().findByCriteria(criteria);
		if(staff != null && !staff.isEmpty()){
			return staff.get(0);
		}else {
			return null;
		}
	}

	@Override
	public int obtenerCantidadStaffAExportar(Banco banco) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		if(banco != null){
			criteria.add(Restrictions.eq("banco", banco));
		}
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilStaffDao#obtenerStaffPorBanco(org.cimientos.intranet.modelo.banco.Banco)
	 */
	@Override
	public List<PerfilStaff> obtenerStaffPorBanco(Banco banco, int firstResult, int maxResults,
            SortOrderEnum sortDirection, String sortCriterion) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		if(banco != null){
			criteria.add(Restrictions.eq("banco", banco));
		}
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
	
	
	/**
	 * cta
	 * @author esalvador 
	 **/
	@SuppressWarnings("unchecked")
	@Override
	public List<PerfilStaff> obtenerStaffFiltrados(Banco banco, String titular, String numCuenta, Integer idEstadoCuenta,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {

		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());

		//Filtro BANCO
		if(banco != null){
			criteria.add(Restrictions.eq("banco", banco));
		}
		
		//Filtro TITULAR
		if(StringUtils.isNotBlank(titular)){
			criteria.createAlias("datosPersonales", "persona");
			criteria.add(Restrictions.like("persona.apellido", titular, MatchMode.ANYWHERE));
		}

		//Filtro Estado y Numero Cuenta
		if(idEstadoCuenta != null){
			criteria.add(Restrictions.eq("estadoCuenta", EstadoCuenta.getEstadoCuenta(idEstadoCuenta)));
		}
		
		//Filtro NUMERO CUENTA
		if((numCuenta != null) && (!"".equals(numCuenta))){
			criteria.add(Restrictions.like("nroCuenta", "%"+numCuenta+"%"));
		}
		
		
		//Si el criterio de ordenamiento es por zona, rr o becado no debe ordenar ya que eso solo corresponde a RA
		if (StringUtils.isNotBlank(sortCriterion) && !sortCriterion.equals(ConstantesDisplayTagSorting.CuentaSorting.ZONA)
				&& !sortCriterion.equals(ConstantesDisplayTagSorting.CuentaSorting.BECADO_APELLIDO)
				&& !sortCriterion.equals(ConstantesDisplayTagSorting.CuentaSorting.RR_APELLIDO)) {
			this.setCuentasSortCriteria(criteria, sortDirection, sortCriterion, 
					banco, titular, idEstadoCuenta);
		}

	    return getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
	}

	/**
	 * @param criteria
	 * @param sortDirection
	 * @param sortCriterion
	 * @param banco
	 * @param titular
	 * @param idEstadoCuenta
	 */
	private void setCuentasSortCriteria(DetachedCriteria criteria,
			SortOrderEnum sortDirection, String sortCriterion, Banco banco,
			String titular, Integer idEstadoCuenta) {
			String sortBy = sortCriterion;
			
			if(ConstantesDisplayTagSorting.CuentaSorting.APELLIDO_TITULAR.equals(sortCriterion)){
				if(StringUtils.isBlank(titular)){
					criteria.createAlias("datosPersonales", "persona");
				}
				sortBy = "persona.apellido";
			}else if(ConstantesDisplayTagSorting.CuentaSorting.CUIL_TITULAR.equals(sortCriterion)){
				sortBy = "cuilCuit";
			}
			
			if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
	            criteria.addOrder(Order.asc(sortBy));
	        }
	        if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
	            criteria.addOrder(Order.desc(sortBy));
	        }
		
	}

	@Override
	public Integer obtenerCantidadStaffFiltradosAExportar(Banco banco,
			String titular, String numCuenta, Integer idEstadoCuenta) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		
		if(banco != null){
			criteria.add(Restrictions.eq("banco", banco));
		}
		
		//Filtro Estado y Numero Cuenta
		if(idEstadoCuenta != null){
			criteria.add(Restrictions.eq("estadoCuenta", EstadoCuenta.getEstadoCuenta(idEstadoCuenta)));
		}
		
		//Filtro TITULAR
		if(StringUtils.isNotBlank(titular)){
			criteria.add(Restrictions.like("titularCuenta", titular, MatchMode.ANYWHERE));
		}
		
		//Filtro NUMERO CUENTA
		if((numCuenta != null) && (!"".equals(numCuenta))){
			criteria.add(Restrictions.like("nroCuenta", numCuenta));
		}
		
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}
	
}
