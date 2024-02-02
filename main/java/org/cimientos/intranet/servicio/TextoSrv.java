package org.cimientos.intranet.servicio;

import java.util.Date;
import java.util.List;

import org.cimientos.intranet.dao.TextoDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Texto;
import org.displaytag.properties.SortOrderEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cimientos.intranet.enumerativos.entrevista.MotivoNoRenovacion;
import com.cimientos.intranet.enumerativos.entrevista.MotivoPendiente;

@Service
@Transactional
public class TextoSrv {
	
	@Autowired
	private TextoDao dao;
	
	public void guardarTexto(Texto texto){
		dao.guardar(texto);
		dao.flush();
	}
	
	public Texto obtenerTextoPorId(Long idTexto){
		return dao.obtenerTextoPorId(idTexto);
	}
	
	public Texto obtenerTextoPorCicloTipoInfTipoMailYMotivo(CicloPrograma ciclo, String tipoInforme, String tipoMail, 
			MotivoPendiente motivoPendiente, MotivoNoRenovacion motivoNoRenovacion){
		return dao.obtenerTextoPorCicloYTipo(ciclo, tipoInforme, tipoMail, motivoPendiente, motivoNoRenovacion);
	}
	
	public String obtenerTituloPorCicloTipoInfYTipoMail(CicloPrograma ciclo, String tipoInforme, String tipoMail){
		return dao.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, tipoInforme, tipoMail);
	}
	
	public int obtenerCantidadTextosMailAReportar(List<Long> ciclo, List<String> tipoInforme, List<String> tipoMail, 
			List<Integer> idsMotivoNoRenovacion, List<Integer> idsMotivoPendiente, String nombreUsuario, Date fechaDesde, Date fechaHasta ){			
		return dao.obtenerCantidadTextosMailAReportar(ciclo, tipoInforme, tipoMail, idsMotivoNoRenovacion, idsMotivoPendiente,
				nombreUsuario, fechaDesde, fechaHasta);
	}
	
	public List<Texto> obtenerTextosMailAReportar(List<Long> ciclo, List<String> tipoInforme, List<String> tipoMail,
			List<Integer> idsMotivoNoRenovacion, List<Integer> idsMotivoPendiente, String nombreUsuario, Date fechaDesde, Date fechaHasta, 
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion){		
		return dao.obtenerTextosMailAReportar(ciclo,tipoInforme, tipoMail, idsMotivoNoRenovacion, idsMotivoPendiente,
				nombreUsuario, fechaDesde, fechaHasta, firstResult, maxResults, sortDirection, sortCriterion);	
	}
	

}
