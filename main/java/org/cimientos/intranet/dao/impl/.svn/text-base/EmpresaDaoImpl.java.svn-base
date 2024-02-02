package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.EmpresaDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.empresa.Empresa;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * @author plabaronnie
 * Clase que implementa los metodos de la interfaz EmpresaDao. 
 * Utilizada para generar consultas a la DB.
 * Extiende {@link SpringHibernateDao}
 * 
 */
@Repository
public class EmpresaDaoImpl extends SpringHibernateDao<Empresa> implements EmpresaDao

{
	/**
	 * @param sessionFactory Objeto para abrir una sesion a la DB.
	 * Constructor de la clase.
	 */
	@Autowired
	public EmpresaDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);

	}

	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<Empresa> getObjetoManejado() {
			return Empresa.class;
	}

	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EmpresaDao#obtenerEmpresasActivos()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Empresa> obtenerEmpresasActivos() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Empresa.class);
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EmpresaDao#obtenerEmpresa(java.lang.String, java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Empresa obtenerEmpresa(String nombre, String id) {
	
		final DetachedCriteria criteria = DetachedCriteria.forClass(Empresa.class);
		criteria.add(Restrictions.eq("denominacion", nombre));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));

		final List<Empresa> empresas = getHibernateTemplate().findByCriteria(criteria);

		if (empresas != null && !empresas.isEmpty()){
			return empresas.get(0);
		} else {
			return null;

		}

	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EmpresaDao#obtenerEmpresaPorIgualNombre(java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Empresa obtenerEmpresaPorIgualNombre(String nombre) 
	{
		final DetachedCriteria criteria = DetachedCriteria.forClass(Empresa.class);
		criteria.add(Restrictions.eq("denominacion", nombre));
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));

		final List<Empresa> empresas = getHibernateTemplate().findByCriteria(criteria);

		if (empresas != null && !empresas.isEmpty()){
			return empresas.get(0);
		} else {
			return null;

		}

	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EmpresaDao#buscarPorCUIT(java.lang.String)
	 */
	@Override
	public Empresa buscarPorCUIT(String cuit) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(Empresa.class);
		criteria.add(Restrictions.eq("CUIT", cuit));
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));

		final List<Empresa> empresas = getHibernateTemplate().findByCriteria(criteria);

		if (empresas != null && !empresas.isEmpty()){
			return empresas.get(0);
		} else {
			return null;

		}
	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EmpresaDao#buscarPorIgualCUIT(java.lang.String, java.lang.Long)
	 */
	@Override
	public Empresa buscarPorIgualCUIT(String cuit, Long id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(Empresa.class);
		criteria.add(Restrictions.eq("CUIT", cuit));
		if(id != null){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));

		final List<Empresa> empresas = getHibernateTemplate().findByCriteria(criteria);

		if (empresas != null && !empresas.isEmpty()){
			return empresas.get(0);
		} else {
			return null;

		}
	}


}
