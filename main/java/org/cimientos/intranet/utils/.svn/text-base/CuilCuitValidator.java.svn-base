/**
 * 
 */
package org.cimientos.intranet.utils;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;

@Component
public class CuilCuitValidator {

	/**
	 * @param numeroIdentif
	 * @param errors
	 * @param field
	 *            numeros de prueba: 23-32223035-4 30-68151999-4
	 */
	public void validateCuilCuit(String numeroIdentif, BindingResult errors,
			String field) {

		if (StringUtils.isNotEmpty(numeroIdentif)) {

			int mod, digVerif;
			int suma = 0;
			int longitud = numeroIdentif.length();
			String patron = "5432765432";

			if (longitud == 11) {

				if (numeroIdentif.substring(0, 2).compareTo("20") == 0
						|| numeroIdentif.substring(0, 2).compareTo("23") == 0
						|| numeroIdentif.substring(0, 2).compareTo("24") == 0
						|| numeroIdentif.substring(0, 2).compareTo("27") == 0
						|| numeroIdentif.substring(0, 2).compareTo("30") == 0) {

					for (int i = 0; i <= 9; i++) {
						suma += Integer.parseInt(patron.substring(i, i + 1))
								* Integer.parseInt(numeroIdentif.substring(i,
										i + 1));
					}

					mod = suma % 11;
					digVerif = 11 - mod;

					if (digVerif == 11) {
						digVerif = 0;
					} else if (digVerif == 10) {
						digVerif = 9;
					}

					if (digVerif != Integer.valueOf(numeroIdentif.substring(10,
							11))) {
						errors.rejectValue(field, "001",
								" Falló la verificación: El "
										+ field.toUpperCase()
										+ " ingresado es inválido.");
					}

				} else {
					errors.rejectValue(field, "001",
							"Los 2 primeros dígitos de " + field.toUpperCase()
									+ " son erróneos.");
				}

			} else {
				errors.rejectValue(field, "001", "La longitud de "
						+ field.toUpperCase()
						+ " debe ser de 11 caracteres.");
			}
		}
	}

}
