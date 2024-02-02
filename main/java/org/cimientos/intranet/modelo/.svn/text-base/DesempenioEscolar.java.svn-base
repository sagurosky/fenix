package org.cimientos.intranet.modelo;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

import org.cimientos.intranet.modelo.perfil.Turno;

/**
 * El enumerativo DesempenioEscolar
 * @author Leonardo Capparelli
 *
 */
public enum DesempenioEscolar implements Serializable{
	TODAS_APROBADAS(1,"Todas las materias aprobadas"),
	ABAJO_UNA(2,"1 Materia abajo"),
	ABAJO_DOS(3,"2 Materias abajo"),
	ABAJO_TRES(4,"3 Materias abajo"),
	ABAJO_CINCO(5,"más de 3 materias");

	private int id;
	private String valor;

	private DesempenioEscolar(int id, String valor) {
		this.id = id;
		this.valor = valor;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the valor
	 */
	public String getValor() {
		return valor;
	}

	/**
	 * @param valor the valor to set
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}


	public static DesempenioEscolar getDesempenioEscolar(int id) {
		for(DesempenioEscolar desempenioEscolar : Arrays.asList(values())){
			if(desempenioEscolar.getId()== id){
				return desempenioEscolar;
			}
		}
//			throw new InvalidParameterException("Desempeño escolar desconocido: "
//					+ id);
		return null;
		
	}
	
	/**
	 * getListaDesempeniosEscolares
	 * @return lista de desempenios escolares
	 */
	public static List<DesempenioEscolar> getListaDesempeniosEscolares(){
		return Arrays.asList(values());
	}

}