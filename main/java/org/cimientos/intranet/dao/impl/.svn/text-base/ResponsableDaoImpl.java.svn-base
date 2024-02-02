package org.cimientos.intranet.dao.impl;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.cimientos.intranet.dao.ResponsableDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.EstadoCuenta;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.utils.ConstantesDisplayTagSorting;
import org.cimientos.intranet.utils.ConstantesInformes;
import org.displaytag.properties.SortOrderEnum;
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
public class ResponsableDaoImpl extends SpringHibernateDao<ResponsableAdulto>
implements ResponsableDao{

	private static final Logger log = Logger.getLogger(ResponsableDaoImpl.class);
	
	@Autowired
	public ResponsableDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<ResponsableAdulto> getObjetoManejado() {
		return ResponsableAdulto.class;
	}

	
	@Override
	public List<ResponsableAdulto> obtenerResponsablesPorNombreSimilar(String nombre) {

		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("idAlumno", "alumno");
		criteria.createAlias("alumno.datosPersonales","persona");
		
		Disjunction disjunction = Restrictions.disjunction(); 
		disjunction.add(Restrictions.like("persona.nombre", nombre, MatchMode.ANYWHERE));
		disjunction.add(Restrictions.like("persona.apellido", nombre, MatchMode.ANYWHERE));
		criteria.add(disjunction);

		@SuppressWarnings("unchecked")
		final List<ResponsableAdulto> responsables = getHibernateTemplate().findByCriteria(criteria);

		return responsables;
	}
	
	
	@Override
	public List<ResponsableAdulto> obtenerResponsablesPorTitularSimilar(String titularCuenta) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		
		Disjunction disjunction = Restrictions.disjunction(); 
		disjunction.add(Restrictions.like("nombre", titularCuenta, MatchMode.ANYWHERE));
		disjunction.add(Restrictions.like("apellido", titularCuenta, MatchMode.ANYWHERE));
		criteria.add(disjunction);

		@SuppressWarnings("unchecked")
		final List<ResponsableAdulto> responsables = getHibernateTemplate().findByCriteria(criteria);

		return responsables;
	}
	
	
	@Override
	public ResponsableAdulto obtenerResponsablePorIgualNombre(String nombre) {

		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.eq("nombre", nombre));

		final List<ResponsableAdulto> responsables = getHibernateTemplate().findByCriteria(criteria);

		if (responsables != null && !responsables.isEmpty()){
			return responsables.get(0);
		} else {
			return null;

		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public ResponsableAdulto obtenerResponsablePorNombre(String nombre, String id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.eq("nombre", nombre));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}

		final List<ResponsableAdulto> responsables = getHibernateTemplate().findByCriteria(criteria);

		if (responsables != null && !responsables.isEmpty()){
			return responsables.get(0);
		} else {
			return null;

		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ResponsableDao#obtenerResponsablesSinNroCuenta()
	 */
	@Override
	public List<ResponsableAdulto> obtenerResponsablesSinNroCuenta(Banco banco, boolean traerCuentasMenosIndustrial) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("idAlumno.responsable1", "resp1");
		criteria.add(Restrictions.eqProperty("resp1.id", "id"));
		criteria.createAlias("sucursalBanco.banco", "banco");
		if(traerCuentasMenosIndustrial){
			criteria.add(Restrictions.ne("banco.nombre", "Industrial"));
		}
		if(banco != null){			
			criteria.add(Restrictions.eq("banco.id", banco.getId()));
		}
		Disjunction disjunction = Restrictions.disjunction();
		disjunction.add(Restrictions.eq("estadoCuenta", EstadoCuenta.NO_SOLICITADA));
		disjunction.add(Restrictions.eq("estadoCuenta", EstadoCuenta.CORREGIDA));
		criteria.add(disjunction);
		return getHibernateTemplate().findByCriteria(criteria);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ResponsableDao#obtenerResponsablesPorCuils(java.util.Set)
	 */
	@Override
	public List<ResponsableAdulto> obtenerResponsablesPorCuils(Set<String> cuils) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.or(Restrictions.isNull("nroCuenta"),Restrictions.eq("nroCuenta","")));
		criteria.add(Restrictions.in("cuilCuit", cuils));
		criteria.add(Restrictions.or(Restrictions.isNull("estadoCuenta"),Restrictions.ne("estadoCuenta", EstadoCuenta.INACTIVA)));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ResponsableDao#obtenerResponsablePorCuil(java.lang.String)
	 */
	@Override
	public ResponsableAdulto obtenerResponsablePorCuil(String cuil) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.eq("cuilCuit", cuil));
		List<ResponsableAdulto> resp = getHibernateTemplate().findByCriteria(criteria);
		if(resp != null && !resp.isEmpty()){
			return resp.get(0);
		}else {
			return null;
		}
	}

	@Override
	public int obtenerCantidadResponsablesFiltradosAExportar(Banco banco, String becado, String titular, String numCuenta, Long zonaId, String rr,Long idRr, Integer idEstadoCuenta, Integer dniRA) {
		DetachedCriteria criteria = getCriteriaRespFiltradoAExportar(banco, becado, titular, numCuenta, zonaId, rr, idRr, idEstadoCuenta, dniRA);
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}
	
	private DetachedCriteria getCriteriaRespFiltradoAExportar(Banco banco, String becado, String titular, String numCuenta, Long zonaId, String rr,Long idRr, Integer idEstadoCuenta, Integer dniRA){
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("idAlumno", "alumno");
		criteria.createAlias("alumno.responsable1", "resp1");
		criteria.add(Restrictions.eqProperty("resp1.id", "id"));
		String sql  = "{alias}.id_alumno in (select ape.id_perfil_alumno  from alumno_panelea ape where ape.activo = true)";
		criteria.add(Restrictions.sqlRestriction(sql));
		
		//Filtro BANCO
		if(banco != null){
			criteria.createAlias("sucursalBanco", "sucursal");
			criteria.createAlias("sucursal.banco", "banco");
			criteria.add(Restrictions.eq("banco.id", banco.getId()));
		}
		
		//Filtro BECADO
		if((becado != null) && (!"".equals(becado))){
			criteria.createAlias("alumno.datosPersonales","persona");
			for ( String split : becado.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("persona.nombre", "%"+split+"%"), Restrictions.like("persona.apellido", "%"+split+"%")));

		}

		//Filtro TITULAR
		if((titular != null) && (!"".equals(titular))){
			for ( String split : titular.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("nombre", "%"+split+"%"), Restrictions.like("apellido", "%"+split+"%")));
		}
		
		//Filtro NUMERO CUENTA
		if((numCuenta != null) && (!"".equals(numCuenta))){
			criteria.add(Restrictions.like("nroCuenta",  "%"+numCuenta+"%"));
		}
		
		//Filtro EstadoCuenta
		if(idEstadoCuenta != null){
			criteria.add(Restrictions.eq("estadoCuenta", EstadoCuenta.getEstadoCuenta(idEstadoCuenta)));
		}
		
		//Filtro DNI RA
		if((dniRA != null)){
			criteria.add(Restrictions.eq("dni", dniRA));
		}
		
		//Filtro ZONA
		if(zonaId != null){
			criteria.createAlias("alumno.escuela", "escuela");
			criteria.createAlias("escuela.localidad", "localidad");
			criteria.createAlias("localidad.zona", "zona");
			criteria.add(Restrictions.eq("zona.id", zonaId));
		}

		//Filtro RR
		if(idRr != null){
			criteria.createAlias("alumno.ea", "ea");
			criteria.createAlias("ea.rr", "rr");
			criteria.add(Restrictions.eq("rr.id", idRr));
		}
		return criteria;
	}
	
	/**
	 * @author esalvador 
	 **/
	@SuppressWarnings("unchecked")
	@Override
	public List<ResponsableAdulto> obtenerResponsablesFiltrados(Banco banco, String becado, String titular, String numCuenta, Long zonaId, String rr,Long idRR, Integer idEstadoCuenta, Integer dniRA,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		DetachedCriteria criteria = getCriteriaRespFiltradoAExportar(banco, becado, titular, numCuenta, zonaId, rr, idRR, idEstadoCuenta, dniRA);
		if (StringUtils.isNotBlank(sortCriterion)) {
			this.setCuentasSortCriteria(criteria, sortDirection, sortCriterion, 
					banco, becado, titular,zonaId, rr, idEstadoCuenta);
		}
		
	    return getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ResponsableDao#obtenerResponsablesPorBanco(org.cimientos.intranet.modelo.banco.Banco)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ResponsableAdulto> obtenerResponsablesPorBanco(Banco banco, int firstResult, int maxResults,
            SortOrderEnum sortDirection, String sortCriterion) {

		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("idAlumno.responsable1", "resp1");
		criteria.add(Restrictions.eqProperty("resp1.id", "id"));
		if(banco != null){
			criteria.createAlias("sucursalBanco.banco", "banco");
			criteria.add(Restrictions.eq("banco.id", banco.getId()));
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
	 * @param criteria
	 * @param sortDirection
	 * @param sortCriterion
	 * @param banco
	 * @param becado
	 * @param titular
	 * @param zonaId
	 * @param rr
	 * @param idEstadoCuenta
	 */
	private void setCuentasSortCriteria(DetachedCriteria criteria,
			SortOrderEnum sortDirection, String sortCriterion, Banco banco,
			String becado, String titular, Long zonaId, String rr,
			Integer idEstadoCuenta) {
		String sortBy = sortCriterion;
		
		if(ConstantesDisplayTagSorting.CuentaSorting.BECADO_APELLIDO.equals(sortCriterion)){
			if(StringUtils.isBlank(becado)){
				criteria.createAlias("alumno.datosPersonales","persona");
			}
			sortBy = "persona.apellido";
		}else if(ConstantesDisplayTagSorting.CuentaSorting.APELLIDO_TITULAR.equals(sortCriterion)){
			sortBy = "apellido";
		}else if(ConstantesDisplayTagSorting.CuentaSorting.CUIL_TITULAR.equals(sortCriterion)){
			sortBy = "cuilCuit";
		}if(ConstantesDisplayTagSorting.CuentaSorting.RR_APELLIDO.equals(sortCriterion)){
			if(StringUtils.isBlank(rr)){
				criteria.createAlias("alumno.ea", "ea");
				criteria.createAlias("ea.rr", "rr");
				criteria.createAlias("rr.datosPersonales", "datosPersonales");
			}
			sortBy = "datosPersonales.apellido";
		}else if(ConstantesDisplayTagSorting.CuentaSorting.ZONA.equals(sortCriterion)){
			if(zonaId == null){
				criteria.createAlias("alumno.escuela", "escuela");
				criteria.createAlias("escuela.localidad", "localidad");
				criteria.createAlias("localidad.zona", "zona");
			}
			sortBy = "zona.nombre";
		}else if(ConstantesDisplayTagSorting.CuentaSorting.BANCO_TITULAR.equals(sortCriterion)){
			if(banco == null){
				criteria.createAlias("sucursalBanco", "sucursalBanco");
				criteria.createAlias("sucursalBanco.banco", "banco");
			}
			sortBy = "banco.nombre";			
		}
		
		if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
            criteria.addOrder(Order.asc(sortBy));
        }
        if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
            criteria.addOrder(Order.desc(sortBy));
        }
		
	}
	

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ResponsableDao#obtenerResponsablePorCuil(java.lang.String)
	 */
	@Override
	public ResponsableAdulto obtenerPorPerfilAlumno(PerfilAlumno perfilAlumno) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.eq("idAlumno", perfilAlumno));
		List<ResponsableAdulto> resp = getHibernateTemplate().findByCriteria(criteria);
		if(resp != null && !resp.isEmpty()){
			return resp.get(0);
		}else {
			return null;
		}
	}

	@Override
	public boolean existeNumeroCuenta(String nroCuenta) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.eq("nroCuenta", nroCuenta));
		List<ResponsableAdulto> resp = getHibernateTemplate().findByCriteria(criteria);
		return (resp != null && !resp.isEmpty());		
	}

	@Override
	public int obtenerCantidadCuentasInactivas(Banco banco,	String becado, String titular, String numCuenta, Integer dniRA, Long zonaId) {
		DetachedCriteria criteria = getCriteriaRespInactivos(banco, becado, titular, numCuenta, dniRA, zonaId);
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}


	@Override
	public List<ResponsableAdulto> obtenerCuentasInactivas(Banco banco,String becado, String titular, String numCuenta, Integer dniRA, Long zonaId,
			int firstResult, int maxResults, SortOrderEnum sortDirection,String sortCriterion) {
		DetachedCriteria criteria = getCriteriaRespInactivos(banco, becado, titular, numCuenta, dniRA, zonaId);

		if (StringUtils.isNotBlank(sortCriterion)) {
        	if (sortCriterion.equals(ConstantesInformes.ORDEN_X_ALUMNO)){
            	if (StringUtils.isBlank(becado)){
        			criteria.createAlias("alumno.datosPersonales","persona");
            	}
            	
            	if (sortDirection.equals(SortOrderEnum.ASCENDING))
            		criteria.addOrder(Order.asc("persona.apellido"));
            	else
            		criteria.addOrder(Order.desc("persona.apellido"));
        	}

        	if (sortCriterion.equals(ConstantesInformes.ORDEN_X_TITULAR)){
            	if (sortDirection.equals(SortOrderEnum.ASCENDING))
            		criteria.addOrder(Order.asc("apellido"));
            	else
            		criteria.addOrder(Order.desc("apellido"));
        	}
        	
        	if (sortCriterion.equals(ConstantesInformes.ORDEN_X_CUIL)){
            	if (sortDirection.equals(SortOrderEnum.ASCENDING))
            		criteria.addOrder(Order.asc("cuilCuit"));
            	else
            		criteria.addOrder(Order.desc("cuilCuit"));
        	}

        	if (sortCriterion.equals(ConstantesInformes.ORDEN_X_NRO_CUENTA)){
            	if (sortDirection.equals(SortOrderEnum.ASCENDING))
            		criteria.addOrder(Order.asc("nroCuenta"));
            	else
            		criteria.addOrder(Order.desc("nroCuenta"));
        	}

        	if (sortCriterion.equals(ConstantesInformes.ORDEN_X_ZONA)){
            	if (StringUtils.isBlank(becado)){
        			criteria.createAlias("alumno.escuela", "escuela");
        			criteria.createAlias("escuela.localidad", "localidad");
        			criteria.createAlias("localidad.zona", "zona");
            	}
            	
            	if (sortDirection.equals(SortOrderEnum.ASCENDING))
            		criteria.addOrder(Order.asc("zona.id"));
            	else
            		criteria.addOrder(Order.desc("zona.id"));
        	}

        	if (sortCriterion.equals(ConstantesInformes.ORDEN_X_BANCO)){
            	if (StringUtils.isBlank(becado)){
        			criteria.createAlias("sucursalBanco", "sucursal");
        			criteria.createAlias("sucursal.banco", "banco");
            	}
            	
            	if (sortDirection.equals(SortOrderEnum.ASCENDING))
            		criteria.addOrder(Order.asc("banco.id"));
            	else
            		criteria.addOrder(Order.desc("banco.id"));
        	}

        	if (sortCriterion.equals(ConstantesInformes.ORDEN_X_FECHA)){
            	if (sortDirection.equals(SortOrderEnum.ASCENDING))
            		criteria.addOrder(Order.asc("fechaInactivo"));
            	else
            		criteria.addOrder(Order.desc("fechaInactivo"));
        	}
        	
		}

	    return getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
	}
	
	private DetachedCriteria getCriteriaRespInactivos(Banco banco,String becado, String titular, String numCuenta, Integer dniRA, Long zonaId) {
		
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("idAlumno", "alumno");
		
		//Filtro BANCO
		if(banco != null){
			criteria.createAlias("sucursalBanco", "sucursal");
			criteria.createAlias("sucursal.banco", "banco");
			criteria.add(Restrictions.eq("banco.id", banco.getId()));
		}
		
		//Filtro BECADO
		if((becado != null) && (!"".equals(becado))){
			criteria.createAlias("alumno.datosPersonales","persona");
			for ( String split : becado.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("persona.nombre", "%"+split+"%"), Restrictions.like("persona.apellido", "%"+split+"%")));

		}

		//Filtro TITULAR
		if((titular != null) && (!"".equals(titular))){
			for ( String split : titular.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("nombre", "%"+split+"%"), Restrictions.like("apellido", "%"+split+"%")));
		}
		
		//Filtro NUMERO CUENTA
		if((numCuenta != null) && (!"".equals(numCuenta))){
			criteria.add(Restrictions.like("nroCuenta",  "%"+numCuenta+"%"));
		}
		
		//Filtro DNI RA
		if((dniRA != null)){
			criteria.add(Restrictions.eq("dni", dniRA));
		}
		
		//Filtro EstadoCuenta
		criteria.add(Restrictions.eq("estadoCuenta", EstadoCuenta.INACTIVA));
		
		
		//Filtro ZONA
		if(zonaId != null){
			criteria.createAlias("alumno.escuela", "escuela");
			criteria.createAlias("escuela.localidad", "localidad");
			criteria.createAlias("localidad.zona", "zona");
			criteria.add(Restrictions.eq("zona.id", zonaId));
		}

		return criteria;
	}
}
