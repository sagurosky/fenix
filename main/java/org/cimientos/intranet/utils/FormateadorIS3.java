package org.cimientos.intranet.utils;

public class FormateadorIS3 
{
	//Fin de Participación del PBE - No Aplica
	private static final String TEXTO_IS3_FINPBE_NOAPLICA_1 = " ha finalizado de cursar el secundario y culminado así su participación en el Programa Futuros Egresados. " + 
													  		  "A partir de ahora " ;
	
	private static final String TEXTO_IS3_FINPBE_NOAPLICA_2 = " pasará a formar parte de la 'Red de Egresados'," + 
													  		  " que tiene por finalidad acompañar a los jóvenes egresados del Programa Futuros Egresados en su transición al mundo educativo-laboral adulto." + 
													  		  " A través de ésta se ofrecerán oportunidades laborales y de formación. ";
	
	//En condiciones de renovar - No Aplica
	private static final String TEXTO_IS3_ENCONDICIONESRENOVAR_NOAPLICA_1 = " ha sido promovido/a a ";
	
	private static final String TEXTO_IS3_ENCONDICIONESRENOVAR_NOAPLICA_2 =	" y ha cumplido con el compromiso asumido hacia el Programa Futuros Egresados durante el ciclo lectivo ";
																	
	private static final String TEXTO_IS3_ENCONDICIONESRENOVAR_NOAPLICA_3 = " Por ello está en condiciones de renovar su beca para el año próximo. " + 
																			" La renovación de su beca se hará efectiva al momento de firmar el acta de compromiso en la primera entrevista del año que viene. ";

	//Pendiente - No Aplica
	private static final String TEXTO_IS3_PENDIENTE_NOAPLICA = " deberá rendir materias pendientes en el/ los período/s compensatorios de diciembre y/o marzo. Por ello la renovación de su beca se definirá una vez concluidos los períodos de evaluación. ";

	//No Renueva - Mudanza PBE no está
	private static final String TEXTO_IS3_NORENUEVA_MUDANZAPBE_1 = "Deseamos comunicarle que ";
	
	private static final String TEXTO_IS3_NORENUEVA_MUDANZAPBE_2 = " no podrá continuar participando en el Programa Futuros Egresados dado que se ha mudado a una localidad en la que Cimientos aún no tiene presencia. ";

	
	//No Renueva - Incumplimiento compromisos PBE
	private static final String TEXTO_IS3_NORENUEVA_INCUMPLIMIENTOPBE_1 = "Lamentamos informarle que a ";
	
	private static final String TEXTO_IS3_NORENUEVA_INCUMPLIMIENTOPBE_2 = " no se le renovará la beca para el año próximo debido a que no logró cumplir con los compromisos acordados en el Programa Futuros Egresados durante el transcurso del ciclo lectivo. ";


	//No Renueva - Renuncia Beca
	private static final String TEXTO_IS3_NORENUEVA_RENUNCIABECA_1 = "Deseamos comunicarle que ";
	
	private static final String TEXTO_IS3_NORENUEVA_RENUNCIABECA_2 = " ha renunciado a la beca y por lo tanto no continuará participando en el Programa Futuros Egresados. ";

	//No Renueva - Repitencia
	private static final String TEXTO_IS3_NORENUEVA_REPITENCIA_1 = "Lamentamos informarle que ";
	
	private static final String TEXTO_IS3_NORENUEVA_REPITENCIA_2 = " no logró aprobar el año escolar y deberá repetir el curso.  Dado que la promoción anual es condición fundamental para la renovación de la beca,";
	
	private static final String TEXTO_IS3_NORENUEVA_REPITENCIA_3 = " no continuará participando del Programa Futuros Egresados durante el nuevo ciclo lectivo. Se conversó para alentarla/o a perseverar y continuar estudiando,";
	
	private static final String TEXTO_IS3_NORENUEVA_REPITENCIA_4 = " de modo que esta experiencia pueda constituir un verdadero aprendizaje. ";

	//No Renueva - Abandono Escolar
	private static final String TEXTO_IS3_NORENUEVA_ABANDONOESCOLAR_1 = "Lamentamos informarle que ";

	private static final String TEXTO_IS3_NORENUEVA_ABANDONOESCOLAR_2 = " abandonó la escuela. Es por ello que no podrá participar del Programa Futuros Egresados durante el nuevo ciclo lectivo.";

	private static final String TEXTO_IS3_NORENUEVA_ABANDONOESCOLAR_3 = " Se conversó sobre la importancia de asistir a la escuela y se la/lo alentó a retomar los estudios en cuanto le sea posible. ";


	//No Renueva - Cambio Situación Económica
	private static final String TEXTO_IS3_NORENUEVA_CAMBIOSITUACION_1 = "Deseamos comunicarle que la familia de ";
	
	private static final String TEXTO_IS3_NORENUEVA_CAMBIOSITUACION_2 = " ha logrado mejorar su situación económica. Afortunadamente ";
	
	private static final String TEXTO_IS3_NORENUEVA_CAMBIOSITUACION_3 = " tiene la posibilidad de continuar sus estudios sin necesidad del apoyo económico de la beca. ";

	//No Renueva - Cambio Escuela
	private static final String TEXTO_IS3_NORENUEVA_CAMBIOESCUELA_1 = "Deseamos comunicarle que ";

	private static final String TEXTO_IS3_NORENUEVA_CAMBIOESCUELA_2 = " no podrá continuar participando en el Programa Futuros Egresados dado que se ha cambiado a una escuela en la que Cimientos aún no está trabajando. ";


	
	public static String getTextoFinPbeNoAplica(String becado)
	{
		return becado + TEXTO_IS3_FINPBE_NOAPLICA_1 + becado + TEXTO_IS3_FINPBE_NOAPLICA_2;
	}

	public static String getTextoEnCondicionesRenovarNoAplica(String becado, String anioEscolarSiguienteActual, String ciclo)
	{
		return becado + TEXTO_IS3_ENCONDICIONESRENOVAR_NOAPLICA_1 + anioEscolarSiguienteActual + TEXTO_IS3_ENCONDICIONESRENOVAR_NOAPLICA_2 + ciclo + TEXTO_IS3_ENCONDICIONESRENOVAR_NOAPLICA_3;
	}
	
	public static String getTextoPendienteNoAplica(String becado)
	{
		return becado + TEXTO_IS3_PENDIENTE_NOAPLICA;
	}
	
	public static String getTextoNoRenuevaMudanzaPbe(String becado)
	{
		return TEXTO_IS3_NORENUEVA_MUDANZAPBE_1 + becado + TEXTO_IS3_NORENUEVA_MUDANZAPBE_2;
	}
	
	public static String getTextoNoRenuevaIncumplimiento(String becado)
	{
		return TEXTO_IS3_NORENUEVA_INCUMPLIMIENTOPBE_1 + becado + TEXTO_IS3_NORENUEVA_INCUMPLIMIENTOPBE_2;
	}
	
	public static String getTextoNoRenuevaRenunciaBeca(String becado)
	{
		return TEXTO_IS3_NORENUEVA_RENUNCIABECA_1 + becado + TEXTO_IS3_NORENUEVA_RENUNCIABECA_2;
	}
	
	public static String getTextoNoRenuevaRepitencia(String becado)
	{
		return TEXTO_IS3_NORENUEVA_REPITENCIA_1 + becado + TEXTO_IS3_NORENUEVA_REPITENCIA_2 + TEXTO_IS3_NORENUEVA_REPITENCIA_3 +TEXTO_IS3_NORENUEVA_REPITENCIA_4;
	}
	
	public static String getTextoNoRenuevaAbandonoEscolar(String becado)
	{
		return TEXTO_IS3_NORENUEVA_ABANDONOESCOLAR_1 + becado +  TEXTO_IS3_NORENUEVA_ABANDONOESCOLAR_2 + TEXTO_IS3_NORENUEVA_ABANDONOESCOLAR_3;
	}
	
	public static String getTextoNoRenuevaCambioSituacion(String becado)
	{
		return TEXTO_IS3_NORENUEVA_CAMBIOSITUACION_1 + becado +  TEXTO_IS3_NORENUEVA_CAMBIOSITUACION_2 + becado + TEXTO_IS3_NORENUEVA_CAMBIOSITUACION_3;
	}
	
	public static String getTextoNoRenuevaCambioEscuela(String becado)
	{
		return TEXTO_IS3_NORENUEVA_CAMBIOESCUELA_1 + becado +  TEXTO_IS3_NORENUEVA_CAMBIOESCUELA_2;
	}
}
