package org.cimientos.intranet.utils.informe;



import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.cimientos.intranet.servicio.InformeSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.web.servlet.view.document.AbstractExcelView;



import com.cimientos.intranet.dto.MateriaDTO;
import com.cimientos.intranet.dto.ReporteInformeICDTO;
import com.cimientos.intranet.enumerativos.AnioEscolar;

public class ICExcelView extends AbstractExcelView{
	
	private static int bachSize = 1000;
	private static final String NO_APLICA = "No aplica";	
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String,Object> model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		InformeSrv informeSrv = (InformeSrv) model.get("informeSrv");
		
		
		HSSFSheet sheet = workbook.getSheet("IC");
		
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
		
		List<ReporteInformeICDTO> informes = null;
		int rowNum = 2;
		int parcial = 0;
		int inicial = 0;
		HSSFRow row;
		while (parcial < totalRows) {
			parcial = parcial + bachSize;
			
			informes = informeSrv.obtenerInformesICAReportar(idsCiclo, tipoId, tipoInformeId, estadoId, padrinoId, zonaId, nombreAlumno, 
					idEa, idRR, anioEscolar, dFechaDesde, dFechaHasta, inicial, bachSize,null, null,eae);
		
			if(sheet != null){
				for (ReporteInformeICDTO ic : informes) {
					row = sheet.createRow(rowNum++);
					crearFila(ic, row);
				}		
			}
			inicial = parcial;
			informes = null;
		}	
	}

	private void crearFila(ReporteInformeICDTO ic, HSSFRow row) {		
		
		row.createCell(0).setCellValue(ic.getId());
		row.createCell(1).setCellValue(ic.getTipoInforme() +" - " + ic.getCicloActual());
		row.createCell(2).setCellValue(ic.getEstadoInforme());
		if (ic.getEstadoInforme() != "Enviado"){
			row.createCell(3).setCellValue(ic.getFechaUltimaModificacion());
		}else{
			row.createCell(3).setCellValue(ic.getFechaEnvio());
		}		
		row.createCell(3).setCellValue(ic.getFechaUltimoCambioEstado());
		row.createCell(4).setCellValue(ic.getFechaEnvio());
		row.createCell(5).setCellValue(ic.getTipoPadrino());
		row.createCell(6).setCellValue(ic.getPadrino());
		if (ic.getNroCtesPlataformaContable()==0){
			row.createCell(7).setCellValue("-");
		}else{
			row.createCell(7).setCellValue(ic.getNroCtesPlataformaContable());
		}
		
		row.createCell(8).setCellValue(ic.getContacto());
		row.createCell(9).setCellValue(ic.getMail());
		row.createCell(10).setCellValue(ic.getIdAlumno());
		row.createCell(11).setCellValue(ic.getApellidoAlumno() +" " + ic.getNombreAlumno());
		row.createCell(12).setCellValue(ic.getDni());		
		row.createCell(13).setCellValue(ic.getFechaNacimiento());	
		row.createCell(14).setCellValue(ic.getEdad());		
		row.createCell(15).setCellValue(ic.getLocalidad());	
		row.createCell(16).setCellValue(ic.getAnioEscolar());
		row.createCell(17).setCellValue(ic.getAnioAdicional());
		row.createCell(18).setCellValue(ic.getEscuelaNombre());
		row.createCell(19).setCellValue(ic.getEscuelaLocalidad());
		row.createCell(20).setCellValue(ic.getResponsable() + "-" + ic.getVinculo());
		row.createCell(21).setCellValue(getFechaReIncorporacionPBE(ic));
		row.createCell(22).setCellValue(ic.getFechaPBE());
		row.createCell(23).setCellValue(ic.getRr());
		row.createCell(24).setCellValue(ic.getEa());		
		row.createCell(25).setCellValue(ic.getMesCesacion());
		row.createCell(26).setCellValue(ic.getMotivoCesacion());		
		row.createCell(27).setCellValue(ic.getComentariosCesacion());
		row.createCell(28).setCellValue(ic.getSuspensionesDeBeca());
		row.createCell(29).setCellValue(ic.getDestinoDineroBeca());	
		row.createCell(30).setCellValue(ic.getObservacionesGenerales());
		row.createCell(31).setCellValue(ic.getCompromisoAlumnoEscolaridad());
		row.createCell(32).setCellValue(ic.getEsfuerzo());
		row.createCell(33).setCellValue(ic.getConducta());
		row.createCell(34).setCellValue(ic.getCompromisoRAEscolaridad());
		row.createCell(35).setCellValue(ic.getAsistioBecadoEntrevista());
		row.createCell(36).setCellValue(ic.getPresentacionMaterial());
		row.createCell(37).setCellValue(ic.getCompromisoAlumnoPrograma());
		row.createCell(38).setCellValue(ic.getAsistenciaRAEntrevista());
		row.createCell(39).setCellValue(ic.getCompromisoRAPrograma());
		
		row.createCell(93).setCellValue(ic.getEae());
		
		// boletin !!!!
		
				String notaFin="";
				String notaDic="";
				String notaMar="";
				String notaFDM="";

				String nota1="";
				String nota2="";
				String nota3="";
				String nota123="";
				
				for (MateriaDTO materia: ic.getMateriasDto()) {	

				
					
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
							row.createCell(41).setCellValue(nota123);
							row.createCell(61).setCellValue(notaFDM);
						}
						
						if(materia.getNombre().equals("Biología")){
							row.createCell(42).setCellValue(nota123);
							row.createCell(62).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Ciencias Naturales")){
							row.createCell(43).setCellValue(nota123);
							row.createCell(63).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Ciencias Sociales")){
							row.createCell(44).setCellValue(nota123);
							row.createCell(64).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Informática")){
							row.createCell(45).setCellValue(nota123);
							row.createCell(65).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Construcción de ciudadanía / Educación cívica")){
							row.createCell(46).setCellValue(nota123);
							row.createCell(66).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Contabilidad / Educación práctica contable")){
							row.createCell(47).setCellValue(nota123);
							row.createCell(67).setCellValue(notaFDM);
						}		
						if(materia.getNombre().equals("Educación física / corporal")){
							row.createCell(48).setCellValue(nota123);
							row.createCell(68).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Física")){
							row.createCell(49).setCellValue(nota123);
							row.createCell(69).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Físico-química")){
							row.createCell(50).setCellValue(nota123);
							row.createCell(70).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Geografía")){
							row.createCell(51).setCellValue(nota123);
							row.createCell(71).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Historia")){
							row.createCell(52).setCellValue(nota123);
							row.createCell(72).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Inglés")){
							row.createCell(53).setCellValue(nota123);
							row.createCell(73).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Lengua / Literatura")){
							row.createCell(54).setCellValue(nota123);
							row.createCell(74).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Matemática")){
							row.createCell(55).setCellValue(nota123);
							row.createCell(75).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Música")){
							row.createCell(56).setCellValue(nota123);
							row.createCell(76).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Pasantía / Práctica profesional")){
							row.createCell(57).setCellValue(nota123);
							row.createCell(77).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Química")){
							row.createCell(58).setCellValue(nota123);
							row.createCell(78).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Salud y Adolescencia")){
							row.createCell(59).setCellValue(nota123);
							row.createCell(79).setCellValue(notaFDM);
						}
						if(materia.getNombre().equals("Tecnología / TIC")){
							row.createCell(60).setCellValue(nota123);
							row.createCell(80).setCellValue(notaFDM);
						}
						
				}
				if (ic.getConductaB() != null){
					row.createCell(81).setCellValue(ic.getConductaB());
				}
				
				if (ic.getDiasHabiles()!=null){
					row.createCell(82).setCellValue(ic.getDiasHabiles());
				}
				if (ic.getDiasHabilesFinales() !=null){
					row.createCell(83).setCellValue(ic.getDiasHabilesFinales());
				}
				if (ic.getInasistencias() !=null){
					row.createCell(84).setCellValue(ic.getInasistencias());
				}
				if (ic.getInasistencasFinales() !=null){
					row.createCell(85).setCellValue(ic.getInasistencasFinales());
				}
				
				
		// previas
				
				String previa1="";
				String previa2="";
				String previa3="";
				String notaD="";
				String notaM="";
				String notaJ="";
				
				
				
				int contador=0;
				
				// previas
				
				
				for (MateriaDTO materiaP: ic.getPreviasDTO()) {	
					
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
						row.createCell(86).setCellValue(previa1);
					}
					if (contador==1){
						//ciclo2=materiaP.getCiclo();
						previa2=materiaP.getNombre() + ", " +materiaP.getCiclo()+", "+ notaJ + ", "+ notaD +", "+ notaM;
						row.createCell(87).setCellValue(previa2);
					}
					if (contador==2){
						//ciclo3=materiaP.getCiclo();
						previa3=materiaP.getNombre() + ", " +materiaP.getCiclo()+", "+ notaJ + ", "+ notaD +", "+ notaM;
						row.createCell(88).setCellValue(previa3);
					}
					contador++;
					
				}
				if(ic.getDatosEstimadosCheck()==true){
					row.createCell(89).setCellValue("Sí");
				}
				if(ic.getDatosEstimadosCheck()==false){
					row.createCell(89).setCellValue("No");
				}
				
				row.createCell(90).setCellValue(ic.getMateriasAprobadas());
				row.createCell(91).setCellValue(ic.getMateriasDesaprobadas());
				
				if (ic.getInasistencias2()==0){
					row.createCell(92).setCellValue("");
				}
				else{
					row.createCell(92).setCellValue(ic.getInasistencias2());
				}
	}
	
	public String getFechaReIncorporacionPBE(ReporteInformeICDTO ic) {
		return StringUtils.isNotBlank(ic.getFechaReincorporacionPBE()) ? 
				ic.getFechaReincorporacionPBE(): NO_APLICA;
	}
}