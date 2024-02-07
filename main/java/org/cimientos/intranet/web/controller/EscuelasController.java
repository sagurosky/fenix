package org.cimientos.intranet.web.controller;

import java.beans.PropertyEditorSupport;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.perfil.Turno;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.EscuelaSrv;
import org.cimientos.intranet.servicio.LocalidadSrv;
import org.cimientos.intranet.servicio.ProvinciaSrv;
import org.cimientos.intranet.servicio.RegistrarEscuelasBecasSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.cimientos.intranet.utils.ConstantesInformes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.AniosEscuela;
import com.cimientos.intranet.enumerativos.Dependencia;
import com.cimientos.intranet.enumerativos.DesplegadoEscuela;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaAccesibilidad;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaCED;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaECTAES;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaProyeccionPFE;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaREFP;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaSINO;
import com.cimientos.intranet.enumerativos.EspacioApoyo;
import com.cimientos.intranet.enumerativos.EstadoEscuela;
import com.cimientos.intranet.enumerativos.FaseProyecto;
import com.cimientos.intranet.enumerativos.Modalidad;
import com.cimientos.intranet.enumerativos.ModalidadTrabajoEscuela;
import com.cimientos.intranet.enumerativos.NecesidadesEscuela;
import com.cimientos.intranet.enumerativos.NivelEscuela;
import com.cimientos.intranet.enumerativos.Programa;


@Controller
@RequestMapping("/escuela/*")
public class EscuelasController extends BaseController {
	
	@Autowired
	private RegistrarEscuelasBecasSrv registrarEscuelasBecasSrv;
	
	@Autowired
	EscuelaSrv escuelaService;
	
	@Autowired
	LocalidadSrv localidadService;
	
	@Autowired
	ZonaCimientosSrv zonaService;
	
	@Autowired
	ProvinciaSrv provinciaService;
	
	@Autowired
	CicloProgramaSrv cicloSrv;

	private Map<String,Object> map;
	
	//Constante para identificar desde cuando se necesitan los ciclos
	private static String ciclo2009 = "2009";
	private static String ciclo2000 = "2000";
	
	/**
	 * View registrar escuela.
	 *
	 * @return the model and view
	 * @since 18-nov-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/escuela/viewAltaEscuela")
	public ModelAndView viewAltaEscuela(){
		map = new HashMap<String, Object>();
		map.put("escuela", new Escuela());
		map.put("listLocalidades", registrarEscuelasBecasSrv.obtenerLocalidades());
		map.put("listProvincias", registrarEscuelasBecasSrv.obtenerProvincias());
		List<EstadoEscuela> estados = new ArrayList<EstadoEscuela>();
		estados.add(EstadoEscuela.NO_SELECCIONADA);
		estados.add(EstadoEscuela.PARTICIPANDO_PROGRAMA);
		estados.add(EstadoEscuela.INACTIVA);
		map.put("estadosEscuela", estados);
		map.put("programas", Programa.getListaPrograma());
		map.put("desplegableEscuela", DesplegadoEscuela.getListaPrograma());
		map.put("desplegableEscuela", DesplegadoEscuela.getListaPrograma());
		map.put("ced", DesplegadoEscuelaCED.getListaPrograma());
		map.put("refp", DesplegadoEscuelaREFP.getListaPrograma());
		map.put("acc", DesplegadoEscuelaAccesibilidad.getListaPrograma());
		map.put("proPFE", DesplegadoEscuelaProyeccionPFE.getListaPrograma());				
		map.put("ectaes", DesplegadoEscuelaECTAES.getListaPrograma());
		map.put("eddes", DesplegadoEscuela.getListaPrograma());
		map.put("edfea", DesplegadoEscuela.getListaPrograma());
		map.put("edbis", DesplegadoEscuela.getListaPrograma());
		map.put("edccpa", DesplegadoEscuela.getListaPrograma());
		map.put("raeea", DesplegadoEscuela.getListaPrograma());
		map.put("epep", DesplegadoEscuela.getListaPrograma());
		map.put("ersb", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("ecdpfe", DesplegadoEscuela.getListaPrograma());
		map.put("eudbe", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("tpacl", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("splftp", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("euscp", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("modalidadesEscuela", Modalidad.getListaModalidad());
		map.put("modalidadesTrabajoEscuela", ModalidadTrabajoEscuela.getListaModalidades());
		map.put("nivelesEscuela", NivelEscuela.getListaNivelesEscuela());
		map.put("aniosEscuela", AniosEscuela.getListaAniosEscuela());
		map.put("dependencias", Dependencia.getListaDependencias());
		map.put("ciclos", cicloSrv.obtenerCiclosConvocatoriaDesde(ciclo2009));
		map.put("ciclos2", cicloSrv.obtenerCiclosConvocatoriaDesde(ciclo2000));
		map.put("fasesTrabajo", FaseProyecto.getFaseProyecto());
		map.put("turnos", Turno.getListaTurnos());
		map.put("espaciosApoyo", EspacioApoyo.getEspacioApoyo());
		map.put("necesidadesEscuela", NecesidadesEscuela.getnNecesidadesEscuelas() );
		
		
		return forward("/escuela/altaEscuelaView", map);
	}
	
	@RequestMapping("/escuela/exportarEscuela")
	public ModelAndView exportarEscuela(){
		map = new HashMap<String, Object>();
		map.put("escuela", new Escuela());
		map.put("listLocalidades", registrarEscuelasBecasSrv.obtenerLocalidades());
		map.put("listProvincias", registrarEscuelasBecasSrv.obtenerProvincias());
		List<EstadoEscuela> estados = new ArrayList<EstadoEscuela>();
		estados.add(EstadoEscuela.NO_SELECCIONADA);
		estados.add(EstadoEscuela.PARTICIPANDO_PROGRAMA);
		estados.add(EstadoEscuela.INACTIVA);
		map.put("estadosEscuela", estados);
		map.put("programas", Programa.getListaPrograma());
		map.put("modalidadesEscuela", Modalidad.getListaModalidad());
		map.put("modalidadesTrabajoEscuela", ModalidadTrabajoEscuela.getListaModalidades());
		map.put("desplegableEscuela", DesplegadoEscuela.getListaPrograma());
		map.put("desplegableEscuela", DesplegadoEscuela.getListaPrograma());
		map.put("eudbe", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("tpacl", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("splftp", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("euscp", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("ced", DesplegadoEscuelaCED.getListaPrograma());
		map.put("refp", DesplegadoEscuelaREFP.getListaPrograma());
		map.put("acc", DesplegadoEscuelaAccesibilidad.getListaPrograma());
		map.put("proPFE", DesplegadoEscuelaProyeccionPFE.getListaPrograma());				
		map.put("ectaes", DesplegadoEscuelaECTAES.getListaPrograma());
		map.put("eddes", DesplegadoEscuela.getListaPrograma());
		map.put("edfea", DesplegadoEscuela.getListaPrograma());
		map.put("edbis", DesplegadoEscuela.getListaPrograma());
		map.put("edccpa", DesplegadoEscuela.getListaPrograma());
		map.put("raeea", DesplegadoEscuela.getListaPrograma());
		map.put("epep", DesplegadoEscuela.getListaPrograma());
		map.put("ersb", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("ecdpfe", DesplegadoEscuela.getListaPrograma());
		map.put("nivelesEscuela", NivelEscuela.getListaNivelesEscuela());
		map.put("aniosEscuela", AniosEscuela.getListaAniosEscuela());
		map.put("dependencias", Dependencia.getListaDependencias());
		map.put("ciclos", cicloSrv.obtenerCiclosConvocatoriaDesde(ciclo2009));
		map.put("ciclos2", cicloSrv.obtenerCiclosConvocatoriaDesde(ciclo2000));
		map.put("fasesTrabajo", FaseProyecto.getFaseProyecto());
		map.put("turnos", Turno.getListaTurnos());
		map.put("espaciosApoyo", EspacioApoyo.getEspacioApoyo());
		map.put("necesidadesEscuela", NecesidadesEscuela.getnNecesidadesEscuelas() );
		
		String excelView = null;
		excelView = "exportarEscuelasView";
		
		//return forward(excelView, map);
		return new ModelAndView(excelView,map);
		
		//return forward("/escuela/altaEscuelaView", map);
	}
	
	
	@RequestMapping("/escuela/modificarEscuela.do")
	public ModelAndView modificarView(
		@RequestParam("idEscuela") Long idEscuela,
		@RequestParam(required=false,value="urlRegreso") String urlRegreso){
		map = new HashMap<String, Object>();

		map.put("escuela", escuelaService.obtenerEscuelaPorId(idEscuela));
		map.put("listLocalidades", registrarEscuelasBecasSrv.obtenerLocalidades());
		map.put("listProvincias", registrarEscuelasBecasSrv.obtenerProvincias());
		List<EstadoEscuela> estados = new ArrayList<EstadoEscuela>();
		estados.add(EstadoEscuela.NO_SELECCIONADA);
		estados.add(EstadoEscuela.PARTICIPANDO_PROGRAMA);
		estados.add(EstadoEscuela.INACTIVA);
		map.put("estadosEscuela", estados);
		map.put("programas", Programa.getListaPrograma());
		map.put("modalidadesEscuela", Modalidad.getListaModalidad());
		map.put("modalidadesTrabajoEscuela", ModalidadTrabajoEscuela.getListaModalidades());
//		DMS 31/1/24 filtro para que aparezcan solo los que necesito
		List<NivelEscuela> niveles=new ArrayList<NivelEscuela>();
		niveles.add(NivelEscuela.getNivelEscuela(12));//primaria
		niveles.add(NivelEscuela.getNivelEscuela(3));//secundaria
		niveles.add(NivelEscuela.getNivelEscuela(13));//superior
		map.put("nivelesEscuela", niveles);
		map.put("aniosEscuela", AniosEscuela.getListaAniosEscuela());
//		DMS 31/1/24 filtro para que aparezcan solo los que necesito
		List<Dependencia> dependencias=new ArrayList<Dependencia>();
		dependencias.add(Dependencia.getDependencia(1));//privada
		dependencias.add(Dependencia.getDependencia(2));//estatal
		dependencias.add(Dependencia.getDependencia(5));//social-cooperativa
//		map.put("dependencias", Dependencia.getListaDependencias());
		map.put("dependencias", dependencias);
		map.put("desplegableEscuela", DesplegadoEscuela.getListaPrograma());
		map.put("desplegableEscuela", DesplegadoEscuela.getListaPrograma());
		map.put("ced", DesplegadoEscuelaCED.getListaPrograma());
		map.put("refp", DesplegadoEscuelaREFP.getListaPrograma());
		map.put("acc", DesplegadoEscuelaAccesibilidad.getListaPrograma());
		map.put("proPFE", DesplegadoEscuelaProyeccionPFE.getListaPrograma());				
		map.put("ectaes", DesplegadoEscuelaECTAES.getListaPrograma());
		map.put("eddes", DesplegadoEscuela.getListaPrograma());
		map.put("edfea", DesplegadoEscuela.getListaPrograma());
		map.put("edbis", DesplegadoEscuela.getListaPrograma());
		map.put("edccpa", DesplegadoEscuela.getListaPrograma());
		map.put("raeea", DesplegadoEscuela.getListaPrograma());
		map.put("epep", DesplegadoEscuela.getListaPrograma());
		map.put("ersb", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("ecdpfe", DesplegadoEscuela.getListaPrograma());
		map.put("eudbe", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("tpacl", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("splftp", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("euscp", DesplegadoEscuelaSINO.getListaPrograma());
		map.put("ciclos", cicloSrv.obtenerCiclosConvocatoriaDesde(ciclo2009));
		map.put("ciclos2", cicloSrv.obtenerCiclosConvocatoriaDesde(ciclo2000));
		map.put("fasesTrabajo", FaseProyecto.getFaseProyecto());
		map.put("turnos", Turno.getListaTurnos());
		map.put("espaciosApoyo", EspacioApoyo.getEspacioApoyo());
		map.put("necesidadesEscuela", NecesidadesEscuela.getnNecesidadesEscuelas() );
		map.put("urlRegreso", urlRegreso);

		List<Integer> aniosEQA= new ArrayList<Integer>();
		
		 Calendar calendar = Calendar.getInstance();
       int anioActual = calendar.get(Calendar.YEAR);
		int anio=2020;
		aniosEQA.add(anio);
		//DMS mando a la vista la lista de años desde el 2020 hasta elactual 
		do{
			anio++;
			aniosEQA.add(anio);
		}while(anio<anioActual);
		
		map.put("aniosEQA", aniosEQA);
		return forward("/escuela/altaEscuelaView", map);
	}
	
	@RequestMapping("/escuela/eliminarEscuela.do")
	public ModelAndView eliminarView(
		@RequestParam("idEscuela") Long idEscuela,
		@RequestParam(required=false,value="urlRegreso") String urlRegreso) throws SQLException{
		map = new HashMap<String, Object>(); 
		String url = "jdbc:mysql://localhost/cimientos_testing";
		Connection cn = DriverManager.getConnection(url,"root","root");
		Statement stmt = cn.createStatement();
        ResultSet rs = null;
        String call=null;
		call="Delete from escuela where escuela.id=?";
		cn = Conexion.getConexion();	            
		PreparedStatement preparedStmt = cn.prepareStatement(call);
		preparedStmt.setLong(1, idEscuela);
	    preparedStmt.execute();
		List<Escuela> list = registrarEscuelasBecasSrv.obtenerTodasEscuelas();
		for(int x=0;x<list.size();x++) {
			
			
	       
	        call="select (select count(perfil_alumno.id) from perfil_alumno where (perfil_alumno.estado_alumno=5 or perfil_alumno.estado_alumno=16 "
	        		+ " or perfil_alumno.estado_alumno=19 or perfil_alumno.estado_alumno=21) and perfil_alumno.escuela=escuela.id) as ba,"
	        		+ "(select count(perfil_alumno.id) from perfil_alumno where (perfil_alumno.estado_alumno=8 or perfil_alumno.estado_alumno=4 or perfil_alumno.estado_alumno=9 "
	        		+ "or perfil_alumno.estado_alumno=18) and perfil_alumno.escuela=escuela.id) as inac, "
	        		+ " (select count(perfil_alumno.id) from perfil_alumno where (perfil_alumno.estado_alumno=3 or perfil_alumno.estado_alumno=11 or perfil_alumno.estado_alumno=12) "
	        		+ " and perfil_alumno.escuela=escuela.id and perfil_alumno.anio_escolar<>'15') as candidatos,"
	        		+ " (select count(entrevista.id) from entrevista where entrevista.lugar_entrevista=escuela.id) as ele,"
	        		+ " (select count(entrevista.id) from entrevista where entrevista.lugar_proxima_entrevista=escuela.id) as elpe,"
	        		+ " (select count(entrevista.id) from entrevista where entrevista.escuela_alumno=escuela.id) as esal,"
	        		+ " (select count(evento_generico.id) from evento_generico where evento_generico.lugar_encuentro=escuela.id) as evge,"
	        		+ " (select count(perfil_alumno_historial_escuela.historial_escuela) from perfil_alumno_historial_escuela where perfil_alumno_historial_escuela.historial_escuela=escuela.id) as hies,"
	        		+ " (select count(convocatoria.id_convocatoria) from convocatoria where convocatoria.escuela=escuela.id) as conv "
	        		+ " from escuela where escuela.id="+ list.get(x).getId();
	        
	        cn = Conexion.getConexion();	            
	        rs = stmt.executeQuery(call);								
	        while ( rs.next() ) {	        		               
	            list.get(x).setBecadosActivos(rs.getString("ba"));
	            list.get(x).setBecados(rs.getString("candidatos"));
	            list.get(x).setEntrevistaLugar(rs.getString("ele"));
	            list.get(x).setEntrevistaProxima(rs.getString("elpe"));
	            list.get(x).setConvocatoria(rs.getString("conv"));
	            list.get(x).setEsal(rs.getString("esal"));
	            list.get(x).setEvge(rs.getString("evge"));
	            list.get(x).setHies(rs.getString("hies"));
	        }			        	        
	        Conexion.cerrarConexion(cn);			 
			}
		
		
		map.put("listaEscuelas", list);

		return forward("/escuela/listaEscuelas", map);	}
	
	/**
	 * Registrar escuela.
	 *
	 * @param escuela the escuela
	 * @return the model and view
	 * @since 18-nov-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/escuela/altaEscuela")
	public ModelAndView altaEscuela(
			@ModelAttribute("escuela") Escuela escuela,
			@RequestParam("idEstadoEscuela") Integer idEstadoEscuela,
			@RequestParam("idPrograma") Integer idPrograma,
			@RequestParam("idModalidad") Integer idModalidad,
			@RequestParam(required=false,value="idModalidadTrabajoEscuela") Integer idModalidadTrabajoEscuela,
			@RequestParam("idNivelAtiendeEscuela") Integer idNivelAtiendeEscuela,
			@RequestParam("idCantidadDeAnios") Integer idCantidadDeAnios,
			@RequestParam(required=false,value="idCed") Integer ced,
			//@RequestParam(required=false,value="idRefp") Integer refp,
			@RequestParam(required=false,value="idAccesibilidad") Integer accesibilidad,
			@RequestParam(required=false,value="idProyeccionPFE") Integer proyeccionPFE,
			@RequestParam(required=false,value="idEctaes") Integer ectaes,
			@RequestParam(required=false,value="idEddes") Integer eddes,
			@RequestParam(required=false,value="idEdfea") Integer edfea,
			@RequestParam(required=false,value="idEdbis") Integer edbis,
			@RequestParam(required=false,value="idEdccpa") Integer edccpa,
			@RequestParam(required=false,value="idRaeea") Integer raeea,
			@RequestParam(required=false,value="idErsb") Integer ersb,
			@RequestParam(required=false,value="idEpep") Integer epep,
			@RequestParam(required=false,value="idEcdPFE") Integer ecdpfe,
			@RequestParam(required=false,value="idEudbe") Integer eudbe,
			@RequestParam(required=false,value="idTpacl") Integer tpacl,
			@RequestParam(required=false,value="idSplftp") Integer splftp,
			@RequestParam(required=false,value="idEuscp") Integer euscp,
			@RequestParam("idDependencia") Integer idDependencia,
			@RequestParam(required=false,value="idComProy") Integer idComproy,
			@RequestParam(required=false,value="idComPBE") Integer idComPBE,
			@RequestParam(required=false,value="idFase") Integer idFase,			
			@RequestParam(required=false,value="idCicloIndicador") Integer idCicloIndicador,
			@RequestParam(required=false,value="urlRegreso") String urlRegreso
		){
//		dms señalador
		
		map = new HashMap<String, Object>();
		Date dNow = new Date();
		SimpleDateFormat ft = 
		new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		
		
		escuela.setActivo(true);
		escuela.setEstadoEscuela(EstadoEscuela.getEstados(idEstadoEscuela));
		escuela.setPrograma(Programa.getPrograma(idPrograma));
		escuela.setModalidad(Modalidad.getModalidad(idModalidad));
		if(idModalidadTrabajoEscuela != null)
			escuela.setModalidadTrabajoEscuela(ModalidadTrabajoEscuela.getModalidadEscuela(idModalidadTrabajoEscuela));
		escuela.setNivelAtiendeEscuela(NivelEscuela.getNivelEscuela(idNivelAtiendeEscuela));

		escuela.setCantidadDeAnios(AniosEscuela.getAniosEscuela(idCantidadDeAnios));
		escuela.setDependencia(Dependencia.getDependencia(idDependencia));
		
		if(eudbe!=null){
			escuela.setEudbe(DesplegadoEscuelaSINO.getPrograma(eudbe));
		}
		escuela.setUltimaModificacion(currentDate);
		if(tpacl!=null){
			escuela.setTpacl(DesplegadoEscuelaSINO.getPrograma(tpacl));
		}
		if(splftp!=null){
			escuela.setSplftp(DesplegadoEscuelaSINO.getPrograma(splftp));
		}
		if(euscp!=null){
			escuela.setEuscp(DesplegadoEscuelaSINO.getPrograma(euscp));
		}
		
		if(ced!=null){
		escuela.setCed(DesplegadoEscuelaCED.getPrograma(ced));
		}
		//if(refp!=null){
		//escuela.setRefp(DesplegadoEscuelaREFP.getPrograma(refp));
		//}
		if(accesibilidad!=null){
		escuela.setAccesibilidad(DesplegadoEscuelaAccesibilidad.getPrograma(accesibilidad));
		}
		if(proyeccionPFE!=null){
		escuela.setProyeccionPFE(DesplegadoEscuelaProyeccionPFE.getPrograma(proyeccionPFE));
		}
		if(ectaes!=null){
			escuela.setEctaes(DesplegadoEscuelaECTAES.getPrograma(ectaes));
		}
		if(eddes!=null){
			escuela.setEddes(DesplegadoEscuela.getPrograma(eddes));
		}
		if(edfea!=null){
			escuela.setEdfea(DesplegadoEscuela.getPrograma(edfea));
		}
		if(edbis!=null){
			escuela.setEdbis(DesplegadoEscuela.getPrograma(edbis));
		}
		if(edccpa!=null){		
			escuela.setEdccpa(DesplegadoEscuela.getPrograma(edccpa));
		}
		if(raeea!=null){		
			escuela.setRaeea(DesplegadoEscuela.getPrograma(raeea));
		}
		if(ersb!=null){
			escuela.setErsb(DesplegadoEscuelaSINO.getPrograma(ersb));
		}
		if(epep!=null){
			escuela.setEpep(DesplegadoEscuela.getPrograma(epep));
		}
		if(ecdpfe!=null){		
			escuela.setEcdPFE(DesplegadoEscuela.getPrograma(ecdpfe));
		}
		escuela.setLocalidad(localidadService.obtenerLocalidad(escuela.getLocalidad().getId()));
		escuela.setZonaCimientos(zonaService.obtenerZonaCimientos(escuela.getZonaCimientos().getId()));
		escuela.setProvincia(provinciaService.obtenerPorId(escuela.getProvincia().getId()));
		
		if(idFase != null)
			escuela.setFaseProyecto(FaseProyecto.getFaseProyecto(idFase));
		if(idCicloIndicador != null)
			escuela.setCicloIndicador(cicloSrv.obtenerCiclo(idCicloIndicador));
		if(idComproy != null)
			escuela.setComienzoProyecto(cicloSrv.obtenerCiclo(idComproy));
		if(idComPBE != null)
			escuela.setComienzoPBE(cicloSrv.obtenerCiclo(idComPBE));
		if(escuela.getId() != null)
			map.put("mensaje", "Se modificaron los datos de la escuela:  " + escuela.getNombre());
		else
			map.put("mensaje", "Se dio de alta la escuela:  " + escuela.getNombre());
		registrarEscuelasBecasSrv.guardarEscuela(escuela);
		//Esto es para tener un registro 
		registrarEscuelasBecasSrv.guardarEscuelaSeleccion(escuela);
		
		map.put("listaEscuelas", registrarEscuelasBecasSrv.obtenerTodasEscuelas());
		if(urlRegreso != null && StringUtils.isNotBlank(urlRegreso))
			return new ModelAndView("redirect:" + urlRegreso);	
		else			
			return forward("/escuela/listaEscuelas", map);
	}
	
	/**
	 * Listas escuelas candidatas.
	 *
	 * @return the model and view
	 * @since 18-nov-2010
	 * @author cfigueroa
	 * @throws SQLException 
	 */
	
	
	@RequestMapping("/escuela/listaEscuelas")
	public ModelAndView listasEscuelasCandidatas() throws SQLException{ 
		map = new HashMap<String, Object>(); 
		String url = "jdbc:mysql://localhost/cimientos_testing";
		Connection cn = DriverManager.getConnection(url,"root","root");
		Statement stmt = cn.createStatement();
		cn = Conexion.getConexion();
        ResultSet rs = null;
        String call=null;
		List<Escuela> list = registrarEscuelasBecasSrv.obtenerTodasEscuelas();
		for(int x=0;x<list.size();x++) {
		  call="select (select count(perfil_alumno.id) from perfil_alumno where (perfil_alumno.estado_alumno=5 or perfil_alumno.estado_alumno=16 "
	        		+ " or perfil_alumno.estado_alumno=19 or perfil_alumno.estado_alumno=21) and perfil_alumno.escuela=escuela.id) as ba,"
	        		+ "(select count(perfil_alumno.id) from perfil_alumno where (perfil_alumno.estado_alumno=8 or perfil_alumno.estado_alumno=4 or perfil_alumno.estado_alumno=9 "
	        		+ "or perfil_alumno.estado_alumno=18) and perfil_alumno.escuela=escuela.id) as inac, "
	        		+ " (select count(perfil_alumno.id) from perfil_alumno where (perfil_alumno.estado_alumno=3 or perfil_alumno.estado_alumno=11 or perfil_alumno.estado_alumno=12) "
	        		+ " and perfil_alumno.escuela=escuela.id and perfil_alumno.anio_escolar<>'15') as candidatos,"
	        		+ " (select count(entrevista.id) from entrevista where entrevista.lugar_entrevista=escuela.id) as ele,"
	        		+ " (select count(entrevista.id) from entrevista where entrevista.lugar_proxima_entrevista=escuela.id) as elpe,"
	        		+ " (select count(entrevista.id) from entrevista where entrevista.escuela_alumno=escuela.id) as esal,"
	        		+ " (select count(evento_generico.id) from evento_generico where evento_generico.lugar_encuentro=escuela.id) as evge,"
	        		+ " (select count(perfil_alumno_historial_escuela.historial_escuela) from perfil_alumno_historial_escuela where perfil_alumno_historial_escuela.historial_escuela=escuela.id) as hies,"
	        		+ " (select count(convocatoria.id_convocatoria) from convocatoria where convocatoria.escuela=escuela.id) as conv,"
	        		+ " escuela.ultima_modificacion "
	        		+ " from escuela where escuela.id="+ list.get(x).getId();
	        
	        	            
	        rs = stmt.executeQuery(call);								
	        while ( rs.next() ) {	        		               
	            list.get(x).setBecadosActivos(rs.getString("ba"));
	            list.get(x).setBecados(rs.getString("candidatos"));
	            list.get(x).setEntrevistaLugar(rs.getString("ele"));
	            list.get(x).setEntrevistaProxima(rs.getString("elpe"));
	            list.get(x).setConvocatoria(rs.getString("conv"));
	            list.get(x).setEsal(rs.getString("esal"));
	            list.get(x).setEvge(rs.getString("evge"));
	            list.get(x).setHies(rs.getString("hies"));
	        }			        	        
	        Conexion.cerrarConexion(cn);
	        
			}
		
		
		map.put("listaEscuelas", list);

		return forward("/escuela/listaEscuelas", map);
	}
	
	/**
	 * View seleccion escuelas.
	 *
	 * @return the model and view
	 * @since 18-nov-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/escuela/viewSeleccionEscuelasBecas")
	public ModelAndView viewSeleccionEscuelas(){ 
		map = new HashMap<String, Object>(); 
			
		List<Escuela> list = registrarEscuelasBecasSrv.obtenerTodasEscuelas();
		map.put("listaEscuelas", list);
		map.put("listaEstadoEscuela", EstadoEscuela.getListaEstadoEscuelas());
		return forward("/escuela/asignacionEscuelasBecas", map);
	}
	
	/**
	 * Guardar seleccion escuelas.
	 *
	 * @param idsEscuelas the ids escuelas
	 * @return the model and view
	 * @since 18-nov-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/escuela/guardarSeleccionEscuelas")
	public ModelAndView guardarSeleccionEscuelas(@RequestParam("ids") String idsEscuelas ){
		map = new HashMap<String, Object>();

		String[] arrayIds = StringUtils.split(idsEscuelas, ";");
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < arrayIds.length; i++) {
		  String[] valuesArray = StringUtils.split(arrayIds[i],"-");
		  EstadoEscuela estadoEscuela = EstadoEscuela.getEstados(Integer.parseInt(valuesArray[0]));  
		  Escuela escuela = registrarEscuelasBecasSrv.obtenerEscuelaPorId(Long.parseLong(valuesArray[1]));
		  escuela.setEstadoEscuela(estadoEscuela);
		  registrarEscuelasBecasSrv.guardarEscuela(escuela);
		  buffer.append(" ");
		  buffer.append(escuela.getNombre());
		}
		map.put("mensaje", "Se guardaron los cambios ");
		map.put("listaEscuelas", registrarEscuelasBecasSrv.obtenerTodasEscuelas());

		map.put("listaEstadoEscuela", EstadoEscuela.getListaEstadoEscuelas());
		return  forward("/escuela/asignacionEscuelasBecas", map); 
	}
	
	
	/**
	 * Modificar escuela.
	 *
	 * @param req the req
	 * @param user the user
	 * @param idEscuela the id escuela
	 * @return the model and view
	 * @since 06-dic-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/escuela/modificarEscuela")
	public ModelAndView modificarEscuela(@RequestParam("idEscuela")Long idEscuela){
		map = new HashMap<String, Object>();
		
		map.put("escuela", registrarEscuelasBecasSrv.obtenerEscuelaPorId(idEscuela));
		map.put("listLocalidades", registrarEscuelasBecasSrv.obtenerLocalidades());
		map.put("listProvincias", registrarEscuelasBecasSrv.obtenerProvincias());

		return forward("/escuela/registrarEscuela", map);
	}
	
	
	
	
	@RequestMapping("/escuela/mostrarImagen.do")
	public void mostrarFirma(HttpServletResponse response) {		
		response.setContentType("image/jpeg");
		OutputStream output = null;
		FileInputStream input = null;
		File file = new File(getProps().getProperty(ConstantesInformes.pathImagen) + ConstantesInformes.imagenEscuela  + ConstantesInformes.extensionImagen);		
		try {
			output = response.getOutputStream();
			input = new FileInputStream(file);
			byte[] buffer = new byte[(int) file.length()];
			input.read(buffer);
			response.setContentLength(buffer.length);
			output.write(buffer);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				input.close();
				output.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@InitBinder
	public void initBinder(HttpServletRequest request,WebDataBinder binder) {
		
		// Fase Proyecto binding
	    binder.registerCustomEditor(FaseProyecto.class, new PropertyEditorSupport() {
	        @Override
	        public void setAsText(String text) {
	            int id = Integer.parseInt(text);
	            FaseProyecto valor = FaseProyecto.getFaseProyecto(id);
	            setValue(valor);
	        }
	    });
	    
	    // Espacio apoyo binding
	    binder.registerCustomEditor(EspacioApoyo.class, new PropertyEditorSupport() {
	        @Override
	        public void setAsText(String text) {
	            int id = Integer.parseInt(text);
	            EspacioApoyo valor = EspacioApoyo.getEspacioApoyo(id);
	            setValue(valor);
	        }
	    });

	 // Necesidades Escuela binding
	    binder.registerCustomEditor(NecesidadesEscuela.class, new PropertyEditorSupport() {
	        @Override
	        public void setAsText(String text) {
	            int id = Integer.parseInt(text);
	            NecesidadesEscuela valor = NecesidadesEscuela.getNecesidadesEscuela(id);
	            setValue(valor);
	        }
	    });

	    
	    // Turnos binding
	    binder.registerCustomEditor(Turno.class, new PropertyEditorSupport() {
	        @Override
	        public void setAsText(String text) {
	            int id = Integer.parseInt(text);
	            Turno valor = Turno.getTurnos(id);
	            setValue(valor);
	        }
	    });
	    
	    // nivelesEscuela binding
	    binder.registerCustomEditor(NivelEscuela.class, new PropertyEditorSupport() {
	    	@Override
	    	public void setAsText(String text) {
	    		int id = Integer.parseInt(text);
	    		NivelEscuela valor = NivelEscuela.getNivelEscuela(id);
	    		setValue(valor);
	    	}
	    });
	}
}