package org.cimientos.intranet.commons;

import org.displaytag.decorator.TableDecorator;

import com.cimientos.intranet.dto.ReporteInformeDTO;

public class ReporteDecorator extends TableDecorator{

	public String getAcciones() 
	{
		
		ReporteInformeDTO reporteDto = (ReporteInformeDTO)getCurrentRowObject();
		
		String acciones = ("<div  style=\"width:0.5cm\" class=\"ui-state-default ui-corner-all\">" + 
				"<a  onclick=\"enviarForm('verInforme',\'" + reporteDto.getId() + "\')\" title=\"Informe\">" +  
		"<span class=\"ui-icon ui-icon-zoomin\" title=\"Ver Informe\"></span></a></div>");
		return acciones;
	}
}
