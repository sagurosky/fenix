package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.ObjetivoSeleccionDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.objetivoseleccion.ObjetivoSeleccion;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * The Class ObjetivoSeleccionDaoImpl.
 *
 * @author nlopez
 */

@Repository
public class ObjetivoSeleccionDaoImpl extends SpringHibernateDao<ObjetivoSeleccion> implements ObjetivoSeleccionDao{

	/**
	 * Instantiates a new registrar objetivo seleccion dao impl.
	 *
	 * @param sessionFactory the session factory
	 * @since 23-nov-2010
	 * @author nlopez
	 */
	@Autowired
	public ObjetivoSeleccionDaoImpl(SessionFactory sessionFactory){		
		super(sessionFactory);		
	}
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<ObjetivoSeleccion> getObjetoManejado() {
		return ObjetivoSeleccion.class;
	}	
	
	@Override
	public ObjetivoSeleccion obtenerBecasPorCesadosporCicloPeriodo( CicloPrograma ciclo ){
		DetachedCriteria criteria =DetachedCriteria.forClass(getObjetoManejado());
		List list  = getHibernateTemplate().findByCriteria(criteria);
		if(list.isEmpty()){
			return new  ObjetivoSeleccion();
		}else{
			return (ObjetivoSeleccion)getHibernateTemplate().findByCriteria(criteria).get(0);				
		}
		
	}

	@Override
	public Integer obtenerCantidadBecasPorIdCicloIdPeriodoIdZona(Long idCiclo,Long idPeriodo,Long idZona) {
		Criteria criteria =getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloPrograma", "ciclo");
		criteria.createAlias("zona", "zona");
		criteria.createAlias("periodo", "periodo");
		criteria.add(Restrictions.eq("ciclo.id", idCiclo));
		criteria.add(Restrictions.eq("zona.id", idZona));
		criteria.add(Restrictions.eq("periodo.id", idPeriodo));
		criteria.setFirstResult(0);
		
		List<ObjetivoSeleccion> list = criteria.list();
		if(list.isEmpty()){
			return  0;
		}else{
			ObjetivoSeleccion objetivoSeleccion = (ObjetivoSeleccion)list.get(0);
			Integer value = objetivoSeleccion.getCantidadBecas().intValue(); 
			flush();
			return value;
		}


	}

	@Override
	public List<ObjetivoSeleccion> obtenerObjetivoSeleccionPorPeriodoCiclo(Periodo periodo,CicloPrograma cicloPrograma) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("periodo.id",periodo.getId()));
		criteria.add(Restrictions.eq("cicloPrograma.id",cicloPrograma.getId()));
		return criteria.list();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ObjetivoSeleccionDao#obtenerCicloPrograma()
	 */
	@Override
	public List<CicloPrograma> obtenerCicloPrograma() {
		
		SQLQuery sqlQuery = getSession().createSQLQuery("select distinct ciclo.* from  objetivoseleccion  objSel , cicloPrograma ciclo where ciclo.id= objSel.cicloprograma_id");
		//Esto lo que le indica a hibernate  de que tipo son los datos de la columna
		sqlQuery.addScalar("id", Hibernate.LONG);
		sqlQuery.addScalar("nombre", Hibernate.STRING);
		//ESto es para que hibernate mapea lo que devuelve la consulta en un objeto 
		sqlQuery.setResultTransformer(Transformers.aliasToBean(CicloPrograma.class));
		
		return sqlQuery.list();
	}

	@Override
	public List<ObjetivoSeleccion> obtenerObjetivoSeleciconPorCiclo(CicloPrograma cicloPrograma) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("cicloPrograma.id", cicloPrograma.getId()));
		return criteria.list();
	}


}
