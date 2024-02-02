package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.BancoDao;
import org.cimientos.intranet.modelo.banco.Banco;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BancoSrv {

	@Autowired
	private BancoDao dao;

	/**
	 * Persiste un Banco en la base de datos.
	 * 
	 * @param Banco
	 */
	public void agregarBanco(Banco banco) {
		dao.guardar(banco);
		dao.flush();
	}

	/**
	 * Elimina un Banco de la base de datos.
	 * 
	 * @param Banco
	 */
	public void eliminarBanco(Banco banco) {
		dao.eliminar(banco);
		dao.flush();
	}

	/**
	 * Recupera un Banco por id de la base de datos.
	 * 
	 * @param id
	 * @return Banco
	 */
	public Banco obtenerBanco(long id) {
		return dao.obtener(id);
	}

	public Banco devolverBancoPorNombre(String nombre){		
		return dao.obtenerPorNombre(nombre);		
	} 
		
	/**
	 * Recupera todos los Bancos persistidos.
	 * 
	 * @return una Lista de Bancos que representa a todos los objetos persistidos.
	 */
	public List<Banco> obtenerTodos() {
		return dao.obtenerTodos();
	}
	
	public boolean obtenerPorNombre(String nombre){
		Banco banco = dao.obtenerPorNombre(nombre);
		return banco != null;
	}
	
	
	/**
	 * retorna true si existe y false en caso contrario
	 * @param descripcion
	 * @param id
	 * @return
	 */
	public boolean buscarBancoPorNombre(String nombre, String id){
		Banco bancoExiste =  dao.obtenerBancoSiExiste(nombre, id);
		return bancoExiste != null; 
	}

	/**
	 * @return
	 */
	public List<Banco> obtenerBancosParaSolicitudCuentas() {
		List<Banco> bancos = dao.obtenerTodos();
		Banco industrial = dao.obtenerPorNombre("Industrial");
		if(bancos.contains(industrial)){
			bancos.remove(industrial);
		}
		return bancos;
	}

	public List<Banco> obtenerBancosPorNombre(String texto){
		return dao.obtenerBancosPorNombre(texto);
	}
}
