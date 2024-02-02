package org.cimientos.intranet.utils.pagos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;
import org.cimientos.intranet.servicio.AlumnoPanelEASrv;
import org.cimientos.intranet.servicio.PagoSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.cimientos.intranet.enumerativos.EstadoPago;

public class FAPPagoExcelViewXGalicia extends AbstractExcelView{
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HSSFCell cell;
		HSSFRow row;
		ArchivoPago archivo = (ArchivoPago) model.get("archivo");
		HSSFSheet sheet = workbook.getSheet(archivo.getNombre());
		int rowNum = 2;
		for (String[] fila : archivo.getDatos()) {
			rowNum = rowNum + 1;
			row = sheet.getRow(rowNum);
			if(row == null)
			{
				row = sheet.createRow(rowNum);
			}
			
			for (int col = 0; col < fila.length; col++) {
					if (StringUtils.isNotBlank(fila[col])&& fila[col].charAt(0) == '0') {
						row.createCell(col).setCellValue(fila[col]);
					} else if (StringUtils.isNotBlank(fila[col])&& StringUtils.isNumeric(fila[col])) {
						row.createCell(col).setCellValue(Long.parseLong(fila[col]));
					} else if (Formateador.isDouble(fila[col])) {
						if (col==9){							
							
							String pp="";							
							pp=fila[col].replaceAll(",", "0");							
							Double pp1=0D;
							pp1=pp1.parseDouble(pp)/1000;
							//pp=pp.substring(0, pp.length()-3);
							//System.out.println(pp1);
							row.createCell(col).setCellValue(pp1);
						}else{
							String formattedDouble = StringUtils.replaceChars(fila[col], ',', '.');
							Double valor = Double.parseDouble(formattedDouble);
							cell = row.createCell(col);
							cell.setCellValue(valor);
						}
					} else if (StringUtils.isNotBlank(fila[col])&& StringUtils.isAlphanumeric(fila[col])) {
						row.createCell(col).setCellValue(fila[col]);
					} else {
						row.createCell(col).setCellValue(fila[col]);
					}
				}

		}
		this.actualizarEstadoPagos(model);
	}

	/**
	 * @param model
	 */
	private void actualizarEstadoPagos(Map model) {
		PagoSrv srvPago = (PagoSrv) model.get("srvPago");
		AlumnoPanelEASrv panelEaSrv = (AlumnoPanelEASrv) model.get("panelEaSrv");
		List<Pago> pagos = (List<Pago>) model.get("pagos");
		List<Long> idsAlumnos = new ArrayList<Long>();
		List<EstadoPago> estadosPagos = new ArrayList<EstadoPago>();
		for (Pago pago : pagos) {
			pago.setEstadoPago(EstadoPago.REALIZADO);
			Date fechaExportacion = Formateador.setearTimeACero(new Date());
			pago.setFechaExportacion(fechaExportacion);
			idsAlumnos.add(pago.getBecado().getId());
			estadosPagos.add(pago.getEstadoPago());
			//cambios panel de control del ea
			//AlumnoPanelEA panelEa = panelEaSrv.obtenerAlumnoPanelPorIdPerfilAlumno(pago.getBecado().getId());
			//panelEa.actualizarSemaforoPago(pago.getEstadoPago());
			//panelEaSrv.agregarAlumnoPanelEA(panelEa);
		}
		srvPago.guardarPagos(pagos);
		List<AlumnoPanelEA> alumnosPanelEa = panelEaSrv.obtenerAlumnosPorIds(idsAlumnos);
		for (int i = 0; i < alumnosPanelEa.size(); i++) 
		{
			alumnosPanelEa.get(i).actualizarSemaforoPago(estadosPagos.get(i));
		}
		panelEaSrv.modificarTodosAlumnosPanel(alumnosPanelEa);
		
		
	}	




}