package org.cimientos.intranet.web.controller;

import java.beans.PropertyEditorSupport;
import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.Materia;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.InformeIS3;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.servicio.AlumnoPanelEASrv;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.InformeIS3Srv;
import org.cimientos.intranet.servicio.InformeSrv;
import org.cimientos.intranet.servicio.MateriaSrv;
import org.cimientos.intranet.servicio.PeriodoSrv;
import org.cimientos.intranet.utils.ConstantesInformes;
import org.cimientos.intranet.utils.ConstantesPaneles;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.entrevista.DetalleGastos;


@Controller
@RequestMapping("/informeIS3/*") 
public class InformeIS3Controller extends BaseController{
	
	@Autowired
	private InformeSrv srvInforme;
	
	@Autowired
	private InformeIS3Srv srvInformeIS3;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;
		
	@Autowired
	private AlumnoPanelEASrv alumnoPanelEaSrv;
	
	@Autowired
	private PeriodoSrv srvPeriodo;
	
	@Autowired
	private MateriaSrv srvMateria;
	
	@Autowired
	private AlumnoSrv srvAlumno;
	

	private static final String ACCION_REVISAR = "revisar";
	
	private Map<String, Object> cargarDatosInforme(Long idInforme) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		InformeIS3 informeIS3 = srvInformeIS3.obtenerInformeIS3(idInforme);
		PerfilAlumno becado = informeIS3.getBecado();
		Periodo periodoFechaPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informeIS3.getFechaPBE());	
		Boletin boletin = srvInforme.getBoletinCicloInforme(informeIS3.getBecado(), informeIS3.getCicloActual());
		
		List<Materia> listaMaterias = null;
		if(boletin != null)
		{
			listaMaterias = boletin.getMaterias();			
		}
		else{
			listaMaterias = srvMateria.obtenerMateriasBasicas(true);			
		}
		String materiasInteres = "";
		if (informeIS3.getMateriasInteres()!= null && !informeIS3.getMateriasInteres().equals("")){
			List<Long> listLocalMateriasInteres = null;
			listLocalMateriasInteres = new ArrayList<Long>();
			listLocalMateriasInteres = Formateador.toListOfLongs(informeIS3.getMateriasInteres());
			for (Iterator iterator = listLocalMateriasInteres.iterator(); iterator.hasNext();) {
				Long pos = (Long) iterator.next();
				String materia = this.obtenerMateriaSeleccionada(listaMaterias, pos);
				if(materiasInteres.equals(""))
					materiasInteres += materia;				
				else 
					materiasInteres += ", " + materia;				
			}
		}	
		String materiasCuestan = "";
		if (informeIS3.getMateriasCuestan()!= null && !informeIS3.getMateriasCuestan().equals("")){
			List<Long> listLocalMateriasCuestan = null;			
			listLocalMateriasCuestan = new ArrayList<Long>();
			listLocalMateriasCuestan = Formateador.toListOfLongs(informeIS3.getMateriasCuestan());
			for (Iterator iterator = listLocalMateriasCuestan.iterator(); iterator.hasNext();) {
				Long pos = (Long) iterator.next();
				String materia = this.obtenerMateriaSeleccionada(listaMaterias, pos);
				if(materiasCuestan.equals(""))
					materiasCuestan += materia;				
				else 
					materiasCuestan += ", " + materia;				
			}
		}
		if(!informeIS3.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(becado.getDatosPersonales().getFechaNacimiento());
			informeIS3.setEdad(edad);
		}
		srvInformeIS3.guardarInformeIS3(informeIS3);
		
		File file = new File(getProps().getProperty(ConstantesInformes.pathImagen) 
				+ becado.getDatosPersonales().getDni().toString() + ConstantesInformes.extensionImagen);
		if(file.exists())
			resul.put("tieneFoto", true);			
		else
			resul.put("tieneFoto", false);	
		
		if(informeIS3.getSuspensionesCantidad() != null && informeIS3.getSuspensionesCantidad() > 0)
			resul.put("tieneSuspensiones", true);	
		else
			resul.put("tieneSuspensiones", false);	
		
		if(informeIS3.getFechaPBE() != null)
			if(periodoFechaPBE != null)
				resul.put("periodoFechaPBE", periodoFechaPBE.getNombre() + " " + periodoFechaPBE.getCiclo().getNombre());
			else
				resul.put("periodoFechaPBE",Formateador.formatearFechas(informeIS3.getFechaPBE(), "dd/MM/yyyy"));
		
		if(informeIS3.getFechaReincorporacionPBE()!= null){ // es un chico reincorporado
			Periodo periodoFechaReincorporacionPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informeIS3.getFechaReincorporacionPBE());
				if(periodoFechaReincorporacionPBE != null)
					resul.put("periodoFechaReincorporacionPBE", periodoFechaReincorporacionPBE.getNombre() + " " + periodoFechaReincorporacionPBE.getCiclo().getNombre());
				else
					resul.put("periodoFechaReincorporacionPBE",Formateador.formatearFechas(informeIS3.getFechaReincorporacionPBE(), "dd/MM/yyyy"));
		}
		else{
			resul.put("periodoFechaReincorporacionPBE",null);
		}
		
		
		resul.put("osme", informeIS3.getOsme());
		resul.put("alo", informeIS3.getAlo());
		resul.put("hsTrabajarAño", informeIS3.getHsTrabajarAño());
		resul.put("sarpepe", informeIS3.getSarpepe());
		resul.put("qtam", informeIS3.getQtam());
		resul.put("cantidadBecadosCimiento", informeIS3.getCantidadBecados());
		resul.put("estadoEntrevista", informeIS3.getEi().getEstadoEntrevista().getId());
		resul.put("evalRenovacionBeca", informeIS3.getEvalRenovacionBeca());
		resul.put("informe", informeIS3);
		resul.put("cicloActual", srvCiclo.obtenerCicloActual());
		resul.put("cantMateriasDesaprobadas", informeIS3.getMateriasDesaprobadas());
		resul.put("cantInasistencias", informeIS3.getInasistencias());
		resul.put("mensajePadrino", informeIS3.getMensajePadrino());
		resul.put("actividadAcompanamiento", informeIS3.getActividadAcompanamiento());
		resul.put("materiasInteres", materiasInteres);
		resul.put("materiasCuestan", materiasCuestan);	
		resul.put("edad", informeIS3.getEdad());
		resul.put("becado", becado);
		
		
		Long idEntrevista = 0L;
		Connection cn0 = null;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		if (informeIS3.getEstadoIS3().equals("0")){
			try {
				String query = "select tarang,paa,vtepa,vtepb,vtepc,vtepd,vtepe,vtepf,vtepg,vteph,vtepi,iatarni,sus,ige, qtam , contenidos_trabajar_durante_anio, hs_trabajar_año, sarpepe, osme, id, proposito_anual,iamp from entrevista where periodo_de_pago=395 and perfil_alumno="
						+ informeIS3.getBecado().getId();
	
				cn0 = Conexion.getConexion();
				Statement st = cn0.createStatement();
				ResultSet rs0 = st.executeQuery(query);
	
				while (rs0.next()) {
					idEntrevista = Long.parseLong(rs0.getString("id"));
					resul.put("qtam", rs0.getString("qtam"));
					resul.put("actividadAcompanamiento",
							rs0.getString("contenidos_trabajar_durante_anio"));
					resul.put("hsTrabajarAño", rs0.getString("hs_trabajar_año"));
					resul.put("sarpepe", rs0.getString("sarpepe"));
					resul.put("osme", rs0.getString("osme"));
					resul.put("propositoAnual", rs0.getString("proposito_anual"));
					resul.put("iamp", rs0.getString("iamp"));
	
					resul.put("tarang", rs0.getString("tarang"));
					resul.put("paa", rs0.getString("paa"));
					resul.put("vtepa", rs0.getString("vtepa"));
					resul.put("vtepb", rs0.getString("vtepb"));
					resul.put("vtepc", rs0.getString("vtepc"));
					resul.put("vtepd", rs0.getString("vtepd"));
					resul.put("vtepe", rs0.getString("vtepe"));
					resul.put("vtepf", rs0.getString("vtepf"));
					resul.put("vtepg", rs0.getString("vtepg"));
					resul.put("vteph", rs0.getString("vteph"));
					resul.put("vtepi", rs0.getString("vtepi"));
					resul.put("iatarni", rs0.getString("iatarni"));
					
					resul.put("sus", rs0.getString("sus"));
					resul.put("ige", rs0.getString("ige"));
	
				}
				st.close();
				Conexion.cerrarConexion(cn0);
			} catch (SQLException e) {
				e.printStackTrace();
	
				Conexion.cerrarConexion(cn0);
			} catch (Exception e) {
				e.printStackTrace();
	
				Conexion.cerrarConexion(cn0);
			}
			
			String cta = "";
			try {
				String query = "select * from contenidos_trabajar_en_el_anio where contenidos_trabajar_en_el_anio.entrevista="
						+ idEntrevista;

				cn0 = Conexion.getConexion();
				Statement st = cn0.createStatement();
				ResultSet rs0 = st.executeQuery(query);

				while (rs0.next()) {
					// System.out.println(rs0.getString(2));
					if (Long.parseLong(rs0.getString(2)) == 0) {
						cta = "Autoconcepto - Autoconocimiento y autoestima";
					}
					if (Long.parseLong(rs0.getString(2)) == 1) {
						cta = cta + "Autoconcepto - Autoeficacia y autoconfianza";
					}
					if (Long.parseLong(rs0.getString(2)) == 2) {
						cta = cta
								+ "Responsabilidad y autonomía - Responsabilidad y compromiso";
					}
					if (Long.parseLong(rs0.getString(2)) == 3) {
						cta = cta
								+ "Responsabilidad y autonomía - Autocontrol y determinación";
					}
					if (Long.parseLong(rs0.getString(2)) == 4) {
						cta = cta + "Responsabilidad y autonomía - Autonomía";
					}
					if (Long.parseLong(rs0.getString(2)) == 5) {
						cta = cta
								+ "Planificación y organización del tiempo - Planificación y proyecto de vida";
					}
					if (Long.parseLong(rs0.getString(2)) == 6) {
						cta = cta
								+ "Planificación y organización del tiempo - Organización del tiempo";
					}
					if (Long.parseLong(rs0.getString(2)) == 7) {
						cta = cta
								+ "Planificación y organización del tiempo - Hábitos de estudio";
					}
					if (Long.parseLong(rs0.getString(2)) == 8) {
						cta = cta
								+ "Toma de decisiones - Pensamiento crítico y creativo";
					}
					if (Long.parseLong(rs0.getString(2)) == 9) {
						cta = cta + "Toma de decisiones - Entusiasmo por aprender";
					}
					if (Long.parseLong(rs0.getString(2)) == 10) {
						cta = cta
								+ "Toma de decisiones - Sentido de la oportunidad";
					}
					if (Long.parseLong(rs0.getString(2)) == 11) {
						cta = cta
								+ "Relaciones Interpersonales - Asertividad y comunicación";
					}
					if (Long.parseLong(rs0.getString(2)) == 12) {
						cta = cta
								+ "Relaciones Interpersonales - Empatía y trabajo con otros";
					}
					if (Long.parseLong(rs0.getString(2)) == 13) {
						cta = cta
								+ "Relaciones Interpersonales - Convivencia y resolución de conflictos";
					}
					if (Long.parseLong(rs0.getString(2)) == 14) {
						cta = cta + "Relaciones Interpersonales - Participación";
					}
					if (Long.parseLong(rs0.getString(2)) == 15) {
						cta = cta + "Egreso Efectivo y transición post-escolar";
					}
					if (Long.parseLong(rs0.getString(2)) == 16) {
						cta = cta + "Elección de la orientación y cambio de ciclo";
					}
					if (Long.parseLong(rs0.getString(2)) == 17) {
						cta = cta + "Transición primaria-secundaria";
					}
					cta = cta + "\n";

				}
				st.close();
				Conexion.cerrarConexion(cn0);
			} catch (SQLException e) {
				e.printStackTrace();

				Conexion.cerrarConexion(cn0);
			} catch (Exception e) {
				e.printStackTrace();

				Conexion.cerrarConexion(cn0);
			}

			resul.put("actividadAcompanamiento", cta);
			
		}
		
		if (informeIS3.getEstadoIS3().equals("1")){
			try {
				String query = "select tarang,paa,vtepa,vtepb,vtepc,vtepd,vtepe,vtepf,vtepg,vteph,vtepi,iatarni,sus,ige, qtam , actividad_acompanamiento, hs_trabajar_año, sarpepe, osme, id, proposito_anual,iamp from informe where ciclo_actual=33 and tipo='informeis3' and becado="
						+ informeIS3.getBecado().getId();
	
				cn0 = Conexion.getConexion();
				Statement st = cn0.createStatement();
				ResultSet rs0 = st.executeQuery(query);
	
				while (rs0.next()) {
					idEntrevista = Long.parseLong(rs0.getString("id"));
					resul.put("qtam", rs0.getString("qtam"));
					resul.put("actividadAcompanamiento",
							rs0.getString("actividad_acompanamiento"));
					resul.put("hsTrabajarAño", rs0.getString("hs_trabajar_año"));
					resul.put("sarpepe", rs0.getString("sarpepe"));
					resul.put("osme", rs0.getString("osme"));
					resul.put("propositoAnual", rs0.getString("proposito_anual"));
					resul.put("iamp", rs0.getString("iamp"));
	
					resul.put("tarang", rs0.getString("tarang"));
					resul.put("paa", rs0.getString("paa"));
					resul.put("vtepa", rs0.getString("vtepa"));
					resul.put("vtepb", rs0.getString("vtepb"));
					resul.put("vtepc", rs0.getString("vtepc"));
					resul.put("vtepd", rs0.getString("vtepd"));
					resul.put("vtepe", rs0.getString("vtepe"));
					resul.put("vtepf", rs0.getString("vtepf"));
					resul.put("vtepg", rs0.getString("vtepg"));
					resul.put("vteph", rs0.getString("vteph"));
					resul.put("vtepi", rs0.getString("vtepi"));
					resul.put("iatarni", rs0.getString("iatarni"));
					
					resul.put("sus", rs0.getString("sus"));
					resul.put("ige", rs0.getString("ige"));
	
				}
				st.close();
				Conexion.cerrarConexion(cn0);
			} catch (SQLException e) {
				e.printStackTrace();
	
				Conexion.cerrarConexion(cn0);
			} catch (Exception e) {
				e.printStackTrace();
	
				Conexion.cerrarConexion(cn0);
			}
			
			
			
		}
		
		
		
		// marterias previas
		
		String materiasPendientes="";
		try {  
            String query="select materia,anio_escolar from previas_nuevo p where ja<>'Aprobado' and di<>'Aprobado' and fb<>'Aprobado' and ma<>'Aprobado' and mam<>'Aprobado' and idbecado="+ informeIS3.getBecado().getId();
            cn0 = Conexion.getConexion();
            Statement st = cn0.createStatement();
            ResultSet rs0 = st.executeQuery(query);        
		    
            while (rs0.next()) {	                    
            	materiasPendientes=materiasPendientes+rs0.getString("materia")+" - "+rs0.getString("anio_escolar")+", ";
	            
            }
           //entrevistaIndividual.setMp(materiasPendientes);
           resul.put("mp", materiasPendientes);
           
           st.close();
           
            
	        Conexion.cerrarConexion(cn0);
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
	        Conexion.cerrarConexion(cn0);
		}
		
		
		String suspensiones="0";
		try {  
            String query="select count(id) as suspensiones from entrevista e where e.fecha_carga>='2023-01-01' and e.evaluacion_cobro_beca=1 and e.perfil_alumno="+informeIS3.getBecado().getId();
            cn0 = Conexion.getConexion();
            Statement st = cn0.createStatement();
            ResultSet rs0 = st.executeQuery(query);         
		    
            while (rs0.next()) {	                    
            	suspensiones=rs0.getString("suspensiones");
	            
            }
           informeIS3.setSuspensiones(suspensiones);
            
           st.close();
            
	        Conexion.cerrarConexion(cn0);
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
	        Conexion.cerrarConexion(cn0);
		}
		
		resul.put("sus", suspensiones);

		
		
		
		
		
		
		return resul;
	}
			
	@RequestMapping("/informeIS3/modificarView.do")
	public ModelAndView modificarView(@RequestParam ("idInformeIS3") Long idInforme,
									  @RequestParam (required=false, value="urlRegreso") String urlRegreso,
									  @RequestParam(required=false, value="accion") String accion,
									  @RequestParam(required=false, value="valorPerfil") String valorPerfil){
									  
		Map<String, Object> resul = new HashMap<String, Object>();
		InformeIS3 informeIS3 = srvInformeIS3.obtenerInformeIS3(idInforme);
		PerfilAlumno becado = informeIS3.getBecado();
		Periodo periodoFechaPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informeIS3.getFechaPBE());			
		List<Long> listLocalMateriasInteres = null;
		informeIS3.setCantidadBecados(srvAlumno.cantidadAlumnosActivosMismaEscuela(informeIS3.getBecado().getEscuela()));
		
		
		
		int cantMateriasInteres = 0;
		if (informeIS3.getMateriasInteres()!= null && !informeIS3.getMateriasInteres().equals("")){
			listLocalMateriasInteres = new ArrayList<Long>();
			listLocalMateriasInteres = Formateador.toListOfLongs(informeIS3.getMateriasInteres());
			cantMateriasInteres = listLocalMateriasInteres.size();
		}		
		List<Long> listLocalMateriasCuestan = null;
		int cantMateriasCuestan = 0;
		if (informeIS3.getMateriasCuestan()!= null && !informeIS3.getMateriasCuestan().equals("")){
			listLocalMateriasCuestan = new ArrayList<Long>();
			listLocalMateriasCuestan = Formateador.toListOfLongs(informeIS3.getMateriasCuestan());
			cantMateriasCuestan = listLocalMateriasCuestan.size();
		}
		List<Integer> listLocalDetalleGastos = new ArrayList<Integer>();
		if(informeIS3.getDetalleGastos()!= null && !informeIS3.getDetalleGastos().isEmpty()){
			for (Iterator iterator = informeIS3.getDetalleGastos().iterator(); iterator.hasNext();) {
				DetalleGastos detalle = (DetalleGastos) iterator.next();
				listLocalDetalleGastos.add(detalle.getId());				
			}
		}			 		
		resul.put("osme", informeIS3.getOsme());
		resul.put("alo", informeIS3.getAlo());
		resul.put("hsTrabajarAño", informeIS3.getHsTrabajarAño());
		resul.put("sarpepe", informeIS3.getSarpepe());
		resul.put("qtam", informeIS3.getQtam());
		resul.put("cantidadBecadosCimiento", informeIS3.getCantidadBecados());
		resul.put("estadoEntrevista", informeIS3.getEi().getEstadoEntrevista().getId());
		resul.put("evalRenovacionBeca", informeIS3.getEvalRenovacionBeca());
		resul.put("informe", informeIS3);
		resul.put("cicloActual", srvCiclo.obtenerCicloActual());
		resul.put("cantMateriasDesaprobadas", informeIS3.getMateriasDesaprobadas());
		resul.put("cantInasistencias", informeIS3.getInasistencias());
		resul.put("mensajePadrino", informeIS3.getMensajePadrino());
		resul.put("actividadAcompanamiento", informeIS3.getActividadAcompanamiento());
		resul.put("materiasInteres", informeIS3.getMateriasInteres());
		resul.put("idMateriaInteres", listLocalMateriasInteres);
		resul.put("cantMateriasInteres", cantMateriasInteres);
		resul.put("materiasCuestan", informeIS3.getMateriasCuestan());
		resul.put("idMateriaCuestan", listLocalMateriasCuestan);	
		resul.put("cantMateriasCuestan", cantMateriasCuestan);
		resul.put("listaDetalleGastos", DetalleGastos.getDetalleGastos());
		resul.put("idDetalleGastos", listLocalDetalleGastos);
		
		resul.put("escuelaNombre", informeIS3.getBecado().getEscuela().getNombre());
		resul.put("modalidadTrabajoEscuela", informeIS3.getBecado().getEscuela().getModalidadTrabajoEscuela());
		resul.put("escuelaComienzoPBE", informeIS3.getBecado().getEscuela().getAnioIncorporacion());
		resul.put("escuelaMatricula", informeIS3.getBecado().getEscuela().getMatricula());
		System.out.println(informeIS3.getBecado().getEscuela().getNombre());
		
		Long idEntrevista = 0L;
		Connection cn0 = null;
		if (informeIS3.getEstadoIS3().equals("0")){
			try {
				String query = "select tarang,paa,vtepa,vtepb,vtepc,vtepd,vtepe,vtepf,vtepg,vteph,vtepi,iatarni,sus,ige, qtam , contenidos_trabajar_durante_anio, hs_trabajar_año, sarpepe, osme, id, proposito_anual,iamp from entrevista where periodo_de_pago=395 and perfil_alumno="
						+ informeIS3.getBecado().getId();
	
				cn0 = Conexion.getConexion();
				Statement st = cn0.createStatement();
				ResultSet rs0 = st.executeQuery(query);
	
				while (rs0.next()) {
					idEntrevista = Long.parseLong(rs0.getString("id"));
					resul.put("qtam", rs0.getString("qtam"));
					resul.put("actividadAcompanamiento",
							rs0.getString("contenidos_trabajar_durante_anio"));
					resul.put("hsTrabajarAño", rs0.getString("hs_trabajar_año"));
					resul.put("sarpepe", rs0.getString("sarpepe"));
					resul.put("osme", rs0.getString("osme"));
					resul.put("propositoAnual", rs0.getString("proposito_anual"));
					resul.put("iamp", rs0.getString("iamp"));
	
					resul.put("tarang", rs0.getString("tarang"));
					resul.put("paa", rs0.getString("paa"));
					resul.put("vtepa", rs0.getString("vtepa"));
					resul.put("vtepb", rs0.getString("vtepb"));
					resul.put("vtepc", rs0.getString("vtepc"));
					resul.put("vtepd", rs0.getString("vtepd"));
					resul.put("vtepe", rs0.getString("vtepe"));
					resul.put("vtepf", rs0.getString("vtepf"));
					resul.put("vtepg", rs0.getString("vtepg"));
					resul.put("vteph", rs0.getString("vteph"));
					resul.put("vtepi", rs0.getString("vtepi"));
					resul.put("iatarni", rs0.getString("iatarni"));
					
					resul.put("sus", rs0.getString("sus"));
					resul.put("ige", rs0.getString("ige"));
	
				}
				st.close();
				Conexion.cerrarConexion(cn0);
			} catch (SQLException e) {
				e.printStackTrace();
	
				Conexion.cerrarConexion(cn0);
			} catch (Exception e) {
				e.printStackTrace();
	
				Conexion.cerrarConexion(cn0);
			}
			
			String cta = "";
			try {
				String query = "select * from contenidos_trabajar_en_el_anio where contenidos_trabajar_en_el_anio.entrevista="
						+ idEntrevista;

				cn0 = Conexion.getConexion();
				Statement st = cn0.createStatement();
				ResultSet rs0 = st.executeQuery(query);

				while (rs0.next()) {
					// System.out.println(rs0.getString(2));
					if (Long.parseLong(rs0.getString(2)) == 0) {
						cta = "Autoconcepto - Autoconocimiento y autoestima";
					}
					if (Long.parseLong(rs0.getString(2)) == 1) {
						cta = cta + "Autoconcepto - Autoeficacia y autoconfianza";
					}
					if (Long.parseLong(rs0.getString(2)) == 2) {
						cta = cta
								+ "Responsabilidad y autonomía - Responsabilidad y compromiso";
					}
					if (Long.parseLong(rs0.getString(2)) == 3) {
						cta = cta
								+ "Responsabilidad y autonomía - Autocontrol y determinación";
					}
					if (Long.parseLong(rs0.getString(2)) == 4) {
						cta = cta + "Responsabilidad y autonomía - Autonomía";
					}
					if (Long.parseLong(rs0.getString(2)) == 5) {
						cta = cta
								+ "Planificación y organización del tiempo - Planificación y proyecto de vida";
					}
					if (Long.parseLong(rs0.getString(2)) == 6) {
						cta = cta
								+ "Planificación y organización del tiempo - Organización del tiempo";
					}
					if (Long.parseLong(rs0.getString(2)) == 7) {
						cta = cta
								+ "Planificación y organización del tiempo - Hábitos de estudio";
					}
					if (Long.parseLong(rs0.getString(2)) == 8) {
						cta = cta
								+ "Toma de decisiones - Pensamiento crítico y creativo";
					}
					if (Long.parseLong(rs0.getString(2)) == 9) {
						cta = cta + "Toma de decisiones - Entusiasmo por aprender";
					}
					if (Long.parseLong(rs0.getString(2)) == 10) {
						cta = cta
								+ "Toma de decisiones - Sentido de la oportunidad";
					}
					if (Long.parseLong(rs0.getString(2)) == 11) {
						cta = cta
								+ "Relaciones Interpersonales - Asertividad y comunicación";
					}
					if (Long.parseLong(rs0.getString(2)) == 12) {
						cta = cta
								+ "Relaciones Interpersonales - Empatía y trabajo con otros";
					}
					if (Long.parseLong(rs0.getString(2)) == 13) {
						cta = cta
								+ "Relaciones Interpersonales - Convivencia y resolución de conflictos";
					}
					if (Long.parseLong(rs0.getString(2)) == 14) {
						cta = cta + "Relaciones Interpersonales - Participación";
					}
					if (Long.parseLong(rs0.getString(2)) == 15) {
						cta = cta + "Egreso Efectivo y transición post-escolar";
					}
					if (Long.parseLong(rs0.getString(2)) == 16) {
						cta = cta + "Elección de la orientación y cambio de ciclo";
					}
					if (Long.parseLong(rs0.getString(2)) == 17) {
						cta = cta + "Transición primaria-secundaria";
					}
					cta = cta + "\n";

				}
				st.close();
				Conexion.cerrarConexion(cn0);
			} catch (SQLException e) {
				e.printStackTrace();

				Conexion.cerrarConexion(cn0);
			} catch (Exception e) {
				e.printStackTrace();

				Conexion.cerrarConexion(cn0);
			}

			resul.put("actividadAcompanamiento", cta);
			
		}
		
		if (informeIS3.getEstadoIS3().equals("1")){
			try {
				String query = "select tarang,paa,vtepa,vtepb,vtepc,vtepd,vtepe,vtepf,vtepg,vteph,vtepi,iatarni,sus,ige, qtam , actividad_acompanamiento, hs_trabajar_año, sarpepe, osme, id, proposito_anual,iamp from informe where ciclo_actual=33 and tipo='informeis3' and becado="
						+ informeIS3.getBecado().getId();
	
				cn0 = Conexion.getConexion();
				Statement st = cn0.createStatement();
				ResultSet rs0 = st.executeQuery(query);
	
				while (rs0.next()) {
					idEntrevista = Long.parseLong(rs0.getString("id"));
					resul.put("qtam", rs0.getString("qtam"));
					resul.put("actividadAcompanamiento",
							rs0.getString("actividad_acompanamiento"));
					resul.put("hsTrabajarAño", rs0.getString("hs_trabajar_año"));
					resul.put("sarpepe", rs0.getString("sarpepe"));
					resul.put("osme", rs0.getString("osme"));
					resul.put("propositoAnual", rs0.getString("proposito_anual"));
					resul.put("iamp", rs0.getString("iamp"));
	
					resul.put("tarang", rs0.getString("tarang"));
					resul.put("paa", rs0.getString("paa"));
					resul.put("vtepa", rs0.getString("vtepa"));
					resul.put("vtepb", rs0.getString("vtepb"));
					resul.put("vtepc", rs0.getString("vtepc"));
					resul.put("vtepd", rs0.getString("vtepd"));
					resul.put("vtepe", rs0.getString("vtepe"));
					resul.put("vtepf", rs0.getString("vtepf"));
					resul.put("vtepg", rs0.getString("vtepg"));
					resul.put("vteph", rs0.getString("vteph"));
					resul.put("vtepi", rs0.getString("vtepi"));
					resul.put("iatarni", rs0.getString("iatarni"));
					
					resul.put("sus", rs0.getString("sus"));
					resul.put("ige", rs0.getString("ige"));
	
				}
				st.close();
				Conexion.cerrarConexion(cn0);
			} catch (SQLException e) {
				e.printStackTrace();
	
				Conexion.cerrarConexion(cn0);
			} catch (Exception e) {
				e.printStackTrace();
	
				Conexion.cerrarConexion(cn0);
			}
			
			
			
		}
		
		
		
		// marterias previas
		
		String materiasPendientes="";
		try {  
            String query="select materia,anio_escolar from previas_nuevo p where ja<>'Aprobado' and di<>'Aprobado' and fb<>'Aprobado' and ma<>'Aprobado' and mam<>'Aprobado' and idbecado="+ informeIS3.getBecado().getId();
            cn0 = Conexion.getConexion();
            Statement st = cn0.createStatement();
            ResultSet rs0 = st.executeQuery(query);        
		    
            while (rs0.next()) {	                    
            	materiasPendientes=materiasPendientes+rs0.getString("materia")+" - "+rs0.getString("anio_escolar")+", ";
	            
            }
           //entrevistaIndividual.setMp(materiasPendientes);
           resul.put("mp", materiasPendientes);
           
           st.close();
           
            
	        Conexion.cerrarConexion(cn0);
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
	        Conexion.cerrarConexion(cn0);
		}
		
		
		String suspensiones="0";
		try {  
            String query="select count(id) as suspensiones from entrevista e where e.fecha_carga>='2023-01-01' and e.evaluacion_cobro_beca=1 and e.perfil_alumno="+informeIS3.getBecado().getId();
            cn0 = Conexion.getConexion();
            Statement st = cn0.createStatement();
            ResultSet rs0 = st.executeQuery(query);         
		    
            while (rs0.next()) {	                    
            	suspensiones=rs0.getString("suspensiones");
	            
            }
           informeIS3.setSuspensiones(suspensiones);
            
           st.close();
            
	        Conexion.cerrarConexion(cn0);
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
	        Conexion.cerrarConexion(cn0);
		}
		
		resul.put("sus", suspensiones);
		
		

		
		
		
		
		
		
		if(!informeIS3.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(becado.getDatosPersonales().getFechaNacimiento());
			informeIS3.setEdad(edad);
		}
		srvInformeIS3.guardarInformeIS3(informeIS3);
		resul.put("edad", informeIS3.getEdad());
		resul.put("becado", becado);
		resul.put("idInformeIS3", idInforme);		
		resul.put("urlRegreso", urlRegreso);
		
		/*
		Boletin boletin = srvInforme.getBoletinCicloInforme(becado, informeIS3.getCicloActual());
		if(boletin != null)	{
			resul.put("boletin", boletin);
			resul.put("listMateriasInteres", boletin.getMaterias());
			resul.put("listMateriasCuestan", boletin.getMaterias());
			resul.put("primero", boletin.getTrimestres().get(0));
			resul.put("segundo", boletin.getTrimestres().get(1));
			resul.put("tercero", boletin.getTrimestres().get(2));
		}
		else{
			List<Materia> materiasTroncales = srvMateria.obtenerMateriasBasicas(true);
			resul.put("listMateriasInteres", materiasTroncales);
			resul.put("listMateriasCuestan", materiasTroncales);
		}
		
		File file = new File(getProps().getProperty(ConstantesInformes.pathImagen) 
				+ becado.getDatosPersonales().getDni().toString() + ConstantesInformes.extensionImagen);
		if(file.exists())
			resul.put("tieneFoto", true);			
		else
			resul.put("tieneFoto", false);	
		
		if(informeIS3.getSuspensionesCantidad() != null && informeIS3.getSuspensionesCantidad() > 0)
			resul.put("tieneSuspensiones", true);	
		else
			resul.put("tieneSuspensiones", false);	
		*/

		
		if(informeIS3.getFechaPBE() != null)
			if(periodoFechaPBE != null)
				resul.put("periodoFechaPBE", periodoFechaPBE.getNombre() + " " + periodoFechaPBE.getCiclo().getNombre());
			else
				resul.put("periodoFechaPBE",Formateador.formatearFechas(informeIS3.getFechaPBE(), "dd/MM/yyyy"));
		
		if(informeIS3.getFechaReincorporacionPBE()!= null){ // es un chico reincorporado
			Periodo periodoFechaReincorporacionPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informeIS3.getFechaReincorporacionPBE());
				if(periodoFechaReincorporacionPBE != null)
					resul.put("periodoFechaReincorporacionPBE", periodoFechaReincorporacionPBE.getNombre() + " " + periodoFechaReincorporacionPBE.getCiclo().getNombre());
				else
					resul.put("periodoFechaReincorporacionPBE",Formateador.formatearFechas(informeIS3.getFechaReincorporacionPBE(), "dd/MM/yyyy"));
		}
		else{
			resul.put("periodoFechaReincorporacionPBE",null);
		}
		
		if(accion != null && accion.equals("edicion")){
			resul.put("urlRegreso", "/reporteGeneralInformes/verReporteGeneralInformes.do");
			resul.put("valorPerfil", valorPerfil);
			resul.put("estadoConstruccion", EstadoInforme.CONSTRUCCION.getValor());
			resul.put("estadoFinalizado", EstadoInforme.FINALIZADO.getValor());
			return forward("/informeIS3/actualizarInformeIS3", resul);
		}
		
		return forward("/informeIS3/modificarInformeIS3", resul);
	}
	
	@RequestMapping("/informeIS3/modificarIS3.do")
	public ModelAndView modificarInformeInformeIS3(HttpServletRequest req,	
					@RequestParam(required=false, value="idInformeIS3") Long idInformeIS3,
					@RequestParam(required=false, value="accion") String accion,
					@RequestParam("cantMateriasDesaprobadas") Integer cantMateriasDesaprobadas,
					@RequestParam("cantInasistencias") Float cantInasistencias,
					@RequestParam("mensajePadrino") String mensajePadrino,
					@RequestParam("actividadAcompanamiento") String actividadAcompanamiento,
					@RequestParam("materiasInteres") String materiasInteres,
					@RequestParam("hsTrabajarAño") String hsTrabajarAño,					
					@RequestParam("qtam") String qtam,
					@RequestParam("osme") String osme,
					@RequestParam("alo") String alo,
					@RequestParam("materiasCuestan") String materiasCuestan, 
					@RequestParam(required=false, value="idDetalleGastos") List<Integer> detallesGastos, 
					@RequestParam("idAlumno") Long idAlumno,
					@RequestParam("edad") Integer edad,
					@RequestParam("tarang") String tarang,
					@RequestParam("paa") String paa,
					@RequestParam("vtepa") String vtepa,
					@RequestParam("vtepb") String vtepb,
					@RequestParam("vtepc") String vtepc,
					@RequestParam("vtepd") String vtepd,
					@RequestParam("vtepe") String vtepe,
					@RequestParam("vtepf") String vtepf,
					@RequestParam("vtepg") String vtepg,
					@RequestParam("vteph") String vteph,
					@RequestParam("vtepi") String vtepi,
					@RequestParam("iatarni") String iatarni,
					@RequestParam("mp") String mp,
					@RequestParam("sus") String sus,
					@RequestParam("ige") String ige,
					@RequestParam("sarpepe") String sarpepe,
					@RequestParam("estadoIS3") String estadoIS3,
					@RequestParam(required=false, value = "urlRegreso") String urlRegreso){
					
		Map<String, Object> resul = new HashMap<String, Object>();
		ModelAndView modelAndView = null;
		InformeIS3 informeIS3 = srvInformeIS3.obtenerInformeIS3(idInformeIS3);
		PerfilAlumno becado = srvAlumno.obtenerAlumno(idAlumno);

		if(!informeIS3.getEstado().equals(EstadoInforme.ENVIADO)){
			Integer edadBecado = Formateador.calcularEdad(informeIS3.getBecado().getDatosPersonales().getFechaNacimiento());
			informeIS3.setEdad(edadBecado);
		}
		informeIS3.setActividadAcompanamiento(actividadAcompanamiento);
		informeIS3.setMensajePadrino(mensajePadrino);
//		informeIS3.setCicloActual(srvCiclo.obtenerCicloActual());
		informeIS3.setEaPerfil(becado.getEa());
		informeIS3.setRrPerfil(becado.getEa().getRr());
		informeIS3.setFechaPBE(becado.getFechaPBE());
		informeIS3.setFechaReincorporacionPBE(becado.getFechaReincorporacionPBE());
		informeIS3.setFechaUltimaModificacion(new Date());
		informeIS3.setHsTrabajarAño(hsTrabajarAño);
		
		informeIS3.setTarang(tarang);
		informeIS3.setPaa(paa);
		informeIS3.setVtepa(vtepa);
		informeIS3.setVtepb(vtepb);
		informeIS3.setVtepc(vtepc);		
		informeIS3.setVtepd(vtepd);
		informeIS3.setVtepe(vtepe);
		informeIS3.setVtepf(vtepf);
		informeIS3.setVtepg(vtepg);
		informeIS3.setVteph(vteph);
		informeIS3.setVtepi(vtepi);
		informeIS3.setIatarni(iatarni);
		informeIS3.setMp(mp);
		informeIS3.setSus(sus);
		informeIS3.setIge(ige);
		informeIS3.setSarpepe(sarpepe);
		informeIS3.setEstadoIS3(estadoIS3);
		
		
		
		if(sarpepe!=null){
			informeIS3.setSarpepe(sarpepe);
		}else{
			informeIS3.setSarpepe("");
		}
		if(qtam!=null){
			informeIS3.setQtam(qtam);
		}else{
			informeIS3.setQtam("");
		}
			
		if(osme!=null){
			informeIS3.setOsme(osme);
		}else{
			informeIS3.setOsme("");
		}
		
		if(alo!=null){
			informeIS3.setAlo(alo);
		}else{
			informeIS3.setAlo("");
		}
		
		
				
//		informeIS3.setPadrino(becado.getBeca().getPadrino());
//		informeIS3.setBeca(becado.getBeca());
		informeIS3.setBecado(becado);
		informeIS3.setFechaCambioUltimoEstado(new Date());
		informeIS3.setMateriasDesaprobadas(cantMateriasDesaprobadas);
		informeIS3.setInasistencias(cantInasistencias);
		informeIS3.setMateriasCuestan(materiasCuestan);
		informeIS3.setMateriasInteres(materiasInteres);
		List<DetalleGastos> listDetalleGasto = new ArrayList<DetalleGastos>();
		String utilizacionBeca = "";
		if (detallesGastos!=null && detallesGastos.size()>0){
			for (Iterator iterator = detallesGastos.iterator(); iterator.hasNext();) {
				Integer idDetalleGasto = (Integer) iterator.next();
				DetalleGastos detalleGasto = DetalleGastos.getDetalleGastos(idDetalleGasto);
				listDetalleGasto.add(detalleGasto);
			}
			utilizacionBeca = this.convertirDetellaGastosString(listDetalleGasto);
		}
		informeIS3.setDetalleGastos(listDetalleGasto);
		informeIS3.setUtilizacionBeca(utilizacionBeca);
		if(accion != null && accion.equals(ACCION_REVISAR)){
			informeIS3.setEstado(EstadoInforme.CONSTRUCCION);
		}
		
		srvInformeIS3.guardarInformeIS3(informeIS3);
		resul.put("mensaje", "El Informe de Seguimiento Nº3 del becado " + becado.getDatosPersonales().getApellidoNombre() + 
				" ha sido guardado en Construcción");			
		if(StringUtils.isNotBlank(urlRegreso)){
		//	modelAndView = new ModelAndView(urlRegreso, resul);
			return modelAndView = new ModelAndView("redirect:" + urlRegreso, resul);
		}
		else
			return modelAndView = new ModelAndView("redirect:/informes/listaInformesConstruccion.do", resul);
		
	}
	
	
	@RequestMapping("/informeIS3/finalizar.do")
	public ModelAndView finalizar(HttpServletRequest req,	
			@RequestParam("idInformeIS3") Long idInformeIS3,
			@RequestParam(required=false, value="accion") String accion,
			@RequestParam("cantMateriasDesaprobadas") Integer cantMateriasDesaprobadas,
			@RequestParam("cantInasistencias") Float cantInasistencias,
			@RequestParam("mensajePadrino") String mensajePadrino,
			@RequestParam("actividadAcompanamiento") String actividadAcompanamiento,
			@RequestParam("materiasInteres") String materiasInteres, 
			@RequestParam("materiasCuestan") String materiasCuestan, 
			@RequestParam(required=false, value="idDetalleGastos") List<Integer> detallesGastos, 
			@RequestParam("idAlumno") Long idAlumno,
			@RequestParam("edad") Integer edad,
			@RequestParam("hsTrabajarAño") String hsTrabajarAño,
			@RequestParam("sarpepe") String sarpepe,
			@RequestParam("qtam") String qtam,
			@RequestParam("osme") String osme,
			@RequestParam("alo") String alo,
			@RequestParam("tarang") String tarang,
			@RequestParam("paa") String paa,
			@RequestParam("vtepa") String vtepa,
			@RequestParam("vtepb") String vtepb,
			@RequestParam("vtepc") String vtepc,
			@RequestParam("vtepd") String vtepd,
			@RequestParam("vtepe") String vtepe,
			@RequestParam("vtepf") String vtepf,
			@RequestParam("vtepg") String vtepg,
			@RequestParam("vteph") String vteph,
			@RequestParam("vtepi") String vtepi,
			@RequestParam("iatarni") String iatarni,
			@RequestParam("mp") String mp,
			@RequestParam("sus") String sus,
			@RequestParam("ige") String ige,			
			@RequestParam("estadoIS3") String estadoIS3,
			@RequestParam(required=false, value = "urlRegreso") String urlRegreso){
		
		
			
		
		
			
			Map<String, Object> resul = new HashMap<String, Object>();
			ModelAndView modelAndView = null;
			InformeIS3 informeIS3 = srvInformeIS3.obtenerInformeIS3(idInformeIS3);
			PerfilAlumno becado = srvAlumno.obtenerAlumno(idAlumno);
			
			if(!informeIS3.getEstado().equals(EstadoInforme.ENVIADO)){
				Integer edadBecado = Formateador.calcularEdad(informeIS3.getBecado().getDatosPersonales().getFechaNacimiento());
				informeIS3.setEdad(edadBecado);
			}
			informeIS3.setActividadAcompanamiento(actividadAcompanamiento);
			informeIS3.setMensajePadrino(mensajePadrino);
//			informeIS3.setCicloActual(srvCiclo.obtenerCicloActual());
			informeIS3.setEaPerfil(becado.getEa());
			informeIS3.setRrPerfil(becado.getEa().getRr());
			informeIS3.setFechaPBE(becado.getFechaPBE());
			informeIS3.setFechaReincorporacionPBE(becado.getFechaReincorporacionPBE());
			informeIS3.setFechaUltimaModificacion(new Date());
			informeIS3.setBecado(becado);
			informeIS3.setFechaCambioUltimoEstado(new Date());
			informeIS3.setMateriasDesaprobadas(cantMateriasDesaprobadas);
			informeIS3.setInasistencias(cantInasistencias);
			informeIS3.setMateriasCuestan(materiasCuestan);
			informeIS3.setMateriasInteres(materiasInteres);
			informeIS3.setHsTrabajarAño(hsTrabajarAño);
			
			informeIS3.setTarang(tarang);
			informeIS3.setPaa(paa);
			informeIS3.setVtepa(vtepa);
			informeIS3.setVtepb(vtepb);
			informeIS3.setVtepc(vtepc);		
			informeIS3.setVtepd(vtepd);
			informeIS3.setVtepe(vtepe);
			informeIS3.setVtepf(vtepf);
			informeIS3.setVtepg(vtepg);
			informeIS3.setVteph(vteph);
			informeIS3.setVtepi(vtepi);
			informeIS3.setIatarni(iatarni);
			informeIS3.setMp(mp);
			informeIS3.setSus(sus);
			informeIS3.setIge(ige);
			informeIS3.setSarpepe(sarpepe);
			informeIS3.setEstadoIS3(estadoIS3);
			
			if(sarpepe!=null){
				informeIS3.setSarpepe(sarpepe);
			}else{
				informeIS3.setSarpepe("");
			}
			if(qtam!=null){
				informeIS3.setQtam(qtam);
			}else{
				informeIS3.setQtam("");
			}
				
			if(osme!=null){
				informeIS3.setOsme(osme);
			}else{
				informeIS3.setOsme("");
			}
			
			if(alo!=null){
				informeIS3.setAlo(alo);
			}else{
				informeIS3.setAlo("");
			}
			
			List<DetalleGastos> listDetalleGasto = new ArrayList<DetalleGastos>();
			String utilizacionBeca = "";
			if (detallesGastos!=null && detallesGastos.size()>0){
				for (Iterator iterator = detallesGastos.iterator(); iterator.hasNext();) {
					Integer idDetalleGasto = (Integer) iterator.next();
					DetalleGastos detalleGasto = DetalleGastos.getDetalleGastos(idDetalleGasto);
					listDetalleGasto.add(detalleGasto);
				}
				utilizacionBeca = this.convertirDetellaGastosString(listDetalleGasto);
			}
			informeIS3.setDetalleGastos(listDetalleGasto);
			informeIS3.setUtilizacionBeca(utilizacionBeca);
			informeIS3.setEstado(EstadoInforme.FINALIZADO);
	
			srvInformeIS3.guardarInformeIS3(informeIS3);
	
			resul.put("mensaje", "El Informe de Seguimiento Nº3 del becado " + becado.getDatosPersonales().getApellidoNombre() + 
				" ha sido Finalizado");
			if(StringUtils.isNotBlank(urlRegreso)){
				//	model = new ModelAndView(urlRegreso, resul);
				return new ModelAndView("redirect:" + urlRegreso, resul);
			}
			else
				return new ModelAndView("redirect:/informes/listaInformesConstruccion.do", resul);
	}
		
	
	@RequestMapping("/informeIS3/verInformeIS3.do")
	public ModelAndView verInforme(@RequestParam ("idAlumno") Long idAlumno){

		AlumnoPanelEA alumnoPanel = alumnoPanelEaSrv.obtenerAlumnoPanelPorIdPerfilAlumno(idAlumno);
		InformeIS3 informe = srvInformeIS3.obtenerInformePorAlumno(alumnoPanel.getIdPerfilAlumno(),srvCiclo.obtenerCicloActual());
		
		if(informe.getEstado().equals(EstadoInforme.CONSTRUCCION))
		{
			String urlRegreso = "/entrevistas/listarBecados.do";
			return  modificarView(informe.getId(), urlRegreso, "","");
		}
		else{
			Map<String, Object> resul = cargarDatosInforme(informe.getId());
			return forward("/informeIS3/verIS3", resul);
		}
	}

	@RequestMapping("/informeIS3/verInformeIS3General.do")
	public ModelAndView verInformeIS3(@RequestParam ("idInformeIS3") Long idInformeIS3){

		InformeIS3 informe = srvInformeIS3.obtenerInformeIS3(idInformeIS3);
		Map<String, Object> resul = cargarDatosInforme(informe.getId());
		
		return forward("/informeIS3/verIS3", resul);
		
	}		

	@RequestMapping("/informeIS3/eliminarIS3.do")
	public ModelAndView eliminarIS3(@RequestParam ("idIS3") Long idIS3, @RequestParam ("urlRegreso") String urlRegreso){
		ModelAndView modelAndView = new ModelAndView("redirect:/reporteGeneralInformes/verReporteGeneralInformes.do");
		String mensaje = "";
		String error = "";
		InformeIS3 informeIS3 = srvInformeIS3.obtenerInformeIS3(idIS3);
		if(!informeIS3.getEstado().equals(EstadoInforme.ENVIADO)){
			CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
			boolean infoCicloActual = true;
			if(!cicloActual.equals(informeIS3.getCicloActual())){
				infoCicloActual = false;
			}
			if(infoCicloActual){
				srvInformeIS3.eliminarInformeIS3(informeIS3);
				AlumnoPanelEA ape = alumnoPanelEaSrv.obtenerAlumnoPanelPorIdPerfilAlumno(informeIS3.getBecado().getId());
				if(ape != null){
					ape.setColorIS3(ConstantesPaneles.RED);					
					alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
				}
			}
			else{
				srvInformeIS3.eliminarInformeIS3(informeIS3);
			}
			mensaje = "El Informe de Seguimiento Nº3 del becado " + informeIS3.getBecado().getDatosPersonales().getApellidoNombre() + 
					" ha sido eliminado";
		}
		else
			error = "El Informe de Seguimiento Nº3 del becado " + informeIS3.getBecado().getDatosPersonales().getApellidoNombre() + 
				" no se puede eliminar porque el mismo ya ha sido enviada al padrino";
		
		if(StringUtils.isNotBlank(mensaje))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?mensaje=" + mensaje);
		if(StringUtils.isNotBlank(error))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?error=" + error);
		
		return modelAndView;
	}
	
	@InitBinder
	public void initBinder(HttpServletRequest request,WebDataBinder binder) {
		
	    // custom date binding
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	    
	    // DetalleGastos binding
	    binder.registerCustomEditor(DetalleGastos.class, new PropertyEditorSupport() {
	        @Override
	        public void setAsText(String text) {
	            int id = Integer.parseInt(text);
	            DetalleGastos valor = DetalleGastos.getDetalleGastos(id);
	            setValue(valor);
	        }
	    });
	    
	}
	
	private String obtenerMateriaSeleccionada(List<Materia> listaMaterias, Long pos){
		int i = 0;
		String materia = "";
		boolean encontro = false;
		while (i< listaMaterias.size() && !encontro) {
			if(listaMaterias.get(i).getId().equals(pos)){
				materia = listaMaterias.get(i).getNombre();
				encontro = true;
			}
			i++;
		}
		return materia;
	}
	
	private String convertirDetellaGastosString(List<DetalleGastos> detalleGastos){
		String utilizacion = "";
		if(detalleGastos != null && !detalleGastos.isEmpty()){
			for (int i = 0; i <= detalleGastos.size(); i++ ){				
				if((detalleGastos.size()-1) == i)				
					utilizacion += detalleGastos.get(i).getValor().toLowerCase() + ". ";
				else if (detalleGastos.size() != i)
					utilizacion += detalleGastos.get(i).getValor().toLowerCase() + ", ";				
			}
			utilizacion = Formateador.capitalizarPrimerLetra(utilizacion);
		}
		return utilizacion;
	}
}
