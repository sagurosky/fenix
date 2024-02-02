package org.cimientos.intranet.servicio;


import java.util.List;

import org.cimientos.intranet.dao.ParametroDao;
import org.cimientos.intranet.modelo.Parametro;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author msagarduy
 * Clase utilizada para el manejo de la logica de negocios del objeto Parametro
 * 
 */
@Service
@Transactional
public class ParametroSrv {

	@Autowired
	ParametroDao dao;


	/**
	 * Retorna una lista de todas las �reas de la aplicacion
	 * 
	 * @return una lista con todos los parametros del tipo
	 */
	public List<Parametro> obtenerAreas() {
		return dao.obtenerParametroDelTipo(Parametro.AREA);
	}
	
	/**
	 * @param ids
	 * @return
	 */
	public List<Parametro> obtenerGrupo(List<Long> ids){
		return dao.obtenerGrupo("id", ids);
	}
	

	/**
	 * Retorna una lista de todos los puestos de la aplicacion
	 * 
	 * @return una lista con todos los parametros del tipo
	 */
	public List<Parametro> obtenerPuestos() {
		return dao.obtenerParametroDelTipo(Parametro.PUESTO);
	}


	
	
	/**
	 * @return
	 */
	public List<Parametro> obtenerMontosBeca() {
		return dao.obtenerParametroDelTipo(Parametro.MONTO_BECA);
	}
	
	
	/**
	 * @return
	 */
	public List<Parametro> obtenerAdicionales() {
		return dao.obtenerParametroDelTipo(Parametro.ADICIONAL);
	}
	
	
	/**
	 * @return
	 */
	public List<Parametro> obtenerAdicionalesIngreso() {
		return dao.obtenerParametroDelTipo(Parametro.ADICIONAL_INGRESO);
	}
	
	
	/**
	 * @return
	 */
	public List<Parametro> obtenerExtra() {
		return dao.obtenerParametroDelTipo(Parametro.EXTRA);
	}
	
	
	/**
	 * @return
	 */
	public List<Parametro> obtenerMaterias() {
		return dao.obtenerParametroDelTipo(Parametro.MATERIA);
	}
	
	/**
	 * Obtiene un dato a traves del Id
	 * 
	 * @return el parametro con ese Id. En caso de no existor retirn null.
	 */
	public Parametro obtenerPorId(long id) {
		return dao.obtener(id);
	}

	/**
	 * Persiste o actualiza un parametro en la DB
	 * @param parametro
	 */
	public void guardarParametro(Parametro parametro) {
		activarParametro(parametro);		
	}

	/**
	 * Setea el parametro como inactivo
	 * @param parametro
	 */
	public void desactivarParametro(Parametro parametro) {
		parametro.setActivo(false);
		dao.guardar(parametro);
		dao.flush();
	}

	/**
	 * Setea el parametro como activo
	 * @param parametro
	 */
	public void activarParametro(Parametro parametro) {
		parametro.setActivo(true);
		dao.guardar(parametro);
		dao.flush();
		
	}

	/**
	 * Retorna el id de un parametro en base al valor buscado
	 * @param valor
	 * @return
	 */
	public long obtenerId(String valor) {
		return dao.obtenerId(valor);
	}

	public Parametro obtener(Long id){
		return dao.obtener(id);
	}
	
	/**
	 * Retorna todos los parametros
	 * @return
	 */
	public List<Parametro> obtenerTodos(){
		return dao.obtenerTodos();
	}
	
	
	/**
	 * retorna true si el parametro buscado ya fue dado de alta y false en caso contrario
	 * @param valor
	 * @return
	 */
	public boolean buscarPorIgualValor(String valor){
		Parametro parametroExiste = dao.obtenerParametroPorIgualValor(valor);
		return parametroExiste != null; 
	}
	
	/**
	 * retorna true si existe y false en caso contrario
	 * @param valor
	 * @param id
	 * @return
	 */
	public boolean buscarParametroPorValor(String valor, String id){
		Parametro parametroExiste =  dao.obtenerParametroSiExiste(valor, id);
		return parametroExiste != null; 
	}	
	
}
