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



import com.cimientos.intranet.dto.ReporteInformeFPDTO;
import com.cimientos.intranet.dto.ReporteInformeIS3DTO;
import com.cimientos.intranet.enumerativos.AnioEscolar;

public class IS3ExcelView extends AbstractExcelView{
	
	private static int bachSize = 1000;
	private static final String NO_APLICA = "No aplica";	
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String,Object> model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		InformeSrv informeSrv = (InformeSrv) model.get("informeSrv");
		
		HSSFSheet sheet = workbook.getSheet("IS3");
		
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
		String eae = (String) model.get("eae");
		Long idEa = (Long) model.get("idEA");
		String nombreRR = (String) model.get("rr");
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
				idEa, idRR, anioEscolar, dFechaDesde, dFechaHasta, eae);
		
		List<ReporteInformeIS3DTO> informes = null;
		int rowNum = 2;
		int parcial = 0;
		int inicial = 0;
		HSSFRow row;
		while (parcial < totalRows) {
			parcial = parcial + bachSize;
			
			informes = informeSrv.obtenerInformesIS3AReportar(idsCiclo, tipoId, tipoInformeId, estadoId, padrinoId, zonaId, nombreAlumno, 
					idEa, idRR, anioEscolar, dFechaDesde, dFechaHasta, inicial, bachSize,null, null, eae);
		
			if(sheet != null){
				for (ReporteInformeIS3DTO is3 : informes) {
					row = sheet.createRow(rowNum++);
					crearFila(is3, row);
				}		
			}
			inicial = parcial;
			informes = null;
		}	
	}

	private void crearFila(ReporteInformeIS3DTO is3, HSSFRow row) {		
		
		row.createCell(0).setCellValue(is3.getId());
		row.createCell(1).setCellValue(is3.getTipoInforme() +" - " + is3.getCicloActual());
		row.createCell(2).setCellValue(is3.getEstadoInforme());
		if (is3.getEstadoInforme() != "Enviado"){
			row.createCell(3).setCellValue(is3.getFechaUltimoCambioEstado());
		}else{
			row.createCell(3).setCellValue(is3.getFechaEnvio());
		}		
		row.createCell(3).setCellValue(is3.getFechaUltimaModificacion());
		row.createCell(4).setCellValue(is3.getFechaEnvio());
		row.createCell(5).setCellValue(is3.getTipoPadrino());
		row.createCell(6).setCellValue(is3.getPadrino());
		if (is3.getNroCtesPlataformaContable()==0){
			row.createCell(7).setCellValue("-");
		}else{
			row.createCell(7).setCellValue(is3.getNroCtesPlataformaContable());
		}
		row.createCell(8).setCellValue(is3.getContacto());
		row.createCell(9).setCellValue(is3.getMail());
		row.createCell(10).setCellValue(is3.getIdAlumno());
		row.createCell(11).setCellValue(is3.getApellidoAlumno() +" " + is3.getNombreAlumno());
		row.createCell(12).setCellValue(is3.getDni());		
		row.createCell(13).setCellValue(is3.getFechaNacimiento());	
		row.createCell(14).setCellValue(is3.getEdad());		
		row.createCell(15).setCellValue(is3.getLocalidad());	
		row.createCell(16).setCellValue(is3.getAnioEscolar());
		row.createCell(17).setCellValue(is3.getAnioAdicional());
		row.createCell(18).setCellValue(is3.getEscuelaNombre());
		row.createCell(19).setCellValue(is3.getEscuelaLocalidad());
		row.createCell(20).setCellValue(is3.getResponsable() + "-" + is3.getVinculo());
		row.createCell(21).setCellValue(is3.getFechaPBE());
		row.createCell(22).setCellValue(getFechaReIncorporacionPBE(is3));
		row.createCell(23).setCellValue(is3.getRr());
		row.createCell(24).setCellValue(is3.getEa());		
		row.createCell(25).setCellValue(is3.getAcompaniamientoTrabajamos());
		row.createCell(26).setCellValue(is3.getMateriasInteresan());		
		row.createCell(27).setCellValue(is3.getMateriasCuestan());
		row.createCell(28).setCellValue(is3.getCantidadMateriasDesaprobadas());
		row.createCell(29).setCellValue(is3.getCantidadInasistencia());	
		row.createCell(30).setCellValue(is3.getUtilizacionBeca());
		//row.createCell(29).setCellValue(is3.getCantidadSuspensiones());
		row.createCell(31).setCellValue(is3.getMesesSuspensiones());
		row.createCell(32).setCellValue(is3.getMotivosSuspension());		
		is3.setSituacionRenovacion("pedo");
		row.createCell(33).setCellValue(is3.getSituacionRenovacion());
		
		//DMS debug
		System.out.println("situacion renovacion celda 33.....: "+is3.getSituacionRenovacion()+"  ");
		System.out.println("resultado.....celda 34: "+is3.getResultadoAnoEscolar()+"  ");
		
		
		row.createCell(34).setCellValue(is3.getResultadoAnoEscolar());
		row.createCell(35).setCellValue(is3.getMotivoNoRenovacion());
		row.createCell(36).setCellValue(is3.getProyeccionAnoProximoFinPBE());
		row.createCell(37).setCellValue(is3.getQueridoPadrino());
		
		
		row.createCell(39).setCellValue(is3.getEae());
		
		// calculo año posible de egreso
		long posibleAnioEgreso=0;
		long anioAdicional=0;
		if (is3.getAnioAdicional()=="No"){
			anioAdicional=1;
		}
		
		if (is3.getAnioEscolar().substring(0, 1)!="-"){
			if (is3.getAnioEscolar().equals("7º primaria")){
				posibleAnioEgreso=7-anioAdicional-1;
			}else{
				posibleAnioEgreso=7-anioAdicional-Long.parseLong(is3.getAnioEscolar().substring(0, 1));
			}
			posibleAnioEgreso=Long.parseLong( is3.getCicloActual())+posibleAnioEgreso;
			if(is3.getEae().equals("7/5")){
				posibleAnioEgreso--;
			}
			row.createCell(38).setCellValue(posibleAnioEgreso);
		}else{
			posibleAnioEgreso=0;
			posibleAnioEgreso=Long.parseLong(is3.getCicloActual())+posibleAnioEgreso;
			if(is3.getEae().equals("7/5")){
				posibleAnioEgreso--;
			}
			row.createCell(38).setCellValue(posibleAnioEgreso);
		}
		
		
		
		
		if(is3.getSarpepe() !=null){
			row.createCell(41).setCellValue(is3.getSarpepe());
		}
		if(is3.getAcompaniamientoTrabajamos() !=null){
			row.createCell(42).setCellValue(is3.getAcompaniamientoTrabajamos());
		}
		
		if(is3.getHsTrabajarAnio() !=null){
			row.createCell(40).setCellValue(is3.getHsTrabajarAnio());
		}
		
		if(is3.getOsme()!=null){
			row.createCell(43).setCellValue(is3.getOsme());
		}
		
		if(is3.getAlo()!=null){
			row.createCell(44).setCellValue(is3.getAlo());
		}
		
		
		
		
		if(is3.getTarang()!=null){
			row.createCell(45).setCellValue(is3.getTarang());
		}
		
		if(is3.getPaa()!=null){
			row.createCell(46).setCellValue(is3.getPaa());
		}
		
		
		if(is3.getVtepa()!=null){
			row.createCell(47).setCellValue(is3.getVtepa());
		}							
		if(is3.getVtepb()!=null){
			row.createCell(48).setCellValue(is3.getVtepb());
		}
		if(is3.getVtepc()!=null){
			row.createCell(49).setCellValue(is3.getVtepc());
		}
		if(is3.getVtepd()!=null){
			row.createCell(50).setCellValue(is3.getVtepd());
		}
		if(is3.getVtepe()!=null){
			row.createCell(51).setCellValue(is3.getVtepe());
		}
		if(is3.getVtepf()!=null){
			row.createCell(52).setCellValue(is3.getVtepf());
		}
		if(is3.getVtepg()!=null){
			row.createCell(53).setCellValue(is3.getVtepg());
		}
		if(is3.getVteph()!=null){
			row.createCell(54).setCellValue(is3.getVteph());
		}
		if(is3.getVtepi()!=null){
			row.createCell(55).setCellValue(is3.getVtepi());
		}
		
		
		
		if(is3.getIatarni()!=null){
			row.createCell(56).setCellValue(is3.getIatarni());
		}
		
		if(is3.getMp()!=null){
			row.createCell(57).setCellValue(is3.getMp());
		}
		
		if(is3.getSus()!=null){
			row.createCell(58).setCellValue(is3.getSus());
		}
		
		if(is3.getIge()!=null){
			row.createCell(59).setCellValue(is3.getIge());
		}
		
		
		
		
		
	}
	
	public String getFechaReIncorporacionPBE(ReporteInformeIS3DTO is3) {
		return StringUtils.isNotBlank(is3.getFechaReincorporacionPBE()) ? 
				is3.getFechaReincorporacionPBE(): NO_APLICA;
	}	
}