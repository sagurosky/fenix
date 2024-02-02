package org.cimientos.intranet.dto;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

// TODO: Auto-generated Javadoc
/**
 * The Class CartaDTO.
 */
public class CartaDTO {
		
	/** The nombre. */
	private String nombre;
	
	/** The date. */
	private String date;
	
	/** The apellido. */
	private String apellido;
	
	private String pathImg;
	
	private String estadoAlumno;
	private String textCarta;
	

	/**
	 * Gets the nombre.
	 *
	 * @return the nombre
	 * @since 10-dic-2010
	 * @author cfigueroa
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * Sets the nombre.
	 *
	 * @param nombre the nombre to set
	 * @since 10-dic-2010
	 * @author cfigueroa
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * Gets the date.
	 *
	 * @return the date
	 * @since 27-dic-2010
	 * @author cfigueroa
	 */
	public String getDate() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat(".EEEEE dd 'de' MMMMM 'de' yyyy",new Locale("es"));
		date = date == null ? dateFormat.format(calendar.getTime()) : date;
		return  date;
	}

	/**
	 * Sets the date.
	 *
	 * @param date the new date
	 * @since 27-dic-2010
	 * @author cfigueroa
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * Gets the apellido.
	 *
	 * @return the apellido
	 * @since 27-dic-2010
	 * @author cfigueroa
	 */
	public String getApellido() {
		return apellido;
	}

	/**
	 * Sets the apellido.
	 *
	 * @param apellido the new apellido
	 * @since 27-dic-2010
	 * @author cfigueroa
	 */
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getPathImg() {
		return pathImg;
	}

	public void setPathImg(String pathImg) {
		this.pathImg = pathImg;
	}

	public String getEstadoAlumno() {
		return estadoAlumno;
	}

	public void setEstadoAlumno(String estadoAlumno) {
		this.estadoAlumno = estadoAlumno;
	}

	public String getTextCarta() {
		return textCarta;
	}

	public void setTextCarta(String textCarta) {
		this.textCarta = textCarta;
	}
		
}
