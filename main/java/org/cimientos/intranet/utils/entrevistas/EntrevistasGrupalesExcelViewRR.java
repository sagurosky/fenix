package org.cimientos.intranet.utils.entrevistas;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.cimientos.intranet.dto.EntrevistaSeleccionDTO;
//import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaFinal;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaGrupal;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaReIncorporacion;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaRenovacion;
//import org.cimientos.intranet.servicio.CicloProgramaSrv;
//import org.cimientos.intranet.servicio.EntrevistaSrv;
import org.cimientos.intranet.utils.ExportacionEspecialHelper;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.cimientos.intranet.dto.ReporteEntrevistaSeleccionDTO2;
import com.cimientos.intranet.enumerativos.entrevista.ContenidosAbordados;
import com.cimientos.intranet.enumerativos.entrevista.DetalleGastos;
import com.cimientos.intranet.enumerativos.entrevista.EstrategiaComplementaria;
//import com.cimientos.intranet.enumerativos.entrevista.EvaluacionCobroBeca;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionIncorporacion;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionFinal;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionMergeada;
//import com.cimientos.intranet.enumerativos.entrevista.MotivoAusencia;
import com.cimientos.intranet.enumerativos.entrevista.EntrevistaGrupalDTO;
import com.cimientos.intranet.enumerativos.entrevista.EventoGenericoDTO;
import com.cimientos.intranet.enumerativos.entrevista.MotivoIncorporacionPendiente;
import com.cimientos.intranet.enumerativos.entrevista.MotivoPendiente;
import com.cimientos.intranet.enumerativos.entrevista.PropositoAnioComienza;
import com.cimientos.intranet.enumerativos.entrevista.SituacionCrisis;
//import com.cimientos.intranet.enumerativos.entrevista.TipoContacto;
import com.cimientos.intranet.enumerativos.entrevista.TipoEntrevista;
import com.cimientos.intranet.enumerativos.entrevista.motivoNoIncorporacion;
//import com.sun.org.apache.xpath.internal.operations.Equals;

import org.cimientos.intranet.web.controller.Conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
//import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Types;

public class EntrevistasGrupalesExcelViewRR extends AbstractExcelView{
	
	private static int bachSize = 1000;
	private static final String PATRON_FECHA = "dd/MM/yyyy";
	private static final String NO_APLICA = "No aplica";
	private static final String SI = "Si";
	private static final String NO = "No";

	
	//@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String,Object> model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		

		
		ExportacionEspecialHelper exportacionHelper = (ExportacionEspecialHelper) model.get("exportacionHelper");
		
		HSSFSheet sheet = workbook.getSheet("entrevistas_grupales");
		
		Long idevento=null;
		idevento=(Long) model.get("entrevistaId");

		//int inicial = 0;
		
		List<EntrevistaGrupalDTO> entrevistaGrupal = null;
		
		int rowNum = 1;
		int parcial = 0;
		int totalRows=1000;
		HSSFRow row;
		
	
		entrevistaGrupal=obtenerEntrevistaGrupal(idevento);
		    
	    
		while (parcial < totalRows) {
			parcial = parcial + bachSize;
		    for (EntrevistaGrupalDTO e : entrevistaGrupal) {
		    
		    	row = sheet.createRow(rowNum++);
				crearFila(e, exportacionHelper, row);
		    	
		    }
		}
	}
	

	public static synchronized ArrayList<EntrevistaGrupalDTO> obtenerEntrevistaGrupal(Long idevento) {
 
		////System.out.println(idevento);
		
		//El array que contendra todos nuestras Entrevistas de Seleccion
		ArrayList<EntrevistaGrupalDTO> lista = new ArrayList<EntrevistaGrupalDTO>();
	
        Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        String call=null;
        int vueltas=0;
        try {
        		// traigo la entrevista grupal           	
        		//Nombre del procedimiento almacenado
               // if (idevento>100){
               // 	call = "{CALL SP_EntrevistaGrupal1(?)}";
               // }else{
                	call = "{CALL SP_EntrevistaGrupalT1RR(?)}";
               // }
        		
        		
                cn = Conexion.getConexion();
                cl = cn.prepareCall(call);
                cl.setLong(1, idevento);
                //La sentencia lo almacenamos en un resulset
                rs = cl.executeQuery();
                //Consultamos si hay datos para recorrerlo
                //e insertarlo en nuestro array
                //La sentencia lo almacenamos en un resulset
                rs = cl.executeQuery();
	            //Consultamos si hay datos para recorrerlo
	            //e insertarlo en nuestro array
	            while (rs.next()) {
	    	    	EntrevistaGrupalDTO eg = new EntrevistaGrupalDTO();
	    	    	eg.setId(rs.getString(1));
	    	    	eg.setFecha(rs.getString(2));
	    	    	eg.setLugar(rs.getString(3));
	    	    	
	    	    	eg.setObjetivo(rs.getString(4));
	    	    	eg.setTemas(rs.getString(5));
	    	    	eg.setObservaciones(rs.getString(6));
	    	    	//eg.setEa(rs.getString(7));
	    	    
	    	    	String ea =rs.getString(8);
	    	    	eg.setTipoEncuentro(rs.getString(9));
	    	    	eg.setOp1(rs.getString(10));
	    	    	eg.setOp2(rs.getString(11));
	    	    	eg.setOp3(rs.getString(12));
	    	    	eg.setOp4(rs.getString(13));
	    	    	eg.setOp5(rs.getString(14));
	    	    	eg.setOp6(rs.getString(15));
	    	    	eg.setOp(rs.getString(16));
	    	    	// 	busco ea 
	                
	    	    	Connection cn01 = null;
	                CallableStatement cl01 = null;
	                ResultSet rs01 = null;
	                try {
	                    //Nombre del procedimiento almacenado
	                    String call01 = "{CALL SP_EventoGenericoTraerEA(?)}";
	                    cn01 = Conexion.getConexion();
	                    cl01 = cn01.prepareCall(call01);
	                    //cl0.setLong(1, idevento);
	                    cl01.setString(1,ea);
	                    //La sentencia lo almacenamos en un resulset
	                    rs01 = cl01.executeQuery();
	                    //Consultamos si hay datos para recorrerlo
	                    //e insertarlo en nuestro array
	                    String bucleContenidos;
	                    bucleContenidos="";
	                    
	                    while (rs01.next()) {
	                    	
	                    	eg.setEa(rs01.getString(1));
	                    	                   	
	                    	
	                    }

	                    Conexion.cerrarCall(cl01);
	                    Conexion.cerrarConexion(cn01);
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    Conexion.cerrarCall(cl01);
	                    Conexion.cerrarConexion(cn01);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                    Conexion.cerrarCall(cl01);
	                    Conexion.cerrarConexion(cn01);
	                }
	    	    
	    	    	// busco fecha asignacion 
	                //String DNI=resDTO.getNroDNI();
	                Connection cn0 = null;
	                CallableStatement cl0 = null;
	                ResultSet rs0 = null;
	                try {
	                    //Nombre del procedimiento almacenado
	                    String call0 = "{CALL SP_EntrevistaGrupal2(?)}";
	                    cn0 = Conexion.getConexion();
	                    cl0 = cn0.prepareCall(call0);
	                    //cl0.setLong(1, idevento);
	                    cl0.setString(1,eg.getId());
	                    //La sentencia lo almacenamos en un resulset
	                    rs0 = cl0.executeQuery();
	                    //Consultamos si hay datos para recorrerlo
	                    //e insertarlo en nuestro array
	                    String bucleContenidos;
	                    bucleContenidos="";
	                    
	                    while (rs0.next()) {
	                    	if(vueltas==0){
	                    		bucleContenidos=rs0.getString(1)+" - ";
	                    	}
	                    	else{
	                    		bucleContenidos=bucleContenidos+rs0.getString(1)+" - ";
	                    	}
	                    	
	                    	                   	
	                    	vueltas++;
	                    }
	                    eg.setAlumno(bucleContenidos);
	                    Conexion.cerrarCall(cl0);
	                    Conexion.cerrarConexion(cn0);
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    Conexion.cerrarCall(cl0);
	                    Conexion.cerrarConexion(cn0);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                    Conexion.cerrarCall(cl0);
	                    Conexion.cerrarConexion(cn0);
	                }
		        
	                
	                
	                
	                /*
	                // busco los que asistieron                
	                Connection cn1 = null;
	                CallableStatement cl1 = null;
	                ResultSet rs1 = null;
	                try {
	                    //Nombre del procedimiento almacenado
	                    String call1 = "{CALL SP_EventoGenerico3(?)}";
	                    cn1 = Conexion.getConexion();
	                    cl1 = cn1.prepareCall(call1);
	                    //cl1.setLong(1, idevento);
	                    cl1.setString(1,eg.getId());
	                    //La sentencia lo almacenamos en un resulset
	                    rs1 = cl1.executeQuery();
	                    //Consultamos si hay datos para recorrerlo
	                    //e insertarlo en nuestro array
	                    String convocados="";
	                    String asistio="";
	                    String ra1="";
	                    String vin1="";
	                    String ra2="";
	                    String vin2="";
	                    vueltas=0;
	                    while (rs1.next()) {	                       
	                        if(vueltas==0){
	                        	if(rs1.getString(2).equals("CONVOCADO")){
		                        	convocados=rs1.getString(1)+" - ";
		                        }
		                        if(rs1.getString(3).equals("SI")){
		                        	asistio=rs1.getString(1)+" - ";
		                        	ra1=rs1.getString(4)+" - ";
		                        	vin1=rs1.getString(5)+" - ";
		                        	if(rs1.getString(6)!=null && rs1.getString(6)!=""){
		                        		ra2=rs1.getString(6)+" - ";
		                            	vin2=rs1.getString(7)+" - ";
		                        	}
		                        }
	                        }else{
	                        	if(rs1.getString(2).equals("CONVOCADO")){
		                        	convocados=convocados+rs1.getString(1)+" - ";
		                        }
		                        if(rs1.getString(3).equals("SI")){
		                        	asistio=asistio+rs1.getString(1)+" - ";
		                        	ra1=ra1+rs1.getString(4)+" - ";
		                        	vin1=vin1+rs1.getString(5)+" - ";
		                        	if(rs1.getString(6)!=null && rs1.getString(6)!=""){
		                        		ra2=ra2+rs1.getString(6)+" - ";
		                            	vin2=vin2+rs1.getString(7)+" - ";
		                        	}
		                        }
	                        }
	                        vueltas++;
	                    }
	                    eg.setConvocados(convocados);
	                    eg.setAsistio(asistio);
	                    eg.setResponsable1(ra1);
	                    eg.setVinculo1(vin1);
	                    eg.setResponsable2(ra2);
	                    eg.setVinculo2(vin2);
	                    Conexion.cerrarCall(cl1);
	                    Conexion.cerrarConexion(cn1);
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    Conexion.cerrarCall(cl1);
	                    Conexion.cerrarConexion(cn1);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                    Conexion.cerrarCall(cl1);
	                    Conexion.cerrarConexion(cn1);
	                }
	              */
	                //Lo adicionamos a nuestra lista
	                lista.add(eg);
        	}      
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }// empiezo a buscar
        return lista; 
    }
	

	private void crearFila(EntrevistaGrupalDTO e, ExportacionEspecialHelper exportacionHelper, HSSFRow row) {
		row.createCell(0).setCellValue(e.getId());
		row.createCell(1).setCellValue(e.getLugar());
		row.createCell(2).setCellValue(e.getEa());
		row.createCell(3).setCellValue(e.getFecha());
		row.createCell(4).setCellValue(e.getObjetivo());
		row.createCell(5).setCellValue(e.getTemas());
		row.createCell(6).setCellValue(e.getObservaciones());
		row.createCell(7).setCellValue(e.getAlumno());
		row.createCell(8).setCellValue(e.getTipoEncuentro());
		row.createCell(9).setCellValue(e.getOp1());
		row.createCell(10).setCellValue(e.getOp2());
		row.createCell(11).setCellValue(e.getOp3());
		row.createCell(12).setCellValue(e.getOp5());
		row.createCell(13).setCellValue(e.getOp6());
		row.createCell(14).setCellValue(e.getOp4());
		row.createCell(15).setCellValue(e.getOp());
	}
	
	
	
}