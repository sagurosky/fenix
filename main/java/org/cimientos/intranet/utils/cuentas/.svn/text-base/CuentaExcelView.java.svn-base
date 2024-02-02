package org.cimientos.intranet.utils.cuentas;

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
import org.cimientos.intranet.modelo.EstadoCuenta;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;
import org.cimientos.intranet.servicio.AlumnoPanelEASrv;
import org.cimientos.intranet.servicio.ResponsableSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class CuentaExcelView extends AbstractExcelView{
	
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HSSFCell cell;
		ArchivoCuenta archivo = (ArchivoCuenta) model.get("archivo");
		HSSFSheet sheet = workbook.getSheet(archivo.getNombreHoja());
		if(sheet != null){
			int rowNum = 1;
			for (String[] fila : archivo.getDatos()) {
				HSSFRow row = sheet.getRow(rowNum++);
				for (int col = 0; col < fila.length; col++) {
					if(StringUtils.isNotBlank(fila[col])&& fila[col].charAt(0) == '0'){
						row.createCell(col).setCellValue(fila[col]);
					}else if(StringUtils.isNotBlank(fila[col])&& StringUtils.isNumeric(fila[col])){
						row.createCell(col).setCellValue(Long.parseLong( fila[col]));
					}else if(Formateador.isDouble(fila[col])){
						String formattedDouble = StringUtils.replaceChars(fila[col], ',', '.');
						Double valor = Double.parseDouble( formattedDouble);
						cell = row.createCell(col);
					    cell.setCellValue(valor);
					}else if(StringUtils.isNotBlank(fila[col])&& StringUtils.isAlphanumeric(fila[col])){
						row.createCell(col).setCellValue(fila[col]);
					}else {
						row.createCell(col).setCellValue(fila[col]);
					}
				}
			}
		
		}
		this.actualizarEstadoCuentas(model);
	}

	/**
	 * Si se genera exitosamente el excel se cambia el estado de las cuentas a en proceso.
	 * @param model
	 */
	private void actualizarEstadoCuentas(Map model) {
		ResponsableSrv srvResponsable = (ResponsableSrv) model.get("svrResponsable");
		AlumnoPanelEASrv panelEaSrv = (AlumnoPanelEASrv) model.get("panelEaSrv");
		List<ResponsableAdulto> responsables = (List<ResponsableAdulto>) model.get("responsables");
		
		for (ResponsableAdulto responsable : responsables) {
			responsable.setSolicitudCuenta(true);
			responsable.setFechaExportacion(new Date());
			responsable.setEstadoCuenta(EstadoCuenta.EN_PROCESO);
			srvResponsable.agregarResponsable(responsable);
			//cambios panel de control del ea
			AlumnoPanelEA panelEa = panelEaSrv.obtenerAlumnoPanelPorIdPerfilAlumno(responsable.getIdAlumno().getId());
			panelEa.actualizarCuenta(responsable.getEstadoCuenta());
			panelEaSrv.modificarAlumnoPanelEA(panelEa);
		}
	}	

}