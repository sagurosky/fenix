package org.cimientos.intranet.web.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.Parametro;
import org.cimientos.intranet.servicio.ParametroSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author msagarduy
 * Clase que se utiliza para  hacer la redireccion (mapeo) a las vistas.
 * Extiende de BaseController para incluir el Template
 */
@Controller
@RequestMapping("/parametro/*")
public class ParametroController extends BaseController{

	@Autowired
	private ParametroSrv srvParametro;
	
		
	/**
	 * Retorna la lista de parametros
	 * @return la vista a la lista de parametros
	 */
	@RequestMapping("/parametro/verParametrosView.do")
	public ModelAndView verParametrosView(){
		Map<String, Object> resul = new HashMap<String, Object>();

		resul.put("listado", srvParametro.obtenerTodos());

		return forward("/parametro/verParametros", resul);
	}
	
	/**
	 * Retorna la lista de parametros de acuerdo al tipo.
	 * Si el parametro recibido no se encuentra en la lista se envia un mensaje de error
	 * @param idParametro
	 * @return la vista de parametros dependiendo del tipo
	 */
	@RequestMapping("/parametro/verParametros.do")
	public ModelAndView verParametros(@RequestParam("idParametro") String idParametro){
		Map<String , Object> model = new HashMap<String , Object>();
		int id = Integer.parseInt(idParametro);
		List<Parametro> listado = new ArrayList<Parametro>();
		switch (id){
		case 1: listado = srvParametro.obtenerAreas();
				break;
		case 2: listado = srvParametro.obtenerPuestos();
				break;
		case 3: listado = srvParametro.obtenerMontosBeca();
				break;
		case 4: listado = srvParametro.obtenerAdicionales();
				break;
		case 5: listado = srvParametro.obtenerAdicionalesIngreso();
				break;
		case 6: listado = srvParametro.obtenerExtra();
				break;
		case 7: listado = srvParametro.obtenerMaterias();
				break;
		}
		List<Parametro> lista = new ArrayList<Parametro>();
		for (Parametro parametro : listado) {
			if(parametro.isActivo()){
				lista.add(parametro);
			}			
		}
		if(!(lista.size() > 0)){
			model.put("mensaje", "No existen parametros en esta categoría");
		}

		model.put("listado", lista);
		model.put("tipoParametro", idParametro);
		return forward("/parametro/verParametros", model);
	}
	
	/**
	 * Obtiene la lista de todos los parametros y recupera el parametro buscado
	 * @param idParametro
	 * @return la vista con los datos del parametro al cual se le actualizarán los datos.
	 */
	@RequestMapping("/parametro/modificarParametroView.do")
	public ModelAndView showModificarParametro(@RequestParam("idParametro") String idParametro){
		Map<String , Object> model = new HashMap<String , Object>();

		long id = Long.parseLong(idParametro);
		Parametro parametro = srvParametro.obtenerPorId(id);
		model.put("listado", srvParametro.obtenerTodos());
		model.put("parametro", parametro);

		return forward("/parametro/modificarParametroView", model);
	}
	
	
	/**
	 * Recupera el parametro buscado y actualiza sus datos.
	 * @param idParametro
	 * @param valor
	 * @return la vista del parametro buscado y actualiza sus datos.
	 */
	@RequestMapping("/parametro/modificarParametro.do")
	public ModelAndView modificarParametro(@RequestParam("idParametro") String idParametro,
										   @RequestParam("valor") String valor)
	{
		Map<String , Object> model = new HashMap<String , Object>();

		long id = Long.parseLong(idParametro);
		Parametro parametro = srvParametro.obtenerPorId(id);
		String anterior = parametro.getValor();
		if(srvParametro.buscarParametroPorValor(valor, String.valueOf(parametro.getId())))
		{

			model.put("error", "Ya existe un parametro con ese nombre");

			return forward("/parametro/modificarParametrosView", model);
		}
		parametro.setValor(valor);
		srvParametro.guardarParametro(parametro);
		model.put("listado", srvParametro.obtenerTodos());
		model.put("mensaje", "Se ha modificado el parametro " + anterior + " por " + valor);

		return forward("/parametro/verParametros", model);
	}
	
	
	/**
	 * Recupera el parametro buscado y setea su estado como inactivo.
	 * Retorna la lista de todos los parametros (activos e inactivos)
	 * @param idParametro
	 * @return la vista con la lista de todos los parametros (activos e inactivos)
	 */
	@RequestMapping("/parametro/darBajaParametro.do")
	public ModelAndView eliminarParametro(@RequestParam("idParametro") String idParametro)
	{
		Map<String , Object> model = new HashMap<String , Object>();

		long id = Long.parseLong(idParametro);
		Parametro parametro = srvParametro.obtenerPorId(id);
		srvParametro.desactivarParametro(parametro);
		model.put("mensaje", "Se ha dado de baja el parametro " + parametro.getValor());
		model.put("listado", srvParametro.obtenerTodos());

		return forward("/parametro/verParametros", model);
	}
	
	
	/**
	 * Recupera el tipo de parametro y retorna el formulario de alta.
	 * @param tipoParametro
	 * @return la vista con el formulario (de acuerdo al tipo de parametro correspondiente) de alta del parametro 
	 */
	@RequestMapping("/parametro/altaParametrosView.do")
	public ModelAndView altaParametrosView(@RequestParam("tipoParametro") String tipoParametro){
		Map<String , Object> model = new HashMap<String , Object>();

		if(tipoParametro.equalsIgnoreCase(""))
		{
			model.put("mensaje", "No se ha seleccionado ningún tipo de parametro");

			return forward("/parametro/verParametros", model);
		}
		model.put("listado", srvParametro.obtenerTodos());
		model.put("tipoParametro", tipoParametro);

		return forward("/parametro/altaParametrosView", model);
	}
	
	
	/**
	 * Recupera el tipo de parametro y lo persiste.
	 * En caso de ingresar un parametro existente se envia un mensaje de error.
	 * @param tipoParametro
	 * @param valor
	 * @return la vista del al formulario de parametro
	 */
	@RequestMapping("/parametro/altaParametro.do")
	public ModelAndView altaParametro(@RequestParam("tipoParametro") String tipoParametro,
			@RequestParam("valor") String valor){
		Map<String , Object> model = new HashMap<String , Object>();

		int tipo = Integer.parseInt(tipoParametro);
		Parametro parametro = new Parametro(tipo,valor);
		parametro.setActivo(true);
		if(srvParametro.buscarPorIgualValor(valor))
		{

			model.put("error", "Ya existe un parametro con ese nombre");
			model.put("tipoParametro", tipo);

			return forward("/parametro/altaParametrosView", model);
		}
		srvParametro.guardarParametro(parametro);
		model.put("listado", srvParametro.obtenerTodos());
		model.put("mensaje", "Se ha agregado el parametro " + valor);

		return forward("/parametro/verParametros",model);
	}
	
}