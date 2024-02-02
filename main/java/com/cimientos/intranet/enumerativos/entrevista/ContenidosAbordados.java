package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum ContenidosAbordados {

	
	
	PLANIFICACION(1,"PLANIFICACIÓN Y ORGANIZACIÓN DEL TIEMPO / Hábitos de estudio"),
	ESTRATEGIAS(2,"PLANIFICACIÓN Y ORGANIZACIÓN DEL TIEMPO / Hábitos de estudio"),
	CRITERIOS(3,"PARTICIPACIÓN EN PFE / Participación en PFE (varios)"),
	PLANIFICACIONPROYECTO(4,"PLANIFICACIÓN Y ORGANIZACIÓN DEL TIEMPO / Planificación y proyecto de vida"),
	PLANIFICACIONTIEMPO(5,"PLANIFICACIÓN Y ORGANIZACIÓN DEL TIEMPO / Organización del tiempo"),
	AUTONOMIA(6,"RESPONSABILIDAD Y AUTONOMÍA / Autonomía"),
	AUTOCONOCIMIENTO(7,"RESPONSABILIDAD Y AUTONOMÍA / Responsabilidad y compromiso"),
	COMPROMISOBECADO(8,"RESPONSABILIDAD Y AUTONOMÍA / Responsabilidad y compromiso"),
	COMPROMISORA(9,"FAMILIAS / Generales"),
	ROLRA(10,"FAMILIAS / Generales"),
	HERRAMIENTASRA(11,"PLANIFICACIÓN Y ORGANIZACIÓN DEL TIEMPO / Egreso y Transición post-escolar"),
	RELACIONESCUELARA(12,"FAMILIAS / Generales"),
	DESEMPENIOESCOLAR(13, "PLANIFICACIÓN Y ORGANIZACIÓN DEL TIEMPO / Hábitos de estudio"),
	PERMANENCIAALUM(14,"SITUACIONES DE RIESGO EDUCATIVO / Escolares: Materias previas"),
	PROMOCIONMATERIA(15,"PARTICIPACIÓN EN PFE / Participación en PFE (varios)"),
	REPITENCIA(16,"RESPONSABILIDAD Y AUTONOMÍA / Autocontrol y determinación"),
	EGRESO(17,"AUTOCONCEPTO / Autoconocimiento y autoestima"),
	DISENIOPLANIFICACION(18,"RESPONSABILIDAD Y AUTONOMÍA / Autocontrol y determinación"),
	IMPLEMENESTRATEGIA(19,"RELACIONES INTERPERSONALES / Empatía y Trabajo con otros"),
	REUNIONDIRECTIVOS(20, "RELACIONES INTERPERSONALES / Convivencia y resolución de conflictos"),
	REUNIONEQUIPO(21,"TOMA DE DECISIONES / Pensamiento crítico y creativo"),
	OBSERCLASES(22,"PLANIFICACIÓN Y ORGANIZACIÓN DEL TIEMPO / Hábitos de estudio"),
	CAPACITACION(23,"TOMA DE DECISIONES / Pensamiento crítico y creativo"),
	INDICADORES(24,"PLANIFICACIÓN Y ORGANIZACIÓN DEL TIEMPO / Transición Primaria-Secundaria"),
	JORNADAINSTITUCIONAL(25,"PLANIFICACIÓN Y ORGANIZACIÓN DEL TIEMPO / Elección de orientación y cambio de ciclo");
	

	
	
	private Integer id;
	private String valor;
	
	
	private ContenidosAbordados(Integer id, String valor) {
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
	
	
	public static ContenidosAbordados getContenidosAbordados(Integer id){
		switch (id) {
		case 1:
			return PLANIFICACION;
		case 2:
			return ESTRATEGIAS;
		case 3:
			return CRITERIOS;
		case 4:
			return PLANIFICACIONPROYECTO;
		case 5:
			return PLANIFICACIONTIEMPO;
		case 6:
			return AUTONOMIA;
		case 7:
			return AUTOCONOCIMIENTO;
		case 8:
			return COMPROMISOBECADO;
		case 9:
			return COMPROMISORA;
		case 10:
			return ROLRA;
		case 11:
			return HERRAMIENTASRA;
		case 12:
			return RELACIONESCUELARA;
		case 13:
			return DESEMPENIOESCOLAR;
		case 14:
			return PERMANENCIAALUM;
		case 15:
			return PROMOCIONMATERIA;
		case 16:
			return REPITENCIA;
		case 17:
			return EGRESO;
		case 18:
			return DISENIOPLANIFICACION;
		case 19:
			return IMPLEMENESTRATEGIA;
		case 20:
			return REUNIONDIRECTIVOS;
		case 21:
			return REUNIONEQUIPO;
		case 22:
			return OBSERCLASES;
		case 23:
			return CAPACITACION;
		case 24:
			return INDICADORES;
		case 25:
			return JORNADAINSTITUCIONAL;
		
		default:
			throw new InvalidParameterException("Compromiso abordado desconocido: "
					+ id);
		}

	}


	public static List<ContenidosAbordados> getContenidosAbordados() {
		return Arrays.asList(values());
	}
	
	public static List<ContenidosAbordados> getContenidosAbordadosEntrevistaMensual() {
		ArrayList<ContenidosAbordados> listaContAbordadosEntrevMensual = new ArrayList<ContenidosAbordados>();
		
		
		listaContAbordadosEntrevMensual.add(PLANIFICACION);
		listaContAbordadosEntrevMensual.add(ESTRATEGIAS);
		listaContAbordadosEntrevMensual.add(CRITERIOS);
		listaContAbordadosEntrevMensual.add(PLANIFICACIONPROYECTO);
		listaContAbordadosEntrevMensual.add(PLANIFICACIONTIEMPO);
		listaContAbordadosEntrevMensual.add(AUTONOMIA);
		listaContAbordadosEntrevMensual.add(AUTOCONOCIMIENTO);
		listaContAbordadosEntrevMensual.add(COMPROMISOBECADO);
		listaContAbordadosEntrevMensual.add(COMPROMISORA);
		listaContAbordadosEntrevMensual.add(ROLRA);
		listaContAbordadosEntrevMensual.add(HERRAMIENTASRA);
		listaContAbordadosEntrevMensual.add(RELACIONESCUELARA);
		listaContAbordadosEntrevMensual.add(DESEMPENIOESCOLAR);
		listaContAbordadosEntrevMensual.add(PERMANENCIAALUM);
		listaContAbordadosEntrevMensual.add(PROMOCIONMATERIA);
		listaContAbordadosEntrevMensual.add(REPITENCIA);		
		listaContAbordadosEntrevMensual.add(EGRESO);
		listaContAbordadosEntrevMensual.add(DISENIOPLANIFICACION);
		listaContAbordadosEntrevMensual.add(IMPLEMENESTRATEGIA);
		listaContAbordadosEntrevMensual.add(REUNIONDIRECTIVOS);
		listaContAbordadosEntrevMensual.add(REUNIONEQUIPO);
		listaContAbordadosEntrevMensual.add(OBSERCLASES);
		listaContAbordadosEntrevMensual.add(CAPACITACION);
		listaContAbordadosEntrevMensual.add(INDICADORES);
		listaContAbordadosEntrevMensual.add(JORNADAINSTITUCIONAL);		
		return listaContAbordadosEntrevMensual;
	}
}
