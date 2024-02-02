package org.cimientos.intranet.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.BancoSrv;
import org.cimientos.intranet.servicio.LocalidadSrv;
import org.cimientos.intranet.servicio.ResponsableSrv;
import org.cimientos.intranet.servicio.SucursalBancoSrv;
import org.cimientos.intranet.utils.EstadoCivilSrv;
import org.cimientos.intranet.utils.TipoAfypSrv;
import org.cimientos.intranet.utils.TipoDniSrv;
import org.cimientos.intranet.utils.TipoVinculoSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.EstadoCivil;
import com.cimientos.intranet.enumerativos.TipoAfyp;
import com.cimientos.intranet.enumerativos.TipoDni;
import com.cimientos.intranet.enumerativos.Vinculo;

/**
 * @author msagarduy
 * 
 */
@Controller
@RequestMapping("/responsable/*")
public class ResponsableController extends BaseController{

	@Autowired
	private ResponsableSrv srvResponsable;
	
	@Autowired
	private AlumnoSrv srvAlumno;

	@Autowired
	private EstadoCivilSrv srvEstadoCivil;
	
	@Autowired
	private TipoAfypSrv srvTipoAfyp;
	
	@Autowired
	private TipoDniSrv srvTipoDni;
	
	@Autowired
	private TipoVinculoSrv srvVinculo;	
	
	@Autowired
	private LocalidadSrv srvLocalidad;
		
	@Autowired
	private BancoSrv srvBanco;
	
	@Autowired
	private SucursalBancoSrv srvSucursalBanco;
	
	
	@RequestMapping("/responsable/altaResponsable.do")
	public ModelAndView agregarResponsable()
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		ResponsableAdulto responsable = new ResponsableAdulto();
		resul.put("responsable", responsable);
		resul.put("alumnos", srvAlumno.obtenerTodos());
		resul.put("afips", srvTipoAfyp.obtenerTiposAfip());
		resul.put("vinculos", srvVinculo.obtenerVinculos());
		resul.put("dnis", srvTipoDni.obtenerTiposDnis());
		resul.put("estados", srvEstadoCivil.obtenerEstadosCiviles());
		resul.put("bancos", srvBanco.obtenerTodos());
		resul.put("sucursales", srvSucursalBanco.obtenerTodos());
		resul.put("localidades", srvLocalidad.obtenerTodos());
		
		return forward("/responsable/altaResponsable", resul);
	}
	
	@RequestMapping("/responsable/guardarResponsable.do")
	public ModelAndView guardarResponsable(@ModelAttribute("responsable") ResponsableAdulto responsable) 
	throws ParseException, IOException 
	{
		
		Map<String, Object> resul = new HashMap<String, Object>();
		if (srvResponsable.obtenerPorNombreId(String.valueOf(responsable.getId()), responsable.getNombre())){
			resul.put("error", "Ya existe un responsable con ese nombre");
			resul.put("alumnos", srvAlumno.obtenerTodos());
			resul.put("afips", srvTipoAfyp.obtenerTiposAfip());
			resul.put("vinculos", srvVinculo.obtenerVinculos());
			resul.put("dnis", srvTipoDni.obtenerTiposDnis());
			resul.put("estados", srvEstadoCivil.obtenerEstadosCiviles());
			resul.put("localidades", srvLocalidad.obtenerTodos());
			resul.put("bancos", srvBanco.obtenerTodos());
			resul.put("sucursales", srvSucursalBanco.obtenerTodos());
	
			return forward("/responsable/altaResponsable", resul);

		}
		else 
		{
			ResponsableAdulto responsableObj = cargarResponsable(responsable);
			srvResponsable.agregarResponsable(responsableObj);
			resul.put("responsables", srvResponsable.obtenerTodos());
	
			return forward("/responsable/listaResponsables", resul);
		}
		
	}
	
	
	
	@RequestMapping("/responsable/listaResponsables.do")
	public ModelAndView listaResponsables() {
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("responsables", srvResponsable.obtenerTodos());
		
		return forward("/responsable/listaResponsables", resul);
	}
	

	private ResponsableAdulto cargarResponsable(ResponsableAdulto responsable) throws ParseException, IOException 

	{
		ResponsableAdulto responsableObj = null;
		if (responsable.getId() == null)
		{
			responsableObj = new ResponsableAdulto();
			responsableObj.setActivo(true);
			responsableObj.setFechaNacimiento(responsable.getFechaNacimiento());

		} 
		else 
		{
			responsableObj = srvResponsable.obtenerPorId(responsable.getId());
			responsableObj.setFechaNacimiento(responsableObj.getFechaNacimiento());
		}
		
		responsableObj.setNombre(responsable.getNombre());
		responsableObj.setApellido(responsable.getApellido());
		responsableObj.setCelular(responsable.getCelular());
		responsableObj.setBanco(responsable.getBanco());
		responsableObj.setCuilCuit(responsable.getCuilCuit());
		responsableObj.setDireccion(responsable.getDireccion());
		responsableObj.setDni(responsable.getDni());
		responsableObj.setIdAlumno(responsable.getIdAlumno());
		responsableObj.setIdEstadoCivil(responsable.getIdEstadoCivil());
		responsableObj.setIdTipoAfyp(responsable.getIdTipoAfyp());
		responsableObj.setIdTipoDni(responsable.getIdTipoDni());
		responsableObj.setIdVinculo(responsable.getIdVinculo());
		responsableObj.setIngresos(responsable.getIngresos());
		responsableObj.setIdLocalidad(responsable.getIdLocalidad());
		responsableObj.setMail(responsable.getMail());
		responsableObj.setNroCuenta(responsable.getNroCuenta());
		responsableObj.setObservaciones(responsable.getObservaciones());
		responsableObj.setSexo(responsable.getSexo());
		responsableObj.setSucursalBanco(responsable.getSucursalBanco());
		responsableObj.setTelefono(responsable.getTelefono());
		responsableObj.setTelefono1(responsable.getTelefono1());
		responsableObj.setTelefono2(responsable.getTelefono2());
		
		return responsableObj;
	}

	@RequestMapping("/responsable/modificarResponsable.do")
	public ModelAndView modificarResponsable(@RequestParam("idResponsable") Long idResponsable) throws IOException
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		ResponsableAdulto responsable = srvResponsable.obtenerPorId(idResponsable);
		resul.put("responsable", responsable);
		resul.put("alumnos", srvAlumno.obtenerTodos());
		resul.put("afips", srvTipoAfyp.obtenerTiposAfip());
		resul.put("vinculos", srvVinculo.obtenerVinculos());
		resul.put("dnis", srvTipoDni.obtenerTiposDnis());
		resul.put("estados", srvEstadoCivil.obtenerEstadosCiviles());
		resul.put("bancos", srvBanco.obtenerTodos());
		resul.put("sucursales", srvSucursalBanco.obtenerTodos());
		resul.put("localidades", srvLocalidad.obtenerTodos());
	
		return forward("/responsable/altaResponsable", resul);
	}
	
	@RequestMapping("/responsable/eliminarResponsable.do")
	public ModelAndView eliminarResponsable(@RequestParam("idResponsable") Long idResponsable) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		ResponsableAdulto responsable = srvResponsable.obtenerPorId(idResponsable); 
		responsable.setActivo(false);
		srvResponsable.agregarResponsable(responsable);
		resul.put("responsables", srvResponsable.obtenerTodos());
		
		resul.put("mensaje", "El responsable " + responsable.getNombre() + " ha sido eliminado");
		return forward("/responsable/listaResponsables", resul);
	}
	
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		if (binder.getTarget()!=null && !binder.getTarget().equals("")) 
		{
			binder.setDisallowedFields(new String[] { "idEstadoCivil", "idAlumno", "sucursal",
													  "banco", "idVinculo", "idTipoDni", "idTipoAfyp", 
													  "idLocalidad", "idBarrio"});
			if ((binder.getTarget() instanceof ResponsableAdulto)) {
				ResponsableAdulto responsable = (ResponsableAdulto) binder.getTarget();	
				Integer idEstadoCivilId = null;
				Long idAlum = null;
				Long idBanco = null;
				Integer idVinc = null;
				Long idSucursal = null;
				Integer idTipoAf = null;
				Integer idTipoDNI = null;
				String idLoc = null;
				
				try 
				{
					idEstadoCivilId = Integer.parseInt(request.getParameter("idEstadoCivil"));
					idAlum = Long.parseLong(request.getParameter("idAlumno"));
					idBanco = Long.parseLong(request.getParameter("banco"));
					idLoc = (request.getParameter("idLocalidad"));
					idVinc = Integer.parseInt(request.getParameter("idVinculo"));
					idSucursal = Long.parseLong(request.getParameter("sucursal"));
					idTipoAf = Integer.parseInt(request.getParameter("idTipoAfyp"));
					idTipoDNI = Integer.parseInt(request.getParameter("idTipoDni"));
				} 
				catch (Exception e) 
				{
				
				}
				if(idEstadoCivilId != null)
				{
					EstadoCivil estadoCivil = EstadoCivil.getEstadoCivil(idEstadoCivilId);
					responsable.setIdEstadoCivil(estadoCivil);
				}
				if(idAlum != null)
				{
					PerfilAlumno becado = srvAlumno.obtenerAlumno(idAlum);
					responsable.setIdAlumno(becado);
				}
				if(idBanco != null)
				{
					Banco banco = srvBanco.obtenerBanco(idBanco);
					responsable.setBanco(banco);
				}
				if(idSucursal != null)
				{	
					SucursalBanco sucursal = srvSucursalBanco.obtenerSucursalBanco(idSucursal);
					responsable.setSucursalBanco(sucursal);
				}
				if(idVinc != null)
				{
					Vinculo vinculo = Vinculo.getVinculo(idVinc);
					responsable.setIdVinculo(vinculo);
				}
				if(idTipoDNI != null)
				{
					TipoDni tipoDni = TipoDni.getTipoDni(idTipoDNI);
					responsable.setIdTipoDni(tipoDni);
				}
				if(idTipoAf != null)
				{
					TipoAfyp tipoAfyp = TipoAfyp.getTipoAfyp(idTipoAf);
					responsable.setIdTipoAfyp(tipoAfyp);
				}
				if(idLoc != null)
				{
					Localidad localidad = srvLocalidad.getLocalidadPorNombre(idLoc);
					responsable.setIdLocalidad(localidad);
				}
			
					responsable.setActivo(true);
				}
			}
		}
}