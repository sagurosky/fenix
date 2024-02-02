package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum MotivoSuspension {
	
	DESEMPENO(1,"Desempeño escolar insuficiente"),
	INASISTENCIAESJ(2,"Inasistencia a encuentro sin justificación"),
	INASISTENCIACE(3,"2 inasistencias consecutivas al espacio de acompañamiento"), 
	INASISTENCIAJ(4,"Incumplimiento reiterado de los compromisos asumidos con el EA"),
	FALTAS(5,"Más de 5 faltas a clase en el mes sin justificación  "),
	PERDIDAREGULAR(6,"Pérdida de condición de alumno regular"),
	CONDUCTA(7,"Falta de conducta"),
	FALTAMATERIAL(8,"Falta material varias veces");

	private Integer id;
	private String valor;
	
	
	private MotivoSuspension(Integer id, String valor) {
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
	
	public static List<MotivoSuspension> getMotivosSuspension(List<Integer> ids){
		ArrayList<MotivoSuspension> valor = new ArrayList<MotivoSuspension>();
		
		for (Integer id: ids)
			valor.add(MotivoSuspension.getMotivoSuspension(id));
		
		return valor;
	}
	
	public static MotivoSuspension getMotivoSuspension(Integer id){

		switch (id) {
		case 1:
			return DESEMPENO;
		case 2:
			return INASISTENCIAESJ;
		case 3:
			return INASISTENCIACE;
		case 4:
			return INASISTENCIAJ;
		case 5:
			return FALTAS;
		case 6:
			return PERDIDAREGULAR;
		case 7:
			return CONDUCTA;
		case 8:
			return FALTAMATERIAL;
				
		default:
			throw new InvalidParameterException("Motivo de suspension desconocido: "
					+ id);
		}

	}


	public static List<MotivoSuspension> getMotivoSuspension() {
		return Arrays.asList(values());
	}
}
