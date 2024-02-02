package org.cimientos.intranet.dao.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dao.TablaDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.dto.TablaDTO;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TablaDaoImpl extends SpringHibernateDao<Object> implements TablaDao {

	@Autowired
	public TablaDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<Object> getObjetoManejado() {
		return null;
	}

	@Override
	
	public List<TablaDTO> subtotalizar(String tabla, String campo) {
		
		StringBuilder sqlQuery = new StringBuilder("");
		String sql = 
			
			"SELECT " + campo + " AS nombre , count(*) AS repeticiones " +  
			" FROM " + tabla +
			" WHERE " + campo + " IS NOT NULL" +
			" GROUP BY " + campo;
		
		sqlQuery.append(sql);
		SQLQuery q = getSession().createSQLQuery(sqlQuery.toString());
		List<Object[]> list = q.list();
		List<TablaDTO> lista = new ArrayList<TablaDTO>();
		for (Object[] object : list) {
			TablaDTO dto = new TablaDTO();
			dto.setNombre( (String) object[0]);
			dto.setRepeticiones( ((BigInteger) object[1]).intValue());
			lista.add(dto);
		}
		return lista;
		
	}

}
