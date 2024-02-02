/**
 * 
 */
package org.cimientos.intranet.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.commons.lang.StringUtils;


/**
 * The Class Formateador.
 *
 * @author msagarduy
 * Clase utilizada para manejar formatos.
 */
public class Formateador {

	/**
	 * Parsear fecha.
	 *
	 * @author msagarduy
	 */
	
	
	
	public static Date parsearFecha(String fecha) {
		DateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
		Date fechaAParsear;
		try {
			fechaAParsear = sdf1.parse(fecha);
			sdf1.format(fechaAParsear);
		} catch (ParseException e) {
			e.printStackTrace();
			fechaAParsear = new Date();
		}
		return fechaAParsear;
	}
	
	public static Date parsearFechaConHora(String fecha) {
		DateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date fechaAParsear;
		try {
			fechaAParsear = sdf1.parse(fecha);
			sdf1.format(fechaAParsear);
		} catch (ParseException e) {
			e.printStackTrace();
			fechaAParsear = new Date();
		}
		return fechaAParsear;
	}
	
	public static Date parsearFechaPatron(String fecha) {
		DateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date fechaAParsear;
		try {
			fechaAParsear = sdf1.parse(fecha);
			sdf1.format(fechaAParsear);
		} catch (ParseException e) {
			e.printStackTrace();
			fechaAParsear = new Date();
		}
		return fechaAParsear;
	}
	/**
	 * Formatear fechas.
	 *
	 * @param fecha the fecha
	 * @param pattern the pattern
	 * @return the string
	 * @since 15-nov-2010
	 * @author cfigueroa
	 */
	public static String formatearFechas(Date fecha,String pattern) {
		SimpleDateFormat sdf1 = new SimpleDateFormat(pattern);
		return sdf1.format(fecha);
		
	}

	/**
	 * Transforma un string con valores numericos separados por comas en 
	 * un arreglo de longs.
	 * 
	 * @param string cadena con los datos separados por coma
	 * @return la lista con longs
	 */
	public static List<Long> toListOfLongs(String string) {
		String [] arreglo = string.split(",");
		List<Long> arrayOfLongs = new ArrayList<Long>();
		for (int i = 0; i < arreglo.length; i++) {
			arrayOfLongs.add(Long.valueOf( arreglo[i]));
		}
		return arrayOfLongs;
	}
	
	public static List<String> toListOfStringValues(String string) {
		String [] arreglo = string.split(",");
		List<String> arrayOfLongs = new ArrayList<String>();
		for (int i = 0; i < arreglo.length; i++) {
			arrayOfLongs.add(arreglo[i]);
		}
		return arrayOfLongs;
	}
	
	public static List<Boolean> toListOfBoolean(String string) {
		String [] arreglo = string.split(",");
		List<Boolean> arrayOfLongs = new ArrayList<Boolean>();
		for (int i = 0; i < arreglo.length; i++) {
			arrayOfLongs.add(Boolean.valueOf(arreglo[i]));
		}
		return arrayOfLongs;
	}
	
	public static List<String> toListOfStrings(String[] arreglo) {
		List<String> arrayOfLongs = new ArrayList<String>();
		for (int i = 0; i < arreglo.length; i++) {
			arrayOfLongs.add(String.valueOf( arreglo[i]));
		}
		return arrayOfLongs;
	}
	
	public static List<Long> toListOfLongsArray(String[] arreglo) {
		List<Long> arrayOfLongs = new ArrayList<Long>();
		for (int i = 0; i < arreglo.length; i++) {
			arrayOfLongs.add(Long.valueOf(arreglo[i]));
		}
		return arrayOfLongs;
	}
	
	public static List<Double> toListOfDouble(String string) {
		String [] arreglo = string.split(",");
		List<Double> arrayOfLongs = new ArrayList<Double>();
		for (int i = 0; i < arreglo.length; i++) {
			arrayOfLongs.add(Double.valueOf( arreglo[i]));
		}
		return arrayOfLongs;
	}
	/**
	 * @param valor
	 * @return
	 */
	public static boolean isDouble(String valor){
		return valor.matches("^-?\\d+(\\,\\d+)?$");
	}
	/**
	 * @param cuil
	 * @return
	 */
	public static String formatearCuilSinGuiones(String cuil){
		return cuil.replaceAll("-", "");
	}
	
	/**
	 * @param cuil
	 * @return
	 */
	public static String formatearCuilConGuiones(String cuil){
		String cuilSinGuiones=formatearCuilSinGuiones(cuil);
		String cuilFormateado = cuilSinGuiones.substring(0, 2);
		cuilFormateado += "-";
		cuilFormateado += cuilSinGuiones.substring(2, cuilSinGuiones.length() - 1);
		cuilFormateado += "-";
		cuilFormateado += cuilSinGuiones.substring(cuilSinGuiones.length() - 1, cuilSinGuiones.length());
		return cuilFormateado;
	}
	
	/**
	 * Capitaliza todas las palabras
	 * @param cadena
	 * @return
	 */
	public static String capitalizarTodas(String cadena){
		String[] palabras = cadena.split(" ");
		String capitalizada = "";
		for (int i = 0; i < palabras.length; i++) {
			capitalizada += StringUtils.capitalize(palabras[i]);
			capitalizada += " ";
		}
		return capitalizada.trim();
	}

	/**
	 * @param fechaNacimiento
	 * @return
	 */
	public static String formatearFecha(Date fecha, String patron) {
		DateFormat format = new SimpleDateFormat(patron);
		return format.format(fecha);
	}
	
	  /**
	 * @param texto
	 * @return
	 */
	public static String quitarAcentos(String texto) {
		texto = texto.replace ('á','a');
		texto = texto.replace ('é','e');
		texto = texto.replace ('í','i');
		texto = texto.replace ('ó','o');
		texto = texto.replace ('ú','u'); 
		return texto;
	    }

	
	public static String reemplazarAcentosHtml(String texto) 
	{
		if(texto.contains("á"))
			texto = texto.replaceAll("á","&aacute;");
		if(texto.contains("é"))
			texto = texto.replaceAll("é","&eacute;");
		if(texto.contains("í"))
			texto = texto.replaceAll("í","&iacute;");
		if(texto.contains("ó"))
			texto = texto.replaceAll("ó","&oacute;");
		if(texto.contains("ú"))
			texto = texto.replaceAll("ú","&uacute;");
		if(texto.contains("ñ"))
			texto = texto.replaceAll("ñ","&ntilde;");
		return texto;
	   }
	
	/**
	 * @param date
	 * @return
	 */
	public static Date setearTimeACero(Date date) {
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}
	
	/**
	 * Le agrega a la fecha pasada por parametro, la hora 23:59:59. Se usa para la creacion de periodo por el tema de la comparacion de horas
	 * @param date
	 * @return
	 */
	public static Date setearHoraFinDia(Date date) {
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}
	
	/**
	 * Este metodo devuelve un String con el año que corresponde la fecha 
	 * EJ: 20/02/2001  = 2001
	 *
	 * @param date the date
	 * @return String con el el año EJ: 2001 
	 * @since 14-mar-2011
	 * @author cfigueroa
	 */
	public static String extractYear(Date date){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
		return dateFormat.format(date);
	}
	
	/**
	 * Este metodo devuelve la edad partiendo de la fecha actual y la fecha de nacimiento
	 *
	 * @param fechaNacimiento the fecha nacimiento
	 * @return the edad
	 * @since 31-mar-2011
	 * @author cfigueroa
	 */
	public static Integer obtenerEdad(Date fechaNacimiento){
		Calendar calendarHoy = GregorianCalendar.getInstance();
		calendarHoy.setTime(new Date());
		Calendar calendarNac = GregorianCalendar.getInstance();
		calendarNac.setTime(fechaNacimiento);
		return  calendarHoy.get(Calendar.YEAR) - calendarNac.get(Calendar.YEAR);
	} 
	
	public static Integer calcularEdad(Date fecha) 
	{
		Calendar dateOfBirth = new GregorianCalendar();
		dateOfBirth.setTime(fecha);
	    Calendar today = Calendar.getInstance();
	    int age = today.get(Calendar.YEAR) - dateOfBirth.get(Calendar.YEAR);
	    dateOfBirth.add(Calendar.YEAR, age);
	    if (today.before(dateOfBirth))
	        age--;
	    return age;
	}

	/**
	 * Extrae el dni del cuil ingresado
	 * @param cuil
	 * @return
	 */
	public static String getDniFromCuil(String cuil){
		cuil = formatearCuilSinGuiones(cuil); //por si viene con guiones
		String dni = cuil;
		if(cuil.length() == 11){
			dni = cuil.substring(2, cuil.length() - 1);
		}
		return dni;
	}
	
	public static String calcularIndicadorEscuela(Float indicador, Integer parametro, String operatoria) 
	{
		if(indicador!=null){
			
		}else{
			indicador=0F;
		}
		double redondeo = Math.rint(indicador*100)/100;
		int resultado = 0;
		if(operatoria.equals("+"))
			resultado = (int) (redondeo + parametro);
		else
			resultado = (int) (redondeo - parametro);
		return String.valueOf(resultado);
	}	
	
	/**
	 * Capitaliza primer letra de la palabra
	 * @param cadena
	 * @return
	 */
	public static String capitalizarPrimerLetra(String cadena){
		String resto = cadena.substring(1);
		char letra = cadena.charAt(0);
		letra = Character.toUpperCase(letra);
		return (Character.toString(letra) + resto).trim();		
	}
}
