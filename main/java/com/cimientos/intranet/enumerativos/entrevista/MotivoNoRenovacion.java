package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum MotivoNoRenovacion {

	
	BAJOCOMPROMISO(1,"Bajo compromiso con PFE"),
	CAMBIOSITUACIONECO(2,"Cambio en la situación económica"),
	REPITENCIA(3,"Repitencia"),	
	RENUNCIABECA(4,"Renuncia a Beca"),
	MUDANZA(5,"Cambio de escuela"), //DISA
	ABANDONO(6,"Abandono escolar"),
	CAMBIOESCUELA(7,"Cambio de escuela"),
	MATERIASPREVIAS(8,"Bajo compromiso con PFE"),//DISA
	FALLECIMIENTO(9,"Fallecimiento"),	
	RENUNCIABECA1(10,"Renuncia a PFE"),
	BAJOCOMPROMISO1(11,"Bajo compromiso con la escolaridad"),
	FALTAGRAVE(12,"Falta grave de conducta"); //NUEVO 09.06.2021
	
	
	public static List<MotivoNoRenovacion> getmotivoNoRenovacionFinal() {
		return Arrays.asList(BAJOCOMPROMISO,CAMBIOSITUACIONECO,REPITENCIA,RENUNCIABECA,MUDANZA,ABANDONO,CAMBIOESCUELA,MATERIASPREVIAS,FALLECIMIENTO,RENUNCIABECA1,BAJOCOMPROMISO1,FALTAGRAVE);
	}
	
	
	private Integer id;
	private String valor;
	
	
	private MotivoNoRenovacion(Integer id, String valor) {
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
	
	public static List<MotivoNoRenovacion> getMotivosNoRenovacion(List<Integer> ids){
		ArrayList<MotivoNoRenovacion> valor = new ArrayList<MotivoNoRenovacion>();
		
		for (Integer id: ids)
			valor.add(MotivoNoRenovacion.getmotivoNoIncorporacion(id));
		
		return valor;
	}
	
	
	public static MotivoNoRenovacion getmotivoNoIncorporacion(Integer id){
		switch (id) {
		case 1:
			return BAJOCOMPROMISO;
		case 2:
			return CAMBIOSITUACIONECO;
		case 3:
			return REPITENCIA;
		case 4:
			return RENUNCIABECA;
		case 5:
			return MUDANZA;
		case 6:
			return ABANDONO;
		case 7:
			return CAMBIOESCUELA;
		case 8:
			return MATERIASPREVIAS;
		case 9:
			return FALLECIMIENTO;
		case 10:
			return RENUNCIABECA1;
		case 11:
			return BAJOCOMPROMISO1;
		case 12:
			return RENUNCIABECA;
		
		default:
			throw new InvalidParameterException("Motivo de no renovacion desconocido: "
					+ id);
		}
	}

	public static List<MotivoNoRenovacion> getmotivoNoRenovacion(){
		return Arrays.asList(values());
	}
	
	/**
	 * Son todos los motivos menos materias previas
	 * @return
	 */
	//public static List<MotivoNoRenovacion> getmotivoNoRenovacionFinal() {
	//	return Arrays.asList(BAJOCOMPROMISO,CAMBIOSITUACIONECO,REPITENCIA,RENUNCIABECA,MUDANZA,ABANDONO,CAMBIOESCUELA,FALLECIMIENTO);
	//}
	
	
}
