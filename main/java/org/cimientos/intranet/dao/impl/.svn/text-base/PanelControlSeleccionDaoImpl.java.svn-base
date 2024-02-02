package org.cimientos.intranet.dao.impl;

import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import org.cimientos.intranet.dao.PanelControlSeleccionDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.dto.PanelControlSeleccionDTO;
import org.cimientos.intranet.modelo.EstadoBeca;
import org.cimientos.intranet.modelo.EstadoCiclo;
import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PanelControlSeleccionDaoImpl extends SpringHibernateDao<PanelControlSeleccionDTO> implements PanelControlSeleccionDao {

	@Autowired
	public PanelControlSeleccionDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		
	}

	@Override
	protected Class<PanelControlSeleccionDTO> getObjetoManejado() {
		return null;
	}
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.BecaDao#obtenerBecasPanelSeleccion()
	 */
	@Override
	public List<PanelControlSeleccionDTO> obtenerBecasActual() {
		String sql = "select beca.id as idBeca, zona.id as idZona,ciclo.id as idCiclo, periodo.id as idPeriodo, zona.nombre as nombreZona," +
				" ciclo.nombre as nombreCiclo,periodo.nombre as nombrePeriodo , sum(beca.cantidad) as becasDisponibles, " +
				" sum(beca.cantidad_asignada) as becasAsignadas"  +
				" from beca beca ,zona_cimientos zona,periodo periodo,ciclo_programa ciclo " +
		" where beca.activo = true and (beca.ciclo = ciclo.id and ciclo.estado = ?)  " +
		" and beca.estado in (?,?) and beca.zona = zona.id and beca.periodo_pago = periodo.id group by idZona,idPeriodo ";
		
		
		SQLQuery query = getSession().createSQLQuery(sql);
		query.setInteger(0, EstadoCiclo.ACTUAL.getId()-1);
		query.setInteger(1, EstadoBeca.CONFIRMADA.getId()-1);
		query.setInteger(2, EstadoBeca.PLANIFICADA.getId()-1);
		query.addScalar("idBeca", Hibernate.LONG);
		query.addScalar("idCiclo", Hibernate.LONG);
		query.addScalar("idZona", Hibernate.LONG);
		query.addScalar("idPeriodo", Hibernate.LONG);
		query.addScalar("nombreZona", Hibernate.STRING);
		query.addScalar("nombrePeriodo", Hibernate.STRING);
		query.addScalar("nombreCiclo", Hibernate.STRING);
		query.addScalar("becasDisponibles", Hibernate.INTEGER);
		query.addScalar("becasAsignadas", Hibernate.INTEGER);
		query.setResultTransformer(Transformers.aliasToBean(PanelControlSeleccionDTO.class));
		return query.list();
	}

	@Override
	public Map<String, Long> cantidadBecadosPorZona() {
		String sql="select zona.nombre,count(alum.id) as cantidad from perfil_alumno alum, zona_cimientos zona ,beca b "+  
					" where b.id = alum.beca_id and b.zona = zona.id   group by zona.nombre";
		SQLQuery query = getSession().createSQLQuery(sql);
		query.addScalar("nombre", Hibernate.STRING);
		query.addScalar("cantidad", Hibernate.LONG);
		List<Object[]> resultado =  query.list();
		Map<String, Long> cantidades = new WeakHashMap<String, Long>();
		for (Object[] strings : resultado) {
			if(strings[0]!=null){
				cantidades.put((String)strings[0], (Long)strings[1]);
			}
		}
		return cantidades;
	}
	


}
