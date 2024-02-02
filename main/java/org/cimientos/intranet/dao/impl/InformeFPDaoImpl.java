package org.cimientos.intranet.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.InformeFPDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.FichaPresentacion;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.cimientos.intranet.utils.ConstantesInformes;
import org.displaytag.properties.SortOrderEnum;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class InformeFPDaoImpl extends SpringHibernateDao<FichaPresentacion> implements InformeFPDao
{
	
	@Autowired
	public InformeFPDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<FichaPresentacion> getObjetoManejado() {
		return FichaPresentacion.class;
	}

	@Override
	public List<FichaPresentacion> obtenerInformesConstruccion(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));		
		criteria.add(Restrictions.eq("estado", EstadoInforme.CONSTRUCCION));
		return criteria.list();
	}

	@Override
	public List<FichaPresentacion> obtenerInformesRevision(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.REVISION));
		return criteria.list();
	}

	@Override
	public List<FichaPresentacion> obtenerInformesCorreccion(CicloPrograma ciclo) {
		DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.CORRECTORA));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	@Override
	public List<FichaPresentacion> obtenerInformesFinalizados(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.FINALIZADO));
		return criteria.list();
	}

	@Override
	public FichaPresentacion obtenerInformePorAlumno(Long id) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("becado.id", id));
		criteria.addOrder(Order.desc("fechaAlta"));
		List<FichaPresentacion> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);		
		}
	}
	
	@Override
	public int obtenerCantidadFpARevisar(String tipoInforme, Integer idEstado, String nombreAlumno, CicloPrograma ciclo, 
									Long zonaId, Long idPadrino, Long idEA, Long idRR, Long tipoPadrinoId) 
	{
		DetachedCriteria criteria = getCriteriaInformesFpARevisar(tipoInforme, idEstado, nombreAlumno, ciclo, zonaId, idPadrino, idEA, idRR, tipoPadrinoId, null);
		criteria.setProjection(Projections.rowCount());
		List results = getHibernateTemplate().findByCriteria(criteria);
		int count = ((Integer) results.get(0)).intValue();
		return count;
	}
	
	private DetachedCriteria getCriteriaInformesFpARevisar(String tipoInforme, Integer idEstado, String nombreAlumno, CicloPrograma ciclo, 
													Long zonaId, Long idPadrino, Long idEA, Long idRR, Long tipoPadrinoId, String sortCriterion)
	{
		DetachedCriteria criteria = DetachedCriteria.forClass(FichaPresentacion.class);
		
		criteria.createAlias("padrino", "padrino");
		criteria.createAlias("padrino.datosPersonales", "persona", Criteria.LEFT_JOIN);
		criteria.createAlias("padrino.empresa", "empresa", Criteria.LEFT_JOIN);
	
		if(tipoInforme != null){
			criteria.add(Restrictions.eq("nombre", tipoInforme));
		}
		if(ciclo != null){
			criteria.add(Restrictions.eq("cicloActual", ciclo));
		}
		
		//Nuevo filtro zona!!!
		criteria.createAlias("beca", "beca");
		criteria.createAlias("beca.zona", "zona");
		if (zonaId!=null){
			criteria.add(Restrictions.eq("zona.id", zonaId));
		}
		
		criteria.createAlias("becado", "becado");
		criteria.createAlias("becado.datosPersonales", "alumno");
		if(StringUtils.isNotBlank(nombreAlumno)){
			for ( String split : nombreAlumno.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("alumno.nombre", "%"+split+"%"), Restrictions.like("alumno.apellido", "%"+split+"%")));
		}

		//Nuevo filtro nombre padrino!!!
		if (idPadrino != null){
			criteria.add(Restrictions.eq("padrino.id", idPadrino));
		}
		
		if(idEstado != null){
			criteria.add(Restrictions.eq("estado", EstadoInforme.getEstados(idEstado)));
		}
		else{
			criteria.add(Restrictions.in("estado", EstadoInforme.getListaEstadosSeleccion()));	
		}
		
		//Filtro nuevo perfil nombreEA
		criteria.createAlias("eaPerfil", "ea", CriteriaSpecification.LEFT_JOIN);
		if (idEA!=null){
			criteria.add(Restrictions.eq("ea.idPerfilEA", idEA));

		}
		
		//Filtro nuevo perfil nombreRR
		criteria.createAlias("rrPerfil", "rr", CriteriaSpecification.LEFT_JOIN);
		if (idRR != null){
			criteria.add(Restrictions.eq("rr.idPerfilRR", idRR));
		}

		//Filtro nuevo perfil nombreRR
		if(tipoPadrinoId != null){
			criteria.add(Restrictions.eq("padrino.tipo", TipoPadrino.getTipoPadrino(tipoPadrinoId.intValue())));
		}

		return criteria;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Informe> obtenerFpARevisar(String tipoInforme, Integer idEstado, String nombreAlumno, int firstResult, 
													int maxResults, SortOrderEnum sortDirection, String sortCriterion, CicloPrograma ciclo, 
													Long zonaId, Long idPadrino, Long idEA, Long idRR, Long tipoPadrinoId) {
		
		DetachedCriteria criteria = getCriteriaInformesFpARevisar(tipoInforme, idEstado, nombreAlumno, ciclo, zonaId, 
																	idPadrino, idEA, idRR, tipoPadrinoId, sortCriterion);


		if (StringUtils.isBlank(sortCriterion)) {
			criteria.addOrder(Order.asc("zona.nombre")).addOrder(Order.asc("alumno.apellido"));
		} else {
			if (sortCriterion.equalsIgnoreCase(ConstantesInformes.ORDEN_X_PADRINO)) {
				if (sortDirection.equals(SortOrderEnum.ASCENDING)){
					criteria.addOrder(Order.asc("persona.apellido")).addOrder(Order.asc("empresa.denominacion"));
				} else {
					criteria.addOrder(Order.desc("empresa.denominacion")).addOrder(Order.desc("persona.apellido"));
				}
			} else if (sortCriterion.equalsIgnoreCase(ConstantesInformes.ORDEN_X_ALUMNO)) {
				if (sortDirection.equals(SortOrderEnum.ASCENDING)){
					criteria.addOrder(Order.asc("alumno.apellido"));
				} else {
					criteria.addOrder(Order.desc("alumno.apellido"));
				}
			} else if (sortCriterion.equalsIgnoreCase(ConstantesInformes.ORDEN_X_ZONA)) {
				if (sortDirection.equals(SortOrderEnum.ASCENDING)){
					criteria.addOrder(Order.asc("zona.nombre"));
				} else {
					criteria.addOrder(Order.desc("zona.nombre"));
				}
			} else if (sortCriterion.equalsIgnoreCase(ConstantesInformes.ORDEN_X_EA)) {
				criteria.createAlias("ea.datosPersonales", "dp");
				if (sortDirection.equals(SortOrderEnum.ASCENDING)){
					criteria.addOrder(Order.asc("dp.apellido"));
				} else {
					criteria.addOrder(Order.desc("dp.apellido"));
				}
			} else if (sortCriterion.equalsIgnoreCase(ConstantesInformes.ORDEN_X_RR)) {
				criteria.createAlias("rr.datosPersonales", "dp", CriteriaSpecification.LEFT_JOIN);
				if (sortDirection.equals(SortOrderEnum.ASCENDING)){
					criteria.addOrder(Order.asc("dp.apellido"));
				} else {
					criteria.addOrder(Order.desc("dp.apellido"));
				}
			} else if (sortCriterion.equalsIgnoreCase(ConstantesInformes.ORDEN_X_FECHA_ALTA)) {
				if (sortDirection.equals(SortOrderEnum.ASCENDING)){
					criteria.addOrder(Order.asc("fechaAlta"));
				} else {
					criteria.addOrder(Order.desc("fechaAlta"));
				}
			}
		}
		return getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
	}
	
	@Override
	public FichaPresentacion obtenerInformePorAlumnoPorCiclo(CicloPrograma ciclo, Long id) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("becado.id", id));
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.addOrder(Order.desc("fechaAlta"));
		List<FichaPresentacion> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);		
		}
	}
	
	@Override
	public FichaPresentacion obtenerFPFinalizadaPorAlumno(Long id) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		List<EstadoInforme> estados = new ArrayList<EstadoInforme>();
		estados.add(EstadoInforme.FINALIZADO);
		estados.add(EstadoInforme.ENVIADO); 
		criteria.add(Restrictions.eq("becado.id", id));
		criteria.add(Restrictions.in("estado", estados));
		List<FichaPresentacion> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);		
		}
	}
	
}
