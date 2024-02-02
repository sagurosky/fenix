package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.AlumnoPanelEADao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AlumnoPanelEADaoImpl extends SpringHibernateDao<AlumnoPanelEA> implements AlumnoPanelEADao{

	
	@Autowired
	public AlumnoPanelEADaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	public List<AlumnoPanelEA> obtenerAlumnosPorEa(long idEa) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("idPerfilEA", idEa));
		criteria.add(Restrictions.eq("activo", true));
		return criteria.list();
	}

	@Override
	protected Class<AlumnoPanelEA> getObjetoManejado() {
		return AlumnoPanelEA.class;
	}

	@Override
	public void desactivarAlumnosCierreCiclo() {
		String sql = "update alumno_panelea set activo = false";
		Query query = getSession().createSQLQuery(sql);
		query.executeUpdate();
	}
	
	@Override
	public void activarAlumnos(List<Long> becados) 
	{
		String becadosIds = this.obtenerStringIds(becados);
		String sql = "update alumno_panelea set activo = true where id_perfil_alumno in(" + becadosIds + ")";
		Query query = getSession().createSQLQuery(sql);
		query.executeUpdate();

	}
	
	private String obtenerStringIds(List<Long> becados) {
		String result = "";
		for (Long id : becados) {
		result = result + id + ",";
		}

		if(result.length() > 0)
		return result.substring(0, result.length() -1);
		else
		return result;
	}

	@Override
	public AlumnoPanelEA obtenerAlumnoPanelPorIdPerfilAlumno(long idAlumno) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("idPerfilAlumno", idAlumno));
		if(criteria.list().isEmpty()){
			return null;
		}else{
			return (AlumnoPanelEA) criteria.list().get(0);	
		}
		
	}

	@Override
	public List<AlumnoPanelEA> obtenerAlumnosParaActivar(List<Long> becados) 
	{
		String becadosIds = this.obtenerStringIds(becados);
		String sql = "select * from alumno_panelea where id_perfil_alumno in(" + becadosIds + ")";
		Query query = getSession().createSQLQuery(sql);
		return query.list();

	}

	@Override
	public List<AlumnoPanelEA> obtenerPorIdPerfilAlumno(List<Long> becados) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.in("idPerfilAlumno", becados));
		return criteria.list();
	}



}
