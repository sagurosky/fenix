/**
 * 
 */
package org.cimientos.intranet.utils;

/**
 * Esta clase contiene las constantes utilizadas para ordenar 
 * grillas implementadas con displaytag.
 *
 */
public class ConstantesDisplayTagSorting {

	public static class PagoBecaSorting
    {
		public static final String  PAGO_BECADO_APELLIDO = "becado.datosPersonales.apellido",
									PAGO_BECADO_NOMBRE = "becado.datosPersonales.nombre",
									PAGO_RA_APELLIDO = "responsable.apellido",
									PAGO_RA_NOMBRE = "responsable.nombre",
									PAGO_ZONA = "becado.escuela.localidad.zona.nombre",
									PAGO_BANCO = "responsable.sucursalBanco.banco.nombre";
    }
	
	public static class CuentaSorting
    {
		public static final String  BECADO_APELLIDO = "alumno.apellido",
									APELLIDO_TITULAR = "titular.apellido",
									CUIL_TITULAR = "titular.cuil",
									RR_APELLIDO = "rr.apellido",
									ZONA = "alumno.zona",
									BANCO_TITULAR = "titular.banco";
    }
	
}
