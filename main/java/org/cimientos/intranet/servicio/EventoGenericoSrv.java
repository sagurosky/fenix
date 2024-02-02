package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.EventoGenericoDao;
import org.cimientos.intranet.modelo.evento.eventoGenerico.EventoGenerico;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author plabaronnie
 *
 */
@Service
@Transactional
public class EventoGenericoSrv {

	 @Autowired
	 EventoGenericoDao eventoGenericoDao;
	/**
	 * @param eventoGenerico
	 */
	public void guardarEvento(EventoGenerico eventoGenerico) {
		eventoGenericoDao.guardar(eventoGenerico);
		eventoGenericoDao.flush();
	}
	/**
	 * @return
	 */
	public List<EventoGenerico> getListaEventosGenericos() {
		return eventoGenericoDao.obtenerActivos();
	}
	/**
	 * @param idEvento
	 * @return
	 */
	public EventoGenerico getEventoGenerico(Long idEvento) {
		return eventoGenericoDao.obtener(idEvento);
	}
	/**
	 * @param ea
	 * @return
	 */
	public List<EventoGenerico> getListaEventosGenericosPorEA(PerfilEA ea) {
		return eventoGenericoDao.obtenerEventosGenericosPorEA(ea);
	}
	
	public List<EventoGenerico> getListaEventosGenericosPorRR(PerfilRR rr){
		return eventoGenericoDao.obtenerEventosGenericosPorRR(rr);
	}
	public List<EventoGenerico> getListaEventosGenericosTodos(){
		return eventoGenericoDao.obtenerEventosGenericosTodos();
	}

}
