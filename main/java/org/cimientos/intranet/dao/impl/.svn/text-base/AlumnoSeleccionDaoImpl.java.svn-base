package org.cimientos.intranet.dao.impl;

import org.cimientos.intranet.dao.AlumnoSeleccionDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.perfil.AlumnoSeleccion;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AlumnoSeleccionDaoImpl extends SpringHibernateDao<AlumnoSeleccion> implements AlumnoSeleccionDao  {

	@Autowired
	public AlumnoSeleccionDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		
	}

	@Override
	protected Class<AlumnoSeleccion> getObjetoManejado() 
	{
		return AlumnoSeleccion.class;
	}

}
