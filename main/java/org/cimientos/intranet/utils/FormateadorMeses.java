package org.cimientos.intranet.utils;

import java.security.InvalidParameterException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;


public class FormateadorMeses {

	public static String getMes(Integer id)
	{
		switch (id) 
		{
		case 1:
			return "Enero";
		case 2:
			return "Febrero";
		case 3:
			return "Marzo";
		case 4:
			return "Abril";
		case 5:
			return "Mayo";
		case 6:
			return "Junio";
		case 7:
			return "Julio";
		case 8:
			return "Agosto";
		case 9:
			return "Septiembre";
		case 10:
			return "Octubre";
		case 11:
			return "Noviembre";
		case 12:
			return "Diciembre";

		default:
			throw new InvalidParameterException("Mes desconocido: "
					+ id);
		}
	}	
	
	public static Date getFecha(String fecha)
	{
		String mes = fecha.substring(0, 3);
		String anio = fecha.substring(4,6);
		Calendar fechaReal = GregorianCalendar.getInstance();
		if(mes.equals("ene"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.JANUARY);
		}
		if(mes.equals("feb"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.FEBRUARY);
		}
		if(mes.equals("mar"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.MARCH);
		}
		if(mes.equals("abr"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.APRIL);
		}
		if(mes.equals("may"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.MAY);
		}
		if(mes.equals("jun"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.JUNE);
		}
		if(mes.equals("jul"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.JULY);
		}
		if(mes.equals("ago"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.AUGUST);
		}
		if(mes.equals("sep"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.SEPTEMBER);
		}
		if(mes.equals("oct"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.OCTOBER);
		}
		if(mes.equals("nov"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.NOVEMBER);
		}
		if(mes.equals("dic"))
		{
			fechaReal.set(Calendar.MONTH, Calendar.DECEMBER);
		}
		
		
		
		if(anio.equals("04"))
		{
			fechaReal.set(Calendar.YEAR, 2004);
		}
		if(anio.equals("05"))
		{
			fechaReal.set(Calendar.YEAR, 2005);
		}
		if(anio.equals("06"))
		{
			fechaReal.set(Calendar.YEAR, 2006);
		}
		if(anio.equals("07"))
		{
			fechaReal.set(Calendar.YEAR, 2007);
		}
		if(anio.equals("08"))
		{
			fechaReal.set(Calendar.YEAR, 2008);
		}
		if(anio.equals("09"))
		{
			fechaReal.set(Calendar.YEAR, 2009);
		}
		if(anio.equals("10"))
		{
			fechaReal.set(Calendar.YEAR, 2010);
		}
		//String fecha1 = fechaReal.getTime().toString();
		//Date otraFecha = Formateador.parsearFechaPatron(fecha1);
		return fechaReal.getTime();
	}	
}
