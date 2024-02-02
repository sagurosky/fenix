package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.cimientos.intranet.utils.GustosTiempoLibreOrdenadoPorValor;
import org.cimientos.intranet.utils.PropositoAnioOrdenadoPorValor;

public enum PropositoAnioComienza {
	
	MASTIEMPOESTUDIO(1,"Dedicarle más tiempo al estudio"),
	NOLLEVARMEMATERIAS(2,"No llevarme materias"),
	PORTARMEBIENCLASE(3,"Portarme mejor en clase"),
	PRESTARMASATENCIO(4,"Prestar más atención en clase"),
	PARTICIPARENCLASE(5,"Participar más activamente en clase"),
	CARPETAORDENADA(6,"Mantener mi carpeta ordenada"),
	PREGUNTARENCLASE(7,"Preguntar en clase cada vez que no entiendo algo"),
	CLASESPARTICULARES(8,"Acudir a clases particulares en las materias que más me cuestan"),
	HACERLATAREA(9,"Hacer la tarea ni bien llego a mi casa"),
	RELEERTODOSLOSDIAS(10,"Releer todos los días lo que me dan en la escuela"),
	BUENARELACIONCOMPAÑEROS(11,"Llevarme mejor con mis compañeros"),
	HACERMASAMIGOS(12,"Hacerme más amigos"),
	LEERMAS(13,"Leer más"),
	ESFORZARMEENMATERIAS(14,"Esforzarme más en la materia que más me cuesta"),
	MATERIASALDIA(15,"Llevar al día las materias"),
	CONVERSARMENOS(16,"Conversar menos en clase"),
	BUENDESEMPAÑOENMATERIAS(17,"Desempeñarme bien en todas las materias"),
	SERABANDERADO(18,"Ser abanderada/o"),
	APROBARPREVIAS(19,"Aprobar las materias previas"),
	ESTRATEGIASPARAMISPARES(20,"Generar estrategias para relacionarme con mis pares"),
	COMPROMISOCONESCUELA(21,"Comprometerme más con la escuela"),
	RENDIMIENTOINICIOAÑO(22,"Tener buen rendimiento desde comienzo de año"),
	ESFORZARSEDIAADIA(23,"Esforzarme día a día"),
	FINALIZARCONBUENASNOTAS(24,"Terminar el año con muy buenas notas"),
	NOFALTARACLASE(25,"No faltar tanto a clase"),
	CARPETASALDIA(26,"Llevar al día las carpetas"),
	PEDIRDEBERES(27,"Pedir las cosas que se hicieron cada vez que falto a la escuela"),
	PONERSELASPILAS(28,"Ponerme las pilas"),
	ACTIVIDADESEXTRACURRICULARES(29,"Poder continuar con las actividades extracurriculares"),
	NOCONFIARMECOMOAÑOANTERIOR(30,"No confiarme como el año pasado, ya que no me fue tan bien"),
	OBTENERTITULO(31,"Terminar bien la escuela y obtener el título"),
	SERMASORDENADO(32,"Tratar de ser un poco más ordenado, este año"),
	CARPETASCOMPLEJASYPROLIJAS(33,"Tener carpetas completas y prolijas"),
	ORGANIZARELTIEMPO(34,"Organizar mejor mis tiempos"),
	PRODUCTIVIDADTIEMPOLIBRE(35,"Hacer cosas productivas en mi tiempo libre"),
	ESMERARSEMAS(36,"Esmerarme más"),
	ESTUDIARPARARENOVARBECA(37,"Estudiar para renovar la beca"),
	PONERSELASPILASPARASIEMPRE(38,"Ponerme las pilas de una vez por todas con la escuela"),
	MEJORARMATERIASCONDIFICULTAD(39,"Mejorar en las materias que tengo más dificultad"),
	TERMINARBIENELAÑO(40,"Terminar bien el año escolar"),
	RENDIMIENTOAÑOANTERIOR(41,"Mantener el rendimiento del año anterior"),
	ADAPTACIONNUEVASCIRCUNSTANCIAS(42,"Poder adaptarme a las nuevas circunstancias"),
	LOGRARCAMBIOTURNO(43,"Poder lograr el cambio de turno"),
	GANASDEESTUDIAR(44,"Mantener las ganas de estudiar"),
	RESULTADOSSIMILARESAÑOANTERIOR(45,"Obtener resultados similares al año anterior"),
	APROVECHARNETRBOOK(46,"Aprovechar la netbook que me fue otorgada"),
	TENERBUENRENDIMIENTO(47,"Tener un buen rendimiento"),
	BUENARELACIONCONPROFESORES(48,"Llevarme bien con los profesores"),
	NODEJARESCUELAPORHIJO(49,"No dejar la escuela al nacer mi bebé"),
	ACTIVIDADPROXIMOAÑO(50,"Encontrar algo que me guste hacer para el próximo año"),
	CARRERAASEGUIR(51,"Definir la carrera que me gustaría seguir"),
	REALIZARDEPORTE(52,"Comenzar a hacer algún deporte"),
	MEJORAREXPRESIONORAL(53,"Mejorar en expresión oral"),
	MEJORAREXPRESIONESCRITA(54,"Mejorar en expresión escrita"),
	COMPROMISOCONELPROGRAMA(55,"Sostener mi compromiso para con el Programa"),
	ACTITUDPOSITIVACONELESTUDIO(56,"Tener una actitud positiva hacia el estudio"),
	OBTENERBUENOSRESULTADOS(57,"Obtener buenos resultados"),
	APROBARPREVIASJULIO(58,"Aprobar las previas en julio"),
	NOMOLESTARACOMPAÑEROS(59,"No molestar tanto a mis compañeros"),
	IRATUTORIAS(60,"Ir a las tutorías"),
	NOESPERARAQUEMEVAYAMAL(61,"No esperar a que me vaya mal, para reaccionar"),
	SERMASTOLERANTECONCOMPAÑEROS(62,"Ser más tolerante con mis compañeros"),
	LEVANTARNOTAS(63,"Levantar algunas notas"),
	PASARDEAÑOSINLLEVARSEMATERIAS(64,"Pasar de año sin llevarme materias"),
	BUENDESEMPEÑOENNUEVAESCUELA(65,"Que me vaya bien en la nueva escuela"),
	CONSTANTEDURANTEELAÑO(66,"Ser más constante durante el año"),
	PASARDEAÑO(67,"Pasar de año"),
	CUMPLIRPROPOSITOSPLANTEADOS(68,"Cumplir con los propósitos que me plantée en las entrevistas"),
	COMENZARESTUDIANDOPARAEXAMENES(69,"Comenzar el año estudiando para los exámenes"),
	NOBAJARRENDIMIENTO(70,"No bajar el rendimiento"),
	NOPERDERREGULARIDAD(71,"No perder la condición de alumno regular"),
	NOESTARAJUSTADOCONLASNOTAS(72,"No estar tan ajustado con las notas"),
	SUPERARTIMIDEZ(73,"Superar mi timidez para hablar con los profesores y con mis compañeros"),
	COMENZARCURSOSDEINTERES(74,"Comenzar con los cursos de mi interés"),
	ESTUDIARMASPARAEVALUACIONES(75,"Estudiar más para las evaluaciones"),
	MEJORARPLANIFICACIONACTIVIDADES(76,"Mejorar en la planificación de mis actividades"),
	APRENDERCOSASNUEVAS(77,"Aprender cosas nuevas"),
	TERMINARULTIMOAÑOCONDIPLOMA(78,"Terminar el último año, con diploma en mano"),
	SUPERARSERESPECTOAÑOANTERIOR(79,"Superarme respecto de lo que logré el año pasado"),
	NODISTRAERSETANTO(80,"No distraerme tanto"),
	MEJORARLALETRA(81,"Mejorar mi letra"),
	PARTICIPARENLASREUNIONESDELPROGRAMA(82,"Participar de las reuniones del Programa Futuros Egresados"),
	ADAPTACIONESCUELAACTUAL(83,"Tratar de adaptarme a mi actual escuela"),
	ENTENDERMAS(84,"Entender más"),
	FORMAREQUIPOESTUDIO(85,"Formar un equipo de estudio "),
	MEJORARORTOGRAFIA(86,"Mejorar la ortografía"),
	NOLLEVARSEMATERIAS(87,"No volver a llevarme materias"),
	ESTUDIARENLAUNIVERSIDAD(88,"Seguir estudiando en la universidad"),
	TERMINARYCONSEGUIRTRABAJO(89,"Terminar la escuela y conseguir un trabajo"),
	OBTENERMEJORPROMEDIO(90,"Obtener el mejor promedio del curso"),
	TERMINARESCUELASECUNDARIA(91,"Terminar la escuela secundaria"),
	MANTENERBUENDIALOGO(92,"Mantener buen diálogo con las autoridades y docentes de la escuela"),
	SUPERARPROBLEMASFAMILIARES(93,"Superar los problemas familiares para continuar con buen rendimiento escolar"),
	NOTENERMATERIASBAJAS(94,"No tener ninguna materia baja"),
	NOESTUDIARDEMEMORIA(95,"Tratar de no estudiar más de memoria"),
	ASISTIRATODASLASENTREVISTAS(96,"Asistir a todas las entrevistas de acompañamiento"),
	CONTARCONUNAAGENDA(97,"Contar con una agenda que me ayude en la organización"),
	NOSERTANCONTESTADOR(98,"No ser tan contestador/a"),
	ESTUDIARDURANTEELAÑO(99,"Estudiar durante el año, para no sacrificar las vacaciones "),
	CONTROLARELCARACTER(100,"Controlar mi carácter para no tener problemas con nadie"),
	DEDICARLEMENOSTIEMPOACOSASAJENAS(101,"Dedicarle menos tiempo a cosas ajenas a la escuela"),
	ENTREGARENTIEMPOLOSPRACTICOS(102,"Entregar los trabajos prácticos en tiempo y forma"),
	SERMEJORQUEELAÑOANTERIOR(103,"Ser mejor que el año anterior"),
	NODEJARTODOPARAULTIMOMOMENTO(104,"No dejar todo para último momento"),
	DISFRUTAR(105,"Disfrutar"),
	PUNTUALIDADENLASENTREVISTAS(106,"Llegar puntual a las entrevistas de acompañamiento"),
	SUPERARLASDIFICULTADESQUESEPRESENTAN(107,"Superar las dificultades que se me presenten"),
	CONFORMERENDIMIENTOESCOLAR(108,"Es hacer lo posible para quedarme conforme con mi rendimiento escolar"),
	EVITARACUMULACIONACTIVIDADES(109,"Evitar la acumulación de actividades escolares sin realizar"),
	CUMPLIRCONLOMEPROPONGO(110,"Cumplir con lo que me propongo"),
	SERMASCREATIVO(111,"Ser más creativa/o"),
	SERMEJORCOMPAÑERO(112,"Ser mejor compañero/a"),
	VALORARLOQUETENGO(113,"Valorar lo que tengo"),
	LLEGARAHORARIOESCUELA(114,"Llegar en horario a la escuela"),
	SEGUROYCONFIANZAENSIMISMO(115,"Ser más segura/o  y confiar más en mí misma/o");

	private Integer id;
	private String valor;
	
	
	private PropositoAnioComienza(Integer id, String valor) {
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
	
	
	public static PropositoAnioComienza getPropositoAnioComienza(Integer id){
		switch (id) {
		case 1:
			return 	MASTIEMPOESTUDIO;
		case 2:
			return NOLLEVARMEMATERIAS;
		case 3:
			return PORTARMEBIENCLASE;
		case 4:
			return PRESTARMASATENCIO;
		case 5:
			return PARTICIPARENCLASE;
		case 6:
			return CARPETAORDENADA;
		case 7:
			return PREGUNTARENCLASE;
		case 8:
			return CLASESPARTICULARES;
		case 9:
			return HACERLATAREA;
		case 10:
			return RELEERTODOSLOSDIAS;
		case 11:
			return BUENARELACIONCOMPAÑEROS;
		case 12:
			return HACERMASAMIGOS;
		case 13:
			return LEERMAS;
		case 14:
			return ESFORZARMEENMATERIAS;
		case 15:
			return MATERIASALDIA;
		case 16:
			return CONVERSARMENOS;
		case 17:
			return BUENDESEMPAÑOENMATERIAS;
		case 18:
			return SERABANDERADO;
		case 19:
			return APROBARPREVIAS;
		case 20:
			return ESTRATEGIASPARAMISPARES;
		case 21:
			return COMPROMISOCONESCUELA;
		case 22:
			return RENDIMIENTOINICIOAÑO;
		case 23:
			return ESFORZARSEDIAADIA;
		case 24:
			return FINALIZARCONBUENASNOTAS;
		case 25:
			return NOFALTARACLASE;
		case 26:
			return CARPETASALDIA;
		case 27:
			return PEDIRDEBERES;
		case 28:
			return PONERSELASPILAS;
		case 29:
			return ACTIVIDADESEXTRACURRICULARES;
		case 30:
			return NOCONFIARMECOMOAÑOANTERIOR;
		case 31:
			return OBTENERTITULO;
		case 32:
			return SERMASORDENADO;
		case 33:
			return CARPETASCOMPLEJASYPROLIJAS;
		case 34:
			return ORGANIZARELTIEMPO;
		case 35:
			return PRODUCTIVIDADTIEMPOLIBRE;
		case 36:	
			return ESMERARSEMAS;
		case 37:
			return ESTUDIARPARARENOVARBECA;
		case 38:
			return PONERSELASPILASPARASIEMPRE;
		case 39:
			return MEJORARMATERIASCONDIFICULTAD;
		case 40:
			return TERMINARBIENELAÑO;
		case 41:
			return RENDIMIENTOAÑOANTERIOR;
		case 42:
			return ADAPTACIONNUEVASCIRCUNSTANCIAS;
		case 43:
			return LOGRARCAMBIOTURNO;
		case 44:
			return GANASDEESTUDIAR;
		case 45:
			return RESULTADOSSIMILARESAÑOANTERIOR;
		case 46:
			return APROVECHARNETRBOOK;
		case 47:
			return TENERBUENRENDIMIENTO;
		case 48:
			return BUENARELACIONCONPROFESORES;
		case 49:
			return NODEJARESCUELAPORHIJO;
		case 50:
			return ACTIVIDADPROXIMOAÑO;
		case 51:
			return CARRERAASEGUIR;
		case 52:
			return REALIZARDEPORTE;
		case 53:
			return MEJORAREXPRESIONORAL;
		case 54:
			return MEJORAREXPRESIONESCRITA;
		case 55:
			return COMPROMISOCONELPROGRAMA;
		case 56:
			return ACTITUDPOSITIVACONELESTUDIO;
		case 57:
			return OBTENERBUENOSRESULTADOS;
		case 58:
			return APROBARPREVIASJULIO;
		case 59:
			return NOMOLESTARACOMPAÑEROS;
		case 60:
			return IRATUTORIAS;
		case 61:
			return NOESPERARAQUEMEVAYAMAL;
		case 62:
			return SERMASTOLERANTECONCOMPAÑEROS;
		case 63:
			return LEVANTARNOTAS;
		case 64:
			return PASARDEAÑOSINLLEVARSEMATERIAS;
		case 65:
			return BUENDESEMPEÑOENNUEVAESCUELA;
		case 66:
			return CONSTANTEDURANTEELAÑO;
		case 67:
			return PASARDEAÑO;
		case 68:
			return CUMPLIRPROPOSITOSPLANTEADOS;
		case 69:
			return COMENZARESTUDIANDOPARAEXAMENES;
		case 70:
			return NOBAJARRENDIMIENTO;
		case 71:
			return NOPERDERREGULARIDAD;
		case 72:
			return NOESTARAJUSTADOCONLASNOTAS;
		case 73:
			return SUPERARTIMIDEZ;
		case 74:
			return COMENZARCURSOSDEINTERES;
		case 75:
			return ESTUDIARMASPARAEVALUACIONES;
		case 76:
			return MEJORARPLANIFICACIONACTIVIDADES;
		case 77:
			return APRENDERCOSASNUEVAS;
		case 78:
			return TERMINARULTIMOAÑOCONDIPLOMA;
		case 79:
			return SUPERARSERESPECTOAÑOANTERIOR;
		case 80:
			return NODISTRAERSETANTO;
		case 81:
			return MEJORARLALETRA;
		case 82:
			return PARTICIPARENLASREUNIONESDELPROGRAMA;
		case 83:
			return ADAPTACIONESCUELAACTUAL;
		case 84:
			return ENTENDERMAS;
		case 85:
			return FORMAREQUIPOESTUDIO;
		case 86:
			return MEJORARORTOGRAFIA;
		case 87:
			return NOLLEVARSEMATERIAS;
		case 88:
			return ESTUDIARENLAUNIVERSIDAD;
		case 89:
			return TERMINARYCONSEGUIRTRABAJO;
		case 90:
			return OBTENERMEJORPROMEDIO;
		case 91:
			return TERMINARESCUELASECUNDARIA;
		case 92:
			return MANTENERBUENDIALOGO;
		case 93:
			return SUPERARPROBLEMASFAMILIARES;
		case 94:
			return NOTENERMATERIASBAJAS;
		case 95:
			return NOESTUDIARDEMEMORIA;
		case 96:
			return ASISTIRATODASLASENTREVISTAS;
		case 97:
			return CONTARCONUNAAGENDA;
		case 98:
			return NOSERTANCONTESTADOR;
		case 99:
			return ESTUDIARDURANTEELAÑO;
		case 100:
			return CONTROLARELCARACTER;
		case 101:
			return DEDICARLEMENOSTIEMPOACOSASAJENAS;
		case 102:
			return ENTREGARENTIEMPOLOSPRACTICOS;
		case 103:
			return SERMEJORQUEELAÑOANTERIOR;
		case 104:
			return NODEJARTODOPARAULTIMOMOMENTO;
		case 105:
			return DISFRUTAR;
		case 106:
			return PUNTUALIDADENLASENTREVISTAS;
		case 107:
			return SUPERARLASDIFICULTADESQUESEPRESENTAN;
		case 108:
			return CONFORMERENDIMIENTOESCOLAR;
		case 109:
			return EVITARACUMULACIONACTIVIDADES;
		case 110:
			return CUMPLIRCONLOMEPROPONGO;	
		case 111:
			return SERMASCREATIVO;
		case 112:
			return SERMEJORCOMPAÑERO;
		case 113:
			return VALORARLOQUETENGO;
		case 114:
			return LLEGARAHORARIOESCUELA;
		case 115:
			return SEGUROYCONFIANZAENSIMISMO;
		default:
			throw new InvalidParameterException("Propósito para el año que comienza desconocido: "
					+ id);
		}

	}
	
	public static List<PropositoAnioComienza> getPropositoAnioComienza(){
		List<PropositoAnioComienza> listProposito = Arrays.asList(values());
		Collections.sort(listProposito, new PropositoAnioOrdenadoPorValor());
		return listProposito;
	}
	
	/**
	 * Ordena alfabéticamente los gustos en el tiempo libre
	 * 
	 * @param becas
	 */
	public void ordenarGustosTiempoLibre(List<GustosTiempoLibre> gustosTiempoLibre){
		
		Collections.sort(gustosTiempoLibre, new GustosTiempoLibreOrdenadoPorValor());
	}
}
