package org.cimientos.intranet.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.servicio.LocalidadSrv;
import org.cimientos.intranet.servicio.PersonaSrv;
import org.cimientos.intranet.servicio.ProvinciaSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.EstadoCivil;
import com.cimientos.intranet.enumerativos.TipoDni;

@Controller
@RequestMapping("/persona/*")
public class PersonaController extends BaseController{
	

	@Autowired
	private PersonaSrv srvPersona;
	@Autowired
	private LocalidadSrv srvLocalidad;
	@Autowired
	private ProvinciaSrv srvProvincia;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/persona/listaPersona.do")
	public ModelAndView listaPersona() {
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("personas", srvPersona.obtenerTodos());
		
		return forward("/persona/listaPersona", resul);
	}
	
	/**
	 * 
	 * @return la vista del registro de persona
	 */
	@RequestMapping("/persona/registrarPersonaView.do")
	public ModelAndView agregarPersona(
			@RequestParam(required=false, value="cuil") String cuil,
			@RequestParam (required=false, value="popup") boolean popup) {
				
			Map<String, Object> resul = new HashMap<String, Object>();
			
			resul.put("persona", new Persona());
			resul.put("estadosCiviles", EstadoCivil.getListaEstadosCiviles());
			resul.put("fechaNacimiento", new Date());
			resul.put("listDni", TipoDni.getListaTipos());
			resul.put("localidades", srvLocalidad.obtenerTodos());
			resul.put("listProvincias", srvProvincia.obtenerTodas());
			resul.put("cuil", cuil);
			resul.put("popup", popup);
		
			return forward("/persona/registrarPersonaView", resul, popup);
			}
	/**
	 * 
	 * @param persona
	 * @return 
	 * verificar por que duplica si actualizo la pagina 
	 */
	@RequestMapping("/persona/registrarPersona.do")
	public ModelAndView guardarPersona(
			@ModelAttribute("persona") Persona persona,
			@RequestParam("tipoDniID") Integer tipoDniID,
			@RequestParam("fechaNac") String fechaNac,
			@RequestParam("provinciaID") Long provinciaID,
			@RequestParam("localidadID") Long localidadID,
			@RequestParam(required=false, value="popup") boolean popup) {
			
			Map<String, Object> resul = new HashMap<String, Object>();
			String cuilCuit = Formateador.formatearCuilSinGuiones(persona.getCuilCuit());
			//Valida que no exista otra persona con el mismo cuil
			Persona personaConIgualCuil = srvPersona.buscarPorIgualCuil(cuilCuit, persona.getId());
			if(personaConIgualCuil != null){
				resul.put("error", "Ya existe una persona con ese Cuil");
				resul.put("persona", personaConIgualCuil);
				resul.put("cerrarPopup", false);
				return forward("/persona/modificarPersonaView", resul,popup);
			}else{
				persona.setTipoDni(TipoDni.getTipoDni(tipoDniID));
				persona.setCuilCuit(cuilCuit);
				persona.setFechaNacimiento(Formateador.parsearFecha(fechaNac));
				persona.setLocalidad(srvLocalidad.obtenerLocalidad(localidadID));
				persona.setProvincia(srvProvincia.obtenerPorId(provinciaID));
				persona.setActivo(false);
				srvPersona.agregarPersona(persona);
			}
					
			resul.put("cerrarPopup", true);
			resul.put("cuil", Formateador.formatearCuilSinGuiones(persona.getCuilCuit()));
			
			if(popup){
				return forward("/persona/registrarPersonaView", resul, popup);
			}
			
			resul.put("mensaje", "Registro satisfactorio");
			return forward("/persona/listaPersona", resul,popup);
			}
	
	/**
	 * @param idEmpresa
	 * @return la vista de la modificacion del formulario de la persona
	 */
	@RequestMapping("/persona/modificarPersonaView.do")
	public ModelAndView modificarPersonaView(@RequestParam("id") Long id) 
	{
		Persona	persona = srvPersona.obtenerPersona(id);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("persona", persona);
		model.put("estadosCiviles", EstadoCivil.getListaEstadosCiviles());
		return forward("/persona/fichaPersona", model);
	}
	
	/**
	 * 
	 * Este metodo permite modificar los datos de la persona
	 *
	 * @return la vista de la lista de personas persistidos
	 */
	@RequestMapping("/persona/modificar.do")
	public ModelAndView modificarPersona(
			@RequestParam("nombre") String nombre,
			@RequestParam("apellido") String apellido,
			@RequestParam("dni") String dni,
			@RequestParam("cuil") String cuil,
			@RequestParam("direccion") String direccion,
			@RequestParam("codigoPostal") String codigoPostal,
			@RequestParam("telefono") String telefono,
			@RequestParam("celular") String celular,
			@RequestParam("fechaNacimiento") Date fechaNacimiento,
			@RequestParam("sexo") boolean sexo, 
			@RequestParam(required=false, value="estadoCivil") Integer estadoCivil,
			@RequestParam("mail") String mail,
			@RequestParam(required=false,value="id") String id,
			@RequestParam(required=false, value="popup") boolean popup) 
	{
		Persona persona;
		String cuilCuit = Formateador.formatearCuilSinGuiones(cuil);
		if(StringUtils.isNotBlank(id)){
			persona = srvPersona.obtenerPersona(Long.valueOf( id));
		}else {
			persona = new Persona();
		}
		
		persona.setNombre(nombre);
		persona.setCuilCuit(cuilCuit);
		persona.setApellido(apellido);
		persona.setDni(Integer.parseInt(dni));
		persona.setDireccion(direccion);
		persona.setCodigoPostal(codigoPostal);
		persona.setTelefono(telefono);
		persona.setCelular(celular);
		persona.setFechaNacimiento(fechaNacimiento);
		persona.setSexo(sexo);
		if (estadoCivil != null)
			persona.setEstadoCivil(EstadoCivil.getEstadoCivil(estadoCivil));
		persona.setMail(mail);
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		//Valida que no exista otra persona con el mismo cuil y distinto id
		Persona personaConIgualCuil = srvPersona.buscarPorIgualCuil(cuilCuit, persona.getId());
		if(personaConIgualCuil != null)
		{
			model.put("error", "Ya existe una persona con ese Cuil");
			model.put("fechaNacimiento", new Date());
			model.put("persona", persona);
			model.put("cerrarPopup", false);
			return forward("/persona/modificarPersonaView", model,popup);
		}
		
		persona.setCuilCuit(cuilCuit);
		srvPersona.agregarPersona(persona);
		popup = true;
		model.put("cerrarPopup", true);
		model.put("cuil", cuilCuit);
		model.put("cuit", cuilCuit);
		if(popup){
			return forward("/perfilPadrino/registrarPersonaPadrinoView", model, popup);
		}
		return forward("/persona/registrarPersonaView", model, popup);
	}


}
