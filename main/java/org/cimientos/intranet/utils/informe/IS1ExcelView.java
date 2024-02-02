package org.cimientos.intranet.utils.informe;



import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.cimientos.intranet.dao.BoletinDao;
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.InformeIS1Srv;
import org.cimientos.intranet.servicio.InformeSrv;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.web.controller.MateriaPreviaDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.document.AbstractExcelView;




import com.cimientos.intranet.dto.MateriaDTO;
import com.cimientos.intranet.dto.ReporteInformeFPDTO;
import com.cimientos.intranet.dto.ReporteInformeIS1DTO;
import com.cimientos.intranet.enumerativos.AnioEscolar;

public class IS1ExcelView extends AbstractExcelView{
	
	private static int bachSize = 1000;
	
	
	
	String materia="";
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String,Object> model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		InformeSrv informeSrv = (InformeSrv) model.get("informeSrv");
		
		HSSFSheet sheet = workbook.getSheet("IS1");
		
		List<Long> idsCiclo = (List<Long>) model.get("cicloId");
		Integer tipoId = (Integer) model.get("idTipo"); 
		List<Integer> estadoId = (List<Integer>) model.get("estadoId");
		List<String> tipoInformeId = (List<String>) model.get("tipoInformeId");
		List<Number> padrinoId = (List<Number>) model.get("idPadrino");
		String padrino = (String) model.get("padrino");
		List<Number> zonaId = (List<Number>) model.get("idZona");
		String zona = (String) model.get("zona");
		String nombreAlumno = (String) model.get("nombreAlumno");
		String nombreEA = (String) model.get("ea");
		Long idEa = (Long) model.get("idEA");
		String nombreRR = (String) model.get("rr");
		String eae = (String) model.get("eae");
		Long idRR = (Long) model.get("idRR");
		AnioEscolar anioEscolar = (AnioEscolar) model.get("anioEscolar");	
		String fechaDesde = (String) model.get("fechaDesde");
		String fechaHasta = (String) model.get("fechaHasta");
		Date dFechaDesde = null;
		Date dFechaHasta = null;
		if (StringUtils.isNotBlank(fechaDesde))
			dFechaDesde = Formateador.parsearFecha(fechaDesde);

		if (StringUtils.isNotBlank(fechaHasta))
			dFechaHasta = Formateador.parsearFecha(fechaHasta);
	

		int totalRows = informeSrv.obtenerCantidadInformesAReportar(idsCiclo, tipoId, tipoInformeId, estadoId, padrinoId, zonaId, nombreAlumno, 
				idEa, idRR, anioEscolar, dFechaDesde, dFechaHasta,eae);
		
		List<ReporteInformeIS1DTO> informes = null;
		int rowNum = 2;
		int parcial = 0;
		int inicial = 0;
		HSSFRow row;
		while (parcial < totalRows) {
			parcial = parcial + bachSize;
			
			informes = informeSrv.obtenerInformesIS1AReportar(idsCiclo, tipoId, tipoInformeId, estadoId, padrinoId, zonaId, nombreAlumno, 
					idEa, idRR, anioEscolar, dFechaDesde, dFechaHasta, inicial, bachSize,null, null,eae);
		
			if(sheet != null){
				for (ReporteInformeIS1DTO is1 : informes) {
					row = sheet.createRow(rowNum++);
					crearFila(is1, row);
				}		
			}
			inicial = parcial;
			informes = null;
		}	
	}

	private void crearFila(ReporteInformeIS1DTO is1, HSSFRow row) {		
		
		row.createCell(0).setCellValue(is1.getId());
		row.createCell(1).setCellValue(is1.getTipoInforme()+" - "+ is1.getCicloActual());
		row.createCell(2).setCellValue(is1.getEstadoInforme());
		if (is1.getEstadoInforme() != "Enviado"){
			row.createCell(3).setCellValue(is1.getFechaUltimaModificacion());
		}else{
			row.createCell(3).setCellValue(is1.getFechaEnvio());
		}		
		row.createCell(3).setCellValue(is1.getFechaUltimoCambioEstado());
		row.createCell(4).setCellValue(is1.getFechaEnvio());
		row.createCell(5).setCellValue(is1.getTipoPadrino());
		row.createCell(6).setCellValue(is1.getPadrino());
		if (is1.getNroCtesPlataformaContable()==0){
			row.createCell(7).setCellValue("-");
		}else{
			row.createCell(7).setCellValue(is1.getNroCtesPlataformaContable());
		}
		row.createCell(8).setCellValue(is1.getContacto());
		row.createCell(9).setCellValue(is1.getMail());
		row.createCell(10).setCellValue(is1.getIdAlumno());
		row.createCell(11).setCellValue(is1.getApellidoAlumno() +" " + is1.getNombreAlumno());
		row.createCell(12).setCellValue(is1.getDni());		
		row.createCell(13).setCellValue(is1.getFechaNacimiento());	
		row.createCell(14).setCellValue(is1.getEdad());		
		row.createCell(15).setCellValue(is1.getLocalidad());	
		row.createCell(16).setCellValue(is1.getAnioEscolar());
		row.createCell(17).setCellValue(is1.getAnioAdicional());
		row.createCell(18).setCellValue(is1.getEscuelaNombre());
		row.createCell(19).setCellValue(is1.getEscuelaLocalidad());
		row.createCell(20).setCellValue(is1.getResponsable() + "-" + is1.getVinculo());
		row.createCell(21).setCellValue(is1.getFechaPBE());
		row.createCell(22).setCellValue(is1.getRr());
		row.createCell(23).setCellValue(is1.getEa());		
		row.createCell(24).setCellValue(is1.getPropositoAnioComienza());
		row.createCell(25).setCellValue(is1.getTiempoLibreGusta());
		
		////System.out.println(is1.getCicloActual());
		////System.out.println(is1.getAnioEscolar());
		////System.out.println(Long.parseLong(is1.getAnioEscolar().substring(0, 1)));
		////System.out.println(is1.getAnioAdicional());
		
		// calculo año posible de egreso
		long posibleAnioEgreso=0;
		long anioAdicional=0;
		if (is1.getAnioAdicional()=="No"){
			anioAdicional=1;
		}		
		if (is1.getAnioEscolar().equals("7º primaria")){
			posibleAnioEgreso=7-anioAdicional-1;
		}
		else{
			if (is1.getAnioEscolar().equals("-")){
				
			}
			else{
				posibleAnioEgreso=7-anioAdicional-Long.parseLong(is1.getAnioEscolar().substring(0, 1));
			}
			
		}
		posibleAnioEgreso=Long.parseLong( is1.getCicloActual())+posibleAnioEgreso;
		if(is1.getEae().equals("7/5")){
			posibleAnioEgreso--;
		}
		////System.out.println(posibleAnioEgreso);
		

		// boletin anterior !!!!
		
		String notaFin="";
		String notaDic="";
		String notaMar="";
		String notaFDM="";

		String nota1="";
		String nota2="";
		String nota3="";
		String nota123="";
		
		
		String previa1="";
		String previa2="";
		String previa3="";
		String notaD="";
		String notaM="";
		String notaJ="";
		
		
		
		int contador=0;
		
		// previas
		
		
		
		for (MateriaDTO materiaP: is1.getPreviasDTO()) {	
			
			if (materiaP.getNotaFin().equals(" ")){
				notaJ="-";
			}else {
				notaJ=materiaP.getNotaFin();
			}
			
			if (materiaP.getNotaDic().equals(" ")){
				notaD="-";
			}else{
				notaD=materiaP.getNotaDic();
			}						
				
			if (materiaP.getNotaMarzo().equals(" ")){
				notaM="-";
			}else{
				notaM=materiaP.getNotaMarzo();
			}
			
			if (contador==0){
				//ciclo1=materiaP.getCiclo();
				
				previa1=materiaP.getNombre() + ", " +materiaP.getCiclo()+", "+ notaJ + ", "+ notaD +", "+ notaM; 
				row.createCell(71).setCellValue(previa1);
			}
			if (contador==1){
				//ciclo2=materiaP.getCiclo();
				previa2=materiaP.getNombre() + ", " +materiaP.getCiclo()+", "+ notaJ + ", "+ notaD +", "+ notaM;
				row.createCell(72).setCellValue(previa2);
			}
			if (contador==2){
				//ciclo3=materiaP.getCiclo();
				previa3=materiaP.getNombre() + ", " +materiaP.getCiclo()+", "+ notaJ + ", "+ notaD +", "+ notaM;
				row.createCell(73).setCellValue(previa3);
			}
			contador++;
			
		}
		
		
		// boletin
		
		if(is1.getBoletinAnioAnterior() != null){
			////System.out.println(is1.getApellidoAlumno()+"-"+is1.getNombreAlumno()+"-" +is1.getId()+"-"+is1.getLocalidad()+"-"+is1.getBoletinAnioAnterior());
			for (MateriaDTO materia: is1.getMateriasDto()) {	
				if(materia.getNombre()!=null){
					
				
				////System.out.println(materia.getNombre()+"-"+materia.getNotaPrimero()+"-"+materia.getNotaSegundo()+"-"+materia.getNotaTercero()+"-"+materia.getNotaFin()+"-"+materia.getNotaDic()+"-"+materia.getNotaMarzo());
					nota1=materia.getNotaPrimero();
					nota2=materia.getNotaSegundo();
					nota3=materia.getNotaTercero();
				
					if (materia.getNotaPrimero().equals(" ")){
						nota1="-";
					}
					if (materia.getNotaSegundo().equals(" ")){
						nota2="-";
					}
					if (materia.getNotaTercero().equals(" ")){
						nota3="-";
					}
					
					nota123=nota1+","+nota2+","+nota3;
					
					notaFin=materia.getNotaFin();
					notaDic=materia.getNotaDic();
					notaMar=materia.getNotaMarzo();
	
					if (materia.getNotaFin().equals(" ")){
						notaFin="-";
					}
					if (materia.getNotaDic().equals(" ")){
						notaDic="-";
					}
					if (materia.getNotaMarzo().equals(" ")){
						notaMar="-";
					}
					
					
					notaFDM=notaFin+","+notaDic+","+notaMar;
					
					
					if(materia.getNombre().equals("Educación plástica-artística")){	
						row.createCell(26).setCellValue(nota123);
						row.createCell(46).setCellValue(notaFDM);
					}
					
					if(materia.getNombre().equals("Biología")){
						row.createCell(27).setCellValue(nota123);
						row.createCell(47).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Ciencias Naturales")){
						row.createCell(28).setCellValue(nota123);
						row.createCell(48).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Ciencias Sociales")){
						row.createCell(29).setCellValue(nota123);
						row.createCell(49).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Informática")){
						row.createCell(30).setCellValue(nota123);
						row.createCell(50).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Construcción de ciudadanía / Educación cívica")){
						row.createCell(31).setCellValue(nota123);
						row.createCell(51).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Contabilidad / Educación práctica contable")){
						row.createCell(32).setCellValue(nota123);
						row.createCell(52).setCellValue(notaFDM);
					}		
					if(materia.getNombre().equals("Educación física / corporal")){
						row.createCell(33).setCellValue(nota123);
						row.createCell(53).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Física")){
						row.createCell(34).setCellValue(nota123);
						row.createCell(54).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Físico-química")){
						row.createCell(35).setCellValue(nota123);
						row.createCell(55).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Geografía")){
						row.createCell(36).setCellValue(nota123);
						row.createCell(56).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Historia")){
						row.createCell(37).setCellValue(nota123);
						row.createCell(57).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Inglés")){
						row.createCell(38).setCellValue(nota123);
						row.createCell(58).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Lengua / Literatura")){
						row.createCell(39).setCellValue(nota123);
						row.createCell(59).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Matemática")){
						row.createCell(40).setCellValue(nota123);
						row.createCell(60).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Música")){
						row.createCell(41).setCellValue(nota123);
						row.createCell(61).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Pasantía / Práctica profesional")){
						row.createCell(42).setCellValue(nota123);
						row.createCell(62).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Química")){
						row.createCell(43).setCellValue(nota123);
						row.createCell(63).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Salud y Adolescencia")){
						row.createCell(44).setCellValue(nota123);
						row.createCell(64).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Tecnología / TIC")){
						row.createCell(45).setCellValue(nota123);
						row.createCell(65).setCellValue(notaFDM);
					}
				}	
			}
			
			row.createCell(66).setCellValue(is1.getConducta());
			row.createCell(67).setCellValue(is1.getDiasHabiles());
			row.createCell(68).setCellValue(is1.getDiasHabilesFinales());
			row.createCell(69).setCellValue(is1.getInasistencias());
			row.createCell(70).setCellValue(is1.getInasistencasFinales());
			
			
			
			
		}
		row.createCell(74).setCellValue(posibleAnioEgreso);
		row.createCell(75).setCellValue(is1.getEae());
		row.createCell(76).setCellValue(is1.getInfoEscuela());
		row.createCell(77).setCellValue(is1.getEspacioEscuela());
		row.createCell(78).setCellValue(is1.getProposito());
		row.createCell(79).setCellValue(is1.getHabiliaddes());
		row.createCell(80).setCellValue(is1.getObservacionesExcepcion());
		row.createCell(81).setCellValue(is1.getPropositoAnioComienza());
		
	}
	
	

	
	
}