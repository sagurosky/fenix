package org.cimientos.intranet.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


/**
 * @author msagarduy
 * Clase utilizada para encriptar contrasena de usuarios.
 * Utiliza algoritmo de encriptacion MD5.
 * 
 */
public class UtilSrv {

	
	
	/**
	 * Encripta la password del usuario.
	 * @param toEncrypt
	 *            el texto a encriptar
	 * @return el etxto encriptado con Hash MD5
	 * 
	 */
	public static String hash(String toEncrypt) {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(toEncrypt.getBytes());

			BigInteger number = new BigInteger(1, messageDigest);
			return number.toString(16);

		} catch (NoSuchAlgorithmException e) {
			throw new InternalError("Hashing algorythm not supported");
		}
	}
	

}
