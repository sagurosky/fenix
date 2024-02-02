package org.cimientos.intranet.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import org.apache.log4j.Logger;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.evento.Evento;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.Turno;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.modelo.usuario.Usuario;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;


/**
 * GenteUtils
 * 
 * @author Juan Irungaray
 * 
 */
public class RandomUtils {

	private static final BeanFactory springContext = new XmlBeanFactory(
			new FileSystemResource("src/main/webapp/WEB-INF/spring/main.xml"));
	private static Logger logger = Logger.getLogger(RandomUtils.class);

	private static final String[] nombres = { "Juan", "Pablo", "Pedro",
			"Rodrigo", "Manuel", "Martin", "Hernan", "Roberto", "Luis",
			"Carlos", "Joaquin", "Leandro", "Leonardo", "Emiliano", "Marcos",
			"Antonio", "Felipe", "Jorge", "Julian" , "Maria" , "Carmen" , "Sol"
			, "Fernanda" , "Carla" , "David" , "Andres" , "Agustina" };
	
	private static final String[] barrios = { "Berisso", "Ensenada", "Tolosa",
		"Lanus", "Lanus Este", "Madero", "La Matanza" };
	private static final int barriosLenght = barrios.length;
	
	private static final String[] materias = { "Lengua", "Matematica", "Biologia",
		"Letras", "Filosofia", "Historia", "Ingles", "Catequesis", "Quimica", "Fisica", "Bioquimica", "Computacion" };
	private static final int materiasLenght = materias.length;
	
	public static final String[] periodos = { "Enero", "Febrero", "Marzo",
		"Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
	private static final int periodosLenght = periodos.length;

	private static final int nombreLenght = nombres.length;
	
	private static final String[] desempeniosEscolares = { "MUY BUENO", "BUENO", "REGULAR", "MALO" };
	private static final int desempeniosEscolaresLenght = desempeniosEscolares.length;    

	private static final String[] motivoCesacion = { "mal comportamiento", 
		"le pego a la maestra", "no aplican las notas" };
	
	private static final Integer[] estadosPagos = { 1, 2, 3, 4 };
	private static final int estadosPagosLenght = estadosPagos.length;    

	private static final List<Evento> tipoEvento = llenarListaEventos();
	private static final int tipoEventoLenght = tipoEvento.size();
	
	private static final List<Escuela> escuelas = llenarListaEscuelas();

	private static final String[] localidades = {"La Plata", "Capital Federal", 
		"Chivilcoy", "Rosario", "Campana", "Necochea", "Olavarria", "Mar Del Plata", "Bariloche", "Tucuman Capital"};
	
	private static final String[] bancos = {"Provincia", "Nacion", 
		"HSBC", "Santander Rio", "Frances", "Galicia", "Pampa", "Citi"};
	
	private static final int motivoLenght = motivoCesacion.length;    

	private static final String[] apellidos = { "Juanes", "Perez", "Lopez",
			"Galvez", "Rodriguez", "Martin", "Hernandez", "Lanus",
			"Avellaneda", "Gomez", "Ruiz", "Jackson", "Stevens", "Castro",
			"Marquez", "Garcia", "Simmons", "Jhonson", "Smith" , "Diaz" ,
			"Dias" , "Lorca" , "Clemmens" , "Caceres" , "Palermo", "Juanes" , "Paez"};
	private static final int apellidoLenght = apellidos.length;

	private static final String[] correos = { "gmail.com", "hotmail.com",
			"correo.com", "live.com", "yahoo.com" };
	private static final int correoLenght = correos.length;

	private static final List<Usuario> owners = llenarListaOwners();
	private static final int ownersLenght = owners.size();
	
	public static final String[] materiasBasicas = { "Educación plástica-artística",
		"Biología", 
		"Ciencias Naturales",
		"Ciencias Sociales",
		"Informática",
		"Construcción de ciudadanía / Educación cívica",
		"Contabilidad / Educación práctica contable",
		"Educación física / corporal",
		"Física",
		"Físico-química",
		"Geografía",
		"Historia",
		"Inglés",
		"Lengua / Literatura",
		"Matemática",
		"Música",
		"Pasantía / Práctica profesional",
		"Química",
		"Salud y Adolescencia",
		"Tecnología / TIC"
};
	
	private static final Random random = new Random();
	
	
	public static String obtenerNombreAlAzar() {
		if (random.nextBoolean()) {
			return nombres[random.nextInt(nombreLenght)];
		} else {
			return nombres[random.nextInt(nombreLenght)] + " "
					+ nombres[random.nextInt(nombreLenght)];
		}
	}
	
	public static Integer obtenerEstadosPagosAlAzar() {
		return estadosPagos[random.nextInt(estadosPagosLenght)];
		
	}

	public static String obtenerMotivoCesacionAlAzar() {
		if (random.nextBoolean()) {
			return motivoCesacion[random.nextInt(motivoLenght)];
		} else {
			return motivoCesacion[random.nextInt(motivoLenght)] + " "
					+ motivoCesacion[random.nextInt(motivoLenght)];
		}
	}
	
	public static String obtenerDesmpeniosEscolaresAlAzar() {
		if (random.nextBoolean()) {
			return desempeniosEscolares[random.nextInt(desempeniosEscolaresLenght)];
		} else {
			return desempeniosEscolares[random.nextInt(desempeniosEscolaresLenght)];
			}
	}

	
	public static String obtenerApellidoAlAzar() {
		if (random.nextBoolean()) {
			return apellidos[random.nextInt(apellidoLenght)];
		} else {
			return apellidos[random.nextInt(apellidoLenght)] + " "
					+ apellidos[random.nextInt(apellidoLenght)];
		}
	}

	public static String obtenerNombrePeriodosAlAzar() {
		if (random.nextBoolean()) {
			return periodos[random.nextInt(periodosLenght)];
		} else {
			return periodos[random.nextInt(periodosLenght)] + " "
					+ periodos[random.nextInt(periodosLenght)];
		}
	}
	
	public static String obtenerBarriosAlAzar() {
		if (random.nextBoolean()) {
			return barrios[random.nextInt(barriosLenght)];
		} else {
			return barrios[random.nextInt(barriosLenght)] + " "
					+ barrios[random.nextInt(barriosLenght)];
		}
	}
	
	public static String obtenerNombreMateriasAlAzar() {
		if (random.nextBoolean()) {
			return materias[random.nextInt(materias.length)] + random.nextInt(103);
		} else {
			return materias[random.nextInt(materias.length)] + random.nextInt(100);
		}
	}
	
	public static String obtenerNombreLocalidadAlAzar() {
		if (random.nextBoolean()) {
			return localidades[random.nextInt(localidades.length)] + random.nextInt(103);
		} else {
			return localidades[random.nextInt(localidades.length)] + random.nextInt(100);
		}
	}
	
	public static String obtenerNombreBancoAlAzar() {
		if (random.nextBoolean()) {
			return bancos[random.nextInt(bancos.length)] + random.nextInt(103);
		} else {
			return bancos[random.nextInt(bancos.length)] + random.nextInt(100);
		}
	}

	public static String obtenerNombreZona() {
		if (random.nextBoolean()) {
			return "Zona" + random.nextInt(9999);
		} else {
			return "Zona" + random.nextInt(100) + random.nextInt(150);
		}
	}
	/**
	 * @param nombre
	 * @return
	 */
	public static String generarMail(String nombre, String apellido) {
		String[] nombres = nombre.split(" ");
		String[] apellidos = apellido.split(" ");
		return (nombres[0] + "." + apellidos[0] + "@" + correos[random
				.nextInt(correoLenght)]).toLowerCase();
	}

	/**
	 * @return
	 */
	public static String obtenerCelularAlAzar() {
		if (random.nextBoolean()) {
			return "(011)" + (150000000 + random.nextInt(9999999));
		} else {
			return "(0221)" + (15000000 + random.nextInt(999999));
		}

	}
	public static String obtenerDireccionAlAzar() {
		return "Calle" + random.nextInt(100) + " " + random.nextInt(2000);
	}

	public static Integer obtenerCantidadAlAzar() {
		return random.nextInt(10);
	}

	public static String obtenerAnosAlAzar() {
		return String.valueOf(random.nextInt(1000));
	}

	

	
	public static Double obtenerMontosAlAzar() {
		return random.nextDouble();
	}
	
	/**
	 * @return
	 */
	public static Date obtenerFechaIngresoAlAzar() {
		if (random.nextInt(10) < 1) {
			Calendar calendar = Calendar.getInstance();
			calendar.set(2009 + random.nextInt(1), 0 + random.nextInt(11),
					random.nextInt(27));
			return calendar.getTime();
		} else {
			return null;
		}
	}

	/**
	 * @return
	 */
	public static Usuario obtenerOwnerAlAzar() {
		return owners.get(random.nextInt(ownersLenght));
	}

	public static String obtenerCodPostalAlAzar() {
		if (random.nextBoolean()) {
			return "1" + (4000000 + random.nextInt(9999999));
		} else {
			return "1" + (400000 + random.nextInt(999999));
		}
	}
	/**
	 * @return
	 */
	public static String obtenerTelefonoAlAzar() {
		if (random.nextBoolean()) {
			return "(011)" + (4000000 + random.nextInt(9999999));
		} else {
			return "(0221)" + (400000 + random.nextInt(999999));
		}
	}

	public static Date obtenerFechaEventoAlAzar() {
		int chance = random.nextInt(100);
		Calendar calendar = Calendar.getInstance();
		int anio = calendar.get(Calendar.YEAR);
		int mes = calendar.get(Calendar.MONTH);

		if (chance < 5) {
			calendar.set(anio, mes - random.nextInt(3), 1);
			return calendar.getTime();

		} else if (chance < 65) {
			calendar.set(anio, mes + random.nextInt(6), random.nextInt(14));
			return calendar.getTime();
		} else {
			calendar.set(anio, mes + random.nextInt(6), random.nextInt(27));
			return calendar.getTime();
		}
	}
	public static List<Usuario> obtenerListaSelectoresAlAzar() {
		if(random.nextBoolean()){
			return owners;
		}else{
			return null;
		}		
	}
	/**
	 * @return
	 */
	public static String obtenerADNIlAzar() {
		return String.valueOf(25000000 + random.nextInt(10000000));
	}

	public static EstadoAlumno obtenerEstadoAlumnoAlAzar() {
		return EstadoAlumno.values()[random.nextInt(EstadoAlumno.values().length)];
	}

	public static Turno obtenerTurnoAlumnoAlAzar() {
		return Turno.values()[random.nextInt(Turno.values().length)];

	}

	public static ZonaCimientos getZonaCimientosAlAzar(List<ZonaCimientos> zonas){
		return zonas.get(random.nextInt(zonas.size()));
	}

	public static Localidad obtenerLocalidadAlAzar(List<Localidad> locs){
		return locs.get(random.nextInt(locs.size()));
	}

	public static Escuela obtenerEscuelaAlAzar(List<Escuela> esc){
		return esc.get(random.nextInt(esc.size()));
	}
	
	public static EstadoInforme obtenerEstadoInformeAlAzar(){
		return EstadoInforme.values()[(random.nextInt(EstadoInforme.values().length))];
	}

	public static List<Evento> obtenerEventosAlAzar() {
		int cantidad = 5+random.nextInt(15);
		List<Evento> temp = new LinkedList<Evento>();
		List<Evento> total = new LinkedList<Evento>(tipoEvento);
		while (cantidad > 0) {
			int index = random.nextInt(total.size());
			temp.add(total.get(index));
			total.remove(index);
			cantidad--;
		}
	
		return temp;
	}
	
	/**
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private static List<Usuario> llenarListaOwners() {

		Session session = ((SessionFactory) springContext
				.getBean("sessionFactory")).openSession();

		Transaction tx = session.beginTransaction();
		Criteria c = session.createCriteria(Usuario.class);
		List<Usuario> usuarios = c.list();
		tx.commit();
		return usuarios;

	}

	@SuppressWarnings("unchecked")
	private static List<Evento> llenarListaEventos() {

		Session session = ((SessionFactory) springContext
				.getBean("sessionFactory")).openSession();

		Transaction tx = session.beginTransaction();
		Criteria c = session.createCriteria(Evento.class);
		List<Evento> eventos = c.list();
		tx.commit();
		return eventos;

	}
	
	@SuppressWarnings("unchecked")
	private static List<Escuela> llenarListaEscuelas() {
		Session session = ((SessionFactory) springContext
				.getBean("sessionFactory")).openSession();

		Transaction tx = session.beginTransaction();
		Criteria c = session.createCriteria(Escuela.class);
		List<Escuela> escuelas = c.list();
		tx.commit();
		return escuelas;
	}

	
	

}
