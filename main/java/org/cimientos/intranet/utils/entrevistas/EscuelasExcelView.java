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
import org.cimientos.intranet.dto.EntrevistaSeleccionDTO;
import org.cimientos.intranet.dto.EscuelaDTO;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaFinal;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaReIncorporacion;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaRenovacion;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.EntrevistaSrv;
import org.cimientos.intranet.utils.ExportacionEspecialHelper;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.cimientos.intranet.dto.ReporteEntrevistaSeleccionDTO2;
import com.cimientos.intranet.enumerativos.DesplegadoEscuela;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaAccesibilidad;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaCED;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaECTAES;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaProyeccionPFE;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaREFP;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaSINO;
import com.cimientos.intranet.enumerativos.entrevista.ContenidosAbordados;
import com.cimientos.intranet.enumerativos.entrevista.DetalleGastos;
import com.cimientos.intranet.enumerativos.entrevista.EstrategiaComplementaria;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionCobroBeca;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionIncorporacion;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionFinal;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionMergeada;
import com.cimientos.intranet.enumerativos.entrevista.MotivoAusencia;
import com.cimientos.intranet.enumerativos.entrevista.MotivoIncorporacionPendiente;
import com.cimientos.intranet.enumerativos.entrevista.MotivoPendiente;
import com.cimientos.intranet.enumerativos.entrevista.PropositoAnioComienza;
import com.cimientos.intranet.enumerativos.entrevista.SituacionCrisis;
import com.cimientos.intranet.enumerativos.entrevista.TipoContacto;
import com.cimientos.intranet.enumerativos.entrevista.TipoEntrevista;
import com.cimientos.intranet.enumerativos.entrevista.motivoNoIncorporacion;









import org.cimientos.intranet.web.controller.Conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

public class EscuelasExcelView extends AbstractExcelView{
	
	private static int bachSize = 1000;
	private static final String PATRON_FECHA = "dd/MM/yyyy";
	private static final String NO_APLICA = "No aplica";
	private static final String SI = "Si";
	private static final String NO = "No";

	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String,Object> model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		//CicloProgramaSrv cicloSrv = (CicloProgramaSrv) model.get("cicloSrv");
		//EntrevistaSrv entrevistaSrv = (EntrevistaSrv) model.get("entrevistaSrv");
		
		ExportacionEspecialHelper exportacionHelper = (ExportacionEspecialHelper) model.get("exportacionHelper");
		
		HSSFSheet sheet = workbook.getSheet("Escuelas");
		
		List<EscuelaDTO> escuelas = null;
		int rowNum = 1;
		int parcial = 0;
		int inicial = 0;
		int totalRows=1000;
		HSSFRow row;
		while (parcial < totalRows) {
			parcial = parcial + bachSize;
			escuelas = obtenerEscuelaDTO();
				for (EscuelaDTO e : escuelas) {
					////System.out.println(estado1);
					////System.out.println(e.getEstadoAlumno());					
					row = sheet.createRow(rowNum++);
					crearFila(e, exportacionHelper, row);
					
				}					
			inicial = parcial;
			escuelas = null;
		}	
	}
	
	public static synchronized ArrayList<EscuelaDTO> obtenerEscuelaDTO() {
        //El array que contendra todos nuestras Entrevistas de Seleccion
        ArrayList<EscuelaDTO> lista = new ArrayList<EscuelaDTO>();
        Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        String call=null;
        
        try {
		//Nombre del procedimiento almacenado
		call = "{CALL SP_TraerEscuelas()}";
		cn = Conexion.getConexion();
        cl = cn.prepareCall(call);	
        
	        
            //La sentencia lo almacenamos en un resulset
            rs = cl.executeQuery();
            //Consultamos si hay datos para recorrerlo
            //e insertarlo en nuestro array
            while (rs.next()) {            	            	            	            	
            	EscuelaDTO resDTO = new EscuelaDTO();
                //Obtenemos los valores de la consulta y creamos
                //nuestro objeto                         	
            	resDTO.setIdEscuela(rs.getString(1));
            	resDTO.setNombre(rs.getString(2));
            	
            	if (rs.getString(3)!=null){
            		resDTO.setCue(rs.getString(3));
            	}else{
            		resDTO.setCue("");
            	}
            	resDTO.setModalidad(rs.getString(4));
            	resDTO.setOrientacion(rs.getString(5));
            	resDTO.setNivel(rs.getString(6));
            	resDTO.setAnios(rs.getString(7));
            	resDTO.setDependencia(rs.getString(8));
            	resDTO.setCp(rs.getString(9));
            	resDTO.setCalle(rs.getString(10));
            	if (rs.getString(11)!=null){
            		resDTO.setNumero(rs.getString(11));
            	}else{
            		resDTO.setNumero("");
            	}
            	
            	resDTO.setBarrio(rs.getString(12));
            	resDTO.setLocalidad(rs.getString(13));
            	resDTO.setProvincia(rs.getString(14));
            	resDTO.setZona(rs.getString(15));            	
            	if (rs.getString(16)!=null){
            		resDTO.setTel1(rs.getString(16));
            	}else{
            		resDTO.setTel1("");
            	}
            	if (rs.getString(17)!=null){
            		resDTO.setTel2(rs.getString(17));
            	}else{
            		resDTO.setTel2("");
            	}
            	resDTO.setMail(rs.getString(18));
            	resDTO.setDirector(rs.getString(19));
            	resDTO.setDirectorCel(rs.getString(20));
            	resDTO.setDirectorMail(rs.getString(21));
            	resDTO.setSecretario(rs.getString(22));
            	resDTO.setSecretarioCel(rs.getString(23));
            	resDTO.setSecretarioMail(rs.getString(24));
            	resDTO.setResonsable(rs.getString(25));
            	resDTO.setResponsableCel(rs.getString(26));
            	resDTO.setResponsablMail(rs.getString(27));
            	resDTO.setRural(rs.getString(28));
            	resDTO.setSubsidio(rs.getString(29));
            	resDTO.setObservacionesGrales(rs.getString(30));
            	resDTO.setEstado(rs.getString(31));
            	resDTO.setMotivoNoSeleccion(rs.getString(32));
            	resDTO.setPrograma(rs.getString(33));
            	resDTO.setModalidadTrabajoEscuela(rs.getString(34));
            	resDTO.setAnioComienzoProyecto(rs.getString(35));
            	resDTO.setAnioComienzoPBE(rs.getString(36));
            	resDTO.setFase(rs.getString(37));
            	resDTO.setObjetivoProyecto(rs.getString(38));
            	resDTO.setObservaciones(rs.getString(39));
            	if (rs.getString(40)!=null){
            		resDTO.setMatricula(rs.getString(40));
            	}else{
            		resDTO.setMatricula("");
            	}
            	if (rs.getString(41)!=null){
            		resDTO.setRepitencia(rs.getString(41));
            	}else{
            		resDTO.setRepitencia("");
            	}
            	if (rs.getString(42)!=null){
            		resDTO.setAbandono(rs.getString(42));
            	}else{
            		resDTO.setAbandono("");
            	}
            	if (rs.getString(43)!=null){
            		resDTO.setInasistencias(rs.getString(43));
            	}else{
            		resDTO.setInasistencias("");
            	}
            	//DMS agrego becados activos a pedido de paula
            	if(rs.getString(94)!=null){
            		resDTO.setBecadosActivos(rs.getString(94));
            	}else{
            		resDTO.setBecadosActivos("");
            	}
            	
            	Long idEscuela=Long.parseLong(resDTO.getIdEscuela());
            	
            	//2018
            	if (rs.getString("escuela.ccephe")!=null){
	            	if (rs.getString("escuela.ccephe").equals("1")){
	            		resDTO.setCcephe("Si");
	            	}else{
	            		resDTO.setCcephe("No");
	            	}
            	}else{
            		resDTO.setCcephe("No");
            	}
            	if (rs.getString("escuela.ced")!=null){
            		resDTO.setCed(DesplegadoEscuelaCED.getPrograma(Integer.parseInt(rs.getString("escuela.ced"))));
            	}
            	else{
            		resDTO.setCed(DesplegadoEscuelaCED.getPrograma(0));
            	}
            	if (rs.getString("escuela.refp")!=null){
            		resDTO.setRefp(DesplegadoEscuelaREFP.getPrograma(Integer.parseInt(rs.getString("escuela.refp"))));
            	}
            	else{
            		resDTO.setRefp(DesplegadoEscuelaREFP.getPrograma(0));
            	}
            	if (rs.getString("escuela.tcoo")!=null){
	            	if (rs.getString("escuela.tcoo").equals("1")){
	            		resDTO.setTcoo("Si");
	            	}else{
	            		resDTO.setTcoo("No");
	            	}
            	}else{
            		resDTO.setTcoo("No");
            	}
            	
            	resDTO.setDsoo(rs.getString("escuela.dsoo"));
            	if (rs.getString("escuela.accesibilidad")!=null){
            		resDTO.setAccesibilidad(DesplegadoEscuelaAccesibilidad.getPrograma(Integer.parseInt(rs.getString("escuela.accesibilidad"))));
            	}else{
            		resDTO.setAccesibilidad(DesplegadoEscuelaAccesibilidad.getPrograma(0));
            	}
            	if (rs.getString("escuela.proyeccionpfe")!=null){
            		resDTO.setProyeccionPFE(DesplegadoEscuelaProyeccionPFE.getPrograma(Integer.parseInt(rs.getString("escuela.proyeccionpfe"))));
            	}else{
            		resDTO.setProyeccionPFE(DesplegadoEscuelaProyeccionPFE.getPrograma(0));
            	}
            	if (rs.getString("escuela.ectaes")!=null){
            		resDTO.setEctaes(DesplegadoEscuelaECTAES.getPrograma(Integer.parseInt(rs.getString("escuela.ectaes"))));
            	}else{
            		resDTO.setEctaes(DesplegadoEscuelaECTAES.getPrograma(0));
            	}
            	if (rs.getString("escuela.eddes")!=null){
            		resDTO.setEddes(DesplegadoEscuela.getPrograma(Integer.parseInt(rs.getString("escuela.eddes"))));
            	}else{
            		resDTO.setEddes(DesplegadoEscuela.getPrograma(0));
            	}
            	if (rs.getString("escuela.edfea")!=null){
            		resDTO.setEdfea(DesplegadoEscuela.getPrograma(Integer.parseInt(rs.getString("escuela.edfea"))));
            	}else{
            		resDTO.setEdfea(DesplegadoEscuela.getPrograma(0));
            	}
            	if (rs.getString("escuela.edbis")!=null){
            		resDTO.setEdbis(DesplegadoEscuela.getPrograma(Integer.parseInt(rs.getString("escuela.edbis"))));
            	}else{
            		resDTO.setEdbis(DesplegadoEscuela.getPrograma(0));
            	}
            	if (rs.getString("escuela.edccpa")!=null){
            		resDTO.setEdccpa(DesplegadoEscuela.getPrograma(Integer.parseInt(rs.getString("escuela.edccpa"))));
            	}else{
            		resDTO.setEdccpa(DesplegadoEscuela.getPrograma(0));
            	}
            	if (rs.getString("escuela.raeea")!=null){
            		resDTO.setRaeea(DesplegadoEscuela.getPrograma(Integer.parseInt(rs.getString("escuela.raeea"))));
            	}else{
            		resDTO.setRaeea(DesplegadoEscuela.getPrograma(0));
            	}
            	if (rs.getString("escuela.ersb")!=null){
            		resDTO.setErsb(DesplegadoEscuelaSINO.getPrograma(Integer.parseInt(rs.getString("escuela.ersb"))));
            	}else{
            		resDTO.setErsb(DesplegadoEscuelaSINO.getPrograma(0));
            	}
            	if (rs.getString("escuela.epep")!=null){
            		resDTO.setEpep(DesplegadoEscuela.getPrograma(Integer.parseInt(rs.getString("escuela.epep"))));
            	}else{
            		resDTO.setEpep(DesplegadoEscuela.getPrograma(0));
            	}
            	if (rs.getString("escuela.ecdpfe")!=null){
            		resDTO.setEcdPFE(DesplegadoEscuelaSINO.getPrograma(Integer.parseInt(rs.getString("escuela.ecdpfe"))));
            	}else{
            		resDTO.setEcdPFE(DesplegadoEscuelaSINO.getPrograma(0));
            	}
            	
            	if (rs.getString("escuela.eudbe")!=null){
            		resDTO.setEudbe(DesplegadoEscuelaSINO.getPrograma(Integer.parseInt(rs.getString("escuela.eudbe"))));
            	}else{
            		resDTO.setEudbe(DesplegadoEscuelaSINO.getPrograma(0));
            	}
            	if (rs.getString("escuela.tpacl")!=null){
            		resDTO.setTpacl(DesplegadoEscuelaSINO.getPrograma(Integer.parseInt(rs.getString("escuela.tpacl"))));
            	}else{
            		resDTO.setTpacl(DesplegadoEscuelaSINO.getPrograma(0));
            	}
            	if (rs.getString("escuela.splftp")!=null){
            		resDTO.setSplftp(DesplegadoEscuelaSINO.getPrograma(Integer.parseInt(rs.getString("escuela.splftp"))));
            	}else{
            		resDTO.setSplftp(DesplegadoEscuelaSINO.getPrograma(0));
            	}
            	if (rs.getString("escuela.euscp")!=null){
            		resDTO.setEuscp(DesplegadoEscuelaSINO.getPrograma(Integer.parseInt(rs.getString("escuela.euscp"))));
            	}else{
            		resDTO.setEuscp(DesplegadoEscuelaSINO.getPrograma(0));
            	}
            	
            	if (rs.getString("escuela.cd1")!=null){
            		resDTO.setCd1(rs.getString("escuela.cd1"));
            	}else{
            		resDTO.setCd1("");
            	}
            	if (rs.getString("escuela.cd2")!=null){
            		resDTO.setCd2(rs.getString("escuela.cd2"));
            	}else{
            		resDTO.setCd2("");
            	}
            	if (rs.getString("escuela.cd3")!=null){
            		resDTO.setCd3(rs.getString("escuela.cd3"));
            	}else{
            		resDTO.setCd3("");
            	}
            	if (rs.getString("escuela.cd4")!=null){
            		resDTO.setCd4(rs.getString("escuela.cd4"));
            	}else{
            		resDTO.setCd4("");
            	}
            	if (rs.getString("escuela.cd5")!=null){
            		resDTO.setCd5(rs.getString("escuela.cd5"));
            	}else{
            		resDTO.setCd5("");
            	}
            	if (rs.getString("escuela.cd6")!=null){
            		resDTO.setCd6(rs.getString("escuela.cd6"));
            	}else{
            		resDTO.setCd6("");
            	}
            	if (rs.getString("escuela.cd7")!=null){
            		resDTO.setCd7(rs.getString("escuela.cd7"));
            	}else{
            		resDTO.setCd7("");
            	}
            	if (rs.getString("escuela.mat1")!=null){
            		resDTO.setMat1(rs.getString("escuela.mat1"));
            	}else{
            		resDTO.setMat1("");
            	}
            	if (rs.getString("escuela.mat2")!=null){
            		resDTO.setMat2(rs.getString("escuela.mat2"));
            	}else{
            		resDTO.setMat2("");
            	}
            	if (rs.getString("escuela.mat3")!=null){
            		resDTO.setMat3(rs.getString("escuela.mat3"));
            	}else{
            		resDTO.setMat3("");
            	}
            	if (rs.getString("escuela.mat4")!=null){
            		resDTO.setMat4(rs.getString("escuela.mat4"));
            	}else{
            		resDTO.setMat4("");
            	}
            	if (rs.getString("escuela.mat5")!=null){
            		resDTO.setMat5(rs.getString("escuela.mat5"));
            	}else{
            		resDTO.setMat5("");
            	}
            	if (rs.getString("escuela.mat6")!=null){
            		resDTO.setMat6(rs.getString("escuela.mat6"));
            	}else{
            		resDTO.setMat6("");
            	}
            	if (rs.getString("escuela.mat7")!=null){
            		resDTO.setMat7(rs.getString("escuela.mat7"));
            	}else{
            		resDTO.setMat7("");
            	}
            	if (rs.getString("escuela.ab1")!=null){
            		resDTO.setAb1(rs.getString("escuela.ab1"));
            	}else{
            		resDTO.setAb1("");
            	}
            	if (rs.getString("escuela.ab2")!=null){
            		resDTO.setAb2(rs.getString("escuela.ab2"));
            	}else{
            		resDTO.setAb2("");
            	}
            	if (rs.getString("escuela.ab3")!=null){
            		resDTO.setAb3(rs.getString("escuela.ab3"));
            	}else{
            		resDTO.setAb3("");
            	}
            	if (rs.getString("escuela.ab4")!=null){
            		resDTO.setAb4(rs.getString("escuela.ab4"));
            	}else{
            		resDTO.setAb4("");
            	}
            	if (rs.getString("escuela.ab5")!=null){
            		resDTO.setAb5(rs.getString("escuela.ab5"));
            	}else{
            		resDTO.setAb5("");
            	}
            	if (rs.getString("escuela.ab6")!=null){
            		resDTO.setAb6(rs.getString("escuela.ab6"));
            	}else{
            		resDTO.setAb6("");
            	}
            	if (rs.getString("escuela.ab7")!=null){
            		resDTO.setAb7(rs.getString("escuela.ab7"));
            	}else{
            		resDTO.setAb7("");
            	}
            	if (rs.getString("escuela.rep1")!=null){
            		resDTO.setRep1(rs.getString("escuela.rep1"));
            	}else{
            		resDTO.setRep1("");
            	}            	
            	if (rs.getString("escuela.rep2")!=null){
            		resDTO.setRep2(rs.getString("escuela.rep2"));
            	}else{
            		resDTO.setRep2("");
            	}
            	if (rs.getString("escuela.rep3")!=null){
            		resDTO.setRep3(rs.getString("escuela.rep3"));
            	}else{
            		resDTO.setRep3("");
            	}
            	if (rs.getString("escuela.rep4")!=null){
            		resDTO.setRep4(rs.getString("escuela.rep4"));
            	}else{
            		resDTO.setRep4("");
            	}
            	if (rs.getString("escuela.rep5")!=null){
            		resDTO.setRep5(rs.getString("escuela.rep5"));
            	}else{
            		resDTO.setRep5("");
            	}
            	if (rs.getString("escuela.rep6")!=null){
            		resDTO.setRep6(rs.getString("escuela.rep6"));
            	}else{
            		resDTO.setRep6("");
            	}
            	if (rs.getString("escuela.rep7")!=null){
            		resDTO.setRep7(rs.getString("escuela.rep7"));
            	}else{
            		resDTO.setRep7("");
            	}
            	
            	if (rs.getString("escuela.eqa")!=null){
            		resDTO.setEqa(rs.getString("escuela.eqa"));
            	}else{
            		resDTO.setEqa("");
            	}
            	
            	
            	// Turnos
            	Connection cn1 = null;
            	CallableStatement cl1 = null;
                ResultSet rs1 = null;
                String call1=null;
                call1 = "{CALL SP_TraerTurnosEscuela(?)}";
        		cn1 = Conexion.getConexion();
                cl1 = cn.prepareCall(call1);	
                cl1.setLong(1, idEscuela);
        	        
                //La sentencia lo almacenamos en un resulset
                rs1 = cl1.executeQuery();
                //Consultamos si hay datos para recorrerlo
                //e insertarlo en nuestro array
                String turnos="";
                while (rs1.next()) {         
                	turnos=rs1.getString(1)+" ";
        	
                }	
            	resDTO.setTurnos(turnos);
            	Conexion.cerrarCall(cl1);
                Conexion.cerrarConexion(cn1);
            	// Espacio Apoyo Escuela
            	Connection cn2 = null;
            	CallableStatement cl2 = null;
                ResultSet rs2 = null;
                String call2=null;
                call2 = "{CALL SP_TraerEspacioApoyoEscuela(?)}";
        		cn2 = Conexion.getConexion();
                cl2 = cn.prepareCall(call2);	
                cl2.setLong(1, idEscuela);
        	        
                //La sentencia lo almacenamos en un resulset
                rs2 = cl2.executeQuery();
                //Consultamos si hay datos para recorrerlo
                //e insertarlo en nuestro array
                String espacio="";
                while (rs2.next()) {         
                	espacio=rs2.getString(1)+" ";
        	
                }	
            	resDTO.setEspacios(espacio);
            	//Lo adicionamos a nuestra lista
            	Conexion.cerrarCall(cl2);
                Conexion.cerrarConexion(cn2);
                lista.add(resDTO);
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
        }

        return lista;
    }
	
	private void crearFila(EscuelaDTO e, ExportacionEspecialHelper exportacionHelper, HSSFRow row) {
		row.createCell(0).setCellValue(e.getIdEscuela());
		row.createCell(1).setCellValue(e.getNombre());
		row.createCell(2).setCellValue(e.getCue());
		row.createCell(3).setCellValue(e.getModalidad());
		row.createCell(4).setCellValue(e.getOrientacion());
		row.createCell(5).setCellValue(e.getNivel());
		row.createCell(6).setCellValue(e.getAnios());
		row.createCell(7).setCellValue(e.getDependencia());
		row.createCell(8).setCellValue(e.getCalle() +" " + e.getNumero()+" CP: " +  e.getCp()+ " - "+e.getBarrio()+" - "+ e.getLocalidad()+" - "+e.getProvincia());		
		row.createCell(9).setCellValue(e.getZona());
		row.createCell(10).setCellValue("Tel1: "+e.getTel1()+" - Tel2: "+ e.getTel2());		
		row.createCell(11).setCellValue(e.getMail());
		row.createCell(12).setCellValue(e.getDirector());
		row.createCell(13).setCellValue(e.getDirectorCel());
		row.createCell(14).setCellValue(e.getDirectorMail());
		row.createCell(15).setCellValue(e.getSecretario());
		row.createCell(16).setCellValue(e.getSecretarioCel());
		row.createCell(17).setCellValue(e.getSecretarioMail());
		row.createCell(18).setCellValue(e.getResonsable());
		row.createCell(19).setCellValue(e.getResponsableCel());
		row.createCell(20).setCellValue(e.getResponsablMail());
		row.createCell(21).setCellValue(e.getRural());
		row.createCell(22).setCellValue(e.getSubsidio());
		row.createCell(23).setCellValue(e.getObservacionesGrales());
		row.createCell(24).setCellValue(e.getEstado());
		row.createCell(25).setCellValue(e.getMotivoNoSeleccion());
		row.createCell(26).setCellValue(e.getPrograma());
		row.createCell(27).setCellValue(e.getModalidadTrabajoEscuela());
		row.createCell(28).setCellValue(e.getAnioComienzoProyecto());
		row.createCell(29).setCellValue(e.getAnioComienzoPBE());
		row.createCell(30).setCellValue(e.getFase());
		row.createCell(31).setCellValue(e.getObjetivoProyecto());
		row.createCell(32).setCellValue(e.getObservaciones());		
		row.createCell(33).setCellValue(e.getMatricula());
		row.createCell(34).setCellValue(e.getRepitencia());
		row.createCell(35).setCellValue(e.getAbandono());
		row.createCell(36).setCellValue(e.getInasistencias());
		row.createCell(37).setCellValue(e.getTurnos());
		row.createCell(38).setCellValue(e.getEspacios());		
		row.createCell(39).setCellValue(e.getCcephe());
		row.createCell(40).setCellValue(e.getCed().getValor());
		row.createCell(41).setCellValue(e.getRefp().getValor());
		row.createCell(42).setCellValue(e.getTcoo());
		row.createCell(43).setCellValue(e.getDsoo());
		row.createCell(44).setCellValue(e.getAccesibilidad().getValor());
		row.createCell(45).setCellValue(e.getProyeccionPFE().getValor());
		row.createCell(46).setCellValue(e.getEctaes().getValor());
		row.createCell(47).setCellValue(e.getEddes().getValor());
		row.createCell(48).setCellValue(e.getEdfea().getValor());
		row.createCell(49).setCellValue(e.getEdbis().getValor());
		row.createCell(50).setCellValue(e.getEdccpa().getValor());
		row.createCell(51).setCellValue(e.getRaeea().getValor());
		row.createCell(52).setCellValue(e.getErsb().getValor());
		row.createCell(53).setCellValue(e.getEpep().getValor());
		row.createCell(54).setCellValue(e.getEcdPFE().getValor());		
		row.createCell(55).setCellValue(e.getCd1());
		row.createCell(56).setCellValue(e.getCd2());
		row.createCell(57).setCellValue(e.getCd3());
		row.createCell(58).setCellValue(e.getCd4());
		row.createCell(59).setCellValue(e.getCd5());
		row.createCell(60).setCellValue(e.getCd6());
		row.createCell(61).setCellValue(e.getCd7());
		row.createCell(62).setCellValue(e.getMat1());
		row.createCell(63).setCellValue(e.getMat2());
		row.createCell(64).setCellValue(e.getMat3());
		row.createCell(65).setCellValue(e.getMat4());
		row.createCell(66).setCellValue(e.getMat5());
		row.createCell(67).setCellValue(e.getMat6());
		row.createCell(68).setCellValue(e.getMat7());
		row.createCell(69).setCellValue(e.getRep1());
		row.createCell(70).setCellValue(e.getRep2());
		row.createCell(71).setCellValue(e.getRep3());
		row.createCell(72).setCellValue(e.getRep4());
		row.createCell(73).setCellValue(e.getRep5());
		row.createCell(74).setCellValue(e.getRep6());
		row.createCell(75).setCellValue(e.getRep7());
		row.createCell(76).setCellValue(e.getAb1());
		row.createCell(77).setCellValue(e.getAb2());
		row.createCell(78).setCellValue(e.getAb3());
		row.createCell(79).setCellValue(e.getAb4());
		row.createCell(80).setCellValue(e.getAb5());
		row.createCell(81).setCellValue(e.getAb6());
		row.createCell(82).setCellValue(e.getAb7());
		row.createCell(83).setCellValue(e.getEudbe().getValor());
		row.createCell(84).setCellValue(e.getTpacl().getValor());
		row.createCell(85).setCellValue(e.getSplftp().getValor());
		row.createCell(86).setCellValue(e.getEuscp().getValor());
		row.createCell(87).setCellValue(e.getEqa());
		row.createCell(88).setCellValue(e.getBecadosActivos());
		
		
		
	}
		
	private String getMotivoSuspensionCesacion(EntrevistaIndividual e, ExportacionEspecialHelper exportacionHelper) {
		if(e.getEvaluacionCobroBeca() != null && e.getEvaluacionCobroBeca() == EvaluacionCobroBeca.SUSPENDIDO)
			return exportacionHelper.getMotivoSuspension(e);
		else
			return exportacionHelper.getMotivoCesacion(e);
	}

	private String getMotivoAusenciaRAUnificado(EntrevistaIndividual e, ExportacionEspecialHelper exportacionHelper) {
		String motivoAusencia = exportacionHelper.getMotivoAusenciaRA(e);
		String otroMotivoAusencia = exportacionHelper.getOtroMotivoAusenciaRA(e);
		if(motivoAusencia != "" && motivoAusencia != MotivoAusencia.OTROS.getValor())
			return motivoAusencia;
		else
			if(motivoAusencia != "" && motivoAusencia == MotivoAusencia.OTROS.getValor())
				return "Otro," + otroMotivoAusencia;
			else
				return NO_APLICA;
	}

	private String getMotivoAusenciaBecadoUnificado(EntrevistaIndividual e) {
		if(e.getMotivoAusencia() != null && e.getMotivoAusencia() != MotivoAusencia.OTROS)
			return e.getMotivoAusencia().getValor();
		else
			if(e.getMotivoAusencia() != null && e.getMotivoAusencia() == MotivoAusencia.OTROS)
				return "Otro," + e.getOtroMotivoAusencia();
			else
				return NO_APLICA;
	}

	private String getTipoContactoUnificado(EntrevistaIndividual e, ExportacionEspecialHelper exportacionHelper) {
		String contactoTipo = exportacionHelper.getTipoContacto(e);
		if(contactoTipo != "" && contactoTipo != TipoContacto.OTRO.getValor())
			return contactoTipo;
		else{
			String otroContacto = exportacionHelper.getOtroTipoContacto(e);
			if(contactoTipo != "" && contactoTipo == TipoContacto.OTRO.getValor())
				return "Otro," + otroContacto;
			else
				return "";
		}
	}

	public String getMotivoRenovacionUnificado(EntrevistaIndividual e) {
		String valor = "";
		if(e.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			EntrevistaRenovacion er = (EntrevistaRenovacion) e;
			if(er.getEvaluacionRenovacionMergeada() != null){
					if(er.getEvaluacionRenovacionMergeada() == EvaluacionRenovacionMergeada.PENDIENTE){
						if(er.getMotivoPendiente() != null && er.getMotivoPendiente() != MotivoPendiente.OTRO)
							valor = er.getMotivoPendiente().getValor();
						else
							if(er.getMotivoPendiente() != null && er.getMotivoPendiente() == MotivoPendiente.OTRO)
								valor =  "Otro," + (er.getMotivoOtro()!=null?er.getMotivoOtro():"");				
					}
					else if(er.getEvaluacionRenovacionMergeada() == EvaluacionRenovacionMergeada.NO_RENUEVA){
							if(er.getMotivoNoRenovacion() != null)
								valor = er.getMotivoNoRenovacion().getValor();							
						}
						else
							valor = NO_APLICA;
			}
		}
		else if(e.getTipoEntrevista().equals(TipoEntrevista.FINAL)){			
				EntrevistaFinal ef = (EntrevistaFinal) e;
				if(ef.getEvaluacionRenovacionFinal() != null){
					if(ef.getEvaluacionRenovacionFinal() == EvaluacionRenovacionFinal.NO_RENUEVA){
						if(ef.getMotivoNoRenovacion() != null)
							valor = ef.getMotivoNoRenovacion().getValor();			
					}
					else
						valor = NO_APLICA;
				}
		}
		else
			valor = NO_APLICA;
		
		return valor;
	}
	
	
	public String getMotivoIncorporacion(EntrevistaIndividual e) {
		if(e.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){				
			EntrevistaReIncorporacion ei = (EntrevistaReIncorporacion) e; 
			if(ei.getIncorporacion() != null){
				if(ei.getIncorporacion() == EvaluacionIncorporacion.INCORPORA)
					return NO_APLICA;
				else
					if(ei.getIncorporacion() == EvaluacionIncorporacion.INCORPORAPENDIENTE)
						if(ei.getMotivoPendiente() != null 	&& ei.getMotivoPendiente() != MotivoIncorporacionPendiente.OTROMOTIVO)
							return ei.getMotivoPendiente().getValor();
						else
							return "Otro," + (ei.getMotivoOtroPendiente()!=null?ei.getMotivoOtroPendiente():"");
					else
						if(ei.getMotivoNoIncorporacion() != null && ei.getMotivoNoIncorporacion() != motivoNoIncorporacion.OTRO)
							return ei.getMotivoNoIncorporacion().getValor();
						else
							return "Otro," + (ei.getMotivoOtroPendiente()!=null?ei.getMotivoOtroPendiente():"");
			}
			else
				return "";
		}
		else
			return NO_APLICA;
	}
	
	public String getFechaEntrevista(EntrevistaIndividual entrevista) {
		if(entrevista.getFechaEntrevista()!= null){
			return Formateador.formatearFecha(entrevista.getFechaEntrevista(), PATRON_FECHA) ;
		}
		return "";
	}
	
	public String getCantidadInasistencias(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) || entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = entrevista.getCantidadInasistencias()!= null ? Float.toString(entrevista.getCantidadInasistencias()) : "";
		}
		return valor;
	}
	
	public String getLugarProximaEntrevista(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(!entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL) ){
			valor = entrevista.getLugarProximaEntrevista() != null ? entrevista.getLugarProximaEntrevista().getNombre()
					: "";
		}
		return valor;
	}
	
	public String getHoraProximaEntrevista(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(!entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL) ){
			valor = entrevista.getHoraProxEntrevista()!=null?entrevista.getHoraProxEntrevista():"";
		}
		return valor;
	}
	
	public String getExpectativasRA(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			EntrevistaRenovacion er = (EntrevistaRenovacion)entrevista;
			if(er.getEvaluacionRenovacionMergeada() != null)
				if(er.getEvaluacionRenovacionMergeada().equals(EvaluacionRenovacionMergeada.RENUEVA)){
					valor = er.getExpectativasRA();
			}
			else{
				valor = "";
			}
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
				EntrevistaReIncorporacion eri = (EntrevistaReIncorporacion)entrevista;
				if(eri.getIncorporacion() != null)
					if(eri.getIncorporacion().equals(EvaluacionIncorporacion.INCORPORA)){
						valor = eri.getExpectativasRA();
				}
				else{
					valor = "";
				}			
		}
		return valor;
	}
	
	public String getDestinoDineroBeca(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			EntrevistaRenovacion er = (EntrevistaRenovacion)entrevista;
			if(er.getEvaluacionRenovacionMergeada() != null){
				if(er.getEvaluacionRenovacionMergeada().equals(EvaluacionRenovacionMergeada.RENUEVA)){
					valor = new StringBuffer();
					if(!entrevista.getDestinoDinero().isEmpty()){
						for (DetalleGastos destino : entrevista.getDestinoDinero()) {
							valor.append( destino.getValor() + ", ");
						}
						valor.deleteCharAt(valor.lastIndexOf(","));
					}	
				}
			}
			else{				valor =  new StringBuffer("");
			}
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){ 
				EntrevistaReIncorporacion eri = (EntrevistaReIncorporacion)entrevista;
				if(eri.getIncorporacion() != null){
					if(eri.getIncorporacion().equals(EvaluacionIncorporacion.INCORPORA)){
						valor = new StringBuffer();
						if(!entrevista.getDestinoDinero().isEmpty()){
							for (DetalleGastos destino : entrevista.getDestinoDinero()) {
								valor.append( destino.getValor() + ", ");
							}
							valor.deleteCharAt(valor.lastIndexOf(","));
						}
					}
				}
				else{
					valor =  new StringBuffer("");
				}
			}
		return valor.toString();
	}
	
	public String getSituacionCrisis(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = new StringBuffer();
			if(!entrevista.getSituacionCrisis().isEmpty()){
				for (SituacionCrisis crisis : entrevista.getSituacionCrisis()) {
					valor.append( crisis.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}
		}
		return valor.toString();
	}
	
	public String getRecomendacionEstrategiaComplementaria(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) ){
			valor = new StringBuffer();
			if(!entrevista.getEstrategiaComp().isEmpty()){
				for (EstrategiaComplementaria estrategia : entrevista.getEstrategiaComp()) {
					valor.append( estrategia.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}
			
		}
		return valor.toString();
	}
	
	public String getContenidosAbordados(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = new StringBuffer();
			if(!entrevista.getContenidosAbordados().isEmpty()){
				for (ContenidosAbordados contenido : entrevista.getContenidosAbordados()) {
					valor.append( contenido.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}	
		}
		return valor.toString();
	}
	
	public String getCompromisoRAEscolaridad(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = entrevista.getCompromisoRA() != null ? entrevista.getCompromisoRA().getValor() : "";
		}
		return valor;
	}
	
	public String getHoraEntrevistaFebreroMarzo(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getHoraProxEntrevista();
		}
		return valor;
	}

	/**
	 * @return the lugarEntrevistaFebreroMarzo
	 */
	public String getLugarEntrevistaFebreroMarzo(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getLugarProximaEntrevista() != null ? ((EntrevistaFinal)entrevista).getLugarProximaEntrevista().getNombre()
					: "";
		}
		return valor;
	}
	
	public String getFechaEntrevistaFebreroMarzo(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			EntrevistaFinal entrevFinal = (EntrevistaFinal)entrevista;
			valor = entrevFinal.getFechaEntrevFebMarzo() != null ?
					Formateador.formatearFecha( ((EntrevistaFinal)entrevista).getFechaEntrevFebMarzo(), PATRON_FECHA)
					: "";
		}
		return valor;
	}
	
	public String getProyeccionAnioProximoFinalizacionPBE(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL) 
				&& ((EntrevistaFinal)entrevista).getProyAnioProximo() != null){
			valor = ((EntrevistaFinal)entrevista).getProyAnioProximo().getValor();
		}
		return valor;
	}
	
	public String getCambioEscuelaProximoAnio(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getCambioEscuelaProxAnio();
		}
		return valor;
	}
	
	public String getEvaluacionPropositoAnual(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getEvaluacionProposito();
		}
		return valor;
	}

	/**
	 * @return the resultadoAnioEscolar
	 */
	public String getResultadoAnioEscolar(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getSituacionEscolarMergeada() != null ?((EntrevistaFinal)entrevista).getSituacionEscolarMergeada().getValor() : "";
		}
		return valor;
	}
	
	public String getDetalleGastos(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) || entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){ 
			valor = new StringBuffer();
			if(!entrevista.getDetalleGastos().isEmpty()){
				for (DetalleGastos detalle : entrevista.getDetalleGastos()) {
					valor.append( detalle.getValor() + ", ");
				}
				valor.deleteCharAt(valor.lastIndexOf(","));
			}			
		}		
		return valor.toString();
	}
	
	public String getRendicionGastos(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = ((EntrevistaIndividual)entrevista).isRendicionGastos() ? SI : NO;
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).isRendicionGastos() ? SI : NO;
		}
		return valor;
	}
	
	public String getMotivoInasistencias(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = ((EntrevistaIndividual)entrevista).getMotivoInasistencia();
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getMotivoInasistencia();
		}
		return valor;
	}
	
	public String getMateriasFechasDiciembre(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getMateriasRendirDiciembre();
		}
		return valor;
	}
	
	public String getParticipoRA(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getEntrevistaGrupal() == null){
			valor = entrevista.isParticipoRA()? SI : NO;
		}
		return valor;
	}
	
	public String getEntrevistaReprogramada(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL)){
			valor = entrevista.getEntrevistaReprogramada() != null ? 
					entrevista.getEntrevistaReprogramada().getValor() : "";
		}
		return valor;
	}
	
	public String getFechaIncorporacionPBE(EntrevistaIndividual entrevista) {
		return entrevista.getPerfilAlumno().getFechaPBE() != null ? 
				Formateador.formatearFecha(entrevista.getPerfilAlumno().getFechaPBE(), PATRON_FECHA) :
					"";
	}
	
	public String getFechaReIncorporacionPBE(EntrevistaIndividual entrevista) {
		return entrevista.getPerfilAlumno().getFechaReincorporacionPBE() != null ? 
				Formateador.formatearFecha(entrevista.getPerfilAlumno().getFechaReincorporacionPBE(), PATRON_FECHA) :
					NO_APLICA;
	}
	
	public String getPropositoAnioComienzaList(EntrevistaIndividual entrevista) {
		StringBuffer valor = new StringBuffer(NO_APLICA);
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){ 
			EntrevistaRenovacion er = (EntrevistaRenovacion)entrevista;
			if(er.getEvaluacionRenovacionMergeada() != null){
					if(er.getEvaluacionRenovacionMergeada().equals(EvaluacionRenovacionMergeada.RENUEVA)){
					valor = new StringBuffer();
					EntrevistaRenovacion entrevistaRenovacion = (EntrevistaRenovacion)entrevista;
					if(!entrevistaRenovacion.getPropositoAnioComienzaList().isEmpty()){
						for (PropositoAnioComienza proposito : entrevistaRenovacion.getPropositoAnioComienzaList()) {
							valor.append( proposito.getValor() + ", ");
						}
						valor.deleteCharAt(valor.lastIndexOf(","));
					}
				}
			}
			else{
				valor = new StringBuffer("");
			}
		}
		return valor.toString();
	}
	
	public String getIncorporacion(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			valor = ((EntrevistaReIncorporacion)entrevista).getIncorporacion() != null ? 
					((EntrevistaReIncorporacion)entrevista).getIncorporacion().getValor()
					: "";
		}
		return valor;
	}
	
	public String getSituacionEscolarDiciembre(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getSituacionEscolarDiciembre() != null ?
					((EntrevistaRenovacion)entrevista).getSituacionEscolarDiciembre().getValor()
					: "";
		}
		return valor;
	}
	
	
	public String getSituacionRenovacionDiciembre(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getEvaluacionRenovacionFinal() != null ?
					((EntrevistaRenovacion)entrevista).getEvaluacionRenovacionFinal().getValor() :
						"";
		}
		return valor;
	}


	public String getSituacionEscolar(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getSituacionEscolarMergeada() != null ?
							((EntrevistaRenovacion)entrevista).getSituacionEscolarMergeada().getValor():
								"";
		}
		return valor;
	}


	public String getSituacionRenovacion(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getEvaluacionRenovacionMergeada() != null ? 
					((EntrevistaRenovacion)entrevista).getEvaluacionRenovacionMergeada().getValor() :
						"";
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)){
			valor = ((EntrevistaFinal)entrevista).getEvaluacionRenovacionFinal() != null ?
					((EntrevistaFinal)entrevista).getEvaluacionRenovacionFinal().getValor() :
						"";
		}
		return valor;
	}
	
	public String getRealizoEntrevista(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			if(((EntrevistaRenovacion)entrevista).getEvaluacionRenovacionMergeada() != null && 
					((EntrevistaRenovacion)entrevista).getEvaluacionRenovacionMergeada() != EvaluacionRenovacionMergeada.RENUEVA)
			valor = (((EntrevistaRenovacion)entrevista).isRealizoEntrevista()? SI : NO);
		}else if(entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)){
			if(((EntrevistaReIncorporacion)entrevista).getIncorporacion() != null && 
					((EntrevistaReIncorporacion)entrevista).getIncorporacion() != EvaluacionIncorporacion.INCORPORA)
			valor = (((EntrevistaReIncorporacion)entrevista).isRealizoEntrevista()? SI : NO);
		}
		return valor;
	}
	
	public String getObservacionesMateriasExamenes(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)){
			valor = ((EntrevistaRenovacion)entrevista).getObservacionMateriasExamenes();
		}
		return valor;
	}
	
	public String getEvolucionMesAnterior(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) 
				&& ((EntrevistaIndividual)entrevista).getEvolucionMesAnterior() != null){
			valor = ((EntrevistaIndividual)entrevista).getEvolucionMesAnterior();
		}
		return valor;
	}
	
	public String getLogros(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) 
				&& ((EntrevistaIndividual)entrevista).getLogros() != null){
			valor = ((EntrevistaIndividual)entrevista).getLogros();
		}
		return valor;
	}
	
	public String getDificultades(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) 
				&& ((EntrevistaIndividual)entrevista).getDificultades() != null){
			valor = ((EntrevistaIndividual)entrevista).getDificultades();
		}
		return valor;
	}
	
	public String getProposito(EntrevistaIndividual entrevista) {
		String valor = NO_APLICA;
		if(entrevista.getTipoEntrevista().equals(TipoEntrevista.MENSUAL) 
				&& ((EntrevistaIndividual)entrevista).getProposito() != null){
			valor = ((EntrevistaIndividual)entrevista).getProposito();
		}
		return valor;
	}
}