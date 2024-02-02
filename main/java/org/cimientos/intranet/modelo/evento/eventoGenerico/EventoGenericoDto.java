package org.cimientos.intranet.modelo.evento.eventoGenerico;

import java.sql.*;
import java.util.ArrayList;
import org.cimientos.intranet.web.controller.Conexion;

public class EventoGenericoDto {
	
	private String ciclo;
	private String rr;
	private String ea;
	private String lugarEncuentro;
	private String zona;
	private String tipoEvento;
	private String contenidos;
	private String otrosContenidos;
	private String evaluacion;
	
	public EventoGenericoDto() {
		super();
	}

	public EventoGenericoDto(String ciclo, String rr, String ea,
			String lugarEncuentro, String zona, String tipoEvento,
			String contenidos, String otrosContenidos, String evaluacion) {
		super();
		this.ciclo = ciclo;
		this.rr = rr;
		this.ea = ea;
		this.lugarEncuentro = lugarEncuentro;
		this.zona = zona;
		this.tipoEvento = tipoEvento;
		this.contenidos = contenidos;
		this.otrosContenidos = otrosContenidos;
		this.evaluacion = evaluacion;
	}

	public String getCiclo() {
		return ciclo;
	}

	public void setCiclo(String ciclo) {
		this.ciclo = ciclo;
	}

	public String getRr() {
		return rr;
	}

	public void setRr(String rr) {
		this.rr = rr;
	}

	public String getEa() {
		return ea;
	}

	public void setEa(String ea) {
		this.ea = ea;
	}

	public String getLugarEncuentro() {
		return lugarEncuentro;
	}

	public void setLugarEncuentro(String lugarEncuentro) {
		this.lugarEncuentro = lugarEncuentro;
	}

	public String getZona() {
		return zona;
	}

	public void setZona(String zona) {
		this.zona = zona;
	}

	public String getTipoEvento() {
		return tipoEvento;
	}

	public void setTipoEvento(String tipoEvento) {
		this.tipoEvento = tipoEvento;
	}

	public String getContenidos() {
		return contenidos;
	}

	public void setContenidos(String contenidos) {
		this.contenidos = contenidos;
	}

	public String getOtrosContenidos() {
		return otrosContenidos;
	}

	public void setOtrosContenidos(String otrosContenidos) {
		this.otrosContenidos = otrosContenidos;
	}

	public String getEvaluacion() {
		return evaluacion;
	}

	public void setEvaluacion(String evaluacion) {
		this.evaluacion = evaluacion;
	}
	
	//Metodo utilizado para obtener todos los productos de nuestra base de datos

    public static synchronized ArrayList<EventoGenericoDto> obtenerListado() {
        //El array que contendra todos nuestros productos
        ArrayList<EventoGenericoDto> lista = new ArrayList<EventoGenericoDto>();
        Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        try {
            //Nombre del procedimiento almacenado
            String call = "Select persona.nombre,persona.apellido, escuela.nombre, LEFT(fecha_evento,4) as ciclo, " +
            				"zona_cimientos.nombre, " +
            				" if(tipo_evento=1,'Taller materias previas', "+
							" if(tipo_evento=2,'Taller complementario', "+
							" if(tipo_evento=3,'Entrevista adicional', "+
							" if(tipo_evento=4,'Encuentro de padres', "+
							" if(tipo_evento=5,'Encuentro de padrinos', "+
							" if(tipo_evento=6,'Otros', "+
							" if(tipo_evento=7,'Articulación escuela',''))))))) as TE," +
							" if(evaluacion_encuentro=1,'Excelente',"+
							" if(evaluacion_encuentro=2,'Muy bueno',"+
							" if(evaluacion_encuentro=3,'Bueno',"+
							" if(evaluacion_encuentro=4,'Regular',"+
							" if(evaluacion_encuentro=5,'Malo',''))))) as EE, "+ 
							" (select concat_ws(' ',persona.nombre,persona.apellido) "+
							" from persona where persona.perfilrr=perfilea.rr_id_perfil) as RR," +
							" evento_generico.* ,perfilea.* " + 							 							
            				" from evento_generico ,perfilea, persona, escuela, zona_cimientos "+
            				" where evento_generico.ea=perfilea.id_perfilea "+
            				" and zona_cimientos.id=escuela.zona_cimientos"+
            				" and evento_generico.lugar_encuentro=escuela.id "+
            				" and perfilea.datos_personales=persona.id"+
            				" order by ea ";
            
            cn = Conexion.getConexion();
            cl = cn.prepareCall(call);
            //La sentencia lo almacenamos en un resulset
            rs = cl.executeQuery();
            //Consultamos si hay datos para recorrerlo
            //e insertarlo en nuestro array
            while (rs.next()) {
                EventoGenericoDto ev = new EventoGenericoDto();
                //Obtenemos los valores de la consulta y creamos
                //nuestro objeto producto                
                ev.setCiclo(rs.getString(4));                
                ev.setEa(rs.getString(1)+" "+rs.getString(2));
                ev.setZona(rs.getString(5));
                ev.setLugarEncuentro(rs.getString(3));
                ev.setTipoEvento(rs.getString(6));
                ev.setRr(rs.getString(8));
                ev.setOtrosContenidos(rs.getString(17));
                ev.setEvaluacion(rs.getString(7));

                // busco contenidos abordados
                int vueltas=0;
                Connection cn0 = null;
                CallableStatement cl0 = null;
                ResultSet rs0 = null;
                try {
                    //Nombre del procedimiento almacenado
                    String call0 = "{CALL SP_EventoGenerico2(?)}";
                    cn0 = Conexion.getConexion();
                    cl0 = cn0.prepareCall(call0);
                    //cl0.setLong(1, idevento);
                    cl0.setString(1,rs.getString(9));
                    //La sentencia lo almacenamos en un resulset
                    rs0 = cl0.executeQuery();
                    //Consultamos si hay datos para recorrerlo
                    //e insertarlo en nuestro array
                    String bucleContenidos;
                    bucleContenidos="";
                    String contenidoBBDD="";
                    while (rs0.next()) {
                    	if (rs0.getString(1).equals("0")){
                    		contenidoBBDD="Alumno: Planificación del estudio";
                    	}
                    	if (rs0.getString(1).equals("1")){
                    		contenidoBBDD="Alumno: Estrategias de aprendizaje";
                    	}
                    	if (rs0.getString(1).equals("2")){
                    		contenidoBBDD="Alumno: Criterios de permanencia PBE";
                    	}
                    	if (rs0.getString(1).equals("3")){
                    		contenidoBBDD="Alumno: Planificación Proyecto de Vida";
                    	}
                    	if (rs0.getString(1).equals("4")){
                    		contenidoBBDD="Alumno: Planificación Tiempo Libre";
                    	}
                    	if (rs0.getString(1).equals("5")){
                    		contenidoBBDD="Alumno: Autonomía";
                    	}
                    	if (rs0.getString(1).equals("6")){
                    		contenidoBBDD="Alumno: Responsabilidad";
                    	}
                    	if (rs0.getString(1).equals("7")){
                    		contenidoBBDD="Alumno: Compromiso del becado";
                    	}
                    	if (rs0.getString(1).equals("8")){
                    		contenidoBBDD="RA: Compromiso del RA";
                    	}
                    	if (rs0.getString(1).equals("9")){
                    		contenidoBBDD="RA: Rol de RA, apoyo y orientación";
                    	}
                    	if (rs0.getString(1).equals("10")){
                    		contenidoBBDD="RA: Herramientas para favorecer la terminalidad";
                    	}
                    	if (rs0.getString(1).equals("11")){
                    		contenidoBBDD="RA: Relación escuela y familia";
                    	}
                    	if (rs0.getString(1).equals("12")){
                    		contenidoBBDD="Escuela: Desempeño escolar";
                    	}
                    	if (rs0.getString(1).equals("13")){
                    		contenidoBBDD="Escuela: Permanencia de los alumnos";
                    	}
                    	if (rs0.getString(1).equals("14")){
                    		contenidoBBDD="Escuela: Promoción de materias";
                    	}
                    	if (rs0.getString(1).equals("15")){
                    		contenidoBBDD="Escuela: Repitencia";
                    	}
                    	if (rs0.getString(1).equals("16")){
                    		contenidoBBDD="Escuela: Egreso efectivo y terminalidad del secundario";
                    	}
                    	if (rs0.getString(1).equals("17")){
                    		contenidoBBDD="Escuela: Diseño y Planificación de acciones conjuntas";
                    	}
                    	if (rs0.getString(1).equals("18")){
                    		contenidoBBDD="Escuela: Implementación de estrategia/s";
                    	}
                    	if (rs0.getString(1).equals("19")){
                    		contenidoBBDD="Escuela: Reunión con directivos/docentes";
                    	}
                    	if (rs0.getString(1).equals("20")){
                    		contenidoBBDD="Escuela: Reunión con equipo de orientación";
                    	}
                    	if (rs0.getString(1).equals("21")){
                    		contenidoBBDD="Escuela: Observación de clases/taller";
                    	}
                    	if (rs0.getString(1).equals("22")){
                    		contenidoBBDD="Escuela: Capacitación";
                    	}
                    	if (rs0.getString(1).equals("23")){
                    		contenidoBBDD="Escuela: Indicadores de rendimiento académico";
                    	}
                    	if (rs0.getString(1).equals("24")){
                    		contenidoBBDD="Escuela: Jornada institucional";
                    	}
                    	
                    	if(vueltas==0){
                    		
                    		
                    		bucleContenidos=contenidoBBDD+" - ";
                    	}
                    	else{
                    		bucleContenidos=bucleContenidos+contenidoBBDD+" - ";
                    	}
                    	
                    	                   	
                    	vueltas++;
                    }
                    ////System.out.println(bucleContenidos);
                    ev.setContenidos(bucleContenidos);
                    ////System.out.println(eg.getContenido());
                    Conexion.cerrarCall(cl0);
                    Conexion.cerrarConexion(cn0);
                } catch (SQLException e) {
                    e.printStackTrace();
                    Conexion.cerrarCall(cl0);
                    Conexion.cerrarConexion(cn0);
                } catch (Exception e) {
                    e.printStackTrace();
                    Conexion.cerrarCall(cl0);
                    Conexion.cerrarConexion(cn0);
                }
                //Lo adicionamos a nuestra lista
                lista.add(ev);
            }
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }
        return lista;
    }
	
	
	

}
