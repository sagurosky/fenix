package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.servicio.SucursalBancoSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/sucursalBanco/*")
public class SucursalBancoController extends BaseController{


	@Autowired
	private SucursalBancoSrv srvSucursalBanco;
	
	@Autowired
	private ZonaCimientosSrv zonaSrv;
	
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/sucursalBanco/registrarSucursalBancoView.do")
	public ModelAndView agregarSucursalBanco() {
		
		SucursalBanco sucursalBanco = new SucursalBanco();
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("sucursalBanco", sucursalBanco);
		return forward("/sucursalBanco/registrarSucursalBancoView", resul);
	}
	/**
	 * 
	 * @param sucursalBanco
	 * @return 
	 *  
	 */
	@RequestMapping("/sucursalBanco/registrarSucursalBanco.do")
	public ModelAndView guardarSucursalBanco( 
			@RequestParam("direccion") String direccion,	
			@RequestParam("numeroSucursal") String numeroSucursal,
			@RequestParam("nombreContacto") String nombreContacto,
			@RequestParam("idZona") Long idZona,
			@RequestParam("nombre") String nombre,
			@RequestParam("telContacto") String telContacto){
		
			Map<String, Object> resul = new HashMap<String, Object>();
			
			SucursalBanco sucursalBanco = new SucursalBanco();	
			ZonaCimientos zona = zonaSrv.obtenerZonaCimientos(idZona);
			sucursalBanco.setDireccion(direccion);
			sucursalBanco.setNumeroSucursal(numeroSucursal);
			sucursalBanco.setNombreContacto(nombreContacto);
			sucursalBanco.setTelContacto(telContacto);
			sucursalBanco.setNombre(nombre);
			sucursalBanco.setZona(zona);
			sucursalBanco.setActivo(true);
			
			if(srvSucursalBanco.comprobarExistencia(sucursalBanco)){
				resul.put("error", "Ya existe una sucursal para esa ubicación");
				resul.put("sucursal", sucursalBanco);
				return forward("/sucursalBanco/registrarSucursalBancoView", resul);
			}
			
			srvSucursalBanco.agregarSucursalBanco(sucursalBanco);		
			
			resul.put("mensaje", "Se ingresado satisfactoriamente la Sucursal: " +	sucursalBanco.getNombre());
			resul.put("sucursalesBanco", srvSucursalBanco.obtenerTodos());
	
			return forward("/sucursalBanco/listaSucursalBanco", resul);
			}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/sucursalBanco/modificarSucursalBancoView.do")
	public ModelAndView modificar(@RequestParam("id") long id) 
	{
		SucursalBanco sucursalBanco = srvSucursalBanco.obtenerSucursalBanco(id);
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("sucursalBanco",sucursalBanco);
				
		return forward("/sucursalBanco/modificarSucursalBancoView", resul);
	}

/**
 * 	
 * @param nombre
 * @param id
 * @return
 */
	@RequestMapping("/sucursalBanco/modificarSucursalBanco.do")
	public ModelAndView modificarSucursalBanco(
			@RequestParam("direccion") String direccion,	
			@RequestParam("numeroSucursal") String numeroSucursal,
			@RequestParam("nombreContacto") String nombreContacto,
			@RequestParam("idZona") Long idZona,
			@RequestParam("nombre") String nombre,
			@RequestParam("telContacto") String telContacto,
			@RequestParam("id")long id) {
		
		SucursalBanco sucursalBanco = srvSucursalBanco.obtenerSucursalBanco(id);
		ZonaCimientos zona = zonaSrv.obtenerZonaCimientos(idZona);
		sucursalBanco.setDireccion(direccion);
		sucursalBanco.setNumeroSucursal(numeroSucursal);
		sucursalBanco.setNombreContacto(nombreContacto);
		sucursalBanco.setTelContacto(telContacto);
		sucursalBanco.setNombre(nombre);
		sucursalBanco.setZona(zona);
		
		Map<String, Object> resul = new HashMap<String, Object>();
		srvSucursalBanco.agregarSucursalBanco(sucursalBanco);		
		resul.put("sucursalesBanco", srvSucursalBanco.obtenerTodos());
		resul.put("mensaje", "Se han actualizado los datos de la Sucursal: " + sucursalBanco.getNombre());
				
		return forward("/sucursalBanco/listaSucursalBanco", resul);
	}
	

	/**
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/sucursalBanco/eliminarSucursalBanco.do")
	public ModelAndView eliminarBanco(@RequestParam("id") long id) {
		
		Map<String, Object> resul = new HashMap<String, Object>();
		SucursalBanco sucursalBanco = srvSucursalBanco.obtenerSucursalBanco(id);
		sucursalBanco.setActivo(false);
		
		srvSucursalBanco.agregarSucursalBanco(sucursalBanco);
		resul.put("sucursalesBanco", srvSucursalBanco.obtenerTodos());
		resul.put("mensaje", "La Sucursal " + sucursalBanco.getNumeroSucursal()+ " ha sido eliminada");
		return forward("/sucursalBanco/listaSucursalBanco", resul);
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/sucursalBanco/listaSucursalBanco.do")
	public ModelAndView listaSucursalBanco() {
				
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("sucursalesBanco", srvSucursalBanco.obtenerTodos());

		return forward("/sucursalBanco/listaSucursalBanco", resul);
	}
	
}