package org.cimientos.intranet.utils.hilos;

import org.apache.log4j.Logger;

/**
 * Esta clase se implemento con el fin de forzar al garbage collector a trabajar cada un intervalo
 * fijo de tiempo, para utilizarce en tareas que requieran grandes cantidades de memoria.
 * La idea es que cada cierto tiempo libere la memoria que no se usa, asi no tenemos problemas
 * con el tamano de la heap
 * @author Pablo
 *
 */
public class LiberarMemoria implements Runnable {

	private static final Logger log = Logger.getLogger(LiberarMemoria.class);
	
	@Override
	public void run() {
		log.info("Comenzando el proceso de liberar memoria con GC. " + Thread.currentThread().getName());
		for (int i = 1; i < 10; i++) {
			try {
				Thread.sleep(60000);
				System.gc();
				log.info("Ejecucion de GC nro " + i + " del " + Thread.currentThread().getName());
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		log.info("Finalizando el proceso de liberar memoria con GC. " + Thread.currentThread().getName());
	}
}