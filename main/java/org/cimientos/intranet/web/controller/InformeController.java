package org.cimientos.intranet.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.ComunicadoNoRenovacion;
import org.cimientos.intranet.modelo.informe.ComunicadoPendiente;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.FichaPresentacion;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeCesacion;
import org.cimientos.intranet.modelo.informe.InformeIS1;
import org.cimientos.intranet.modelo.informe.InformeIS2;
import org.cimientos.intranet.modelo.informe.InformeIS3;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.ComunicadoNoRenovacionSrv;
import org.cimientos.intranet.servicio.ComunicadoPendienteSrv;
import org.cimientos.intranet.servicio.InformeSrv;
import org.cimientos.intranet.utils.ConstantesInformes;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.cimientos.intranet.utils.InformeUtils;
import org.cimientos.intranet.utils.paginacion.ExtendedPaginatedList;
import org.cimientos.intranet.utils.paginacion.PaginateListFactory;
import org.displaytag.tags.TableTagParameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.dto.ReporteInformeDTO;

@Controller
@RequestMapping("/informes/*")
public class InformeController extends BaseController{

	@Autowired
	private InformeSrv srvInforme;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;
	
	@Autowired
	private PaginateListFactory paginateListFactory;
	
	@Autowired
	private ComunicadoPendienteSrv srvComunicadoPendiente;
	
	@Autowired
	private ComunicadoNoRenovacionSrv srvComunicadoNoRenovacion;
	
	@RequestMapping("/informes/listaInformesCorreccion.do")
	public ModelAndView listaInformesCorreccion(HttpServletRequest req,
												@RequestParam(required= false, value="cantRows") String totalRows, 
												@RequestParam(required= false, value="tipoId") Integer tipoId,
												@RequestParam(required= false, value="tipoInforme") String tipoInforme,
												@RequestParam(required= false, value="idPadrino") Long padrinoId,
												@RequestParam(required= false, value="padrino") String padrino, 
												@RequestParam(required= false, value="idZona") Long zonaId,
												@RequestParam(required= false, value="zona") String zona,
												@RequestParam(required= false, value="idEA") Long eaId,
												@RequestParam(required= false, value="ea") String ea, 
												@RequestParam(required= false, value="idRR") Long rrId,
												@RequestParam(required= false, value="rr") String rr,
												@RequestParam(required=false, value="nombreAlumno") String nombreAlumno,
												@RequestParam(required=false, value="idCorrectora") Long correctoraId,
												@RequestParam(required=false, value="correctora") String correctora,
												@RequestParam(required= false, value="cicloId") String cicloId
												)
	{
		HttpSession session = req.getSession();
		session.setAttribute("menu", ConstantesMenu.menuCorrectora);
		Map<String, Object> resul = new HashMap<String, Object>();
		Long idCiclo = null;
		Integer idTipo = tipoId != null && tipoId.equals(0) ? null : tipoId;
		if(tipoInforme != null)
		{
			if(tipoInforme.equals("0"))
				tipoInforme = null;
		}
		
		boolean export = req.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null; 
		
		if(StringUtils.isNotBlank(cicloId)){
			idCiclo = Long.parseLong(cicloId);
		}else {
			idCiclo = srvCiclo.obtenerCicloActual().getId();
			cicloId = idCiclo.toString();
		}
		
		ExtendedPaginatedList listaPaginada = paginarInformesCorrectora(correctora, export, req, idTipo, rrId, eaId,nombreAlumno,  
				padrinoId, zonaId,  tipoInforme, idCiclo );
		
		resul.put("informes", listaPaginada);
		resul.put("size", listaPaginada.getFullListSize());
		resul.put("tipos", TipoPadrino.getListaTipos());
	    resul.put("tiposInforme", InformeUtils.getTipoInformesCorrectora());
	    resul.put("tipoId", tipoId);
	    resul.put("tipoInformeId", tipoInforme);
	    resul.put("idPadrino", padrinoId);
        resul.put("idInforme", null);
        resul.put("padrino", padrino);
        resul.put("idZona", zonaId);
        resul.put("zona", zona);
        resul.put("idEA", eaId);
        resul.put("ea", ea);
        resul.put("idRR", rrId);
        resul.put("rr", rr);
        resul.put("idCorrectora", correctoraId);
        resul.put("correctora", correctora);
        resul.put("nombreAlumno", nombreAlumno);
        resul.put("cicloId", cicloId); 
        resul.put("ciclos", srvCiclo.obtenerCiclosClonarBecas());

		return forward("/informes/listaInformesAprobar", resul);
	}
	
	
	private ExtendedPaginatedList paginarInformesCorrectora(String correctora, Boolean export, HttpServletRequest request,
			Integer tipoId, Long rrId, Long eaId,String nombreAlumno, Long padrinoId, Long zonaId,  String tipoInforme, Long idCiclo) 
	{
		
		List<ReporteInformeDTO> informes = null;
		
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		
		CicloPrograma ciclo = null;
		if (!idCiclo.equals(0L)) {
			ciclo = srvCiclo.obtenerCiclo(idCiclo);
		}
		
		int totalRows = srvInforme.obtenerCantidadInformesAAprobar(correctora, tipoId, tipoInforme, rrId, eaId, nombreAlumno, padrinoId, zonaId, ciclo);
		
		
		if(export){
			informes = srvInforme.obtenerInformesAAprobar(correctora, tipoId, tipoInforme, rrId, eaId, nombreAlumno, padrinoId, zonaId, 0,totalRows,
					  listaPaginada.getSortDirection(), listaPaginada.getSortCriterion(),ciclo);
		}
		else
			informes = srvInforme.obtenerInformesAAprobar(correctora, tipoId, tipoInforme, rrId, eaId, nombreAlumno, padrinoId, zonaId, listaPaginada.getFirstRecordIndex(),listaPaginada.getPageSize(),
													  listaPaginada.getSortDirection(), listaPaginada.getSortCriterion(),ciclo);
		
		
		listaPaginada.setList(informes);
		
		listaPaginada.setTotalNumberOfRows(totalRows);

		return listaPaginada;
	}
	
	private ExtendedPaginatedList paginarInformesActualizar(Boolean export, HttpServletRequest request,
															String nombreAlumno, String tipoInforme, PerfilEA perfilEA, Long idCiclo) 
	{
		
		List<ReporteInformeDTO> informes = null;
		
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		
		CicloPrograma ciclo = null;
		if (!idCiclo.equals(0L)) {
			ciclo = srvCiclo.obtenerCiclo(idCiclo);
		}

		int totalRows = srvInforme.obtenerCantidadInformesActualizar(tipoInforme, nombreAlumno, perfilEA,ciclo);
		
		
		if(export){
			informes = srvInforme.obtenerInformesActualizar( tipoInforme, nombreAlumno, perfilEA, 0,totalRows, listaPaginada.getSortDirection(), listaPaginada.getSortCriterion(),ciclo);
		}
		else
			informes = srvInforme.obtenerInformesActualizar(tipoInforme, nombreAlumno, perfilEA,listaPaginada.getFirstRecordIndex(),listaPaginada.getPageSize(),
													  listaPaginada.getSortDirection(), listaPaginada.getSortCriterion(),ciclo);
		
		
		listaPaginada.setList(informes);
		
		listaPaginada.setTotalNumberOfRows(totalRows);

		return listaPaginada;
	}
	
	private ExtendedPaginatedList paginarInformesASupervisar(Boolean export, HttpServletRequest request,
			Integer tipoId, PerfilRR rr, String nombreAlumno, Long padrinoId, Long zonaId,  String tipoInforme, Long idCiclo) 
	{
		
		List<ReporteInformeDTO> informes = null;
		
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		
		CicloPrograma ciclo = null;
		if (!idCiclo.equals(0L)) {
			ciclo = srvCiclo.obtenerCiclo(idCiclo);
		}

		int totalRows = srvInforme.obtenerCantidadInformesASupervisar(tipoId, tipoInforme, rr, nombreAlumno, padrinoId, zonaId, ciclo);
		
		
		if(export){
			informes = srvInforme.obtenerInformesASupervisar(tipoId, tipoInforme, rr, nombreAlumno, padrinoId, zonaId, 0,totalRows,
					  listaPaginada.getSortDirection(), listaPaginada.getSortCriterion(), ciclo);
		}
		else
			informes = srvInforme.obtenerInformesASupervisar(tipoId, tipoInforme, rr, nombreAlumno, padrinoId, zonaId, listaPaginada.getFirstRecordIndex(),listaPaginada.getPageSize(),
													  listaPaginada.getSortDirection(), listaPaginada.getSortCriterion(), ciclo);
		
		
		listaPaginada.setList(informes);
		
		listaPaginada.setTotalNumberOfRows(totalRows);

		return listaPaginada;
	}
	
	
	@RequestMapping("/informes/listaInformesConstruccion.do")
	public ModelAndView listaInformesConstruccion(HttpServletRequest req,
													@RequestParam(required= false, value="cantRows") String totalRows, 
													@RequestParam(required= false, value="tipoInforme") String tipoInforme,
													@RequestParam(required=false, value="nombreAlumno") String nombreAlumno,
													@RequestParam(required= false, value="cicloId") String cicloId,
													@RequestParam(required=false, value="mensaje") String mensaje,
													@RequestParam(required=false, value="error") String error){
		//ea - FP no se ve - IS1 estado en revision
		Map<String, Object> resul = new HashMap<String, Object>();
		PerfilEA perfilEA = getPerfilEA(req);
		Long idCiclo = null;
		List<Informe> informes = new ArrayList<Informe>();
		if(tipoInforme != null)
		{
			if(tipoInforme.equals("0"))
				tipoInforme = null;
		}
		
		boolean export = req.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null; 
		
		
		if(StringUtils.isNotBlank(cicloId)){
			idCiclo = Long.parseLong(cicloId);
		}else {
			idCiclo = srvCiclo.obtenerCicloActual().getId();
			cicloId = idCiclo.toString();
		}
		
		ExtendedPaginatedList listaPaginada = paginarInformesActualizar(export, req, nombreAlumno, tipoInforme, perfilEA, idCiclo );
		
		resul.put("informes", listaPaginada);
		resul.put("size", listaPaginada.getFullListSize());
		resul.put("tipos", TipoPadrino.getListaTipos());
	    resul.put("tiposInforme", InformeUtils.getTipoInformesCorrectora());
	    resul.put("tipoInformeId", tipoInforme);
        resul.put("idInforme", null);
        resul.put("cicloId", cicloId); 
        resul.put("ciclos", srvCiclo.obtenerCiclosClonarBecas());
        resul.put("nombreAlumno", nombreAlumno);
		if(StringUtils.isNotBlank(mensaje))
			resul.put("mensaje", mensaje);
		if(StringUtils.isNotBlank(error))
			resul.put("error", error);
		return forward("/informes/listaInformesConstruccion", resul);
	}
	
	@RequestMapping("/informes/correccion.do")
	public ModelAndView getCorreccion(@RequestParam("idInforme") Long idInforme)
	{
		ModelAndView modelAndView = null;
		Map<String, Object> resul = new HashMap<String, Object>();
		Informe informe = srvInforme.obtenerInforme(idInforme);
		if(informe.getNombre().equalsIgnoreCase(ConstantesInformes.nombreInformeFP))
		{
			FichaPresentacion fp = (FichaPresentacion) informe;
			resul.put("ficha", fp);
			modelAndView = new ModelAndView("redirect:/informeFP/correccionFPView.do?idFP=" + fp.getId());
		}
		if(informe.getNombre().equalsIgnoreCase(ConstantesInformes.nombreInformeIS1))
		{
			InformeIS1 is1 = (InformeIS1) informe;
			resul.put("informe", is1);
			modelAndView = new ModelAndView("redirect:/informeIS1/verInformeIS1CorrectoraView.do?idInformeIS1=" + is1.getId());
			
		}
		if(informe.getNombre().equalsIgnoreCase(ConstantesInformes.nombreInformeIS2))
		{
			InformeIS2 is2 = (InformeIS2) informe;
			resul.put("informe", is2);
			modelAndView = new ModelAndView("redirect:/informeIS2/correccionInformeIS2View.do?idInformeIS2=" + is2.getId());

		}
		
		if(informe.getNombre().equalsIgnoreCase(ConstantesInformes.nombreInformeIS3))
		{
			InformeIS3 is3= (InformeIS3) informe;
			resul.put("informe", is3);
			modelAndView = new ModelAndView("redirect:/informeIS3/correccionInformeIS3View.do?idInformeIS3=" + is3.getId());

			
		}
		if(informe.getNombre().equalsIgnoreCase(ConstantesInformes.nombreInformeCesacion))
		{
			InformeCesacion ic = (InformeCesacion) informe;
			modelAndView = new ModelAndView("redirect:/informeCesacion/verInformeCesacionCorrectoraView.do?idInformeCesacion=" + ic.getId());
			
		}
		return modelAndView;
	}
	
	@RequestMapping("/informes/construccion.do")
	public ModelAndView getConstruccion(@RequestParam("idInforme") Long idInforme)
	{
		ModelAndView modelAndView = null;
		Map<String, Object> resul = new HashMap<String, Object>();
		Informe informe = srvInforme.obtenerInforme(idInforme);
		
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS1))
		{
			InformeIS1 is1 = (InformeIS1) informe;
			resul.put("informe", is1);
			modelAndView = new ModelAndView("redirect:/informeIS1/verInformeIS1RevisionView.do?idInformeIS1=" + is1.getId());
			
		}
		
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS2))
		{
			InformeIS2 is2 = (InformeIS2) informe;
			resul.put("informe", is2);
			modelAndView = new ModelAndView("redirect:/informeIS2/modificarView.do?idInformeIS2=" + is2.getId());
			
		}		
		
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS3))
		{
			InformeIS3 is3 = (InformeIS3) informe;
			resul.put("informe", is3);
			modelAndView = new ModelAndView("redirect:/informeIS3/modificarView.do?idInformeIS3=" + is3.getId());
			
		}	
		
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeCesacion))
		{
			InformeCesacion ic = (InformeCesacion) informe;
			modelAndView = new ModelAndView("redirect:/informeCesacion/verInformeCesacionRevisionView.do?idInformeCesacion=" + ic.getId());
			
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/informes/supervision.do")
	public ModelAndView getSupervision(@RequestParam("idInforme") Long idInforme)
	{
		ModelAndView modelAndView = null;
		Map<String, Object> resul = new HashMap<String, Object>();
		Informe informe = srvInforme.obtenerInforme(idInforme);
		
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS1))
		{
			InformeIS1 is1 = (InformeIS1) informe;
			resul.put("informe", is1);
			modelAndView = new ModelAndView("redirect:/informeIS1/verInformeIS1SupervisorView.do?idInformeIS1=" + is1.getId());
			
		}
		
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS2))
		{
			InformeIS2 is2 = (InformeIS2) informe;
			resul.put("informe", is2);
			modelAndView = new ModelAndView("redirect:/informeIS2/supervisionView.do?idInformeIS2=" + is2.getId());
			
		}
		
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS3))
		{
			InformeIS3 is3 = (InformeIS3) informe;
			resul.put("informe", is3);
			modelAndView = new ModelAndView("redirect:/informeIS3/supervisionView.do?idInformeIS3=" + is3.getId());
			
		}
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeCesacion))
		{
			InformeCesacion ic = (InformeCesacion) informe;
			modelAndView = new ModelAndView("redirect:/informeCesacion/verInformeCesacionSupervisorView.do?idInformeCesacion=" + ic.getId());
			
		}
		return modelAndView;
	}
	
	@RequestMapping("/informes/revision.do")
	public ModelAndView getRevision(@RequestParam("idInforme") Long idInforme)
	{
		ModelAndView modelAndView = null;
		Map<String, Object> resul = new HashMap<String, Object>();
		Informe informe = srvInforme.obtenerInforme(idInforme);
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeFP))
		{
			FichaPresentacion fp = (FichaPresentacion) informe;
			resul.put("ficha", fp);
			modelAndView = new ModelAndView("redirect:/informeFP/verInformeFPRevisionView.do?idFP=" + fp.getId());
		}
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS1))
		{
			InformeIS1 is1 = (InformeIS1) informe;
			resul.put("informe", is1);
			modelAndView = new ModelAndView("redirect:/informeIS1/verInformeIS1RevisionView.do?idInformeIS1=" + is1.getId());
			
		}
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS2))
		{
			InformeIS2 is2 = (InformeIS2) informe;
			resul.put("informe", is2);
			modelAndView = new ModelAndView("redirect:/informeIS2/supervisionView.do?idInformeIS2=" + is2.getId());
			
		}
		
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS3))
		{
			InformeIS3 is3 = (InformeIS3) informe;
			resul.put("informe", is3);
			modelAndView = new ModelAndView("redirect:/informeIS3/supervisionView.do?idInformeIS3=" + is3.getId());
			
		}
		
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeCesacion))
		{
			InformeCesacion ic = (InformeCesacion) informe;
			modelAndView = new ModelAndView("redirect:/informeCesacion/verInformeCesacionRevisionView.do?idInformeCesacion=" + ic.getId());
			
		}
		return modelAndView;
	}
	
	
	
	@RequestMapping("/informes/listaInformesSupervision.do")
	public ModelAndView listaInformesSupervision(HttpServletRequest req,
												@RequestParam(required= false, value="cantRows") String totalRows, 
												@RequestParam(required= false, value="tipoId") Integer tipoId,
												@RequestParam(required= false, value="tipoInforme") String tipoInforme,
												@RequestParam(required= false, value="idPadrino") Long padrinoId,
												@RequestParam(required= false, value="padrino") String padrino, 
												@RequestParam(required= false, value="idZona") Long zonaId,
												@RequestParam(required= false, value="zona") String zona,
												@RequestParam(required= false, value="idRR") Long rrId,
												@RequestParam(required=false, value="nombreAlumno") String nombreAlumno,
												@RequestParam(required= false, value="cicloId") String cicloId)
		{
		Map<String, Object> resul = new HashMap<String, Object>();
		Integer idTipo = tipoId != null && tipoId.equals(0) ? null : tipoId;
		Long idCiclo = null;
		PerfilRR rr = getPerfilRR(req);
		if(tipoInforme != null)
		{
		if(tipoInforme.equals("0"))
		tipoInforme = null;
		}
		
		boolean export = req.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null; 
		
		if(StringUtils.isNotBlank(cicloId)){
			idCiclo = Long.parseLong(cicloId);
		}else {
			idCiclo = srvCiclo.obtenerCicloActual().getId();
			cicloId = idCiclo.toString();
		}
		
		ExtendedPaginatedList listaPaginada = paginarInformesASupervisar(export, req, idTipo, rr, nombreAlumno, padrinoId, zonaId, tipoInforme, idCiclo );
		
		resul.put("informes", listaPaginada);
		resul.put("size", listaPaginada.getFullListSize());
		resul.put("tipos", TipoPadrino.getListaTipos());
		resul.put("tiposInforme", InformeUtils.getTipoInformesCorrectora());
		resul.put("tipoId", tipoId);
		resul.put("tipoInformeId", tipoInforme);
		resul.put("idPadrino", padrinoId);
		resul.put("idInforme", null);
		resul.put("padrino", padrino);
		resul.put("idZona", zonaId);
		resul.put("zona", zona);
		resul.put("idRR", rrId);
		resul.put("rr", rr);
		resul.put("cicloId", cicloId); 
        resul.put("ciclos", srvCiclo.obtenerCiclosClonarBecas());
		resul.put("nombreAlumno", nombreAlumno);

			return forward("/informes/listaInformesRevision", resul);
		}
	
	@RequestMapping("/informes/listaInformesRevision.do")
	public ModelAndView listaInformesRevision(HttpServletRequest req){
		//RR - FP, IS1 no se ven
		Map<String, Object> resul = new HashMap<String, Object>();
		PerfilRR rr = getPerfilRR(req);
		List<Informe> informes = new ArrayList<Informe>();
		if(rr != null){
			informes = srvInforme.obtenerInformesARevisar(rr); 
		}
		resul.put("informes", informes);
		return forward("/informes/listaInformesRevision", resul);
	}
	
	@RequestMapping("/informes/verInformes.do")
	public ModelAndView verInforme(HttpSession session,@RequestParam("idInforme") Long idInforme,@RequestParam("tipoInforme") String tipoInforme){
		session.setAttribute("retorno", "rr");
		Informe i = srvInforme.obtenerInforme(idInforme);
		ModelAndView modelAndView = null;
		if (i.getNombre().equals(ConstantesInformes.nombreInformeIS3))
			modelAndView = new ModelAndView("redirect:" + i.dameUrlVer() + i.getId());
		else
			modelAndView = new ModelAndView("redirect:"+ i.dameUrlVer() + i.getBecado().getId());
		return modelAndView;
	}
	
	@RequestMapping("/informes/eliminarCRP.do")
	public ModelAndView eliminarCRP(@RequestParam ("idCRP") Long idCRP, @RequestParam ("urlRegreso") String urlRegreso){
		ModelAndView modelAndView = new ModelAndView("redirect:/reporteGeneralInformes/verReporteGeneralInformes.do");
		String mensaje = "";
		String error = "";
		ComunicadoPendiente comunicado = srvComunicadoPendiente.obtener(idCRP);
		if(!comunicado.getEstado().equals(EstadoInforme.ENVIADO)){
			srvComunicadoPendiente.eliminarComunicadoPendiente(comunicado);
			mensaje = "El Comunicado de Renovación Pendiente del becado " + comunicado.getBecado().getDatosPersonales().getApellidoNombre() + 
					" ha sido eliminado";
		}
		else
			error = "El Comunicado de Renovación Pendiente del becado " + comunicado.getBecado().getDatosPersonales().getApellidoNombre() + 
				" no se puede eliminar porque el mismo ya ha sido enviado al padrino";
		
		if(StringUtils.isNotBlank(mensaje))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?mensaje=" + mensaje);
		if(StringUtils.isNotBlank(error))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?error=" + error);
		
		return modelAndView;
	}
	
	@RequestMapping("/informes/eliminarCNR.do")
	public ModelAndView eliminarCNR(@RequestParam ("idCNR") Long idCNR, @RequestParam ("urlRegreso") String urlRegreso){
		ModelAndView modelAndView = new ModelAndView("redirect:/reporteGeneralInformes/verReporteGeneralInformes.do");
		String mensaje = "";
		String error = "";
		ComunicadoNoRenovacion comunicado = srvComunicadoNoRenovacion.obtener(idCNR);
		if(!comunicado.getEstado().equals(EstadoInforme.ENVIADO)){
			srvComunicadoNoRenovacion.eliminarComunicadoNoRenovacion(comunicado);
			mensaje = "El Comunicado de No Renovación del becado " + comunicado.getBecado().getDatosPersonales().getApellidoNombre() + 
					" ha sido eliminado";
		}
		else
			error = "El Comunicado de No Renovación del becado " + comunicado.getBecado().getDatosPersonales().getApellidoNombre() + 
				" no se puede eliminar porque el mismo ya ha sido enviado al padrino";
		
		if(StringUtils.isNotBlank(mensaje))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?mensaje=" + mensaje);
		if(StringUtils.isNotBlank(error))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?error=" + error);
		
		return modelAndView;
	}
	
	@InitBinder
	public void initBinder(HttpServletRequest request,WebDataBinder binder) {
		
	    // custom date binding
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	    
	}
	
}
