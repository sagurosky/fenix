package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.cimientos.intranet.utils.GustosTiempoLibreOrdenadoPorValor;

public enum GustosTiempoLibre {
	
	HACERDEPORTE(1,"Hacer deportes"),
	ENTRENAR(2,"Entrenar"),
	HACERGIMNASIA(3,"Hacer gimnasia"),
	DORMIR(4,"Dormir"),
	CANTAR(5,"Cantar"),
	BAILAR(6,"Bailar"),
	HACERFOLCKLORE(7,"Hacer folcklore"),
	IRALCYBER(8,"Ir al cyber"),
	JUGARENLACOMPUTADORA(9,"Jugar en la computadora"),
	JUGARCONLAPLAYSTATION(10,"Jugar con la play-station"),
	ESTARCONLAPAREJA(11,"Estar con su pareja"),
	TOCARINSTRUMENTO(12,"Tocar instrumentos"),
	HACERCOMPUTACION(13,"Hacer computación"),
	IRALAMURGA(14,"Ir a la murga"),
	TOCARGUITARRA(15,"Tocar la guitarra"),
	ESTUDIARIDIOMA(16,"Estudiar un idioma"),
	ESTUDIARINGLES(17,"Estudiar Inglés"),
	APRENDEROFICIO(18,"Aprender un oficio"),
	HACERMANUALIDADES(19,"Hacer manualidades"),
	PINTAR(20,"Pintar"),
	JUNTARSECONAMIGOS(21,"Juntarse con amigos"),
	VISITARPARIENTES(22,"Visitar a los parientes"),
	ASISTIRARECITALES(23,"Asistir a recitales"),
	DIBUJAR(24,"Dibujar"),
	APRENDERPELUQUERIA(25,"Aprender peluquería"),
	ESTARCONPARIENTES(26,"Estar con algún pariente"),
	HACERMANDADOS(27,"Hacer mandados"),
	CUIDARHIJOSDEVECINO(28,"Cuidar a los hijos de sus vecinos"),
	AYUDARENCASA(29,"Ayudar en la casa"),
	COCINAR(30,"Cocinar"),
	SALIRAPASEAR(31,"Salir a pasear"),
	IRDECAMPING(32,"Ir de camping"),
	JUGARALAPELOTA(33,"Jugar a la pelota"),
	VERPELICULAS(34,"Ver películas"),
	IRALCINE(35,"Ir al cine"),
	SACARFOTOS(36,"Sacar fotos"),
	MIRARTELEVISION(37,"Mirar televisión"),
	JUGARCONHERMANOS(38,"Jugar con los hermanos"),
	JUGARCONAMIGOS(39,"Jugar con amigos"),
	IRAPESCAR(40,"Ir a pescar"),
	ANDARENBICICLETA(41,"Andar en bicicleta"),
	PARTICIPARDELOSBOYSCOUTS(42,"Participar en actividades de los boy-scouts"),
	ESCUCHARMMUSICA(43,"Escuchar música"),
	BANARSEENLAPILETA(44,"Bañarse en la pileta"),
	ANDARENMOTO(45,"Andar en moto"),
	SALIRAREMAR(46,"Salir a remar"),
	HACERCHANGAS(47,"Hacer changas"),
	IRALRIO(48,"Ir al río"),
	HACERCIRCO(49,"Hacer circo"),
	HACERMALABARES(50,"Hacer malabares"),
	HACEREJERCICIO(51,"Hacer ejercicio"),
	LEERLIBROS(52,"Leer libros"),
	ASISTIRACUMPLEANOS(53,"Asistir a festejos de cumpleaños"),
	IRALCLUB(54,"Ir al club"),
	QUEDARSEENELBARRIO(55,"Quedarse en el barrio"),
	HACERTEATRO(56,"Hacer teatro"),
	SALIRACOMER(57,"Salir a comer"),
	TOMARHELADO(58,"Ir a tomar helado"),
	CHATEARCONAMIGOS(59,"Chatear con amigos"),
	NAVEGARENINTERNET(60,"Navegar en Internet"),
	INVESTIGARTEMASDEINTERES(61,"Investigar temas de interés"),
	HACERREPARACIONESMECANICAS(62,"Hacer reparaciones mecánicas"),
	IRALAPLAZA(63,"Ir a la plaza"),
	IRALCAMPO(64,"Ir al campo"),
	VIAJAR(65,"Viajar"),
	TOMARMATE(66,"Tomar mate"),
	JUNTARSEACHARLAR(67,"Juntarse a charlar"),
	ACTIVIDADESENLAIGLESIA(68,"Participar de actividades de  la Iglesia"),
	MENSAJESCONAMIGOS(69,"Mandarse mensajes con amigos"),
	IRALODEUNAMIGO(70,"Ir a la casa de un amigo"),
	IRALODEUNPARIENTE(71,"Ir a la casa de algún pariente"),
	IRALAFERIA(72,"Ir a la feria"),
	IRALCENTRO(73,"Ir al centro"),
	AYUDARENNEGOCIOFAMILIAR(74,"Ayudar en el negocio familiar"),
	AVANZARCONLAESCUELA(75,"Avanzar con la escuela"),
	AYUDARALOSAMIGOS(76,"Ayudar a sus amigos"),
	SALIRALANOCHE(77,"Salir a la noche"),
	IRALAPLAYA(78,"Ir a la playa"),
	IRALASSIERRASOMONTANAS(79,"Ir a las sierras o montañas"),
	ESTARENFAMILIA(80,"Estar con la familia"),
	COMERASADO(81,"Comer asado"),
	ESCRIBIR(82,"Escribir"),
	COLABORARCONLOSPARIENTES(83,"Colaborar con los parientes"),
	HACERORDEN(84,"Hacer orden"),
	DESCANSAR(85,"Descansar"),
	ACTIVIDADESCONLACOMUNIDAD(86,"Realizar actividades de la comunidad"),
	AYUDARCONSTRUCCIONDELACASA(87,"Ayudar con la construcción de la casa"),
	COSASPARAELBEBEPORNACER(88,"Preparar cosas para el bebé por nacer"),
	ORGANIZARFIESTADE15(89,"Organizar la fiesta de 15"),
	PLANIFICARUNVIAJE(90,"Planificar un viaje"),
	ORGANIZARVIAJEDEEGRESADO(91,"Organizar el viaje de egresados"),
	REALIZARCURSODEINTERES(92,"Realizar cursos de interés"),
	ESTARENLACASA(93,"Estar en la casa"),
	DESCANSARSINCOSASPARAHACER(94,"Poder descansar y no tener cosas para hacer"),
	TRABAJAR(95,"Trabajar"),
	ESTARENTRANQUILIDAD(96,"Estar en tranquilidad"),
	IRALSHOPPING(97,"Ir al shopping"),
	JUGARCONLAMASCOTA(98,"Jugar con su mascota");
	
	private Integer id;
	private String valor;
	
	
	private GustosTiempoLibre(Integer id, String valor) {
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
	
	
	public static GustosTiempoLibre getGustosTiempoLibre(Integer id){
		switch (id) {
		case 1:
			return 	HACERDEPORTE;
		case 2:
			return ENTRENAR;
		case 3:
			return HACERGIMNASIA;
		case 4:
			return DORMIR;
		case 5:
			return CANTAR;
		case 6:
			return BAILAR;
		case 7:
			return HACERFOLCKLORE;
		case 8:
			return IRALCYBER;
		case 9:
			return JUGARENLACOMPUTADORA;
		case 10:
			return JUGARCONLAPLAYSTATION;
		case 11:
			return ESTARCONLAPAREJA;
		case 12:
			return TOCARINSTRUMENTO;
		case 13:
			return HACERCOMPUTACION;
		case 14:
			return IRALAMURGA;
		case 15:
			return TOCARGUITARRA;
		case 16:
			return ESTUDIARIDIOMA;
		case 17:
			return ESTUDIARINGLES;
		case 18:
			return APRENDEROFICIO;
		case 19:
			return HACERMANUALIDADES;
		case 20:
			return PINTAR;
		case 21:
			return JUNTARSECONAMIGOS;
		case 22:
			return VISITARPARIENTES;
		case 23:
			return ASISTIRARECITALES;
		case 24:
			return DIBUJAR;
		case 25:
			return APRENDERPELUQUERIA;
		case 26:
			return ESTARCONPARIENTES;
		case 27:
			return HACERMANDADOS;
		case 28:
			return CUIDARHIJOSDEVECINO;
		case 29:
			return AYUDARENCASA;
		case 30:
			return COCINAR;
		case 31:
			return SALIRAPASEAR;
		case 32:
			return IRDECAMPING;
		case 33:
			return JUGARALAPELOTA;
		case 34:
			return VERPELICULAS;
		case 35:
			return IRALCINE;
		case 36:	
			return SACARFOTOS;
		case 37:
			return MIRARTELEVISION;
		case 38:
			return JUGARCONHERMANOS;
		case 39:
			return JUGARCONAMIGOS;
		case 40:
			return IRAPESCAR;
		case 41:
			return ANDARENBICICLETA;
		case 42:
			return PARTICIPARDELOSBOYSCOUTS;
		case 43:
			return ESCUCHARMMUSICA;
		case 44:
			return BANARSEENLAPILETA;
		case 45:
			return ANDARENMOTO;
		case 46:
			return SALIRAREMAR;
		case 47:
			return HACERCHANGAS;
		case 48:
			return IRALRIO;
		case 49:
			return HACERCIRCO;
		case 50:
			return HACERMALABARES;
		case 51:
			return HACEREJERCICIO;
		case 52:
			return LEERLIBROS;
		case 53:
			return ASISTIRACUMPLEANOS;
		case 54:
			return IRALCLUB;
		case 55:
			return QUEDARSEENELBARRIO;
		case 56:
			return HACERTEATRO;
		case 57:
			return SALIRACOMER;
		case 58:
			return TOMARHELADO;
		case 59:
			return CHATEARCONAMIGOS;
		case 60:
			return NAVEGARENINTERNET;
		case 61:
			return INVESTIGARTEMASDEINTERES;
		case 62:
			return HACERREPARACIONESMECANICAS;
		case 63:
			return IRALAPLAZA;
		case 64:
			return IRALCAMPO;
		case 65:
			return VIAJAR;
		case 66:
			return TOMARMATE;
		case 67:
			return JUNTARSEACHARLAR;
		case 68:
			return ACTIVIDADESENLAIGLESIA;
		case 69:
			return MENSAJESCONAMIGOS;
		case 70:
			return IRALODEUNAMIGO;
		case 71:
			return IRALODEUNPARIENTE;
		case 72:
			return IRALAFERIA;
		case 73:
			return IRALCENTRO;
		case 74:
			return AYUDARENNEGOCIOFAMILIAR;
		case 75:
			return AVANZARCONLAESCUELA;
		case 76:
			return AYUDARALOSAMIGOS;
		case 77:
			return SALIRALANOCHE;
		case 78:
			return IRALAPLAYA;
		case 79:
			return IRALASSIERRASOMONTANAS;
		case 80:
			return ESTARENFAMILIA;
		case 81:
			return COMERASADO;
		case 82:
			return ESCRIBIR;
		case 83:
			return COLABORARCONLOSPARIENTES;
		case 84:
			return HACERORDEN;
		case 85:
			return DESCANSAR;
		case 86:
			return ACTIVIDADESCONLACOMUNIDAD;
		case 87:
			return AYUDARCONSTRUCCIONDELACASA;
		case 88:
			return COSASPARAELBEBEPORNACER;
		case 89:
			return ORGANIZARFIESTADE15;
		case 90:
			return PLANIFICARUNVIAJE;
		case 91:
			return ORGANIZARVIAJEDEEGRESADO;
		case 92:
			return REALIZARCURSODEINTERES;
		case 93:
			return ESTARENLACASA;
		case 94:
			return DESCANSARSINCOSASPARAHACER;
		case 95:
			return TRABAJAR;
		case 96:
			return ESTARENTRANQUILIDAD;
		case 97:
			return IRALSHOPPING;
		case 98:
			return JUGARCONLAMASCOTA;
		default:
			throw new InvalidParameterException("Gustos en el tiempo libre desconocido: "
					+ id);
		}

	}
	
	public static List<GustosTiempoLibre> getGustosTiempoLibre(){
		List<GustosTiempoLibre> listGustosTiempoLibre = Arrays.asList(values());
		Collections.sort(listGustosTiempoLibre, new GustosTiempoLibreOrdenadoPorValor());
		return listGustosTiempoLibre;
	}

}
