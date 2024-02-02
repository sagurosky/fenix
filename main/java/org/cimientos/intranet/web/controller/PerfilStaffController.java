package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfilstaff.PerfilStaff;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.cimientos.intranet.servicio.BancoSrv;
import org.cimientos.intranet.servicio.LocalidadSrv;
import org.cimientos.intranet.servicio.PerfilStaffSrv;
import org.cimientos.intranet.servicio.PersonaSrv;
import org.cimientos.intranet.servicio.ProvinciaSrv;
import org.cimientos.intranet.servicio.SucursalBancoSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.CargaHoraria;
import com.cimientos.intranet.enumerativos.Equipo;
import com.cimientos.intranet.enumerativos.ModalidadContratacion;

/**
 * PerfilStaffController	
 * @author Julian Rios
 *
 */

@Controller
@RequestMapping("/perfilStaff/*")
public class PerfilStaffController extends BaseController{

	@Autowired
	private PerfilStaffSrv srvPerfilStaff;
	@Autowired
	private PersonaSrv srvPersona;
	@Autowired
	private BancoSrv srvBanco;
	@Autowired
	private SucursalBancoSrv srvSucursal;
	@Autowired
	private LocalidadSrv srvLocalidad;
	@Autowired
	private ProvinciaSrv srvProvincia;

	
	@RequestMapping("/perfilStaff/altaPerfilStaff.do")
	public ModelAndView agregarPerfilStaff() {
		
		PerfilStaff perfilStaff = new PerfilStaff();
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("perfilStaff", perfilStaff);
		resul.put("bancos", srvBanco.obtenerTodos());
		resul.put("modalidadesContratacion", ModalidadContratacion.getListaModalidad());
		resul.put("cargasHorarias", CargaHoraria.getListaCargaHoraria());
		resul.put("equipos", Equipo.getListaEquipo());
		return forward("/perfilStaff/altaPerfilStaff", resul);
	}
	/**
	 * 
	 * @param perfilStaff
	 * @return 
	 * verificar por que duplica si actualizo la pagina 
	 */
	@RequestMapping("/perfilStaff/guardarPerfilStaff.do")
	public ModelAndView guardarPerfilStaff(

			@ModelAttribute("perfilStaff") PerfilStaff perfilStaff,
			@RequestParam("modalidadContratacionID") Integer modalidadContratacionID,
			@RequestParam("cargaHorariaID") Integer cargaHorariaID,
			@RequestParam("bancoID") Long bancoID,
			@RequestParam("sucursalID") Long sucursalID,
			@RequestParam("cuit_cuil") String cuit_cuil)
	{
		
			Map<String, Object> resul = new HashMap<String, Object>();
			String cuil = Formateador.formatearCuilSinGuiones(cuit_cuil);
			Persona persona = srvPersona.buscarPorCuil(cuil);
			if(persona.getPerfilStaff() != null)
			{
				resul.put("error", "Ya existe un perfil creado para esa persona");
				resul.put("modalidadesContratacion", ModalidadContratacion.getListaModalidad());
				resul.put("cargasHorarias", CargaHoraria.getListaCargaHoraria());
				resul.put("bancos", srvBanco.obtenerTodos());
				resul.put("equipos", Equipo.getListaEquipo());
				return forward("/perfilStaff/altaPerfilStaff", resul);
			}else
			{
				perfilStaff.setDatosPersonales(persona);
			}
			perfilStaff.setActivo(true);
			perfilStaff.setFechaIngreso(new Date());
			perfilStaff.setModalidadContratacion(ModalidadContratacion.getModalidadContratacion(modalidadContratacionID));
			perfilStaff.setCargaHoraria(CargaHoraria.getCargaHoraria(cargaHorariaID));
			perfilStaff.setBanco(srvBanco.obtenerBanco(bancoID));
			perfilStaff.setSucursal(srvSucursal.obtenerSucursalBanco(sucursalID));
			persona.setPerfilStaff(perfilStaff);
			srvPersona.agregarPersona(persona);
			
			resul.put("cargasHorarias", CargaHoraria.getListaCargaHoraria());
			resul.put("modalidadesContratacion", ModalidadContratacion.getListaModalidad());
			srvPerfilStaff.agregarPerfilStaff(perfilStaff);
			resul.put("mensaje", "Se ingresado satisfactoriamente el perfil: " + perfilStaff.getDatosPersonales().getApellido() + " " + perfilStaff.getDatosPersonales().getNombre());
			List<PerfilStaff> staffs = srvPerfilStaff.obtenerTodos();
			resul.put("perfilStaffs", staffs);
			return forward("/perfilStaff/listaPerfilStaff", resul);
			}
	
	
	@RequestMapping("/perfilStaff/modificarStaff.do")
	public ModelAndView modificarPerfilStaff(
			@ModelAttribute("perfilStaff") PerfilStaff perfilStaff,
			@RequestParam("modalidadContratacionID") Integer modalidadContratacionID,
			@RequestParam("cargaHorariaID") Integer cargaHorariaID,
			@RequestParam("bancoID") Long bancoID,
			@RequestParam("idLocalidad") Long idLocalidad,
			@RequestParam("idProvincia") Long idProvincia,
			@RequestParam("sucursalID") Long sucursalID,
			@RequestParam("cuit_cuil") String cuit_cuil){
		
			Map<String, Object> resul = new HashMap<String, Object>();
			Localidad localidad = null;
			Provincia provincia = null;
			String cuil = Formateador.formatearCuilSinGuiones(cuit_cuil);

			Persona persona = srvPersona.obtenerPersona(perfilStaff.getDatosPersonales().getId());
			
			perfilStaff.setActivo(true);
			perfilStaff.setCargaHoraria(CargaHoraria.getCargaHoraria(cargaHorariaID));
			perfilStaff.setModalidadContratacion(ModalidadContratacion.getModalidadContratacion(modalidadContratacionID));
			perfilStaff.setBanco(srvBanco.obtenerBanco(bancoID));
			perfilStaff.setSucursal(srvSucursal.obtenerSucursalBanco(sucursalID));
			if(idLocalidad != null){
				localidad = srvLocalidad.obtenerLocalidad(idLocalidad);
			}
			if(idProvincia != null)
				provincia = srvProvincia.obtenerPorId(idProvincia);
			
			persona.setNombre(perfilStaff.getDatosPersonales().getNombre());
			persona.setApellido(perfilStaff.getDatosPersonales().getApellido());
			persona.setDni(perfilStaff.getDatosPersonales().getDni());
			persona.setCuilCuit(cuil);
			persona.setNacionalidad(perfilStaff.getDatosPersonales().getNacionalidad());
			persona.setDireccion(perfilStaff.getDatosPersonales().getDireccion());
			persona.setNumeroCalle(perfilStaff.getDatosPersonales().getNumeroCalle());
			persona.setPiso(perfilStaff.getDatosPersonales().getPiso());
			persona.setDepartamento(perfilStaff.getDatosPersonales().getDepartamento());
			persona.setEntreCalles(perfilStaff.getDatosPersonales().getEntreCalles());
			persona.setLocalidad(localidad);
			persona.setProvincia(provincia);
			persona.setSexo(perfilStaff.getDatosPersonales().isSexo());
			persona.setCodigoPostal(perfilStaff.getDatosPersonales().getCodigoPostal());
			persona.setTelefono(perfilStaff.getDatosPersonales().getTelefono());
			persona.setCelular(perfilStaff.getDatosPersonales().getCelular());
			persona.setMail(perfilStaff.getDatosPersonales().getMail());
			
			perfilStaff.setDatosPersonales(persona);

			srvPerfilStaff.agregarPerfilStaff(perfilStaff);
			
			resul.put("cargasHorarias", CargaHoraria.getListaCargaHoraria());
			resul.put("modalidadesContratacion", ModalidadContratacion.getListaModalidad());
			resul.put("mensaje", "Se ha modificado el perfil: " + perfilStaff.getDatosPersonales().getApellido() + " " + perfilStaff.getDatosPersonales().getNombre());
			
			
			List<PerfilStaff> staffs = srvPerfilStaff.obtenerTodos();
			resul.put("perfilStaffs", staffs);
			return forward("/perfilStaff/listaPerfilStaff", resul);
		}

	
	@RequestMapping("/perfilStaff/modificar.do")
	public ModelAndView modificar(@RequestParam("id") Long id) 
	{
		PerfilStaff perfObj = srvPerfilStaff.obtenerPerfilStaff(id);
		Map<String, Object> resul = new HashMap<String, Object>();
		String cuil_cuit = Formateador.formatearCuilSinGuiones(perfObj.getDatosPersonales().getCuilCuit());
		resul.put("perfilStaff",perfObj);
		resul.put("cuilCuit", cuil_cuit);
		return forward("/perfilStaff/modificarPefilStaff.do", resul);
	}
	
	
	@RequestMapping("/perfilStaff/modificarPerfilSt.do")
	public ModelAndView modificarPerfilSt(
				@RequestParam("legajo") String legajo,
				@RequestParam("fechaIngreso") Date fechaIngreso,
				@RequestParam("mailCimientos") String mailCimientos,
				@RequestParam("modalidadContratacion") int modalidadContratacion,
				@RequestParam("montoIngreso") String montoIngreso,
				@RequestParam("fechaBaja") Date fechaBaja,
				@RequestParam("cargaHoraria") int cargaHoraria,
				@RequestParam("equipo") int equipo,
				@RequestParam("titularCuenta") String titularCuenta,
				@RequestParam("cuilTitularCuenta") String cuilTitularCuenta,
				@RequestParam("nroCuenta") String nroCuenta,
				@RequestParam("cbu") String cbu, 
				@RequestParam("id")long id) {
		
		Map<String, Object> resul = new HashMap<String, Object>();
		PerfilStaff perfObj = srvPerfilStaff.obtenerPerfilStaff(id);
		perfObj.setLegajo(Long.parseLong(legajo));
		perfObj.setFechaIngreso(fechaIngreso);
		perfObj.setModalidadContratacion(ModalidadContratacion.getModalidadContratacion(modalidadContratacion));
		perfObj.setMailCimientos(mailCimientos);
		perfObj.setMontoIngreso(Float.parseFloat(montoIngreso));
		perfObj.setFechaBaja(fechaBaja);
		perfObj.setCargaHoraria(CargaHoraria.getCargaHoraria(cargaHoraria));
		perfObj.setEquipo(Equipo.getEquipo(equipo));
		perfObj.setTitularCuenta(titularCuenta);
		String cuilFormat = Formateador.formatearCuilSinGuiones(cuilTitularCuenta);
		perfObj.setCuilTitularCuenta(cuilFormat);
		perfObj.setNroCuenta(nroCuenta);
		perfObj.setCbu(Long.parseLong(cbu));

		
		srvPerfilStaff.agregarPerfilStaff(perfObj);		
		resul.put("mensaje", "Se han actualizado los datos del perfil: " + perfObj.getLegajo());
		
		List<PerfilStaff> staffs = srvPerfilStaff.obtenerTodos();
		resul.put("perfilStaffs", staffs);

		return forward("/perfilStaff/listaPerfilStaff", resul);
	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/perfilStaff/listaPerfilStaff.do")
	public ModelAndView listaPerfilStaff() {
				
		Map<String, Object> resul = new HashMap<String, Object>();
		List<PerfilStaff> staffs = srvPerfilStaff.obtenerTodos();
		resul.put("perfilStaffs", staffs);
		return forward("/perfilStaff/listaPerfilStaff", resul);
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/perfilStaff/modificarPerfilStaff.do")
	public ModelAndView modificarPerfilStaff(@RequestParam("id") long id) {
		

		Map<String, Object> resul = new HashMap<String, Object>();
		PerfilStaff perfilStaff = srvPerfilStaff.obtenerPerfilStaff(id);
		List<SucursalBanco> sucursalesBanco = new ArrayList<SucursalBanco>();
		List<Banco> bancos = new ArrayList<Banco>();
		List<ModalidadContratacion> modalidades = new ArrayList<ModalidadContratacion>();
		List<CargaHoraria> cargasHorarias = new ArrayList<CargaHoraria>();
		if(perfilStaff.getBanco() != null)
		{
			List<SucursalBanco> sucursales = srvSucursal.buscarSucursalesPorBanco(perfilStaff.getBanco().getId());
			for (SucursalBanco sucursalBanco : sucursales) 
			{
				if(!sucursalBanco.equals(perfilStaff.getSucursal()))
				{
					sucursalesBanco.add(sucursalBanco);
				}
			}
			for(Banco banco : srvBanco.obtenerTodos())
			{
				if(!banco.equals(perfilStaff.getBanco()))
				{
					bancos.add(banco);
				}
			}
			resul.put("sucursalSelected", perfilStaff.getSucursal());
			resul.put("bancoSelected", perfilStaff.getBanco());
			resul.put("bancos", bancos);
			resul.put("sucursales", sucursalesBanco);
		}
		for(ModalidadContratacion modalidad : ModalidadContratacion.getListaModalidad())
		{
			if(!modalidad.equals(perfilStaff.getModalidadContratacion()))
			{
				modalidades.add(modalidad);
			}
		}
		for(CargaHoraria cargaHoraria : CargaHoraria.getListaCargaHoraria())
		{
			if(!cargaHoraria.equals(perfilStaff.getCargaHoraria()))
			{
				cargasHorarias.add(cargaHoraria);
			}
		}
		resul.put("bancos",  srvBanco.obtenerTodos());
		resul.put("sucursales", srvSucursal.obtenerTodos());
		String cuil_cuit = Formateador.formatearCuilSinGuiones(perfilStaff.getDatosPersonales().getCuilCuit());
		resul.put("cuilCuit", cuil_cuit);
		resul.put("perfilStaff", perfilStaff);
		
		resul.put("cargaHoras", cargasHorarias);
		resul.put("modalidadesContratacion", modalidades);
		
		return forward("/perfilStaff/modificarPerfilStaff", resul);
	}

	
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/perfilStaff/eliminarPerfilStaff.do")
	public ModelAndView eliminarPerfilStaff(@RequestParam("id") long id) {
		
		Map<String, Object> resul = new HashMap<String, Object>();
		PerfilStaff perfilStaff = srvPerfilStaff.obtenerPerfilStaff(id);
		perfilStaff.setActivo(false);
		srvPerfilStaff.agregarPerfilStaff(perfilStaff);
		
		List<PerfilStaff> staffs = srvPerfilStaff.obtenerTodos();
		resul.put("perfilStaffs", staffs);
		resul.put("mensaje", "El perfil " +perfilStaff.getLegajo()+ " ha sido eliminado");
		return forward("/perfilStaff/listaPerfilStaff", resul);
	}
	
	
}
