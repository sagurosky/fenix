package org.cimientos.intranet.dao.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.EntrevistaSeleccionDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.candidato.convocatoria.Convocatoria;
import org.cimientos.intranet.modelo.escuela.EscuelaSeleccion;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.seleccion.EntrevistaSeleccion;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.displaytag.properties.SortOrderEnum;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cimientos.intranet.enumerativos.AnioEscolar;
import com.cimientos.intranet.enumerativos.entrevista.EstadoEntrevista;

/**
 * The Class EntrevistaSeleccionDaoImpl.
 */
@Repository
public class EntrevistaSeleccionDaoImpl extends SpringHibernateDao<EntrevistaSeleccion> implements EntrevistaSeleccionDao {

	/**
	 * Instantiates a new entrevista seleccion dao impl.
	 *
	 * @param sessionFactory the session factory
	 * @since 13-dic-2010
	 * @author cfigueroa
	 */
	@Autowired
	public EntrevistaSeleccionDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<EntrevistaSeleccion> getObjetoManejado() {
		return EntrevistaSeleccion.class;
	}

	@Override
	public List<EntrevistaSeleccion> obtenerEntrevistasConstruccion() {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("estadoEntrevista", EstadoEntrevista.CONSTRUCCION));
		return (List<EntrevistaSeleccion>) criteria.list();
	}
	
	@Override
	public List<EntrevistaSeleccion> obtenerEntrevistasFinalizadas(EstadoAlumno estadoAlumno, ZonaCimientos zona,
																			Convocatoria convocatoria, CicloPrograma cicloPrograma,
																			EscuelaSeleccion escuela, AnioEscolar anioEscolar, String nombreAlumno, 
																			Date fechaDesde, Date fechaHasta,int firstResult,
																			int maxResults, SortOrderEnum sortDirection, String sortCriterion, String eae) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		getCriteriaReporteEntrevistas(estadoAlumno, zona, convocatoria,
				cicloPrograma, escuela, anioEscolar, nombreAlumno, fechaDesde, fechaHasta, firstResult,
				maxResults, criteria, eae);
		criteria.setFirstResult(firstResult);
		criteria.setMaxResults(maxResults);
		criteria.addOrder(Order.desc("fechaCargaEntrevista"));
		return criteria.list();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EntrevistaSeleccionDao#obtenerEntrevistaPorDniAlumno(java.lang.Long)
	 */
	
		public EntrevistaSeleccion obtenerEntrevistaPorDniAlumno(Integer alumnoDni) {
		Criteria criteriaSeleccion = getSession().createCriteria(getObjetoManejado());
		criteriaSeleccion.createAlias("perfilAlumno","alumno");
		criteriaSeleccion.createAlias("alumno.datosPersonales", "datosPersonales");
		criteriaSeleccion.add(Restrictions.eq("datosPersonales.dni", alumnoDni));
		criteriaSeleccion.addOrder(Order.desc("fechaCargaEntrevista"));
		List list  = criteriaSeleccion.list();
		if(list.isEmpty()){
			return null;
		}else{
			EntrevistaSeleccion entrevistaSeleccion = (EntrevistaSeleccion)criteriaSeleccion.list().get(0);
			return entrevistaSeleccion;
		}
	}
		
		@Override
		public EntrevistaSeleccion obtenerEntrevistaSeleccionPorAlumno(PerfilAlumno alumno ) {
			Criteria criteria = getSession().createCriteria(getObjetoManejado());
			criteria.createAlias("perfilAlumno","alumno");
			criteria.createAlias("alumno.datosPersonales", "persona");
			criteria.add(Restrictions.eq("persona.dni", alumno.getDatosPersonales().getDni()));
			criteria.addOrder(Order.desc("fechaCargaEntrevista"));
			if( criteria.list().isEmpty()){
				EntrevistaSeleccion entrevistaSeleccion = new EntrevistaSeleccion();
				return entrevistaSeleccion;
			}
			return (EntrevistaSeleccion) criteria.list().get(0);
		}

		/* (non-Javadoc)
		 * @see org.cimientos.intranet.dao.EntrevistaSeleccionDao#obtenerAlumnosSinBecaSeleccion()
		 */
		@Override
		public List<PerfilAlumno> obtenerAlumnosSinBecaSeleccion() {
			String sql = "select distinct al.* from entrevista_seleccion en , perfil_alumno al where en.perfil_alumno = al.id  and al.beca_id is null ";
			SQLQuery query = getSession().createSQLQuery(sql).addEntity(PerfilAlumno.class);
			List<PerfilAlumno> list = query.list();
			return list;
		}

		/* (non-Javadoc)
		 * @see org.cimientos.intranet.dao.EntrevistaSeleccionDao#obtenterCantidadEntrevistas(org.cimientos.intranet.modelo.perfil.EstadoAlumno, org.cimientos.intranet.modelo.ubicacion.ZonaCimientos, org.cimientos.intranet.modelo.candidato.convocatoria.Convocatoria, org.cimientos.intranet.modelo.CicloPrograma, org.cimientos.intranet.modelo.escuela.EscuelaSeleccion, com.cimientos.intranet.enumerativos.AnioEscolar, java.lang.String, int, int, org.displaytag.properties.SortOrderEnum, java.lang.String)
		 */
		@Override
		public Integer obtenterCantidadEntrevistas(
				EstadoAlumno estadoAlumno, ZonaCimientos zona,
				Convocatoria convocatoria, CicloPrograma cicloPrograma,
				EscuelaSeleccion escuela, AnioEscolar anioEscolar,				
				String nombreAlumno, Date fechaDesde, Date fechaHasta, int firstResult, int maxResults,
				SortOrderEnum sortDirection, String sortCriterion, String eae) {
			Criteria criteria = getSession().createCriteria(getObjetoManejado());
			
			getCriteriaReporteEntrevistas(estadoAlumno, zona, convocatoria,
					cicloPrograma, escuela, anioEscolar, nombreAlumno, fechaDesde, fechaHasta,
					firstResult, maxResults, criteria,eae);
			
			criteria.setProjection(Projections.rowCount());
			List list = criteria.list();
			if(list.isEmpty()){
				return 0;
			}else{
				return (Integer) list.get(0);
			}
		}

		private void getCriteriaReporteEntrevistas(EstadoAlumno estadoAlumno,
				ZonaCimientos zona, Convocatoria convocatoria,
				CicloPrograma cicloPrograma, EscuelaSeleccion escuela,
				AnioEscolar anioEscolar, String nombreAlumno, Date fechaDesde, Date fechaHasta, int firstResult,
				int maxResults, Criteria criteria, String eae) {

			criteria.addOrder(Order.desc("fechaCargaEntrevista"));
			criteria.createAlias("perfilAlumno", "alumno");
			criteria.createAlias("alumno.escuelaSeleccion", "escuela");
		
			if(estadoAlumno != null){
				criteria.add(Restrictions.eq("alumno.estadoAlumno",estadoAlumno));
			}
			
			if(fechaDesde!=null){
				criteria.add(Restrictions.ge("fechaCargaEntrevista",fechaDesde));
			}
			if(fechaHasta!=null){
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(fechaHasta); // Configuramos la fecha que se recibe					
				calendar.add(Calendar.DAY_OF_YEAR, 1);  // numero de días a añadir, o restar en caso de días<0
				//System.out.println(calendar.getTime());
				criteria.add(Restrictions.lt("fechaCargaEntrevista",calendar.getTime()));
			}
			
			if(zona != null){
				criteria.add(Restrictions.eq("escuela.zonaCimientos",zona));
			}
			
			
			if(eae!= null){
				if(eae.equals("todos") ){
					eae=null;
				}
			}
							
			if(eae!= null ){	
				criteria.add(Restrictions.eq("alumno.eae",eae));
			}
			
			if(convocatoria != null){
				criteria.add(Restrictions.eq("convocatoria",convocatoria));
			}
			if(cicloPrograma != null){
				criteria.add(Restrictions.eq("nombreCiclo", cicloPrograma.getNombre()));
			}
			if(escuela != null ){
				criteria.add(Restrictions.eq("alumno.escuelaSeleccion", escuela));
			}
			if(anioEscolar != null){
				criteria.add(Restrictions.eq("alumno.anioEscolar", anioEscolar));
			}
			if(StringUtils.isNotBlank(nombreAlumno)){
				criteria.createAlias("alumno.datosPersonales", "persona");
				for ( String split : nombreAlumno.split(" "))
					criteria.add(Restrictions.or(Restrictions.like("persona.nombre", "%"+split+"%"), Restrictions.like("persona.apellido", "%"+split+"%")));

				
			}
		}

		@Override
		public EntrevistaSeleccion obtenerEntrevistaSeleccionPorAlumnoAprobado(PerfilAlumno perfil) 
		{
			Criteria criteria = getSession().createCriteria(getObjetoManejado());
			criteria.createAlias("perfilAlumno","alumno");
			criteria.createAlias("alumno.datosPersonales", "persona");
			criteria.add(Restrictions.eq("persona.dni", perfil.getDatosPersonales().getDni()));
			criteria.addOrder(Order.desc("fechaCargaEntrevista"));
			if( criteria.list().isEmpty())
			{
				EntrevistaSeleccion entrevistaSeleccion = new EntrevistaSeleccion();
				return entrevistaSeleccion;
			}
			return (EntrevistaSeleccion) criteria.list().get(0);
		}
		
		@Override
		public List<EntrevistaSeleccion> obtenerEntrevistasSeleccionPorAlumno(PerfilAlumno alumno) {
			Criteria criteria = getSession().createCriteria(getObjetoManejado());
			criteria.createAlias("perfilAlumno","alumno");
			criteria.createAlias("alumno.datosPersonales", "persona");
			criteria.add(Restrictions.eq("persona.dni", alumno.getDatosPersonales().getDni()));
			criteria.addOrder(Order.desc("fechaCargaEntrevista"));
			List<EntrevistaSeleccion> entrevistas = criteria.list();
			if(entrevistas.isEmpty())
				return null;		
			else
				return entrevistas;
		}
		
		@Override
		public List<EntrevistaSeleccion> obtenerEntrevistasSeleccionPorIdAlumno(Long idAlumno) {
			Criteria criteria = getSession().createCriteria(getObjetoManejado());
			criteria.add(Restrictions.eq("idPerfilAlumno", idAlumno));
			criteria.addOrder(Order.desc("fechaCargaEntrevista"));
			List<EntrevistaSeleccion> entrevistas = criteria.list();
			if(entrevistas.isEmpty())
				return null;		
			else
				return entrevistas;
		}
}
