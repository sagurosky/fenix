package org.cimientos.intranet.utils;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cimientos.intranet.enumerativos.Categoria;

/**
 * @author msagarduy
 * 
 */
@Service
public class CategoriaSrv {

	public List<Categoria> obtenerCategoriasDeZona() {
		return Categoria.getListaCategorias();
	}
}
