package org.cimientos.intranet.dao;



import java.text.ParseException;
import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.usuario.Recordatorio;



public interface RecordatorioDao extends Dao<Recordatorio> {

	public List<Recordatorio> obtenerRecordatorios();
	

}
