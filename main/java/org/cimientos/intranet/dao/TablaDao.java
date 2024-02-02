package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dto.TablaDTO;

public interface TablaDao {

	public List<TablaDTO> subtotalizar(String tabla, String campo);
	
	
}
