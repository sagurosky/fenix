package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.empresa.Empresa;
import org.cimientos.intranet.servicio.EmpresaSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.dto.EmpresaDTO;

/**
 * Clase que se utiliza para  hacer la redireccion (mapeo) a las vistas.
 * Extiende de BaseController para incluir el Template
 * 
 * @author plabaronnie
 *
 */
@Controller
@RequestMapping("/empresa/*")
public class EmpresaController extends BaseController{

	@Autowired
	public EmpresaSrv svrEmpresa;
		

	/**
	 * Recupera la lista de todos los empresas persistidos en la DB.
	 * 
	 * @return la vista de la lista de empresas persistidos
	 */
	@RequestMapping("/empresa/listaEmpresasView.do")
	public ModelAndView listaEmpresas(){
		Map<String, Object> resul = new HashMap<String, Object>();
		List<Empresa> empresas = svrEmpresa.obtenerTodos();
		List<EmpresaDTO> dtos = new ArrayList<EmpresaDTO>();
		String cuitFormateado = null;
		for (Empresa empresa : empresas) 
		{
			EmpresaDTO dto = new EmpresaDTO();
			dto.setId(empresa.getId());
			dto.setDenominacion(empresa.getDenominacion());
			if(empresa.getContacto1() != null)
				dto.setContacto1(empresa.getContacto1());
			if(empresa.getCUIT() != null)
			{
				cuitFormateado = Formateador.formatearCuilConGuiones(empresa.getCUIT());
				dto.setCUIT(cuitFormateado);
			}
			if(empresa.getMailContacto1() != null)
				dto.setMailContacto1(empresa.getMailContacto1());
			if(empresa.getFechaAlta() != null)
				dto.setFechaAlta(empresa.getFechaAlta());
			dtos.add(dto);
		}
		resul.put("empresas", dtos);
		return forward("/empresa/listaEmpresas", resul);
	}
	
	
	/**
	 * @return la vista del alta del formulario del empresa
	 */
	@RequestMapping("/empresa/altaEmpresaView.do")
	public ModelAndView altaEmpresaView(
			@RequestParam(required=false, value="cuit") String cuit,
			@RequestParam (required=false, value="popup") boolean popup)
	{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("fechaAlta", new Date());
		model.put("cuit", cuit);
		model.put("popup", popup);

		return forward("/empresa/altaEmpresa", model, popup);
	}
			
	
	/**
	 * Este metodo persiste los datos del empresa que llegan del formulario de alta.
	 * Setea el estado del empresa como activo.
	 * Verifica que la empresa a registrar no este dado de alta.
	 * 
	 * 
	 * @param request
	 * @param tipo
	 * @param denominacion
	 * @param contacto1
	 * @param mailContacto1
	 * @param contacto2
	 * @param mailContacto2
	 * @param fechaAlta
	 * @return la vista que me devuelve los empresas activos 
	 */
	@RequestMapping("/empresa/altaEmpresa.do")
	public ModelAndView altaEmpresa( 
			@RequestParam("cuit") String cuit,
			@RequestParam("denominacion") String denominacion,
			@RequestParam("contacto1") String contacto1,
			@RequestParam("mailContacto1") String mailContacto1,
			@RequestParam("fechaAlta") String fechaAlta,
			@RequestParam(required=false, value="popup") boolean popup) {
		
	
		Date fecha = Formateador.parsearFecha(fechaAlta);
		Empresa empresa = new Empresa();
		String cuilFormateado = Formateador.formatearCuilSinGuiones(cuit);
		empresa.setActivo(true);
		empresa.setContacto1(contacto1);
		empresa.setMailContacto1(mailContacto1);
		empresa.setDenominacion(denominacion);
		empresa.setFechaAlta(fecha);
		empresa.setCUIT(cuilFormateado);
		svrEmpresa.guardarEmpresa(empresa);
		Map<String, Object> model = new HashMap<String, Object>();
		
		//Valida que no exista otra empresa con el mismo cuit
		Empresa empresaConIgualCUIT = svrEmpresa.buscarPorIgualCUIT(empresa.getCUIT(), empresa.getId());
		if(empresaConIgualCUIT != null)
		{
			model.put("error", "Ya existe un empresa con ese CUIT");
			model.put("empresa", empresaConIgualCUIT);
			model.put("CUIT", Formateador.formatearCuilSinGuiones(empresa.getCUIT()));
			model.put("cerrarPopup", false);
			return forward("/empresa/modificarEmpresa", model,popup);
		}
		
		model.put("empresas", svrEmpresa.obtenerTodos());
		model.put("cerrarPopup", true);
		model.put("cuit", cuilFormateado);
		if(popup){
			return forward("/empresa/altaEmpresa", model, popup);
		}
		List<Empresa> empresas = svrEmpresa.obtenerTodos();
		List<EmpresaDTO> dtos = new ArrayList<EmpresaDTO>();
		String cuitFormateado = null;
		for (Empresa e : empresas) 
		{
			EmpresaDTO dto = new EmpresaDTO();
			dto.setId(e.getId());
			dto.setDenominacion(e.getDenominacion());
			if(e.getContacto1() != null)
				dto.setContacto1(e.getContacto1());
			if(e.getCUIT() != null)
			{
				cuitFormateado = Formateador.formatearCuilConGuiones(e.getCUIT());
				dto.setCUIT(cuitFormateado);
			}
			if(e.getMailContacto1() != null)
				dto.setMailContacto1(e.getMailContacto1());
			if(e.getFechaAlta() != null)
				dto.setFechaAlta(e.getFechaAlta());
			dtos.add(dto);
		}
		model.put("empresas", dtos);
		return forward("/empresa/listaEmpresas", model,popup);

	}
	
	/**
	 * @param idEmpresa
	 * @return la vista de la modificacion del formulario del empresa
	 */
	@RequestMapping("/empresa/modificarEmpresaView.do")
	public ModelAndView modificarEmpresaView(@RequestParam("idEmpresa") Long idEmpresa) 
	{
		Empresa empresa = svrEmpresa.obtenerPorId(idEmpresa);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("empresa", empresa);
		model.put("CUIT", Formateador.formatearCuilSinGuiones(empresa.getCUIT()));
		return forward("/empresa/modificarEmpresa", model);
	}
	
	/**
	 * 
	 * Este metodo permite modificar los datos del empresa
	 * 
	 * @param tipo
	 * @param denominacion
	 * @param contacto1
	 * @param mailContacto1
	 * @param contacto2
	 * @param mailContacto2
	 * @param fechaAlta
	 * @param idEmpresa
	 * @return la vista de la lista de empresas persistidos
	 */
	@RequestMapping("/empresa/modificar.do")
	public ModelAndView modificarEmpresa(
			@RequestParam("cuit") String cuit,
			@RequestParam("denominacion") String denominacion,
			@RequestParam("contacto1") String contacto1,
			@RequestParam("mailContacto1") String mailContacto1,
			@RequestParam("fechaAlta") String fechaAlta,
			@RequestParam(required=false,value="idEmpresa") String idEmpresa,
			@RequestParam(required=false, value="popup") boolean popup) 
	{
		Empresa empresa;
		if(StringUtils.isNotBlank(idEmpresa)){
			empresa = svrEmpresa.obtenerPorId(Long.valueOf( idEmpresa));
		}else {
			empresa = new Empresa();
		}
		empresa.setActivo(true);
		empresa.setContacto1(contacto1);
		empresa.setMailContacto1(mailContacto1);
		empresa.setDenominacion(denominacion);
		Date fecha = Formateador.parsearFecha(fechaAlta);
		empresa.setFechaAlta(fecha);
		empresa.setCUIT(Formateador.formatearCuilSinGuiones(cuit));
		Map<String, Object> model = new HashMap<String, Object>();
		//Valida que no exista otra empresa con el mismo cuit y distinto id
		Empresa empresaConIgualCUIT = svrEmpresa.buscarPorIgualCUIT(cuit, empresa.getId());
		if(empresaConIgualCUIT != null)
		{
			model.put("error", "Ya existe un empresa con ese CUIT");
			model.put("fechaAlta", new Date());
			model.put("empresa", empresa);
			model.put("cerrarPopup", false);

			return forward("/empresa/modificarEmpresa", model,popup);
		}
		model.put("mensaje", "Se modificaron los datos de la empresa: " + empresa.getDenominacion());
		svrEmpresa.guardarEmpresa(empresa);
		model.put("cerrarPopup", true);
		model.put("cuit", Formateador.formatearCuilSinGuiones(cuit));
		List<Empresa> empresas = svrEmpresa.obtenerTodos();
		List<EmpresaDTO> dtos = new ArrayList<EmpresaDTO>();
		String cuitFormateado = null;
		for (Empresa e : empresas) 
		{
			EmpresaDTO dto = new EmpresaDTO();
			dto.setId(e.getId());
			dto.setDenominacion(e.getDenominacion());
			if(e.getContacto1() != null)
				dto.setContacto1(e.getContacto1());
			if(e.getCUIT() != null)
			{
				cuitFormateado = Formateador.formatearCuilConGuiones(e.getCUIT());
				dto.setCUIT(cuitFormateado);
			}
			if(e.getMailContacto1() != null)
				dto.setMailContacto1(e.getMailContacto1());
			if(e.getFechaAlta() != null)
				dto.setFechaAlta(e.getFechaAlta());
			dtos.add(dto);
		}
		model.put("empresas", dtos);
		return forward("/empresa/listaEmpresas", model,popup);
	}
	
	/**
	 * Setea como inactivo al empresa que se quiere eliminar y se guarda el estado.
	 * 
	 * @param idEmpresa
	 * @return la vista de la lista de empresas persistidos
	 */
	@RequestMapping("/empresa/eliminarEmpresa.do")
	public ModelAndView eliminarEmpresa(@RequestParam("idEmpresa") Long idEmpresa) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		
		Empresa empresa = svrEmpresa.obtenerPorId(idEmpresa); 
		empresa.setActivo(false);
		svrEmpresa.guardarEmpresa(empresa);
		List<Empresa> empresas = svrEmpresa.obtenerTodos();
		List<EmpresaDTO> dtos = new ArrayList<EmpresaDTO>();
		String cuitFormateado = null;
		for (Empresa e : empresas) 
		{
			EmpresaDTO dto = new EmpresaDTO();
			dto.setId(e.getId());
			dto.setDenominacion(e.getDenominacion());
			if(e.getContacto1() != null)
				dto.setContacto1(e.getContacto1());
			if(e.getCUIT() != null)
			{
				cuitFormateado = Formateador.formatearCuilConGuiones(e.getCUIT());
				dto.setCUIT(cuitFormateado);
			}
			if(e.getMailContacto1() != null)
				dto.setMailContacto1(e.getMailContacto1());
			if(e.getFechaAlta() != null)
				dto.setFechaAlta(e.getFechaAlta());
			dtos.add(dto);
		}
		resul.put("empresas", dtos);
		resul.put("mensaje", "El empresa " + empresa.getDenominacion() + " ha sido eliminado");
		return forward("/empresa/listaEmpresas", resul);
	}


}
