/**
 * 
 */
package org.cimientos.intranet.utils.cuentas;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * Esta clase se utiliza para leer archivos TXT
 * @author plabaronnie
 * 
 */
public class TXTFileReader {
	private final InputStream fFile;
	private final String separador;
	private final int maxPalabrasLinea;
	

	/**
	 * Metodo constructor, se le pasa el input stream del archivo, 
	 * el separador de palabras, y la cantidad maxima de palabras por linea
	 * @param file
	 * @param separador
	 * @param maxPalabrasLinea
	 */
	public TXTFileReader(InputStream file, String separador, int maxPalabrasLinea) {
		fFile = file;
		this.separador = separador;
		this.maxPalabrasLinea = maxPalabrasLinea;
	}

	/**
	 * Procesa las lineas y las convierte en una lista de lineas 
	 * (cada linea es un array de strings correspondiente a las palabras por linea)
	 * @return
	 * @throws FileNotFoundException
	 */
	public final List<String[]> getLineas() throws FileNotFoundException {
		Scanner scanner = new Scanner(fFile);
		List<String[]> lineas = new ArrayList<String[]>();
		try {
			while (scanner.hasNextLine()) {
				String[] linea = processLine(scanner.nextLine());
				lineas.add(linea);
			}
			return lineas;
		} finally {
			scanner.close();
		}
	}

	
	/**
	 * Procesa cada linea y devuelve un array de string que son las palabras por linea.
	 * @param aLine
	 * @return
	 */
	protected String[] processLine(String aLine) {
		String[] linea = new String[maxPalabrasLinea];
		Scanner scanner = new Scanner(aLine);
		scanner.useDelimiter(separador);
		if (scanner.hasNext()) {
			for (int j = 0; j < maxPalabrasLinea; j++) {
				linea[j] =  scanner.next();
				
			}
		} 
		return linea;
	}

	/**
	 * Devuelve la linea con el numero de linea por parametro, si existe.
	 * @param numLinea
	 * @return
	 */
	public final String getLine(int numLinea){
		String linea = "";
		Scanner scanner = new Scanner(fFile);
		for (int i = 0; i < numLinea; i++) {
			if(scanner.hasNextLine()){
				linea = scanner.nextLine();
			}
			
		}
		return linea;
		
	}
	
}
