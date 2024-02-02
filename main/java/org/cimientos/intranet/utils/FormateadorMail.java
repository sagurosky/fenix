package org.cimientos.intranet.utils;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;

/**
 * @author msagarduy Esta clase fue creada con motivo de armar el contenido de
 *         los emails de los informes y comunicados.
 */
public class FormateadorMail {

	// Títulos
	private static final String TITULO_FP = "::FICHA DE PRESENTACION::";
	private static final String TITULO_IS1 = "::INFORME DE SEGUIMIENTO Nro 1::";
	private static final String TITULO_IS2 = "::INFORME DE SEGUIMIENTO Nro 2::";
	private static final String TITULO_IS3 = "::INFORME DE SEGUIMIENTO Nro 3::";
	private static final String TITULO_IC = "::INFORME DE CESACION::";
	private static final String TITULO_CP = "::COMUNICADO DE RENOVACION PENDIENTE::";
	private static final String TITULO_CNR = "::COMUNICADO DE NO RENOVACION::";

	private static final String TITULO_FP_CORP = "-FICHA DE PRESENTACION-";
	private static final String TITULO_IC_COPR = "-INFORME DE CESACION-";
	private static final String TITULO_IS1_CORP = "-INFORME DE SEGUIMIENTO Nro 1-";
	private static final String TITULO_IS2_CORP = "-INFORME DE SEGUIMIENTO Nro 2-";
	private static final String TITULO_IS3_CORP = "-INFORME DE SEGUIMIENTO Nro 3-";

	// Firma
	private static final String USUARIO_FABRO = "Fabro";

	private static final String USUARIO_ROLLA = "Rolla";

	private static final String USUARIO_BARBOSA = "Barbosa";

	private static final String FIRMA_PI_PARTE2 = "<br></br>Desarrollo Institucional <br></br>"
			+ "Cimientos | construyamos desde la educaci&oacute;n <br></br>"
			+ "Tel/Fax: (011) 4829 8600 ";

	private static final String FIRMA_PC_PARTE2 = "<br></br>Desarrollo Institucional <br></br>"
			+ "Cimientos | construyamos desde la educaci&oacute;n <br></br>"
			+ "Tel/Fax: (011) 4829 8600 ";

	private static final String FIRMA_PARTE3 = "www.cimientos.org <br></br>"
			+ "<br></br>"
			+ "Si este correo fue enviado a usted por error, le agradecemos notifique al remitente.";

	private static final String FIRMA_PC_INTERNO_ROLLA = "Int. 652 <br></br>";

	private static final String FIRMA_PC_INTERNO_BARBOSA = "Int. 623 <br></br>";

	private static final String FIRMA_PI_INTERNO_FABRO = "Int. 658 <br></br>";

	// Contenido Comunicado Pendiente
	private static final String CONTENIDO_CP_MOTIVO1_PARTE1 = "<br></br><br></br>Queremos informarle que la renovaci&oacute;n de la beca de ";
	private static final String CONTENIDO_CP_MOTIVO1_PARTE2 = ", de ";
	private static final String CONTENIDO_CP_MOTIVO1_PARTE3 = " a&uacute;n est&aacute; pendiente debido a que su situaci&oacute;n escolar todav&iacute;a no se ha  "
			+ "definido. Dado su compromiso y buena respuesta respecto del Programa, "
			+ "vemos oportuno aguardar un mes para resolver el estado de la beca de su "
			+ "ahijado/a para el presente ciclo lectivo. En cuanto tengamos novedades, nos volveremos a contactar con usted. <br></br><br></br>"
			+ "Quedo a disposici&oacute;n ante cualquier consulta. <br></br>"
			+ "<br></br>Saludos, <br></br><br></br>";

	private static final String CONTENIDO_CP_MOTIVO2_PARTE1 = "<br></br><br></br>Queremos informarle que la renovaci&oacute;n de la beca de ";
	private static final String CONTENIDO_CP_MOTIVO2_PARTE2 = ", de ";
	private static final String CONTENIDO_CP_MOTIVO2_PARTE3 = " a&uacute;n est&aacute; pendiente debido a que no se lo ha podido localizar luego del "
			+ "receso escolar. Dado su compromiso y buena respuesta respecto del Programa, "
			+ "en el ciclo anterior, vemos oportuno hacer todo lo posible por "
			+ "recuperar el contacto. Es por ello que el estado de la beca de su ahijado/a para el "
			+ "presente ciclo lectivo todav&iacute;a est&aacute; pendiente. <br></br><br></br>"
			+ "En cuanto tengamos novedades, nos volveremos a contactar con usted. <br></br><br></br>"
			+ "Quedo a disposici&oacute;n ante cualquier consulta. <br></br>"
			+ "<br></br>Saludos, <br></br><br></br>";
	
	private static final String CONTENIDO_CP_MOTIVOOTRO_PARTE1 = "<br></br><br></br>";
	private static final String CONTENIDO_CP_MOTIVOOTRO_PARTE2 = "<br></br><br></br>"
			+ "Quedo a disposici&oacute;n ante cualquier consulta. <br></br>"
			+ "<br></br>Saludos, <br></br><br></br>";

	// private static final String CONTENIDO_CP_MOTIVOOTRO_PARTE4 = ;

	//Contenido anterior al final de TODOS los comunicados de no renovación
	private static final String CONTENIDO_CNR_ANTERIOR_FINAL_PARTE1 = "<br></br><br></br>Si bien ";
	private static final String CONTENIDO_CNR_ANTERIOR_FINAL_PARTE2 = "no continuar&aacute; participando del Programa, resulta "
			+ "importante destacar que el trabajo realizado desde el acompa&ntilde;amiento, ha permitido que adquiera herramientas para optimizar "
			+ "la administraci&oacute;n de su tiempo, organizar su material escolar, incorporar t&eacute;cnicas de estudio y desarrollar habilidades "
			+ "en la comunicaci&oacute;n con sus pares y docentes, que incidir&aacute;n positivamente en su trayectoria escolar.";
	
	// Contenido final de TODOS los comunicados de no renovación
	private static final String CONTENIDO_CNR_FINAL = "<br></br><br></br>Aprovechamos la oportunidad para comunicarle que el equipo de selecci&oacute;n "
			+ "trabaja en la b&uacute;squeda de nuevos becados para cubrir la vacante. "
			+ "Le informaremos oportunamente sobre la incorporaci&oacute;n de su nuevo/a ahijado/a. <br></br><br></br>"
			+ "Quedo a disposici&oacute;n ante cualquier consulta. <br></br><br></br>Saludos, <br></br><br></br>";

	// Bajo compromiso con el PBE
	private static final String CONTENIDO_CNR_MOTIVO1_PARTE1 = "<br></br><br></br>Lamentamos informarle que ";
	private static final String CONTENIDO_CNR_MOTIVO1_PARTE2 = "no ha renovado su beca debido a que no logr&oacute; cumplir con los compromisos acordados en el "
			+ "Programa Futuros Egresados durante el transcurso del ciclo lectivo anterior. ";

	// Materias previas de a&ntilde;os anteriores
	private static final String CONTENIDO_CNR_MOTIVO2_PARTE1 = "<br></br><br></br>Lamentamos informarle que ";
	private static final String CONTENIDO_CNR_MOTIVO2_PARTE2 = "no ha renovado su beca debido a que adeuda "
			+ "materias previas m&aacute;s all&aacute; de las permitidas por el Programa. ";

	// Cambio en la situación económica
	private static final String CONTENIDO_CNR_MOTIVO3_PARTE1 = "<br></br><br></br>Deseamos comunicarle que la familia de ";
	private static final String CONTENIDO_CNR_MOTIVO3_PARTE2 = "ha logrado mejorar su situaci&oacute;n econ&oacute;mica. Afortunadamente ";
	private static final String CONTENIDO_CNR_MOTIVO3_PARTE3 = "tiene la posibilidad de continuar sus estudios sin necesidad del apoyo econ&oacute;mico de la beca.";


	// Cambio de escuela
	private static final String CONTENIDO_CNR_MOTIVO4_PARTE1 = "<br></br><br></br>Deseamos comunicarle que  ";
	private static final String CONTENIDO_CNR_MOTIVO4_PARTE2 = "no podr&aacute; continuar participando en el Programa dado que "
			+ "se ha cambiado a una escuela en la que Cimientos a&uacute;n no est&aacute; trabajando. ";


	// Mudanza
	private static final String CONTENIDO_CNR_MOTIVO5_PARTE1 = "<br></br><br></br>Deseamos comunicarle que  ";
	private static final String CONTENIDO_CNR_MOTIVO5_PARTE2 = "no podr&aacute; continuar participando en el Programa dado que "
			+ "se ha mudado a una localidad en la que Cimientos a&uacute;n no tiene presencia. ";

	// Abandono escolar
	private static final String CONTENIDO_CNR_MOTIVO6_PARTE1 = "<br></br><br></br>Lamentamos informarle que   ";
	private static final String CONTENIDO_CNR_MOTIVO6_PARTE2 = "abandon&oacute; la escuela. Es por ello que no podr&aacute; participar "
			+ "del Programa durante el nuevo ciclo lectivo. <br></br>"
			+ "Se convers&oacute; sobre la importancia de asistir a la escuela y se la/lo alent&oacute; a retomar los estudios en cuanto le sea posible. ";
	// Renuncia a la beca
	private static final String CONTENIDO_CNR_MOTIVO7_PARTE1 = "<br></br><br></br>Deseamos comunicarle que  ";
	private static final String CONTENIDO_CNR_MOTIVO7_PARTE2 = "ha renunciado a la beca y por lo tanto no continuar&aacute; "
			+ "participando en el Programa. ";

	// Repitencia
	private static final String CONTENIDO_CNR_MOTIVO8_PARTE1 = "<br></br><br></br>Lamentamos informarle que   ";
	private static final String CONTENIDO_CNR_MOTIVO8_PARTE2 = "no logr&oacute; aprobar el a&ntilde;o escolar y deber&aacute; repetir el curso. "
			+ "Dado que la promoci&oacute;n anual es condici&oacute;n fundamental para la renovaci&oacute;n de la beca, "
			+ "no continuar&aacute; participando del Programa durante el nuevo ciclo lectivo. <br></br>"
			+ "Se convers&oacute; para alentarla/o a perseverar y continuar estudiando, "
			+ "de modo que esta experiencia pueda constituir un verdadero aprendizaje. ";
	
	// Contenido Ficha de Presentación un Alumno
	private static final String CONTENIDO_FP_INDIVIDUAL_PARTE1 = "<br></br><br></br>Me pongo en contacto para acercar la Ficha de Presentaci&oacute;n de ";
	private static final String CONTENIDO_FP_INDIVIDUAL_PARTE2 = " a quien acompa&ntilde;ar&aacute; en su educaci&oacute;n.<br></br>"
			+ "<br></br>Todos los alumnos seleccionados para participar en el <strong>Programa Futuros Egresados</strong>, demuestran compromiso con su escolaridad, "
			+ "asisten a escuelas en las que se desarrolla el Programa y cuentan con un nivel de ingreso familiar por debajo del definido "
			+ "en base a la canasta b&aacute;sica total y al costo de vida de cada regi&oacute;n. "
			+ "<br></br><br></br>"
			+ "Quedo a disposici&oacute;n ante cualquier consulta. <br></br>"
			+ "Gracias por el constante apoyo y compromiso. <br></br> "
			+ " <br></br>Saludos, <br></br>" + "<br></br>";

	// Contenido Ficha de Presentación varios Alumnos
	private static final String CONTENIDO_FP_VARIOS_PARTE1 = "<br></br><br></br>Me pongo en contacto para acercar las Fichas de Presentaci&oacute;n de sus ahijados, a quienes acompa&ntilde;ar&aacute; en su educaci&oacute;n. ";
	private static final String CONTENIDO_FP_VARIOS_PARTE2 = "<br></br>"
			+ "<br></br>Todos los alumnos seleccionados para participar en el <strong>Programa Futuros Egresados</strong>, demuestran compromiso con su escolaridad, "
			+ "asisten a escuelas en las que se desarrolla el Programa y cuentan con un nivel de ingreso familiar por debajo del definido "
			+ "en base a la canasta b&aacute;sica total y al costo de vida de cada regi&oacute;n. "
			+ "<br></br><br></br>"
			+ "Quedo a disposici&oacute;n ante cualquier consulta. <br></br>"
			+ "Gracias por el constante apoyo y compromiso. <br></br> "
			+ " <br></br>Saludos, <br></br>" + "<br></br>";

	// Contenido IS1 un Alumno
	private static final String CONTENIDO_IS1_INDIVIDUAL_PARTE1 = "<br></br><br></br>Me pongo en contacto para acercarle el Informe de Seguimiento Nro 1 de ";
	private static final String CONTENIDO_IS1_INDIVIDUAL_PARTE2 = ", que contiene informaci&oacute;n relacionada con su participaci&oacute;n "
			+ "en el Programa. <br></br>"
			+ "Esperamos que este material sea de su inter&eacute;s y agradecemos su constante apoyo y compromiso. "
			+ "<br></br>"
			+ "<br></br>Ante cualquier inquietud, no deje de contactarse con nosotros. <br></br>"
			+ " <br></br>Saludos, <br></br>" + "<br></br>";
	// Contenido IS1 varios Alumnos
	private static final String CONTENIDO_IS1_VARIOS_PARTE1 = "<br></br><br></br>Me contacto para acercarle los Informes de Seguimiento Nro 1 de sus ahijados, ";
	private static final String CONTENIDO_IS1_VARIOS_PARTE2 = "que contienen informaci&oacute;n relacionada con su participaci&oacute;n "
			+ "en el Programa. <br></br>"
			+ "Esperamos que este material sea de su inter&eacute;s y agradecemos su constante apoyo y compromiso. "
			+ "<br></br>"
			+ "<br></br>Quedo a disposici&oacute;n ante cualquier consulta. <br></br>"
			+ "<br></br>Saludos, <br></br>" + "<br></br>";

	// Contenido IS2 un Alumno
	private static final String CONTENIDO_IS2_INDIVIDUAL_PARTE1 = "<br></br><br></br>Me pongo en contacto para acercar el Informe de Seguimiento Nro 2 de ";
	private static final String CONTENIDO_IS2_INDIVIDUAL_PARTE2 = ", en donde se encuentra la informaci&oacute;n relacionada con el desempe&ntilde;o "
			+ "escolar en el marco del Programa. <br></br>"
			+ "<br></br><br></br>"
			+ "Esperamos que este material sea de su inter&eacute;s y agradecemos su constante apoyo y compromiso. "
			+ "<br></br><br></br>"
			+ "Ante cualquier inquietud, no deje de contactarse con nosotros. <br></br>"
			+ "<br></br><br></br>";

	// Contenido IS2 varios Alumnos
	private static final String CONTENIDO_IS2_VARIOS_PARTE1 = "<br></br><br></br>Nos ponemos en contacto para acercarle los Informes de Seguimiento Nro 2 de sus ahijados. ";
	private static final String CONTENIDO_IS2_VARIOS_PARTE2 = "En este documento encontrar&aacute; la informaci&oacute;n relacionada a su desempe&ntilde;o escolar y participaci&oacute;n en el Programa.  "
			+ "<br></br><br></br>"
			+ "Esperamos que este material sea de su inter&eacute;s y agradecemos su constante apoyo y compromiso. "
			+ "<br></br><br></br>"
			+ "Ante cualquier inquietud, no deje de contactarse con nosotros. <br></br>"
			+ "<br></br><br></br>";

	// Contenido IS3 un Alumno
	private static final String CONTENIDO_IS3_INDIVIDUAL_PARTE1 = "<br></br><br></br>Me pongo en contacto para acercar el Informe de Seguimiento Nro 3 de ";
	private static final String CONTENIDO_IS3_INDIVIDUAL_PARTE2 = ", en donde se encuentra la informaci&oacute;n relacionada con el cierre del ciclo escolar "
			+ "en el marco del Programa. <br></br>"
			+ "<br></br><br></br>"
			+ "Gracias por el constante apoyo y compromiso. "
			+ "<br></br><br></br>"
			+ "Quedo a disposici&oacute;n ante cualquier consulta. <br></br>"
			+ "<br></br>" + "Saludos,<br></br><br></br>";
	// Contenido IS3 varios Alumnos
	private static final String CONTENIDO_IS3_VARIOS_PARTE1 = "<br></br>Nos ponemos en contacto para acercarle el Informe de Seguimiento Nro 3 de sus ahijados. ";
	private static final String CONTENIDO_IS3_VARIOS_PARTE2 = "En este documento encontrar&aacute; la informaci&oacute;n relacionada con el cierre del ciclo escolar de los alumnos. <br></br><br></br>"
			+ "Esperamos que este material sea de su inter&eacute;s y agradecemos su constante apoyo y compromiso. "
			+ "<br></br><br></br>"
			+ "Ante cualquier inquietud, no deje de contactarse con nosotros. <br></br>"
			+ "<br></br>" + "Saludos,<br></br><br></br>";

	// Contenido Informe de Cesación un Alumno
	private static final String CONTENIDO_IC_INDIVIDUAL_PARTE1 = "<br></br>Nos ponemos en contacto para informarle que, lamentablemente, ";
	private static final String CONTENIDO_IC_INDIVIDUAL_PARTE2 = "ha dejado de participar en el Programa.<br></br>"
			+ "Si bien a trav&eacute;s del acompa&ntilde;amiento mensual se busc&oacute; sostener su escolaridad y participaci&oacute;n en el programa, finalmente fue necesario tomar esta decisi&oacute;n que fue conversada con la familia. <br></br><br></br>"
			+ "En el documento adjunto encontrar&aacute; informaci&oacute;n sobre el trabajo realizado. <br></br><br></br>"
			+
			// "Aprovechamos la oportunidad para comunicarle que el equipo de selecci&oacute;n trabaja en la b&uacute;squeda de nuevos becados para cubrir la vacante. <br></br>"
			// + "" +
			"Le informaremos oportunamente sobre la incorporaci&oacute;n de su nuevo/a ahijado/a.<br></br>"
			+ "<br></br>"
			+ "Quedo a disposici&oacute;n ante cualquier consulta. <br></br>"
			+ "<br></br>"
			+ "Gracias por el constante apoyo y compromiso."
			+ "<br></br><br></br>";

	// Contenido Informe de Cesación varios Alumnos
	private static final String CONTENIDO_IC_VARIOS_PARTE1 = "<br></br>Me pongo en contacto para informarle acerca de alumnos que han dejado de participar en el Programa. ";
	private static final String CONTENIDO_IC_VARIOS_PARTE2 = "Si bien a trav&eacute;s del acompa&ntilde;amiento mensual se busc&oacute; sostener su escolaridad y participaci&oacute;n en el programa, finalmente fue necesario tomar esta decisi&oacute;n que fue conversada con la familia. <br></br><br></br>"
			+ "En el documento adjunto encontrar&aacute; informaci&oacute;n sobre el trabajo realizado. <br></br><br></br>"
			+
			// "Aprovechamos la oportunidad para comunicarle que el equipo de selecci&oacute;n trabaja en la b&uacute;squeda de nuevos becados para cubrir la vacante. <br></br>"
			// + "" +
			"Le informaremos oportunamente sobre la incorporaci&oacute;n de su nuevo/a ahijado/a. <br></br>"
			+ "<br></br>"
			+ "Ante cualquier inquietud, no deje de contactarse con nosotros. <br></br>"
			+ "<br></br>"
			+ "Gracias por el constante apoyo y compromiso."
			+ "<br></br><br></br>";
	
	private static final String TIPO_MAIL_INDIVIDUAL ="Individual";
	private static final String TIPO_MAIL_GRUPAL ="Grupal";
	
	public static List<String> getTipoMails(){
		List<String> tipoMails = new ArrayList<String>();	
		tipoMails.add(TIPO_MAIL_INDIVIDUAL);
		tipoMails.add(TIPO_MAIL_GRUPAL);
		return tipoMails;
	}

	public static String getTipoMailIndividual() {
		return TIPO_MAIL_INDIVIDUAL;
	}
	
	public static String getTipoMailGrupal() {
		return TIPO_MAIL_GRUPAL;
	}
	
	public static String getTituloFp() {
		return TITULO_FP;
	}

	public static String getTituloIs1() {
		return TITULO_IS1;
	}

	public static String getTituloIs2() {
		return TITULO_IS2;
	}

	public static String getTituloIs3() {
		return TITULO_IS3;
	}

	public static String getTituloIc() {
		return TITULO_IC;
	}

	public static String getTituloCp() {
		return TITULO_CP;
	}

	public static String getTituloCnr() {
		return TITULO_CNR;
	}

	public static String getContenidoFp(String padrino, String nombreApellido,
			String usuarioDi, TipoPadrino tipoPadrino) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_FP_INDIVIDUAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_FP_INDIVIDUAL_PARTE2
				+ getFirma(usuarioDi, tipoPadrino);
	}

	public static String getContenidoVariasFp(String padrino, String usuarioDi,
			TipoPadrino tipoPadrino) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_FP_VARIOS_PARTE1 + CONTENIDO_FP_VARIOS_PARTE2
				+ getFirma(usuarioDi, tipoPadrino);
	}

	public static String getContenidoIs1(String padrino, String nombreApellido,
			String usuarioDi, TipoPadrino tipoPadrino) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_IS1_INDIVIDUAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_IS1_INDIVIDUAL_PARTE2
				+ getFirma(usuarioDi, tipoPadrino);
	}

	public static String getContenidoVariosIs1(String padrino,
			String usuarioDi, TipoPadrino tipoPadrino) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_IS1_VARIOS_PARTE1 + CONTENIDO_IS1_VARIOS_PARTE2
				+ getFirma(usuarioDi, tipoPadrino);
	}

	public static String getContenidoIs2(String padrino, String nombreApellido,
			String usuarioDi, TipoPadrino tipoPadrino) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_IS2_INDIVIDUAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_IS2_INDIVIDUAL_PARTE2
				+ getFirma(usuarioDi, tipoPadrino);
	}

	public static String getContenidoVariosIs2(String padrino,
			String usuarioDi, TipoPadrino tipoPadrino) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_IS2_VARIOS_PARTE1 + CONTENIDO_IS2_VARIOS_PARTE2
				+ getFirma(usuarioDi, tipoPadrino);
	}

	public static String getContenidoIs3(String padrino, String nombreApellido,
			String usuarioDi, TipoPadrino tipoPadrino) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_IS3_INDIVIDUAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_IS3_INDIVIDUAL_PARTE2
				+ getFirma(usuarioDi, tipoPadrino);
	}

	public static String getContenidoVariosIs3(String padrino,
			String usuarioDi, TipoPadrino tipoPadrino) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_IS3_VARIOS_PARTE1 + CONTENIDO_IS3_VARIOS_PARTE2
				+ getFirma(usuarioDi, tipoPadrino);
	}
	
//	public static String getContenidoVariosIs3(String padrino, String contenido,
//			String usuarioDi, TipoPadrino tipoPadrino) {
//		return Formateador.reemplazarAcentosHtml(padrino) + contenido
//				+ getFirma(usuarioDi, tipoPadrino);
//	}

	public static String getContenidoIc(String padrino, String nombreApellido,
			String usuarioDi, TipoPadrino tipoPadrino) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_IC_INDIVIDUAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido) + " "
				+ CONTENIDO_IC_INDIVIDUAL_PARTE2
				+ getFirma(usuarioDi, tipoPadrino);

	}

	public static String getContenidoVariosIc(String padrino, String usuarioDi,
			TipoPadrino tipoPadrino) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_IC_VARIOS_PARTE1 + CONTENIDO_IC_VARIOS_PARTE2
				+ getFirma(usuarioDi, tipoPadrino);
	}

	public static String getContenidoCpMotivo1(String padrino,
			String nombreApellido, String zona, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CP_MOTIVO1_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CP_MOTIVO1_PARTE2 + zona
				+ CONTENIDO_CP_MOTIVO1_PARTE3
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getContenidoCpMotivo2(String padrino,
			String nombreApellido, String zona, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CP_MOTIVO2_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CP_MOTIVO2_PARTE2 + zona
				+ CONTENIDO_CP_MOTIVO2_PARTE3
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getContenidoCpMotivoOtro(String padrino,
			String motivoOtro, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CP_MOTIVOOTRO_PARTE1
				+ motivoOtro 
				+ CONTENIDO_CP_MOTIVOOTRO_PARTE2
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getContenidoCnrMotivo1(String padrino,
			String nombreApellido, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CNR_MOTIVO1_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_MOTIVO1_PARTE2
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE2
				+ CONTENIDO_CNR_FINAL
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getContenidoCnrMotivo2(String padrino,
			String nombreApellido, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CNR_MOTIVO2_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_MOTIVO2_PARTE2
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE2
				+ CONTENIDO_CNR_FINAL
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getContenidoCnrMotivo3(String padrino,
			String nombreApellido, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CNR_MOTIVO3_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_MOTIVO3_PARTE2 + nombreApellido
				+ CONTENIDO_CNR_MOTIVO3_PARTE3
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE2
				+ CONTENIDO_CNR_FINAL
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getContenidoCnrMotivo4(String padrino,
			String nombreApellido, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CNR_MOTIVO4_PARTE1 + nombreApellido
				+ CONTENIDO_CNR_MOTIVO4_PARTE2
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE2
				+ CONTENIDO_CNR_FINAL
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getContenidoCnrMotivo5(String padrino,
			String nombreApellido, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CNR_MOTIVO5_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_MOTIVO5_PARTE2
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE2
				+ CONTENIDO_CNR_FINAL
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getContenidoCnrMotivo6(String padrino,
			String nombreApellido, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CNR_MOTIVO6_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_MOTIVO6_PARTE2
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE2
				+ CONTENIDO_CNR_FINAL
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getContenidoCnrMotivo7(String padrino,
			String nombreApellido, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CNR_MOTIVO7_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_MOTIVO7_PARTE2
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE2
				+ CONTENIDO_CNR_FINAL
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getContenidoCnrMotivo8(String padrino,
			String nombreApellido, String usuarioDi) {
		return Formateador.reemplazarAcentosHtml(padrino) + ":<br></br>"
				+ CONTENIDO_CNR_MOTIVO8_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_MOTIVO8_PARTE2
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE1
				+ Formateador.reemplazarAcentosHtml(nombreApellido)
				+ CONTENIDO_CNR_ANTERIOR_FINAL_PARTE2
				+ CONTENIDO_CNR_FINAL
				+ getFirma(usuarioDi, TipoPadrino.INDIVIDUAL);
	}

	public static String getFirma(String usuarioDi, TipoPadrino tipoPadrino) {
		String firma;
		if (tipoPadrino.equals(TipoPadrino.INDIVIDUAL)) {
			if (usuarioDi.contains(USUARIO_FABRO))
				firma = Formateador.reemplazarAcentosHtml(usuarioDi)
						+ FIRMA_PI_PARTE2 + FIRMA_PI_INTERNO_FABRO
						+ FIRMA_PARTE3;
			else if (usuarioDi.contains(USUARIO_ROLLA))
				firma = Formateador.reemplazarAcentosHtml(usuarioDi)
						+ FIRMA_PI_PARTE2 + FIRMA_PC_INTERNO_ROLLA
						+ FIRMA_PARTE3;
			else if (usuarioDi.contains(USUARIO_BARBOSA))
				firma = Formateador.reemplazarAcentosHtml(usuarioDi)
						+ FIRMA_PI_PARTE2 + FIRMA_PC_INTERNO_BARBOSA
						+ FIRMA_PARTE3;
			else
				firma = Formateador.reemplazarAcentosHtml(usuarioDi)
						+ FIRMA_PI_PARTE2 + "<br>" + FIRMA_PARTE3;

		} else {
			if (usuarioDi.contains(USUARIO_FABRO))
				firma = Formateador.reemplazarAcentosHtml(usuarioDi)
						+ FIRMA_PI_PARTE2 + FIRMA_PI_INTERNO_FABRO
						+ FIRMA_PARTE3;
			else if (usuarioDi.contains(USUARIO_ROLLA))
				firma = Formateador.reemplazarAcentosHtml(usuarioDi)
						+ FIRMA_PC_PARTE2 + FIRMA_PC_INTERNO_ROLLA
						+ FIRMA_PARTE3;
			else if (usuarioDi.contains(USUARIO_BARBOSA))
				firma = Formateador.reemplazarAcentosHtml(usuarioDi)
						+ FIRMA_PC_PARTE2 + FIRMA_PC_INTERNO_BARBOSA
						+ FIRMA_PARTE3;
			else
				firma = Formateador.reemplazarAcentosHtml(usuarioDi)
						+ FIRMA_PC_PARTE2 + "<br>" + FIRMA_PARTE3;
		}
		return firma;
	}

	public static String getTituloIs1Corp() {
		return TITULO_IS1_CORP;
	}

	public static String getTituloIs2Corp() {
		return TITULO_IS2_CORP;
	}

	public static String getTituloIs3Corp() {
		return TITULO_IS3_CORP;
	}

	public static String getTituloFpCorp() {
		return TITULO_FP_CORP;
	}

	public static String getTituloIcCorp() {
		return TITULO_IC_COPR;
	}

}
