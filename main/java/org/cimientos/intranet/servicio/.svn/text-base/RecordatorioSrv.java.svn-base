package org.cimientos.intranet.servicio;


import java.util.List;

import org.cimientos.intranet.dao.RecordatorioDao;
import org.cimientos.intranet.modelo.usuario.Recordatorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RecordatorioSrv {

	@Autowired
	private RecordatorioDao recordatorioDao;


	public void agregarRecordatorio(Recordatorio reco) {
		recordatorioDao.guardar(reco);
		recordatorioDao.flush();
	}


	public void eliminarRecordatorio(Recordatorio reco) {
		recordatorioDao.eliminar(reco);
		recordatorioDao.flush();
	}

	
	public Recordatorio obtenerRecordatorio(long id) {
		return recordatorioDao.obtener(id);
	}

	public List<Recordatorio> obtenerTodos() {
		return recordatorioDao.obtenerTodos();
	}
	
	public List<Recordatorio> obtenerListaRecordatorios(){
		return recordatorioDao.obtenerRecordatorios();
	}


	public void flush() {
		recordatorioDao.flush();
	}

}
