package org.cimientos.intranet.modelo.perfilEA;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.PrintWriter;
import java.util.ArrayList;
/**
 * Servlet implementation class BecadoController
 */
public class BecadoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BecadoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType( "text/html; charset=iso-8859-1" );
		PrintWriter out = response.getWriter();

		// Obtengo los datos de la peticion
		String id = request.getParameter("id");

		//ArrayList<Usuario> listaUsuario = UsuarioBD.obtenerDatosUsuario(Long.parseLong(id));
		//for (Usuario u : listaUsuario){
        // Compruebo que los campos del formulario tienen datos para añadir a la tabla		
		//out.println("<font color=blue>"+u.getNombre()+" "+ u.getApellido());			
		//out.println("<br>"+  u.getTelefono() +"<br>");				
		//out.println(u.getMovil() +"<br>");
		//out.println("<a href=mailto:"+u.getMail()+">"+u.getMail()+"</a>");
       // }
		out.println("<br>"+  "hola" +"<br>");
	}

}
