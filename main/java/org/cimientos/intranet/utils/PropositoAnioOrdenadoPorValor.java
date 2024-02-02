package org.cimientos.intranet.utils;

import java.util.Comparator;

import com.cimientos.intranet.enumerativos.entrevista.PropositoAnioComienza;

public class PropositoAnioOrdenadoPorValor implements Comparator<PropositoAnioComienza>{

	public int compare(PropositoAnioComienza pp1, PropositoAnioComienza pp2) {
		return pp1.getValor().compareTo(
				pp2.getValor());
	}
}
