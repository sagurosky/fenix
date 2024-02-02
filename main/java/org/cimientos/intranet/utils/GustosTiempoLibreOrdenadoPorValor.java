package org.cimientos.intranet.utils;

import java.util.Comparator;

import com.cimientos.intranet.enumerativos.entrevista.GustosTiempoLibre;

public class GustosTiempoLibreOrdenadoPorValor implements Comparator<GustosTiempoLibre>{

	public int compare(GustosTiempoLibre pp1, GustosTiempoLibre pp2) {
		return pp1.getValor().compareTo(
				pp2.getValor());
	}

}
