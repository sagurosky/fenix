/**
 * 
 */
package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;



/**
 * @author msagarduy
 * 
 */
public enum RolUsuario 
{
	
	
	DI(12, "DI"),
	ESCUELAS(7, "ESCUELAS"),
	RRHH(9, "RRHH"),
	CORRECTOR(10, "CORRECTOR"),
	ADMINISTRADOR(1, "ADMINISTRADOR"),
	ADMINISTRACION(11, "ADMINISTRACION"),
	VOLUNTARIADO(6, "VOLUNTARIADO"),
	PBE(2, "PBE"),
	EA(3, "EA"),
	RR(4, "RR"),
	TS(5, "TS"),
	SELECCION(8, "SELECCION");
	
	private Integer id;
	private String valor;
	
	private RolUsuario(Integer id, String valor) {
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

	public static RolUsuario getRolUsuario(Integer tipo) {
		switch (tipo) {
		case 1:
			return ADMINISTRADOR;
			case 2:
			return PBE;
			case 3:
			return EA;
			case 4:
			return RR;
			case 5:
			return TS;
			case 6:
			return VOLUNTARIADO;
			case 7:
			return ESCUELAS;
			case 8:
			return SELECCION;
			case 9:
			return RRHH;
			case 10:
			return CORRECTOR;
			case 11:
			return ADMINISTRACION;
			case 12:
			return DI;

		default:
			throw new InvalidParameterException("Rol de Usuario desconocido: "
					+ tipo);
		}
	}

	/**
	 * @return
	 */
	public static List<RolUsuario> getListaRoles() {
		return Arrays.asList(values());
	}

	
	
}
