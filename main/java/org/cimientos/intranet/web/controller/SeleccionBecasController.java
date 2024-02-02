package org.cimientos.intranet.web.controller;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.EstadoBeca;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.cimientos.intranet.servicio.AlumnoPanelEASrv;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.BecaSvr;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.PeriodoSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.utils.PeriodoHelper;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author plabaronnie
 * Clase que se utiliza para  hacer la redireccion (mapeo) a las vistas.
 * Extiende de BaseController para incluir el Template
 */
@Controller
@RequestMapping("/seleccionBecas/*")
public class SeleccionBecasController extends BaseController{
	
	@Autowired
	private AlumnoSrv srvAlumno;
	
	@Autowired
	public BecaSvr srvBeca;
	
	@Autowired
	public ZonaCimientosSrv srvZona;
	
	@Autowired
	private AlumnoPanelEASrv alumnoPanelEaSrv;
	
	@Autowired
	private CicloProgramaSrv cicloSrv;
	
	@Autowired
	private PeriodoSrv periodoSrv;

	
	/**
	 * Recupera la lista de todos las Becas persistidos en la DB.
	 * 
	 * @return la vista la vista con las 2 tablas de becas y de alumnos
	 */
	@RequestMapping("/seleccionBecas/seleccionBecasView.do")
	public ModelAndView verAsignacionBecas(@RequestParam(required=false,value="periodoId") Long periodoId){
		Map<String, Object> resul = new HashMap<String, Object>();		
		Periodo p = periodoSrv.obtenerPeriodo(periodoId);
		Periodo periodoActual = periodoSrv.obtenerPeriodoPorFecha(new Date());
		if(!p.getNombre().equals(periodoActual.getNombre()))
				resul.put("mensaje", "Recuerde que esta asignando becas para el mes de " + p.getNombre() + " y el periodo actual es " + periodoActual.getNombre());
		resul.put("periodoId", p.getId());
		resul.put("becas", srvBeca.obtenerBecasCicloActualPorFecha(p.getFechaInicio()));
		resul.put("estadosBeca", EstadoBeca.getListaEstados());
		resul.put("tiposPadrino", TipoPadrino.getListaTipos());
        		
		return forward("seleccionBecas/seleccionBecas", resul);
	}
	
	@RequestMapping("/seleccionBecas/seleccionPeriodosBecasView.do")
	 public ModelAndView verPeriodosBecas(HttpSession session, @RequestParam(required=false, value="menuSup") String menuSup){
		Map<String, Object> resul = new HashMap<String, Object>();
		List<Periodo> periodos = cicloSrv.obtenerCicloActual().getPeriodos();
		Periodo p = PeriodoHelper.getPeriodoActual2(periodos, new Date());
		Long periodoActual = PeriodoHelper.periodoActual3(new Date());
		resul.put("periodos", periodos);
        resul.put("periodoId", p.getId());
        resul.put("periodoActual", periodoActual);
        if(StringUtils.isNotBlank(menuSup) && menuSup.equals("programas"))        
            session.setAttribute("menu", ConstantesMenu.menuGestionPrograma);
		return forward("seleccionBecas/seleccionPeriodoBecas", resul);
	}
	
	/**
	 * Asigna los alumnos seleccionados a la beca seleccionada y actualiza el contador de asignaciones en la beca elegida.
	 * 
	 * @return la vista de la lista de Becas persistidas
	 */
	@RequestMapping("/seleccionBecas/seleccionBecas.do")
	public ModelAndView asignarBecas( @RequestParam(required=false,value="idBeca") Long idBeca,
			@RequestParam(required=false,value="alumnosSeleccionados") String alumnosSeleccionados,
			@RequestParam(required=false,value="periodoId") Long periodoId){
		Map<String, Object> resul = new HashMap<String, Object>();
		Periodo periodo = periodoSrv.obtenerPeriodo(periodoId);
		Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        String call=null;
        Long idBeca2=0L;
		if(idBeca != null && StringUtils.isNotBlank( alumnosSeleccionados )){
			Beca becaSeleccionada = srvBeca.obtenerPorId(idBeca);
			List<Long> candidatosId = Formateador.toListOfLongs(alumnosSeleccionados);
			try{
        		call = "{CALL SP_BuscarBecaParaBajar(?)}";
                cn = Conexion.getConexion();
                cl = cn.prepareCall(call);
                cl.setLong(1, idBeca);            
                rs = cl.executeQuery();		                
                while (rs.next()) {
                	 idBeca2= rs.getLong(3);            	                        	
                }
        		call = "{CALL SP_BajaBajaBeca(?)}";
	            cn = Conexion.getConexion();
	            cl = cn.prepareCall(call);                          
	            cl.setLong(1, idBeca2); // numero de fp			             
	            rs = cl.executeQuery();
	            // cierro conexion
	            call = "{CALL SP_ModificarBecaBajaBecado(?)}";
	            //call ="insert into baja_becas values (?,CURDATE( ))";				            
        		cn = Conexion.getConexion();
	            cl = cn.prepareCall(call);                          
	            cl.setLong(1, idBeca);			             
	            rs = cl.executeQuery();
	            Conexion.cerrarCall(cl);
		        Conexion.cerrarConexion(cn);
	        }
	        catch (SQLException e) {
		        e.printStackTrace();
		        Conexion.cerrarCall(cl);
		        Conexion.cerrarConexion(cn);
	        }		
			
			if(becaTieneCupo(becaSeleccionada, candidatosId)){
				List<PerfilAlumno> becados = srvAlumno.obtenerAlumnosPorIds(candidatosId);
				srvBeca.asignarAlumnosBeca(becaSeleccionada, becados,periodo);
				try{
					call = "{CALL SP_ModificarBecaBajaBecado(?)}";
		            //call ="insert into baja_becas values (?,CURDATE( ))";				            
	        		cn = Conexion.getConexion();
		            cl = cn.prepareCall(call);                          
		            cl.setLong(1, idBeca);			             
		            rs = cl.executeQuery();
		            Conexion.cerrarCall(cl);
			        Conexion.cerrarConexion(cn);
				}
		        catch (SQLException e) {
			        e.printStackTrace();
			        Conexion.cerrarCall(cl);
			        Conexion.cerrarConexion(cn);
		        }	
			    alumnoPanelEaSrv.activarAlumnos(becados);
				resul.put("mensaje", "Se han asignado " + becados.size() + " alumnos a la beca seleccionada.");
			}else{
				resul.put("error", "La cantidad de candidatos seleccionados excede el máximo disponible de la beca.");
			}
			
		}else {
			resul.put("error", "Debe seleccionar 1 beca y al menos 1 alumno para realizar la asignación.");
		}

		resul.put("periodoId", periodo.getId());
		resul.put("becas", srvBeca.obtenerBecasCicloActualPorFecha(periodo.getFechaInicio()));
		resul.put("estadosBeca", EstadoBeca.getListaEstados());
		resul.put("tiposPadrino", TipoPadrino.getListaTipos());
		
		return forward("seleccionBecas/seleccionBecas", resul);
	}

	/**
	 * Valida que la cantidad de alumnos seleccionados no exceda el cupo de la beca.
	 * Suma la cantidad de alumnos asignados a la cantidad de alumnos a asignar y esta
	 * debe ser menor o igual que el cupo total de la beca.
	 * 
	 * @param becaSeleccionada
	 * @param candidatosId
	 * @return
	 */
	private boolean becaTieneCupo(Beca becaSeleccionada,
			List<Long> candidatosId) {
		int cantAsignados = becaSeleccionada.getBecados().size() + candidatosId.size();
		return cantAsignados <= becaSeleccionada.getCantidad();
	}
	
	@RequestMapping("/seleccionBecas/buscarAlumnos.do")
	public void buscarAlumnos(HttpServletResponse response,
			@RequestParam(required=false, value="becaId") Long becaId
			) throws JSONException {

			JSONObject resp = new JSONObject();
			
			try {
	
				JSONArray alumnos = new JSONArray();
				List<PerfilAlumno> filtrados = null;
				if(becaId != null && !becaId.equals(0L)){	
					Beca becaSeleccionada = srvBeca.obtenerPorId(becaId);	
					filtrados = srvAlumno.obtenerAlumnosPorZonaParaAsignacionBecas(becaSeleccionada.getZona());
				}else{	
					filtrados = srvAlumno.obtenerAlumnosPorZonaParaAsignacionBecas(null);
				}
				for (PerfilAlumno alumno : filtrados) {
					JSONArray alumnoObj = new JSONArray();
					alumnoObj.put(alumno.getId());
					alumnoObj.put(alumno.getEscuela().getLocalidad().getZona().getNombre());
					alumnoObj.put(alumno.getDatosPersonales().getApellido() + ", " + alumno.getDatosPersonales().getNombre() );
					alumnoObj.put(alumno.getEscuela().getNombre());
					alumnoObj.put(alumno.getAnioEscolar().getValor());
					alumnos.put(alumnoObj);
				}
				
				
				resp.put("aaData", alumnos);
			} catch (JSONException e) {
				e.printStackTrace();
			}
			response.setContentType("application/json");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("ISO-8859-1");
			try {
				response.getWriter().write(resp.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}

		}



	
}
