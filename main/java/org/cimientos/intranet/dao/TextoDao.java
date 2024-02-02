package org.cimientos.intranet.dao;

import java.util.Date;
import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Texto;
import org.displaytag.properties.SortOrderEnum;

import com.cimientos.intranet.enumerativos.entrevista.MotivoNoRenovacion;
import com.cimientos.intranet.enumerativos.entrevista.MotivoPendiente;

public interface TextoDao extends Dao<Texto> {
	
	public Texto obtenerTextoPorId(Long idTexto);
	
	public Texto obtenerTextoPorCicloYTipo(CicloPrograma ciclo, String tipoInforme, String tipoMail, MotivoPendiente motivoPendiente,
			MotivoNoRenovacion motivoNoRenovacion);
	
	public String obtenerTituloPorCicloTipoInfYTipoMail(CicloPrograma ciclo, String tipoInforme, String tipoMail);
	
	int obtenerCantidadTextosMailAReportar(List<Long> ciclo, List<String> tipoInforme, List<String> tipoMail, List<Integer> idsMotivoNoRenovacion,
			List<Integer> idsMotivoPendiente,String nombreUsuario, Date fechaDesde, Date fechaHasta);

	public List<Texto> obtenerTextosMailAReportar(List<Long> ciclo, List<String> tipoInforme, List<String> tipoMail, 
			List<Integer> idsMotivoNoRenovacion, List<Integer> idsMotivoPendiente,String nombreUsuario, Date fechaDesde, Date fechaHasta,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion);
}
