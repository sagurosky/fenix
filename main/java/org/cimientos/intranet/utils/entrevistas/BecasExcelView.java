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

//import org.cimientos.intranet.servicio.CicloProgramaSrv;
//import org.cimientos.intranet.servicio.EntrevistaSrv;
import org.cimientos.intranet.utils.ExportacionEspecialHelper;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.cimientos.intranet.dto.ExportarBecasDTO;



import org.cimientos.intranet.web.controller.Conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
//import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Types;

public class BecasExcelView extends AbstractExcelView{
	
	private static int bachSize = 1000;
	

	
	//@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String,Object> model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		

		
		ExportacionEspecialHelper exportacionHelper = (ExportacionEspecialHelper) model.get("exportacionHelper");
		
		HSSFSheet sheet = workbook.getSheet("becas");
		
		Long idevento=null;
		idevento=(Long) model.get("idEvento");

		//int inicial = 0;
		
		List<ExportarBecasDTO> exportarBeca = null;
		
		int rowNum = 1;
		int parcial = 0;
		int totalRows=1000;
		HSSFRow row;
		
	
		exportarBeca=obtenerBeca(idevento);
		    
	    
		while (parcial < totalRows) {
			parcial = parcial + bachSize;
		    for (ExportarBecasDTO e : exportarBeca) {
		    
		    	row = sheet.createRow(rowNum++);
				crearFila(e, exportacionHelper, row);
		    	
		    }
		}
	}
	

	public static synchronized ArrayList<ExportarBecasDTO> obtenerBeca(Long idevento) {
 
		////System.out.println(idevento);
		
		//El array que contendra todos nuestras Entrevistas de Seleccion
		ArrayList<ExportarBecasDTO> lista = new ArrayList<ExportarBecasDTO>();
	
        Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        String call=null;
        int vueltas=0;
        try {
        		// traigo el evento generico           	        		
                call = "{CALL SP_ExportarBecas1T()}";
        		cn = Conexion.getConexion();
                cl = cn.prepareCall(call);
                //La sentencia lo almacenamos en un resulset 
                rs = cl.executeQuery();
                //Consultamos si hay datos para recorrerlo e insertarlo en nuestro array La sentencia lo almacenamos en un resulset
                rs = cl.executeQuery();
	            //Consultamos si hay datos para recorrerlo e insertarlo en nuestro array
	            String ea="";
                while (rs.next()) {
	    	    	ea="";
                	ExportarBecasDTO eb = new ExportarBecasDTO();
	    	    	eb.setIdBeca(rs.getString(1));
	    	    	eb.setTipoPadrino(rs.getString(2));
	    	    	eb.setPadrino(rs.getString(3));
	    	    	eb.setIdPlataforma(rs.getString(4));
	    	    	eb.setContacto(rs.getString(5));
	    	    	eb.setNombrePadrino(rs.getString(6));
	    	    	eb.setApellidoPadrino(rs.getString(7));
	    	    	eb.setMail(rs.getString(8));
	    	    	eb.setZona(rs.getString(9));
	    	    	eb.setCantidad(rs.getString(10));
	    	    	eb.setTipo(rs.getString(11));
	    	    	eb.setEstado(rs.getString(12));
	    	    	eb.setCiclo(rs.getString(13));
	    	    	eb.setMes(rs.getString(14));
	                //Lo adicionamos a nuestra lista
	                lista.add(eb);
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

	private void crearFila(ExportarBecasDTO e, ExportacionEspecialHelper exportacionHelper, HSSFRow row) {
		row.createCell(0).setCellValue(Integer.parseInt(e.getIdBeca()));
		row.createCell(1).setCellValue(e.getTipoPadrino());
		row.createCell(2).setCellValue(e.getPadrino());
		if(e.getIdPlataforma()!=null){
			row.createCell(3).setCellValue(Integer.parseInt(e.getIdPlataforma()));
		}		
		row.createCell(4).setCellValue(e.getContacto());		
		row.createCell(5).setCellValue(e.getNombrePadrino());
		row.createCell(6).setCellValue(e.getApellidoPadrino());
		row.createCell(7).setCellValue(e.getMail());
		row.createCell(8).setCellValue(e.getZona());
		row.createCell(9).setCellValue(Integer.parseInt(e.getCantidad()));
		row.createCell(10).setCellValue(e.getTipo());
		row.createCell(11).setCellValue(e.getEstado());
		row.createCell(12).setCellValue(e.getCiclo());
		row.createCell(13).setCellValue(e.getMes());
		
	}
	
	
	
}