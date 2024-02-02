/**
 * 
 */
package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author plabaronnie
 *
 */
public enum CalificacionMateria implements Serializable{
	CERO(0, "0"),
	UNO(1, "1"),
	DOS(2,"2"),
	TRES(3, "3"),
	CUATRO(4, "4"),
	CINCO(5,"5"), 
	SEIS(6, "6"),
	SIETE(7, "7"),
	OCHO(8,"8"),
	NUEVE(9, "9"),
	DIEZ(10, "10"),	
	SIN_CALIFICAR(11,"Sin calificar"),
	AUSENTE(12, "Ausente"),
	NO_APLICA(13, "No Aplica"),
	NO_EXISTE(14,"No existe"),
	SIN_CARGAR(15," "),
	ONCE(16,"11"),
	DOCE(17,"12"),
	TRECE(18,"13"),
	CATORCE(19,"14"),
	QUINCE(20,"15"),
	DIECISEIS(21,"16"),
	DIECISIETE(22,"17"),
	DIECIOCHO(23,"18"),
	DIECINUEVE(24,"19"),
	VEINTE(25,"20");
	
	private CalificacionMateria(int id, String valor) {
		this.id = id;
		this.valor = valor;
	}
	
	private int id;
	private String valor;
	
	
	/**
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return
	 */
	public String getValor() {
		return valor;
	}
	
	/**
	 * @param valor
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	public static CalificacionMateria getCalificacionMateria(int id) {
		switch (id) {
		case 0:
			return CERO;
		case 1:
			return UNO;
		case 2:
			return DOS;
		case 3:
			return TRES;
		case 4:
			return CUATRO;
		case 5:
			return CINCO;
		case 6:
			return SEIS;
		case 7:
			return SIETE;
		case 8:
			return OCHO;	
		case 9:
			return NUEVE;
		case 10:
			return DIEZ;
		case 11:
			return SIN_CALIFICAR;
		case 12:
			return AUSENTE;
		case 13:
			return NO_APLICA;
		case 14:
			return NO_EXISTE;
		case 15:
			return SIN_CARGAR;
		case 16:
			return ONCE;
		case 17:
			return DOCE;
		case 18:
			return TRECE;
		case 19:
			return CATORCE;
		case 20:
			return QUINCE;
		case 21:
			return DIECISEIS;
		case 22:
			return DIECISIETE;
		case 23:
			return DIECIOCHO;
		case 24:
			return DIECINUEVE;
		case 25:
			return VEINTE;
		
		default:
			throw new InvalidParameterException("Calificacion desconocida: "
					+ id);
		}
	}
	
	/**
	 * @return
	 */
	public static List<CalificacionMateria> getListaCalificaciones(){
		return Arrays.asList(values());
	}
	
	/**
	 * Calificaciones apatas para generar materias del boletin que va al PDF del IS1
	 */
	public static List<CalificacionMateria> getListaCalificacionesAptasParaBoletinIS1(){
		ArrayList<CalificacionMateria> calificacionesAptas = new ArrayList<CalificacionMateria>();
		calificacionesAptas.add(CERO);
		calificacionesAptas.add(UNO);
		calificacionesAptas.add(DOS);
		calificacionesAptas.add(TRES);
		calificacionesAptas.add(CUATRO);
		calificacionesAptas.add(CINCO);
		calificacionesAptas.add(SEIS);
		calificacionesAptas.add(SIETE);
		calificacionesAptas.add(OCHO);
		calificacionesAptas.add(NUEVE);
		calificacionesAptas.add(DIEZ);
		calificacionesAptas.add(AUSENTE);
		calificacionesAptas.add(SIN_CALIFICAR);
		calificacionesAptas.add(ONCE);
		calificacionesAptas.add(DOCE);
		calificacionesAptas.add(TRECE);
		calificacionesAptas.add(CATORCE);
		calificacionesAptas.add(QUINCE);
		calificacionesAptas.add(DIECISEIS);
		calificacionesAptas.add(DIECISIETE);
		calificacionesAptas.add(DIECIOCHO);
		calificacionesAptas.add(DIECINUEVE);
		calificacionesAptas.add(VEINTE);
		
		return calificacionesAptas;
	}
	
	public static List<CalificacionMateria> getListaCalificacionesAptasParaBoletinExportarIS1(){
		ArrayList<CalificacionMateria> calificacionesAptas = new ArrayList<CalificacionMateria>();
		calificacionesAptas.add(CERO);
		calificacionesAptas.add(UNO);
		calificacionesAptas.add(DOS);
		calificacionesAptas.add(TRES);
		calificacionesAptas.add(CUATRO);
		calificacionesAptas.add(CINCO);
		calificacionesAptas.add(SEIS);
		calificacionesAptas.add(SIETE);
		calificacionesAptas.add(OCHO);
		calificacionesAptas.add(NUEVE);
		calificacionesAptas.add(DIEZ);
		calificacionesAptas.add(AUSENTE);
		calificacionesAptas.add(SIN_CALIFICAR);
		calificacionesAptas.add(NO_APLICA);
		calificacionesAptas.add(NO_EXISTE);
		calificacionesAptas.add(SIN_CARGAR);
		calificacionesAptas.add(ONCE);
		calificacionesAptas.add(DOCE);
		calificacionesAptas.add(TRECE);
		calificacionesAptas.add(CATORCE);
		calificacionesAptas.add(QUINCE);
		calificacionesAptas.add(DIECISEIS);
		calificacionesAptas.add(DIECISIETE);
		calificacionesAptas.add(DIECIOCHO);
		calificacionesAptas.add(DIECINUEVE);
		calificacionesAptas.add(VEINTE);
		
		return calificacionesAptas;
	}
	
}



