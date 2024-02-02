package org.cimientos.intranet.dao.impl;

import org.cimientos.intranet.dao.BoletinDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author msagarduy
 * @param 
 */
@Repository
public class BoletinDaoImpl extends SpringHibernateDao<Boletin> implements BoletinDao{

	/**
	 * @param sessionFactory
	 */
	@Autowired
	public BoletinDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}
	
	@Autowired
	private CicloProgramaSrv cicloProgramaSrv;
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<Boletin> getObjetoManejado() {
		return Boletin.class;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.BoletinDao#obtenerBoletinCicloAnterior(org.cimientos.intranet.modelo.perfil.PerfilAlumno)
	 */
	@Override
	public Boletin obtenerBoletinCicloAnterior(PerfilAlumno alumno) {
		Boletin boletin = null;
		Integer orden = null;
		if(alumno.getBeca() != null) //El estado del alumno es distinto a No Renovado / No Incorporado / Fin de participación de PBE
			orden = alumno.getBeca().getCiclo().getOrden();
		else //El estado del alumno es No Renovado / No Incorporado / Fin de participación de PBE
			orden = cicloProgramaSrv.obtenerCicloActual().getOrden();
		Query query = getSession().createQuery("select boletin from PerfilAlumno as alumno " +
				" inner join alumno.historialBoletin as boletin  " +
				" where alumno = :alumno and boletin.ciclo.orden = :orden ").
				setParameter("orden", --orden ).setParameter("alumno", alumno);
		boletin = (Boletin) query.uniqueResult();
		
		return boletin;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.BoletinDao#obtenerBoletinCicloAnterior(org.cimientos.intranet.modelo.perfil.PerfilAlumno)
	 */
	@Override
	public Boletin obtenerBoletinCicloInforme(PerfilAlumno alumno, CicloPrograma ciclo) {
		Boletin boletin = null;
		Integer orden = null;
		int ordenCicloActual = cicloProgramaSrv.obtenerCicloActual().getOrden();
		
		if(ciclo.getOrden().equals(ordenCicloActual)){ //el ciclo actual es el del informe a visualizar
			boletin = alumno.getBoletin();
		}	
		else{ // busco el boletin del historial con el ciclo del informe
			orden = ciclo.getOrden();
			Query query = getSession().createQuery("select boletin from PerfilAlumno as alumno " +
					" inner join alumno.historialBoletin as boletin  " +
					" where alumno = :alumno and boletin.ciclo.orden = :orden ").
					setParameter("orden", orden ).setParameter("alumno", alumno);
			boletin = (Boletin) query.uniqueResult();
			if(boletin == null)		//Si no tiene el boletín del historial devuelvo el actual del becado	
				boletin = alumno.getBoletin();
		}
		return boletin;
	}
}
