package org.cimientos.intranet.dao.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.UsuarioDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.usuario.Usuario;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


/**
 * @author msagarduy
 * Clase que implementa los metodos de la interfaz UsuarioDao. 
 * Utilizada para generar consultas a la DB.
 * Extiende {@link SpringHibernateDao}
 * 
 */
@Repository
public class UsuarioDaoImpl extends SpringHibernateDao<Usuario> implements UsuarioDao

{
	/**
	 * @param sessionFactory Objeto para abrir una sesion a la DB.
	 * Constructor de la clase.
	 */
	@Autowired
	public UsuarioDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);

	}

	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<Usuario> getObjetoManejado() {
			return Usuario.class;
	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.UsuarioDao#obtenerPorUsername(java.lang.String, boolean)
	 */
	@Override
	public Usuario obtenerPorUsername(String usuario , boolean soloActivos) {
		Criteria criteria = getSession().createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("usuario", usuario));
		criteria.add(Restrictions.eq("activo", true));
		
		List<Usuario> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (Usuario) result.get(0);	
		}
		
	}

	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.UsuarioDao#buscarPorEmail(java.lang.String)
	 */
	public Usuario buscarPorEmail(String email)
	{
		Criteria criteria = getSession().createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("mail", email));
		List<Usuario> result = criteria.list();
		if(result.isEmpty())
		{
			return null;
		}else
		{
			return result.get(0);	
		}
	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.UsuarioDao#obtenerPorPerfil(long)
	 */
	@Override
	public List<Usuario> obtenerPorPerfil(long id) 
	{
		String  query = "select u.id from Usuario as u \n" + 
		" inner join Usuario_Perfil as perfil \n" + 
		" on u.id = perfil.Usuario_id " +
		" where perfil.perfiles_id = " +id;
		org.hibernate.Query q = getSession().createQuery(query);
		List<Object> result = q.list();
		List<Long> ids = new ArrayList<Long>(result.size());
	
		for(Object row : result)
		{
			BigDecimal rawId = (BigDecimal)row;
			ids.add(rawId.longValue());
		}
		return obtenerGrupo("id", ids);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.UsuarioDao#obtenerUsuario(java.lang.String, java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Usuario obtenerUsuario(String usuario, String id) {
	
		final DetachedCriteria criteria = DetachedCriteria.forClass(Usuario.class);
		criteria.add(Restrictions.eq("usuario", usuario));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}

		final List<Usuario> usuarios = getHibernateTemplate().findByCriteria(criteria);

		if (usuarios != null && !usuarios.isEmpty()){
			return usuarios.get(0);
		} else {
			return null;

		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public Usuario obtenerUsuarioPorIgualUsuario(String usuario) 
	{
		Criteria criteria = getSession().createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("usuario", usuario));
		List<Usuario> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (Usuario) result.get(0);	
		}
		

	}


	@Override
	public List<Usuario> obtenerTodos() throws DataAccessException {
		
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		List<Usuario> list = criteria.list();
		return list;
	}


	@Override
	public Usuario obtenerUsuarioPorDni(Integer dni) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("persona","persona");
		criteria.add(Restrictions.eq("persona.dni", dni));
		List<Usuario> list = criteria.list();
		if(list.isEmpty()){
			return null;
		}else{
			return (Usuario) list.get(0);
		}
		
	}
	

}
