package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;
import org.cimientos.intranet.servicio.BancoSrv;
import org.cimientos.intranet.servicio.SucursalBancoSrv;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/banco/*")
public class BancoController extends BaseController{


	@Autowired
	private BancoSrv srvBanco;
	
	@Autowired
	private SucursalBancoSrv srvSucursalBanco;
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/banco/registrarBancoView.do")
	public ModelAndView agregarBanco() {
		
		Banco banco = new Banco();
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("banco", banco);
		resul.put("sucursales", srvSucursalBanco.obtenerSucursalesSinAsignar());
		return forward("/banco/registrarBancoView", resul);
	}
	/**
	 * 
	 * @param banco
	 * @return 
	 *  
	 */
	@RequestMapping("/banco/registrarBanco.do")
	public ModelAndView guardarBanco(@RequestParam("nombre") String nombre,
			@RequestParam("sucursal")Long sucursal){
		
		Banco banco = new Banco();
		Map<String, Object> model = new HashMap<String, Object>();
		SucursalBanco sucursalObj= new SucursalBanco();
		sucursalObj= srvSucursalBanco.obtenerSucursalBanco(sucursal);
		if (srvBanco.devolverBancoPorNombre(nombre)!= null){
			
			banco= srvBanco.devolverBancoPorNombre(nombre);
			banco.agregarSucursal(sucursalObj);
					
		}else{
			banco.setNombre(nombre);
			banco.setActivo(true);
			banco.agregarSucursal(sucursalObj);
			
		}
		sucursalObj.setBanco(banco);
		srvBanco.agregarBanco(banco);
		model.put("bancos", srvBanco.obtenerTodos());
		model.put("tipoBanco", true);				
		model.put("mensaje", "Se ingreso satisfactoriamente el banco: " + banco.getNombre());
				
		return forward("/banco/listaBancos", model);
		

	}

	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/banco/modificarBancoView.do")
	public ModelAndView modificar(@RequestParam("id") long id) 
	{
		Banco banco = srvBanco.obtenerBanco(id);
		Map<String, Object> resul = new HashMap<String, Object>();
		
		resul.put("banco",banco);
		return forward("/banco/modificarBancoView", resul);
	}

/**
 * 	
 * @param nombre
 * @param id
 * @return
 */
	@RequestMapping("/banco/modificarBanco.do")
	public ModelAndView modificarBanco(
				@RequestParam("nombre") String nombre,
				@RequestParam("id")long id) {
		
		Banco banco = srvBanco.obtenerBanco(id);
		
		banco.setNombre(nombre);
		
		Map<String, Object> resul = new HashMap<String, Object>();
		
		srvBanco.agregarBanco(banco);		
		resul.put("bancos", srvBanco.obtenerTodos());
		
		resul.put("mensaje", "Se han actualizado los datos del Banco: " + banco.getNombre());
				
		return forward("/banco/listaBancos", resul);
	}
	

	/**
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/banco/eliminarBanco.do")
	public ModelAndView eliminarBanco(@RequestParam("id") long id) {
		
		Map<String, Object> resul = new HashMap<String, Object>();
		
		Banco banco = srvBanco.obtenerBanco(id);
		banco.setActivo(false);
		srvBanco.agregarBanco(banco);
		resul.put("bancos", srvBanco.obtenerTodos());
		resul.put("mensaje", "El banco " +banco.getNombre()+ " ha sido eliminado");
		
		return forward("/banco/listaBancos", resul);
	}
	
	/**
	 * 
	 * @return lista de todos los bancos
	 */
	@RequestMapping("/banco/listaBancos.do")
	public ModelAndView listaBancos(HttpServletRequest req) {
				
		HttpSession session = req.getSession();
		session.setAttribute("menu", ConstantesMenu.menuAdministracionMaestros);
		Map<String, Object> resul = new HashMap<String, Object>();		
		resul.put("bancos", srvBanco.obtenerTodos());		
		return forward("/banco/listaBancos", resul);
	}
	
}