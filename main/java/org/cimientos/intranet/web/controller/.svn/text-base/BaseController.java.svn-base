package org.cimientos.intranet.web.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.json.JSONArray;

import org.cimientos.intranet.execption.CimientosExceptionHandler;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.persona.Persona;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

/**
 * BaseController	
 * @author Juan Irungaray
 *
 */
@Controller
public class BaseController implements ServletContextAware {

	public static final String PERSONA_LOGUEADA = "persona_logueada";
	
	
	private ServletContext servletContext;
	
	private static Properties props;

	protected ModelAndView forward(String view, Map<String, Object> model){
		
		model.put("body", "/WEB-INF/pages/"+view+".jsp");
		return new ModelAndView("includes/Template", model);
	}
	
	protected ModelAndView forward(String url, Long idPostulante, String tipoDato, Map<String, Object> model){
		return new ModelAndView("includes/Template", model);		
	}
	
	protected ModelAndView forward(String view){
		Map<String, Object> model = new HashMap<String, Object>();
		
		return forward(view, model);
	}
	
	
	protected ModelAndView forwardHtml(String view, Map<String, Object> model){
		model.put("body", "/WEB-INF/pages/"+view+".html");
		return new ModelAndView("includes/Template", model);
	}
	
	protected ModelAndView forwardHtml(String view){
		Map<String, Object> model = new HashMap<String, Object>();
		return forwardHtml(view, model);
	}
	
	
	protected Map<String, Object> createModel(){
		return new HashMap<String, Object>();
	}
	
	protected String getCurrentLoggedUserName(){
		return SecurityContextHolder.getContext().getAuthentication().getName(); 
	}
	/**
	 * Este metodo es el que arma el objeto json, para la carga de la tabla de jquery , utilzando el taglib <s:table>
	 * 
	 * @param view String 
	 * @param model Map
	 * @param nameListObject(Nombre de la lista de objetos que esta dentro del map)
	 * @return
	 */
	protected ModelAndView forwardJqueryTable(String view, Map<String, Object> model,String nameListObject){
		List<Object> list = (List<Object>)model.get(nameListObject);
		Iterator<Object> iteList = list.iterator();
		List listJsonObjects = new ArrayList();
		while (iteList.hasNext()) {
			Object object = (Object) iteList.next();
			listJsonObjects.addAll(JSONArray.fromObject(object));
			
		}

		model.put("json",listJsonObjects);
	
		return forward(view, model);
	}
	
	/**
	 * Retorna una vista de la pagina dependiendo si es popup o no.
	 * 
	 * @param view
	 * @param model
	 * @param popup
	 * @return
	 */
	protected ModelAndView forward(String view, Map<String, Object> model, boolean popup){
		model.put("body", "/WEB-INF/pages/"+view+".jsp");
		if(popup){
			return new ModelAndView("includes/TemplatePopUp", model);
		}else{
			return new ModelAndView("includes/Template", model);
		}
	}

	
	
	/**
	 *  Guardar Reporte Jasper
	 * @param nombreArchivoPDF nombre del archivo (Cuando se coloca el nombre, se debe poner con la extension tambien )
	 * @param nombreArchivoJasper nombre del archivo compilado de Jasper(el compilado tiene que estar en /WEB-INF/jasperTemplate/compile)
	 * @param collectionBeans lista de objetos que se tienen que  cargar mediante beans
	 * @param parametros HashMap con los valores que se pasan por parametro 
	 * @since 23-dic-2010
	 * @author cfigueroa
	 */
	public Boolean guardarReporteJasper(String nombreArchivo, String nombreArchivoJasper, Boolean ok,List<?> collectionBeans,Map<String,Object> parametros){
		try {
			JRBeanCollectionDataSource ds = new JRBeanCollectionDataSource(collectionBeans);
			InputStream is = servletContext.getResourceAsStream("WEB-INF/jasperTemplates/compile/"+ nombreArchivoJasper);
			JasperReport report = (JasperReport) JRLoader.loadObject(is);
			JasperPrint jasperPrint = JasperFillManager.fillReport(report, parametros,ds);
			JasperExportManager.exportReportToPdfFile(jasperPrint, getProps().getProperty("base.path.temp") +nombreArchivo);  
			ok = true;
		} 
		catch (JRException e) 
		{
			ok = false;
			throw new CimientosExceptionHandler("Error de Jasper " + e.getMessage(),e);
		}
		catch (Exception e) 
		{
			ok = false;
			throw new CimientosExceptionHandler("Error de Jasper " + e.getMessage(),e);
		}
		return ok;
	}
	
	/**
	 * Exportar Reporte Jasper
	 *
	 * @param response the response 
	 * @param collectionBeans Collection de Beans para la generacion del reporte
	 * @param nombreArchivo nombre de salida del archivo(Cuando se coloca el nombre, se debe poner con la extension tambien ) 
	 * @param nombreBeanXml Nombre del bean configurado en el archivo jasper-views.xml
	 * @return the model and view 
	 * @since 27-dic-2010
	 * @author cfigueroa
	 */
	public ModelAndView exportarReporteJasper(HttpServletResponse response,Collection<?> collectionBeans,
											String nombreArchivo,String nombreBeanXml){
		HashMap<String,Object> map = new HashMap<String, Object>();
		JRDataSource beanCollectionDataSource =  new JRBeanCollectionDataSource(collectionBeans);
		response.setHeader("Content-Disposition","attachment; filename=\""+nombreArchivo);
		map.put("dataSource", beanCollectionDataSource);
		return new ModelAndView(nombreBeanXml, map);
	}
	
	@Override
	public void setServletContext(ServletContext context) {
		this.servletContext = context;		
	}
	
	/**
	 * @param request
	 * @return
	 */
	protected PerfilEA getPerfilEA(HttpServletRequest request) {
		Persona persona = obtenerPersona(request);
		return persona.getPerfilEA();
	}
	
	protected PerfilRR getPerfilRR(HttpServletRequest request) {
		Persona persona = obtenerPersona(request);
		return persona.getPerfilRR();
	}
	
	protected PerfilTS getPerfilTS(HttpServletRequest request) {
		Persona persona = obtenerPersona(request);
		return persona.getPerfilTS();
	}
	
	/**
	 * Recupera la Persona del usuario que esta logueado
	 */
	protected Persona obtenerPersona(HttpServletRequest request) {
		return  (Persona) request.getSession().getAttribute(PERSONA_LOGUEADA);
	}

	public ServletContext getServletContext() {
		return servletContext;
	}
	
	
	public void setProps(Properties props) {
		BaseController.props = props;
	}

	
	public static Properties getProps() {
		return props;
	}
}