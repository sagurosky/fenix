package org.cimientos.intranet.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.cimientos.intranet.modelo.empresa.Empresa;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.servicio.EmpresaSrv;
import org.cimientos.intranet.servicio.PerfilPadrinoSvr;
import org.cimientos.intranet.servicio.PersonaSrv;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.utils.paginacion.ExtendedPaginatedList;
import org.cimientos.intranet.utils.paginacion.PaginateListFactory;
import org.displaytag.tags.TableTagParameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.dto.PadrinoDTO;
import com.cimientos.intranet.enumerativos.EstadoCivil;


/**
 * Clase que se utiliza para  hacer la redireccion (mapeo) a las vistas.
 * Extiende de BaseController para incluir el Template
 * 
 * @author plabaronnie
 *
 */
@Controller
@RequestMapping("/perfilPadrino/*")
public class PerfilPadrinoController extends BaseController {
	@Autowired
	public PerfilPadrinoSvr svrPadrino;
	@Autowired
	public EmpresaSrv empresaSrv;
	@Autowired
	public PersonaSrv personaSrv;

	@Autowired
	private PaginateListFactory paginateListFactory;
	
	
	/**
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("/perfilPadrino/listaPadrinosView.do")
	public ModelAndView verListaPadrinos(HttpServletRequest request, 
			 @RequestParam(required= false, value="cantRows") String totalRows, 
			 @RequestParam(required= false, value="idPadrinoBeca") Long padrinoId,
			 @RequestParam(required= false, value="tipoId") Integer tipoId, 
			 @RequestParam(required= false, value="cuitCuil") String cuitCuil,
			 @RequestParam(required= false, value="padrinoBeca") String padrino){
		Map<String, Object> resul = new HashMap<String, Object>();
		
		Integer idTipo = tipoId != null && tipoId.equals(0) ? null : tipoId;
		
		boolean export = request.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null; 
		
		ExtendedPaginatedList listaPaginada = paginarPadrinos(export, request, idTipo, cuitCuil, padrinoId);
		
        resul.put("padrinos", listaPaginada);
        
        resul.put("tipos", TipoPadrino.getListaTipos());
        resul.put("tipoId", tipoId);
        resul.put("idPadrinoBeca", padrinoId);
        resul.put("padrinoBeca", padrino);       
        resul.put("cuitCuil", cuitCuil);
        return forward("/perfilPadrino/listaPadrinos", resul);
	}

	

	/**
	 * @param export
	 * @param request
	 * @param idTipo
	 * @param cuitCuil
	 * @param padrinoId
	 * @return
	 */
	private ExtendedPaginatedList paginarPadrinos(boolean export,
			HttpServletRequest request, Integer idTipo, String cuitCuil,
			Long padrinoId) {
		List<PerfilPadrino> padrinos = null;
		List<PadrinoDTO> dtos = new ArrayList<PadrinoDTO>();
		
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		
		int totalRows = svrPadrino.obtenerCantidadPadrinosAExportar(idTipo, cuitCuil, padrinoId);

		//Si es un export debo cargar toda la lista entera, si no lo es entonces se carga la lista de a una pagina por vez
		if(export){
			
			padrinos = svrPadrino
			.obtenerPadrinosAExportar(idTipo, cuitCuil, padrinoId,
					0, totalRows,listaPaginada.getSortDirection(), listaPaginada
							.getSortCriterion());
		}else{
			padrinos = svrPadrino
				.obtenerPadrinosAExportar(idTipo, cuitCuil, padrinoId, listaPaginada
						.getFirstRecordIndex(), listaPaginada.getPageSize(),
						listaPaginada.getSortDirection(), listaPaginada
								.getSortCriterion());
		}
		
		dtos = obtenerListaPadrinoDto(padrinos);
		
		listaPaginada.setList(dtos);
		listaPaginada.setTotalNumberOfRows(totalRows);

		return listaPaginada;
	}



	/**
	 * @param padrinos
	 * @return
	 */
	private List<PadrinoDTO> obtenerListaPadrinoDto(List<PerfilPadrino> padrinos) {
		List<PadrinoDTO> dtos = new ArrayList<PadrinoDTO>();
		String cuitFormateado = null;
		for (PerfilPadrino pp : padrinos)
		{
			PadrinoDTO dto = new PadrinoDTO();
			if(pp.getTipo().equals(TipoPadrino.CORPORATIVO))
			{
				if(pp.getEmpresa().getCUIT() != null)
				{
					cuitFormateado = Formateador.formatearCuilConGuiones(pp.getEmpresa().getCUIT());
					dto.setCuilCuit(cuitFormateado);
				}
				dto.setNombre(pp.getEmpresa().getDenominacion());
				dto.setTipo(TipoPadrino.CORPORATIVO.getValor());
			}
			else 
			{
				if(pp.getDatosPersonales() != null)
				{
					cuitFormateado = Formateador.formatearCuilConGuiones(pp.getDatosPersonales().getCuilCuit());
					dto.setCuilCuit(cuitFormateado);
				}
				dto.setNombre(pp.getDatosPersonales().getApellido() + ", " + pp.getDatosPersonales().getNombre());
				dto.setTipo(TipoPadrino.INDIVIDUAL.getValor());
			}
			if(pp.getFechaAlta() != null)
				dto.setFechaAlta(pp.getFechaAlta());
			dto.setId(pp.getId());
			if (pp.getNroCtesPlataformaContable() !=null){
				dto.setNroCtesPlataformaContable(pp.getNroCtesPlataformaContable().toString());
			}else{
				
			}
			
			dtos.add(dto);
		}
		return dtos;
	}



	
	/**
	 * @return la vista del alta del formulario del padrino
	 */
	@RequestMapping("/perfilPadrino/altaPadrinoView.do")
	public ModelAndView altaPadrinoView()
	{
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("tipos", TipoPadrino.values());
		model.put("fechaAlta", new Date());
		return forward("/perfilPadrino/altaPadrino", model);
	}
			
	
	/**
	 * Este metodo persiste los datos del padrino que llegan del formulario de alta.
	 * Setea el estado del padrino como activo.
	 * Verifica que el padrino a registrar no este dado de alta.
	 * 
	 * @param request
	 * @param tipo
	 * @param cuit_cuil
	 * @param fechaAlta
	 * @return
	 */
	@RequestMapping("/perfilPadrino/altaPadrino.do")
	public ModelAndView altaPadrino(
			HttpServletRequest request,
			@RequestParam("tipo") int tipo,
			@RequestParam("cuit_cuil") String cuit_cuil,
			@RequestParam("fechaAlta") String fechaAlta,
			@RequestParam("recibeInformesMasivos") Boolean recibeInformesMasivos,
			@RequestParam("nroCtesPlataformaContable") Long nroCtesPlataformaContable) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		PerfilPadrino padrino = new PerfilPadrino();
		padrino.setTipo(TipoPadrino.getTipoPadrino(tipo));
		Date fecha = Formateador.parsearFecha(fechaAlta);
		padrino.setFechaAlta(fecha);
		padrino.setActivo(true);
		padrino.setRecibeInformesMasivos(recibeInformesMasivos);
		padrino.setNroCtesPlataformaContable(nroCtesPlataformaContable);
		String unCuitCuil = Formateador.formatearCuilSinGuiones(cuit_cuil);
		if(TipoPadrino.CORPORATIVO.equals( padrino.getTipo()))
		{
			//el padrino es una empresa
			Empresa empresa = empresaSrv.buscarPorCUIT(unCuitCuil);
			if(empresa == null){
				String error = "No existe una empresa con ese CUIT";
				model.put("error", error);
				model.put("tipos", TipoPadrino.values());
				model.put("fechaAlta", new Date());
				return forward("/perfilPadrino/altaPadrino", model);
			}
			padrino.setEmpresa(empresa);

			//Valida que no exista otra empresa padrino con el mismo cuit
			PerfilPadrino padrinoConIgualCUIT = svrPadrino.buscarPorIgualCUIT(unCuitCuil, padrino.getId());
			if(padrinoConIgualCUIT != null)
			{	model.put("CUIT", Formateador.formatearCuilSinGuiones(unCuitCuil));
				String error = "Ya existe un padrino con el mismo CUIT";
				return forwardErrorViewPadrinoCorp("/perfilPadrino/modificarPadrinoCorp", model, error, padrinoConIgualCUIT);
			}
			
		}else{
			//el padrino es una persona fisica
			
			Persona persona = personaSrv.buscarPorCuil(unCuitCuil);
			if(persona == null){
				String error = "No existe una persona con ese CUIL";
				model.put("error", error);
				model.put("tipos", TipoPadrino.values());
				model.put("fechaAlta", new Date());
				return forward("/perfilPadrino/altaPadrino", model);
			}
			
			padrino.setDatosPersonales(persona);
			//Valida que no exista  padrino con el mismo cuit
			PerfilPadrino padrinoConIgualCUIL = svrPadrino.buscarPorIgualCUIL(unCuitCuil, padrino.getId());
			
			if(padrinoConIgualCUIL != null)
			{
				String error = "Ya existe un padrino con el mismo CUIL";
				model.put("CUIL", Formateador.formatearCuilSinGuiones(unCuitCuil));
				return forwardErrorViewPadrino("/perfilPadrino/modificarPadrino", model, error, padrinoConIgualCUIL);
			}
		}
		
		
		svrPadrino.guardarPadrino(padrino);
		if(TipoPadrino.CORPORATIVO.equals( padrino.getTipo()))
			model.put("mensaje", "Se dio de alta a: " + padrino.getEmpresa().getDenominacion()+ " como padrino Corporativo" );
		else
			model.put("mensaje", "Se dio de alta a: " + padrino.getDatosPersonales().getNombre()+ " "+ padrino.getDatosPersonales().getApellido()+ " como padrino Individual" );
		
		List<PerfilPadrino> padrinos = svrPadrino.obtenerTodos();
		List<PadrinoDTO> dtos = new ArrayList<PadrinoDTO>();
		String cuitFormateado = null;
		for (PerfilPadrino pp : padrinos)
		{
			PadrinoDTO dto = new PadrinoDTO();
			if(pp.getTipo().equals(TipoPadrino.CORPORATIVO))
			{
				if(pp.getEmpresa().getCUIT() != null)
				{
					cuitFormateado = Formateador.formatearCuilConGuiones(pp.getEmpresa().getCUIT());
					dto.setCuilCuit(cuitFormateado);
				}
				dto.setNombre(pp.getEmpresa().getDenominacion());
				dto.setTipo(TipoPadrino.CORPORATIVO.getValor());
			}
			else
			{
				if(pp.getDatosPersonales().getCuilCuit() != null)
				{
					cuitFormateado = Formateador.formatearCuilConGuiones(pp.getDatosPersonales().getCuilCuit());
					dto.setCuilCuit(cuitFormateado);
				}
				dto.setNombre(pp.getDatosPersonales().getApellido() + ", " + pp.getDatosPersonales().getNombre());
				dto.setTipo(TipoPadrino.INDIVIDUAL.getValor());
			}
			if(pp.getFechaAlta() != null)
				dto.setFechaAlta(pp.getFechaAlta());
			dto.setId(pp.getId());
			dtos.add(dto);
		}
		model.put("padrinos", dtos);
		return this.verListaPadrinos(request, null, null, null, null, null);

	}
	
	
		@RequestMapping("/perfilPadrino/registrarPersonaPadrinoView.do")
		public ModelAndView agregarPersonaPadrino(
				@RequestParam(required=false, value="cuil") String cuil,
				@RequestParam (required=false, value="popup") boolean popup) {
					
			Map<String, Object> resul = new HashMap<String, Object>();
			resul.put("estadosCiviles", EstadoCivil.getListaEstadosCiviles());
			resul.put("fechaNacimiento", new Date());
			resul.put("cuil", cuil);
			resul.put("dni", Formateador.getDniFromCuil(cuil));
			resul.put("cerrarPopup", false);
			resul.put("popup", popup);
			
			return forward("/perfilPadrino/registrarPersonaPadrinoView", resul, popup);
		}
	/**
	 * 
	 * @param persona
	 * @return 
	 * verificar por que duplica si actualizo la pagina 
	 */
	@RequestMapping("/perfilPadrino/registrarPersonaPadrino.do")
	public ModelAndView guardarPersonaPadrino( 
			@RequestParam("nombre") String nombre,
			@RequestParam("apellido") String apellido,
			@RequestParam("dni") Integer dni,
			@RequestParam("cuil") String cuil,
			@RequestParam("direccion") String direccion,
			@RequestParam("codigoPostal") String codigoPostal,
			@RequestParam("telefono") String telefono,
			@RequestParam("celular") String celular,
			@RequestParam("fechaNacimiento") String fechaNacimiento,
			@RequestParam("sexo") boolean sexo, 
			@RequestParam(required=false, value="estadoCivil") Integer estadoCivil,
			@RequestParam("mail") String mail,
			@RequestParam(required=false, value="popup") boolean popup) {
		
		Persona personaObj = new Persona();
		personaObj.setNombre(nombre);
		personaObj.setApellido(apellido);
		personaObj.setDni(dni);
		String cuil_cuit = Formateador.formatearCuilSinGuiones(cuil);
		personaObj.setCuilCuit(cuil_cuit);
		personaObj.setDireccion(direccion);
		personaObj.setCodigoPostal(codigoPostal);
		personaObj.setTelefono(telefono);
		personaObj.setCelular(celular);
		personaObj.setFechaNacimiento(Formateador.parsearFecha(fechaNacimiento));
		personaObj.setSexo(sexo);
		if (estadoCivil != null)
			personaObj.setEstadoCivil(EstadoCivil.getEstadoCivil(estadoCivil));
		
		personaObj.setMail(mail);
		
		Map<String, Object> resul = new HashMap<String, Object>();
		//Valida que no exista otra persona con el mismo cuil
		Persona personaConIgualCuil = personaSrv.buscarPorIgualCuil(cuil_cuit, personaObj.getId());
		if(personaConIgualCuil != null)
		{	PerfilPadrino padrino= new PerfilPadrino();
			resul.put("error", "Ya existe una persona con ese Cuil");
			resul.put("persona", personaConIgualCuil);
			resul.put("padrino", padrino);
			resul.put("cerrarPopup", false);
			return forward("/persona/modificarPersonaView", resul,popup);
		}
		personaSrv.agregarPersona(personaObj);		
		resul.put("cerrarPopup", true);
		resul.put("cuil", Formateador.formatearCuilSinGuiones(cuil));
		resul.put("dni", cuil);
		if(popup){
			return forward("/persona/registrarPersonaView", resul, popup);
		}
		resul.put("mensaje", "Registro satisfactorio");
		return forward("/persona/listaPersona", resul,popup);
	}
	/**
	 * Retorna la vista de padrino con error
	 * 
	 * @param string
	 * @param model
	 * @return la vista de modificar padrino mostrando error
	 */
	private ModelAndView forwardErrorViewPadrino(String string,
			Map<String, Object> model, String error, PerfilPadrino padrino) {
		
		model.put("error", error);
		model.put("padrino", padrino);
		model.put("tipos", TipoPadrino.values());
		return forward("/perfilPadrino/modificarPadrino", model);
	}
	
	private ModelAndView forwardErrorViewPadrinoCorp(String string,
			Map<String, Object> model, String error, PerfilPadrino padrino) {
		
		model.put("error", error);
		model.put("padrino", padrino);
		model.put("tipos", TipoPadrino.values());
		return forward("/perfilPadrino/modificarPadrinoCorp", model);
	}


	/**
	 * @param idPadrino
	 * @return la vista de la modificacion del formulario del padrino
	 */
	@RequestMapping("/perfilPadrino/modificarPadrinoView.do")
	public ModelAndView modificarPadrinoView(@RequestParam("idPadrino") Long idPadrino) 
	{
		PerfilPadrino padrino = svrPadrino.obtenerPorId(idPadrino);
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("padrino", padrino);
		model.put("tipos", TipoPadrino.values());
		model.put("estadosCiviles", EstadoCivil.getListaEstadosCiviles());
		if (padrino.getTipo()== TipoPadrino.CORPORATIVO){
			model.put("CUIT",Formateador.formatearCuilSinGuiones(padrino.getEmpresa().getCUIT()));
			return forward("/perfilPadrino/modificarPadrinoCorp", model);
		}
		else{
			model.put("CUIL",Formateador.formatearCuilSinGuiones(padrino.getDatosPersonales().getCuilCuit()));
			return forward("/perfilPadrino/modificarPadrino", model);
		}
	}
	
	/**
	 * 
	 * Este metodo permite modificar los datos del padrino
	 * 
	 * @param tipo
	 * @param denominacion
	 * @param contacto1
	 * @param mailContacto1
	 * @param contacto2
	 * @param mailContacto2
	 * @param fechaAlta
	 * @param idPadrino
	 * @return la vista de la lista de padrinos persistidos
	 */
	@RequestMapping("/perfilPadrino/modificar.do")
	public ModelAndView modificarPadrino(
			HttpServletRequest request,
			@ModelAttribute("padrino") PerfilPadrino padrino,
			@RequestParam(required=false, value="estadoCivilId") Integer estadoCivilId,
			@RequestParam("tipoPadrino") String tipo,
			@RequestParam("fechaAltaStr") String fechaAltaStr,
			@RequestParam("fechaNacimientoStr") String fechaNacimientoStr)
			{

			Map<String, Object> model = new HashMap<String, Object>();
			
			if(!fechaAltaStr.equals(""))
			{
				Date fecha = Formateador.parsearFecha(fechaAltaStr);
				padrino.setFechaAlta(fecha);
			}
			
			if(tipo.equals(TipoPadrino.INDIVIDUAL.getValor()))
				padrino.setTipo(TipoPadrino.INDIVIDUAL);
			else
				padrino.setTipo(TipoPadrino.CORPORATIVO);
			
			if (estadoCivilId !=null)
				padrino.getDatosPersonales().setEstadoCivil(EstadoCivil.getEstadoCivil(estadoCivilId));
			if(!fechaNacimientoStr.equals(""))
				padrino.getDatosPersonales().setFechaNacimiento(Formateador.parsearFecha(fechaNacimientoStr));
			padrino.setActivo(true);
			padrino.getDatosPersonales().setCuilCuit(Formateador.formatearCuilSinGuiones(padrino.getDatosPersonales().getCuilCuit()));
			svrPadrino.guardarPadrino(padrino);
			
			model.put("mensaje", "Se modificó el padrino: " + padrino.getDatosPersonales().getNombre()
									+ " " + padrino.getDatosPersonales().getApellido());
			List<PerfilPadrino> padrinos = svrPadrino.obtenerTodos();
			List<PadrinoDTO> dtos = new ArrayList<PadrinoDTO>();
			String cuitFormateado = null;
			for (PerfilPadrino pp : padrinos)
			{
				PadrinoDTO dto = new PadrinoDTO();
				if(pp.getTipo().equals(TipoPadrino.CORPORATIVO))
				{
					if(pp.getEmpresa().getCUIT() != null)
					{
						cuitFormateado = Formateador.formatearCuilConGuiones(pp.getEmpresa().getCUIT());
						dto.setCuilCuit(cuitFormateado);
					}
					dto.setNombre(pp.getEmpresa().getDenominacion());
					dto.setTipo(TipoPadrino.CORPORATIVO.getValor());
				}
				else
				{
					if(pp.getDatosPersonales().getCuilCuit() != null)
					{
						cuitFormateado = Formateador.formatearCuilConGuiones(pp.getDatosPersonales().getCuilCuit());
						dto.setCuilCuit(cuitFormateado);
					}
					dto.setNombre(pp.getDatosPersonales().getApellido() + ", " + pp.getDatosPersonales().getNombre());
					dto.setTipo(TipoPadrino.INDIVIDUAL.getValor());
				}
				if(pp.getFechaAlta() != null)
					dto.setFechaAlta(pp.getFechaAlta());
				dto.setId(pp.getId());
				dtos.add(dto);
			}
			model.put("padrinos", dtos);
			return this.verListaPadrinos(request, null, null, null, null, null);

			}
	
	@RequestMapping("/perfilPadrino/modificarCorp.do")
	public ModelAndView modificarPadrinoCorp(
			HttpServletRequest request,
			@ModelAttribute("padrino") PerfilPadrino padrino,
			@RequestParam("tipoPadrino") String tipo,
			@RequestParam("fechaAltaStr") String fechaAltaStr,
			@RequestParam("fechaAlta2") String fechaAlta2)
			{
			if(tipo.equals(TipoPadrino.INDIVIDUAL.getValor()))
				padrino.setTipo(TipoPadrino.INDIVIDUAL);
			else
				padrino.setTipo(TipoPadrino.CORPORATIVO);
			Map<String, Object> model = new HashMap<String, Object>();
			padrino.getEmpresa().setCUIT(Formateador.formatearCuilSinGuiones(padrino.getEmpresa().getCUIT()));
			padrino.getEmpresa().setFechaAlta(Formateador.parsearFecha(fechaAlta2));
			padrino.getEmpresa().setActivo(true);
			Date fecha = Formateador.parsearFecha(fechaAltaStr);
			padrino.setFechaAlta(fecha);
			padrino.setActivo(true);
			svrPadrino.guardarPadrino(padrino);
			model.put("mensaje", "Se modificó el padrino: " + padrino.getEmpresa().getDenominacion());
			List<PerfilPadrino> padrinos = svrPadrino.obtenerTodos();
			List<PadrinoDTO> dtos = new ArrayList<PadrinoDTO>();
			String cuitFormateado = null;
			for (PerfilPadrino pp : padrinos)
			{
				PadrinoDTO dto = new PadrinoDTO();
				if(pp.getTipo().equals(TipoPadrino.CORPORATIVO))
				{
					if(pp.getEmpresa().getCUIT() != null)
					{
						cuitFormateado = Formateador.formatearCuilConGuiones(pp.getEmpresa().getCUIT());
						dto.setCuilCuit(cuitFormateado);
					}
					dto.setNombre(pp.getEmpresa().getDenominacion());
					dto.setTipo(TipoPadrino.CORPORATIVO.getValor());
				}
				else
				{
					if(pp.getDatosPersonales().getCuilCuit() != null)
					{
						cuitFormateado = Formateador.formatearCuilConGuiones(pp.getDatosPersonales().getCuilCuit());
						dto.setCuilCuit(cuitFormateado);
					}
					dto.setNombre(pp.getDatosPersonales().getApellido() + ", " + pp.getDatosPersonales().getNombre());
					dto.setTipo(TipoPadrino.INDIVIDUAL.getValor());
				}
				if(pp.getFechaAlta() != null)
					dto.setFechaAlta(pp.getFechaAlta());
				dto.setId(pp.getId());
				dtos.add(dto);
			}
			model.put("padrinos", dtos);
			return this.verListaPadrinos(request, null, null, null, null, null);
			}
	
	/**
	 * Setea como inactivo al padrino que se quiere eliminar y se guarda el estado.
	 * 
	 * @param idPadrino
	 * @return la vista de la lista de padrinos persistidos
	 */
	@RequestMapping("/perfilPadrino/eliminarPadrino.do")
	public ModelAndView eliminarPadrino(HttpServletRequest request, @RequestParam("idPadrino") Long idPadrino) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();

		PerfilPadrino padrino = svrPadrino.obtenerPorId(idPadrino); 
		padrino.setActivo(false);
		svrPadrino.guardarPadrino(padrino);
		String cuilCuit= padrino.getEmpresa() != null ? padrino.getEmpresa().getCUIT(): padrino.getDatosPersonales().getCuilCuit();
		resul.put("mensaje", "El padrino CUIL/CUIT: " + cuilCuit + " ha sido eliminado");
		
		List<PerfilPadrino> padrinos = svrPadrino.obtenerTodos();
		List<PadrinoDTO> dtos = new ArrayList<PadrinoDTO>();
		String cuitFormateado = null;
		for (PerfilPadrino pp : padrinos)
		{
			PadrinoDTO dto = new PadrinoDTO();
			if(pp.getTipo().equals(TipoPadrino.CORPORATIVO))
			{
				if(pp.getEmpresa().getCUIT() != null)
				{
					cuitFormateado = Formateador.formatearCuilConGuiones(pp.getEmpresa().getCUIT());
					dto.setCuilCuit(cuitFormateado);
				}
				dto.setNombre(pp.getEmpresa().getDenominacion());
				dto.setTipo(TipoPadrino.CORPORATIVO.getValor());
			}
			else
			{
				if(pp.getDatosPersonales().getCuilCuit() != null)
				{
					cuitFormateado = Formateador.formatearCuilConGuiones(pp.getDatosPersonales().getCuilCuit());
					dto.setCuilCuit(cuitFormateado);
				}
				dto.setNombre(pp.getDatosPersonales().getApellido() + ", " + pp.getDatosPersonales().getNombre());
				dto.setTipo(TipoPadrino.INDIVIDUAL.getValor());
			}
			if(pp.getFechaAlta() != null)
				dto.setFechaAlta(pp.getFechaAlta());
			dto.setId(pp.getId());
			dtos.add(dto);
		}
		resul.put("padrinos", dtos);
		return this.verListaPadrinos(request, null, null, null, null, null);
	}
	
	/**
	 * @param id
	 * @return la vista con el detalle de Padrino
	 */
	@RequestMapping("/perfilPadrino/verDetallePadrinoPersonaView.do")
	public ModelAndView verDetallePadrinoPersonaView(@RequestParam("idObjeto") Long id) 
	{
		PerfilPadrino padrino = svrPadrino.obtenerPorId(id);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("persona", padrino.getDatosPersonales());
		model.put("padrino", padrino);
		return new ModelAndView("detallePerfil/detallePadrino", model);
	}


}
