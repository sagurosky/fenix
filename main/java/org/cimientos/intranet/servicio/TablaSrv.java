package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.TablaDao;
import org.cimientos.intranet.dto.TablaDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TablaSrv {
	
	@Autowired
	private TablaDao dao;
	
	public List<TablaDTO> subtotalizar(String tabla, String campo){
		return dao.subtotalizar(tabla, campo);
	}
	
	
}
