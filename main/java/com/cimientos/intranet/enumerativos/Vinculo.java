/**
 * 
 */
package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * @author msagarduy
 * 
 */
public enum Vinculo implements Serializable{
	ABUELA(1,"Abuela/o"),
	ABUELO(2,"Abuelo"),
	CANDIDATA(3,"Candidata/o"),
	CANDIDATO(4,"Candidato"),
	CUÑADA(5,"Cuñada/o"),
	CUÑADO(6,"Cuñado"),
	HERMANA(7,"Hermana/o"),
	HERMANO(8,"Hermano"),
	HERMANASTRA(9,"Hermanastra/o"),
	HERMANASTRO(10,"Hermanastro"),
	HIJA(11,"Hija/o"),
	HIJO(12,"Hijo"),
	MADRASTRA(13,"Madrastra"),
	MADRE(14,"Madre"),
	PADRASTRO(15,"Padrastro"),
	PADRE(16,"Padre"),
	PRIMA(17,"Prima/o"),
	PRIMO(18,"Primo"),
	SOBRINA(19,"Sobrina/o"),
	SOBRINO(20,"Sobrino"),
	TIA(21,"Tía/o"),
	TIA_ABUELA(22,"Tía Abuela"),
	TIO(23,"Tío"),
	TIO_ABUELO(24,"Tío Abuelo"),
	TUTOR(25,"Tutor"),
	OTRO(26,"Otro");
	
	private Integer id;
	private String valor;
	
	private Vinculo(Integer id, String valor)
	{
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
	
	public static Vinculo getVinculo(Integer tipo) {

		switch (tipo) {
			case 1: return ABUELA;
			case 2: return ABUELO;
			case 3: return CANDIDATA;
			case 4: return CANDIDATO;
			case 5: return CUÑADA;
			case 6: return CUÑADO;
			case 7: return HERMANA;
			case 8: return HERMANO;
			case 9: return HERMANASTRA;
			case 10: return HERMANASTRO;
			case 11: return HIJA;
			case 12: return HIJO;
			case 13: return MADRASTRA;
			case 14: return MADRE;
			case 15: return PADRASTRO;
			case 16: return PADRE;
			case 17: return PRIMA;
			case 18: return PRIMO;
			case 19: return SOBRINA;
			case 20: return SOBRINO;
			case 21: return TIA;
			case 22: return TIA_ABUELA;
			case 23: return TIO;
			case 24: return TIO_ABUELO;
			case 25: return TUTOR;
			case 26: return OTRO;
			
			default:
				throw new InvalidParameterException("Vinculo desconocido: "
						+ tipo);
			}
		
	}

	/**
	 * @return
	 */
	public static List<Vinculo> getListaVinculos() {
		return Arrays.asList(values());
	}

	
}
