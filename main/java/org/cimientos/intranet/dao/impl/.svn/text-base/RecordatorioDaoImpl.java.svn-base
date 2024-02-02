package org.cimientos.intranet.dao.impl;



import java.util.List;

import org.cimientos.intranet.dao.RecordatorioDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.usuario.Recordatorio;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class RecordatorioDaoImpl extends SpringHibernateDao<Recordatorio>
		implements RecordatorioDao {

	
	
	@Autowired
	public RecordatorioDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);

	}

	
	@Override
	protected Class<Recordatorio> getObjetoManejado() {
		return Recordatorio.class;
	}


	@Override
	public List<Recordatorio> obtenerRecordatorios() {
		return null;
	}


}
