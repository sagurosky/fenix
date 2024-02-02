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
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.servicio.BoletinSrv;
import org.cimientos.intranet.servicio.InformeSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.web.servlet.view.document.AbstractExcelView;
import org.cimientos.intranet.dto.BoletinDTO;

import com.cimientos.intranet.dto.MateriaDTO;
import com.cimientos.intranet.dto.ReporteInformeIS2DTO;
import com.cimientos.intranet.enumerativos.AnioEscolar;

public class IS2ExcelView_2021 extends AbstractExcelView{
	
	private static int bachSize = 1000;
	private static final String NO_APLICA = "No aplica";
	
	String materia="";
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String,Object> model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		InformeSrv informeSrv = (InformeSrv) model.get("informeSrv");
		
		HSSFSheet sheet = workbook.getSheet("IS2");
		
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
		Long idRR = (Long) model.get("idRR");
		String eae = (String) model.get("eae");
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
		
		List<ReporteInformeIS2DTO> informes = null;
		int rowNum = 2;
		int parcial = 0;
		int inicial = 0;
		HSSFRow row;
		while (parcial < totalRows) {
			parcial = parcial + bachSize;
			
			informes = informeSrv.obtenerInformesIS2AReportar(idsCiclo, tipoId, tipoInformeId, estadoId, padrinoId, zonaId, nombreAlumno, 
					idEa, idRR, anioEscolar, dFechaDesde, dFechaHasta, inicial, bachSize,null, null,eae);
		
			if(sheet != null){
				for (ReporteInformeIS2DTO is2 : informes) {
					row = sheet.createRow(rowNum++);
					crearFila(is2, row);
				}		
			}
			inicial = parcial;
			informes = null;
		}	
	}

	private void crearFila(ReporteInformeIS2DTO is2, HSSFRow row) {		
		
		row.createCell(0).setCellValue(is2.getId());
		row.createCell(1).setCellValue(is2.getTipoInforme() +" - " + is2.getCicloActual());
		row.createCell(2).setCellValue(is2.getEstadoInforme());
		if (is2.getEstadoInforme() != "Enviado"){
			row.createCell(3).setCellValue(is2.getFechaUltimaModificacion());
		}else{
			row.createCell(3).setCellValue(is2.getFechaEnvio());
		}		
		row.createCell(3).setCellValue(is2.getFechaUltimoCambioEstado());
		row.createCell(4).setCellValue(is2.getFechaEnvio());
		row.createCell(5).setCellValue(is2.getTipoPadrino());
		row.createCell(6).setCellValue(is2.getPadrino());
		if (is2.getNroCtesPlataformaContable()==0){
			row.createCell(7).setCellValue("-");
		}else{
			row.createCell(7).setCellValue(is2.getNroCtesPlataformaContable());
		}
		row.createCell(8).setCellValue(is2.getContacto());
		row.createCell(9).setCellValue(is2.getMail());
		row.createCell(10).setCellValue(is2.getIdAlumno());
		row.createCell(11).setCellValue(is2.getApellidoAlumno() +" " + is2.getNombreAlumno());
		row.createCell(12).setCellValue(is2.getDni());		
		row.createCell(13).setCellValue(is2.getFechaNacimiento());	
		row.createCell(14).setCellValue(is2.getEdad());		
		row.createCell(15).setCellValue(is2.getLocalidad());	
		row.createCell(16).setCellValue(is2.getAnioEscolar());
		row.createCell(17).setCellValue(is2.getAnioAdicional());
		row.createCell(18).setCellValue(is2.getEscuelaNombre());
		row.createCell(19).setCellValue(is2.getEscuelaLocalidad());
		row.createCell(20).setCellValue(is2.getResponsable() + "-" + is2.getVinculo());
		row.createCell(21).setCellValue(is2.getFechaPBE());
		row.createCell(22).setCellValue(getFechaReIncorporacionPBE(is2));
		row.createCell(23).setCellValue(is2.getRr());
		row.createCell(24).setCellValue(is2.getEa());		
		row.createCell(25).setCellValue(is2.getModalidadTrabajoEscuela());
		row.createCell(26).setCellValue(is2.getProgramaImplemntacion());
		row.createCell(27).setCellValue(is2.getMatriculaTotalEscuela());
		if(is2.getBecadosCimientosEscuela() !=null){
			row.createCell(28).setCellValue(is2.getBecadosCimientosEscuela());
		}
		row.createCell(29).setCellValue(is2.getIndicadorRepitenciaEscuela());
		row.createCell(30).setCellValue(is2.getIndicadorAbandonoEscuela());
		row.createCell(31).setCellValue(is2.getPorcentajeInasistenciaEscuela());
		//row.createCell(32).setCellValue(is2.getAcompaniamientoTrabajamos());	
		row.createCell(32).setCellValue(is2.getMateriasInteresan());		
		row.createCell(33).setCellValue(is2.getMateriasCuestan());
		row.createCell(34).setCellValue(is2.getCantidadMateriasDesaprobadas());
		row.createCell(35).setCellValue(is2.getCantidadInasistencia());
		row.createCell(36).setCellValue(is2.getQueridoPadrino());
		
		
		// calculo año posible de egreso
		long posibleAnioEgreso=0;
		long anioAdicional=0;
		if (is2.getAnioEscolar().equals("-")){
			posibleAnioEgreso=Long.parseLong( is2.getCicloActual());
		}else{
			if (is2.getAnioAdicional()=="No"){
				anioAdicional=1;
			}
			if (is2.getAnioEscolar().equals("7º primaria")){
				posibleAnioEgreso=7-anioAdicional-1;
			}else{
				posibleAnioEgreso=7-anioAdicional-Long.parseLong(is2.getAnioEscolar().substring(0, 1));
			}
			posibleAnioEgreso=Long.parseLong( is2.getCicloActual())+posibleAnioEgreso;
			if(is2.getEae().equals("7/5")){
				posibleAnioEgreso--;
			}
			
		}
				
					
		row.createCell(37).setCellValue(posibleAnioEgreso);
		row.createCell(38).setCellValue(is2.getEae());
		
		if(is2.getAcompaniamientoTrabajamos() !=null){
			row.createCell(39).setCellValue(is2.getAcompaniamientoTrabajamos());
		}
		if(is2.getQtam() !=null){
			row.createCell(40).setCellValue(is2.getQtam());
		}
		if(is2.getOsme()!=null){
			row.createCell(41).setCellValue(is2.getOsme());
		}
		if(is2.getSarpepe() !=null){
			row.createCell(42).setCellValue(is2.getSarpepe());
		}
		if(is2.getHsTrabajarAnio() !=null){
			row.createCell(43).setCellValue(is2.getHsTrabajarAnio());
		}	
	
		if(is2.getPropositoAnual() !=null){
			row.createCell(44).setCellValue(is2.getPropositoAnual());
		}
		if(is2.getIamp() !=null){
			row.createCell(45).setCellValue(is2.getIamp());
		}
		
		
		//BoletinSrv bolis2=null;
		//if (is2.getBoletinActual()!=null){
		//	bolis2.obtenerPorId(is2.getBoletinActual());
		//}
		
		
		
		
		//if(is2.getBoletin()!=null){
		//	this.setBoletin(row, 
		//}
			
			
			
			
	}
	
	private HSSFRow setBoletin(HSSFRow row, BoletinDTO boletin){
		//materias del boletin
		String notaFin="";
		String notaDic="";
		String notaMar="";
		String notaFDM="";
		String nota1="";
		String nota2="";
		String nota3="";
		String nota123="";	
		
		for (MateriaDTO materia: boletin.getMateriasDto()) {						
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
				
				if(materia.getNombre() != null){
					if(materia.getNombre().equals("Cantidad total de materias en el boletín")){	
						row.createCell(44).setCellValue(nota123);
						//row.createCell(40).setCellValue(notaFDM);
					}				
					if(materia.getNombre().equals("Cantidad de materias aprobadas")){
						row.createCell(45).setCellValue(nota123);
						//row.createCell(41).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Cantidad de materias desaprobadas")){
						row.createCell(46).setCellValue(nota123);
						//row.createCell(42).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Calificación de Lengua/ Literatura")){
						row.createCell(47).setCellValue(nota123);
						//row.createCell(43).setCellValue(notaFDM);
					}
					if(materia.getNombre().equals("Calificación de Matemática")){
						row.createCell(48).setCellValue(nota123);
						//row.createCell(44).setCellValue(notaFDM);
					}
				}
				
		}
		if (boletin.getConductaB() != null){
			row.createCell(49).setCellValue(boletin.getConductaB());
		}
		
		if (boletin.getDiasHabiles() !=null){
			row.createCell(50).setCellValue(boletin.getDiasHabiles());
		}
		if (boletin.getDiasHabilesFinales() !=null){
			row.createCell(51).setCellValue(boletin.getDiasHabilesFinales());
		}
		if (boletin.getInasistencias() !=null){
			row.createCell(52).setCellValue(boletin.getInasistencias());
		}
		if (boletin.getInasistencasFinales() !=null){
			row.createCell(53).setCellValue(boletin.getInasistencasFinales());
		}		
		
		// materias previas		
		String previa1="";
		String previa2="";
		String previa3="";
		String notaD="";
		String notaM="";
		String notaJ="";		
		int contador=0;	
	
		for (MateriaDTO materiaP: boletin.getPreviasDTO()) {			
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
				previa1=materiaP.getNombre() + ", " +materiaP.getCiclo()+", "+ notaJ + ", "+ notaD +", "+ notaM; 
				row.createCell(54).setCellValue(previa1);
			}
			if (contador==1){
				previa2=materiaP.getNombre() + ", " +materiaP.getCiclo()+", "+ notaJ + ", "+ notaD +", "+ notaM;
				row.createCell(55).setCellValue(previa2);
			}
			if (contador==2){
				previa3=materiaP.getNombre() + ", " +materiaP.getCiclo()+", "+ notaJ + ", "+ notaD +", "+ notaM;
				row.createCell(56).setCellValue(previa3);
			}
			contador++;			
		}
		return row;
	}
	
	public String getFechaReIncorporacionPBE(ReporteInformeIS2DTO is2) {
		return StringUtils.isNotBlank(is2.getFechaReincorporacionPBE()) ? 
				is2.getFechaReincorporacionPBE(): NO_APLICA;
	}
}