/**
 * 
 */
package org.cimientos.intranet.utils;

import java.util.List;

import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.servicio.EntrevistaSrv;
import org.cimientos.intranet.servicio.InformeSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Esta clase es encargada de la transferencia de informes y entrevistas inconclusos de un ea a otro
 * y de un rr a otro, en caso de reasignacion.
 * @author plabaronnie
 *
 */
@Component
public class ReasignacionHelper {

	@Autowired
	EntrevistaSrv entrevistaSrv;
	
	@Autowired
	InformeSrv informeSrv;

	/**
	 * Transfiere todas las entrevistas e informes inconclusos de un ea anterior al seleccionado.
	 * @param eaAnterior
	 * @param perfilEASeleccionado
	 * @param perfilesAlumnos
	 */
	public void transferirEntrevistasInformesEA(PerfilEA eaAnterior,
			PerfilEA eaSeleccionado, List<Long> idsAlumnosSeleccionados) {
	
		List<EntrevistaIndividual> entrevistasEa = entrevistaSrv.obtenerEntrevistasInconclusasAlumnosEa(eaAnterior, idsAlumnosSeleccionados);
		
		for (EntrevistaIndividual entrevista : entrevistasEa) {
			entrevista.setEa(eaSeleccionado);
			entrevistaSrv.guardarEntrevista(entrevista);
		}
		
		List<Informe> informesEa = informeSrv.obtenerInformesInconclusosAlumnosEa(eaAnterior, idsAlumnosSeleccionados);
		
		for (Informe informe : informesEa) {
			informe.setEaPerfil(eaSeleccionado);
			informeSrv.guardarInforme(informe);
		}
		
	}

	/**
	 * Transfiere todas las entrevistas e informes inconclusos de un rr anterior al seleccionado.
	 * @param rrAnterior
	 * @param perfilrrSeleccionado
	 * @param easIds
	 */
	public void transferirEntrevistasInformesRR(PerfilRR rrAnterior,
			PerfilRR rrSeleccionado, List<Long> easIds) {
		List<EntrevistaIndividual> entrevistasRR = entrevistaSrv.obtenerEntrevistasInconclusasEasRR(rrAnterior, easIds);
		
		for (EntrevistaIndividual entrevista : entrevistasRR) {
			entrevista.setRr(rrSeleccionado);
			entrevistaSrv.guardarEntrevista(entrevista);
		}
		
		List<Informe> informesRR = informeSrv.obtenerInformesInconclusosEasRR(rrAnterior, easIds);
		
		for (Informe informe : informesRR) {
			informe.setRrPerfil(rrSeleccionado);
			informeSrv.guardarInforme(informe);
		}
		
	}
	
	
}
