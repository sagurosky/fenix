package org.cimientos.intranet.web.controller;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cimientos.intranet.enumerativos.ResultadoAnioEscolar;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.FichaFamiliar;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.FichaPresentacion;
import org.cimientos.intranet.modelo.informe.InformeIS1;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.seleccion.BoletinSeleccion;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.InformeFPSrv;
import org.cimientos.intranet.servicio.InformeIS1Srv;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.utils.InformeUtils;
import org.cimientos.intranet.utils.paginacion.ExtendedPaginatedList;
import org.cimientos.intranet.utils.paginacion.PaginateListFactory;
import org.displaytag.tags.TableTagParameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.dto.ReporteInformeDTO;
import com.cimientos.intranet.enumerativos.Convive;

@Controller
@RequestMapping("/informeFP/*")
public class InformeFPController extends BaseController
{
	
	@Autowired
	private InformeFPSrv srvFP;
		
	@Autowired
	private InformeIS1Srv srvIS1;
	
	@Autowired
	private PaginateListFactory paginateListFactory;
	
	@Autowired
	private CicloProgramaSrv cicloSrv;

	private static final String ACCION_GUARDAR = "guardar";
	private static final String ACCION_FINALIZAR = "finalizar";
	private static final String EXITO_MSJ_REVISION = "Se ha guardado el informe en estado REVISIÓN.";
	private static final String EXITO_MSJ_FINALIZAR = "Se ha guardado el informe en estado FINALIZADO.";

	
	@RequestMapping("/informeFP/listaInformesFPRevision.do")
	public ModelAndView listaInformesCesacionSupervision(HttpServletRequest req,
														@RequestParam(required=false, value= "zonaCimientosId") Long zonaCimientosId,
														@RequestParam(required=false, value= "zonaCimientos") String zonaCimientos,
														@RequestParam(required=false, value= "mensaje") String mensaje,
														@RequestParam(required= false, value="cantRows") String totalRows, 
														@RequestParam(required= false, value="tipoInforme") String tipoInforme,
														@RequestParam(required=false, value="nombreAlumno") String nombreAlumno,
														@RequestParam(required= false, value="estadoId") Integer estadoId,
														@RequestParam(required=false, value="padrino") String nombrePadrino,
														@RequestParam(required=false, value="idPadrino") Long idPadrino,
														@RequestParam(required=false, value="ea") String nombreEA,
														@RequestParam(required=false, value="idEA") Long idEA,
														@RequestParam(required=false, value="rr") String nombreRR,
														@RequestParam(required=false, value="idRR") Long idRR,
														@RequestParam(required=false, value="tipoPadrinoId") Long tipoPadrinoId,
														@RequestParam(required= false, value="cicloId") String cicloId,
														@RequestParam(required=false, value="error") String error) throws SQLException{
			//ea - FP no se ve - IS1 estado en revision
			Map<String, Object> resul = new HashMap<String, Object>();
			Long idCiclo = null;
			boolean export = req.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null; 
			
			if(StringUtils.isNotBlank(cicloId)){
				idCiclo = Long.parseLong(cicloId);
			}else {
				idCiclo = cicloSrv.obtenerCicloActual().getId();
				cicloId = idCiclo.toString();
			}
			
			zonaCimientosId = (zonaCimientosId!=null && zonaCimientosId.equals(0L)) ? null : zonaCimientosId;

			tipoPadrinoId = (tipoPadrinoId!=null && tipoPadrinoId.equals(0L)) ? null : tipoPadrinoId;
			
			estadoId = (estadoId!=null && estadoId.equals(0)) ? null : estadoId;
			
			ExtendedPaginatedList listaPaginada = paginarFpARevisar(export, req, nombreAlumno, tipoInforme, estadoId, idCiclo, zonaCimientosId, 
														idPadrino, idEA, idRR, tipoPadrinoId);
			
			resul.put("zonaCimientosId", zonaCimientosId);
			resul.put("zonaCimientos", zonaCimientos);
			resul.put("informes", listaPaginada);
			resul.put("size", listaPaginada.getFullListSize());
			resul.put("tipos", TipoPadrino.getListaTipos());
			resul.put("tiposInforme", InformeUtils.getTipoInformesCorrectora());
			resul.put("tipoInformeId", tipoInforme);
			resul.put("idInforme", null);
			resul.put("ciclos", cicloSrv.obtenerCiclosClonarBecas());
	        resul.put("cicloId", cicloId); 
	        resul.put("estados", EstadoInforme.getListaEstadosSeleccion());
	        resul.put("estadoId", estadoId); 
			resul.put("nombreAlumno", nombreAlumno);
			resul.put("padrino", nombrePadrino);
			resul.put("idPadrino", idPadrino);
			resul.put("ea", nombreEA);
			resul.put("idEA", idEA);
			resul.put("rr", nombreRR);
			resul.put("idRR", idRR);
			resul.put("tipoPadrinoId", tipoPadrinoId);
			resul.put("tiposPadrinos", TipoPadrino.getListaTipos());
			
			if(StringUtils.isNotBlank(mensaje))
				resul.put("mensaje", mensaje);
			if(StringUtils.isNotBlank(error))
				resul.put("error", error);
			
			/*
			//update	        
    		String url = "jdbc:mysql://localhost/cimientos_prod";
			Connection cn = DriverManager.getConnection(url,"root","root");						        	        	      
	        String query = "update informe i join entrevista e " +
						 " ON i.becado=e.perfil_alumno " +
						 " SET i.vos_mismo=e.observaciones_generales " +
						 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
						 " AND i.estado=3;";
	       
	        PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				//cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			query = "update informe i join entrevista e " +
					 " ON i.becado=e.perfil_alumno " +
					 " SET i.situacion_escolar=e.situacion_escolar_mergeada " +
					 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
					 " AND i.estado=3;";
      
	       //PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				//cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			query = "update informe i join entrevista e " +
					 " ON i.becado=e.perfil_alumno " +
					 " SET i.observaciones_generales=e.observaciones_generales " +
					 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
					 " AND i.estado=3;";
     
	       //PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				//cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			query = "update informe i join entrevista e " +
					 " ON i.becado=e.perfil_alumno " +
					 " SET i.incorporacion=e.incorporacion " +
					 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
					 " AND i.estado=3;";
    
	       //PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				//cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			query = "update informe i join entrevista e " +
					 " ON i.becado=e.perfil_alumno " +
					 " SET i.observaciones_no_incorporacion=e.observaciones_no_incorporacion " +
					 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
					 " AND i.estado=3;";
   
	       //PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				//cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			query = "update informe i join entrevista e " +
					 " ON i.becado=e.perfil_alumno " +
					 " SET i.proposito_anual=e.proposito " +
					 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
					 " AND i.estado=3;";
  
	       //PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			*/
			
			return forward("/informeFP/listaInformesFPRevision", resul);
	}
	
	private ExtendedPaginatedList paginarFpARevisar(Boolean export, HttpServletRequest request, String nombreAlumno, String tipoInforme, 
													Integer estadoId, Long idCiclo, Long zonaId, Long idPadrino, Long idEA, Long idRR, 
													Long tipoPadrinoId){
		List<ReporteInformeDTO> informes = null;
		
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		
		CicloPrograma ciclo = null;
		if (!idCiclo.equals(0L)) {
			ciclo = cicloSrv.obtenerCiclo(idCiclo);
		}
		
		int totalRows = srvFP.obtenerCantidadFpARevisar(tipoInforme, estadoId, nombreAlumno, ciclo, zonaId, idPadrino, idEA, idRR, tipoPadrinoId);
		
		
		if(export){
			informes = srvFP.obtenerFpARevisar( tipoInforme, estadoId, nombreAlumno, 0,totalRows, 
											listaPaginada.getSortDirection(), listaPaginada.getSortCriterion(),
											ciclo, zonaId, idPadrino, idEA, idRR, tipoPadrinoId);
		} else {
			informes = srvFP.obtenerFpARevisar(tipoInforme, estadoId, nombreAlumno, listaPaginada.getFirstRecordIndex(),listaPaginada.getPageSize(),
											listaPaginada.getSortDirection(), listaPaginada.getSortCriterion(),
											ciclo, zonaId, idPadrino, idEA, idRR, tipoPadrinoId);
		}
		
		listaPaginada.setList(informes);
		listaPaginada.setTotalNumberOfRows(totalRows);
		return listaPaginada;
	}
	
	@RequestMapping("/informeFP/verInformeFPRevisionView.do")
	public ModelAndView verInformeFPRevision(HttpServletRequest req,
			@RequestParam ("idFP") Long idFP, @RequestParam(required=false, value="valorPerfil") String valorPerfil) throws SQLException{
		Map<String, Object> resul = new HashMap<String, Object>();
		FichaFamiliar fichaObject = null;
		List<FichaFamiliar> convivientesList = new ArrayList<FichaFamiliar>();
		FichaPresentacion ficha = srvFP.obtenerInformeFP(idFP);
		CicloPrograma cicloActual = cicloSrv.obtenerCicloActual();
		if(!ficha.getEstado().equals(EstadoInforme.ENVIADO)){
			Integer edad = Formateador.calcularEdad(ficha.getBecado().getDatosPersonales().getFechaNacimiento());
			ficha.setEdad(edad);			
			srvFP.guardarInformeFP(ficha);
			resul.put("edad", edad);
			if(StringUtils.isNotBlank(valorPerfil)){				
				if(ficha.getCicloActual().equals(cicloActual))
					resul.put("modificarInforme", true);
				else
					resul.put("modificarInforme", false);	
				resul.put("retorno", "../reporteGeneralInformes/verReporteGeneralInformes.do");
			}
			else{
				resul.put("modificarInforme", false);
				resul.put("retorno", "");
			}
		}
		if(!verSiTieneBoletinCargado(ficha))
			ficha.setBoletinSeleccions(null);
		for(FichaFamiliar unaFicha : ficha.getConvivientes()){
			if(unaFicha.getConvive()!= null)
				if(unaFicha.getConvive().equals(Convive.SI)){
					fichaObject = new FichaFamiliar();
					fichaObject = unaFicha;
					convivientesList.add(fichaObject);
				}				
		}
		
		System.out.println(ficha.getIncorporacion());
		if(ficha.getIncorporacion() == null){
			//update	        
    		String url = "jdbc:mysql://localhost/cimientos_prod";
			Connection cn = DriverManager.getConnection(url,"root","root");						        	        	      
	        String query = "update informe i join entrevista e " +
						 " ON i.becado=e.perfil_alumno " +
						 " SET i.vos_mismo=e.observaciones_generales " +
						 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
						 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
	       
	        PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				//cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			query = "update informe i join entrevista e " +
					 " ON i.becado=e.perfil_alumno " +
					 " SET i.situacion_escolar=e.situacion_escolar_mergeada " +
					 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
					 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
      
	       //PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				//cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			query = "update informe i join entrevista e " +
					 " ON i.becado=e.perfil_alumno " +
					 " SET i.observaciones_generales=e.observaciones_generales " +
					 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
					 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
     
	       //PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				//cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			query = "update informe i join entrevista e " +
					 " ON i.becado=e.perfil_alumno " +
					 " SET i.incorporacion=e.incorporacion " +
					 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
					 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
    
	       //PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				//cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			query = "update informe i join entrevista e " +
					 " ON i.becado=e.perfil_alumno " +
					 " SET i.observaciones_no_incorporacion=e.observaciones_no_incorporacion " +
					 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
					 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
   
	       //PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				//cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
			
			query = "update informe i join entrevista e " +
					 " ON i.becado=e.perfil_alumno " +
					 " SET i.proposito_anual=e.proposito " +
					 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
					 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
  
	       //PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			
			}
			url = "jdbc:mysql://localhost/cimientos_prod";
			cn = DriverManager.getConnection(url,"root","root");						        	        	      
	        query = "select vos_mismo, situacion_escolar, observaciones_generales,incorporacion, observaciones_no_incorporacion, proposito_anual from informe where id="+ + ficha.getId() + "  ;";
	        CallableStatement cl = null;
	        ResultSet rs = null;
	        cn = Conexion.getConexion();
            Statement st = cn.createStatement();
            rs = st.executeQuery(query);        
		    
            while (rs.next()) {
            	ficha.setVosMismo(rs.getString("vos_mismo"));
            	ficha.setSituacionEscolar(rs.getString("situacion_escolar"));
            	ficha.setObservacionesGenerales(rs.getString("observaciones_generales"));
            	ficha.setIncorporacion(rs.getString("incorporacion"));
            	ficha.setObservacionesNoIncorporacion(rs.getString("observaciones_no_incorporacion"));
            	ficha.setPropositoAnual(rs.getString("proposito_anual"));
            }	
            st.close();
            Conexion.cerrarCall(cl);
	        Conexion.cerrarConexion(cn);
            
		}else{
						
			if(ficha.getIncorporacion().equals("Incorpora")|| ficha.getIncorporacion().equals("No Incorpora") || ficha.getIncorporacion().equals("Incorporación pendiente") ){
				
				
				
			}else{
				
				//update	        
	    		String url = "jdbc:mysql://localhost/cimientos_prod";
				Connection cn = DriverManager.getConnection(url,"root","root");						        	        	      
		        String query = "update informe i join entrevista e " +
							 " ON i.becado=e.perfil_alumno " +
							 " SET i.vos_mismo=e.observaciones_generales " +
							 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
							 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
		       
		        PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					//cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();			
				}
				
				query = "update informe i join entrevista e " +
						 " ON i.becado=e.perfil_alumno " +
						 " SET i.situacion_escolar=e.situacion_escolar_mergeada " +
						 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
						 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
	      
		       //PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					//cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();			
				}
				
				query = "update informe i join entrevista e " +
						 " ON i.becado=e.perfil_alumno " +
						 " SET i.observaciones_generales=e.observaciones_generales " +
						 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
						 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
	     
		       //PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					//cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();			
				}
				
				query = "update informe i join entrevista e " +
						 " ON i.becado=e.perfil_alumno " +
						 " SET i.incorporacion=e.incorporacion " +
						 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
						 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
	    
		       //PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					//cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();			
				}
				
				query = "update informe i join entrevista e " +
						 " ON i.becado=e.perfil_alumno " +
						 " SET i.observaciones_no_incorporacion=e.observaciones_no_incorporacion " +
						 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
						 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
	   
		       //PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					//cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();			
				}
				
				query = "update informe i join entrevista e " +
						 " ON i.becado=e.perfil_alumno " +
						 " SET i.proposito_anual=e.proposito " +
						 " WHERE (e.periodo_de_pago>=386 AND e.tipo='incorporacion') AND i.ciclo_actual=34 " +
						 " AND i.estado=3 and i.id=" + ficha.getId() + "  ;";
	  
		       //PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();			
				}
		
			}	
		}
		
		
		
		
		
		String situacionEscolar2="";
		
		
		
		if(ficha.getSituacionEscolar().equals("0")){
			situacionEscolar2="Promovido sin adeudar materias";
		}else 
		if(ficha.getSituacionEscolar().equals("1")){
			situacionEscolar2="Pendiente";
		}else 
		if(ficha.getSituacionEscolar().equals("2")){
			situacionEscolar2="Repitio";
		}else
		if(ficha.getSituacionEscolar().equals("3")){
			situacionEscolar2="Egresó";
		}else 
		if(ficha.getSituacionEscolar().equals("4")){
			situacionEscolar2="Promovido con materias a rendir";
		}else
			situacionEscolar2=ficha.getSituacionEscolar();
		
		ficha.setSituacionEscolar(situacionEscolar2);
		
		
		
		String incorporacion="";
		
		if(ficha.getIncorporacion().equals("0")){
			incorporacion="Incorpora";
		}else 
		if(ficha.getIncorporacion().equals("1")){
			incorporacion="No Incorpora";
		}else 
		if(ficha.getIncorporacion().equals("2")){
			incorporacion="Incorporación pendiente";
		}else
		
			incorporacion=ficha.getIncorporacion();
		
		ficha.setIncorporacion(incorporacion);
		
		
		
		
		
		
		
		ficha.setConvivientes(convivientesList);		
		resul.put("ficha", ficha);		
		resul.put("valorPerfil", valorPerfil);
		resul.put("estadoRevision", EstadoInforme.REVISION.getValor());
		resul.put("estadoFinalizado", EstadoInforme.FINALIZADO.getValor());
		resul.put("estadoPendiente", EstadoInforme.PENDIENTE_POR_RENOVACION.getValor());
		resul.put("incluirBoletinCheck", ficha.getIncluirBoletinCheck());
		resul.put("urlInforme", "../informeFP/verInformeFPRevisionView.do?idFP=" + ficha.getId());
		
		return forward("/informeFP/revisionFP", resul);
	}
	
	
	@RequestMapping("/informeFP/verFP.do")
	public ModelAndView verFP(@RequestParam ("idFP") Long idFP){
		Map<String, Object> resul = new HashMap<String, Object>();
		FichaFamiliar fichaObject = null;
		List<FichaFamiliar> convivientesList = new ArrayList<FichaFamiliar>();
		FichaPresentacion ficha = srvFP.obtenerInformeFP(idFP);
		if(!ficha.getEstado().equals(EstadoInforme.ENVIADO)){
			Integer edad = Formateador.calcularEdad(ficha.getBecado().getDatosPersonales().getFechaNacimiento());
			ficha.setEdad(edad);			
			srvFP.guardarInformeFP(ficha);
		}
		if(!verSiTieneBoletinCargado(ficha))
			ficha.setBoletinSeleccions(null);		
		for(FichaFamiliar unaFicha : ficha.getConvivientes())
		{
			if(unaFicha.getConvive()!= null)
				if(unaFicha.getConvive().equals(Convive.SI)){
					fichaObject = new FichaFamiliar();
					fichaObject = unaFicha;
					convivientesList.add(fichaObject);
				}
		}
		ficha.setConvivientes(convivientesList);
		resul.put("ficha", ficha);
		resul.put("incluirBoletinCheck", ficha.getIncluirBoletinCheck());
		return forward("/informeFP/verFP", resul);
	}
	
	@RequestMapping("/informeFP/actualizarInformeRevision.do")
	public ModelAndView actualizarInformeRevision(@ModelAttribute("ficha") FichaPresentacion ficha,
												  @RequestParam("idFP") Long idFP,
												  @RequestParam("valorPerfil") String valorPerfil,
												  @RequestParam(required=false,value="cuandoTermine") String cuandoTermine,
												  @RequestParam(required=false,value="situacionEscolar") String situacionEscolar,
												  @RequestParam(required=false,value="incorporacion") String incorporacion,
												  @RequestParam(required=false,value="observacionesNoIncorporacion") String observacionesNoIncorporacion,
												  @RequestParam(required=false,value="propositoAnual") String propositoAnual,
												  @RequestParam("vosMismo") String vosMismo,												  
												  @RequestParam(required=false, value="incluirBoletinCheck") Boolean incluirBoletinCheck,
												  @RequestParam("accion") String accion) throws ParseException, IOException 
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		ModelAndView modelAndView = null;
		FichaPresentacion fichaP = srvFP.obtenerInformeFP(idFP);
		fichaP.setCuandoTermine(cuandoTermine);
		fichaP.setVosMismo(vosMismo);
		fichaP.setObservacionesGenerales(vosMismo);
		fichaP.setSituacionEscolar(situacionEscolar);
		fichaP.setIncorporacion(incorporacion);
		fichaP.setObservacionesNoIncorporacion(observacionesNoIncorporacion);
		fichaP.setPropositoAnual(propositoAnual);
		String situacionEscolar2=situacionEscolar;
		
		
		if(situacionEscolar.equals("0")){
			situacionEscolar2="Promovido sin adeudar materias";
		}
		if(situacionEscolar.equals("1")){
			situacionEscolar2="Pendiente";
		}
		if(situacionEscolar.equals("2")){
			situacionEscolar2="Repitio";
		}
		if(situacionEscolar.equals("3")){
			situacionEscolar2="Egresó";
		}
		if(situacionEscolar.equals("4")){
			situacionEscolar2="Promovido con materias a rendir";
		}
		
		fichaP.setSituacionEscolar(situacionEscolar2);
		
		if(!fichaP.getEstado().equals(EstadoInforme.ENVIADO)){
			Integer edad = Formateador.calcularEdad(fichaP.getBecado().getDatosPersonales().getFechaNacimiento());
			fichaP.setEdad(edad);
		}
		//incluir boletin
		if(incluirBoletinCheck != null){	
			fichaP.setIncluirBoletinCheck(true);
		}
		else
			fichaP.setIncluirBoletinCheck(false);

		if(!verSiTieneBoletinCargado(fichaP)){		
			fichaP.setBoletinSeleccions(null);
		}
		fichaP.setFechaUltimaModificacion(new Date());
		fichaP.setFechaCambioUltimoEstado(new Date());	
		if(accion.equals(ACCION_GUARDAR)){
			if(!fichaP.getEstado().equals(EstadoInforme.PENDIENTE_POR_RENOVACION))
				fichaP.setEstado(EstadoInforme.REVISION);	
			resul.put("mensaje", EXITO_MSJ_REVISION);
		}
		else if(accion.equals(ACCION_FINALIZAR)){
			fichaP.setEstado(EstadoInforme.FINALIZADO);			
			resul.put("mensaje", EXITO_MSJ_FINALIZAR);
		}
		fichaP.setFechaUltimaModificacion(new Date());
		fichaP.setFechaReincorporacionPBE(fichaP.getBecado().getFechaReincorporacionPBE());
		srvFP.guardarInformeFP(fichaP);
		if(StringUtils.isNotBlank(valorPerfil))
			modelAndView = new ModelAndView("redirect:/reporteGeneralInformes/verReporteGeneralInformes.do");
		else
			modelAndView = new ModelAndView("redirect:/informeFP/listaInformesFPRevision.do");
		return modelAndView;				
	}
			
	private Boolean verSiTieneBoletinCargado(FichaPresentacion ficha)
	{
		Boolean tieneBoletinCargado = false;
		
		for (BoletinSeleccion boletinSeleccion : ficha.getBoletinSeleccions()) 
		{
			if(!boletinSeleccion.esVacio())
			{
				tieneBoletinCargado = true;
				break;
			}
		}
		return tieneBoletinCargado;
	}
	
	@RequestMapping("/informeFP/eliminarFP.do")
	public ModelAndView eliminarFP(@RequestParam ("idFP") Long idFP, @RequestParam ("urlRegreso") String urlRegreso){
		ModelAndView modelAndView = new ModelAndView("redirect:/reporteGeneralInformes/verReporteGeneralInformes.do");
		String mensaje = "";
		String error = "";
		FichaPresentacion ficha = srvFP.obtenerInformeFP(idFP);
		if(!ficha.getEstado().equals(EstadoInforme.ENVIADO)){
			if(ficha.getFpPorReasignacion()){				
				InformeIS1 informeIS1 = srvIS1.obtenerInformePorAlumno(ficha.getBecado().getId(), ficha.getCicloActual());
				if(informeIS1 != null){
					if(informeIS1.getFp() != null && informeIS1.getFp().getId().equals(idFP)){
						informeIS1.setFp(null);
						srvIS1.guardarInformeIS1(informeIS1);
					}				
				}			
			}
			srvFP.eliminarInformeFP(ficha);
			mensaje = "La Ficha de Presentación del becado " + ficha.getBecado().getDatosPersonales().getApellidoNombre() + 
					" ha sido eliminada";
		}
		else
			error = "La Ficha de Presentación del becado " + ficha.getBecado().getDatosPersonales().getApellidoNombre() + 
				" no se puede eliminar porque la misma ya ha sido enviada al padrino";
		
		if(StringUtils.isNotBlank(mensaje))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?mensaje=" + mensaje);
		if(StringUtils.isNotBlank(error))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?error=" + error);
		
		return modelAndView;

	}
}