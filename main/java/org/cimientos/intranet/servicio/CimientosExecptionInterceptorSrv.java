package org.cimientos.intranet.servicio;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

@Service
public class CimientosExecptionInterceptorSrv  implements HandlerExceptionResolver {
	private Logger logger = Logger.getLogger(CimientosExecptionInterceptorSrv.class);
	
	@Override
	public ModelAndView resolveException(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception exc) {
		//System.out.println("Entro a la excepcion");	
		exc.printStackTrace();
		Map<String, String> model = new HashMap<String, String>();
		model.put("body", "/WEB-INF/pages/Exceptions/error.jsp");
		String error = "";
      error= "se produjo el siguiente error: " + exc.getMessage().toString() + " por favor consulte con el equipo t�cnico.";
		//error = "Se produjo un error inesperado, consulte con equipo tecnico";		
		model.put("message", error);
		logger.error("error", exc);
		return new ModelAndView("includes/Template", model);
	}
		
}
