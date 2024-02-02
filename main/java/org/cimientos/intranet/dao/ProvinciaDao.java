package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.ubicacion.Provincia;

public interface ProvinciaDao extends Dao<Provincia>{

	public Provincia obtenerPorDescripcion(String descripcion);
	
	public Provincia obtenerProvinciaSiExiste(String descripcion, String id);

	public List<Provincia> obtenerProvinciasTexto(String texto);
}
