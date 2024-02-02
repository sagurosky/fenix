package org.cimientos.intranet;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 * Parser
 * 
 * @author Juan Irungaray
 * 
 */
public abstract class Parser {

	private int count;

	public Parser(File source, Session session) throws IOException {
		//System.out.println("Migrando entidades del archivo:" + source.getName());
		count = 0;
		Transaction tx = session.beginTransaction();
		FileInputStream fstream = new FileInputStream(source);
		// Get the object of DataInputStream
		DataInputStream in = new DataInputStream(fstream);
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		String strLine;
		// Read File Line By Line
		while ((strLine = br.readLine()) != null) {
			handleLine(strLine, session, count);
			count++;
		}
		// Close the input stream
		in.close();
		try {
			tx.commit();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		////System.out.println("se migraron exitosamente " + count + " entidades");
		session.close();			
		

	}

	public abstract void handleLine(String line, Session session, int count);

	public int getCount() {
		return count;
	}
}
