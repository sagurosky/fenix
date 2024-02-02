package org.cimientos.intranet.modelo.perfil;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum EstadoAlumno implements Serializable{

	ALTA_BECADO(1,"Beca Asignada"), // 0
	APROBADO(2,"Aprobado Selección"), // 1
	APROBADO_TS(3,"Aprobado TS"),// 2
	LISTA_ESPERA(4,"Lista de Espera"),// 3
	NO_RENOVADO(5,"No Renovado"), // 4
	RENOVADO(6,"Renovado"), // 5
	PENDIENTE(7,"Pendiente Renovación"), // 6
	SUSPENDIDO(8,"Suspendido"), // 7
	EGRESADO(9,"Fin de Participación de PFE"), // 8
	CESADO(10,"Cesado"), // 9
	SELECCIONADO(11,"Seleccionado"), // 10
	RECHAZADO(12,"Rechazado Selección"), // 11
	LISTA_ESPERA_MATERIAS(13,"Lista de Esperas con Materias"), // 12
	RECHAZADO_TS(14,"Rechazado TS"), // 13
	LISTA_ESPERA_TS(15,"Lista de Espera TS"), // 14
	LISTA_ESPERA_MATERIA_TS(16,"Lista de Espera con Materias TS"), // 15
	INCORPORADO(17,"Incorporado"), // 16
	PRESELECCIONADO(18,"Envío a TS"), // 17
	NO_INCORPORADO(19,"No incorporado"), // 18
	PENDIENTE_RENOVACION_SIN_ASIGNACION(20,"Pendiente Renovación Sin Asignación"), // 19
	REASIGNADO(21,"Reasignado"), // 20
	PENDIENTE_RENOVACION_CON_ASIGNACION(22,"Pendiente Renovación Con Asignación"), //  21
	INCORPORACION_PENDIENTE(23,"Incorporación Pendiente");	 // 22
	
	
	private Integer id;
	private String valor;
	
	
	private EstadoAlumno(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getValor() {
		return valor;
	}


	public void setValor(String valor) {
		this.valor = valor;
	}
	
	
	public static EstadoAlumno getEstados(Integer id){
		switch (id) {
		case 1:
			return ALTA_BECADO;
		case 2:
			return APROBADO;
		case 3:
			return APROBADO_TS;
		case 4:
			return LISTA_ESPERA;
		case 5:
			return NO_RENOVADO;
		case 6:
			return RENOVADO;
		case 7:
			return PENDIENTE;
		case 8:
			return SUSPENDIDO;
		case 9:
			return EGRESADO;
		case 10:
			return CESADO;
		case 11:
			return SELECCIONADO;
		case 12:
			return RECHAZADO;
		case 13:
			return LISTA_ESPERA_MATERIAS;
		case 14:
			return RECHAZADO_TS;
		case 15:
			return LISTA_ESPERA_TS;	
		case 16:
			return LISTA_ESPERA_MATERIA_TS; 
		case 17:
			return INCORPORADO; 	
		case 18:
			return PRESELECCIONADO;
		case 19:
			return NO_INCORPORADO;
		case 20:
			return PENDIENTE_RENOVACION_SIN_ASIGNACION; 	
		case 21:
			return REASIGNADO;
		case 22:
			return PENDIENTE_RENOVACION_CON_ASIGNACION;	
		case 23:
			return INCORPORACION_PENDIENTE;
		default:
			throw new InvalidParameterException("EstadoAlumno  desconocido: "
					+ id);
		}

	}
	/**
	 * @return
	 */
	public static List<EstadoAlumno> getListaEstadoAlumnos() {
		return Arrays.asList(values());
	}
	
	/**
	 * @return Estados de Alumnos de Acompañamiento
	 */
	public static List<EstadoAlumno> getListaEstadoAcompaniamiento() {
		ArrayList<EstadoAlumno> listaEstadoAcomp = new ArrayList<EstadoAlumno>();
		listaEstadoAcomp.add(ALTA_BECADO);
		listaEstadoAcomp.add(RENOVADO);
		listaEstadoAcomp.add(INCORPORADO);
		listaEstadoAcomp.add(INCORPORACION_PENDIENTE);
		listaEstadoAcomp.add(PENDIENTE_RENOVACION_SIN_ASIGNACION);
		listaEstadoAcomp.add(PENDIENTE_RENOVACION_CON_ASIGNACION);
		listaEstadoAcomp.add(EGRESADO);
		listaEstadoAcomp.add(NO_RENOVADO);
		return listaEstadoAcomp;
	}
	
	public static List<EstadoAlumno> getListaEstadosInactivos() {
		ArrayList<EstadoAlumno> listaEstadoAcomp = new ArrayList<EstadoAlumno>();
		listaEstadoAcomp.add(NO_RENOVADO);
		listaEstadoAcomp.add(NO_INCORPORADO);
		listaEstadoAcomp.add(CESADO);
		listaEstadoAcomp.add(EGRESADO);
		return listaEstadoAcomp;
	}
	
	/**
	 * @return Estados de Alumnos de Seleccion
	 */
	public static List<EstadoAlumno> getListaEstadoSeleccion() {
		ArrayList<EstadoAlumno> listaEstadoAcomp = new ArrayList<EstadoAlumno>();
		listaEstadoAcomp.add(APROBADO);
		listaEstadoAcomp.add(RECHAZADO);
		listaEstadoAcomp.add(LISTA_ESPERA);
		listaEstadoAcomp.add(LISTA_ESPERA_MATERIAS);
		return listaEstadoAcomp;
	}
}
