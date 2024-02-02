package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum ModalidadContratacion implements Serializable{
	
		EFECTIVO(1, "Efectivo"), 
		MONOTRIBUTISTA(2, "Monotributista"),
		FACTURA(3, "Factura"),
		PLAZO_FIJO(4, "Plazo Fijo"),
		VOLUNTARIA(5, "Voluntaria"),
		OTROS(6, "Otros"),
		VACIO(7, "");
		
		private int id;
		private String valor;

				
		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}


		public String getValor() {
			return valor;
		}


		public void setValor(String valor) {
			this.valor = valor;
		}


		private ModalidadContratacion(int id, String valor) {
			this.id = id;
			this.valor = valor;
		}


		public static ModalidadContratacion getModalidadContratacion(int id) {
			switch (id) {
			case 1:
				return EFECTIVO;
			case 2:
				return MONOTRIBUTISTA;
			case 3:
				return FACTURA;
			case 4:
				return PLAZO_FIJO;
			case 5:
				return VOLUNTARIA;
			case 6:
				return OTROS;
			case 7:
				return VACIO;
			default:
				throw new InvalidParameterException("Modalidad desconocida: "+ id);
			}
		}
		
		public static List<ModalidadContratacion> getListaModalidad(){
			return Arrays.asList(values());
		}

	}	
	



