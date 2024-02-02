package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;


public interface BancoDao extends  Dao<Banco> {
	
	public Banco obtenerPorNombre(String nombre);
	
	public Banco obtenerBancoSiExiste(String nombre, String id);

	public List<Banco> obtenerBancosPorNombre(String texto);
		
}



