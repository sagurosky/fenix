package org.cimientos.intranet.web.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.beans.PropertyEditorSupport;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Transformer;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.cimientos.intranet.dto.EaDto;
import org.cimientos.intranet.execption.CimientosExceptionHandler;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.EstadoCuenta;
import org.cimientos.intranet.modelo.MailUtil;
import org.cimientos.intranet.modelo.Materia;
import org.cimientos.intranet.modelo.NotaMateria;
import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.Trimestre;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.informe.ComunicadoNoRenovacion;
import org.cimientos.intranet.modelo.informe.ComunicadoPendiente;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.FichaPresentacion;
import org.cimientos.intranet.modelo.informe.InformeCesacion;
import org.cimientos.intranet.modelo.informe.InformeIS1;
import org.cimientos.intranet.modelo.informe.InformeIS2;
import org.cimientos.intranet.modelo.informe.InformeIS3;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.Entrevista;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaFebrero;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaFinal;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaGrupal;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaReIncorporacion;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaRenovacion;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.ExportacionEspecial;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.servicio.AlumnoPanelEASrv;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.BecaSvr;
import org.cimientos.intranet.servicio.BoletinSrv;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.ComunicadoNoRenovacionSrv;
import org.cimientos.intranet.servicio.ComunicadoPendienteSrv;
import org.cimientos.intranet.servicio.EntrevistaSrv;
import org.cimientos.intranet.servicio.InformeCesacionSrv;
import org.cimientos.intranet.servicio.InformeFPSrv;
import org.cimientos.intranet.servicio.InformeIS1Srv;
import org.cimientos.intranet.servicio.InformeIS2Srv;
import org.cimientos.intranet.servicio.InformeIS3Srv;
import org.cimientos.intranet.servicio.InformeSrv;
import org.cimientos.intranet.servicio.MateriaSrv;
import org.cimientos.intranet.servicio.NotaMateriaSrv;
import org.cimientos.intranet.servicio.PagoSrv;
import org.cimientos.intranet.servicio.PerfilEASrv;
import org.cimientos.intranet.servicio.PerfilRRSrv;
import org.cimientos.intranet.servicio.PeriodoSrv;
import org.cimientos.intranet.servicio.RegistrarEscuelasBecasSrv;
import org.cimientos.intranet.servicio.ResponsableSrv;
import org.cimientos.intranet.servicio.TrimestreSrv;
import org.cimientos.intranet.utils.ConstantesBoletin;
import org.cimientos.intranet.utils.ConstantesInformes;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.cimientos.intranet.utils.ConstantesPaneles;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.utils.GeneradorInformesAutomaticos;
import org.cimientos.intranet.utils.PeriodoHelper;
import org.hibernate.Hibernate;
import org.hibernate.mapping.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.AnioEscolar;
import com.cimientos.intranet.enumerativos.CalificacionMateria;
import com.cimientos.intranet.enumerativos.ConductaAlumno;
import com.cimientos.intranet.enumerativos.EstadoMateria;
import com.cimientos.intranet.enumerativos.EstadoPago;
import com.cimientos.intranet.enumerativos.ProyeccionAnioProximo;
import com.cimientos.intranet.enumerativos.ResultadoAnioEscolar;
import com.cimientos.intranet.enumerativos.SituacionEscolarAlumno;
import com.cimientos.intranet.enumerativos.SituacionEscolarMergeada;
import com.cimientos.intranet.enumerativos.entrevista.Compromiso;
import com.cimientos.intranet.enumerativos.entrevista.ContenidosAbordados;
import com.cimientos.intranet.enumerativos.entrevista.DetalleGastos;
import com.cimientos.intranet.enumerativos.entrevista.EntrevistaReprogramada;
import com.cimientos.intranet.enumerativos.entrevista.EstadoEntrevista;
import com.cimientos.intranet.enumerativos.entrevista.EstrategiaComplementaria;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionCobroBeca;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionIncorporacion;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionFinal;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionMergeada;
import com.cimientos.intranet.enumerativos.entrevista.EventoGenericoDTO;
import com.cimientos.intranet.enumerativos.entrevista.GustosTiempoLibre;
import com.cimientos.intranet.enumerativos.entrevista.MotivoAusencia;
import com.cimientos.intranet.enumerativos.entrevista.MotivoCesacion;
import com.cimientos.intranet.enumerativos.entrevista.MotivoIncorporacionPendiente;
import com.cimientos.intranet.enumerativos.entrevista.MotivoNoRenovacion;
import com.cimientos.intranet.enumerativos.entrevista.MotivoPendiente;
import com.cimientos.intranet.enumerativos.entrevista.MotivoSuspension;
import com.cimientos.intranet.enumerativos.entrevista.Opciones;
import com.cimientos.intranet.enumerativos.entrevista.PropositoAnioComienza;
import com.cimientos.intranet.enumerativos.entrevista.SituacionCrisis;
import com.cimientos.intranet.enumerativos.entrevista.SituacionRiesgoEscolar;
import com.cimientos.intranet.enumerativos.entrevista.ContenidosTrabajarEnElAnio;
import com.cimientos.intranet.enumerativos.entrevista.SituacionRiesgoEscolar;
import com.cimientos.intranet.enumerativos.entrevista.TipoContacto;
import com.cimientos.intranet.enumerativos.entrevista.TipoEntrevista;
import com.cimientos.intranet.enumerativos.entrevista.motivoNoIncorporacion;

@Controller
@RequestMapping("/entrevistas/*")
public class EntrevistaController extends BaseController {

	private static final Logger log = Logger
			.getLogger(EntrevistaController.class);

	@Autowired
	private EntrevistaSrv srvEntrevistas;

	@Autowired
	private AlumnoSrv srvAlumno;

	@Autowired
	private RegistrarEscuelasBecasSrv registrarEscuelasBecasSrv;

	@Autowired
	private BoletinSrv srvBoletin;

	@Autowired
	private MateriaSrv srvMateria;

	@Autowired
	private TrimestreSrv srvTrimestre;

	@Autowired
	private NotaMateriaSrv srvNotaMateria;

	@Autowired
	private PerfilRRSrv perfilRRSrv;

	@Autowired
	private PeriodoSrv srvPeriodo;

	@Autowired
	private PagoSrv srvPago;

	@Autowired
	private CicloProgramaSrv srvCiclo;

	@Autowired
	private GeneradorInformesAutomaticos generadorInformes;

	@Autowired
	private InformeSrv srvInforme;

	@Autowired
	private PerfilEASrv srvPerfilEa;

	@Autowired
	private ResponsableSrv srvRA;

	@Autowired
	private AlumnoPanelEASrv alumnoPanelEaSrv;

	@Autowired
	private InformeIS3Srv srvInformeIS3;

	@Autowired
	private InformeIS2Srv srvInformeIS2;

	@Autowired
	private InformeFPSrv srvFichaPresentacion;

	@Autowired
	private InformeIS1Srv srvInformeIS1;

	@Autowired
	private BecaSvr svrBeca;

	@Autowired
	private BoletinSrv svrBoletin;

	@Autowired
	private ComunicadoPendienteSrv svrComunicadoPendiente;

	@Autowired
	private ComunicadoNoRenovacionSrv svrComunicadoNoRenovacion;

	private static final int IMG_WIDTH = 400;
	private static final int IMG_HEIGHT = 300;

	@Autowired
	private InformeCesacionSrv srvCesacion;

	static final String pathEntrevistaIndividual = "/entrevistas/altaEntrevistaIndividual";
	static final String pathVerEntrevistaIndividual = "/entrevistas/verEntrevistaIndividual";
	static final String pathEntrevistaRenovacion = "/entrevistas/altaEntrevistaRenovacion";
	static final String pathVerEntrevistaRenovacion = "/entrevistas/verEntrevistaRenovacion";
	static final String pathEntrevistaIncorporacion = "/entrevistas/altaEntrevistaIncorporacion";
	static final String pathVerEntrevistaIncorporacion = "/entrevistas/verEntrevistaIncorporacion";
	static final String pathEntrevistaFinal = "/entrevistas/altaEntrevistaFinal";
	static final String pathEntrevistaFebrero = "/entrevistas/altaEntrevistaFebrero";
	static final String pathVerEntrevistaFebrero = "/entrevistas/verEntrevistaFebrero";
	static final String pathVerEntrevistaFinal = "/entrevistas/verEntrevistaFinal";
	static final String pathCrearFP = "/entrevistas/crearFP";
	static final String errorPathCrearFP = "/entrevistas/errorCrearFP";

	/**
	 * Retorna la lista de entrevistas
	 * 
	 * @return la vista a la lista de entrevistas
	 */
	@RequestMapping("/entrevistas/registrarEntrevistasView.do")
	public ModelAndView irAEntrevistaIndividual(
			@RequestParam("tipo") String tipo,
			@RequestParam("idAlumno") Long idAlumno)
			throws CimientosExceptionHandler {
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		Boolean ultimoAnio = false;
		Map<String, Object> model = cargarDatosGenerales();
		if (tipo.equals("fe")) {
			model.put("idEA", perfil.getEa().getIdPerfilEA());
			model.put("materiasBasicas",
					srvMateria.obtenerMateriasBasicas(true));
			model.put("fechaActual",
					Formateador.formatearFecha(new Date(), "dd/MM/yyyy"));

			model.put("sextoAnio",
					perfil.getAnioEscolar().equals(AnioEscolar.SEXTO_SEC)
							&& !perfil.getAnioAdicional());
			List<ResultadoAnioEscolar> anios = new ArrayList<ResultadoAnioEscolar>();
			List<EvaluacionRenovacionFinal> evaluacion = new ArrayList<EvaluacionRenovacionFinal>();

			model.put("evaluacionRenovacionFinal", evaluacion);
			model.put("resultadoAnioEscolar", anios);

			EntrevistaFebrero entrevistaFinal = new EntrevistaFebrero();
			entrevistaFinal.setEstadoEntrevista(EstadoEntrevista.CONSTRUCCION);
			// entrevistaFinal.setLugarEntrevista(entrevistaAnterior.getLugarProximaEntrevista());
			// entrevistaFinal.setFechaEntrevista(entrevistaAnterior.getProximaEntrevista());
			// cargarLugarEncuentro(entrevistaFinal.getLugarEntrevista(),
			// model);

			model.put("entrevista", entrevistaFinal);
			model.put("alumno", perfil);
			model.put("tipoPerfil", "ea");
			model.put("motivoNoRenovacion",
					MotivoNoRenovacion.getmotivoNoRenovacionFinal());
			model.put("evaluacionCobroBeca",
					EvaluacionCobroBeca.getEvaluacionCobroBecaFinal());
			model.put(
					"escuelasPorZona",
					registrarEscuelasBecasSrv.obtenerEscuelasPorZona(perfil
							.getEscuela().getLocalidad().getZona()));
			return forward(pathEntrevistaFebrero, model);

		}
		model.put("periodo", calcularProximoPeriodo(perfil));
		model.put("idEA", perfil.getEa().getIdPerfilEA());
		model.put("materiasBasicas", srvMateria.obtenerMateriasBasicas(true));
		model.put("fechaActual",
				Formateador.formatearFecha(new Date(), "dd/MM/yyyy"));
		List<Long> periodosIdsAct = PeriodoHelper
				.obtenerListaIdsPeriodos(srvCiclo.obtenerCicloPorOrden(
						perfil.getBeca().getCiclo().getOrden()).getPeriodos());
		EntrevistaIndividual entrevistaAnterior = (EntrevistaIndividual) (srvEntrevistas
				.obtenerUltimaEntrevista(perfil, periodosIdsAct));

		// model.put("idEA",perfil.getEa().getIdPerfilEA());
		// model.put("materiasBasicas",
		// srvMateria.obtenerMateriasBasicas(true));
		// model.put("fechaActual",Formateador.formatearFecha(new
		// Date(),"dd/MM/yyyy"));
		// List<Long> periodosIdsAct =
		// PeriodoHelper.obtenerListaIdsPeriodos(srvCiclo.obtenerCicloPorOrden(perfil.getBeca().getCiclo().getOrden()).getPeriodos());
		// EntrevistaIndividual entrevistaAnterior = (EntrevistaIndividual)
		// (srvEntrevistas.obtenerUltimaEntrevista(perfil, periodosIdsAct));

		if (tipo.equals("f")) {
			model.put("sextoAnio",
					perfil.getAnioEscolar().equals(AnioEscolar.SEXTO_SEC)
							&& !perfil.getAnioAdicional());
			List<ResultadoAnioEscolar> anios = new ArrayList<ResultadoAnioEscolar>();
			List<EvaluacionRenovacionFinal> evaluacion = new ArrayList<EvaluacionRenovacionFinal>();

			if (perfil.getEae().equals("7/5")) {
				if (perfil.getAnioEscolar().equals(AnioEscolar.SEXTO_SEC)) {
					// anios.add(ResultadoAnioEscolar.EGRESO);
					// anios.add(ResultadoAnioEscolar.PENDIENTE);
					// anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE);
					// evaluacion.add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);

					// ES ÚLTIMO AÑO
					anios.add(ResultadoAnioEscolar.EGRESO); // EGRESO(4,"Egreso efectivo"),
					anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE); // EGRESO_PENDIENTE(6,"Egreso pendiente");

					model.put("ultimoAnio", true);
				} else {
					if (perfil.getAnioEscolar().equals(AnioEscolar.QUINTO_SEC)
							&& perfil.getAnioAdicional() == false) {
						// anios.add(ResultadoAnioEscolar.EGRESO);
						// anios.add(ResultadoAnioEscolar.PENDIENTE);
						// anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE);
						// evaluacion.add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);

						// ES ÚLTIMO AÑO
						anios.add(ResultadoAnioEscolar.EGRESO); // EGRESO(4,"Egreso efectivo"),
						anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE); // EGRESO_PENDIENTE(6,"Egreso pendiente");

						model.put("ultimoAnio", true);
					} else {
						// anios.add(ResultadoAnioEscolar.PENDIENTE);
						// anios.add(ResultadoAnioEscolar.PROMOVIDO);
						// anios.add(ResultadoAnioEscolar.PROMOVIDO_CON_PREVIAS);
						// anios.add(ResultadoAnioEscolar.REPITIO);
						// evaluacion.add(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR);
						// evaluacion.add(EvaluacionRenovacionFinal.NO_RENUEVA);
						// evaluacion.add(EvaluacionRenovacionFinal.PENDIENTE);

						// NO ES ULTIMO AÑO
						anios.add(ResultadoAnioEscolar.PROMOVIDO_CON_PREVIAS); // PROMOVIDO_CON_PREVIAS(5,"Promovido con materias a rendir")
						anios.add(ResultadoAnioEscolar.PROMOVIDO); // PROMOVIDO(1,"Promovido sin adeudar materias")
						anios.add(ResultadoAnioEscolar.PENDIENTE); // PENDIENTE(2,"Promoción Pendiente")
						anios.add(ResultadoAnioEscolar.REPITIO); // REPITIO(3,"Repitio")

						evaluacion
								.add(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR);
						evaluacion.add(EvaluacionRenovacionFinal.NO_RENUEVA);
						evaluacion.add(EvaluacionRenovacionFinal.PENDIENTE);

						model.put("ultimoAnio", ultimoAnio);
					}
				}

			}

			if (perfil.getEae().equals("6/6")) {
				if (permiteElegirEgreso(perfil)) {
					// anios.add(ResultadoAnioEscolar.EGRESO);
					// anios.add(ResultadoAnioEscolar.PENDIENTE);
					// anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE);
					// evaluacion.add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);

					// ES ÚLTIMO AÑO
					anios.add(ResultadoAnioEscolar.EGRESO); // EGRESO(4,"Egreso efectivo"),
					anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE); // EGRESO_PENDIENTE(6,"Egreso pendiente");

					evaluacion
							.add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);

					model.put("ultimoAnio", true);
				} else {
					// anios.add(ResultadoAnioEscolar.PENDIENTE);
					// anios.add(ResultadoAnioEscolar.PROMOVIDO);
					// anios.add(ResultadoAnioEscolar.PROMOVIDO_CON_PREVIAS);
					// anios.add(ResultadoAnioEscolar.REPITIO);
					// evaluacion.add(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR);
					// evaluacion.add(EvaluacionRenovacionFinal.NO_RENUEVA);
					// evaluacion.add(EvaluacionRenovacionFinal.PENDIENTE);

					// NO ES ULTIMO AÑO
					anios.add(ResultadoAnioEscolar.PROMOVIDO_CON_PREVIAS); // PROMOVIDO_CON_PREVIAS(5,"Promovido con materias a rendir")
					anios.add(ResultadoAnioEscolar.PROMOVIDO); // PROMOVIDO(1,"Promovido sin adeudar materias")
					anios.add(ResultadoAnioEscolar.PENDIENTE); // PENDIENTE(2,"Promoción Pendiente")
					anios.add(ResultadoAnioEscolar.REPITIO); // REPITIO(3,"Repitio")

					evaluacion
							.add(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR);
					evaluacion.add(EvaluacionRenovacionFinal.NO_RENUEVA);
					evaluacion.add(EvaluacionRenovacionFinal.PENDIENTE);

					model.put("ultimoAnio", ultimoAnio);
				}
			}
			model.put("evaluacionRenovacionFinal", evaluacion);
			model.put("resultadoAnioEscolar", anios);

			EntrevistaFinal entrevistaFinal = new EntrevistaFinal();
			entrevistaFinal.setEstadoEntrevista(EstadoEntrevista.CONSTRUCCION);
			entrevistaFinal.setLugarEntrevista(entrevistaAnterior
					.getLugarProximaEntrevista());
			entrevistaFinal.setFechaEntrevista(entrevistaAnterior
					.getProximaEntrevista());
			cargarLugarEncuentro(entrevistaFinal.getLugarEntrevista(), model);

			// entrevistaFinal.setDirMail("carlosquetto@hotmail.com");
			// entrevistaFinal.setCelular("1130914553");

			Connection cn = null;
			CallableStatement cl = null;
			ResultSet rs = null;
			String call = null;
			try {
				String query = "select e.dir_mail,e.celular from entrevista e where celular IS NOT null and dir_mail IS NOT NULL and  e.perfil_alumno="
						+ perfil.getId() + " order by e.periodo_de_pago desc limit 1";
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);

				while (rs.next()) {
					if (rs.getString("dir_mail") == null) {
						entrevistaFinal.setDirMail("-");
					} else {
						entrevistaFinal.setDirMail(rs.getString("dir_mail"));
					}

					if (rs.getString("celular") == null) {
						entrevistaFinal.setCelular("-");
					} else {
						entrevistaFinal.setCelular(rs.getString("celular"));
					}

				}

				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}

			String suspensiones = "0";
			try {
				String query = "select count(id) as suspensiones from entrevista e where e.fecha_carga>='2023-01-01' and e.evaluacion_cobro_beca=1 and e.perfil_alumno="
						+ perfil.getId();
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);

				while (rs.next()) {
					suspensiones = rs.getString("suspensiones");

				}
				entrevistaFinal.setSus(suspensiones);

				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}

			model.put("sus", suspensiones);

			// marterias previas

			String materiasPendientes = "";
			try {
				String query = "select materia,anio_escolar from previas_nuevo p where ja<>'Aprobado' and di<>'Aprobado' and fb<>'Aprobado' and ma<>'Aprobado' and mam<>'Aprobado' and idbecado="
						+ perfil.getId();
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);

				while (rs.next()) {
					materiasPendientes = materiasPendientes
							+ rs.getString("materia") + " - "
							+ rs.getString("anio_escolar") + ", ";

				}
				entrevistaFinal.setMp(materiasPendientes);

				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}

			model.put("mp", materiasPendientes);

			// celular

			String celular = "";
			String mail = "";
			try {

				String query = "select celular from entrevista e  where celular IS NOT null and e.perfil_alumno="
						+ perfil.getId() + " order by e.periodo_de_pago desc limit 1";
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);

				while (rs.next()) {
					celular = rs.getString("celular");
				}
				entrevistaFinal.setCelular(celular);

				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}

			// mail
			try {

				String query = "select dir_mail from entrevista e  where dir_mail IS NOT null and e.perfil_alumno="
						+ perfil.getId() + " order by e.periodo_de_pago desc limit 1";
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);

				while (rs.next()) {
					mail = rs.getString("dir_mail");
				}
				entrevistaFinal.setDirMail(mail);

				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}

			model.put("celular", celular);
			model.put("dirMail", mail);

			// descripcion escuela
			// String descripcionEscuela="";
			// try {
			//
			// String
			// query="select es.observaciones from escuela es, perfil_alumno p where p.escuela=es.id and p.id="+perfil.getId();
			// cn = Conexion.getConexion();
			// Statement st = cn.createStatement();
			// rs = st.executeQuery(query);

			// while (rs.next()) {
			// descripcionEscuela=rs.getString("es.observaciones");
			// }
			// entrevistaIndividual.setIge(descripcionEscuela);

			// st.close();
			// Conexion.cerrarCall(cl);
			// Conexion.cerrarConexion(cn);
			// } catch (SQLException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			// Conexion.cerrarCall(cl);
			// Conexion.cerrarConexion(cn);
			// }

			// model.put("ige", descripcionEscuela);

			//DMS 27/12/23 dejo comentado porque pidieron cambiarlo a lo mismo que muestra el IS2
    		//proposito año comienza
//    		String propositoAnioComienza="";
//    		try {  
//                
//    			// para entrevista de julio
//                //String query="select e.proposito_anio_comienza from entrevista e where e.tipo='renovacion' and perfil_alumno=" +perfil.getId()+ " order by e.periodo_de_pago desc limit 1";
//    			// para entrevista final toma la de julio
//    			String query="select e.paa from entrevista e where e.periodo_de_pago=380 and perfil_alumno=" +perfil.getId();
//    			
//    			cn = Conexion.getConexion();
//                Statement st = cn.createStatement();
//                rs = st.executeQuery(query);        
//    		    
//                while (rs.next()) {	                    		            
//                	propositoAnioComienza=rs.getString("e.paa");
//                }           
//               entrevistaFinal.setPaa(propositoAnioComienza);
//                
//               st.close();
//                Conexion.cerrarCall(cl);
//    	        Conexion.cerrarConexion(cn);
//            } catch (SQLException e) {
//    			// TODO Auto-generated catch block
//    			e.printStackTrace();
//    			Conexion.cerrarCall(cl);
//    	        Conexion.cerrarConexion(cn);
//    		}
    		
    		
    		
//    		model.put("paa", propositoAnioComienza);
    		
    		
    		
    		//DMS  27/12/23 código agregado
    		InformeIS2 informeIs2=srvInformeIS2.obtenerInformePorIdAlumno(idAlumno, srvCiclo.obtenerCicloActual());
    		if(informeIs2!=null)
    		{
    			entrevistaFinal.setPaa(informeIs2.getPaa());
        		model.put("paa", informeIs2.getPaa());
    		}else
    		{
    			entrevistaFinal.setPaa("");
    			model.put("paa", "");
    		}

    		//DMS  27/12/23 fin codigo agregado

			String ige = "";
			//try {

				// para entrevista de julio
				//String query="select e.proposito_anio_comienza from entrevista e where e.tipo='renovacion' and perfil_alumno="
				//+perfil.getId()+ " order by e.periodo_de_pago desc limit 1";
				// para entrevista final toma la de julio
				//String query = "select e.ige from entrevista e where e.periodo_de_pago=380 and perfil_alumno="
				//		+ perfil.getId();

				//cn = Conexion.getConexion();
				//Statement st = cn.createStatement();
				//rs = st.executeQuery(query);

				//while (rs.next()) {
				//	ige = rs.getString("e.ige");
				//}
				//entrevistaFinal.setIge(ige);

				//st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			//} catch (SQLException e) {
				// TODO Auto-generated catch block
			//	e.printStackTrace();
			//	Conexion.cerrarCall(cl);
			//	Conexion.cerrarConexion(cn);
			//}

			model.put("ige", ige);

			model.put("entrevista", entrevistaFinal);
			model.put("alumno", perfil);
			model.put("tipoPerfil", "ea");
			model.put("motivoNoRenovacion",
					MotivoNoRenovacion.getmotivoNoRenovacionFinal());
			model.put("evaluacionCobroBeca",
					EvaluacionCobroBeca.getEvaluacionCobroBecaFinal());
			model.put(
					"escuelasPorZona",
					registrarEscuelasBecasSrv.obtenerEscuelasPorZona(perfil
							.getEscuela().getLocalidad().getZona()));
			return forward(pathEntrevistaFinal, model);
		} else {
			EntrevistaIndividual entrevistaIndividual = new EntrevistaIndividual();
			entrevistaIndividual
					.setEstadoEntrevista(EstadoEntrevista.CONSTRUCCION);
			if (entrevistaAnterior != null) {
				if (entrevistaAnterior.getLugarProximaEntrevista() != null) {
					entrevistaIndividual.setLugarEntrevista(entrevistaAnterior
							.getLugarProximaEntrevista());
					entrevistaIndividual
							.setLugarProximaEntrevista(entrevistaAnterior
									.getLugarProximaEntrevista());
				} else {
					entrevistaIndividual
							.setLugarEntrevista(perfil.getEscuela());
					entrevistaIndividual.setLugarProximaEntrevista(perfil
							.getEscuela());
				}
				entrevistaIndividual.setFechaEntrevista(entrevistaAnterior
						.getProximaEntrevista());
			} else {
				entrevistaIndividual.setLugarEntrevista(perfil.getEscuela());
				entrevistaIndividual.setLugarProximaEntrevista(perfil
						.getEscuela());
			}
			cargarLugarEncuentro(entrevistaIndividual.getLugarEntrevista(),
					model);
			// ////System.out.println(perfil.getBoletin().getTrimestres().get(0).getId());

			/*
			 * if(perfil.getBoletin()==null){ model.put("boletin",
			 * "sinBoletin");
			 * 
			 * 
			 * 
			 * 
			 * 
			 * }else{ Connection cn = null; CallableStatement cl = null;
			 * ResultSet rs = null; String call=null; long totMaterias=0L; long
			 * sinNota=0L; call = "{CALL SP_VerificarNotasBoletin(?)}"; cn =
			 * Conexion.getConexion(); try { cl = cn.prepareCall(call);
			 * cl.setLong(1,
			 * perfil.getBoletin().getTrimestres().get(0).getId()); rs =
			 * cl.executeQuery(); while (rs.next()) {
			 * totMaterias=rs.getLong("totMaterias");
			 * sinNota=rs.getLong("sinNota"); }
			 * 
			 * if(totMaterias!=sinNota){ model.put("boletin", "incompleto");
			 * }else{ model.put("boletin", "completo"); }
			 * Conexion.cerrarCall(cl); Conexion.cerrarConexion(cn); } catch
			 * (SQLException e) { // TODO Auto-generated catch block
			 * e.printStackTrace(); Conexion.cerrarCall(cl);
			 * Conexion.cerrarConexion(cn); } }
			 */
			Connection cn = null;
			CallableStatement cl = null;
			ResultSet rs = null;
			String call = null;
			long totMaterias = 0L;
			long sinNota = 0L;
			try {
				String query = "select b.id AS idBoletin from boletin_nuevo b where b.ciclo=2023 and b.idBecado="
						+ perfil.getId();
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);
				Long idBoletin = 0L;
				while (rs.next()) {
					idBoletin = rs.getLong("idBoletin");

				}

				if (idBoletin == 0) {
					model.put("boletin", "SinBoletin");
				} else {
					model.put("boletin", "ConBoletin");
				}
				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}
			


			

			// cantidad suspensiones en el año

			String suspensiones = "0";
			try {
				String query = "select count(id) as suspensiones from entrevista e where e.fecha_carga>='2023-01-01' and e.evaluacion_cobro_beca=1 and e.perfil_alumno="
						+ perfil.getId();
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);

				while (rs.next()) {
					suspensiones = rs.getString("suspensiones");

				}
				entrevistaIndividual.setSus(suspensiones);

				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}

			model.put("sus", suspensiones);

			// marterias previas

			String materiasPendientes = "";
			try {
				String query = "select materia,anio_escolar from previas_nuevo p where ja<>'Aprobado' and di<>'Aprobado' and fb<>'Aprobado' and ma<>'Aprobado' and mam<>'Aprobado' and idbecado="
						+ perfil.getId();
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);

				while (rs.next()) {
					materiasPendientes = materiasPendientes
							+ rs.getString("materia") + " - "
							+ rs.getString("anio_escolar") + ", ";

				}
				entrevistaIndividual.setMp(materiasPendientes);

				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}

			model.put("mp", materiasPendientes);

			// celular

			String celular = "";
			String mail = "";
			try {

				String query = "select celular from entrevista e  where celular IS NOT null and e.perfil_alumno="
						+ perfil.getId() + " order by e.periodo_de_pago desc limit 1";
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);

				while (rs.next()) {
					celular = rs.getString("celular");
				}
				entrevistaIndividual.setCelular(celular);

				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}

			// mail
			try {

				String query = "select dir_mail from entrevista e  where dir_mail IS NOT null and e.perfil_alumno="
						+ perfil.getId() + " order by e.periodo_de_pago desc limit 1";
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);

				while (rs.next()) {
					mail = rs.getString("dir_mail");
				}
				entrevistaIndividual.setDirMail(mail);

				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}

			model.put("celular", celular);
			model.put("dirMail", mail);

			// descripcion escuela
			// String descripcionEscuela="";
			// try {
			//
			// String
			// query="select es.observaciones from escuela es, perfil_alumno p where p.escuela=es.id and p.id="+perfil.getId();
			// cn = Conexion.getConexion();
			// Statement st = cn.createStatement();
			// rs = st.executeQuery(query);

			// while (rs.next()) {
			// descripcionEscuela=rs.getString("es.observaciones");
			// }
			// entrevistaIndividual.setIge(descripcionEscuela);

			// st.close();
			// Conexion.cerrarCall(cl);
			// Conexion.cerrarConexion(cn);
			// } catch (SQLException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			// Conexion.cerrarCall(cl);
			// Conexion.cerrarConexion(cn);
			// }

			// model.put("ige", descripcionEscuela);

			// proposito año comienza
			String propositoAnioComienza = "";
			if(entrevistaIndividual.getPaa()==null){
			try {

				// para entrevista de julio
				String query="select e.proposito_anio_comienza from entrevista e where e.tipo='renovacion' and perfil_alumno="
				+perfil.getId()+ " order by e.periodo_de_pago desc limit 1";
				// para entrevista final toma la de julio
				//String query = "select e.paa from entrevista e where e.periodo_de_pago=380 and perfil_alumno="
				//		+ perfil.getId();

				if(!perfil.getEstadoAlumno().getValor().equals("Incorporado")){
					 query="select e.proposito_anio_comienza from entrevista e where e.tipo='renovacion' and perfil_alumno="
							+perfil.getId()+ " order by e.periodo_de_pago desc limit 1";
				}else{
					query="select e.proposito from entrevista e where e.tipo='incorporacion' and perfil_alumno="
					+perfil.getId()+ " order by e.periodo_de_pago desc limit 1";
				}
				
				
				cn = Conexion.getConexion();
				Statement st = cn.createStatement();
				rs = st.executeQuery(query);
				if(!perfil.getEstadoAlumno().getValor().equals("Incorporado")){
					while (rs.next()) {
						propositoAnioComienza = rs.getString("e.proposito_anio_comienza");
					}
				}else{
					while (rs.next()) {
						propositoAnioComienza = rs.getString("e.proposito");
					}
				}
				
				entrevistaIndividual.setPaa(propositoAnioComienza);

				st.close();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
			}

			model.put("paa", propositoAnioComienza);
			}
			else{
				model.put("paa", entrevistaIndividual.getPaa());
			}

			model.put("entrevista", entrevistaIndividual);
			model.put("alumno", perfil);
			model.put("tipoPerfil", "ea");
			return forward(pathEntrevistaIndividual, model);
		}

	}

	/**
	 * Chequea que el alumno tenga creadas todas las entrevistas mensuales para
	 * poder generar la final
	 * 
	 * @param perfil
	 * @param periodosIds
	 * @return
	 */
	private boolean puedeGenerarEFinal(PerfilAlumno perfil,
			List<Long> periodosIds) {
		@SuppressWarnings("unchecked")
		List<EntrevistaIndividual> entrevistas = (ArrayList<EntrevistaIndividual>) srvEntrevistas
				.obtenerEntrevistasIndividualesPorId(perfil.getId(),
						periodosIds);
		Integer cantEntrevistas = entrevistas.size();

		entrevistas = srvEntrevistas.obtenerEntrevistaPorTipo(perfil.getId(),
				periodosIds, TipoEntrevista.FINAL);

		if (entrevistas.size() != 0)
			return false;

		Integer cantPeriodos = periodosIds.size();
		Periodo periodoAltaBeca = PeriodoHelper.getPeriodoActual(perfil
				.getBeca().getCiclo().getPeriodos(), perfil.getFechaAltaBeca());
		cantPeriodos = cantPeriodos - (periodoAltaBeca.getOrden() - 1);
		
		boolean cantE = (cantEntrevistas == cantPeriodos)
				|| (cantEntrevistas == (cantPeriodos - 1));
		if (cantE) {
			Periodo periodoActual = PeriodoHelper.getPeriodoActual(perfil
					.getBeca().getCiclo().getPeriodos(), new Date());
			Periodo ultimoPeriodo = periodoActual.getCiclo().getPeriodos()
					.get(periodoActual.getCiclo().getPeriodos().size() - 1);
			if (!periodoActual.equals(ultimoPeriodo)) {
				return false;
			}
		}

		return cantE;

	}

	/**
	 * Retorna la lista de entrevistas
	 * 
	 * @return la vista a la lista de entrevistas
	 */
	@RequestMapping("/entrevistas/registrarRenovacionView.do")
	public ModelAndView irAEntrevistaRenovacion(
			@RequestParam("idAlumno") Long idAlumno, HttpServletRequest request)
			throws CimientosExceptionHandler {
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		PerfilEA perfilEA = getPerfilEA(request);
		Map<String, Object> model = cargarDatosGenerales();
		model.put("periodo", calcularProximoPeriodo(perfil));
		List<Long> periodosIds = PeriodoHelper.obtenerListaIdsPeriodos(srvCiclo
				.obtenerCicloPorOrden(
						perfil.getBeca().getCiclo().getOrden() - 1)
				.getPeriodos());
		List<Long> periodosIdsAct = PeriodoHelper
				.obtenerListaIdsPeriodos(srvCiclo.obtenerCicloPorOrden(
						perfil.getBeca().getCiclo().getOrden()).getPeriodos());
		List<EntrevistaIndividual> listaEntevistas = srvEntrevistas
				.obtenerEntrevistaPorTipo(idAlumno, periodosIds,
						TipoEntrevista.FINAL);
		EntrevistaFinal ef = null;
		EntrevistaRenovacion entrevistaRenovacion = new EntrevistaRenovacion();
		if (!listaEntevistas.isEmpty()) {
			ef = (EntrevistaFinal) (srvEntrevistas.obtenerEntrevistaPorTipo(
					idAlumno, periodosIds, TipoEntrevista.FINAL)).get(0);
			entrevistaRenovacion.setEvaluacionRenovacionFinal(ef
					.getEvaluacionRenovacionFinal());
			entrevistaRenovacion.setSituacionEscolarDiciembre(ef
					.getSituacionEscolarMergeada());
		} else {
			entrevistaRenovacion.setEvaluacionRenovacionFinal(perfil
					.getEstadoRenovacion());
			entrevistaRenovacion.setSituacionEscolarDiciembre(null);
		}
		// String otroMotivo =
		// "Queremos informarle que la renovación de la beca de " +
		// perfil.getDatosPersonales().getNombre() + " " +
		// perfil.getDatosPersonales().getApellido()+ " de " +
		// perfil.getEscuela().getLocalidad().getNombre() +
		// " aún está pendiente debido a que...";
		entrevistaRenovacion.setEstadoEntrevista(EstadoEntrevista.CONSTRUCCION);
		// entrevistaRenovacion.setMotivoOtro(otroMotivo);

		EntrevistaIndividual entrevistaAnterior = (EntrevistaIndividual) (srvEntrevistas
				.obtenerUltimaEntrevista(perfil, periodosIdsAct));
		if (entrevistaAnterior == null)
			entrevistaAnterior = (EntrevistaIndividual) (srvEntrevistas
					.obtenerUltimaEntrevista(perfil, periodosIds));

		if (entrevistaAnterior.getTipoEntrevista() == TipoEntrevista.RENOVACION) {
			entrevistaRenovacion.setLugarEntrevista(entrevistaAnterior
					.getLugarProximaEntrevista());
			entrevistaRenovacion.setLugarProximaEntrevista(entrevistaAnterior
					.getLugarProximaEntrevista());
			entrevistaRenovacion.setFechaEntrevista(entrevistaAnterior
					.getProximaEntrevista());
		} else {
			// por defecto el lugar es la escuela del alumno
			entrevistaRenovacion.setLugarEntrevista(perfil.getEscuela());
			entrevistaRenovacion.setLugarProximaEntrevista(perfil.getEscuela());
		}
		this.cargarLugarEncuentro(entrevistaRenovacion.getLugarEntrevista(),
				model);
		boolean boletinFinalizado = boletinFinalizado(perfil.getBoletin());
		model.put("boletinFinalizado", boletinFinalizado);
		model.put("entrevista", entrevistaRenovacion);
		model.put("evaluacionRenovacion",
				EvaluacionRenovacionMergeada.getEvaluacionRenovacion());
		// model.put("situacionEscolar",
		// SituacionEscolar.getSituacionEscolar());
		model.put("situacionEscolar",
				SituacionEscolarMergeada.getSituacionEscolarRenovacion());
		model.put("motivoPendiente", MotivoPendiente.getMotivoPendiente());
		model.put("tipoContacto", TipoContacto.getTipoContacto());
		model.put("propositoAnioComienzaList",
				PropositoAnioComienza.getPropositoAnioComienza());
		model.put("gustosTiempoLibre", GustosTiempoLibre.getGustosTiempoLibre());
		model.put("alumno", perfil);
		model.put("tipoPerfil", "ea");
		model.put("motivoNoRenovacion",
				MotivoNoRenovacion.getmotivoNoRenovacion());
		model.put("evaluacionCobroBeca",
				EvaluacionCobroBeca.getEvaluacionCobroBecaFinal2017());
		model.put("fechaActual",
				Formateador.formatearFecha(new Date(), "dd/MM/yyyy"));
		model.put("idEA", perfilEA.getIdPerfilEA());

		return forward(pathEntrevistaRenovacion, model);
	}

	/**
	 * Chequea que se pueda generar la entrevista de renovacion.Esto es que el
	 * estado del alumno sea reasignado y que no exista la entrevista
	 * 
	 */
	private boolean puedeGenerarERenovacion(PerfilAlumno perfil) {
		boolean estadoNoRenueva = perfil.getEstadoAlumno().equals(
				EstadoAlumno.NO_RENOVADO)
				|| perfil.getEstadoAlumno().equals(EstadoAlumno.RENOVADO)
				|| perfil.getEstadoAlumno().equals(EstadoAlumno.INCORPORADO)
				|| perfil.getEstadoAlumno().equals(EstadoAlumno.NO_INCORPORADO);
		boolean estadoReuneva = perfil.getEstadoAlumno().equals(
				EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION)
				|| perfil.getEstadoAlumno().equals(EstadoAlumno.REASIGNADO);
		if (perfil.getEstadoAlumno().getValor().equals("Cesado")
				|| perfil.getBeca() == null) {
			return true;
		} else {
			List<Long> periodosIds = PeriodoHelper
					.obtenerListaIdsPeriodos(perfil.getBeca().getCiclo()
							.getPeriodos());
			return (!estadoNoRenueva && estadoReuneva && (srvEntrevistas
					.obtenerEntrevistaPorTipo(perfil.getId(), periodosIds,
							TipoEntrevista.FINAL).size() == 0));
		}

	}

	/**
	 * Retorna la lista de entrevistas
	 * 
	 * @return la vista a la lista de entrevistas
	 */
	@RequestMapping("/entrevistas/registrarIncorporacionView.do")
	public ModelAndView irAEntrevistaIncorporacion(
			@RequestParam("idAlumno") Long idAlumno, HttpServletRequest request)
			throws CimientosExceptionHandler {

		Map<String, Object> model = cargarDatosGenerales();
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		model.put("periodo", calcularProximoPeriodoReincorporacion(perfil));
		List<Long> periodosIdsAct = PeriodoHelper
				.obtenerListaIdsPeriodos(srvCiclo.obtenerCicloPorOrden(
						perfil.getBeca().getCiclo().getOrden()).getPeriodos());
		EntrevistaReIncorporacion entrevistaIncorporacion = new EntrevistaReIncorporacion();
		entrevistaIncorporacion
				.setEstadoEntrevista(EstadoEntrevista.CONSTRUCCION);
		EntrevistaIndividual entrevistaAnterior = (EntrevistaIndividual) (srvEntrevistas
				.obtenerUltimaEntrevista(perfil, periodosIdsAct));
		if (entrevistaAnterior != null) {
			entrevistaIncorporacion.setLugarEntrevista(entrevistaAnterior
					.getLugarProximaEntrevista());
			entrevistaIncorporacion
					.setLugarProximaEntrevista(entrevistaAnterior
							.getLugarProximaEntrevista());
			entrevistaIncorporacion.setFechaEntrevista(entrevistaAnterior
					.getProximaEntrevista());
		} else {
			// por defecto el lugar es la escuela del alumno
			entrevistaIncorporacion.setLugarEntrevista(perfil.getEscuela());
			entrevistaIncorporacion.setLugarProximaEntrevista(perfil
					.getEscuela());
		}
		cargarLugarEncuentro(entrevistaIncorporacion.getLugarEntrevista(),
				model);
		model.put("entrevista", entrevistaIncorporacion);
		model.put("evaluacionIncorporacion",
				EvaluacionIncorporacion.getEvaluacionIncorporacion());
		model.put("motivoPendiente",
				MotivoIncorporacionPendiente.getMotivoIncorporacionPendiente());
		model.put("motivoNoIncorporacion",
				motivoNoIncorporacion.getmotivoNoIncorporacion());
		model.put("evaluacionCobroBeca",
				EvaluacionCobroBeca.getEvaluacionCobroBecaIncorpRenov2017());
		model.put("tipoContacto", TipoContacto.getTipoContacto());
		model.put("alumno", perfil);
		model.put("tipoPerfil", "ea");
		model.put("fechaActual",
				Formateador.formatearFecha(new Date(), "dd/MM/yyyy"));
		model.put("idEA", getPerfilEA(request).getIdPerfilEA());
		return forward(pathEntrevistaIncorporacion, model);
	}

	private boolean puedeGenerarEIncorporacion(PerfilAlumno perfil) {
		boolean estadoNoRenovado = perfil.getEstadoAlumno().equals(
				EstadoAlumno.NO_RENOVADO);

		boolean estadoAlta = perfil.getEstadoAlumno().equals(
				EstadoAlumno.ALTA_BECADO)
				|| perfil.getEstadoAlumno().equals(
						EstadoAlumno.INCORPORACION_PENDIENTE);

		// con covid19
		// boolean estadoAlta =
		// perfil.getEstadoAlumno().equals(EstadoAlumno.ALTA_BECADO);

		return (estadoNoRenovado || estadoAlta);
	}

	private Map<String, Object> cargarDatosGenerales() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("entrevistas",
				EntrevistaReprogramada.getEntrevistasReprogramadas());
		model.put("tipoEntrevista", TipoEntrevista.getTipoEntrevistas());
		model.put("lugarEntrevistas",
				registrarEscuelasBecasSrv.obtenerTodasEscuelas());
		model.put("motivosAusencias", MotivoAusencia.getMotivoAusencias());
		model.put("opciones", Opciones.getOpciones());
		model.put("detalleGastos", DetalleGastos.getDetalleGastos());
		model.put("compromisosRA", Compromiso.getCompromiso());
		model.put("estrategiasComp",
				EstrategiaComplementaria.getEstrategiasComplementarias());
		model.put("contenidosAbordados",
				ContenidosAbordados.getContenidosAbordadosEntrevistaMensual());
		model.put("situacionCrisis", SituacionCrisis.getSituacionCrisis());
		model.put("situacionRiesgoEscolar",
				SituacionRiesgoEscolar.getSituacionRiesgoEscolar());
		model.put("contenidosTrabajarEnElAnio",
				ContenidosTrabajarEnElAnio.getContenidosTrabajarEnElAnio());
		model.put("motivoSuspension", MotivoSuspension.getMotivoSuspension());
		model.put("motivoCesacion", MotivoCesacion.getMotivoCesacion());
		model.put("evaluacionCobroBeca",
				EvaluacionCobroBeca.getEvaluacionCobroBeca());
		model.put("estadoEntrevista", EstadoEntrevista.getEstadoEntrevista());
		model.put("anioEscolar", AnioEscolar.getAnioEscolares());
		return model;
	}

	/**
	 * Este metodo persiste los datos de la entrevista que llegan del formulario
	 * de alta.
	 * 
	 * @return la vista que me devuelve la lista de entrevistas
	 */
	@RequestMapping("/entrevistas/guardar.do")
	public ModelAndView registrar(
			HttpServletRequest req,
			@ModelAttribute("entrevistaIndividual") EntrevistaIndividual entrevista,
			@RequestParam("alumnoId") Long id,
			@RequestParam("valorGuardar") String valor,
			@RequestParam("motivoAusenciaRa2") String motivoAusenciaRa2,
			@RequestParam("masDeUnEncuentro") String masDeUnEncuentro,
			@RequestParam("objetivoEncuentro") String objetivoEncuentro,
			@RequestParam("ase2020") String ase2020,
			// @RequestParam("cantidadInasistencias") float
			// cantidadInasistencias,

			// @RequestParam("qtam") String qtam,
			// @RequestParam("osme") String osme,

			@RequestParam("valorPerfil") String valorPerfil)
			throws CimientosExceptionHandler {

		TipoEntrevista tipoEntrevista = TipoEntrevista.MENSUAL;
		entrevista.setMotivoAusenciaRA2(motivoAusenciaRa2);
		entrevista.setMasDeUnEncuentro(masDeUnEncuentro);
		entrevista.setObjetivoEncuentro(objetivoEncuentro);
		// entrevista.setCantidadInasistencias(cantidadInasistencias);
		// entrevista.setPropositoAnual(propositoAnual);
		// entrevista.setOsme(osme);
		// entrevista.setTelFijo(celularRA);

		entrevista.setAse2020(ase2020);

		registrarEntrevista(entrevista, id, valor, valorPerfil, tipoEntrevista);

		if ((valorPerfil.equals("rr") && valor.equals("f"))
				|| (valorPerfil.equals("ea") && valor.equals("f"))) {

			// //System.out.println(entrevista.getEvaluacionCobroBeca().name());
			// //System.out.println(entrevista.getEvaluacionCobroBeca().getValor());

			// envio de mail si es cesado
			if (entrevista.getEvaluacionCobroBeca().getValor() == "Cesado") {

				String firma = Globales.tenant;
				// vacia firma
				firma = "";
				String[] recipients = new String[] { "lisandramauri@cimientos.org" }; // destino
				// String[] recipients = new
				// String[]{"carlosquetto@cimientos.org"}; //destino
				// String[] bccRecipients = new
				// String[]{"gracielanogues@cimientos.org"};
				String[] bccRecipients = new String[] {						
						"carlosquetto@cimientos.org",
						"pauladaffra@cimientos.org",
						"lisandramauri@cimientos.org",
						"padrinos@cimientos.org",
						"florenciagelabert@cimientos.org" };
				// String[] bccRecipients = new
				// String[]{"carlosquetto@hotmail.com"};
				String subject = "Aviso Cesación";
				String messageBody = entrevista.getApellidoAlumno() + ", "
						+ entrevista.getNombreAlumno() + " de "
						+ entrevista.getZonaCimientos() + ", "
						+ entrevista.getAnioEscolar().getValor()
						+ ", ahijado de " + entrevista.getPadrino()
						+ " ha cesado del PFE en "
						+ entrevista.getPeriodoEntrevista().toString() + " "
						+ entrevista.getCicloLectivo().toString()
						+ " por el siguiente motivo: '"
						+ entrevista.getMotivoCesacion().getValor() + "'";
				new MailUtil().sendMail(recipients, bccRecipients, subject,
						messageBody);

				// guardo la fecha de la cesacion en becas
				Connection cn = null;
				CallableStatement cl = null;
				ResultSet rs = null;
				String call = null;
				try {
					// //System.out.println("sp_alta 1 rr f cesado "+
					// entrevista.getExportacionEspecial().getIdBeca() );
					call = "{CALL SP_AltaBajaBeca(?)}";
					cn = Conexion.getConexion();
					cl = cn.prepareCall(call);
					cl.setLong(1, entrevista.getExportacionEspecial()
							.getIdBeca()); // numero de fp
					rs = cl.executeQuery();
					// cierro conexion
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
					call = "{CALL SP_ModificarBecaBajaBecado(?)}";
					// call ="insert into baja_becas values (?,CURDATE( ))";
					cn = Conexion.getConexion();
					cl = cn.prepareCall(call);
					cl.setLong(1, entrevista.getExportacionEspecial()
							.getIdBeca());
					rs = cl.executeQuery();
					/*
					 * Date fechaBajaBeca=null; call =
					 * "{CALL SP_BuscarFechaBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); rs =
					 * cl.executeQuery(); while (rs.next()) { fechaBajaBeca=
					 * rs.getDate(2); } if(fechaBajaBeca!=null){ call =
					 * "{CALL SP_ModificarBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); //
					 * numero de fp rs = cl.executeQuery();
					 * 
					 * } if(fechaBajaBeca==null){ call =
					 * "{CALL SP_AltaBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); //
					 * numero de fp rs = cl.executeQuery();
					 * 
					 * }
					 */

					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
				} catch (SQLException e) {
					e.printStackTrace();
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
				}
			}
			// //System.out.println(entrevista.getEvaluacionRenovacionBeca());
			if (entrevista.getEvaluacionRenovacionBeca() == "No Renueva") {

				// guardo la fecha de no renovacion en becas
				Connection cn = null;
				CallableStatement cl = null;
				ResultSet rs = null;
				String call = null;
				try {
					// //System.out.println("sp_alta 2 rr f no renueva "+
					// entrevista.getExportacionEspecial().getIdBeca());
					call = "{CALL SP_AltaBajaBeca(?)}";
					cn = Conexion.getConexion();
					cl = cn.prepareCall(call);
					cl.setLong(1, entrevista.getExportacionEspecial()
							.getIdBeca()); // numero de fp
					rs = cl.executeQuery();
					// cierro conexion
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
					call = "{CALL SP_ModificarBecaBajaBecado(?)}";
					// call ="insert into baja_becas values (?,CURDATE( ))";
					cn = Conexion.getConexion();
					cl = cn.prepareCall(call);
					cl.setLong(1, entrevista.getExportacionEspecial()
							.getIdBeca());
					rs = cl.executeQuery();
					/*
					 * Date fechaBajaBeca=null; call =
					 * "{CALL SP_BuscarFechaBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); rs =
					 * cl.executeQuery(); while (rs.next()) { fechaBajaBeca=
					 * rs.getDate(2); } if(fechaBajaBeca!=null){ call =
					 * "{CALL SP_ModificarBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); //
					 * numero de fp rs = cl.executeQuery();
					 * 
					 * } if(fechaBajaBeca==null){ call =
					 * "{CALL SP_AltaBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); //
					 * numero de fp rs = cl.executeQuery();
					 * 
					 * }
					 */
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
				} catch (SQLException e) {
					e.printStackTrace();
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
				}
			}

		}

		if (valorPerfil.equals("superUsuario") && valor.equals("s")) {

			// //System.out.println(entrevista.getEvaluacionCobroBeca().name());
			// //System.out.println(entrevista.getEvaluacionCobroBeca().getValor());

			// envio de mail si es cesado
			if (entrevista.getEvaluacionCobroBeca().getValor() == "Cesado") {

				String firma = Globales.tenant;
				// vacia firma
				firma = "";

				String[] recipients = new String[] { "lisandramauri@cimientos.org" }; // destino
				// String[] recipients = new
				// String[]{"carlosquetto@cimientos.org"}; //destino
				// String[] bccRecipients = new
				// String[]{"gracielanogues@cimientos.org"};
				String[] bccRecipients = new String[] {
						"carlosquetto@cimientos.org",
						"pauladaffra@cimientos.org",
						"lisandramauri@cimientos.org",
						"padrinos@cimientos.org",
						"florenciagelabert@cimientos.org" };
				// String[] bccRecipients = new
				// String[]{"carlosquetto@hotmail.com"};
				String subject = "Aviso Cesación";
				String messageBody = entrevista.getApellidoAlumno() + ", "
						+ entrevista.getNombreAlumno() + " de "
						+ entrevista.getZonaCimientos() + ", "
						+ entrevista.getAnioEscolar().getValor()
						+ ", ahijado de " + entrevista.getPadrino()
						+ " ha cesado del PFE en "
						+ entrevista.getPeriodoEntrevista().toString() + " "
						+ entrevista.getCicloLectivo().toString()
						+ " por el siguiente motivo: '"
						+ entrevista.getMotivoCesacion().getValor() + "'";
				new MailUtil().sendMail(recipients, bccRecipients, subject,
						messageBody);

				// guardo la fecha de la cesacion en becas
				Connection cn = null;
				CallableStatement cl = null;
				ResultSet rs = null;
				String call = null;
				try {

					// //System.out.println("sp_alta 3 su s cesado "+
					// entrevista.getExportacionEspecial().getIdBeca());
					call = "{CALL SP_AltaBajaBeca(?)}";
					cn = Conexion.getConexion();
					cl = cn.prepareCall(call);
					cl.setLong(1, entrevista.getExportacionEspecial()
							.getIdBeca()); // numero de fp
					rs = cl.executeQuery();
					// cierro conexion
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
					call = "{CALL SP_ModificarBecaBajaBecado(?)}";
					// call ="insert into baja_becas values (?,CURDATE( ))";
					cn = Conexion.getConexion();
					cl = cn.prepareCall(call);
					cl.setLong(1, entrevista.getExportacionEspecial()
							.getIdBeca());
					rs = cl.executeQuery();
					/*
					 * Date fechaBajaBeca=null; call =
					 * "{CALL SP_BuscarFechaBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); rs =
					 * cl.executeQuery(); while (rs.next()) { fechaBajaBeca=
					 * rs.getDate(2); } if(fechaBajaBeca!=null){ call =
					 * "{CALL SP_ModificarBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); //
					 * numero de fp rs = cl.executeQuery();
					 * 
					 * } if(fechaBajaBeca==null){ call =
					 * "{CALL SP_AltaBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); //
					 * numero de fp rs = cl.executeQuery();
					 * 
					 * }
					 */
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
				} catch (SQLException e) {
					e.printStackTrace();
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
				}

			}

			// //System.out.println(entrevista.getEvaluacionRenovacionBeca());
			if (entrevista.getEvaluacionRenovacionBeca() == "No Renueva") {

				// guardo la fecha de no renovacion en becas
				Connection cn = null;
				CallableStatement cl = null;
				ResultSet rs = null;
				String call = null;
				try {
					// //System.out.println("sp_alta 4 no renueva "+
					// entrevista.getExportacionEspecial().getIdBeca());
					call = "{CALL SP_AltaBajaBeca(?)}";
					cn = Conexion.getConexion();
					cl = cn.prepareCall(call);
					cl.setLong(1, entrevista.getExportacionEspecial()
							.getIdBeca()); // numero de fp
					rs = cl.executeQuery();
					// cierro conexion
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
					call = "{CALL SP_ModificarBecaBajaBecado(?)}";
					// call ="insert into baja_becas values (?,CURDATE( ))";
					cn = Conexion.getConexion();
					cl = cn.prepareCall(call);
					cl.setLong(1, entrevista.getExportacionEspecial()
							.getIdBeca());
					rs = cl.executeQuery();
					/*
					 * Date fechaBajaBeca=null; call =
					 * "{CALL SP_BuscarFechaBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); rs =
					 * cl.executeQuery(); while (rs.next()) { fechaBajaBeca=
					 * rs.getDate(2); } if(fechaBajaBeca!=null){ call =
					 * "{CALL SP_ModificarBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); //
					 * numero de fp rs = cl.executeQuery();
					 * 
					 * } if(fechaBajaBeca==null){ call =
					 * "{CALL SP_AltaBajaBecaHistorial(?)}"; cn =
					 * Conexion.getConexion(); cl = cn.prepareCall(call);
					 * cl.setLong(1,
					 * entrevista.getExportacionEspecial().getIdBeca()); //
					 * numero de fp rs = cl.executeQuery();
					 * 
					 * }
					 */
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
				} catch (SQLException e) {
					e.printStackTrace();
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
				}
			}
		}

		if (valorPerfil.equals("rr")) {
			return listaEntrevistasAprobar(req);
		} else if (valorPerfil.equals("ea")) {
			return listarEntrevistas(id);
		} else {
			return new ModelAndView(
					"redirect://exportacionEntrevistas/verExportarEntrevistas.do");
		}
	}

	@RequestMapping("/entrevistas/guardarMensualSuperUsuario.do")
	public ModelAndView registrarMensualSuperUsuario(HttpServletRequest req,
			@RequestParam("alumnoId") Long id,
			@RequestParam("valorGuardar") String valor,
			@RequestParam("valorPerfil") String valorPerfil,
			@RequestParam("id") Long idEntrevista)
			throws CimientosExceptionHandler {

		TipoEntrevista tipoEntrevista = TipoEntrevista.MENSUAL;

		String mensaje = this.registrarEntrevistaSuperUsuario(id, valor,
				valorPerfil, tipoEntrevista, idEntrevista);
		if (StringUtils.isNotBlank(mensaje))
			return new ModelAndView(mensaje);
		else
			return new ModelAndView(
					"redirect://exportacionEntrevistas/verExportarEntrevistas.do?");
	}

	/**
	 * Este metodo persiste los datos de la entrevista que llegan del formulario
	 * de alta.
	 * 
	 * @return la vista que me devuelve la lista de entrevistas
	 */
	@RequestMapping("/entrevistas/guardarFinal.do")
	public ModelAndView registrarFinal(HttpServletRequest req,
			@ModelAttribute("entrevistaIndividual") EntrevistaFinal entrevista,
			@RequestParam("alumnoId") Long id,
			@RequestParam("valorGuardar") String valor,
			@RequestParam("aislsdrs") String aislsdrs,

			@RequestParam("motivoAusenciaRa2") String motivoAusenciaRa2,

			@RequestParam("valorPerfil") String valorPerfil)
			throws CimientosExceptionHandler {

		TipoEntrevista tipoEntrevista = TipoEntrevista.FINAL;
		entrevista.setMotivoAusenciaRA2(motivoAusenciaRa2);
		entrevista.setAislsdrs(aislsdrs);

		registrarEntrevista(entrevista, id, valor, valorPerfil, tipoEntrevista);

		if (valorPerfil.equals("rr")) {
			return listaEntrevistasAprobar(req);
		} else if (valorPerfil.equals("ea")) {
			return listarEntrevistas(id);
		} else {
			return new ModelAndView(
					"redirect://exportacionEntrevistas/verExportarEntrevistas.do");
		}

	}

	@RequestMapping("/entrevistas/guardarFinalSuperUsuario.do")
	public ModelAndView registrarFinalSuperUsuario(HttpServletRequest req,
			@RequestParam("alumnoId") Long id,
			@RequestParam("valorGuardar") String valor,
			@RequestParam("valorPerfil") String valorPerfil,
			@RequestParam("id") Long idEntrevista)
			throws CimientosExceptionHandler {

		TipoEntrevista tipoEntrevista = TipoEntrevista.FINAL;
		String mensaje = this.registrarEntrevistaSuperUsuario(id, valor,
				valorPerfil, tipoEntrevista, idEntrevista);
		if (StringUtils.isNotBlank(mensaje))
			return new ModelAndView(mensaje);
		else
			return new ModelAndView(
					"redirect://exportacionEntrevistas/verExportarEntrevistas.do?");
	}

	private void registrarEntrevista(EntrevistaIndividual entrevista, Long id,
			String valor, String valorPerfil, TipoEntrevista tipoEntrevista) {
		PerfilAlumno p = srvAlumno.obtenerAlumno(id);

		// if(!p.getHistorialEntrevistas().contains(entrevista) &&
		// (entrevista.getEstadoEntrevista() == null ||
		// !entrevista.getEstadoEntrevista().equals(EstadoEntrevista.FINALIZADA))){
		PerfilPadrino padrino = p.getBeca().getPadrino();
		Beca beca = p.getBeca();
		Periodo periodo = calcularProximoPeriodo(p);
		AlumnoPanelEA ape = alumnoPanelEaSrv
				.obtenerAlumnoPanelPorIdPerfilAlumno(id);
		// Se actualiza el alumnoPanelEa
		if (valor.equals("f")) {
			// se modifica a partir de marzo 2017 para que la finalice
			// directamente el ea
			// if(valorPerfil.equals("ea") ||
			// valorPerfil.equals("superUsuario"))
			// entrevista.setEstadoEntrevista(EstadoEntrevista.SUPERVISOR);
			// else{
			if (valorPerfil.equals("superUsuario"))
				entrevista.setEstadoEntrevista(EstadoEntrevista.FINALIZADA);
			else {
				entrevista.setEstadoEntrevista(EstadoEntrevista.FINALIZADA);
			}
		} else if (valor.equals("s")) {
			entrevista.setEstadoEntrevista(EstadoEntrevista.FINALIZADA);

		} else {
			entrevista.setEstadoEntrevista(EstadoEntrevista.CONSTRUCCION);
		}

		if (tipoEntrevista.equals(TipoEntrevista.RENOVACION)) {
			EntrevistaRenovacion renovacion = null;
			renovacion = (EntrevistaRenovacion) entrevista;

			if (renovacion.getEvaluacionRenovacionMergeada() != null) {
				if (renovacion.getEvaluacionRenovacionMergeada().equals(
						EvaluacionRenovacionMergeada.PENDIENTE))
					entrevista
							.setEvaluacionCobroBeca(EvaluacionCobroBeca.NO_APLICA);
			}
		}

		if (tipoEntrevista.equals(TipoEntrevista.INCORPORACION)) {
			periodo = calcularProximoPeriodoReincorporacion(p);
			EntrevistaReIncorporacion incorporacion = null;
			incorporacion = (EntrevistaReIncorporacion) entrevista;
			if (incorporacion.getIncorporacion() != null) {
				if (incorporacion.getIncorporacion().equals(
						EvaluacionIncorporacion.INCORPORAPENDIENTE))
					entrevista
							.setEvaluacionCobroBeca(EvaluacionCobroBeca.NO_APLICA);
				// cambiado para el COVID 2019
				// entrevista.setEvaluacionCobroBeca(EvaluacionCobroBeca.APROBADO);
			}
		}

		if (entrevista.getId() == null) {
			entrevista.setTipoEntrevista(tipoEntrevista);
			entrevista.setPeriodoDePago(periodo);
			entrevista.setFechaCarga(new Date());
			entrevista.setPerfilAlumno(p);
			entrevista.setEa(p.getEa());
			entrevista.setRr(p.getEa().getRr());
			entrevista.setEscuelaAlumno(p.getEscuela());
			entrevista.setAnioEscolar(p.getAnioEscolar());
			entrevista.setFechaAltaBeca(p.getFechaAltaBeca()); // Tomo la fecha
																// de alta beca
																// del alumno!!!
			ape.incrementarEntrevista(entrevista.getEstadoEntrevista());
		} else {
			actualizarEntrevista(entrevista);
			ape.actualizarEntrevista(entrevista.getEstadoEntrevista());
		}

		// Se agregan los campos especiales para exportacion entrevistas
		agregarExportacionEspecial(entrevista);
		srvEntrevistas.guardarEntrevista(entrevista);
		if (tipoEntrevista.equals(TipoEntrevista.FINAL)) {
			List<EntrevistaIndividual> entrevistasPagoSuspendido = srvEntrevistas
					.obtenerEntrevistasConPagoSuspendidoPorAlumno(p.getId());
			List<EntrevistaIndividual> entrevistasCicloActual = srvEntrevistas
					.obtenerEntrevistasMensualesPorAlumno(p.getId(),
							beca.getCiclo());
			InformeIS3 informe = srvInformeIS3
					.obtenerInformePorIdEntrevista(entrevista.getId());

			if (informe == null)
				generadorInformes.generarInformeIS3(padrino, beca, entrevista,
						p, entrevistasPagoSuspendido, entrevistasCicloActual);
			else
				generadorInformes.actualizarInformeIS3(informe, padrino, beca,
						entrevista, p, entrevistasPagoSuspendido,
						entrevistasCicloActual);
		}

		ape.setEntrevistasFinalizadas(false);
		if (valor.equals("f")) {
			// if(valorPerfil.equals("ea") ||
			// valorPerfil.equals("superUsuario"))
			if (valorPerfil.equals("superUsuario"))
				ape.setEntrevistasFinalizadas(false);
			else {
				ape.setEntrevistasFinalizadas(true);
			}
		} else if (valor.equals("s")) {
			ape.setEntrevistasFinalizadas(true);
		} else {
			ape.setEntrevistasFinalizadas(false);
		}
		alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);

		if (entrevista.getEstadoEntrevista()
				.equals(EstadoEntrevista.FINALIZADA)) {
			registrarPagoEntrevista(entrevista, p, periodo, new Double(0));
			chequearEstadoBecado(entrevista, p);
			if (!p.getHistorialEntrevistas().contains(entrevista))
				p.getHistorialEntrevistas().add(entrevista);

			this.generarInformesAutomaticos(padrino, beca, entrevista, p);
		}

		srvAlumno.modificarAlumno(p);

		if (entrevista.getEstadoEntrevista()
				.equals(EstadoEntrevista.FINALIZADA)) {// ||
														// entrevista.getEvaluacionCobroBeca().equals("Cesado")){
			// guardo la fecha de la cesacion en becas
			// //System.out.println(entrevista.getMotivoNoRenovacion());
			// ////System.out.println(entrevista.getEvaluacionRenovacionMergeada().getValor());

			// //System.out.println(entrevista.getAnioEscolar().getId());
			// //System.out.println(entrevista.getPerfilAlumno().getAnioAdicional());
			// //System.out.println(entrevista.getMotivoNoRenovacion());
			// //System.out.println(entrevista.getAnioEscolar().getId());
			if (entrevista.getMotivoNoRenovacion() != null
					|| entrevista.getAnioEscolar().getId() == 14
					|| (entrevista.getAnioEscolar().getId() == 13 && entrevista
							.getPerfilAlumno().getAnioAdicional() != true)) {
				// //System.out.println(entrevista.getEvaluacionCobroBeca().name());
				// //System.out.println(entrevista.getEvaluacionCobroBeca().getValor());
				if (entrevista.getEvaluacionCobroBeca().getValor()
						.equals("Cesado")) {
					Connection cn = null;
					CallableStatement cl = null;
					ResultSet rs = null;
					String call = null;
					// //System.out.println(entrevista.getId());
					try {
						// //System.out.println("sp_alta 5 cesado "+
						// entrevista.getExportacionEspecial().getIdBeca());
						call = "{CALL SP_AltaBajaBeca(?)}";
						// call ="insert into baja_becas values (?,CURDATE( ))";
						cn = Conexion.getConexion();
						cl = cn.prepareCall(call);
						cl.setLong(1, entrevista.getExportacionEspecial()
								.getIdBeca());
						rs = cl.executeQuery();

						// cierro conexion
						Conexion.cerrarCall(cl);
						Conexion.cerrarConexion(cn);
						call = "{CALL SP_ModificarBecaBajaBecado(?)}";
						// call ="insert into baja_becas values (?,CURDATE( ))";
						cn = Conexion.getConexion();
						cl = cn.prepareCall(call);
						cl.setLong(1, entrevista.getExportacionEspecial()
								.getIdBeca());
						rs = cl.executeQuery();
						/*
						 * Date fechaBajaBeca=null; call =
						 * "{CALL SP_BuscarFechaBajaBecaHistorial(?)}"; cn =
						 * Conexion.getConexion(); cl = cn.prepareCall(call);
						 * cl.setLong(1,
						 * entrevista.getExportacionEspecial().getIdBeca()); rs
						 * = cl.executeQuery(); while (rs.next()) {
						 * fechaBajaBeca= rs.getDate(2); }
						 * if(fechaBajaBeca!=null){ call =
						 * "{CALL SP_ModificarBajaBecaHistorial(?)}"; cn =
						 * Conexion.getConexion(); cl = cn.prepareCall(call);
						 * cl.setLong(1,
						 * entrevista.getExportacionEspecial().getIdBeca()); //
						 * numero de fp rs = cl.executeQuery();
						 * 
						 * } if(fechaBajaBeca==null){ call =
						 * "{CALL SP_AltaBajaBecaHistorial(?)}"; cn =
						 * Conexion.getConexion(); cl = cn.prepareCall(call);
						 * cl.setLong(1,
						 * entrevista.getExportacionEspecial().getIdBeca()); //
						 * numero de fp rs = cl.executeQuery();
						 * 
						 * }
						 */
						Conexion.cerrarCall(cl);
						Conexion.cerrarConexion(cn);

					} catch (SQLException e) {
						e.printStackTrace();
						Conexion.cerrarCall(cl);
						Conexion.cerrarConexion(cn);
					}
				}
			}
		}
		// }
	}

	private String registrarEntrevistaSuperUsuario(Long id, String valor,
			String valorPerfil, TipoEntrevista tipoEntrevista, Long idEntrevista) {
		String mensaje = "";
		String error = "redirect://exportacionEntrevistas/verExportarEntrevistas.do?error=";
		boolean sePuedeModificar = false;
		PerfilAlumno p = srvAlumno.obtenerAlumno(id);
		Entrevista entrevista = srvEntrevistas.obtenerEntrevista(idEntrevista);
		EntrevistaIndividual entrevistaIndividual = (EntrevistaIndividual) entrevista;
		if (StringUtils.isNotBlank(valorPerfil)) {
			List<EntrevistaIndividual> entrevistas = srvEntrevistas
					.obtenerTodasEntrevistasPorAlumno(id, "descendiente");
			EntrevistaIndividual ultimaEntrevista = (EntrevistaIndividual) entrevistas
					.get(0);
			if (ultimaEntrevista.getId().equals(entrevistaIndividual.getId())
					&& entrevistaIndividual.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				if (p.getHistorialEntrevistas().contains(entrevista)
						&& entrevista.getEstadoEntrevista().equals(
								EstadoEntrevista.FINALIZADA))
					sePuedeModificar = true;
				else
					sePuedeModificar = false;
			else
				sePuedeModificar = false;
		} else
			sePuedeModificar = false;

		if (sePuedeModificar) {
			Beca beca = svrBeca.obtenerPorId(entrevista
					.getExportacionEspecial().getIdBeca());
			List<Pago> pagos = srvPago.obtenerPagoPorAlumnoPorPeriodo(id,
					entrevistaIndividual.getPeriodoDePago().getId());
			AlumnoPanelEA ape = alumnoPanelEaSrv
					.obtenerAlumnoPanelPorIdPerfilAlumno(id);

			if (tipoEntrevista.equals(TipoEntrevista.INCORPORACION)) {
				EntrevistaReIncorporacion incorporacion = null;
				incorporacion = (EntrevistaReIncorporacion) entrevistaIndividual;
				mensaje = this.guardarEntrevistaIncorporacion(incorporacion,
						pagos, entrevista, entrevistaIndividual, valor, ape,
						id, p, beca);
			}

			if (tipoEntrevista.equals(TipoEntrevista.RENOVACION)) {
				EntrevistaRenovacion renovacion = null;
				renovacion = (EntrevistaRenovacion) entrevistaIndividual;
				mensaje = this.guardarEntrevistaRenovacion(renovacion, pagos,
						entrevista, entrevistaIndividual, valor, ape, p, beca);
			}
			if (tipoEntrevista.equals(TipoEntrevista.MENSUAL)) {
				mensaje = this.guardarEntrevistaMensual(pagos,
						entrevistaIndividual, valor, ape, p, beca, entrevista);
			}
			if (tipoEntrevista.equals(TipoEntrevista.FINAL)) {
				EntrevistaFinal entrevistaFinal = (EntrevistaFinal) entrevistaIndividual;
				InformeIS3 is3 = srvInformeIS3
						.obtenerInformePorAlumno(p.getId(), entrevistaFinal
								.getPeriodoDePago().getCiclo());
				mensaje = this.guardarEntrevistaFinal(entrevistaFinal, pagos,
						is3, entrevista, entrevistaIndividual, valor, ape, p,
						beca);
			}
		} else
			mensaje = error
					+ "No se puede modificar el estado de la entrevista del becado "
					+ p.getDatosPersonales().getApellidoNombre()
					+ " porque no es la última entrevista generada";

		return mensaje;
	}

	/**
	 * Este metodo agrega los campos necesarios para la posterior exportacion de
	 * entrevistas.
	 * 
	 * @param entrevista
	 */
	private void agregarExportacionEspecial(EntrevistaIndividual entrevista) {

		ExportacionEspecial exportacion = null;
		PerfilAlumno alumno = entrevista.getPerfilAlumno();

		if (entrevista.getExportacionEspecial() == null) {
			// Se crea el registro y se insertan los datos especiales, estos son
			// fijos durante el proceso de entrevista

			exportacion = new ExportacionEspecial();

			Beca beca = alumno.getBeca();

			// se asegura de que los datos de anio escolar y de escuela queden
			// seteados en la entrevista.
			if (entrevista.getAnioEscolar() == null) {
				entrevista.setAnioEscolar(alumno.getAnioEscolar());
			}
			if (entrevista.getEscuelaAlumno() == null) {
				entrevista.setEscuelaAlumno(alumno.getEscuela());
			}

			Integer edad = null;
			Calendar calendarHoy = GregorianCalendar.getInstance();
			calendarHoy.setTime(entrevista.getFechaCarga());
			Calendar calendarNac = GregorianCalendar.getInstance();
			calendarNac.setTime(alumno.getDatosPersonales()
					.getFechaNacimiento());
			edad = calendarHoy.get(Calendar.YEAR)
					- calendarNac.get(Calendar.YEAR);
			exportacion.setEdad(edad);

			String padrino = (beca.getPadrino().getEmpresa() != null ? beca
					.getPadrino().getEmpresa().getDenominacion() : beca
					.getPadrino().getDatosPersonales().getApellido()
					+ ", " + beca.getPadrino().getDatosPersonales().getNombre());
			exportacion.setIdBeca(beca.getId());
			exportacion.setPadrino(padrino);
			exportacion.setIdPadrino(beca.getPadrino().getId());
			exportacion.setTipoPadrino(beca.getPadrino().getTipo().getValor());
			entrevista.setExportacionEspecial(exportacion);
		} else {
			// este registro existe
			exportacion = entrevista.getExportacionEspecial();
		}

		// en el caso de boletin, como este puede ir cambiando durante el
		// proceso de entrevista
		// los datos de previas pueden cambiar por lo que hay que actualizar el
		// registro de exportacion
		Boletin boletin = alumno.getBoletin();
		boolean previas = false;
		List<MateriaPreviaDTO> listMateriasPrevias = new ArrayList<MateriaPreviaDTO>();
		if (boletin != null) {
			listMateriasPrevias = this
					.obtenerMateriasPreviasDesaprobadasBoletinAnterior(boletin);
			if (!listMateriasPrevias.isEmpty()) {
				previas = true;
				StringBuffer materiasPrevias = new StringBuffer();
				for (MateriaPreviaDTO previa : listMateriasPrevias) {
					materiasPrevias.append(previa.getMateria().getNombre()
							+ ", ");
				}
				materiasPrevias.deleteCharAt(materiasPrevias.lastIndexOf(","));
				exportacion.setNombresPrevias(materiasPrevias.toString());
			}
		} else {
			if (alumno.getEstadoAlumno().equals(EstadoAlumno.RENOVADO)) {
				if (entrevista.getTipoEntrevista().equals(
						TipoEntrevista.MENSUAL)
						|| entrevista.getTipoEntrevista().equals(
								TipoEntrevista.FINAL)) {
					Boletin boletinAnterior = null;
					if (alumno.getHistorialBoletin() != null
							&& alumno.getHistorialBoletin().size() > 0)
						boletinAnterior = alumno.getHistorialBoletin().get(
								alumno.getHistorialBoletin().size() - 1);
					if (boletinAnterior != null) {
						listMateriasPrevias = this
								.obtenerMateriasPreviasDesaprobadasBoletinAnterior(boletinAnterior);
						if (!listMateriasPrevias.isEmpty()) {
							previas = true;
							StringBuffer materiasPrevias = new StringBuffer();
							for (MateriaPreviaDTO previa : listMateriasPrevias) {
								materiasPrevias.append(previa.getMateria()
										.getNombre() + ", ");
							}
							materiasPrevias.deleteCharAt(materiasPrevias
									.lastIndexOf(","));
							exportacion.setNombresPrevias(materiasPrevias
									.toString());
						}
					}
				}
			}
		}
		exportacion.setPrevias(previas);
	}

	/**
	 * el periodo se tiene que calcular dependiendo las entrevistas que falten.
	 * Por mas que el periodo segun la fecha de hoy es 5, si el alumno no tiene
	 * todas las entrevistas, debe generar la entrevista que falta en orden.
	 * Ademas la cantidad de entrevistas que le faltan hay que calcularlas
	 * dependiendo de la fecha de ingreso al PBE
	 * 
	 * @param perfilAlumno
	 *            - alumno para calcular el periodo
	 * @return
	 */
	private Periodo calcularProximoPeriodo(PerfilAlumno p) {

		List<Long> periodosIds = PeriodoHelper.obtenerListaIdsPeriodos(p
				.getBeca().getCiclo().getPeriodos());
		EntrevistaIndividual entrevista = srvEntrevistas
				.obtenerUltimaEntrevista(p, periodosIds);
		if (entrevista != null) {
			if (entrevista.getEstadoEntrevista().equals(
					EstadoEntrevista.FINALIZADA))
				if (entrevista.getPeriodoDePago().getId() == 2) {
					return PeriodoHelper.obtenerPeriodoPorOrden(p.getBeca()
							.getCiclo().getPeriodos(), 1);
				} else
					return PeriodoHelper.obtenerPeriodoPorOrden(p.getBeca()
							.getCiclo().getPeriodos(), entrevista
							.getPeriodoDePago().getOrden() + 1);
			else
				return entrevista.getPeriodoDePago();
		} else {
			return PeriodoHelper.getPeriodoActual(p.getBeca().getCiclo()
					.getPeriodos(), p.getFechaAltaBeca());
		}

	}

	private Periodo calcularProximoPeriodoReincorporacion(PerfilAlumno p) {
		List<Long> periodosIds = PeriodoHelper.obtenerListaIdsPeriodos(p
				.getBeca().getCiclo().getPeriodos());
		EntrevistaIndividual entrevista = srvEntrevistas
				.obtenerUltimaEntrevista(p, periodosIds);
		if (p.getFechaPBE() != null) // es una reincorporacion
			if (entrevista != null) {
				if (entrevista.getEstadoEntrevista().equals(
						EstadoEntrevista.FINALIZADA)) // ya tiene entrevistas de
														// incorporacion
														// pendientes
					return PeriodoHelper.obtenerPeriodoPorOrden(p.getBeca()
							.getCiclo().getPeriodos(), entrevista
							.getPeriodoDePago().getOrden() + 1);
				else
					// es el periodo de la entrevista ya creada y aún no
					// finalizada
					return entrevista.getPeriodoDePago();
			} else
				// tiene que comenzar con el periodo de la fecha de alta beca
				return PeriodoHelper.getPeriodoActual(p.getBeca().getCiclo()
						.getPeriodos(), p.getFechaAltaBeca());
		else {// es una incorporacion
			if (entrevista != null) {
				if (entrevista.getEstadoEntrevista().equals(
						EstadoEntrevista.FINALIZADA))
					return PeriodoHelper.obtenerPeriodoPorOrden(p.getBeca()
							.getCiclo().getPeriodos(), entrevista
							.getPeriodoDePago().getOrden() + 1);
				else
					return entrevista.getPeriodoDePago();
			} else {
				return PeriodoHelper.getPeriodoActual(p.getBeca().getCiclo()
						.getPeriodos(), p.getFechaAltaBeca());
			}
		}
	}

	/**
	 * Cuando se esta editando se pierden los valores de los campos que no se
	 * muestran en la jsp y no se pusieron como ocultos. Actualiza el objeto con
	 * los datos de la base
	 * 
	 * @param entrevista
	 */
	private void actualizarEntrevista(EntrevistaIndividual entrevista) {
		EntrevistaIndividual e = (EntrevistaIndividual) srvEntrevistas
				.obtenerEntrevista(entrevista.getId());
		entrevista.setTipoEntrevista(e.getTipoEntrevista());
		entrevista.setPeriodoDePago(e.getPeriodoDePago());
		entrevista.setFechaCarga(e.getFechaCarga());
		entrevista.setPerfilAlumno(e.getPerfilAlumno());
		entrevista.setEa(e.getPerfilAlumno().getEa());
		entrevista.setRr(e.getPerfilAlumno().getEa().getRr());
		entrevista.setEscuelaAlumno(e.getPerfilAlumno().getEscuela());
		entrevista.setEntrevistaGrupal(e.getEntrevistaGrupal());
		entrevista.setExportacionEspecial(e.getExportacionEspecial());
		entrevista.setAnioEscolar(e.getAnioEscolar());
	}

	private void chequearEstadoBecado(EntrevistaIndividual entrevista,
			PerfilAlumno p) {
		if (entrevista.getEvaluacionCobroBeca().equals(
				EvaluacionCobroBeca.CESADO)) {
			p.setEstadoAlumno(EstadoAlumno.CESADO);
			p.setFechaBaja(new Date());
			p.setPeriodoDeBaja(entrevista.getPeriodoDePago());
			p.setMotivoBaja(entrevista.getMotivoCesacion().getValor());
			if (p.getSituacionActual() != null)
				p.setSituacionEscolarUltimaEntevista(p.getSituacionEscolar());
			PerfilPadrino padrino = p.getBeca().getPadrino();
			Beca beca = p.getBeca();
			desasignarBecaBecado(p);
			List<EntrevistaIndividual> entrevistasPagoSuspendido = srvEntrevistas
					.obtenerEntrevistasConPagoSuspendidoPorAlumno(p.getId());
			InformeIS2 informeIS2 = srvInformeIS2.obtenerInformePorAlumno(
					p.getId(), beca.getCiclo());
			generadorInformes.generarInformeCesacion(entrevista, beca, p,
					entrevistasPagoSuspendido, padrino, informeIS2);
		} else {
			cambiarEstadoAlumno(p, entrevista);
		}
	}

	/**
	 * Le saca la beca al alumno. La manda al historial y elimina de la lista de
	 * alumnos de la beca a este alumno
	 * 
	 * @param p
	 */
	private void desasignarBecaBecado(PerfilAlumno p) {
		if (p.getHistorialBeca() == null) {
			List<Beca> historialBeca = new ArrayList<Beca>();
			p.setHistorialBeca(historialBeca);
		}
		Beca beca = p.getBeca();
		beca.getBecados().remove(p);
		beca.setCantidadAsignada(beca.getCantidadAsignada() - 1);
		p.getHistorialBeca().add(beca);
		p.setBeca(null);
	}

	/**
	 * Cambia el estado al alumno dependiendo del tipo de entrevista y de la
	 * evaluacion de esta. Actualiza el alumnoPanelEA.
	 * 
	 * @param p
	 * @param entrevista
	 */
	private void cambiarEstadoAlumno(PerfilAlumno p,
			EntrevistaIndividual entrevista) {
		AlumnoPanelEA ape = alumnoPanelEaSrv
				.obtenerAlumnoPanelPorIdPerfilAlumno(p.getId());
		if (entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)) {
			EntrevistaRenovacion er = (EntrevistaRenovacion) entrevista;
			setearSituacionEscolarAlumnoRenovacion(p,
					er.getSituacionEscolarMergeada()); // !!!
			if (er.getEvaluacionRenovacionMergeada().equals(
					EvaluacionRenovacionMergeada.PENDIENTE)) {
				p.setEstadoAlumno(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION);
				// Se agregó el seteo del nuevo estado de renovacion cuando el
				// becado pasa de "En condiciones de renovar"
				// a "Pendiente". Este caso solo se da en la entrevista de
				// renovacion con situacion de renovacion
				// "Pendiente"
				p.setEstadoRenovacion(EvaluacionRenovacionFinal.PENDIENTE);
				ape.setRenovacionPendiente(true);
				alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
			} else if (er.getEvaluacionRenovacionMergeada().equals(
					EvaluacionRenovacionMergeada.NO_RENUEVA)) {
				p.setEstadoAlumno(EstadoAlumno.NO_RENOVADO);
				ape.setActivo(false);
				alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
				desasignarBecaBecado(p);
				p.setFechaBaja(new Date());
				p.setPeriodoDeBaja(entrevista.getPeriodoDePago());
				p.setMotivoBaja(er.getMotivoNoRenovacion().getValor());
			} else {
				p.setEstadoAlumno(EstadoAlumno.RENOVADO);
				p.setAnioEscolar(avanzarAnioEscolar(p.getAnioEscolar(),
						p.getAnioAdicional(), er.getSituacionEscolarMergeada(),
						er.getEvaluacionRenovacionMergeada()));
				ape.setRenovacionPendiente(false);
				ape.setAnio(p.getAnioEscolar());
				alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
			}
		} else {
			if (entrevista.getTipoEntrevista().equals(
					TipoEntrevista.INCORPORACION)) {
				EntrevistaReIncorporacion ei = (EntrevistaReIncorporacion) entrevista;
				if (ei.getIncorporacion().equals(
						EvaluacionIncorporacion.INCORPORA)) {
					if (p.getEstadoAlumno().equals(EstadoAlumno.ALTA_BECADO)
							|| p.getEstadoAlumno().equals(
									EstadoAlumno.INCORPORACION_PENDIENTE)) {
						p.setEstadoAlumno(EstadoAlumno.INCORPORADO);
						if (p.getFechaPBE() != null)
							// Se setea la Fecha de reincorporacion al PBE del
							// becado
							p.setFechaReincorporacionPBE(ei.getPeriodoDePago()
									.getFechaInicio());
						else
							// Se setea la Fecha de incorporacion al PBE del
							// becado
							p.setFechaPBE(ei.getPeriodoDePago()
									.getFechaInicio());
					}
				} else {
					if (ei.getIncorporacion().equals(
							EvaluacionIncorporacion.NOINCORPORA)) {
						if (p.getEstadoAlumno()
								.equals(EstadoAlumno.ALTA_BECADO)
								|| p.getEstadoAlumno().equals(
										EstadoAlumno.INCORPORACION_PENDIENTE)) {
							p.setEstadoAlumno(EstadoAlumno.NO_INCORPORADO);
							p.setMotivoBaja(ei.getMotivoNoIncorporacion()
									.getValor());
							ape.setActivo(false);
							alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
						}

						desasignarBecaBecado(p);

						// dar de alta baja beca disponible

						p.setFechaBaja(new Date());
						p.setPeriodoDeBaja(entrevista.getPeriodoDePago());
					} else {
						if (ei.getIncorporacion().equals(
								EvaluacionIncorporacion.INCORPORAPENDIENTE)) {
							if (p.getEstadoAlumno().equals(
									EstadoAlumno.ALTA_BECADO)
									|| p.getEstadoAlumno()
											.equals(EstadoAlumno.INCORPORACION_PENDIENTE)) {
								p.setEstadoAlumno(EstadoAlumno.INCORPORACION_PENDIENTE);
							}
						}
					}
				}
			} else {
				if (entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)) {
					EntrevistaFinal ef = (EntrevistaFinal) entrevista;
					// if(ef.getResultadoAnioEscolar().equals(ResultadoAnioEscolar.EGRESO)){
					if (ef.getSituacionEscolarMergeada().equals(
							SituacionEscolarMergeada.EGRESO)) {
						p.setPeriodoDeEgreso(ef.getPeriodoDePago());
						p.setUltimaActualizacion(new Date());
					}
					// setearSituacionEscolarAlumno(p,ef.getResultadoAnioEscolar());
					setearSituacionEscolarAlumno(p,
							ef.getSituacionEscolarMergeada()); // !!!

					if (ef.getEvaluacionRenovacionFinal().equals(
							EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE)) {
						p.setEstadoAlumno(EstadoAlumno.EGRESADO);
						desasignarBecaBecado(p);
						p.setFechaBaja(new Date());
						p.setPeriodoDeBaja(entrevista.getPeriodoDePago());
						p.setProyeccionEntrevistaFinal(ef.getProyAnioProximo());
					} else if (ef.getEvaluacionRenovacionFinal().equals(
							EvaluacionRenovacionFinal.NO_RENUEVA)) {
						p.setEstadoAlumno(EstadoAlumno.NO_RENOVADO);
						p.setMotivoBaja(ef.getMotivoNoRenovacion().getValor());
						desasignarBecaBecado(p);
						p.setFechaBaja(new Date());
						p.setPeriodoDeBaja(entrevista.getPeriodoDePago());
					} else {
						p.setEstadoAlumno(EstadoAlumno.PENDIENTE_RENOVACION_SIN_ASIGNACION);
						// se agrego esta propiedad al alumno porque se
						// necesitaba mostrarla
						// en las grillas de renovacion.
						p.setEstadoRenovacion(ef.getEvaluacionRenovacionFinal());
					}

				}
			}
		}
	}

	/**
	 * Segun el año y si tiene o no año adicional, avanza al alumno de año
	 * escolar
	 * 
	 * @param anioEscolar
	 * @param anioAdicional
	 * @param situacionEscolar
	 * @return
	 */
	// private AnioEscolar avanzarAnioEscolar(AnioEscolar anioEscolar, Boolean
	// anioAdicional, SituacionEscolar situacionEscolar) {
	private AnioEscolar avanzarAnioEscolar(AnioEscolar anioEscolar,
			Boolean anioAdicional, SituacionEscolarMergeada situacionEscolar,
			EvaluacionRenovacionMergeada evaluacionRenovacionMergeada) {
		// if(situacionEscolar.equals(SituacionEscolar.CONPREVIAS) ||
		// situacionEscolar.equals(SituacionEscolar.PROMOVIDO)){
		if (situacionEscolar
				.equals(SituacionEscolarMergeada.PROMOVIDO_CON_PREVIAS)
				|| situacionEscolar.equals(SituacionEscolarMergeada.PROMOVIDO)) {
			if (anioEscolar.equals(AnioEscolar.SEXTO_SEC) && !anioAdicional)
				return AnioEscolar.getAnioEscolar(anioEscolar.getId() + 2);
			else
				return AnioEscolar.getAnioEscolar(anioEscolar.getId() + 1);
		}
		if (evaluacionRenovacionMergeada
				.equals(evaluacionRenovacionMergeada.COVID)) {
			if (anioEscolar.equals(AnioEscolar.SEXTO_SEC) && !anioAdicional)
				return AnioEscolar.getAnioEscolar(anioEscolar.getId() + 2);
			else
				return AnioEscolar.getAnioEscolar(anioEscolar.getId() + 1);
		} else
			return anioEscolar;
	}

	private void setearSituacionEscolarAlumnoRenovacion(PerfilAlumno p,
			SituacionEscolarMergeada situacionEscolar) {
		if (situacionEscolar.equals(SituacionEscolarMergeada.PENDIENTE)) {
			p.setSituacionEscolar(SituacionEscolarAlumno.PENDIENTE);
			p.setSituacionEscolarUltimaEntevista(SituacionEscolarAlumno.PENDIENTE);
		} else if (situacionEscolar.equals(SituacionEscolarMergeada.PROMOVIDO)) {
			p.setSituacionEscolar(SituacionEscolarAlumno.PROMOVIDO);
			p.setSituacionEscolarUltimaEntevista(SituacionEscolarAlumno.PROMOVIDO);
		} else
		// if(situacionEscolar.equals(SituacionEscolar.CONPREVIAS))
		if (situacionEscolar
				.equals(SituacionEscolarMergeada.PROMOVIDO_CON_PREVIAS)) {
			p.setSituacionEscolar(SituacionEscolarAlumno.PROMOVIDO_CON_PREVIAS);
			p.setSituacionEscolarUltimaEntevista(SituacionEscolarAlumno.PROMOVIDO_CON_PREVIAS);
		} else {
			p.setSituacionEscolar(SituacionEscolarAlumno.REPITIO);
			p.setSituacionEscolarUltimaEntevista(SituacionEscolarAlumno.REPITIO);
		}
	}

	/**
	 * Dependiendo del resultado año escolar elegido en la entrevista final, se
	 * setea la situacion escolar del alumno
	 * 
	 * @param tipoEntrevista
	 */
	// private void setearSituacionEscolarAlumno(PerfilAlumno
	// p,ResultadoAnioEscolar resultadoAnioEscolar) {
	private void setearSituacionEscolarAlumno(PerfilAlumno p,
			SituacionEscolarMergeada resultadoAnioEscolar) {
		if (resultadoAnioEscolar.equals(SituacionEscolarMergeada.EGRESO)) {
			p.setSituacionEscolar(SituacionEscolarAlumno.EGRESO);
			p.setSituacionEscolarUltimaEntevista(SituacionEscolarAlumno.EGRESO);
		} else if (resultadoAnioEscolar
				.equals(SituacionEscolarMergeada.PENDIENTE)) {
			p.setSituacionEscolar(SituacionEscolarAlumno.PENDIENTE);
			p.setSituacionEscolarUltimaEntevista(SituacionEscolarAlumno.PENDIENTE);
		} else if (resultadoAnioEscolar
				.equals(SituacionEscolarMergeada.PROMOVIDO)) {
			p.setSituacionEscolar(SituacionEscolarAlumno.PROMOVIDO);
			p.setSituacionEscolarUltimaEntevista(SituacionEscolarAlumno.PROMOVIDO);
		} else if (resultadoAnioEscolar
				.equals(SituacionEscolarMergeada.PROMOVIDO_CON_PREVIAS)) {
			p.setSituacionEscolar(SituacionEscolarAlumno.PROMOVIDO_CON_PREVIAS);
			p.setSituacionEscolarUltimaEntevista(SituacionEscolarAlumno.PROMOVIDO_CON_PREVIAS);
		} else {
			p.setSituacionEscolar(SituacionEscolarAlumno.REPITIO);
			p.setSituacionEscolarUltimaEntevista(SituacionEscolarAlumno.REPITIO);
		}
	}

	/**
	 * Registra el pago de la entrevista y actualiza el alumnoPanelEa.
	 * 
	 * @param entrevista
	 * @param p
	 * @param periodo
	 * @param extra
	 */
	private void registrarPagoEntrevista(EntrevistaIndividual entrevista,
			PerfilAlumno p, Periodo periodo, Double extra) {
		AlumnoPanelEA ape = alumnoPanelEaSrv
				.obtenerAlumnoPanelPorIdPerfilAlumno(p.getId());
		EntrevistaRenovacion renovacion = null;
		EntrevistaReIncorporacion incorporacion = null;
		boolean noGeneraPago = true;
		if (entrevista.getEvaluacionCobroBeca() == null)
			entrevista.setEvaluacionCobroBeca(EvaluacionCobroBeca.NULO);

		if (!srvPago.existePeriodo(p, periodo)) {
			if (entrevista.getTipoEntrevista()
					.equals(TipoEntrevista.RENOVACION)) {
				renovacion = (EntrevistaRenovacion) entrevista;
				if (renovacion.getEvaluacionRenovacionMergeada().equals(
						EvaluacionRenovacionMergeada.NO_RENUEVA)) {
					noGeneraPago = false;
					ape.setActivo(false);
					alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
				}

			} else if (entrevista.getTipoEntrevista().equals(
					TipoEntrevista.INCORPORACION)) {
				incorporacion = (EntrevistaReIncorporacion) entrevista;
				if (incorporacion.getIncorporacion().equals(
						EvaluacionIncorporacion.NOINCORPORA)) {

					// guardo la fecha de la cesacion en becas
					Connection cn = null;
					CallableStatement cl = null;
					ResultSet rs = null;
					String call = null;
					try {
						// //System.out.println("sp_alta 6 rr f no incorpora "+
						// entrevista.getExportacionEspecial().getIdBeca());
						call = "{CALL SP_AltaBajaBeca(?)}";
						cn = Conexion.getConexion();
						cl = cn.prepareCall(call);
						cl.setLong(1, entrevista.getExportacionEspecial()
								.getIdBeca()); // numero de fp
						rs = cl.executeQuery();
						// cierro conexion
						Conexion.cerrarCall(cl);
						Conexion.cerrarConexion(cn);
						call = "{CALL SP_ModificarBecaBajaBecado(?)}";
						// call ="insert into baja_becas values (?,CURDATE( ))";
						cn = Conexion.getConexion();
						cl = cn.prepareCall(call);
						cl.setLong(1, entrevista.getExportacionEspecial()
								.getIdBeca());
						rs = cl.executeQuery();
						Conexion.cerrarCall(cl);
						Conexion.cerrarConexion(cn);
						Date fechaBajaBeca = null;
						call = "{CALL SP_BuscarBecaParaBajar(?)}";
						cn = Conexion.getConexion();
						cl = cn.prepareCall(call);
						cl.setLong(1, entrevista.getExportacionEspecial()
								.getIdBeca());
						rs = cl.executeQuery();
						while (rs.next()) {
							fechaBajaBeca = rs.getDate(2);
						}
						/*
						 * Date fechaBajaBeca1=null; call =
						 * "{CALL SP_BuscarFechaBajaBecaHistorial(?)}"; cn =
						 * Conexion.getConexion(); cl = cn.prepareCall(call);
						 * cl.setLong(1,
						 * entrevista.getExportacionEspecial().getIdBeca()); rs
						 * = cl.executeQuery(); while (rs.next()) {
						 * fechaBajaBeca1= rs.getDate(2); }
						 * if(fechaBajaBeca1!=null){ call =
						 * "{CALL SP_ModificarBajaBecaHistorial(?)}"; cn =
						 * Conexion.getConexion(); cl = cn.prepareCall(call);
						 * cl.setLong(1,
						 * entrevista.getExportacionEspecial().getIdBeca()); //
						 * numero de fp rs = cl.executeQuery();
						 * 
						 * } if(fechaBajaBeca1==null){ call =
						 * "{CALL SP_AltaBajaBecaHistorial(?)}"; cn =
						 * Conexion.getConexion(); cl = cn.prepareCall(call);
						 * cl.setLong(1,
						 * entrevista.getExportacionEspecial().getIdBeca()); //
						 * numero de fp rs = cl.executeQuery();
						 * 
						 * }
						 */

						Conexion.cerrarCall(cl);
						Conexion.cerrarConexion(cn);
						p.getBeca().setFechaBajaBecado(fechaBajaBeca);
					} catch (SQLException e) {
						e.printStackTrace();
						Conexion.cerrarCall(cl);
						Conexion.cerrarConexion(cn);
					}

					noGeneraPago = false;
					ape.setActivo(false);
					alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
				}
			}
			// else
			// if(entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL))
			// {
			// eFinal = (EntrevistaFinal) entrevista;
			// if(eFinal.getEvaluacionRenovacionFinal().equals(EvaluacionRenovacionFinal.NO_RENUEVA))
			// // Se saco esto porque el alumno debe permanecer en el panel
			// hasta que se cierre el ciclo ||
			// eFinal.getEvaluacionRenovacionFinal().equals(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE))
			// {
			// noGeneraPago = false;
			// }
			// }

			if (entrevista.getEvaluacionCobroBeca().equals(
					EvaluacionCobroBeca.CESADO)) {
				noGeneraPago = false;
				ape.setActivo(false);
				alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
			}

			if (noGeneraPago) {
				Pago pagoBeca = new Pago();
				pagoBeca.setBecado(p);
				pagoBeca.setRa(p.getResponsable1());
				pagoBeca.setExtra(extra);
				if (entrevista.getEvaluacionCobroBeca().equals(
						EvaluacionCobroBeca.APROBADO))
					pagoBeca.setEstadoPago(EstadoPago.APROBADO);
				else if (entrevista.getEvaluacionCobroBeca().equals(
						EvaluacionCobroBeca.SUSPENDIDO)) {
					pagoBeca.setEstadoPago(EstadoPago.SUSPENDIDO);
				} else if (entrevista.getEvaluacionCobroBeca().equals(
						EvaluacionCobroBeca.NO_APLICA))
					pagoBeca.setEstadoPago(EstadoPago.NO_APLICA);
				pagoBeca.setPeriodo(periodo);
				pagoBeca.setMonto(p.getBeca().getCiclo().getMontoBeca());
				pagoBeca.setFechaAprobacionRR(new Date());
				srvPago.agregarPago(pagoBeca);
				Boolean tienePagosAprobados = srvPago.tienePagosAprobados(p
						.getId());
				ape.incrementarPago(pagoBeca.getEstadoPago());
				ape.actualizarSemaforoPagoEntrevistas(tienePagosAprobados,
						p.getId());
				alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
			}
		}
		Pago pagoEA = new Pago();
		if (entrevista.isPagaEntrevista()) {
			pagoEA.setEa(entrevista.getEa());
			pagoEA.setBecado(p);
			pagoEA.setEstadoPago(EstadoPago.APROBADO);
			pagoEA.setPeriodo(periodo);
		} else {
			pagoEA.setEstadoPago(EstadoPago.NO_APROBADO);
		}
		srvPago.agregarPago(pagoEA);
	}

	@RequestMapping("/entrevistas/guardarRenovacion.do")
	public ModelAndView registrarRenovacion(
			HttpServletRequest req,
			@ModelAttribute("entrevistaRenovacion") EntrevistaRenovacion entrevista,
			@RequestParam("alumnoId") Long id,
			@RequestParam("valorGuardar") String valor,
			@RequestParam("propositoAnual") String propositoAnual,
			@RequestParam("hsTrabajarAño") String hsTrabajarAño,
			@RequestParam("valorPerfil") String valorPerfil,
			@RequestParam("motivoAusenciaRa2") String motivoAusenciaRa2,
			@RequestParam("masDeUnEncuentro") String masDeUnEncuentro,
			@RequestParam("motivoOtro") String motivoOtro,
			@RequestParam(required = false, value = "excepcionR") Boolean excepcion,
			@RequestParam("excepcionR2") String excepcionR2,
			@RequestParam(required = false, value = "participoBecado2") Boolean participoBecado2,
			@RequestParam("oeaioe") String oeaioe,
			// @RequestParam("excepcion") String excepcion,
			@RequestParam(required = false, value = "evaluacionRenovacionFinal") Integer evaluacionRenovacionFinal,
			@RequestParam(required = false, value = "situacionEscolarDiciembre") Integer situacionEscolarDiciembre)
			throws CimientosExceptionHandler {

		TipoEntrevista tipoEntrevista = TipoEntrevista.RENOVACION;

		Date date = new Date();

		// System.out.println(date);

		entrevista.setFechaEntrevista(date);
		entrevista.setMotivoOtro(motivoOtro);
		entrevista.setParticipoBecado(participoBecado2);

		EvaluacionRenovacionFinal evaluacionRenovacion = evaluacionRenovacionFinal != null ? EvaluacionRenovacionFinal
				.getEvaluacionRenovacion(evaluacionRenovacionFinal) : null;
		// ResultadoAnioEscolar situacionEscolar = situacionEscolarDiciembre !=
		// null
		// ?ResultadoAnioEscolar.getReultadoAnioEscolarE(situacionEscolarDiciembre)
		// : null;
		SituacionEscolarMergeada situacionEscolar = situacionEscolarDiciembre != null ? SituacionEscolarMergeada
				.getSituacionEscolar(situacionEscolarDiciembre) : null;

		if (excepcionR2.equals("1")) {
			entrevista.setExcepcion(true);
		} else {
			entrevista.setExcepcion(false);
		}
		entrevista.setMotivoAusenciaRA2(motivoAusenciaRa2);
		entrevista.setMasDeUnEncuentro(masDeUnEncuentro);
		entrevista.setEvaluacionRenovacionFinal(evaluacionRenovacion);
		entrevista.setSituacionEscolarDiciembre(situacionEscolar);

		registrarEntrevista(entrevista, id, valor, valorPerfil, tipoEntrevista);

		if (valorPerfil.equals("rr")) {
			return listaEntrevistasAprobar(req);
		} else if (valorPerfil.equals("ea")) {
			return listarEntrevistas(id);
		} else {
			return new ModelAndView(
					"redirect://exportacionEntrevistas/verExportarEntrevistas.do");
		}
	}

	@RequestMapping("/entrevistas/guardarRenovacionSuperUsuario.do")
	public ModelAndView registrarRenovacionSuperUsuario(HttpServletRequest req,
			@RequestParam("alumnoId") Long id,
			@RequestParam("valorGuardar") String valor,
			@RequestParam("valorPerfil") String valorPerfil,
			@RequestParam("id") Long idEntrevista)
			throws CimientosExceptionHandler {

		TipoEntrevista tipoEntrevista = TipoEntrevista.RENOVACION;
		String mensaje = this.registrarEntrevistaSuperUsuario(id, valor,
				valorPerfil, tipoEntrevista, idEntrevista);
		if (StringUtils.isNotBlank(mensaje))
			return new ModelAndView(mensaje);
		else
			return new ModelAndView(
					"redirect://exportacionEntrevistas/verExportarEntrevistas.do?");
	}

	@RequestMapping("/entrevistas/guardarIncorporacion.do")
	public ModelAndView registrarIncorporacion(
			HttpServletRequest req,
			@ModelAttribute("entrevistaIncorporacion") EntrevistaReIncorporacion entrevista,
			@RequestParam("alumnoId") Long id,
			@RequestParam("valorGuardar") String valor,
			@RequestParam("motivoAusenciaRa2") String motivoAusenciaRa2,
			@RequestParam("proposito") String proposito,
			@RequestParam("valorPerfil") String valorPerfil)
			throws CimientosExceptionHandler {

		TipoEntrevista tipoEntrevista = TipoEntrevista.INCORPORACION;
		entrevista.setProposito(proposito);
		entrevista.setMotivoAusenciaRA2(motivoAusenciaRa2);

		registrarEntrevista(entrevista, id, valor, valorPerfil, tipoEntrevista);

		if (valorPerfil.equals("rr")) {
			return listaEntrevistasAprobar(req);
		} else if (valorPerfil.equals("ea")) {
			return listarEntrevistas(id);
		} else {
			return new ModelAndView(
					"redirect://exportacionEntrevistas/verExportarEntrevistas.do");
		}
	}

	@RequestMapping("/entrevistas/guardarIncorporacionSuperUsuario.do")
	public ModelAndView registrarIncorporacionSuperUsuario(
			HttpServletRequest req, @RequestParam("alumnoId") Long id,
			@RequestParam("valorGuardar") String valor,
			@RequestParam("valorPerfil") String valorPerfil,
			@RequestParam("id") Long idEntrevista)
			throws CimientosExceptionHandler {

		TipoEntrevista tipoEntrevista = TipoEntrevista.INCORPORACION;
		String mensaje = this.registrarEntrevistaSuperUsuario(id, valor,
				valorPerfil, tipoEntrevista, idEntrevista);
		if (StringUtils.isNotBlank(mensaje))
			return new ModelAndView(mensaje);
		else
			return new ModelAndView(
					"redirect://exportacionEntrevistas/verExportarEntrevistas.do?");
	}

	@RequestMapping("/entrevistas/modificarEntrevistasView.do")
	public ModelAndView irAEditarEntrevista(
			@RequestParam("entrevistaId") Long idEntrevista,
			@RequestParam("tipoEntrevistaId") Integer idTipoEntrevista,
			HttpServletRequest request) {

		return cargarDatosEntrevista(idEntrevista, idTipoEntrevista, "ea",
				"modificar", request, "");
	}

	@RequestMapping("/entrevistas/modificarEntrevistasRRView.do")
	public ModelAndView irAEditarEntrevistaRR(HttpServletRequest req,
			@RequestParam("entrevistaId") Long idEntrevista,
			@RequestParam("tipoEntrevistaId") Integer idTipoEntrevista,
			HttpServletRequest request) {
		req.getSession().setAttribute("retorno", "rr");
		return cargarDatosEntrevista(idEntrevista, idTipoEntrevista, "rr",
				"modificar", request, "");
	}

	@RequestMapping("/entrevistas/modificarEntrevistasSuperUsuarioView.do")
	public ModelAndView irAEditarEntrevistaSuperUsuario(
			HttpServletRequest req,
			@RequestParam("entrevistaId") Long idEntrevista,
			@RequestParam("tipoEntrevistaId") Integer idTipoEntrevista,
			@RequestParam(required = false, value = "valorPerfil") String valorPerfil,
			HttpServletRequest request) {
		req.getSession().setAttribute("retorno", "superUsuario");
		return cargarDatosEntrevista(idEntrevista, idTipoEntrevista,
				"superUsuario", "modificar", request, valorPerfil);
	}

	/**
	 * Carga los datos escuela/zona para el autocompletar de lugar entrevista
	 * 
	 * @param lugar
	 * @param model
	 */
	private void cargarLugarEncuentro(Escuela lugar, Map<String, Object> model) {
		String escuelaZona = "";
		if (lugar != null) {
			escuelaZona = lugar.getNombre();
			escuelaZona += (lugar.getLocalidad() != null
					&& lugar.getLocalidad().getZona() != null ? " / "
					+ lugar.getLocalidad().getZona().getNombre() : "");
		}
		model.put("escuelaZona", escuelaZona);
	}

	private ModelAndView cargarDatosEntrevista(Long idEntrevista,
			Integer idTipoEntrevista, String tipoPerfil, String tipoVIsta,
			HttpServletRequest request, String valorPerfil) {
		TipoEntrevista tipo = TipoEntrevista
				.getTipoEntrevista(idTipoEntrevista);
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("tipoPerfil", tipoPerfil);
		model.put("materiasBasicas", srvMateria.obtenerMateriasBasicas(true));
		model.put("fechaActual",
				Formateador.formatearFecha(new Date(), "dd/MM/yyyy"));
		EntrevistaIndividual entrevistaIndividual = (EntrevistaIndividual) srvEntrevistas
				.obtenerEntrevista(idEntrevista);
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(entrevistaIndividual
				.getPerfilAlumno().getId());
		CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		if (tipoPerfil == "ea") {
			model.put("idEA", getPerfilEA(request).getIdPerfilEA());
		} else {
			model.put("idEA", entrevistaIndividual.getEa().getIdPerfilEA());
		}

		Connection cn = null;
		CallableStatement cl = null;
		ResultSet rs = null;
		String call = null;
		long totMaterias = 0L;
		long sinNota = 0L;
		try {
			String query = "select b.id AS idBoletin from boletin_nuevo b where b.ciclo=2023 and b.idBecado="
					+ perfil.getId();
			cn = Conexion.getConexion();
			Statement st = cn.createStatement();
			rs = st.executeQuery(query);
			Long idBoletin = 0L;
			while (rs.next()) {
				idBoletin = rs.getLong("idBoletin");

			}

			if (idBoletin == 0) {
				model.put("boletin", "SinBoletin");
			} else {
				model.put("boletin", "ConBoletin");
			}
			st.close();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		}

		// marterias previas

		String materiasPendientes = "";
		try {
			String query = "select materia,anio_escolar from previas_nuevo p where ja<>'Aprobado' and di<>'Aprobado' and fb<>'Aprobado' and ma<>'Aprobado' and mam<>'Aprobado' and idbecado="
					+ perfil.getId();
			cn = Conexion.getConexion();
			Statement st = cn.createStatement();
			rs = st.executeQuery(query);

			while (rs.next()) {
				materiasPendientes = materiasPendientes
						+ rs.getString("materia") + " - "
						+ rs.getString("anio_escolar") + ", ";

			}
			entrevistaIndividual.setMp(materiasPendientes);

			st.close();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		}

		model.put("mp", materiasPendientes);

		String suspensiones = "0";
		try {
			String query = "select count(id) as suspensiones from entrevista e where e.fecha_carga>='2023-01-01' and e.evaluacion_cobro_beca=1 and e.perfil_alumno="
					+ perfil.getId();
			cn = Conexion.getConexion();
			Statement st = cn.createStatement();
			rs = st.executeQuery(query);

			while (rs.next()) {
				suspensiones = rs.getString("suspensiones");

			}
			entrevistaIndividual.setSus(suspensiones);

			st.close();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		}

		model.put("sus", suspensiones);

		// marterias previas

		materiasPendientes = "";
		try {
			String query = "select materia,anio_escolar from previas_nuevo p where ja<>'Aprobado' and di<>'Aprobado' and fb<>'Aprobado' and ma<>'Aprobado' and mam<>'Aprobado' and idbecado="
					+ perfil.getId();
			cn = Conexion.getConexion();
			Statement st = cn.createStatement();
			rs = st.executeQuery(query);

			while (rs.next()) {
				materiasPendientes = materiasPendientes
						+ rs.getString("materia") + " - "
						+ rs.getString("anio_escolar") + ", ";

			}
			entrevistaIndividual.setMp(materiasPendientes);

			st.close();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		}

		model.put("mp", materiasPendientes);

		// celular

		String celular = "";
		String mail = "";
		try {

			// recordar de cambiarle el período toma siempre julio
			String query = "select celular from entrevista e  where celular IS NOT null and e.perfil_alumno="
					+ perfil.getId() + " order by e.periodo_de_pago desc limit 1";
			cn = Conexion.getConexion();
			Statement st = cn.createStatement();
			rs = st.executeQuery(query);

			while (rs.next()) {
				celular = rs.getString("celular");
			}
			entrevistaIndividual.setCelular(celular);

			st.close();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		}

		// mail
		try {

			// traer siempre el mail de julio
			String query = "select dir_mail from entrevista e  where dir_mail IS NOT null and e.perfil_alumno="
					+ perfil.getId() + " order by e.periodo_de_pago desc limit 1";
			cn = Conexion.getConexion();
			Statement st = cn.createStatement();
			rs = st.executeQuery(query);

			while (rs.next()) {
				mail = rs.getString("dir_mail");
			}
			entrevistaIndividual.setDirMail(mail);

			st.close();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		}

		model.put("celular", celular);
		model.put("dirMail", mail);

		// descripcion escuela
		// String descripcionEscuela="";
		// try {
		//
		// String
		// query="select es.observaciones from escuela es, perfil_alumno p where p.escuela=es.id and p.id="+perfil.getId();
		// cn = Conexion.getConexion();
		// Statement st = cn.createStatement();
		// rs = st.executeQuery(query);

		// while (rs.next()) {
		// descripcionEscuela=rs.getString("es.observaciones");
		// }
		// entrevistaIndividual.setIge(descripcionEscuela);

		// st.close();
		// Conexion.cerrarCall(cl);
		// Conexion.cerrarConexion(cn);
		// } catch (SQLException e) {
		// TODO Auto-generated catch block
		// e.printStackTrace();
		// Conexion.cerrarCall(cl);
		// Conexion.cerrarConexion(cn);
		// }

		// model.put("ige", descripcionEscuela);

		// proposito año comienza
		String propositoAnioComienza = "";
		if(entrevistaIndividual.getPaa()==null){
		try {
			// para entrevista de julio
			String query="";
			if(!perfil.getEstadoAlumno().getValor().equals("Incorporado") ){
				 query="select e.proposito_anio_comienza from entrevista e where e.tipo='renovacion' and perfil_alumno="
						+perfil.getId()+ " order by e.periodo_de_pago desc limit 1";
			}else{
				query="select e.proposito from entrevista e where e.tipo='incorporacion' and perfil_alumno="
				+perfil.getId()+ " order by e.periodo_de_pago desc limit 1";
			}
				// para entrevista final toma la de julio
			//String query = "select e.paa from entrevista e where e.periodo_de_pago=385 and perfil_alumno="
			//		+ perfil.getId();

			cn = Conexion.getConexion();
			Statement st = cn.createStatement();
			rs = st.executeQuery(query);

			if(!perfil.getEstadoAlumno().getValor().equals("Incorporado")){
				while (rs.next()) {
					propositoAnioComienza = rs.getString("e.proposito_anio_comienza");
				}
			}else{
				while (rs.next()) {
					propositoAnioComienza = rs.getString("e.proposito");
				}
			}
			entrevistaIndividual.setPaa(propositoAnioComienza);

			st.close();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		}
		}
		/*
		String ige = "";
		try {

			// para entrevista de julio
			// String
			// query="select e.proposito_anio_comienza from entrevista e where e.tipo='renovacion' and perfil_alumno="
			// +perfil.getId()+ " order by e.periodo_de_pago desc limit 1";
			// para entrevista final toma la de julio
			String query = "select e.ige from entrevista e where e.periodo_de_pago=385 and perfil_alumno="
					+ perfil.getId();

			cn = Conexion.getConexion();
			Statement st = cn.createStatement();
			rs = st.executeQuery(query);

			while (rs.next()) {
				ige = rs.getString("e.ige");
			}
			entrevistaIndividual.setIge(ige);

			st.close();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		}

		model.put("ige", ige);
	*/

		if (StringUtils.isNotBlank(valorPerfil)) {
			List<EntrevistaIndividual> entrevistas = srvEntrevistas
					.obtenerTodasEntrevistasPorAlumno(perfil.getId(),
							"descendiente");
			EntrevistaIndividual ultimaEntrevista = (EntrevistaIndividual) entrevistas
					.get(0);
			if (ultimaEntrevista.getId().equals(entrevistaIndividual.getId())
					&& entrevistaIndividual.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA)
					&& entrevistaIndividual.getPeriodoDePago().getCiclo()
							.equals(cicloActual))
				model.put("ultimaEntrevista", true);
			else
				model.put("ultimaEntrevista", false);
		} else
			model.put("ultimaEntrevista", false);
		if (tipo.equals(TipoEntrevista.MENSUAL)) {

			cargarDatosEntrevista(entrevistaIndividual, model);
			cargarLugarEncuentro(entrevistaIndividual.getLugarEntrevista(),
					model);
			if (tipoVIsta.equals("modificar"))
				return forward(pathEntrevistaIndividual, model);
			else
				return forward(pathVerEntrevistaIndividual, model);

		} else {
			if (tipo.equals(TipoEntrevista.RENOVACION)) {
				EntrevistaRenovacion entrevistaR = (EntrevistaRenovacion) entrevistaIndividual;
				cargarDatosEntrevista(entrevistaR, model);
				if (perfil.getBoletin() != null) {
					cargarLugarEncuentro(entrevistaR.getLugarEntrevista(),
							model);
					boolean boletinFinalizado = boletinFinalizado(perfil
							.getBoletin());
					model.put("boletinFinalizado", boletinFinalizado);
				}
				model.put("entrevistaRenovacion", entrevistaR);
				List<EvaluacionRenovacionMergeada> evaluacionesRenovacion = new ArrayList<EvaluacionRenovacionMergeada>();
				// if(entrevistaR.getSituacionEscolar() != null){
				// if(entrevistaR.getSituacionEscolar().equals(SituacionEscolar.PENDIENTE)){
				if (entrevistaR.getSituacionEscolarMergeada() != null) {
					if (entrevistaR.getSituacionEscolarMergeada().equals(
							SituacionEscolarMergeada.PENDIENTE)) {
						evaluacionesRenovacion = EvaluacionRenovacionMergeada
								.getEvaluacionRenovacionPendiente();
					} else {
						evaluacionesRenovacion = EvaluacionRenovacionMergeada
								.getEvaluacionRenovacion();
					}
				} else {
					evaluacionesRenovacion = EvaluacionRenovacionMergeada
							.getEvaluacionRenovacion();
				}
				// if(entrevistaR.getMotivoPendiente() != null){
				// if(!entrevistaR.getMotivoPendiente().equals(MotivoPendiente.OTRO)){
				// String otroMotivo =
				// "Queremos informarle que la renovación de la beca de " +
				// perfil.getDatosPersonales().getNombre() +
				// " " + perfil.getDatosPersonales().getApellido()+ " de " +
				// perfil.getEscuela().getLocalidad().getNombre() +
				// " aún está pendiente debido a que...";
				// entrevistaR.setMotivoOtro(otroMotivo);
				// }
				// }
				// else{
				// String otroMotivo =
				// "Queremos informarle que la renovación de la beca de " +
				// perfil.getDatosPersonales().getNombre() +
				// " " + perfil.getDatosPersonales().getApellido()+ " de " +
				// perfil.getEscuela().getLocalidad().getNombre() +
				// " aún está pendiente debido a que...";
				// entrevistaR.setMotivoOtro(otroMotivo);
				// }
				model.put("evaluacionRenovacion", evaluacionesRenovacion);
				model.put("evaluacionCobroBeca",
						EvaluacionCobroBeca.getEvaluacionCobroBecaFinal2017());
				// model.put("situacionEscolar",
				// SituacionEscolarMergeada.getSituacionEscolar());
				model.put("situacionEscolar", SituacionEscolarMergeada
						.getSituacionEscolarRenovacion());
				model.put("motivoPendiente",
						MotivoPendiente.getMotivoPendiente());
				if (tipoVIsta.equals("modificar"))
					return forward(pathEntrevistaRenovacion, model);
				else
					return forward(pathVerEntrevistaRenovacion, model);
			} else {

				if (tipo.equals(TipoEntrevista.FEBRERO)) {
					EntrevistaFebrero entrevistaRI = (EntrevistaFebrero) entrevistaIndividual;
					cargarDatosEntrevista(entrevistaRI, model);
					cargarLugarEncuentro(entrevistaRI.getLugarEntrevista(),
							model);
					model.put("entrevistaIncorporacion", entrevistaRI);
					model.put("motivoNoIncorporacion",
							motivoNoIncorporacion.getmotivoNoIncorporacion());
					model.put("evaluacionIncorporacion",
							EvaluacionIncorporacion
									.getEvaluacionIncorporacion());
					model.put("evaluacionCobroBeca", EvaluacionCobroBeca
							.getEvaluacionCobroBecaIncorpRenov2017());
					model.put("motivoPendiente", MotivoIncorporacionPendiente
							.getMotivoIncorporacionPendiente());
					model.put("tipoContacto", TipoContacto.getTipoContacto());
					model.put("escuelasPorZona", registrarEscuelasBecasSrv
							.obtenerEscuelasPorZona(entrevistaRI
									.getEscuelaAlumno().getLocalidad()
									.getZona()));
					if (tipoVIsta.equals("modificar"))
						return forward(pathEntrevistaFebrero, model);
					else
						return forward(pathVerEntrevistaFebrero, model);
				} else

				if (tipo.equals(TipoEntrevista.INCORPORACION)) {
					EntrevistaReIncorporacion entrevistaRI = (EntrevistaReIncorporacion) entrevistaIndividual;
					cargarDatosEntrevista(entrevistaRI, model);
					cargarLugarEncuentro(entrevistaRI.getLugarEntrevista(),
							model);
					model.put("observacionesNoIncorporacion", entrevistaRI.getObservacionesNoIncorporacion());
					model.put("proposito", entrevistaRI.getProposito());
					model.put("entrevistaIncorporacion", entrevistaRI);
					model.put("motivoNoIncorporacion",
							motivoNoIncorporacion.getmotivoNoIncorporacion());
					model.put("evaluacionIncorporacion",
							EvaluacionIncorporacion
									.getEvaluacionIncorporacion());
					model.put("evaluacionCobroBeca", EvaluacionCobroBeca
							.getEvaluacionCobroBecaIncorpRenov2017());
					model.put("motivoPendiente", MotivoIncorporacionPendiente
							.getMotivoIncorporacionPendiente());
					model.put("tipoContacto", TipoContacto.getTipoContacto());
					model.put("observacionesNoIncorporacion",
							entrevistaRI.getObservacionesNoIncorporacion());
					model.put("escuelasPorZona", registrarEscuelasBecasSrv
							.obtenerEscuelasPorZona(entrevistaRI
									.getEscuelaAlumno().getLocalidad()
									.getZona()));
					if (tipoVIsta.equals("modificar"))
						return forward(pathEntrevistaIncorporacion, model);
					else
						return forward(pathVerEntrevistaIncorporacion, model);
				} else {
					// la entrevista es final
					EntrevistaFinal entrevistaFinal = (EntrevistaFinal) entrevistaIndividual;
					cargarDatosEntrevista(entrevistaFinal, model);

					model.put("dirMail", entrevistaFinal.getDirMail());
					model.put("alo", entrevistaFinal.getAlo());
					model.put("paev", entrevistaFinal.getPaev());
					model.put("facebook", entrevistaFinal.getFacebook());
					model.put("telFijo", entrevistaFinal.getTelFijo());
					model.put("celular", entrevistaFinal.getCelular());
					cargarLugarEncuentro(entrevistaFinal.getLugarEntrevista(),
							model);
					model.put("motivoNoRenovacion",
							MotivoNoRenovacion.getmotivoNoRenovacionFinal());
					model.put("evaluacionCobroBeca", EvaluacionCobroBeca
							.getEvaluacionCobroBecaFinal2017());
					model.put("escuelasPorZona", registrarEscuelasBecasSrv
							.obtenerEscuelasPorZona(entrevistaFinal
									.getEscuelaAlumno().getLocalidad()
									.getZona()));
					model.put("sextoAnio", false);
					List<ResultadoAnioEscolar> anios = new ArrayList<ResultadoAnioEscolar>();
					List<EvaluacionRenovacionFinal> evaluacion = new ArrayList<EvaluacionRenovacionFinal>();

					if (tipoVIsta.equals("ver")) {
						model.put("evaluacionRenovacionFinal",
								EvaluacionRenovacionFinal
										.getEvaluacionRenovacionFinal());
						model.put("resultadoAnioEscolar",
								ResultadoAnioEscolar.getResultadoAnioEscolar());
						return forward(pathVerEntrevistaFinal, model);
					} else {
						// //System.out.println(perfil.getAnioAdicional());
						// //System.out.println(perfil.getAnioEscolar().getId());
						// //System.out.println(perfil.getEae());
						if (perfil.getEae().equals("7/5")) {
							if (perfil.getAnioEscolar().getId() == 13) {
								if (perfil.getAnioAdicional() == true) {
									// NO ES ULTIMO AÑO
									anios.add(ResultadoAnioEscolar.PROMOVIDO_CON_PREVIAS); // PROMOVIDO_CON_PREVIAS(5,"Promovido con materias a rendir")
									anios.add(ResultadoAnioEscolar.PROMOVIDO); // PROMOVIDO(1,"Promovido sin adeudar materias")
									anios.add(ResultadoAnioEscolar.PENDIENTE); // PENDIENTE(2,"Promoción Pendiente")
									anios.add(ResultadoAnioEscolar.REPITIO); // REPITIO(3,"Repitio")

									evaluacion
											.add(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR);
									evaluacion
											.add(EvaluacionRenovacionFinal.NO_RENUEVA);
									evaluacion
											.add(EvaluacionRenovacionFinal.PENDIENTE);
									model.put("ultimoAnio", false);
								} else {
									// ES ULTIMO AÑO
									anios.add(ResultadoAnioEscolar.EGRESO); // EGRESO(4,"Egreso efectivo"),
									anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE); // EGRESO_PENDIENTE(6,"Egreso pendiente");

									evaluacion
											.add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);
									model.put("ultimoAnio", true);
								}

							} else {
								if (perfil.getAnioEscolar().getId() == 14) {
									// ES ULTIMO AÑO
									anios.add(ResultadoAnioEscolar.EGRESO); // EGRESO(4,"Egreso efectivo"),
									anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE); // EGRESO_PENDIENTE(6,"Egreso pendiente");

									evaluacion
											.add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);
									model.put("ultimoAnio", true);
								} else {
									// NO ES ÚLTIMO AÑO
									anios.add(ResultadoAnioEscolar.PROMOVIDO_CON_PREVIAS); // PROMOVIDO_CON_PREVIAS(5,"Promovido con materias a rendir")
									anios.add(ResultadoAnioEscolar.PROMOVIDO); // PROMOVIDO(1,"Promovido sin adeudar materias")
									anios.add(ResultadoAnioEscolar.PENDIENTE); // PENDIENTE(2,"Promoción Pendiente")
									anios.add(ResultadoAnioEscolar.REPITIO); // REPITIO(3,"Repitio")

									evaluacion
											.add(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR);
									evaluacion
											.add(EvaluacionRenovacionFinal.NO_RENUEVA);
									evaluacion
											.add(EvaluacionRenovacionFinal.PENDIENTE);
									model.put("ultimoAnio", false);
								}
							}
						} else {
							if (permiteElegirEgreso(perfil)) {
								// ES ÚLTIMO AÑO
								anios.add(ResultadoAnioEscolar.EGRESO); // EGRESO(4,"Egreso efectivo"),
								anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE); // EGRESO_PENDIENTE(6,"Egreso pendiente");

								evaluacion
										.add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);
								model.put("ultimoAnio", true);
							} else {
								// NO ES ÚLTIMO AÑO
								anios.add(ResultadoAnioEscolar.PROMOVIDO_CON_PREVIAS); // PROMOVIDO_CON_PREVIAS(5,"Promovido con materias a rendir")
								anios.add(ResultadoAnioEscolar.PROMOVIDO); // PROMOVIDO(1,"Promovido sin adeudar materias")
								anios.add(ResultadoAnioEscolar.PENDIENTE); // PENDIENTE(2,"Promoción Pendiente")
								anios.add(ResultadoAnioEscolar.REPITIO); // REPITIO(3,"Repitio")

								evaluacion
										.add(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR);
								evaluacion
										.add(EvaluacionRenovacionFinal.NO_RENUEVA);
								evaluacion
										.add(EvaluacionRenovacionFinal.PENDIENTE);
								model.put("ultimoAnio", false);
							}
						}

						/*
						 * if(permiteElegirEgreso(perfil)){
						 * anios.add(ResultadoAnioEscolar.EGRESO);
						 * anios.add(ResultadoAnioEscolar.PENDIENTE);
						 * evaluacion.
						 * add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);
						 * model.put("ultimoAnio", true); } else{
						 * anios.add(ResultadoAnioEscolar.PENDIENTE);
						 * anios.add(ResultadoAnioEscolar.PROMOVIDO);
						 * anios.add(ResultadoAnioEscolar
						 * .PROMOVIDO_CON_PREVIAS);
						 * anios.add(ResultadoAnioEscolar.REPITIO);
						 * evaluacion.add
						 * (EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR
						 * );
						 * evaluacion.add(EvaluacionRenovacionFinal.NO_RENUEVA);
						 * evaluacion.add(EvaluacionRenovacionFinal.PENDIENTE);
						 * model.put("ultimoAnio", false); }
						 */
						model.put("evaluacionRenovacionFinal", evaluacion);
						model.put("resultadoAnioEscolar", anios);
					}

					if (tipoVIsta.equals("modificar"))
						return forward(pathEntrevistaFinal, model);
					else
						return forward(pathVerEntrevistaFinal, model);
				}
			}
		}
	}

	private ModelAndView crearFPII(Long idEntrevista, Integer idTipoEntrevista,
			String tipoPerfil, String tipoVIsta, HttpServletRequest request,
			String valorPerfil) {
		TipoEntrevista tipo = TipoEntrevista
				.getTipoEntrevista(idTipoEntrevista);
		Map<String, Object> model = new HashMap<String, Object>();
		Connection cn = null;
		CallableStatement cl = null;
		ResultSet rs = null;
		String call = null;
		try {
			// traigo datos de la entrevista incorporacion
			call = "{CALL SP_BuscarDatosAlumno(?)}";
			cn = Conexion.getConexion();
			cl = cn.prepareCall(call);
			cl.setLong(1, idEntrevista);
			rs = cl.executeQuery();
			long pi = 0;
			long pa = 0;
			long ea = 0;
			java.sql.Date fab = null;
			long bid = 0;
			long dp = 0;
			long ra = 0;
			long edad = 0;
			long ciclo = 0;
			long padrino = 0;
			String mi = "";
			long rr = 0;
			long as = 0; // as= id alumno_seleccion
			long es = 0; // es= id entrevista_seleccion
			long bolSN = 0;
			while (rs.next()) {
				pi = rs.getLong(1);
				pa = rs.getLong(2);
				ea = rs.getLong(3);
				fab = rs.getDate(22);
				bid = rs.getLong(5);
				dp = rs.getLong(6);
				ra = rs.getLong(7);
				edad = rs.getLong(8);
				ciclo = rs.getLong(9);
				padrino = rs.getLong(10);
				rr = rs.getLong(18);
				as = rs.getLong(19);
				es = rs.getLong(20);
				// //System.out.println(fab);
				if (rs.getLong(21) > 0) {
					bolSN = 1;
				} else {
					bolSN = 0;
				}
				if (rs.getString(11) != null) {
					mi = mi + "Ciencias Sociales - ";
				}
				if (rs.getString(12) != null) {
					mi = mi + "Ciencias Naturales - ";
				}
				if (rs.getString(13) != null) {
					mi = mi + "Educación Artística - ";
				}
				if (rs.getString(14) != null) {
					mi = mi + "Educación Física - ";
				}
				if (rs.getString(15) != null) {
					mi = mi + "Inglés Lengua Extranjera - ";
				}
				if (rs.getString(16) != null) {
					mi = mi + "Lengua - ";
				}
				if (rs.getString(17) != null) {
					mi = mi + "Matemática";
				}
			}
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
			// busco id informe
			long cantidadFP = 0;
			call = "{CALL SP_BuscarFP(?,?,?,?)}";
			cn = Conexion.getConexion();
			cl = cn.prepareCall(call);
			cl.setLong(1, bid);
			cl.setLong(2, pa);
			cl.setLong(3, ciclo);
			cl.setLong(4, padrino);
			rs = cl.executeQuery();
			while (rs.next()) {
				cantidadFP++;
			}
			// cierro conexion
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
			if (cantidadFP == 0) {
				// alta informe
				call = "{CALL SP_AltaInforme(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
				cn = Conexion.getConexion();
				cl = cn.prepareCall(call);
				cl.setLong(1, pi); // numero de fp
				cl.setDate(2, fab);
				cl.setDate(3, fab);
				cl.setLong(4, edad);
				cl.setLong(5, bid);
				cl.setLong(6, pa);
				cl.setLong(7, ciclo);
				cl.setLong(8, ea);
				cl.setLong(9, padrino);
				cl.setLong(10, ra);
				cl.setLong(11, bolSN);
				cl.setLong(12, 0);
				cl.setString(13, mi);
				cl.setLong(14, rr);
				cl.setString(15, "Ficha de Presentación");
				// La sentencia lo almacenamos en un resulset
				rs = cl.executeQuery();
				// cierro conexion
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
				// busco las fichas familiar
				ArrayList<Long> ff = new ArrayList();
				call = "{CALL SP_BuscarFichasFamiliar(?)}";
				cn = Conexion.getConexion();
				cl = cn.prepareCall(call);
				cl.setLong(1, as);
				rs = cl.executeQuery();
				while (rs.next()) {
					ff.add(rs.getLong(2));
				}
				// cierro conexion
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
				// //System.out.println(ff.size());
				long nff = 0;
				for (int i = 0; i < ff.size(); i++) {
					// //System.out.println(ff.get(i));
					nff = ff.get(i);
					call = "{CALL SP_AgregarFPaFichaFamiliar(?,?)}";
					cn = Conexion.getConexion();
					cl = cn.prepareCall(call);
					cl.setLong(1, nff); // numero de fp
					cl.setLong(2, pi);
					rs = cl.executeQuery();
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
				}
				// busco id informe
				long nfp = 0;
				call = "{CALL SP_BuscarFP(?,?,?,?)}";
				cn = Conexion.getConexion();
				cl = cn.prepareCall(call);
				cl.setLong(1, bid);
				cl.setLong(2, pa);
				cl.setLong(3, ciclo);
				cl.setLong(4, padrino);
				rs = cl.executeQuery();
				while (rs.next()) {
					nfp = (rs.getLong(1));
				}
				// cierro conexion
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
				// Agrego boletin para el informe
				ArrayList<Long> bi = new ArrayList();
				call = "{CALL SP_BuscarBoletinEntrevistaSelleccion(?)}";
				cn = Conexion.getConexion();
				cl = cn.prepareCall(call);
				cl.setLong(1, es);
				rs = cl.executeQuery();
				while (rs.next()) {
					bi.add(rs.getLong(2));
				}
				// cierro conexion
				Conexion.cerrarCall(cl);
				Conexion.cerrarConexion(cn);
				// //System.out.println(ff.size());
				long nbs = 0;
				for (int i = 0; i < bi.size(); i++) {
					// //System.out.println(bi.get(i));
					nbs = bi.get(i);
					call = "{CALL SP_AltaInformeBoletinSeleccion(?,?)}";
					cn = Conexion.getConexion();
					cl = cn.prepareCall(call);
					cl.setLong(1, nfp); // numero de fp
					cl.setLong(2, nbs);
					rs = cl.executeQuery();
					// cierro conexion
					Conexion.cerrarCall(cl);
					Conexion.cerrarConexion(cn);
				}
			} else {
				return forward(errorPathCrearFP, model);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		} catch (Exception e) {
			e.printStackTrace();
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
		}
		return forward(pathCrearFP, model);
	}

	@RequestMapping("/entrevistas/verEntrevistasView.do")
	public ModelAndView irAVerEntrevista(
			HttpSession session,
			@RequestParam("entrevistaId") Long idEntrevista,
			@RequestParam("tipoEntrevistaId") Integer idTipoEntrevista,
			@RequestParam(required = false, value = "retorno") String retorno,
			@RequestParam(required = false, value = "valorPerfil") String valorPerfil,
			HttpServletRequest request) {
		if (retorno != null && retorno.equals("rr"))
			session.setAttribute("retorno", "rr");
		else if (retorno != null && retorno.equals("exportarEntrevistas"))
			session.setAttribute("retorno", "exportarEntrevista");
		else
			session.setAttribute("retorno", "ea");
		return cargarDatosEntrevista(idEntrevista, idTipoEntrevista, "rr",
				"ver", request, valorPerfil);
	}

	@RequestMapping("/entrevistas/crearFP.do")
	public ModelAndView crearFP(
			HttpSession session,
			@RequestParam("entrevistaId") Long idEntrevista,
			@RequestParam("tipoEntrevistaId") Integer idTipoEntrevista,
			@RequestParam(required = false, value = "retorno") String retorno,
			@RequestParam(required = false, value = "valorPerfil") String valorPerfil,
			HttpServletRequest request) {
		// if(retorno != null && retorno.equals("rr"))
		// session.setAttribute("retorno", "rr");
		// else if(retorno != null && retorno.equals("exportarEntrevistas"))
		// session.setAttribute("retorno", "exportarEntrevista");
		// else
		// session.setAttribute("retorno", "ea");
		return crearFPII(idEntrevista, idTipoEntrevista, "rr", "ver", request,
				valorPerfil);
	}

	@RequestMapping("/entrevistas/verEntrevistaCesadaView.do")
	public ModelAndView irAVerEntrevistaCesada(
			@RequestParam("idPerfilAlumno") Long idPerfilAlumno,
			@RequestParam("estado") EstadoAlumno estado) {

		Map<String, Object> model = new HashMap<String, Object>();
		EntrevistaIndividual entrevista;
		if (estado.equals(EstadoAlumno.CESADO)) {
			entrevista = srvEntrevistas.obtenerEntrevistasCesacion(
					idPerfilAlumno, srvCiclo.obtenerCicloActual());
			model = cargarDatosEntrevista(entrevista, model);
			return forward("/entrevistas/verEntrevistaIndividual", model);
		} else if (estado.equals(EstadoAlumno.NO_INCORPORADO)) {
			entrevista = srvEntrevistas.obtenerEntrevistasIncorporacion(
					idPerfilAlumno, srvCiclo.obtenerCicloActual());
			model = cargarDatosEntrevista(entrevista, model);
			return forward("/entrevistas/verEntrevistaIncorporacion", model);
		} else {
			entrevista = srvEntrevistas.obtenerEntrevistasRenovacion(
					idPerfilAlumno, srvCiclo.obtenerCicloActual());
			model = cargarDatosEntrevista(entrevista, model);
			if (entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL))
				return forward("/entrevistas/verEntrevistaFinal", model);
			else
				return forward("/entrevistas/verEntrevistaRenovacion", model);
		}

	}

	private Map<String, Object> cargarDatosEntrevista(
			EntrevistaIndividual entrevistaIndividual, Map<String, Object> model) {

		model.put("entrevista", entrevistaIndividual);
		model.put("entrevistas",
				EntrevistaReprogramada.getEntrevistasReprogramadas());
		model.put("tipoEntrevista", TipoEntrevista.getTipoEntrevistas());
		model.put("lugarEntrevistas",
				registrarEscuelasBecasSrv.obtenerTodasEscuelas());
		model.put("motivosAusencias", MotivoAusencia.getMotivoAusencias());
		model.put("opciones", Opciones.getOpciones());
		model.put("detalleGastos", DetalleGastos.getDetalleGastos());
		model.put("compromisosRA", Compromiso.getCompromiso());
		model.put("estrategiasComp",
				EstrategiaComplementaria.getEstrategiasComplementarias());
		model.put("contenidosAbordados",
				ContenidosAbordados.getContenidosAbordadosEntrevistaMensual());
		model.put("contenidosTrabajarEnElAnio",
				ContenidosTrabajarEnElAnio.getContenidosTrabajarEnElAnio());
		model.put("situacionCrisis", SituacionCrisis.getSituacionCrisis());
		model.put("situacionRiesgoEscolar",
				SituacionRiesgoEscolar.getSituacionRiesgoEscolar());
		model.put("motivoSuspension", MotivoSuspension.getMotivoSuspension());
		model.put("motivoCesacion", MotivoCesacion.getMotivoCesacion());
		model.put("evaluacionCobroBeca",
				EvaluacionCobroBeca.getEvaluacionCobroBeca());
		model.put("estadoEntrevista", EstadoEntrevista.getEstadoEntrevista());
		model.put("anioEscolar", AnioEscolar.getAnioEscolares());
		model.put("propositoAnioComienzaList",
				PropositoAnioComienza.getPropositoAnioComienza());
		model.put("gustosTiempoLibre", GustosTiempoLibre.getGustosTiempoLibre());
		model.put("osme", entrevistaIndividual.getOsme());
		model.put("propositoAnual", entrevistaIndividual.getPropositoAnual());
		model.put("evaluacionProposito", entrevistaIndividual.getTelFijo());
		model.put("qtam", entrevistaIndividual.getQtam());
		model.put("hsTrabajarAño", entrevistaIndividual.getHsTrabajarAño());

		model.put("alumno", entrevistaIndividual.getPerfilAlumno());
		return model;
	}

	@RequestMapping("/entrevistas/listaEntrevistasView.do")
	public ModelAndView listarEntrevistas(
			@RequestParam("idAlumno") Long idAlumno) {
		HashMap<String, Object> model = new HashMap<String, Object>();

		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		List<Long> periodosIds;
		// Si el alumno no tiene beca es porque ya se le realizo la entrevista
		// final y se le saco la beca, pero aun debe estar en el panel
		// hasta el cierre de ciclo
		if (perfil.getBeca() != null)
			periodosIds = PeriodoHelper.obtenerListaIdsPeriodos(perfil
					.getBeca().getCiclo().getPeriodos());
		else
			periodosIds = PeriodoHelper.obtenerListaIdsPeriodos(srvCiclo
					.obtenerCicloActual().getPeriodos());
		
		
		model.put("entrevistas", srvEntrevistas
				.obtenerEntrevistasIndividualesPorId(idAlumno, periodosIds));
		model.put("alumno", perfil);

		model.put("tipoEntrevista", verTipoEntrevista(perfil, periodosIds));

		return forward("/entrevistas/listaEntrevistas", model);
	}

	private String verTipoEntrevista(PerfilAlumno perfil, List<Long> periodosIds) {
		EntrevistaIndividual entrevista = srvEntrevistas
				.obtenerUltimaEntrevista(perfil, periodosIds);
		if ((entrevista != null && !entrevista.getEstadoEntrevista().equals(
				EstadoEntrevista.FINALIZADA))
				|| (entrevista != null && entrevista.esFinal())) {
			if (entrevista.getPeriodoDePago().getId() == 2) {
				if (puedeGenerarERenovacion(perfil))
					return "renovacion";
				else
					return "nada";
			} else
				return "nada";
		} else {
			if (puedeGenerarEIncorporacion(perfil))
				return "incorporacion";
			else if (puedeGenerarERenovacion(perfil))
				if (perfil.getEstadoAlumno().getValor().equals("Cesado")
						|| perfil.getBeca() == null)
					return "nada";
				else
					return "renovacion";
			else if (puedeGenerarEFinal(perfil, periodosIds))
				return "final";
			else {
				if (entrevista != null
						&& !entrevista.getPeriodoDePago().equals(
								PeriodoHelper.getPeriodoActual(perfil.getBeca()
										.getCiclo().getPeriodos(), new Date())))
					return "mensual";
				// cambio en final 2021 por entrevista de febrero 2021 para los
				// incorporados

				// return "final";
				else
					return "nada";
			}
		}
	}

	@RequestMapping("/entrevistas/listaPagosView.do")
	public ModelAndView listaPagosBecado(@RequestParam("idAlumno") Long idAlumno) {
		HashMap<String, Object> model = new HashMap<String, Object>();
		List<Pago> listaPagos = srvPago.obtenerPagosPorAlumno(idAlumno,
				PeriodoHelper.obtenerListaIdsPeriodos(srvCiclo
						.obtenerCicloActual().getPeriodos()));
		AlumnoPanelEA alumnoPanel = alumnoPanelEaSrv
				.obtenerAlumnoPanelPorIdPerfilAlumno(idAlumno);
		alumnoPanel.setCantidadPagos(listaPagos.size());
		model.put("listaPagoBecados", listaPagos);

		return forward("/pago/detallePagoBecado", model);
	}

	@RequestMapping("/entrevistas/cambiarEstadoPago.do")
	public ModelAndView cambiarEstadoPago(@RequestParam("idPago") Long idPago) {
		Pago p = srvPago.obtenerPorId(idPago);
		p.setEstadoPago(EstadoPago.CORREGIDO);
		srvPago.agregarPago(p);
		return listaPagosBecado(p.getBecado().getId());
	}

	@RequestMapping("/entrevistas/listaDetalleRA.do")
	public ModelAndView listaDetalleRA(HttpServletRequest request,
			@RequestParam("idAlumno") Long idAlumno) {
		request.getSession().setAttribute("retorno", "ea");
		ResponsableAdulto ra = srvAlumno.obtenerAlumno(idAlumno)
				.getResponsable1();
		HashMap<String, Object> model = new HashMap<String, Object>();
		// Se utiliza una lista porque la jsp se usa para UN ra o PARA TODOS los
		// ra
		List<ResponsableAdulto> responsables = new ArrayList<ResponsableAdulto>();
		responsables.add(ra);
		model.put("responsables", responsables);
		return forward("/responsable/listaDetalleRA", model);
	}

	/**
	 * Cambia el estado de la cuenta de RA del alumno y actualiza el
	 * alumnoPanelEa
	 * 
	 * @param request
	 * @param idRA
	 * @param motivo
	 * @return
	 */
	@RequestMapping("/entrevistas/cambiarEstadoCuentaRA.do")
	public ModelAndView cambiarEstadoCuentaRA(HttpServletRequest request,
			@RequestParam("idRA") Long idRA,
			@RequestParam("motivoFallidoCuenta") String motivo) {
		HashMap<String, Object> model = new HashMap<String, Object>();
		ResponsableAdulto ra = srvRA.obtenerPorId(idRA);
		ra.setEstadoCuenta(EstadoCuenta.CORREGIDA);
		ra.setMotivoFallidoCuenta(motivo);

		// actualizacion del panelEA
		AlumnoPanelEA panelEa = alumnoPanelEaSrv
				.obtenerAlumnoPanelPorIdPerfilAlumno(ra.getIdAlumno().getId());
		panelEa.actualizarCuenta(ra.getEstadoCuenta());
		alumnoPanelEaSrv.modificarAlumnoPanelEA(panelEa);

		// Se utiliza una lista porque la jsp se usa para UN ra o PARA TODOS los
		// ra
		List<ResponsableAdulto> responsables = new ArrayList<ResponsableAdulto>();
		if (request.getSession().getAttribute("retorno").equals("ea")) {
			responsables.add(ra);
			model.put("responsables", responsables);
			return forward("/responsable/listaDetalleRA", model);
		} else {
			return listaCuentasPorEa(request, ra.getIdAlumno().getEa()
					.getIdPerfilEA());
		}
	}

	@RequestMapping("/entrevistas/listarBecados.do")
	public ModelAndView listarBecados(HttpServletRequest req,
			@RequestParam(required = false, value = "mensaje") String mensaje,
			@RequestParam(required = false, value = "error") String error) {
		HashMap<String, Object> model = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		List<AlumnoPanelEA> alumnos = new ArrayList<AlumnoPanelEA>();
		PerfilEA perfilEA = getPerfilEA(req);

		if (perfilEA != null) {
			alumnos = alumnoPanelEaSrv.actualizarPagosEntrevistas(perfilEA
					.getIdPerfilEA());
		}

		model.put("alumnos", alumnos);
		session.setAttribute("menu", ConstantesMenu.menuAcompanamiento);
		if (StringUtils.isNotBlank(mensaje))
			model.put("mensaje", mensaje);
		if (StringUtils.isNotBlank(error))
			model.put("error", error);
		return forward("/entrevistas/listaBecados", model);
	}

	@RequestMapping("/entrevistas/listarEas.do")
	public ModelAndView listarEAs(HttpSession session, HttpServletRequest req) {
		HashMap<String, Object> model = new HashMap<String, Object>();
		PerfilRR perfilRR = getPerfilRR(req);
		List<EaDto> easDtos = new ArrayList<EaDto>();
		if (perfilRR != null) {
			if (!Hibernate.isInitialized(perfilRR.getEas())) {
				perfilRRSrv.initEas(perfilRR);
			}
			List<PerfilEA> eas = perfilRR.obtenerEASDisponibles();
			EaDto ea;
			for (PerfilEA perfilEA : eas) {
				ea = srvAlumno.obtenerDatosAlumnosPorEA(perfilEA,
						srvCiclo.obtenerCicloActual());
				easDtos.add(ea);
			}
		}
		model.put("eas", easDtos);
		req.getSession().setAttribute("retorno", "rr");
		session.setAttribute("menu", ConstantesMenu.menuAcompanamiento);
		return forward("/entrevistas/panelRR", model);
	}

	@RequestMapping("/entrevistas/listarTodosEas.do")
	public ModelAndView listarTodosEAs(HttpSession session,
			HttpServletRequest req) {
		HashMap<String, Object> model = new HashMap<String, Object>();

		List<EaDto> easDtos = new ArrayList<EaDto>();

		List<PerfilEA> eas = srvPerfilEa.obtenerEasConBecadosAsignadosYRR();
		EaDto ea;
		for (PerfilEA perfilEA : eas) {
			ea = srvAlumno.obtenerDatosAlumnosPorEA(perfilEA,
					srvCiclo.obtenerCicloActual());
			easDtos.add(ea);
		}

		model.put("eas", easDtos);
		req.getSession().setAttribute("retorno", "cpbe");
		session.setAttribute("menu", ConstantesMenu.menuAcompanamiento);
		return forward("/entrevistas/panelCPBE", model);
	}

	@RequestMapping("/entrevistas/registrarEntrevistaGrupalView.do")
	public ModelAndView irAEntrevistaGrupal(
			HttpServletRequest req,
			@RequestParam(required = false, value = "alumnosSeleccionados") String alumnosSeleccionados)
			throws CimientosExceptionHandler {
		Map<String, Object> model = new HashMap<String, Object>();

		List<Long> alumonosIds = Formateador
				.toListOfLongs(alumnosSeleccionados);
		List<AlumnoPanelEA> alumnos = new ArrayList<AlumnoPanelEA>();
		PerfilEA perfilEA = getPerfilEA(req);
		model.put("idEA", perfilEA.getIdPerfilEA());
		List<PerfilAlumno> alumnosEA = srvAlumno
				.obtenerAlumnosPorIds(alumonosIds);
		Periodo periodo = calcularProximoPeriodo(alumnosEA.get(0));
		model.put("contenidosTrabajarEnElAnio",
				ContenidosTrabajarEnElAnio.getContenidosTrabajarEnElAnio());
		if (perfilEA != null) {
			alumnos = alumnoPanelEaSrv.obtenerAlumnosPorIds(alumonosIds);
		}

		if (habilitarGrupal(alumnos, model)) {
			model.put("alumnos", alumnosEA);
			model.put("alumnosSeleccionados", alumnosSeleccionados);
			model.put("escuelas",
					registrarEscuelasBecasSrv.obtenerTodasEscuelas());
			model.put("contenidosTrabajarEnElAnio",
					ContenidosTrabajarEnElAnio.getContenidosTrabajarEnElAnio());
			model.put("periodo", periodo);

			return forward("/entrevistas/altaGrupal", model);
		} else {
			if (perfilEA != null) {
				alumnos = alumnoPanelEaSrv.actualizarPagosEntrevistas(perfilEA
						.getIdPerfilEA());
			}
			model.put("alumnos", alumnos);
			return forward("/entrevistas/listaBecados", model);
		}
	}

	/**
	 * Realiza todos los chequeos para saber si con los alumnos seleccionados se
	 * puede crear una entrevista grupal. Las condiciones para habilitar una
	 * entrevista son: -la entrevista tiene que ser mensual -que todos los
	 * alumnos tengan que generar la entrevista y que toda las entrevistas sean
	 * para el mismo periodo -ningun alumno tiene que tener entrevistas sin
	 * finalizar
	 * 
	 * @param alumnos
	 * @param model
	 * @return
	 */
	private boolean habilitarGrupal(List<AlumnoPanelEA> alumnos,
			Map<String, Object> model) {
		int cantEntrevistas = alumnos.get(0).getEntrevistas()
				- alumnos.get(0).getEntrevistasRealizadas();
		for (AlumnoPanelEA a : alumnos) {
			if (a.getEntrevistasRealizadas() < 1) {
				model.put(
						"mensaje",
						"No se puede generar la entrevista grupal, "
								+ "alguno de los alumnos seleccionados no realizo la entrevista de Incorporacion o Renovacion");
				return false;
			}
			if (alumnos.get(0).getEntrevistasRealizadas() == alumnos.get(0)
					.getEntrevistas()) {
				model.put(
						"mensaje",
						"No se puede generar la entrevista grupal, "
								+ "alguno de los alumnos seleccionados tiene todas las entrevistas generadas");
				return false;
			}

			if (!a.isEntrevistasFinalizadas()) {
				model.put("mensaje",
						"No se puede generar la entrevista grupal, "
								+ "el alumno " + a.getNombreApellido()
								+ " no tiene todas las entrevistas finalizadas");
				return false;
			}
			if ((a.getEntrevistas() - a.getEntrevistasRealizadas()) != cantEntrevistas) {
				model.put(
						"mensaje",
						"No se puede generar la entrevista grupal, "
								+ "debe seleccionar alumnos en el mismo periodo");
				return false;
			}
			if (a.getEntrevistasRealizadas() == (a.getTotalEntrevistasCiclo() - 1)) {
				model.put("mensaje",
						"No se puede generar la entrevista grupal, "
								+ "el alumno " + a.getNombreApellido()
								+ " tiene que generar la entrevista Final");
				return false;
			}
			if (a.isRenovacionPendiente()) {
				model.put(
						"mensaje",
						"No se puede generar la entrevista grupal, "
								+ "el alumno "
								+ a.getNombreApellido()
								+ " tiene \"Pendiente\" la renovacion de la Beca");
				return false;
			}
		}
		return true;
	}

	@RequestMapping("/entrevistas/aprobarEntrevistasRR.do")
	public ModelAndView aprobarEntrevistasRR(
			HttpServletRequest req,
			@RequestParam(required = false, value = "entrevistasSeleccionadas") String entrevistasSeleccionadas,
			@RequestParam(required = false, value = "extra") String extras) {
		List<Long> entrevistasIds = Formateador
				.toListOfLongs(entrevistasSeleccionadas);
		List<Double> valores = Formateador.toListOfDouble(extras);
		Map<Long, Double> valoresExtra = new HashMap<Long, Double>();
		for (int i = 0; i < entrevistasIds.size(); i++) {
			valoresExtra.put(entrevistasIds.get(i), valores.get(i));
		}

		List<EntrevistaIndividual> entrevistas = srvEntrevistas
				.obtenerEntrevistasPorIds(entrevistasIds);
		PerfilAlumno perfil;
		AlumnoPanelEA alumnoPanel;
		boolean hayDudoso = false;
		for (int i = 0; i < entrevistas.size(); i++) {
			perfil = entrevistas.get(i).getPerfilAlumno();
			if (!perfil.getHistorialEntrevistas().contains(entrevistas)
					&& !entrevistas.get(i).getEstadoEntrevista()
							.equals(EstadoEntrevista.FINALIZADA)) {
				agregarExportacionEspecial(entrevistas.get(i));
				alumnoPanel = alumnoPanelEaSrv
						.obtenerAlumnoPanelPorIdPerfilAlumno(perfil.getId());
				PerfilPadrino padrino = perfil.getBeca().getPadrino();
				Beca beca = perfil.getBeca();
				if (entrevistas.get(i).getEvaluacionCobroBeca() == null)
					// se asigna estado NULO porque viene en null, es solo para
					// que no quede en null....
					entrevistas.get(i).setEvaluacionCobroBeca(
							EvaluacionCobroBeca.NULO);

				if (entrevistas.get(i).getEvaluacionCobroBeca().getValor() != "Dudoso") {
					entrevistas.get(i).setEstadoEntrevista(
							EstadoEntrevista.FINALIZADA);
					alumnoPanel.setEntrevistasFinalizadas(true);
					// estado de la entrevista Finalizada
					alumnoPanelEaSrv.modificarAlumnoPanelEA(alumnoPanel);

					Long idEntrevista = entrevistas.get(i).getId();
					entrevistas.get(i).setPagaEntrevista(true);
					registrarPagoEntrevista(entrevistas.get(i), perfil,
							entrevistas.get(i).getPeriodoDePago(),
							valoresExtra.get(idEntrevista));
					chequearEstadoBecado(entrevistas.get(i), perfil);
					if (!perfil.getHistorialEntrevistas().contains(
							entrevistas.get(i)))
						perfil.getHistorialEntrevistas()
								.add(entrevistas.get(i));
					srvEntrevistas.guardarEntrevista(entrevistas.get(i));
					this.generarInformesAutomaticos(padrino, beca,
							entrevistas.get(i), perfil);

					// envio de mail si es cesado
					if (entrevistas.get(i).getEvaluacionCobroBeca().getValor() == "Cesado") {

						String firma = Globales.tenant;
						// vacia firma
						firma = "";
						if (padrino.getDatosPersonales() != null) {

							String[] recipients = new String[] { "lisandramauri@cimientos.org" }; // destino
							// String[] recipients = new
							// String[]{"carlosquetto@cimientos.org"}; //destino
							String[] bccRecipients = new String[] {
									"carlosquetto@cimientos.org",
									"pauladaffra@cimientos.org",
									"lisandramauri@cimientos.org",
									"padrinos@cimientos.org",
									"florenciagelabert@cimientos.org" };
							// String[] bccRecipients = new
							// String[]{"carlosquetto@cimientos.org"};
							String subject = "Aviso Cesación";
							String messageBody = alumnoPanel
									.getNombreApellido()
									+ " de "
									+ alumnoPanel.getZona()
									+ ", "
									+ alumnoPanel.getAnio().getValor()
									+ ", ahijado de "
									+ padrino.getDatosPersonales()
											.getApellido().toString()
									+ ", "
									+ padrino.getDatosPersonales().getNombre()
											.toString()
									+ " ha cesado del PFE en "
									+ entrevistas.get(i).getPeriodoEntrevista()
											.toString()
									+ " "
									+ entrevistas.get(i).getCicloLectivo()
											.toString()
									+ " por el siguiente motivo: '"
									+ entrevistas.get(i).getMotivoCesacion()
											.getValor() + "'";
							new MailUtil().sendMail(recipients, bccRecipients,
									subject, messageBody);

						} else {

							String[] recipients = new String[] { "lisandramauri@cimientos.org" }; // destino
							// String[] recipients = new
							// String[]{"carlosquetto@cimientos.org"}; //destino
							String[] bccRecipients = new String[] {
									"carlosquetto@cimientos.org",
									"pauladaffra@cimientos.org",
									"lisandramauri@cimientos.org",
									"padrinos@cimientos.org",
									"florenciagelabert@cimientos.org" };
							// String[] bccRecipients = new
							// String[]{"carlosquetto@cimientos.org"};
							String subject = "Aviso Cesación";
							String messageBody = alumnoPanel
									.getNombreApellido()
									+ " de "
									+ alumnoPanel.getZona()
									+ ", "
									+ alumnoPanel.getAnio().getValor()
									+ ", ahijado de "
									+ padrino.getEmpresa().getDenominacion()
											.toString()
									+ " ha cesado del PFE en "
									+ entrevistas.get(i).getPeriodoEntrevista()
											.toString()
									+ " "
									+ entrevistas.get(i).getCicloLectivo()
											.toString()
									+ " por el siguiente motivo: '"
									+ entrevistas.get(i).getMotivoCesacion()
											.getValor() + "'";
							new MailUtil().sendMail(recipients, bccRecipients,
									subject, messageBody);

						}

						// guardo la fecha de la cesacion en becas
						Connection cn = null;
						CallableStatement cl = null;
						ResultSet rs = null;
						String call = null;
						try {
							// //System.out.println("sp_alta 7 rr f no renueva "+
							// entrevistas.get(i).getExportacionEspecial().getIdBeca());
							call = "{CALL SP_AltaBajaBeca(?)}";
							cn = Conexion.getConexion();
							cl = cn.prepareCall(call);
							cl.setLong(1, entrevistas.get(i)
									.getExportacionEspecial().getIdBeca()); // becaid
							rs = cl.executeQuery();
							Conexion.cerrarCall(cl);
							Conexion.cerrarConexion(cn);
							call = "{CALL SP_ModificarBecaBajaBecado(?)}";
							// call
							// ="insert into baja_becas values (?,CURDATE( ))";
							cn = Conexion.getConexion();
							cl = cn.prepareCall(call);
							cl.setLong(1, entrevistas.get(i)
									.getExportacionEspecial().getIdBeca()); // becaid
							rs = cl.executeQuery();

							// cierro conexion
							/*
							 * Date fechaBajaBeca=null; call =
							 * "{CALL SP_BuscarFechaBajaBecaHistorial(?)}"; cn =
							 * Conexion.getConexion(); cl =
							 * cn.prepareCall(call); cl.setLong(1,
							 * entrevistas.get
							 * (i).getExportacionEspecial().getIdBeca()); //
							 * becaid rs = cl.executeQuery(); while (rs.next())
							 * { fechaBajaBeca= rs.getDate(2); }
							 * if(fechaBajaBeca!=null){ call =
							 * "{CALL SP_ModificarBajaBecaHistorial(?)}"; cn =
							 * Conexion.getConexion(); cl =
							 * cn.prepareCall(call); cl.setLong(1,
							 * entrevistas.get
							 * (i).getExportacionEspecial().getIdBeca()); //
							 * becaid rs = cl.executeQuery();
							 * 
							 * } if(fechaBajaBeca==null){ call =
							 * "{CALL SP_AltaBajaBecaHistorial(?)}"; cn =
							 * Conexion.getConexion(); cl =
							 * cn.prepareCall(call); cl.setLong(1,
							 * entrevistas.get
							 * (i).getExportacionEspecial().getIdBeca()); //
							 * becaid rs = cl.executeQuery();
							 * 
							 * }
							 */
							Conexion.cerrarCall(cl);
							Conexion.cerrarConexion(cn);
						} catch (SQLException e) {
							e.printStackTrace();
							Conexion.cerrarCall(cl);
							Conexion.cerrarConexion(cn);
						}

					}

					if (entrevistas.get(i).getMotivoNoRenovacion() != null
							|| entrevistas.get(i).getAnioEscolar().getId() == 14
							|| (entrevistas.get(i).getAnioEscolar().getId() == 13 && entrevistas
									.get(i).getPerfilAlumno()
									.getAnioAdicional() != true)) {
						// if (entrevista.getAnioEscolar().getId()==14){
						// //System.out.println(entrevistas.get(i).getEvaluacionCobroBeca().name());
						// //System.out.println(entrevistas.get(i).getEvaluacionCobroBeca().getValor());
						if (entrevistas.get(i).getEvaluacionCobroBeca()
								.getValor().equals("Cesado")) {

							Connection cn = null;
							CallableStatement cl = null;
							ResultSet rs = null;
							String call = null;
							// ////System.out.println(entrevista.getId());
							try {
								// //System.out.println("sp_alta 8 rr f no renueva "+
								// entrevistas.get(i).getExportacionEspecial().getIdBeca());
								call = "{CALL SP_AltaBajaBeca(?)}";
								// call
								// ="insert into baja_becas values (?,CURDATE( ))";
								cn = Conexion.getConexion();
								cl = cn.prepareCall(call);
								cl.setLong(1, entrevistas.get(i)
										.getExportacionEspecial().getIdBeca());
								rs = cl.executeQuery();
								// cierro conexion
								Conexion.cerrarCall(cl);
								Conexion.cerrarConexion(cn);
								call = "{CALL SP_ModificarBecaBajaBecado(?)}";
								// call
								// ="insert into baja_becas values (?,CURDATE( ))";
								cn = Conexion.getConexion();
								cl = cn.prepareCall(call);
								cl.setLong(1, entrevistas.get(i)
										.getExportacionEspecial().getIdBeca());
								rs = cl.executeQuery();
								Conexion.cerrarCall(cl);
								Conexion.cerrarConexion(cn);
								/*
								 * Date fechaBajaBeca1=null; call =
								 * "{CALL SP_BuscarFechaBajaBecaHistorial(?)}";
								 * cn = Conexion.getConexion(); cl =
								 * cn.prepareCall(call); cl.setLong(1,
								 * entrevistas
								 * .get(i).getExportacionEspecial().getIdBeca
								 * ()); rs = cl.executeQuery(); while
								 * (rs.next()) { fechaBajaBeca1= rs.getDate(2);
								 * } if(fechaBajaBeca1!=null){ call =
								 * "{CALL SP_ModificarBajaBecaHistorial(?)}"; cn
								 * = Conexion.getConexion(); cl =
								 * cn.prepareCall(call); cl.setLong(1,
								 * entrevistas
								 * .get(i).getExportacionEspecial().getIdBeca
								 * ()); rs = cl.executeQuery();
								 * 
								 * } if(fechaBajaBeca1==null){ call =
								 * "{CALL SP_AltaBajaBecaHistorial(?)}"; cn =
								 * Conexion.getConexion(); cl =
								 * cn.prepareCall(call); cl.setLong(1,
								 * entrevistas
								 * .get(i).getExportacionEspecial().getIdBeca
								 * ()); rs = cl.executeQuery();
								 * 
								 * }
								 */
								Conexion.cerrarCall(cl);
								Conexion.cerrarConexion(cn);

							} catch (SQLException e) {
								e.printStackTrace();
								Conexion.cerrarCall(cl);
								Conexion.cerrarConexion(cn);
							}
						}
					}

					// iria no renovado

				} else {
					hayDudoso = true;
				}
			}
		}
		Map<String, Object> model = new HashMap<String, Object>();
		PerfilRR rr = getPerfilRR(req);
		if (rr != null) {
			entrevistas = srvEntrevistas.obtenerEntrevistasAAprobar(rr
					.getIdPerfilRR());
		}
		model.put("entrevistas", entrevistas);
		if (hayDudoso) {
			model.put(
					"mensaje",
					"Las entrevistas con Evaluacion de Cobro de Beca en estado 'Dudoso' no fueron Aprobadas");
		}
		return forward("/entrevistas/listaEntrevistasAprobar", model);
	}

	@RequestMapping("/entrevistas/guardarGrupal.do")
	public ModelAndView registrarEntrevistaGrupal(
			HttpServletRequest req,
			@RequestParam("fecha") Date fecha,
			@RequestParam("objetivo") String objetivo,
			@RequestParam("temas") String temas,
			@RequestParam("observaciones") String observaciones,
			@RequestParam("alumnosSeleccionados") String alumnos,
			@RequestParam("tipoEncuentro") String tipoEncuentro,
			@RequestParam(required = false, value = "op1") String op1,
			@RequestParam(required = false, value = "op2") String op2,
			@RequestParam(required = false, value = "op3") String op3,
			@RequestParam(required = false, value = "op4") String op4,
			@RequestParam(required = false, value = "op5") String op5,
			@RequestParam(required = false, value = "op6") String op6,
			@RequestParam(required = false, value = "op") String op,
			@RequestParam(required = false, value = "hsTrabajarAño") String hsTrabajarAño,
			@RequestParam(required = false, value = "observacionesGenerales") String observacionesGenerales,
			@RequestParam(required = false, value = "contenidosTrabajarEnElAnio") String contenidosTrabajarEnElAnio,
			@RequestParam(required = false, value = "motivoInasistencia") String motivoInasistencia,
			@RequestParam("lugarE") Long idEscuela)
			throws CimientosExceptionHandler {

		EntrevistaGrupal entrevista = new EntrevistaGrupal();
		entrevista.setFechaCarga(new Date());
		entrevista.setFechaEntrevista(fecha);
		entrevista.setObjetivoEncuentro(objetivo);
		entrevista.setTemasDesarrollados(temas);
		entrevista.setOp1(op1);
		entrevista.setOp2(op2);
		entrevista.setOp3(op3);
		entrevista.setOp4(op4);
		entrevista.setOp5(op5);
		entrevista.setOp6(op6);
		entrevista.setOp(op);
		entrevista.setHsTrabajarAño(hsTrabajarAño);
		entrevista.setObservacionesGenerales(observacionesGenerales);
		entrevista.setContenidosTrabajarDuranteAnio(contenidosTrabajarEnElAnio);
		entrevista.setMotivoInasistencia(motivoInasistencia);
		entrevista.setTipoEncuentro(tipoEncuentro);
		entrevista.setObservacionesGrupal(observaciones);
		Escuela escuela = registrarEscuelasBecasSrv
				.obtenerEscuelaPorId(idEscuela);
		entrevista.setLugarEntrevista(escuela);
		List<Long> alumonosIds = Formateador.toListOfLongs(alumnos);
		List<PerfilAlumno> perfiles = srvAlumno
				.obtenerAlumnosPorIds(alumonosIds);

		PerfilEA ea = ((PerfilAlumno) perfiles.get(0)).getEa();
		entrevista.setEa(ea);
		entrevista.setRr(ea.getRr());
		srvEntrevistas.guardarEntrevista(entrevista);

		ea.getHistorialEntrevistas().add(entrevista);

		if (entrevista.getEntrevistasIndividuales() == null) {
			entrevista
					.setEntrevistasIndividuales(new ArrayList<EntrevistaIndividual>());
		}

		EntrevistaIndividual e;
		for (PerfilAlumno perfilAlumno : perfiles) {
			Periodo periodo = calcularProximoPeriodo(perfilAlumno);
			e = new EntrevistaIndividual();
			e.setEntrevistaGrupal(entrevista);
			e.setPeriodoDePago(periodo);
			e.setFechaCarga(new Date());
			e.setFechaEntrevista(fecha);
			e.setTipoEntrevista(TipoEntrevista.MENSUAL);
			e.setEstadoEntrevista(EstadoEntrevista.CONSTRUCCION);
			e.setPerfilAlumno(perfilAlumno);
			e.setLugarEntrevista(escuela);
			// se debe guardar el lugar de la proxima entrevista por defecto es
			// el mismo que lugarEntrevista
			e.setLugarProximaEntrevista(escuela);
			e.setEa(perfilAlumno.getEa());
			e.setRr(perfilAlumno.getEa().getRr());
			e.setObjetivoEncuentro(objetivo);
			e.setHsTrabajarAño(hsTrabajarAño);
			e.setObservacionesGenerales(observacionesGenerales);
			e.setContenidosTrabajarDuranteAnio(contenidosTrabajarEnElAnio);
			e.setMotivoInasistencia(motivoInasistencia);
			e.setTipoEncuentroAcompanamiento("Encuentro grupal");

			entrevista.getEntrevistasIndividuales().add(e);
			agregarExportacionEspecial(e);
			e.setMotivoNoConvocatoria("Entrevista grupal");
			srvEntrevistas.guardarEntrevista(e);

			// guardar contenidosTrabajarEnElAnioList

			// pasamos de Strig contenidosTrabajarEnElAnio a lista
			// contenidosTrabajarEnElAnioList
			if (contenidosTrabajarEnElAnio != null) {
				List<String> contenidosTrabajarEnElAnioList = new ArrayList<String>(
						Arrays.asList(contenidosTrabajarEnElAnio.split(",")));

				String url = "jdbc:mysql://localhost/cimientos_testing";

				Long pasarStringALong = 0L;
				for (int i = 0; i < contenidosTrabajarEnElAnioList.size(); i++) {
					pasarStringALong = Long
							.parseLong(contenidosTrabajarEnElAnioList.get(i)) - 1;
					try {
						Connection cn = DriverManager.getConnection(url,
								"root", "root");
						String call = null;
						call = "insert into contenidos_trabajar_en_el_anio (entrevista,element) values(?,?)";
						// System.out.println(call);
						PreparedStatement preparedStmt = cn
								.prepareStatement(call);
						preparedStmt.setLong(1, e.getId());
						preparedStmt.setLong(2, pasarStringALong);

						preparedStmt.execute();
						cn.close();
					} catch (SQLException error) {
						// TODO Auto-generated catch block
						error.printStackTrace();
					}
				}
			}

			srvAlumno.modificarAlumno(perfilAlumno);
			AlumnoPanelEA ape = alumnoPanelEaSrv
					.obtenerAlumnoPanelPorIdPerfilAlumno(perfilAlumno.getId());
			ape.incrementarEntrevista(e.getEstadoEntrevista());
			ape.setColorEntrevistas(ConstantesPaneles.YELLOW);
			ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);

		}

		return listarBecados(req, null, null);
	}

	@RequestMapping("/entrevistas/listaEntrevistasAprobar.do")
	public ModelAndView listaEntrevistasAprobar(HttpServletRequest req) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<EntrevistaIndividual> entrevistas = new ArrayList<EntrevistaIndividual>();
		PerfilRR rr = getPerfilRR(req);
		if (rr != null) {
			entrevistas = srvEntrevistas.obtenerEntrevistasAAprobar(rr
					.getIdPerfilRR());
		}
		model.put("entrevistas", entrevistas);

		return forward("/entrevistas/listaEntrevistasAprobar", model);
	}

	@RequestMapping("/entrevistas/listaEntrevistasPorEa.do")
	public ModelAndView listarEntrevistasPorEa(@RequestParam("idEA") Long idEA) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Long> periodosIds = PeriodoHelper.obtenerListaIdsPeriodos(srvCiclo
				.obtenerCicloActual().getPeriodos());
		model.put("entrevistas",
				srvEntrevistas.obtenerTodasEntrevistasPorEa(idEA, periodosIds));
		model.put("ea", srvPerfilEa.obtenerPerfilEA(idEA));
		return forward("/entrevistas/listaEntrevistasPorEA", model);
	}

	@RequestMapping("/entrevistas/listaInformesPorEa.do")
	public ModelAndView listarInformesPorEA(@RequestParam("idEA") Long idEA,
			@RequestParam("tipoInforme") String tipoInforme) {
		Map<String, Object> model = new HashMap<String, Object>();
		String tipo = obtenerTipoInforme(tipoInforme);
		// TODO cambiar esto, trae el tipo de informse segun el nombre. Hay que
		// refactorizar toda la parte de informes
		model.put(
				"informes",
				srvInforme.obtenerTodosInformesPorEA(idEA,
						srvCiclo.obtenerCicloActual(), tipo));
		model.put("ea", srvPerfilEa.obtenerPerfilEA(idEA));
		return forward("/informes/listaInformesPorEA", model);
	}

	private String obtenerTipoInforme(String tipoInforme) {
		if (tipoInforme.endsWith("is1"))
			return ConstantesInformes.nombreInformeIS1;
		else if (tipoInforme.endsWith("is2"))
			return ConstantesInformes.nombreInformeIS2;
		else
			return ConstantesInformes.nombreInformeIS3;
	}

	@RequestMapping("/entrevistas/listaCuentasPorEa.do")
	public ModelAndView listaCuentasPorEa(HttpServletRequest request,
			@RequestParam("idEA") Long idEA) {
		PerfilEA ea = srvPerfilEa.obtenerPerfilEA(idEA);
		List<ResponsableAdulto> responsables = new ArrayList<ResponsableAdulto>();
		List<PerfilAlumno> becados = srvAlumno.obtenerBecadosDisponibles(ea,
				srvCiclo.obtenerCicloActual());
		for (PerfilAlumno alumno : becados) {
			responsables.add(alumno.getResponsable1());
		}
		HashMap<String, Object> model = new HashMap<String, Object>();
		model.put("responsables", responsables);
		return forward("/responsable/listaDetalleRA", model);
	}

	@RequestMapping("/entrevistas/listaPagosPorEa.do")
	public ModelAndView listaPagosPorEa(HttpServletRequest request,
			@RequestParam("idEA") Long idEA) {
		List<Long> periodosIds = PeriodoHelper.obtenerListaIdsPeriodos(srvCiclo
				.obtenerCicloActual().getPeriodos());
		List<Pago> pagos = srvPago.obtenerTodosPagosPorEa(idEA, periodosIds);

		HashMap<String, Object> model = new HashMap<String, Object>();
		model.put("listaPagoBecados", pagos);
		return forward("/pago/detallePagoBecado", model);
	}

	@InitBinder
	public void initBinder(HttpServletRequest request, WebDataBinder binder) {

		// custom date binding
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));

		// Opciones binding
		binder.registerCustomEditor(Opciones.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							Opciones valor = Opciones.getOpciones(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// motivoNoIncorporacion binding
		binder.registerCustomEditor(motivoNoIncorporacion.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							motivoNoIncorporacion valor = motivoNoIncorporacion
									.getmotivoNoIncorporacion(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// MotivoNoRenovacion binding
		binder.registerCustomEditor(MotivoNoRenovacion.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							MotivoNoRenovacion valor = MotivoNoRenovacion
									.getmotivoNoIncorporacion(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// TipoContacto binding
		binder.registerCustomEditor(TipoContacto.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							TipoContacto valor = TipoContacto
									.getTipoContacto(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// EvaluacionRenovacion binding
		binder.registerCustomEditor(EvaluacionRenovacionMergeada.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							EvaluacionRenovacionMergeada valor = EvaluacionRenovacionMergeada
									.getEvaluacionRenovacionMergeada(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// SituacionEscolar binding
		binder.registerCustomEditor(SituacionEscolarMergeada.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							SituacionEscolarMergeada valor = SituacionEscolarMergeada
									.getSituacionEscolar(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// MotivoPendiente binding
		binder.registerCustomEditor(MotivoPendiente.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							MotivoPendiente valor = MotivoPendiente
									.getMotivoPendiente(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// MotivoIncorporacinoPendiente binding
		binder.registerCustomEditor(MotivoIncorporacionPendiente.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							MotivoIncorporacionPendiente valor = MotivoIncorporacionPendiente
									.getMotivoIncorporacionPendiente(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// Entrevista binding
		binder.registerCustomEditor(TipoEntrevista.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							TipoEntrevista valor = TipoEntrevista
									.getTipoEntrevista(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// Compromiso binding
		binder.registerCustomEditor(Compromiso.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							Compromiso valor = Compromiso.getCompromiso(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// EntrevistaReprogramada binding
		binder.registerCustomEditor(EntrevistaReprogramada.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							EntrevistaReprogramada valor = EntrevistaReprogramada
									.getEntrevistaReprogramada(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// EvaluacionIncorporacion binding
		binder.registerCustomEditor(EvaluacionIncorporacion.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							EvaluacionIncorporacion valor = EvaluacionIncorporacion
									.getEvaluacionIncorporacion(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// EvaluacionCobroBeca binding
		binder.registerCustomEditor(EvaluacionCobroBeca.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							EvaluacionCobroBeca valor = EvaluacionCobroBeca
									.getEvaluacionCobroBeca(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// MotivoAusencia binding
		binder.registerCustomEditor(MotivoAusencia.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							MotivoAusencia valor = MotivoAusencia
									.getMotivoAusencia(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// MotivoCesacion binding
		binder.registerCustomEditor(MotivoCesacion.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							MotivoCesacion valor = MotivoCesacion
									.getMotivoCesacion(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// MotivoSuspension binding
		binder.registerCustomEditor(MotivoSuspension.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							MotivoSuspension valor = MotivoSuspension
									.getMotivoSuspension(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// ContenidosAbordados binding
		binder.registerCustomEditor(ContenidosAbordados.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							ContenidosAbordados valor = ContenidosAbordados
									.getContenidosAbordados(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// DetalleGastos binding
		binder.registerCustomEditor(DetalleGastos.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						int id = Integer.parseInt(text);
						DetalleGastos valor = DetalleGastos
								.getDetalleGastos(id);
						setValue(valor);
					}
				});

		// EstrategiaComplementaria binding
		binder.registerCustomEditor(EstrategiaComplementaria.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							EstrategiaComplementaria valor = EstrategiaComplementaria
									.getEstrategiaComplementaria(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// SituacionCrisis binding
		binder.registerCustomEditor(SituacionCrisis.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							SituacionCrisis valor = SituacionCrisis
									.getSituacionCrisis(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// SituacionCrisis binding
		binder.registerCustomEditor(SituacionRiesgoEscolar.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							SituacionRiesgoEscolar valor = SituacionRiesgoEscolar
									.getSituacionRiesgoEscolar(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// ContenidoTrabajarEnElAnio binding
		binder.registerCustomEditor(ContenidosTrabajarEnElAnio.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							ContenidosTrabajarEnElAnio valor = ContenidosTrabajarEnElAnio
									.getContenidosTrabajarEnElAnio(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// EstadoEntrevista binding
		binder.registerCustomEditor(EstadoEntrevista.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							EstadoEntrevista valor = EstadoEntrevista
									.getEstadoEntrevista(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// AnioEscolar binding
		binder.registerCustomEditor(AnioEscolar.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							AnioEscolar valor = AnioEscolar.getAnioEscolar(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// EvaluacionRenovacionFinal binding
		binder.registerCustomEditor(EvaluacionRenovacionFinal.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							EvaluacionRenovacionFinal valor = EvaluacionRenovacionFinal
									.getEvaluacionRenovacion(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// ResultadoAnioEscolar binding
		binder.registerCustomEditor(ResultadoAnioEscolar.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							ResultadoAnioEscolar valor = ResultadoAnioEscolar
									.getReultadoAnioEscolarE(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// ProyeccionAnioProximo binding
		binder.registerCustomEditor(ProyeccionAnioProximo.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							ProyeccionAnioProximo valor = ProyeccionAnioProximo
									.getProyeccionAnioProximo(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// propositoAnioComienzaList binding
		binder.registerCustomEditor(PropositoAnioComienza.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							PropositoAnioComienza valor = PropositoAnioComienza
									.getPropositoAnioComienza(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		// gustosTiempoLibre binding
		binder.registerCustomEditor(GustosTiempoLibre.class,
				new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) {
						if (!StringUtils.isBlank(text)) {
							int id = Integer.parseInt(text);
							GustosTiempoLibre valor = GustosTiempoLibre
									.getGustosTiempoLibre(id);
							setValue(valor);
						} else {
							setValue("");
						}
					}
				});

		if (binder.getTarget() != null) {// && !binder.getTarget().equals("")){

			binder.setDisallowedFields(new String[] { "lugarEntrevista",
					"lugarProximaEntrevista", "periodoDePago", "materiaBoletin" });

			if ((binder.getTarget() instanceof EntrevistaIndividual)) {
				EntrevistaIndividual entrevista = (EntrevistaIndividual) binder
						.getTarget();
				String idEscuela = request.getParameter("lugarEntrevista");
				String idProximaE = request
						.getParameter("lugarProximaEntrevista");
				String idPeriodo = request.getParameter("periodoDePago");
				String idMateria = request.getParameter("materiaBoletin");

				if (StringUtils.isNotBlank(idEscuela)
						&& StringUtils.isNumeric(idEscuela)) {
					Escuela escuela = registrarEscuelasBecasSrv
							.obtenerEscuelaPorId(Long.parseLong(idEscuela));
					entrevista.setLugarEntrevista(escuela);
				}

				if (StringUtils.isNotBlank(idProximaE)
						&& StringUtils.isNumeric(idProximaE)) {
					Escuela escuela = registrarEscuelasBecasSrv
							.obtenerEscuelaPorId(Long.parseLong(idProximaE));
					entrevista.setLugarProximaEntrevista(escuela);
				}

				if (StringUtils.isNotBlank(idPeriodo)
						&& StringUtils.isNumeric(idPeriodo)) {
					Periodo p = srvPeriodo.obtenerPeriodo(Long
							.parseLong(idPeriodo));
					entrevista.setPeriodoDePago(p);
				}
				if (StringUtils.isNotBlank(idMateria)
						&& StringUtils.isNumeric(idMateria)) {
					Materia m = srvMateria.obtenerPorId(Long
							.parseLong(idMateria));
					entrevista.setMateriaBoletin(m);
				}

			}
		}
	}

	/**
	 * Muestra la lista de todas las entrevistas grupales que se encuentran en
	 * la BD.
	 * 
	 * @param req
	 * @param use
	 * @return la vista con todas las entrevistas grupales
	 */
	@RequestMapping("/entrevistas/listarEntrevistasGrupales.do")
	public ModelAndView listarEntrevistasGrupales(HttpServletRequest req) {
		HashMap<String, Object> model = new HashMap<String, Object>();

		PerfilEA perfilEA = getPerfilEA(req);
		List<EntrevistaGrupal> entrevistas = new ArrayList<EntrevistaGrupal>();
		CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		if (perfilEA != null) {
			entrevistas = srvEntrevistas.obtenerEntrevistasGrupalesPorEa(
					perfilEA.getIdPerfilEA(), cicloActual);
			model.put("idEa", perfilEA.getIdPerfilEA());
			model.put("ea", perfilEA.getDatosPersonales());
		} else {
			entrevistas = srvEntrevistas
					.obtenerEntrevistasGrupalesTodas(cicloActual);

		}
		model.put("entrevistas", entrevistas);

		return forward("/entrevistas/listaEntrevistasGrupales", model);
	}

	/**
	 * @param id
	 * @return la vista con el detalle de Entrevista Grupal
	 */
	@RequestMapping("/entrevistas/verDetalleEntrevistaGrupalView.do")
	public ModelAndView verDetalleEntrevistaGrupalView(
			@RequestParam("idObjeto") Long id) {
		EntrevistaGrupal entrevista = srvEntrevistas
				.obtenerEntrevistaGrupal(id);
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("entrevista", entrevista);
		// return new ModelAndView("entrevistas/detalleEntrevistaGrupal",
		// model);
		return forward("entrevistas/detalleEntrevistaGrupal", model);
	}

	/**
	 * Genera, previa validacion de las condiciones los informes automaticos
	 * 
	 * @param entrevista
	 * @param alumno
	 */
	private void generarInformesAutomaticos(PerfilPadrino padrino, Beca beca,
			EntrevistaIndividual entrevista, PerfilAlumno alumno) {

		// Valida y genera el informeIS1 si corresponde
		if (entrevista.getTipoEntrevista().equals(TipoEntrevista.RENOVACION)
				&& alumno.getEstadoAlumno().equals(EstadoAlumno.RENOVADO)) {
			// Se genera el informeIS1
			alumno.getHistorialBoletin().add(alumno.getBoletin());
			alumno.setBoletin(null);
			srvAlumno.agregarAlumno(alumno);
			generadorInformes.generarInformeSI1(padrino, entrevista, beca,
					alumno);
		} else {
			if (entrevista.getTipoEntrevista()
					.equals(TipoEntrevista.RENOVACION)
					&& alumno.getEstadoAlumno().equals(
							EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION)) {
				ComunicadoPendiente ultimoComunicado = svrComunicadoPendiente
						.obtenerComunicadoPendientePorAlumno(alumno.getId(),
								beca.getCiclo());
				if (ultimoComunicado != null) {
					if (!ultimoComunicado.getPadrino().equals(padrino))
						generadorInformes.generarComunicadoPendiente(padrino,
								beca, entrevista, alumno);
					else {
						if (!ultimoComunicado.getEstado().equals(
								EstadoInforme.ENVIADO)) {
							svrComunicadoPendiente
									.eliminarComunicadoPendiente(ultimoComunicado);
							generadorInformes.generarComunicadoPendiente(
									padrino, beca, entrevista, alumno);
						}
					}
				} else {
					generadorInformes.generarComunicadoPendiente(padrino, beca,
							entrevista, alumno);
				}
			}
			if (entrevista.getTipoEntrevista()
					.equals(TipoEntrevista.RENOVACION)
					&& alumno.getEstadoAlumno()
							.equals(EstadoAlumno.NO_RENOVADO)) {
				generadorInformes.generarComunicadoNoRenovacion(padrino, beca,
						entrevista, alumno);
			}
		}

		// Valida y genera el informeFP si corresponde
		if (entrevista.getTipoEntrevista().equals(TipoEntrevista.INCORPORACION)
				&& alumno.getEstadoAlumno().equals(EstadoAlumno.INCORPORADO)) {
			// Se genera el informeFP
			generadorInformes.generarInformeFP(padrino, beca, alumno,
					EstadoInforme.REVISION, false, null);
		}
		// Valida y generar un Informe de Seguimiento Nº3
		if (entrevista.getTipoEntrevista().equals(TipoEntrevista.FINAL)) {
			InformeIS3 informeIS3 = srvInformeIS3
					.obtenerInformePorIdEntrevista(entrevista.getId());
			List<EntrevistaIndividual> entrevistasPagoSuspendido = srvEntrevistas
					.obtenerEntrevistasConPagoSuspendidoPorAlumno(alumno
							.getId());
			List<EntrevistaIndividual> entrevistasCicloActual = srvEntrevistas
					.obtenerEntrevistasMensualesPorAlumno(alumno.getId(),
							beca.getCiclo());
			generadorInformes.actualizarInformeIS3(informeIS3, padrino, beca,
					entrevista, alumno, entrevistasPagoSuspendido,
					entrevistasCicloActual);
		}

	}

	/***************************************************************************************************
	 ************************************************ BOLETÍN ******************************************
	 ***************************************************************************************************/

	@RequestMapping("/entrevistas/registrarBoletinView.do")
	public ModelAndView altaBoletinView(
			@RequestParam(required = false, value = "idAlumno") Long id,
			@RequestParam(required = false, value = "urlInforme") String urlInforme) {
		return forward("/entrevistas/modificarDatosBoletin");

		/*
		 * 
		 * Map<String, Object> model = new HashMap<String, Object>();
		 * PerfilAlumno perfil = srvAlumno.obtenerAlumno(id);
		 * 
		 * 
		 * //es una edicion de boletin if(perfil.getBoletin() != null) {
		 * model.put("urlInforme", urlInforme); return modificarBoletin(id,
		 * urlInforme); } else { //es un alta de boletin //obtengo las materias
		 * basicas para cargar en el boletin a crear List<Materia>
		 * materiasBasicas = srvMateria.obtenerMateriasBasicas(true);
		 * 
		 * //Verifico si existen previas(sin aprobar) del boletin anterior - no
		 * hay limite de cantidad de previas Boletin boletinAnioAnterior =
		 * srvAlumno.getBoletinAnioAnterior(perfil);
		 * 
		 * List<MateriaPreviaDTO> materiasPreviasDto = null;
		 * 
		 * if(boletinAnioAnterior != null && boletinAnioAnterior.getPrevias() !=
		 * null) { materiasPreviasDto =
		 * this.obtenerMateriasPreviasDesaprobadasBoletinAnterior
		 * (boletinAnioAnterior); }
		 * 
		 * return registrarDatosBoletin(id, materiasBasicas, materiasPreviasDto,
		 * urlInforme);
		 * 
		 * }
		 */
	}

	/**
	 * Obtiene las previas desaprobadas del boletin anterior para poder
	 * transferirlas al boletin actual.
	 * 
	 * @param previas
	 * @param materiasPrevias
	 * @return
	 */
	private List<MateriaPreviaDTO> obtenerMateriasPreviasDesaprobadasBoletinAnterior(
			Boletin boletinAnterior) {
		List<Trimestre> previas = boletinAnterior.getPrevias();

		List<MateriaPreviaDTO> materiasPreviasDesaprobadas = new ArrayList<MateriaPreviaDTO>();
		List<MateriaPreviaDTO> aprobadas = new ArrayList<MateriaPreviaDTO>();

		if (previas != null) {
			for (Trimestre previa : previas) {
				for (NotaMateria notaMateria : previa.getMaterias()) {
					if (notaMateria.getEstado().equals(EstadoMateria.APROBADA)) {
						aprobadas.add(new MateriaPreviaDTO(notaMateria));
					}
				}
			}
		}
		// obtengo las previas que no aprobo restando de las previas totales del
		// boletin las previas aprobadas.
		materiasPreviasDesaprobadas = (List<MateriaPreviaDTO>) CollectionUtils
				.subtract(obtenerListaMateriaPreviaDTO(boletinAnterior),
						aprobadas);
		return materiasPreviasDesaprobadas;
	}

	/**
	 * Obtiene las materias previas en forma de lista de materiasPreviasDTO para
	 * poder mostrarlas en la vista junto con su ciclo.
	 * 
	 * @param boletin
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private List<MateriaPreviaDTO> obtenerListaMateriaPreviaDTO(Boletin boletin) {
		List<Trimestre> previas = boletin.getPrevias();
		List<MateriaPreviaDTO> materiasPreviasDto = new ArrayList<MateriaPreviaDTO>();

		if (previas != null && !previas.isEmpty()) {
			// obtengo todas las materias previas (las saco del 1er
			// trimestre_previa ya que se repiten en los 3)
			List<NotaMateria> previasPrimerTrimestre = previas.get(0)
					.getMaterias();
			materiasPreviasDto = (List<MateriaPreviaDTO>) CollectionUtils
					.collect(previasPrimerTrimestre, new Transformer() {
						@Override
						public Object transform(Object notaMateria) {
							return new MateriaPreviaDTO(
									(NotaMateria) notaMateria);
						}
					});

		}

		return materiasPreviasDto;
	}

	@RequestMapping("/entrevistas/registrarBoletin.do")
	public ModelAndView altaBoletin(
			@RequestParam(required = false, value = "idAlumno") Long id,
			@RequestParam(required = false, value = "previasAnioAnterior") List<Long> idPrevias,
			@RequestParam(required = false, value = "materiasAnioAnterior") List<Long> idFuturasPrevias,
			@RequestParam(required = false, value = "urlInforme") String urlInforme) {
		Map<String, Object> model = new HashMap<String, Object>();

		PerfilAlumno perfil = srvAlumno.obtenerAlumno(id);
		model.put("urlInforme", urlInforme);
		model.put("materias", srvMateria.obtenerTodos());
		model.put("alumno", perfil);

		return forward("/entrevistas/datosBoletin", model);

	}

	@RequestMapping("/entrevistas/registrarDatosBoletin.do")
	public ModelAndView registrarDatosBoletin(
			@RequestParam(required = false, value = "idAlumno") Long id,
			@RequestParam("materias") List<Materia> materias,
			@RequestParam(required = false, value = "materiasPreviasDto") List<MateriaPreviaDTO> materiasPreviasDto,
			@RequestParam(required = false, value = "urlInforme") String urlInforme) {
		List<Trimestre> trimestres = new ArrayList<Trimestre>();
		List<Trimestre> previas = new ArrayList<Trimestre>();
		List<NotaMateria> notasMaterias0 = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMaterias1 = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMaterias2 = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMaterias3 = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMaterias4 = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMaterias5 = new ArrayList<NotaMateria>();
		// nueva columna no aprueba
		List<NotaMateria> notasMaterias6 = new ArrayList<NotaMateria>();

		List<NotaMateria> notasMateriasMarzo = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMateriasJulio = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMateriasDiciembre = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMateriasMesaAdicional = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMateriasComentarios = new ArrayList<NotaMateria>();

		Trimestre previasMarzo = new Trimestre();
		Trimestre previasJulio = new Trimestre();
		Trimestre previasDiciembre = new Trimestre();
		Trimestre previasMesaAdicional = new Trimestre();
		Trimestre previasComentarios = new Trimestre();
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(id);
		Boletin boletin = new Boletin();

		/***************************************************************************************************
		 ******************************** PREVIAS DEL BOLETÍN **********************************************
		 ***************************************************************************************************/

		if (materiasPreviasDto != null && !materiasPreviasDto.isEmpty()) {

			previasJulio.setNombre(ConstantesBoletin.PREVIAS_JULIO);
			previasDiciembre.setNombre(ConstantesBoletin.PREVIAS_DICIEMBRE);
			previasMarzo.setNombre(ConstantesBoletin.PREVIAS_MARZO);
			previasMesaAdicional
					.setNombre(ConstantesBoletin.PREVIAS_MESA_ADICIONAL);
			previasComentarios.setNombre(ConstantesBoletin.PREVIAS_COMENTARIOS);

			crearNotasPrevias(notasMateriasMarzo, materiasPreviasDto);
			crearNotasPrevias(notasMateriasJulio, materiasPreviasDto);
			crearNotasPrevias(notasMateriasDiciembre, materiasPreviasDto);
			crearNotasPrevias(notasMateriasMesaAdicional, materiasPreviasDto);
			crearNotasPrevias(notasMateriasComentarios, materiasPreviasDto);

			previasJulio.setMaterias(notasMateriasJulio);
			previasDiciembre.setMaterias(notasMateriasDiciembre);
			previasMarzo.setMaterias(notasMateriasMarzo);
			previasMesaAdicional.setMaterias(notasMateriasMesaAdicional);
			previasComentarios.setMaterias(notasMateriasComentarios);

			previas.add(0, previasJulio);
			previas.add(1, previasDiciembre);
			previas.add(2, previasMarzo);
			previas.add(3, previasMesaAdicional);
			previas.add(4, previasComentarios);

			boletin.setPrevias(previas);

			// Obtengo las materias de la lista de materiasPreviasDTO
			@SuppressWarnings("unchecked")
			List<Materia> materiasPreviasAnioAnterior = (List<Materia>) CollectionUtils
					.collect(materiasPreviasDto, new Transformer() {
						@Override
						public Object transform(Object materiaPrevia) {
							return ((MateriaPreviaDTO) materiaPrevia)
									.getMateria();
						}
					});

			boletin.setMateriasPrevias(materiasPreviasAnioAnterior);

			srvTrimestre.agregarTodosTrimestres(previas);
		}

		/***************************************************************************************************
		 ******************************** MATERIAS COMUNES DEL BOLETÍN *************************************
		 ***************************************************************************************************/
		Trimestre primero = new Trimestre();
		primero.setNombre(ConstantesBoletin.PRIMER_TRIMESTRE);
		Trimestre segundo = new Trimestre();
		segundo.setNombre(ConstantesBoletin.SEGUNDO_TRIMESTRE);
		Trimestre tercero = new Trimestre();
		tercero.setNombre(ConstantesBoletin.TERCER_TRIMESTRE);
		Trimestre notasFinal = new Trimestre();
		notasFinal.setNombre(ConstantesBoletin.FINAL);
		Trimestre notasDiciembre = new Trimestre();
		notasDiciembre.setNombre(ConstantesBoletin.DICIEMBRE);
		Trimestre notasMarzo = new Trimestre();
		notasMarzo.setNombre(ConstantesBoletin.MARZO);
		// nueva columna no aprueba
		Trimestre notasNoAprueba = new Trimestre();
		notasNoAprueba.setNombre(ConstantesBoletin.NO_APRUEBA);
		Trimestre notasMesaAdicional = new Trimestre();
		notasMesaAdicional.setNombre(ConstantesBoletin.PREVIAS_MESA_ADICIONAL);
		Trimestre notasComentarios = new Trimestre();
		notasComentarios.setNombre(ConstantesBoletin.PREVIAS_COMENTARIOS);

		crearNotasMaterias(notasMaterias0, materias);
		crearNotasMaterias(notasMaterias1, materias);
		crearNotasMaterias(notasMaterias2, materias);
		crearNotasMaterias(notasMaterias3, materias);
		crearNotasMaterias(notasMaterias4, materias);
		crearNotasMaterias(notasMaterias5, materias);
		// nueva columna no aprueba
		crearNotasNoAprueba(notasMaterias6, materias);

		primero.setMaterias(notasMaterias0);
		segundo.setMaterias(notasMaterias1);
		tercero.setMaterias(notasMaterias2);
		notasFinal.setMaterias(notasMaterias3);
		notasDiciembre.setMaterias(notasMaterias4);
		notasMarzo.setMaterias(notasMaterias5);
		// nueva columna no aprueba
		notasNoAprueba.setMaterias(notasMaterias6);

		trimestres.add(0, primero);
		trimestres.add(1, segundo);
		trimestres.add(2, tercero);
		trimestres.add(3, notasFinal);
		trimestres.add(4, notasDiciembre);
		trimestres.add(5, notasMarzo);
		// nueva columna no aprueba
		trimestres.add(6, notasNoAprueba);
		trimestres.add(7, notasMesaAdicional);
		trimestres.add(8, notasComentarios);

		srvTrimestre.agregarTodosTrimestres(trimestres);

		boletin.setAno(perfil.getAnioEscolar());
		boletin.setInasistenciasPrimerTrimestre(null);
		boletin.setInasistenciasSegundoTrimestre(null);
		boletin.setInasistenciasTercerTrimestre(null);

		boletin.setDiasHabilesPrimerTrimestre(null);
		boletin.setDiasHabilesSegundoTrimestre(null);
		boletin.setDiasHabilesTercerTrimestre(null);

		boletin.setCiclo(srvCiclo.obtenerCicloActual());
		boletin.setMaterias(materias);
		boletin.setTrimestres(trimestres);
		boletin.setRegular(true);
		perfil.setBoletin(boletin);
		srvBoletin.agregarBoletin(boletin);
		srvAlumno.agregarAlumno(perfil);

		return modificarBoletin(id, urlInforme);
	}

	/**
	 * @param notasMaterias
	 * @param materias
	 */
	private void crearNotasMaterias(List<NotaMateria> notasMaterias,
			List<Materia> materias) {
		for (Materia materiaObj : materias) {
			NotaMateria notaMateria = new NotaMateria();
			notaMateria.setMateria(materiaObj);
			notaMateria.setCalificacion(CalificacionMateria.SIN_CARGAR);
			notaMateria.setEstado(EstadoMateria.SIN_CALIFICAR);
			notasMaterias.add(notaMateria);
			srvNotaMateria.agregarNotaMateria(notaMateria);

		}
	}

	/**
	 * @param notasMaterias
	 * @param materias
	 */
	private void crearNotasPrevias(List<NotaMateria> notasMaterias,
			List<MateriaPreviaDTO> materias) {
		for (MateriaPreviaDTO materiaObj : materias) {
			NotaMateria notaMateria = new NotaMateria();
			notaMateria.setMateria(materiaObj.getMateria());
			notaMateria.setCalificacion(CalificacionMateria.SIN_CARGAR);
			notaMateria.setEstado(EstadoMateria.SIN_CALIFICAR);
			notaMateria.setCiclo(materiaObj.getCicloPrevia());
			notasMaterias.add(notaMateria);
			srvNotaMateria.agregarNotaMateria(notaMateria);

		}
	}

	/**
	 * @param notasMaterias
	 * @param materia
	 */
	private void crearNotaMateria(List<NotaMateria> notasMaterias,
			Materia materia) {
		NotaMateria notaMateria = new NotaMateria();
		notaMateria.setMateria(materia);
		notaMateria.setCalificacion(CalificacionMateria.SIN_CARGAR);
		notaMateria.setEstado(EstadoMateria.SIN_CALIFICAR);
		notasMaterias.add(notaMateria);
		srvNotaMateria.agregarNotaMateria(notaMateria);
	}

	/**
	 * @param notasMaterias
	 * @param materia
	 * @param ciclo
	 */
	private void crearNotaPrevia(List<NotaMateria> notasMaterias,
			Materia materia, String ciclo) {
		NotaMateria notaMateria = new NotaMateria();
		notaMateria.setMateria(materia);
		notaMateria.setCalificacion(CalificacionMateria.SIN_CARGAR);
		notaMateria.setEstado(EstadoMateria.SIN_CALIFICAR);
		notaMateria.setCiclo(ciclo);
		notasMaterias.add(notaMateria);
		srvNotaMateria.agregarNotaMateria(notaMateria);
	}

	@RequestMapping("/entrevistas/verPrevias.do")
	public ModelAndView shoPreviasView(
			@RequestParam(required = false, value = "idAlumno") Long id,
			@RequestParam(required = false, value = "urlInforme") String urlInforme) {
		Map<String, Object> model = new HashMap<String, Object>();

		PerfilAlumno perfil = srvAlumno.obtenerAlumno(id);
		Trimestre marzo = null;
		Trimestre julio = null;
		Trimestre diciembre = null;
		List<Trimestre> trim = perfil.getBoletin().getTrimestres();
		for (Trimestre trimestre : trim) {
			if (trimestre.getNombre().equals("MARZO")) {
				marzo = trimestre;
				model.put("marzo", marzo);
			}
			if (trimestre.getNombre().equals("JULIO")) {
				julio = trimestre;
				model.put("julio", julio);

			}
			if (trimestre.getNombre().equals("DICIEMBRE")) {
				diciembre = trimestre;
				model.put("diciembre", diciembre);

			}
		}
		model.put("boletin", perfil.getBoletin());
		model.put("alumno", perfil);
		model.put("estados", EstadoMateria.getListaEstadosMaterias());
		return forward("/entrevistas/verPrevias", model);

	}

	@RequestMapping("/entrevistas/modificarBoletinView.do")
	public ModelAndView modificarBoletin(
			@RequestParam(required = false, value = "idAlumno") Long id,
			@RequestParam(required = false, value = "urlInforme") String urlInforme) {

		Map<String, Object> model = new HashMap<String, Object>();
		List<AnioEscolar> anos = new ArrayList<AnioEscolar>();
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(id);
		AlumnoPanelEA alumnoPanelEA = alumnoPanelEaSrv
				.obtenerAlumnoPanelPorIdPerfilAlumno(id);
		List<MateriaPreviaDTO> materiasPreviasDto = this
				.obtenerMateriasPreviasDesaprobadasBoletinAnterior(perfil
						.getBoletin());
		if (materiasPreviasDto != null || !materiasPreviasDto.isEmpty())
			alumnoPanelEA.setCantidadPrevias(materiasPreviasDto.size());
		alumnoPanelEaSrv.modificarAlumnoPanelEA(alumnoPanelEA);
		// List<Materia> materias1 = perfil.getBoletin().getMaterias();
		List<Materia> materias = perfil.getBoletin().getMaterias();
		/*
		 * 
		 * 
		 * ArrayList<Materia> materias = new ArrayList<Materia>(); for (int i =
		 * 0; i < materias1.size(); i++) {
		 * 
		 * if(materias1.get(i).getNombre().equals("Lengua-Literatura") ||
		 * materias1.get(i).getNombre().equals("Matematica")){ Materia m = new
		 * Materia(); m.setAno(""); m.setBasica(true);
		 * m.setId(materias1.get(i).getId());
		 * m.setNombre(materias1.get(i).getNombre()); materias.add(m); } }
		 */
		model.put("materias", materias);
		model.put("cantidadMaterias", materias.size());
		model.put("ano", perfil.getBoletin().getAno());
		List<AnioEscolar> anios = AnioEscolar.getAnioEscolares();
		if (anios.contains(perfil.getBoletin().getAno())) {
			for (int i = 0; i <= (anios.size() - 1); i++) {
				if (!anios.get(i).equals(perfil.getBoletin().getAno())) {
					anos.add(anios.get(i));
				}
			}
		}
		model.put("anios", anos);

		model.put("trimestres", perfil.getBoletin().getTrimestres());
		model.put("primero", perfil.getBoletin().getTrimestres().get(0));
		model.put("segundo", perfil.getBoletin().getTrimestres().get(1));
		model.put("tercero", perfil.getBoletin().getTrimestres().get(2));
		model.put("notasFinal", perfil.getBoletin().getTrimestres().get(3));
		model.put("notasDiciembre", perfil.getBoletin().getTrimestres().get(4));
		model.put("notasMarzo", perfil.getBoletin().getTrimestres().get(5));
		model.put("notasNoAprueba", perfil.getBoletin().getTrimestres().get(6));

		model.put("boletin", perfil.getBoletin());
		model.put("alumno", perfil);
		model.put("estados", EstadoMateria.getListaEstadosMaterias());
		model.put("urlInforme", urlInforme);

		model.put("materiasNoBasicas", srvMateria.obtenerMateriasBasicas(false));
		List<Materia> materiasTodas = srvMateria.obtenerTodos();
		/*
		 * 
		 * 
		 * ArrayList<Materia> materiasTodas = new ArrayList<Materia>();Materia
		 * materia = new Materia();materia.setAno(""); materia.setBasica(true);
		 * materia.setId(14L); materia.setNombre("Lengua-Literatura");
		 * materiasTodas.add(materia); Materia materia2 = new Materia();
		 * materia2.setAno(""); materia2.setBasica(true); materia2.setId(15L);
		 * materia2.setNombre("Matematica"); materiasTodas.add(materia2);
		 */
		for (int i = 0; i < materiasTodas.size(); i++) {
			// //System.out.println(materiasTodas.get(i).getNombre());

			if (materiasTodas.get(i).getNombre() == null) {
				materiasTodas.get(i).setNombre("XX");
			}
		}
		Collections.sort(materiasTodas, new Comparator<Materia>() {

			public int compare(Materia o1, Materia o2) {
				return o1.getNombre().compareTo(o2.getNombre());
			}

		});
		for (int i = 0; i < materiasTodas.size(); i++) {
			// //System.out.println(materiasTodas.get(i).getNombre());

		}

		model.put("materiasTodas", materiasTodas);
		// las materias que estan disponibles para agregar al boletin son todas
		// menos las que ya se agregaron al mismo.
		model.put("materiasDisponibles", CollectionUtils.subtract(
				materiasTodas, perfil.getBoletin().getMaterias()));
		model.put("conductas", ConductaAlumno.getListaConductaAlumno());
		model.put("materiasPrevias",
				obtenerListaMateriaPreviaDTO(perfil.getBoletin()));
		model.put("ciclos", srvCiclo.obtenerTodos());
		actualizarSemaforoBoletin(perfil.getBoletin(), perfil);

		return forward("/entrevistas/modificarDatosBoletin", model);

	}

	@RequestMapping("/entrevistas/altaNotaPeriodo.do")
	public ModelAndView altaNotaPeriodo(
			@RequestParam("idAlumno") Long idAlumno,
			@RequestParam("idTrimestre") Long idTrimestre,
			@RequestParam(required = false, value = "inasist1") Float inasistenciasPrimer,
			@RequestParam(required = false, value = "inasist2") Float inasistenciasSegundo,
			@RequestParam(required = false, value = "inasist3") Float inasistenciasTercer,
			@RequestParam(required = false, value = "dias1") Float diasPrimer,
			@RequestParam(required = false, value = "dias2") Float diasSegundo,
			@RequestParam(required = false, value = "dias3") Float diasTercer,
			@RequestParam(required = false, value = "conducta1") Integer conductaPrimer,
			@RequestParam(required = false, value = "cunducta2") Integer conductaSegundo,
			@RequestParam(required = false, value = "conducta3") Integer conductaTercer,
			@RequestParam(required = false, value = "regular") Boolean regular) {
		Map<String, Object> model = new HashMap<String, Object>();

		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		List<Materia> materias = perfil.getBoletin().getMaterias();
		Trimestre primero = perfil.getBoletin().getTrimestres().get(0);
		List<NotaMateria> notaMateriasPrimero = new ArrayList<NotaMateria>();
		Trimestre segundo = perfil.getBoletin().getTrimestres().get(1);
		List<NotaMateria> notaMateriasSegundo = new ArrayList<NotaMateria>();
		Trimestre tercero = perfil.getBoletin().getTrimestres().get(2);
		List<NotaMateria> notaMateriasTercero = new ArrayList<NotaMateria>();
		Trimestre notasFinal = perfil.getBoletin().getTrimestres().get(3);
		List<NotaMateria> notasMateriaFinal = new ArrayList<NotaMateria>();
		Trimestre notasDiciembre = perfil.getBoletin().getTrimestres().get(4);
		List<NotaMateria> notasMateriaDiciembre = new ArrayList<NotaMateria>();
		Trimestre notasMarzo = perfil.getBoletin().getTrimestres().get(5);
		List<NotaMateria> notasMateriaMarzo = new ArrayList<NotaMateria>();
		// nueva columna no aprueba
		Trimestre notasMateriasNoAprueba = perfil.getBoletin().getTrimestres()
				.get(6);

		List<Long> idsNotasPrimero = new ArrayList<Long>();
		List<Long> idsNotasSegundo = new ArrayList<Long>();
		List<Long> idsNotasTercero = new ArrayList<Long>();
		List<Long> idsNotasFinal = new ArrayList<Long>();
		List<Long> idsNotasDiciembre = new ArrayList<Long>();
		List<Long> idsNotasMarzo = new ArrayList<Long>();
		List<Long> idsEstado = new ArrayList<Long>();

		if (idTrimestre != null) {
			if (primero.getId().equals(idTrimestre)) {
				notaMateriasPrimero = primero.getMaterias();
			}
			if (segundo.getId().equals(idTrimestre)) {
				notaMateriasSegundo = segundo.getMaterias();
			}
			if (tercero.getId().equals(idTrimestre)) {
				notaMateriasTercero = tercero.getMaterias();
			}
			if (notasFinal.getId().equals(idTrimestre)) {
				notasMateriaFinal = notasFinal.getMaterias();
			}
			if (notasDiciembre.getId().equals(idTrimestre)) {
				notasMateriaDiciembre = notasDiciembre.getMaterias();
			}
			if (notasMarzo.getId().equals(idTrimestre)) {
				notasMateriaMarzo = notasMarzo.getMaterias();
			}
		} else {
			model.put("error", "No ha seleccionado un trimestre");
		}
		model.put("alumno", perfil);
		model.put("estados", EstadoMateria.getListaEstadosMaterias());
		model.put("notaMateriasPrimero", notaMateriasPrimero);
		model.put("notaMateriasSegundo", notaMateriasSegundo);
		model.put("notaMateriasTercero", notaMateriasTercero);
		model.put("notaMateriasFinal", notasMateriaFinal);
		model.put("notaMateriasDiciembre", notasMateriaDiciembre);
		model.put("notaMateriasMarzo", notasMateriaMarzo);
		model.put("idsPrimero", idsNotasPrimero);
		model.put("idsSegundo", idsNotasSegundo);
		model.put("idsEstado", idsEstado);
		model.put("idsTercero", idsNotasTercero);
		model.put("idsFinal", idsNotasFinal);
		model.put("idsDiciembre", idsNotasDiciembre);
		model.put("idsMarzo", idsNotasMarzo);
		model.put("materias", materias);
		model.put("tamanio", materias.size());

		model.put("calificaciones",
				CalificacionMateria.getListaCalificaciones());
		model.put("conductas", ConductaAlumno.getListaConductaAlumno());
		model.put("materiasPrevias",
				obtenerListaMateriaPreviaDTO(perfil.getBoletin()));
		model.put("ciclos", srvCiclo.obtenerTodos());

		// nueva columna no aprueba
		model.put("notasNoAprueba", notasMateriasNoAprueba);

		// guarda los datos ingresados del boletin para que no se pierdan
		Boletin boletin = perfil.getBoletin();
		boletin.setInasistenciasPrimerTrimestre(inasistenciasPrimer);
		boletin.setInasistenciasSegundoTrimestre(inasistenciasSegundo);
		boletin.setInasistenciasTercerTrimestre(inasistenciasTercer);
		boletin.setDiasHabilesPrimerTrimestre(diasPrimer);
		boletin.setDiasHabilesSegundoTrimestre(diasSegundo);
		boletin.setDiasHabilesTercerTrimestre(diasTercer);
		boletin.setConductaPrimerTrimestre(conductaPrimer != null ? ConductaAlumno
				.getConductaAlumno(conductaPrimer) : null);
		boletin.setConductaSegundoTrimestre(conductaSegundo != null ? ConductaAlumno
				.getConductaAlumno(conductaSegundo) : null);
		boletin.setConductaTercerTrimestre(conductaTercer != null ? ConductaAlumno
				.getConductaAlumno(conductaTercer) : null);
		boletin.setRegular(regular);

		srvBoletin.agregarBoletin(boletin);
		return new ModelAndView("/entrevistas/altaNotaPeriodo", model);

	}

	@RequestMapping("/entrevistas/altaNotaPrevia.do")
	public ModelAndView altaNotaPrevia(
			@RequestParam("idAlumno") Long idAlumno,
			@RequestParam("idTrimestre") Long idTrimestre,
			@RequestParam(required = false, value = "urlInforme") String urlInforme,
			@RequestParam(required = false, value = "inasist1") Float inasistenciasPrimer,
			@RequestParam(required = false, value = "inasist2") Float inasistenciasSegundo,
			@RequestParam(required = false, value = "inasist3") Float inasistenciasTercer,
			@RequestParam(required = false, value = "dias1") Float diasPrimer,
			@RequestParam(required = false, value = "dias2") Float diasSegundo,
			@RequestParam(required = false, value = "dias3") Float diasTercer,
			@RequestParam(required = false, value = "conducta1") Integer conductaPrimer,
			@RequestParam(required = false, value = "cunducta2") Integer conductaSegundo,
			@RequestParam(required = false, value = "conducta3") Integer conductaTercer,
			@RequestParam(required = false, value = "regular") Boolean regular) {
		Map<String, Object> model = new HashMap<String, Object>();

		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		List<Materia> materiasPrevias = perfil.getBoletin()
				.getMateriasPrevias();
		Trimestre notasPreviasJulio = perfil.getBoletin().getPrevias().get(0);
		List<NotaMateria> previasJulio = new ArrayList<NotaMateria>();
		Trimestre notasPreviasDiciembre = perfil.getBoletin().getPrevias()
				.get(1);
		List<NotaMateria> previasDiciembre = new ArrayList<NotaMateria>();
		Trimestre notasPreviasMarzo = perfil.getBoletin().getPrevias().get(2);
		List<NotaMateria> previasMarzo = new ArrayList<NotaMateria>();

		Trimestre notasPreviasMesaAdicional = perfil.getBoletin().getPrevias()
				.get(2);
		List<NotaMateria> previasMesaAdicional = new ArrayList<NotaMateria>();
		Trimestre notasPreviasComentarios = perfil.getBoletin().getPrevias()
				.get(2);
		List<NotaMateria> previasComentarios = new ArrayList<NotaMateria>();
		List<Long> idsNotasPreviasMesaAdicional = new ArrayList<Long>();
		List<Long> idsNotasPreviasComentarios = new ArrayList<Long>();
		List<Long> idsEstadosMesaAdicional = new ArrayList<Long>();
		List<Long> idsEstadosComentarios = new ArrayList<Long>();

		if (!perfil.getBoletin().getCiclo().getNombre().equals("2017")) {
			notasPreviasMesaAdicional = perfil.getBoletin().getPrevias().get(3);

			notasPreviasComentarios = perfil.getBoletin().getPrevias().get(4);

		}

		List<Long> idsNotasPreviasJulio = new ArrayList<Long>();
		List<Long> idsNotasPreviasDiciembre = new ArrayList<Long>();
		List<Long> idsNotasPreviasMarzo = new ArrayList<Long>();

		List<Long> idsEstadosMarzo = new ArrayList<Long>();
		List<Long> idsEstadosJulio = new ArrayList<Long>();
		List<Long> idsEstadosDiciembre = new ArrayList<Long>();

		if (idTrimestre != null) {
			if (notasPreviasJulio.getId().equals(idTrimestre)) {
				previasJulio = notasPreviasJulio.getMaterias();
			}
			if (notasPreviasDiciembre.getId().equals(idTrimestre)) {
				previasDiciembre = notasPreviasDiciembre.getMaterias();
			}
			if (notasPreviasMarzo.getId().equals(idTrimestre)) {
				previasMarzo = notasPreviasMarzo.getMaterias();
			}
			if (notasPreviasMesaAdicional.getId().equals(idTrimestre)) {
				previasMesaAdicional = notasPreviasMesaAdicional.getMaterias();
			}
			if (notasPreviasComentarios.getId().equals(idTrimestre)) {
				previasComentarios = notasPreviasComentarios.getMaterias();
			}

		} else {
			model.put("error", "No ha seleccionado un trimestre");
		}

		model.put("alumno", perfil);
		model.put("estados", EstadoMateria.getListaEstadosMaterias());
		model.put("notaPreviasJulio", previasJulio);
		model.put("notaPreviasDiciembre", previasDiciembre);
		model.put("notaPreviasMarzo", previasMarzo);
		model.put("notaPreviasMesaAdicional", previasMesaAdicional);
		model.put("notaPreviasComentarios", previasComentarios);
		model.put("idsJulio", idsNotasPreviasJulio);
		model.put("idsDiciembre", idsNotasPreviasDiciembre);
		model.put("idsMarzo", idsNotasPreviasMarzo);
		model.put("idsMesaAdicional", idsNotasPreviasMesaAdicional);
		model.put("idsComentarios", idsNotasPreviasComentarios);
		model.put("materiasPrevias", materiasPrevias);
		model.put("tamanio", materiasPrevias.size());
		model.put("idsEstadosJulio", idsEstadosJulio);
		model.put("idsEstadosDiciembre", idsEstadosDiciembre);
		model.put("idsEstadosMarzo", idsEstadosMarzo);
		model.put("idsEstadosMesaAdicional", idsEstadosMesaAdicional);
		model.put("idsEstadosComentarios", idsEstadosComentarios);
		model.put("trimestre", srvTrimestre.obtenerTrimestre(idTrimestre));
		model.put("calificaciones",
				CalificacionMateria.getListaCalificaciones());

		model.put("conductas", ConductaAlumno.getListaConductaAlumno());
		model.put("materiasPrevias",
				obtenerListaMateriaPreviaDTO(perfil.getBoletin()));
		model.put("ciclos", srvCiclo.obtenerTodos());

		// guarda los datos ingresados del boletin para que no se pierdan
		Boletin boletin = perfil.getBoletin();
		boletin.setInasistenciasPrimerTrimestre(inasistenciasPrimer);
		boletin.setInasistenciasSegundoTrimestre(inasistenciasSegundo);
		boletin.setInasistenciasTercerTrimestre(inasistenciasTercer);
		boletin.setDiasHabilesPrimerTrimestre(diasPrimer);
		boletin.setDiasHabilesSegundoTrimestre(diasSegundo);
		boletin.setDiasHabilesTercerTrimestre(diasTercer);
		boletin.setConductaPrimerTrimestre(conductaPrimer != null ? ConductaAlumno
				.getConductaAlumno(conductaPrimer) : null);
		boletin.setConductaSegundoTrimestre(conductaSegundo != null ? ConductaAlumno
				.getConductaAlumno(conductaSegundo) : null);
		boletin.setConductaTercerTrimestre(conductaTercer != null ? ConductaAlumno
				.getConductaAlumno(conductaTercer) : null);
		boletin.setRegular(regular);
		srvBoletin.agregarBoletin(boletin);

		return new ModelAndView("/entrevistas/altaPrevia", model);

	}

	@RequestMapping("/entrevistas/registrarDatosNotaPrevia.do")
	public ModelAndView guardarPrevia(
			@RequestParam("idAlumno") Long idAlumno,
			@RequestParam(required = false, value = "idsJulio") String idsJulio,
			@RequestParam(required = false, value = "idsDiciembre") String idsDiciembre,
			@RequestParam(required = false, value = "idsMarzo") String idsMarzo,
			@RequestParam(required = false, value = "idsMesaAdicional") String idsMesaAdicional,
			@RequestParam(required = false, value = "idsComentarios") String idsComentarios,
			@RequestParam(required = false, value = "notasJulio") List<String> notasJulio,
			@RequestParam(required = false, value = "notasDiciembre") List<String> notasDiciembre,
			@RequestParam(required = false, value = "notasMarzo") List<String> notasMarzo,
			@RequestParam(required = false, value = "notasMesaAdicional") List<String> notasMesaAdicional,
			@RequestParam(required = false, value = "notasComentarios") List<String> notasComentarios,
			@RequestParam(required = false, value = "idsEstadoJulio") String idsEstadosJulio,
			@RequestParam(required = false, value = "idsEstadoDiciembre") String idsEstadosDiciembre,
			@RequestParam(required = false, value = "idsEstadoMarzo") String idsEstadosMarzo,
			@RequestParam(required = false, value = "idsEstadoMesaAdicional") String idsEstadosMesaAdicional,
			@RequestParam(required = false, value = "idsEstadoComentarios") String idsEstadosComentarios,
			@RequestParam(required = false, value = "estadosComentarios2") String estadosComentarios2) {
		Map<String, Object> model = new HashMap<String, Object>();
		// System.out.println(estadosComentarios2);
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		AlumnoPanelEA alumnoPanelEA = alumnoPanelEaSrv
				.obtenerAlumnoPanelPorIdPerfilAlumno(idAlumno);

		Boletin boletin = perfil.getBoletin();
		List<MateriaPreviaDTO> materiasPreviasDto = this
				.obtenerMateriasPreviasDesaprobadasBoletinAnterior(boletin);
		if (materiasPreviasDto != null || !materiasPreviasDto.isEmpty())
			alumnoPanelEA.setCantidadPrevias(materiasPreviasDto.size());
		Trimestre previasJulio = perfil.getBoletin().getPrevias().get(0);
		Trimestre previasDiciembre = perfil.getBoletin().getPrevias().get(1);
		Trimestre previasMarzo = perfil.getBoletin().getPrevias().get(2);

		Trimestre previasMesaAdicional = perfil.getBoletin().getPrevias()
				.get(2);
		Trimestre previasComentarios = perfil.getBoletin().getPrevias().get(2);

		if (!perfil.getBoletin().getCiclo().getNombre().equals("2017")) {
			previasMesaAdicional = perfil.getBoletin().getPrevias().get(3);
			previasComentarios = perfil.getBoletin().getPrevias().get(4);
		}

		List<NotaMateria> notasMateriasJulio = previasJulio.getMaterias();
		List<NotaMateria> notasMateriasDiciembre = previasDiciembre
				.getMaterias();
		List<NotaMateria> notasMateriasMarzo = previasMarzo.getMaterias();
		List<NotaMateria> notasMateriasMesaAdicional = previasMesaAdicional
				.getMaterias();
		List<NotaMateria> notasMateriasComentarios = previasComentarios
				.getMaterias();

		List<Materia> materiasPrevias = perfil.getBoletin()
				.getMateriasPrevias();
		List<Trimestre> trimestres = new ArrayList<Trimestre>();
		List<Long> idsPri = null;
		List<Long> idsSeg = null;
		List<Long> idsTerc = null;
		List<Long> idsEst = null;
		List<Long> idsTercMA = null;
		List<Long> idsTercCo = null;
		List<Long> idsEstMA = null;
		List<Long> idsEstCo = null;
		List<AnioEscolar> anos = new ArrayList<AnioEscolar>();

		if (StringUtils.isNotBlank(idsJulio)) {
			idsPri = Formateador.toListOfLongs(idsJulio);
			idsEst = Formateador.toListOfLongs(idsEstadosJulio);
			for (int i = 0; i < notasMateriasJulio.size(); i++) {
				if (notasMateriasJulio.get(i).getId().equals(idsPri.get(i))) {
					Integer id = Integer.valueOf(idsEst.get(i).toString());
					notasMateriasJulio.get(i).setEstado(
							EstadoMateria.getEstadoMateria(id));
					notasMateriasJulio
							.get(i)
							.setCalificacion(
									notasJulio.get(i).equals("") ? null
											: CalificacionMateria
													.getCalificacionMateria(Integer
															.parseInt(notasJulio
																	.get(i))));
					srvNotaMateria
							.agregarNotaMateria(notasMateriasJulio.get(i));
					previasJulio.setMaterias(notasMateriasJulio);
				}

			}
			srvTrimestre.agregarTrimestre(previasJulio);
		}
		if (StringUtils.isNotBlank(idsDiciembre)) {
			idsSeg = Formateador.toListOfLongs(idsDiciembre);
			idsEst = Formateador.toListOfLongs(idsEstadosDiciembre);
			for (int i = 0; i < notasMateriasDiciembre.size(); i++) {
				Integer id = Integer.valueOf(idsEst.get(i).toString());
				notasMateriasDiciembre.get(i).setEstado(
						EstadoMateria.getEstadoMateria(id));
				if (notasMateriasDiciembre.get(i).getId().equals(idsSeg.get(i))) {
					notasMateriasDiciembre.get(i).setCalificacion(
							notasDiciembre.get(i).equals("") ? null
									: CalificacionMateria
											.getCalificacionMateria(Integer
													.parseInt(notasDiciembre
															.get(i))));
					srvNotaMateria.agregarNotaMateria(notasMateriasDiciembre
							.get(i));
					previasDiciembre.setMaterias(notasMateriasDiciembre);

				}
			}
			srvTrimestre.agregarTrimestre(previasDiciembre);
		}
		if (StringUtils.isNotBlank(idsMarzo)) {
			idsTerc = Formateador.toListOfLongs(idsMarzo);
			idsEst = Formateador.toListOfLongs(idsEstadosMarzo);
			for (int i = 0; i < notasMateriasMarzo.size(); i++) {
				if (notasMateriasMarzo.get(i).getId().equals(idsTerc.get(i))) {
					Integer id = Integer.valueOf(idsEst.get(i).toString());
					notasMateriasMarzo.get(i).setEstado(
							EstadoMateria.getEstadoMateria(id));
					notasMateriasMarzo
							.get(i)
							.setCalificacion(
									notasMarzo.get(i).equals("") ? null
											: CalificacionMateria
													.getCalificacionMateria(Integer
															.parseInt(notasMarzo
																	.get(i))));

					srvNotaMateria
							.agregarNotaMateria(notasMateriasMarzo.get(i));
					previasMarzo.setMaterias(notasMateriasMarzo);

				}
			}
			srvTrimestre.agregarTrimestre(previasMarzo);
		}
		if (!perfil.getBoletin().getCiclo().getNombre().equals("2017")) {
			if (StringUtils.isNotBlank(idsMesaAdicional)) {
				idsTercMA = Formateador.toListOfLongs(idsMesaAdicional);
				idsEstMA = Formateador.toListOfLongs(idsEstadosMesaAdicional);
				for (int i = 0; i < notasMateriasMesaAdicional.size(); i++) {
					if (notasMateriasMesaAdicional.get(i).getId()
							.equals(idsTercMA.get(i))) {
						Integer id = Integer
								.valueOf(idsEstMA.get(i).toString());
						notasMateriasMesaAdicional.get(i).setEstado(
								EstadoMateria.getEstadoMateria(id));
						notasMateriasMesaAdicional
								.get(i)
								.setCalificacion(
										notasMesaAdicional.get(i).equals("") ? null
												: CalificacionMateria
														.getCalificacionMateria(Integer
																.parseInt(notasMesaAdicional
																		.get(i))));

						srvNotaMateria
								.agregarNotaMateria(notasMateriasMesaAdicional
										.get(i));
						previasMesaAdicional
								.setMaterias(notasMateriasMesaAdicional);

					}
				}
				srvTrimestre.agregarTrimestre(previasMesaAdicional);
			}
			if (StringUtils.isNotBlank(idsComentarios)) {
				idsTercCo = Formateador.toListOfLongs(idsComentarios);
				idsEstCo = Formateador.toListOfLongs(idsEstadosComentarios);
				for (int i = 0; i < notasMateriasComentarios.size(); i++) {
					if (notasMateriasComentarios.get(i).getId()
							.equals(idsTercCo.get(i))) {
						Integer id = Integer
								.valueOf(idsEstCo.get(i).toString());
						notasMateriasComentarios.get(i).setEstado(
								EstadoMateria.getEstadoMateria(id));
						notasMateriasComentarios.get(i).setNota(
								estadosComentarios2);
						notasMateriasComentarios
								.get(i)
								.setCalificacion(
										notasComentarios.get(i).equals("") ? null
												: CalificacionMateria
														.getCalificacionMateria(Integer
																.parseInt(notasComentarios
																		.get(i))));
						srvNotaMateria
								.agregarNotaMateria(notasMateriasComentarios
										.get(i));
						previasComentarios
								.setMaterias(notasMateriasComentarios);
					}

				}
				srvTrimestre.agregarTrimestre(previasComentarios);
			}
		}

		trimestres.add(previasJulio);
		trimestres.add(previasDiciembre);
		trimestres.add(previasMarzo);
		trimestres.add(previasMesaAdicional);
		trimestres.add(previasComentarios);

		boletin.setPrevias(trimestres);
		srvBoletin.agregarBoletin(boletin);
		srvAlumno.agregarAlumno(perfil);
		alumnoPanelEaSrv.modificarAlumnoPanelEA(alumnoPanelEA);
		List<Materia> materias = perfil.getBoletin().getMaterias();
		model.put("materias", materias);
		model.put("cantidadMaterias", materias.size());
		model.put("ano", perfil.getBoletin().getAno());
		List<AnioEscolar> anios = AnioEscolar.getAnioEscolares();
		if (anios.contains(perfil.getBoletin().getAno())) {
			for (int i = 0; i <= (anios.size() - 1); i++) {
				if (!anios.get(i).equals(perfil.getBoletin().getAno())) {
					anos.add(anios.get(i));
				}
			}
		}
		model.put("anios", anos);
		model.put("trimestres", perfil.getBoletin().getTrimestres());
		model.put("primero", perfil.getBoletin().getTrimestres().get(0));
		model.put("segundo", perfil.getBoletin().getTrimestres().get(1));
		model.put("tercero", perfil.getBoletin().getTrimestres().get(2));
		model.put("notasFinal", perfil.getBoletin().getTrimestres().get(3));
		model.put("notasDiciembre", perfil.getBoletin().getTrimestres().get(4));
		model.put("notasMarzo", perfil.getBoletin().getTrimestres().get(5));
		model.put("boletin", perfil.getBoletin());
		model.put("alumno", perfil);
		model.put("materiasNoBasicas", srvMateria.obtenerMateriasBasicas(false));
		List<Materia> materiasTodas = srvMateria.obtenerTodos();
		model.put("materiasTodas", materiasTodas);
		model.put("conductas", ConductaAlumno.getListaConductaAlumno());
		model.put("materiasPrevias",
				obtenerListaMateriaPreviaDTO(perfil.getBoletin()));

		// las materias que estan disponibles para agregar al boletin son todas
		// menos las que ya se agregaron al mismo.
		model.put("materiasDisponibles", CollectionUtils.subtract(
				materiasTodas, perfil.getBoletin().getMaterias()));

		// actualizarSemaforoBoletin(boletin, perfil);
		return forward("/entrevistas/modificarDatosBoletin", model);
	}

	@RequestMapping("/entrevistas/registrarDatosNotaPeriodo.do")
	public ModelAndView guardarNotaPeriodo(
			@RequestParam("idAlumno") Long idAlumno,
			@RequestParam(required = false, value = "idsPrimero") String idsPrimero,
			@RequestParam(required = false, value = "idsSegundo") String idsSegundo,
			@RequestParam(required = false, value = "idsTercero") String idsTercero,
			@RequestParam(required = false, value = "idsFinal") String idsFinal,
			@RequestParam(required = false, value = "idsDiciembre") String idsDiciembre,
			@RequestParam(required = false, value = "idsMarzo") String idsMarzo,
			@RequestParam(required = false, value = "notasPrimero") List<String> notasPrimero,
			@RequestParam(required = false, value = "notasSegundo") List<String> notasSegundo,
			@RequestParam(required = false, value = "notasTercero") List<String> notasTercero,
			@RequestParam(required = false, value = "notasFinal") List<String> notasFinal,
			@RequestParam(required = false, value = "notasDiciembre") List<String> notasDiciembre,
			@RequestParam(required = false, value = "notasMarzo") List<String> notasMarzo,
			@RequestParam(required = false, value = "idsEstado") String idsEstado) {
		Map<String, Object> model = new HashMap<String, Object>();

		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		Boletin boletin = perfil.getBoletin();
		Trimestre primero = perfil.getBoletin().getTrimestres().get(0);
		Trimestre segundo = perfil.getBoletin().getTrimestres().get(1);
		Trimestre tercero = perfil.getBoletin().getTrimestres().get(2);
		Trimestre nFinal = perfil.getBoletin().getTrimestres().get(3);
		Trimestre diciembre = perfil.getBoletin().getTrimestres().get(4);
		Trimestre marzo = perfil.getBoletin().getTrimestres().get(5);
		// nueva columna no aprueba
		Trimestre materiasNoAprueba = perfil.getBoletin().getTrimestres()
				.get(6);

		List<NotaMateria> notasMateriasPrimero = primero.getMaterias();
		List<NotaMateria> notasMateriasSegundo = segundo.getMaterias();
		List<NotaMateria> notasMateriasTercero = tercero.getMaterias();
		List<NotaMateria> notasMateriasFinal = nFinal.getMaterias();
		List<NotaMateria> notasMateriasDiciembre = diciembre.getMaterias();
		List<NotaMateria> notasMateriasMarzo = marzo.getMaterias();

		List<Materia> materias = perfil.getBoletin().getMaterias();

		List<Trimestre> trimestres = new ArrayList<Trimestre>();
		List<Long> idsPri = null;
		List<Long> idsSeg = null;
		List<Long> idsTerc = null;
		List<Long> idsFin = null;
		List<Long> idsDic = null;
		List<Long> idsMarz = null;

		if (StringUtils.isNotBlank(idsPrimero)) {
			idsPri = Formateador.toListOfLongs(idsPrimero);
			for (int i = 0; i < notasMateriasPrimero.size(); i++) {
				if (notasMateriasPrimero.get(i).getId().equals(idsPri.get(i))) {
					notasMateriasPrimero.get(i).setCalificacion(
							notasPrimero.get(i).equals("") ? null
									: CalificacionMateria
											.getCalificacionMateria(Integer
													.parseInt(notasPrimero
															.get(i))));
					srvNotaMateria.agregarNotaMateria(notasMateriasPrimero
							.get(i));
					primero.setMaterias(notasMateriasPrimero);
				}

			}
			srvTrimestre.agregarTrimestre(primero);
		}
		if (StringUtils.isNotBlank(idsSegundo)) {
			idsSeg = Formateador.toListOfLongs(idsSegundo);
			for (int i = 0; i < notasMateriasSegundo.size(); i++) {
				if (notasMateriasSegundo.get(i).getId().equals(idsSeg.get(i))) {
					notasMateriasSegundo.get(i).setCalificacion(
							notasSegundo.get(i).equals("") ? null
									: CalificacionMateria
											.getCalificacionMateria(Integer
													.parseInt(notasSegundo
															.get(i))));
					srvNotaMateria.agregarNotaMateria(notasMateriasSegundo
							.get(i));
					segundo.setMaterias(notasMateriasSegundo);

				}
			}
			srvTrimestre.agregarTrimestre(segundo);
		}
		if (StringUtils.isNotBlank(idsTercero)) {
			idsTerc = Formateador.toListOfLongs(idsTercero);
			for (int i = 0; i < notasMateriasTercero.size(); i++) {
				if (notasMateriasTercero.get(i).getId().equals(idsTerc.get(i))) {
					notasMateriasTercero.get(i).setCalificacion(
							notasTercero.get(i).equals("") ? null
									: CalificacionMateria
											.getCalificacionMateria(Integer
													.parseInt(notasTercero
															.get(i))));

					srvNotaMateria.agregarNotaMateria(notasMateriasTercero
							.get(i));
					tercero.setMaterias(notasMateriasTercero);
				}
			}
			srvTrimestre.agregarTrimestre(tercero);

		}

		if (StringUtils.isNotBlank(idsFinal)) {
			idsFin = Formateador.toListOfLongs(idsFinal);
			for (int i = 0; i < notasMateriasFinal.size(); i++) {
				if (notasMateriasFinal.get(i).getId().equals(idsFin.get(i))) {
					notasMateriasFinal
							.get(i)
							.setCalificacion(
									notasFinal.get(i).equals("") ? null
											: CalificacionMateria
													.getCalificacionMateria(Integer
															.parseInt(notasFinal
																	.get(i))));

					srvNotaMateria
							.agregarNotaMateria(notasMateriasFinal.get(i));
					nFinal.setMaterias(notasMateriasFinal);
				}

			}
			srvTrimestre.agregarTrimestre(nFinal);
		}

		if (StringUtils.isNotBlank(idsDiciembre)) {
			idsDic = Formateador.toListOfLongs(idsDiciembre);
			for (int i = 0; i < notasMateriasDiciembre.size(); i++) {
				if (notasMateriasDiciembre.get(i).getId().equals(idsDic.get(i))) {
					notasMateriasDiciembre.get(i).setCalificacion(
							notasDiciembre.get(i).equals("") ? null
									: CalificacionMateria
											.getCalificacionMateria(Integer
													.parseInt(notasDiciembre
															.get(i))));

					srvNotaMateria.agregarNotaMateria(notasMateriasDiciembre
							.get(i));
					diciembre.setMaterias(notasMateriasDiciembre);
				}

			}
			srvTrimestre.agregarTrimestre(diciembre);
		}

		if (StringUtils.isNotBlank(idsMarzo)) {
			idsMarz = Formateador.toListOfLongs(idsMarzo);
			for (int i = 0; i < notasMateriasMarzo.size(); i++) {
				if (notasMateriasMarzo.get(i).getId().equals(idsMarz.get(i))) {
					notasMateriasMarzo
							.get(i)
							.setCalificacion(
									notasMarzo.get(i).equals("") ? null
											: CalificacionMateria
													.getCalificacionMateria(Integer
															.parseInt(notasMarzo
																	.get(i))));

					srvNotaMateria
							.agregarNotaMateria(notasMateriasMarzo.get(i));
					marzo.setMaterias(notasMateriasMarzo);
				}

			}
			srvTrimestre.agregarTrimestre(marzo);
		}
		trimestres.add(primero);
		trimestres.add(segundo);
		trimestres.add(tercero);
		trimestres.add(nFinal);
		trimestres.add(diciembre);
		trimestres.add(marzo);
		trimestres.add(materiasNoAprueba);
		boletin.setTrimestres(trimestres);

		srvBoletin.agregarBoletin(boletin);
		srvAlumno.agregarAlumno(perfil);

		model.put("alumno", perfil);
		model.put("anios", AnioEscolar.getAnioEscolares());
		model.put("materias", materias);
		model.put("cantidadMaterias", materias.size());
		model.put("trimestres", perfil.getBoletin().getTrimestres());
		model.put("primero", primero);
		model.put("notasMarzo", marzo);
		model.put("notasFinal", nFinal);
		model.put("notasDiciembre", diciembre);
		model.put("segundo", segundo);
		model.put("tercero", tercero);
		model.put("boletin", perfil.getBoletin());
		model.put("alumno", perfil);
		model.put("materiasNoBasicas", srvMateria.obtenerMateriasBasicas(false));
		List<Materia> materiasTodas = srvMateria.obtenerTodos();
		model.put("materiasTodas", materiasTodas);
		model.put("conductas", ConductaAlumno.getListaConductaAlumno());
		model.put("materiasPrevias",
				obtenerListaMateriaPreviaDTO(perfil.getBoletin()));
		// las materias que estan disponibles para agregar al boletin son todas
		// menos las que ya se agregaron al mismo.
		model.put("materiasDisponibles", CollectionUtils.subtract(
				materiasTodas, perfil.getBoletin().getMaterias()));
		// nueva columna no aprueba
		model.put("notasNoAprueba", materiasNoAprueba);
		// actualizarSemaforoBoletin(boletin, perfil);

		return forward("/entrevistas/modificarDatosBoletin", model);
	}

	@RequestMapping("/entrevistas/modificarDatosBoletin.do")
	public ModelAndView modificarDatosBoletin(
			HttpServletRequest request,
			@RequestParam(required = false, value = "idAlumno") Long id,
			@RequestParam(required = false, value = "idBoletin") Long idBoletin,
			@RequestParam(required = false, value = "inasistenciasPrimer") Float inasistenciasPrimer,
			@RequestParam(required = false, value = "inasistenciasSegundo") Float inasistenciasSegundo,
			@RequestParam(required = false, value = "inasistenciasTercer") Float inasistenciasTercer,
			@RequestParam(required = false, value = "diasHabilesPrimer") Float diasHabilesPrimer,
			@RequestParam(required = false, value = "diasHabilesSegundo") Float diasHabilesSegundo,
			@RequestParam(required = false, value = "diasHabilesTercer") Float diasHabilesTercer,
			@RequestParam("conductaPrimer") Integer idConductaPrimer,
			@RequestParam("conductaSegundo") Integer idConductaSegundo,
			@RequestParam("conductaTercer") Integer idConductaTercer,
			@RequestParam(required = false, value = "foto") Object foto) {
		Map<String, Object> model = new HashMap<String, Object>();
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(id);
		AlumnoPanelEA alumnoPanelEA = alumnoPanelEaSrv
				.obtenerAlumnoPanelPorIdPerfilAlumno(perfil.getId());
		Boletin boletin = perfil.getBoletin();
		List<MateriaPreviaDTO> materiasPrevias = new ArrayList<MateriaPreviaDTO>();
		materiasPrevias = this
				.obtenerMateriasPreviasDesaprobadasBoletinAnterior(boletin);
		if (!materiasPrevias.isEmpty() || materiasPrevias != null)
			alumnoPanelEA.setCantidadPrevias(materiasPrevias.size());

		boletin.setInasistenciasPrimerTrimestre(inasistenciasPrimer);
		boletin.setInasistenciasSegundoTrimestre(inasistenciasSegundo);
		boletin.setInasistenciasTercerTrimestre(inasistenciasTercer);
		boletin.setDiasHabilesPrimerTrimestre(diasHabilesPrimer);
		boletin.setDiasHabilesSegundoTrimestre(diasHabilesSegundo);
		boletin.setDiasHabilesTercerTrimestre(diasHabilesTercer);
		boletin.setConductaPrimerTrimestre(ConductaAlumno
				.getConductaAlumno(idConductaPrimer));
		boletin.setConductaSegundoTrimestre(ConductaAlumno
				.getConductaAlumno(idConductaSegundo));
		boletin.setConductaTercerTrimestre(ConductaAlumno
				.getConductaAlumno(idConductaTercer));
		srvBoletin.agregarBoletin(boletin);
		srvAlumno.agregarAlumno(perfil);
		alumnoPanelEaSrv.modificarAlumnoPanelEA(alumnoPanelEA);
		model.put("alumnos", srvAlumno.obtenerTodos());
		model.put("mensaje", "Se ha actualizado el boletin del alumno: "
				+ perfil.getDatosPersonales().getApellido() + ","
				+ perfil.getDatosPersonales().getNombre());
		actualizarSemaforoBoletin(boletin, perfil);
		String nombreFotoBoletin = perfil.getId() + "-"
				+ perfil.getBoletin().getId();
		guardarFoto(foto, nombreFotoBoletin);
		return listarBecados(request, null, null);
	}

	@RequestMapping("/entrevistas/guardarMateriaBoletin.do")
	public ModelAndView guardarMateriaBoletin(
			HttpServletRequest request,
			@RequestParam(required = false, value = "idBoletin") Long idBoletin,
			@RequestParam(required = false, value = "idMateria") Long idMateria,
			@RequestParam(required = false, value = "otraMateria") String otraMateria,
			@RequestParam(required = false, value = "idAlumno") Long id,
			@RequestParam(required = false, value = "urlInforme") String urlInforme,
			@RequestParam(required = false, value = "inasistenciasPrimer") Float inasistenciasPrimer,
			@RequestParam(required = false, value = "inasistenciasSegundo") Float inasistenciasSegundo,
			@RequestParam(required = false, value = "inasistenciasTercer") Float inasistenciasTercer,
			@RequestParam(required = false, value = "diasHabilesPrimer") Float diasHabilesPrimer,
			@RequestParam(required = false, value = "diasHabilesSegundo") Float diasHabilesSegundo,
			@RequestParam(required = false, value = "diasHabilesTercer") Float diasHabilesTercer,
			@RequestParam(required = false, value = "conductaPrimer") Integer idConductaPrimer,
			@RequestParam(required = false, value = "conductaSegundo") Integer idConductaSegundo,
			@RequestParam(required = false, value = "conductaTercer") Integer idConductaTercer,
			@RequestParam(required = false, value = "regular") Boolean regular) {

		Boletin boletin = null;
		Materia nuevaMateria = null;
		if (idMateria != null) {
			nuevaMateria = srvMateria.obtenerPorId(idMateria);
		} else {
			nuevaMateria = new Materia();
			nuevaMateria.setBasica(false);
			nuevaMateria.setNombre(otraMateria);
			srvMateria.agregarMateria(nuevaMateria);
		}
		boletin = srvBoletin.obtenerPorId(idBoletin);
		boletin.getMaterias().add(nuevaMateria);

		// Agregar las notas materia vacias a los trimestres del boletin
		for (Trimestre trimestre : boletin.getTrimestres()) {
			crearNotaMateria(trimestre.getMaterias(), nuevaMateria);
		}

		// guarda los datos ingresados del boletin para que no se pierdan
		boletin.setInasistenciasPrimerTrimestre(inasistenciasPrimer);
		boletin.setInasistenciasSegundoTrimestre(inasistenciasSegundo);
		boletin.setInasistenciasTercerTrimestre(inasistenciasTercer);
		boletin.setDiasHabilesPrimerTrimestre(diasHabilesPrimer);
		boletin.setDiasHabilesSegundoTrimestre(diasHabilesSegundo);
		boletin.setDiasHabilesTercerTrimestre(diasHabilesTercer);
		boletin.setConductaPrimerTrimestre(idConductaPrimer != null ? ConductaAlumno
				.getConductaAlumno(idConductaPrimer) : null);
		boletin.setConductaSegundoTrimestre(idConductaSegundo != null ? ConductaAlumno
				.getConductaAlumno(idConductaSegundo) : null);
		boletin.setConductaTercerTrimestre(idConductaTercer != null ? ConductaAlumno
				.getConductaAlumno(idConductaTercer) : null);
		boletin.setRegular(regular);

		srvBoletin.agregarBoletin(boletin);
		return modificarBoletin(id, urlInforme);
	}

	@RequestMapping("/entrevistas/guardarMateriaPrevia.do")
	public ModelAndView guardarMateriaPrevia(
			HttpServletRequest request,
			@RequestParam(required = false, value = "edicion") Boolean edicion,
			@RequestParam(required = false, value = "idBoletin") Long idBoletin,
			@RequestParam(required = false, value = "idMateria") Long idMateria,
			@RequestParam(required = false, value = "idPrevia") Long idPreviaAnterior,
			@RequestParam(required = false, value = "idAlumno") Long id,
			@RequestParam(required = false, value = "ciclo") String ciclo,
			@RequestParam(required = false, value = "cicloAnteriorPrevia") String cicloAnteriorPrevia,
			@RequestParam(required = false, value = "urlInforme") String urlInforme,
			@RequestParam(required = false, value = "inasistenciasPrimer") Float inasistenciasPrimer,
			@RequestParam(required = false, value = "inasistenciasSegundo") Float inasistenciasSegundo,
			@RequestParam(required = false, value = "inasistenciasTercer") Float inasistenciasTercer,
			@RequestParam(required = false, value = "diasHabilesPrimer") Float diasHabilesPrimer,
			@RequestParam(required = false, value = "diasHabilesSegundo") Float diasHabilesSegundo,
			@RequestParam(required = false, value = "diasHabilesTercer") Float diasHabilesTercer,
			@RequestParam(required = false, value = "conductaPrimer") Integer idConductaPrimer,
			@RequestParam(required = false, value = "conductaSegundo") Integer idConductaSegundo,
			@RequestParam(required = false, value = "conductaTercer") Integer idConductaTercer,
			@RequestParam(required = false, value = "regular") Boolean regular) {
		List<Trimestre> trimestres = new ArrayList<Trimestre>();
		List<NotaMateria> notasMaterias0 = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMaterias1 = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMaterias2 = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMaterias3 = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMaterias4 = new ArrayList<NotaMateria>();
		Boletin boletin = null;
		Materia nuevaMateria = null;
		Materia materiaAnterior = null;

		if (idMateria != null) {
			nuevaMateria = srvMateria.obtenerPorId(idMateria);
		}

		boletin = srvBoletin.obtenerPorId(idBoletin);

		// Si es una edicion de materia previa
		if (edicion != null && edicion) {
			// obtengo la materia que tenia antes
			materiaAnterior = srvMateria.obtenerPorId(idPreviaAnterior);
			List<Materia> materiasPrevias = boletin.getMateriasPrevias();
			Trimestre notasPreviasJulio = boletin.getPrevias().get(0);
			Trimestre notasPreviasDiciembre = boletin.getPrevias().get(1);
			Trimestre notasPreviasMarzo = boletin.getPrevias().get(2);
			Trimestre notasPreviasMesaAdicional = boletin.getPrevias().get(3);
			Trimestre notasPreviasComentarios = boletin.getPrevias().get(4);
			int index = obtenerIndexMateria(materiaAnterior,
					cicloAnteriorPrevia, notasPreviasJulio.getMaterias());

			materiasPrevias.set(index, nuevaMateria);
			notasPreviasJulio.getMaterias().get(index).setMateria(nuevaMateria);
			notasPreviasJulio.getMaterias().get(index).setCiclo(ciclo);
			notasPreviasDiciembre.getMaterias().get(index)
					.setMateria(nuevaMateria);
			notasPreviasDiciembre.getMaterias().get(index).setCiclo(ciclo);
			notasPreviasMarzo.getMaterias().get(index).setMateria(nuevaMateria);
			notasPreviasMarzo.getMaterias().get(index).setCiclo(ciclo);
			notasPreviasMesaAdicional.getMaterias().get(index)
					.setMateria(nuevaMateria);
			notasPreviasMesaAdicional.getMaterias().get(index).setCiclo(ciclo);
			notasPreviasComentarios.getMaterias().get(index)
					.setMateria(nuevaMateria);
			notasPreviasComentarios.getMaterias().get(index).setCiclo(ciclo);

		} else {// es un alta

			boletin.getMateriasPrevias().add(nuevaMateria);

			// Agregar las notas materia vacias a las previas del boletin
			if (boletin.getPrevias().isEmpty()) {
				Trimestre previasJulio = new Trimestre();
				previasJulio.setNombre(ConstantesBoletin.PREVIAS_JULIO);

				Trimestre previasDiciembre = new Trimestre();
				previasDiciembre.setNombre(ConstantesBoletin.PREVIAS_DICIEMBRE);

				Trimestre previasMarzo = new Trimestre();
				previasMarzo.setNombre(ConstantesBoletin.MARZO);

				Trimestre previasMesaAdicional = new Trimestre();
				previasMesaAdicional
						.setNombre(ConstantesBoletin.PREVIAS_MESA_ADICIONAL);

				Trimestre previasComentarios = new Trimestre();
				previasComentarios
						.setNombre(ConstantesBoletin.PREVIAS_COMENTARIOS);

				crearNotaPrevia(notasMaterias0, nuevaMateria, ciclo);
				crearNotaPrevia(notasMaterias1, nuevaMateria, ciclo);
				crearNotaPrevia(notasMaterias2, nuevaMateria, ciclo);
				crearNotaPrevia(notasMaterias3, nuevaMateria, ciclo);
				crearNotaPrevia(notasMaterias4, nuevaMateria, ciclo);

				previasJulio.setMaterias(notasMaterias0);
				previasDiciembre.setMaterias(notasMaterias1);
				previasMarzo.setMaterias(notasMaterias2);
				previasMesaAdicional.setMaterias(notasMaterias3);
				previasComentarios.setMaterias(notasMaterias4);

				trimestres.add(0, previasJulio);
				trimestres.add(1, previasDiciembre);
				trimestres.add(2, previasMarzo);
				trimestres.add(3, previasMesaAdicional);
				trimestres.add(4, previasComentarios);

				boletin.setPrevias(trimestres);

				srvTrimestre.agregarTodosTrimestres(trimestres);

			} else {
				for (Trimestre previa : boletin.getPrevias()) {
					crearNotaPrevia(previa.getMaterias(), nuevaMateria, ciclo);
				}
			}

		}

		// guarda los datos ingresados del boletin para que no se pierdan
		boletin.setInasistenciasPrimerTrimestre(inasistenciasPrimer);
		boletin.setInasistenciasSegundoTrimestre(inasistenciasSegundo);
		boletin.setInasistenciasTercerTrimestre(inasistenciasTercer);
		boletin.setDiasHabilesPrimerTrimestre(diasHabilesPrimer);
		boletin.setDiasHabilesSegundoTrimestre(diasHabilesSegundo);
		boletin.setDiasHabilesTercerTrimestre(diasHabilesTercer);
		boletin.setConductaPrimerTrimestre(idConductaPrimer != null ? ConductaAlumno
				.getConductaAlumno(idConductaPrimer) : null);
		boletin.setConductaSegundoTrimestre(idConductaSegundo != null ? ConductaAlumno
				.getConductaAlumno(idConductaSegundo) : null);
		boletin.setConductaTercerTrimestre(idConductaTercer != null ? ConductaAlumno
				.getConductaAlumno(idConductaTercer) : null);
		boletin.setRegular(regular);
		srvBoletin.agregarBoletin(boletin);

		return modificarBoletin(id, urlInforme);
	}

	@RequestMapping("/entrevistas/borrarMateriaPrevia.do")
	public ModelAndView borrarMateriaPrevia(
			@RequestParam("idAlumno") Long idAlumno,
			@RequestParam("idMateria") Long idMateriaPrevia,
			@RequestParam("cicloPrevia") String cicloPrevia,
			@RequestParam(required = false, value = "inasistenciasPrimer") Float inasistenciasPrimer,
			@RequestParam(required = false, value = "inasistenciasSegundo") Float inasistenciasSegundo,
			@RequestParam(required = false, value = "inasistenciasTercer") Float inasistenciasTercer,
			@RequestParam(required = false, value = "diasPrimer") Float diasPrimer,
			@RequestParam(required = false, value = "diasSegundo") Float diasSegundo,
			@RequestParam(required = false, value = "diasTercer") Float diasTercer,
			@RequestParam(required = false, value = "conductaPrimer") Integer conductaPrimer,
			@RequestParam(required = false, value = "conductaSegundo") Integer conductaSegundo,
			@RequestParam(required = false, value = "conductaTercer") Integer conductaTercer,
			@RequestParam(required = false, value = "regular") Boolean regular) {

		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		List<Materia> materiasPrevias = perfil.getBoletin()
				.getMateriasPrevias();
		Trimestre notasPreviasJulio = perfil.getBoletin().getPrevias().get(0);
		Trimestre notasPreviasDiciembre = perfil.getBoletin().getPrevias()
				.get(1);
		Trimestre notasPreviasMarzo = perfil.getBoletin().getPrevias().get(2);

		Trimestre notasPreviasMesaAdicional = perfil.getBoletin().getPrevias()
				.get(2);
		Trimestre notasPreviasComentarios = perfil.getBoletin().getPrevias()
				.get(2);

		if (perfil.getBoletin().getCiclo().getNombre().equals("2017")) {
			notasPreviasMesaAdicional = perfil.getBoletin().getPrevias().get(3);
			notasPreviasComentarios = perfil.getBoletin().getPrevias().get(4);
		}

		Materia materiaPrevia = srvMateria.obtenerPorId(idMateriaPrevia);
		// le paso las notas previas de julio para encontrar la materia ya que
		// las materias se repiten en los 3 periodos
		int index = obtenerIndexMateria(materiaPrevia, cicloPrevia,
				notasPreviasJulio.getMaterias());

		materiasPrevias.remove(index);
		notasPreviasJulio.getMaterias().remove(index);
		notasPreviasDiciembre.getMaterias().remove(index);
		notasPreviasMarzo.getMaterias().remove(index);

		if (perfil.getBoletin().getCiclo().getNombre().equals("2017")) {
			notasPreviasMesaAdicional.getMaterias().remove(index);
			notasPreviasComentarios.getMaterias().remove(index);
		}

		// guarda los datos ingresados del boletin para que no se pierdan
		Boletin boletin = perfil.getBoletin();
		boletin.setInasistenciasPrimerTrimestre(inasistenciasPrimer);
		boletin.setInasistenciasSegundoTrimestre(inasistenciasSegundo);
		boletin.setInasistenciasTercerTrimestre(inasistenciasTercer);
		boletin.setDiasHabilesPrimerTrimestre(diasPrimer);
		boletin.setDiasHabilesSegundoTrimestre(diasSegundo);
		boletin.setDiasHabilesTercerTrimestre(diasTercer);
		boletin.setConductaPrimerTrimestre(conductaPrimer != null ? ConductaAlumno
				.getConductaAlumno(conductaPrimer) : null);
		boletin.setConductaSegundoTrimestre(conductaSegundo != null ? ConductaAlumno
				.getConductaAlumno(conductaSegundo) : null);
		boletin.setConductaTercerTrimestre(conductaTercer != null ? ConductaAlumno
				.getConductaAlumno(conductaTercer) : null);
		boletin.setRegular(regular);
		srvBoletin.agregarBoletin(boletin);

		return modificarBoletin(idAlumno, null);
	}

	/**
	 * @param cicloPrevia
	 * @param materiaPrevia
	 * @param materiasPrevias
	 * @return
	 */
	private int obtenerIndexMateria(Materia materia, String cicloPrevia,
			List<NotaMateria> materias) {
		int index = 0;
		boolean encontrada = false;
		NotaMateria notaMateria = null;
		Iterator<NotaMateria> matIter = materias.iterator();
		while (matIter.hasNext() && !encontrada) {
			notaMateria = (NotaMateria) matIter.next();
			encontrada = materia.equals(notaMateria.getMateria())
					&& notaMateria.getCiclo().equals(cicloPrevia);
			if (!encontrada)
				index++;
		}
		return index;
	}

	/**
	 * Esta funcion actualiza el semaforo del color de boletin en cada alumno
	 * panel ea
	 * 
	 * @param boletin
	 * @param alumno
	 */
	public void actualizarSemaforoBoletin(Boletin boletin, PerfilAlumno alumno) {
		AlumnoPanelEA alumnoPanel = alumnoPanelEaSrv
				.obtenerAlumnoPanelPorIdPerfilAlumno(alumno.getId());

		EstadoAlumno estadoAlumno = alumno.getEstadoAlumno();

		String colorSemaforo = generarColorSemaforoBoletin(boletin,
				estadoAlumno);

		alumnoPanel.setColorBoletin(colorSemaforo);

		alumnoPanelEaSrv.modificarAlumnoPanelEA(alumnoPanel);
	}

	/**
	 * Esta funcion retorna el color del semaforo del boletín (gris, rojo,
	 * verde) dependiendo de los casos contemplados
	 * 
	 * @param boletin
	 * @return String
	 */
	public String generarColorSemaforoBoletin(Boletin boletin,
			EstadoAlumno estadoAlumno) {
		// si no hay boletin cargado
		if (boletin == null) {
			return ConstantesPaneles.GRAY;
		}

		// si el boletin es valido
		if (isCargaBoletinValido(boletin, estadoAlumno)) {
			return ConstantesPaneles.GREEN;
		}

		// si es cualquier otro caso fuera de los casos contemplados
		return ConstantesPaneles.RED;
	}

	/**
	 * Esta funcion retorna verdadero o falso de acuerdo a los diferentes casos.
	 * 
	 * Un trimestre cargado correctamente implica tener las notas seteadas de
	 * ese trimestre como así también sus inasistencias y cantidad de días
	 * hábiles si es que corresponden, ya que los mismos pueden haberse no
	 * cargado porque no se conocían dichos valores (Check Sin Dato).
	 * 
	 * El cerrar un boletín significa tener cargados los tres trimestres, la
	 * nota final, la columna de aprobado con diciembre y marzo que corresponda
	 * y sus inasistencias y su cantidad de días hábiles.
	 * 
	 * @param boletin
	 * @return Boolean
	 */
	public Boolean isCargaBoletinValido(Boletin boletin,
			EstadoAlumno estadoAlumno) {

		if (estadoAlumno.equals(EstadoAlumno.PENDIENTE)
				|| estadoAlumno
						.equals(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION)) {
			if (boletinFinalizado(boletin))
				return true;
			else
				return false;
		} else {
			// retorna true si el primer trimestre esta cargado y false en caso
			// contrario
			Boolean cargo1T = cargaPrimerTrimestre(
					boletin.getTrimestres().get(0), boletin);

			// retorna true si el segundo trimestre esta cargado y false en caso
			// contrario
			Boolean cargo2T = cargaSegundoTrimestre(boletin.getTrimestres()
					.get(1), boletin);

			// retorna true si el tercer trimestre esta cargado y false en caso
			// contrario
			Boolean cargo3T = cargaTercerTrimestre(
					boletin.getTrimestres().get(2), boletin);

			Date fechaActual = new Date();

			if (fechaActual.before(boletin.getCiclo().getFecha1T()))
				return cargo1T;
			else if (fechaActual.before(boletin.getCiclo().getFecha2T()))
				return cargo1T && cargo2T;
			else
				return cargo1T && cargo2T && cargo3T;
		}
	}

	public boolean boletinFinalizado(Boletin boletin) {

		if (boletin == null)
			return false;

		boolean finalizado = true;

		/*
		 * No se tendrá en cuenta la completitud de los días hábiles del
		 * trimentre ni de las inasistecias
		 */

		if (finalizado) {
			Trimestre primero = boletin.getTrimestres().get(0);
			finalizado = materiasCargadasDelTrimestre(primero);
			if (finalizado) {
				Trimestre segundo = boletin.getTrimestres().get(1);
				finalizado = materiasCargadasDelTrimestre(segundo);

				if (finalizado) {
					Trimestre tercero = boletin.getTrimestres().get(2);
					finalizado = materiasCargadasDelTrimestre(tercero);

					if (finalizado) {
						Trimestre nFinal = boletin.getTrimestres().get(3);
						finalizado = materiasCargadasDelTrimestre(nFinal);
						if (finalizado) {
							Trimestre diciembre = boletin.getTrimestres()
									.get(4);
							Trimestre marzo = boletin.getTrimestres().get(5);
							Trimestre noAprueba = boletin.getTrimestres()
									.get(6);
							finalizado = noApruebaCompleto(noAprueba,
									diciembre, marzo);
						}
					}
				}
			}
		}
		return finalizado;
	}

	private boolean materiasCargadasDelTrimestre(Trimestre trimestre) {
		boolean finalizado = true;
		List<NotaMateria> notasMaterias = trimestre.getMaterias();
		for (int i = 0; i < notasMaterias.size(); i++) {
			if (notasMaterias.get(i).getCalificacion()
					.equals(CalificacionMateria.SIN_CARGAR)) {
				finalizado = false;
				break;
			}
		}
		return finalizado;
	}

	private boolean noApruebaCompleto(Trimestre trimestreNoAp,
			Trimestre diciembre, Trimestre marzo) {
		boolean finalizado = true;
		List<NotaMateria> noAprueba = trimestreNoAp.getMaterias();
		List<NotaMateria> dic = diciembre.getMaterias();
		List<NotaMateria> mar = marzo.getMaterias();

		for (int i = 0; i < noAprueba.size(); i++) {
			if (((noAprueba.get(i).isNoAprueba()) && ((dic.get(i)
					.getCalificacion().equals(CalificacionMateria.SIN_CARGAR)) && (mar
					.get(i).getCalificacion()
					.equals(CalificacionMateria.SIN_CARGAR))))
					|| (!(noAprueba.get(i).isNoAprueba()) && (!(dic.get(i)
							.getCalificacion()
							.equals(CalificacionMateria.SIN_CARGAR)) || !(mar
							.get(i).getCalificacion()
							.equals(CalificacionMateria.SIN_CARGAR)))))

			{
				finalizado = false;
				break;
			}
		}
		return finalizado;
	}

	private boolean cargaPrimerTrimestre(Trimestre trimestre, Boletin boletin) {
		boolean finalizado = true;

		List<NotaMateria> notasMaterias = trimestre.getMaterias();

		/*
		 * No se tendrá en cuenta la completitud de los días hábiles del
		 * trimentre ni de las inasistecias
		 */

		if (finalizado) {
			for (int i = 0; i < notasMaterias.size(); i++) {
				if (notasMaterias.get(i).getCalificacion()
						.equals(CalificacionMateria.SIN_CARGAR)) {
					finalizado = false;
					break;
				}
			}
		}
		return finalizado;
	}

	private boolean cargaSegundoTrimestre(Trimestre trimestre, Boletin boletin) {
		boolean finalizado = true;
		List<NotaMateria> notasMaterias = trimestre.getMaterias();

		if (finalizado) {
			for (int i = 0; i < notasMaterias.size(); i++) {

				if (notasMaterias.get(i).getCalificacion()
						.equals(CalificacionMateria.SIN_CARGAR)) {
					finalizado = false;
					break;
				}
			}
		}
		return finalizado;
	}

	private boolean cargaTercerTrimestre(Trimestre trimestre, Boletin boletin) {
		boolean finalizado = true;
		List<NotaMateria> notasMaterias = trimestre.getMaterias();

		if (finalizado) {
			for (int i = 0; i < notasMaterias.size(); i++) {

				if (notasMaterias.get(i).getCalificacion()
						.equals(CalificacionMateria.SIN_CARGAR)) {
					finalizado = false;
					break;
				}
			}
		}
		return finalizado;
	}

	@RequestMapping("/entrevistas/editarMateriaPrevia.do")
	public ModelAndView editarMateriaPrevia(
			@RequestParam("idAlumno") Long idAlumno,
			@RequestParam("idPrevia") Long idMateriaPrevia,
			@RequestParam("ciclo") String cicloPrevia,
			@RequestParam(required = false, value = "edicion") Boolean edicion,
			@RequestParam(required = false, value = "inasistenciasPrimer") Float inasistenciasPrimer,
			@RequestParam(required = false, value = "inasistenciasSegundo") Float inasistenciasSegundo,
			@RequestParam(required = false, value = "inasistenciasTercer") Float inasistenciasTercer,
			@RequestParam(required = false, value = "diasPrimer") Float diasPrimer,
			@RequestParam(required = false, value = "diasSegundo") Float diasSegundo,
			@RequestParam(required = false, value = "diasTercer") Float diasTercer,
			@RequestParam(required = false, value = "conductaPrimer") Integer conductaPrimer,
			@RequestParam(required = false, value = "conductaSegundo") Integer conductaSegundo,
			@RequestParam(required = false, value = "conductaTercer") Integer conductaTercer,
			@RequestParam(required = false, value = "regular") Boolean regular) {
		Map<String, Object> model = new HashMap<String, Object>();
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);

		// guarda los datos ingresados del boletin para que no se pierdan
		Boletin boletin = perfil.getBoletin();
		boletin.setInasistenciasPrimerTrimestre(inasistenciasPrimer);
		boletin.setInasistenciasSegundoTrimestre(inasistenciasSegundo);
		boletin.setInasistenciasTercerTrimestre(inasistenciasTercer);
		boletin.setDiasHabilesPrimerTrimestre(diasPrimer);
		boletin.setDiasHabilesSegundoTrimestre(diasSegundo);
		boletin.setDiasHabilesTercerTrimestre(diasTercer);
		boletin.setConductaPrimerTrimestre(conductaPrimer != null ? ConductaAlumno
				.getConductaAlumno(conductaPrimer) : null);
		boletin.setConductaSegundoTrimestre(conductaSegundo != null ? ConductaAlumno
				.getConductaAlumno(conductaSegundo) : null);
		boletin.setConductaTercerTrimestre(conductaTercer != null ? ConductaAlumno
				.getConductaAlumno(conductaTercer) : null);
		boletin.setRegular(regular);
		srvBoletin.agregarBoletin(boletin);

		List<Materia> materiasTodas = srvMateria.obtenerTodos();
		model.put("materiasTodas", materiasTodas);
		model.put("idPrevia", idMateriaPrevia);
		model.put("cicloPrevia", cicloPrevia);
		model.put("boletin", boletin);
		model.put("alumno", perfil);
		model.put("edicion", edicion);
		model.put("cicloAnteriorPrevia", cicloPrevia);

		return new ModelAndView("/entrevistas/altaMateriaPrevia", model);

	}

	/**
	 * Crea la nueva columna de No aprueba, por default setea noAprueba en false
	 * 
	 * @param notasMaterias
	 * @param materias
	 */
	private void crearNotasNoAprueba(List<NotaMateria> notasMaterias,
			List<Materia> materias) {
		for (Materia materiaObj : materias) {
			NotaMateria notaMateria = new NotaMateria();
			notaMateria.setMateria(materiaObj);
			notaMateria.setNoAprueba(false);
			notasMaterias.add(notaMateria);
			srvNotaMateria.agregarNotaMateria(notaMateria);

		}

	}

	@RequestMapping("/entrevistas/modificarNotaNoAprueba.do")
	public void modificarNotaNoAprueba(HttpServletResponse response,
			@RequestParam("idAlumno") Long idAlumno,
			@RequestParam("index") Integer index,
			@RequestParam("noAprueba") Boolean noAprueba) {
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		Boletin boletin = perfil.getBoletin();

		Trimestre notasPreviasNoAprueba = perfil.getBoletin().getTrimestres()
				.get(6);
		List<NotaMateria> listaNotas = notasPreviasNoAprueba.getMaterias();
		NotaMateria notaNoAprueba = listaNotas.get(index);
		notaNoAprueba.setNoAprueba(noAprueba);

		srvBoletin.agregarBoletin(boletin);

	}

	@RequestMapping("/entrevistas/verBoletinView.do")
	public ModelAndView verBoletinView(
			@RequestParam(required = false, value = "idPerfilAlumno") Long id,
			@RequestParam(required = false, value = "urlInforme") String urlInforme) {
		Map<String, Object> model = new HashMap<String, Object>();
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(id);
		model.put("urlInforme", urlInforme);

		// es una edicion de boletin
		if (perfil.getBoletin() != null) {

			return modificarBoletin(id, urlInforme);
		} else {
			return altaBoletinView(id, urlInforme);
		}
	}

	/***************************************************************************************************
	 ************************************************ FIN BOLETÍN ******************************************
	 ***************************************************************************************************/

	/**
	 * Solo permite para alumnos que esten en 7mo grado o que esten en 6to y no
	 * tengan año adicional
	 * 
	 * @param alumno
	 * @return
	 */
	private static boolean permiteElegirEgreso(PerfilAlumno alumno) {
		boolean sexto = false;
		// if(alumno.getAnioEscolar().equals(AnioEscolar.SEXTO_SEC))
		// sexto = !alumno.getAnioAdicional();
		if (alumno.getEae().equals("6/6")) {
			if (alumno.getAnioEscolar().equals(AnioEscolar.SEXTO_SEC))
				sexto = !alumno.getAnioAdicional();
		}
		if (alumno.getEae().equals("7/5")) {
			if (alumno.getAnioEscolar().equals(AnioEscolar.SEXTO_SEC))
				sexto = alumno.getAnioAdicional();
			if (alumno.getAnioEscolar().equals(AnioEscolar.QUINTO_SEC))
				if (alumno.getAnioAdicional() == true) {
					sexto = alumno.getAnioAdicional();
				} else {
					sexto = !alumno.getAnioAdicional();
				}

		}

		return alumno.getAnioEscolar().equals(AnioEscolar.SEPTIMO_SEC)
				|| alumno.getAnioEscolar().equals(AnioEscolar.RECIBIDO)
				|| sexto;
	}

	/**
	 * Muestra la lista de todas las entrevistas grupales del RR que se
	 * encuentran en la BD.
	 * 
	 * @param req
	 * @param use
	 * @return la vista con todas las entrevistas grupales
	 */
	@RequestMapping("/entrevistas/listarEntrevistasGrupalesRR.do")
	public ModelAndView listarEntrevistasGrupalesRR(HttpServletRequest req) {
		HashMap<String, Object> model = new HashMap<String, Object>();

		PerfilRR perfilRR = getPerfilRR(req);
		List<EntrevistaGrupal> entrevistas = new ArrayList<EntrevistaGrupal>();
		CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		if (perfilRR != null) {
			entrevistas = srvEntrevistas.obtenerEntrevistasGrupalesPorRR(
					perfilRR.getIdPerfilRR(), cicloActual);
			model.put("idRr", perfilRR.getIdPerfilRR());
			model.put("rr", perfilRR.getDatosPersonales());
		}
		model.put("entrevistas", entrevistas);

		return forward("/entrevistas/listaEntrevistasGrupales", model);
	}

	@RequestMapping("/entrevistas/exportarEntrevistasGrupales.do")
	public ModelAndView exportarEntrevistasGrupales(
			@RequestParam("entrevistaId") Long entrevistaId) {
		Map<String, Object> resul = new HashMap<String, Object>();
		// List<EventoGenerico> eventos = new ArrayList<EventoGenerico>();
		// PerfilEA ea = this.getPerfilEA(request);
		// if (ea != null) {
		// eventos = eventoGenericoSrv.getListaEventosGenericosPorEA(ea);
		// resul.put("idEa", ea.getIdPerfilEA());
		// resul.put("idEa", ea.getIdPerfilEA());
		resul.put("entrevistaId", entrevistaId);
		// ////System.out.println(entrevistaId);
		// }
		// resul.put("eventos", eventos);
		// return forward("/eventoGenerico/listaEventosGenericos", resul);

		String excelView = null;
		excelView = "exportarEntrevistasGrupalesView";

		// return forward(excelView, map);
		return new ModelAndView(excelView, resul);

	}

	@RequestMapping("/entrevistas/exportarEntrevistasGrupalesTodos.do")
	public ModelAndView exportarEntrevistasGrupalesTodos(
			@RequestParam("idPerfilEA") Long idEvento,
			@RequestParam("ciclo") String ciclo) {
		Map<String, Object> resul = new HashMap<String, Object>();

		resul.put("entrevistaId", idEvento);
		resul.put("ciclo", ciclo);
		// ////System.out.println(idEvento);

		String excelView = null;
		excelView = "exportarEntrevistasGrupalesView";

		return new ModelAndView(excelView, resul);

	}

	@RequestMapping("/entrevistas/exportarEntrevistasGrupalesTodosRR.do")
	public ModelAndView exportarEntrevistasGrupalesTodosRR(
			@RequestParam("idPerfilRR") Long idEvento) {
		Map<String, Object> resul = new HashMap<String, Object>();

		resul.put("entrevistaId", idEvento);
		// ////System.out.println(idEvento);

		String excelView = null;
		excelView = "exportarEntrevistasGrupalesViewRR";

		return new ModelAndView(excelView, resul);

	}

	/**
	 * Elimina la relación de la entrevista individual con la grupal a la cual
	 * hace referencia
	 * 
	 * @param req
	 * @param idEntrevista
	 * @param idTipoEntrevista
	 * @param valorPerfil
	 * @param request
	 * @return
	 */
	@RequestMapping("/entrevistas/elimiarEntrevistaGrupalSuperUsuarioView.do")
	public ModelAndView elimiarEntrevistaGrupalSuperUsuario(
			HttpServletRequest req,
			@RequestParam("entrevistaId") Long idEntrevista,
			@RequestParam(required = false, value = "valorPerfil") String valorPerfil,
			HttpServletRequest request) {

		ModelAndView modelView = new ModelAndView();
		String mensaje = "";
		String error = "";
		EntrevistaGrupal entrevistaGrupal = null;
		EntrevistaIndividual entrevistaIndividual = null;
		boolean eliminarGrupal = false;
		HashMap<String, Object> model = new HashMap<String, Object>();
		PerfilRR perfilRR = getPerfilRR(req);
		List<EntrevistaGrupal> entrevistas = new ArrayList<EntrevistaGrupal>();
		CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		if (StringUtils.isNotBlank(valorPerfil)
				&& valorPerfil.equals("superUsuario")) {
			req.getSession().setAttribute("retorno", "superUsuario");
			entrevistaIndividual = (EntrevistaIndividual) srvEntrevistas
					.obtenerEntrevista(idEntrevista);
			entrevistaGrupal = entrevistaIndividual.getEntrevistaGrupal();
			entrevistaIndividual.setEntrevistaGrupal(null);
			entrevistaGrupal.getEntrevistasIndividuales().remove(
					entrevistaIndividual);
		} else {
			entrevistaGrupal = srvEntrevistas
					.obtenerEntrevistaGrupal(idEntrevista);
			eliminarGrupal = true;
		}

		PerfilEA ea = entrevistaGrupal.getEa();
		ea.getHistorialEntrevistas().remove(entrevistaGrupal);

		try {
			if (entrevistaGrupal.getEntrevistasIndividuales() == null
					|| entrevistaGrupal.getEntrevistasIndividuales().isEmpty())
				srvEntrevistas.eliminarEntrevista(entrevistaGrupal);
			else
				srvEntrevistas.guardarEntrevista(entrevistaGrupal);
			if (eliminarGrupal) {
				mensaje = "Se eliminó satisfactoriamente la entrevista grupal seleccionada";
				if (perfilRR != null) {
					entrevistas = srvEntrevistas
							.obtenerEntrevistasGrupalesPorRR(
									perfilRR.getIdPerfilRR(), cicloActual);
					model.put("idRr", perfilRR.getIdPerfilRR());
					model.put("rr", perfilRR.getDatosPersonales());
				}
				model.put("entrevistas", entrevistas);
			} else {
				srvEntrevistas.guardarEntrevista(entrevistaIndividual);
				mensaje = "Se eliminó satisfactoriamente al becado/a de la entrevista grupal";
			}
		} catch (Exception e) {
			error = "Se produjo un error al querer eliminar la entrevista grupal seleccionada";
			log.error("****************************", e.getCause());
			if (eliminarGrupal) {
				if (perfilRR != null) {
					entrevistas = srvEntrevistas
							.obtenerEntrevistasGrupalesPorRR(
									perfilRR.getIdPerfilRR(), cicloActual);
					model.put("idRr", perfilRR.getIdPerfilRR());
					model.put("rr", perfilRR.getDatosPersonales());
				}
				model.put("entrevistas", entrevistas);
				model.put("error", error);
				modelView = forward("/entrevistas/listaEntrevistasGrupales",
						model);
			} else {
				modelView = new ModelAndView(
						"redirect:/exportacionEntrevistas/verExportarEntrevistas.do?error="
								+ error);
			}
		}
		if (StringUtils.isNotBlank(error))
			return modelView;
		else {
			if (eliminarGrupal) {
				if (perfilRR != null) {
					entrevistas = srvEntrevistas
							.obtenerEntrevistasGrupalesPorRR(
									perfilRR.getIdPerfilRR(), cicloActual);
					model.put("idRr", perfilRR.getIdPerfilRR());
					model.put("rr", perfilRR.getDatosPersonales());
				}
				model.put("entrevistas", entrevistas);
				model.put("mensaje", mensaje);
				return forward("/entrevistas/listaEntrevistasGrupales", model);
			} else
				return new ModelAndView(
						"redirect:/exportacionEntrevistas/verExportarEntrevistas.do?mensaje="
								+ mensaje);
		}
	}

	private void modificarEstadoEntrevista(
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape) {
		if (valor.equals("f")) {
			entrevistaIndividual
					.setEstadoEntrevista(EstadoEntrevista.FINALIZADA);
		} else {
			entrevistaIndividual
					.setEstadoEntrevista(EstadoEntrevista.CONSTRUCCION);
		}
		ape.setEntrevistasFinalizadas(false);
	}

	private void modificarEntrevistaIncorporacionIncorpora(
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, EntrevistaReIncorporacion incorporacion,
			Entrevista entrevista, FichaPresentacion fp, List<Pago> pagos,
			PerfilAlumno p) {
		this.modificarEstadoEntrevista(entrevistaIndividual, valor, ape);
		p.setEstadoAlumno(EstadoAlumno.ALTA_BECADO);
		if (p.getFechaReincorporacionPBE() != null) // es un chico reincorporado
			p.setFechaReincorporacionPBE(null);
		else
			p.setFechaPBE(null);
		p.getHistorialEntrevistas().remove(entrevista);
		if (ape != null) {
			ape.actualizarEntrevista(incorporacion.getEstadoEntrevista());
			ape.setPagosRealizados(ape.getPagosRealizados() - 1);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS1(ConstantesPaneles.GRAY);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (fp != null)
			srvFichaPresentacion.eliminarInformeFP(fp);
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		srvEntrevistas.guardarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void modificarEntrevistaIncorporacionPendiente(
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, EntrevistaReIncorporacion incorporacion,
			Entrevista entrevista, List<Pago> pagos, PerfilAlumno p) {
		this.modificarEstadoEntrevista(entrevistaIndividual, valor, ape);
		p.setEstadoAlumno(EstadoAlumno.ALTA_BECADO);
		p.getHistorialEntrevistas().remove(entrevista);
		if (ape != null) {
			ape.actualizarEntrevista(incorporacion.getEstadoEntrevista());
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS1(ConstantesPaneles.GRAY);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		srvEntrevistas.guardarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void modificarEntrevistaIncorporacionNoIncorpora(
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, EntrevistaReIncorporacion incorporacion,
			Entrevista entrevista, List<Pago> pagos, PerfilAlumno p, Beca beca) {
		this.modificarEstadoEntrevista(entrevistaIndividual, valor, ape);
		p.setEstadoAlumno(EstadoAlumno.ALTA_BECADO);
		p.setBeca(beca);
		p.getHistorialEntrevistas().remove(entrevista);
		p.setMotivoBaja(null);
		p.setPeriodoDeBaja(null);
		p.setFechaBaja(null);
		p.setProyeccionEntrevistaFinal(null);
		p.setUltimaActualizacion(null);
		p.setFechaSituacionActual(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.setOtraSituacion(null);
		p.setFechaProyeccionDeseada(null);
		p.setProyeccionDeseada(null);
		p.setOtraProyeccion(null);
		p.setObsPostPBE(null);
		p.setPeriodoDeEgreso(null);
		p.setSituacionActual(null);
		if (ape != null) {
			ape.actualizarEntrevista(incorporacion.getEstadoEntrevista());
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS1(ConstantesPaneles.GRAY);
			ape.setActivo(true);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		p.getHistorialBeca().remove(beca);
		if (beca != null) {
			beca.setCantidadAsignada(beca.getCantidadAsignada() + 1);
			svrBeca.guardarBeca(beca);
		}
		srvEntrevistas.guardarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private String guardarEntrevistaIncorporacion(
			EntrevistaReIncorporacion incorporacion, List<Pago> pagos,
			Entrevista entrevista, EntrevistaIndividual entrevistaIndividual,
			String valor, AlumnoPanelEA ape, Long id, PerfilAlumno p, Beca beca) {
		String mensaje = "";
		String ok = "redirect://exportacionEntrevistas/verExportarEntrevistas.do?mensaje=";
		String error = "redirect://exportacionEntrevistas/verExportarEntrevistas.do?error=";
		if (incorporacion.getIncorporacion() != null
				&& incorporacion.getIncorporacion().equals(
						EvaluacionIncorporacion.INCORPORA)) {
			FichaPresentacion fp = srvFichaPresentacion
					.obtenerInformePorAlumno(id);
			if (pagos != null) {
				if (!pagos.get(0).getEstadoPago().equals(EstadoPago.REALIZADO)) {
					if (fp != null) {
						if (!fp.getEstado().equals(EstadoInforme.ENVIADO)) {
							this.modificarEntrevistaIncorporacionIncorpora(
									entrevistaIndividual, valor, ape,
									incorporacion, entrevista, fp, pagos, p);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						} else {
							mensaje = error
									+ "No se puede modificar el estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " porque la Ficha de Presentación ya ha sido enviada al padrino";
						}
					} else {
						this.modificarEntrevistaIncorporacionIncorpora(
								entrevistaIndividual, valor, ape,
								incorporacion, entrevista, fp, pagos, p);
						mensaje = ok + "El estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " ha sido modificado satisfactoriamente";
					}
				} else {
					mensaje = error
							+ "No se puede modificar el estado de la entrevista del becado "
							+ p.getDatosPersonales().getApellidoNombre()
							+ " porque el pago ya ha sido realizado";
				}
			} else {
				if (fp != null) {
					if (!fp.getEstado().equals(EstadoInforme.ENVIADO)) {
						this.modificarEntrevistaIncorporacionIncorpora(
								entrevistaIndividual, valor, ape,
								incorporacion, entrevista, fp, pagos, p);
						mensaje = ok + "El estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " ha sido modificado satisfactoriamente";
					} else {
						mensaje = error
								+ "No se puede modificar el estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " porque la Ficha de Presentación ya ha sido enviada al padrino";
					}
				} else {
					this.modificarEntrevistaIncorporacionIncorpora(
							entrevistaIndividual, valor, ape, incorporacion,
							entrevista, fp, pagos, p);
					mensaje = ok + "El estado de la entrevista del becado "
							+ p.getDatosPersonales().getApellidoNombre()
							+ " ha sido modificado satisfactoriamente";
				}
			}
		} else {
			if (incorporacion.getIncorporacion() != null
					&& incorporacion.getIncorporacion().equals(
							EvaluacionIncorporacion.INCORPORAPENDIENTE)) {
				this.modificarEntrevistaIncorporacionPendiente(
						entrevistaIndividual, valor, ape, incorporacion,
						entrevista, pagos, p);
				mensaje = ok + "El estado de la entrevista del becado "
						+ p.getDatosPersonales().getApellidoNombre()
						+ " ha sido modificado satisfactoriamente";
			} else {
				if (incorporacion.getIncorporacion() != null
						&& incorporacion.getIncorporacion().equals(
								EvaluacionIncorporacion.NOINCORPORA)) {
					this.modificarEntrevistaIncorporacionNoIncorpora(
							entrevistaIndividual, valor, ape, incorporacion,
							entrevista, pagos, p, beca);

					// alta de fecha de baja de beca

					mensaje = ok + "El estado de la entrevista del becado "
							+ p.getDatosPersonales().getApellidoNombre()
							+ " ha sido modificado satisfactoriamente";
				}
			}
		}
		return mensaje;
	}

	private void modificarEntrevistaRenovacionRenueva(
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, EntrevistaRenovacion renovacion,
			Entrevista entrevista, InformeIS1 is1, List<Pago> pagos,
			PerfilAlumno p, Boletin boletin, FichaPresentacion fp) {
		this.modificarEstadoEntrevista(entrevistaIndividual, valor, ape);
		p.setEstadoAlumno(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION);
		p.setAnioEscolar(decrementarAnioEscolar(p.getAnioEscolar(),
				p.getAnioAdicional(), renovacion.getSituacionEscolarMergeada()));
		p.setBoletin(boletin);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.getHistorialEntrevistas().remove(entrevista);
		p.getHistorialBoletin().remove(boletin);
		if (ape != null) {
			ape.actualizarEntrevista(renovacion.getEstadoEntrevista());
			ape.setPagosRealizados(ape.getPagosRealizados() - 1);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setRenovacionPendiente(true);
			ape.setColorBoletin(ConstantesPaneles.GREEN);
			ape.setColorIS1(ConstantesPaneles.RED);
			ape.setAnio(decrementarAnioEscolar(p.getAnioEscolar(),
					p.getAnioAdicional(),
					renovacion.getSituacionEscolarMergeada()));
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (is1 != null)
			srvInformeIS1.eliminarInformeIS1(is1);
		if (fp != null) {
			if (fp.getFpPorReasignacion()) {
				fp.setEstado(EstadoInforme.PENDIENTE_POR_RENOVACION);
				fp.setFechaCambioUltimoEstado(new Date());
				srvFichaPresentacion.guardarInformeFP(fp);
			}
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		srvEntrevistas.guardarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private AnioEscolar decrementarAnioEscolar(AnioEscolar anioEscolar,
			Boolean anioAdicional, SituacionEscolarMergeada situacionEscolar) {
		if (situacionEscolar
				.equals(SituacionEscolarMergeada.PROMOVIDO_CON_PREVIAS)
				|| situacionEscolar.equals(SituacionEscolarMergeada.PROMOVIDO)) {
			if (anioEscolar.equals(AnioEscolar.RECIBIDO) && !anioAdicional)
				return AnioEscolar.getAnioEscolar(anioEscolar.getId() - 2);
			else
				return AnioEscolar.getAnioEscolar(anioEscolar.getId() - 1);
		} else
			return anioEscolar;
	}

	private void modificarEntrevistaRenovacionPendiente(
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, EntrevistaRenovacion renovacion,
			Entrevista entrevista, ComunicadoPendiente comunicadoPendiente,
			List<Pago> pagos, PerfilAlumno p, FichaPresentacion fp) {
		this.modificarEstadoEntrevista(entrevistaIndividual, valor, ape);
		p.setEstadoAlumno(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.getHistorialEntrevistas().remove(entrevista);
		if (ape != null) {
			ape.actualizarEntrevista(renovacion.getEstadoEntrevista());
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS1(ConstantesPaneles.RED);
			ape.setRenovacionPendiente(true);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (comunicadoPendiente != null)
			svrComunicadoPendiente
					.eliminarComunicadoPendiente(comunicadoPendiente);
		if (fp != null) {
			if (fp.getFpPorReasignacion()
					&& !fp.getEstado().equals(EstadoInforme.ENVIADO)) {
				fp.setEstado(EstadoInforme.PENDIENTE_POR_RENOVACION);
				fp.setFechaCambioUltimoEstado(new Date());
				srvFichaPresentacion.guardarInformeFP(fp);
			}
		}
		srvEntrevistas.guardarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void modificarEntrevistaRenovacionNoRenueva(
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, EntrevistaRenovacion renovacion,
			Entrevista entrevista,
			ComunicadoNoRenovacion comunicadoNoRenovacion, List<Pago> pagos,
			PerfilAlumno p, Beca beca, FichaPresentacion fp) {
		this.modificarEstadoEntrevista(entrevistaIndividual, valor, ape);
		p.setEstadoAlumno(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION);
		p.setBeca(beca);
		p.setMotivoBaja(null);
		p.setPeriodoDeBaja(null);
		p.setFechaBaja(null);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.setProyeccionEntrevistaFinal(null);
		p.setUltimaActualizacion(null);
		p.setFechaSituacionActual(null);
		p.setOtraSituacion(null);
		p.setFechaProyeccionDeseada(null);
		p.setProyeccionDeseada(null);
		p.setOtraProyeccion(null);
		p.setObsPostPBE(null);
		p.setPeriodoDeEgreso(null);
		p.setSituacionActual(null);
		p.getHistorialEntrevistas().remove(entrevista);
		p.getHistorialBeca().remove(beca);
		if (ape != null) {
			ape.actualizarEntrevista(renovacion.getEstadoEntrevista());
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS1(ConstantesPaneles.RED);
			ape.setActivo(true);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (comunicadoNoRenovacion != null)
			svrComunicadoNoRenovacion
					.eliminarComunicadoNoRenovacion(comunicadoNoRenovacion);
		if (fp != null) {
			if (fp.getFpPorReasignacion()
					&& !fp.getEstado().equals(EstadoInforme.ENVIADO)) {
				fp.setEstado(EstadoInforme.PENDIENTE_POR_RENOVACION);
				fp.setFechaCambioUltimoEstado(new Date());
				srvFichaPresentacion.guardarInformeFP(fp);
			}
		}
		if (beca != null) {
			beca.setCantidadAsignada(beca.getCantidadAsignada() + 1);
			svrBeca.guardarBeca(beca);
		}

		srvEntrevistas.guardarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private String guardarEntrevistaRenovacion(EntrevistaRenovacion renovacion,
			List<Pago> pagos, Entrevista entrevista,
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, PerfilAlumno p, Beca beca) {
		String mensaje = "";
		String ok = "redirect://exportacionEntrevistas/verExportarEntrevistas.do?mensaje=";
		String error = "redirect://exportacionEntrevistas/verExportarEntrevistas.do?error=";
		if (renovacion.getEvaluacionRenovacionMergeada() != null
				&& renovacion.getEvaluacionRenovacionMergeada().equals(
						EvaluacionRenovacionMergeada.RENUEVA)) {
			InformeIS1 is1 = srvInformeIS1.obtenerInformePorAlumno(p.getId(),
					renovacion.getPeriodoDePago().getCiclo());
			FichaPresentacion fp = null;
			if (is1 != null)
				fp = is1.getFp();
			else {
				FichaPresentacion fpRevision = srvFichaPresentacion
						.obtenerInformePorAlumnoPorCiclo(renovacion
								.getPeriodoDePago().getCiclo(), p.getId());
				if (fpRevision != null)
					if (fpRevision.getFpPorReasignacion()
							&& fpRevision.getPadrino().equals(
									p.getBeca().getPadrino()))
						fp = fpRevision;
			}
			Long idBoletin = null;
			if (p.getHistorialBoletin() != null
					&& p.getHistorialBoletin().size() > 0)
				idBoletin = p.getHistorialBoletin()
						.get(p.getHistorialBoletin().size() - 1).getId();
			Boletin boletin = null;
			if (idBoletin != null)
				boletin = svrBoletin.obtenerPorId(idBoletin);
			if (pagos != null) {
				if (!pagos.get(0).getEstadoPago().equals(EstadoPago.REALIZADO)) {
					if (is1 != null) {
						if (!is1.getEstado().equals(EstadoInforme.ENVIADO)) {
							if (fp != null) {
								if (!fp.getEstado().equals(
										EstadoInforme.ENVIADO)) {
									this.modificarEntrevistaRenovacionRenueva(
											entrevistaIndividual, valor, ape,
											renovacion, entrevista, is1, pagos,
											p, boletin, fp);
									mensaje = ok
											+ "El estado de la entrevista del becado "
											+ p.getDatosPersonales()
													.getApellidoNombre()
											+ " ha sido modificado satisfactoriamente";
								} else {
									mensaje = error
											+ "No se puede modificar el estado de la entrevista del becado "
											+ p.getDatosPersonales()
													.getApellidoNombre()
											+ " porque la Ficha de Presentación ya ha sido enviada al padrino";
								}
							} else {
								this.modificarEntrevistaRenovacionRenueva(
										entrevistaIndividual, valor, ape,
										renovacion, entrevista, is1, pagos, p,
										boletin, fp);
								mensaje = ok
										+ "El estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " ha sido modificado satisfactoriamente";
							}
						} else {
							mensaje = error
									+ "No se puede modificar el estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " porque el Informe de Seguimiento Nº1 ya ha sido enviado al padrino";
						}
					} else {
						if (fp != null) {
							if (!fp.getEstado().equals(EstadoInforme.ENVIADO)) {
								this.modificarEntrevistaRenovacionRenueva(
										entrevistaIndividual, valor, ape,
										renovacion, entrevista, is1, pagos, p,
										boletin, fp);
								mensaje = ok
										+ "El estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " ha sido modificado satisfactoriamente";
							} else {
								mensaje = error
										+ "No se puede modificar el estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " porque la Ficha de Presentación ya ha sido enviada al padrino";
							}
						} else {
							this.modificarEntrevistaRenovacionRenueva(
									entrevistaIndividual, valor, ape,
									renovacion, entrevista, is1, pagos, p,
									boletin, fp);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						}
					}
				} else {
					mensaje = error
							+ "No se puede modificar el estado de la entrevista del becado "
							+ p.getDatosPersonales().getApellidoNombre()
							+ " porque el pago ya ha sido realizado";
				}
			} else {
				if (is1 != null) {
					if (!is1.getEstado().equals(EstadoInforme.ENVIADO)) {
						if (fp != null) {
							if (!fp.getEstado().equals(EstadoInforme.ENVIADO)) {
								this.modificarEntrevistaRenovacionRenueva(
										entrevistaIndividual, valor, ape,
										renovacion, entrevista, is1, pagos, p,
										boletin, fp);
								mensaje = ok
										+ "El estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " ha sido modificado satisfactoriamente";
							} else {
								mensaje = error
										+ "No se puede modificar el estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " porque la Ficha de Presentación ya ha sido enviada al padrino";
							}
						} else {
							this.modificarEntrevistaRenovacionRenueva(
									entrevistaIndividual, valor, ape,
									renovacion, entrevista, is1, pagos, p,
									boletin, fp);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						}
					} else {
						mensaje = error
								+ "No se puede modificar el estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " porque el Informe de Seguimiento Nº1 ya ha sido enviado al padrino";
					}
				} else {
					if (fp != null) {
						if (!fp.getEstado().equals(EstadoInforme.ENVIADO)) {
							this.modificarEntrevistaRenovacionRenueva(
									entrevistaIndividual, valor, ape,
									renovacion, entrevista, is1, pagos, p,
									boletin, fp);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						} else {
							mensaje = error
									+ "No se puede modificar el estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " porque la Ficha de Presentación ya ha sido enviada al padrino";
						}
					} else {
						this.modificarEntrevistaRenovacionRenueva(
								entrevistaIndividual, valor, ape, renovacion,
								entrevista, is1, pagos, p, boletin, fp);
						mensaje = ok + "El estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " ha sido modificado satisfactoriamente";
					}
				}
			}
		} else {
			FichaPresentacion fpCicloActual = srvFichaPresentacion
					.obtenerInformePorAlumnoPorCiclo(renovacion
							.getPeriodoDePago().getCiclo(), p.getId());
			if (renovacion.getEvaluacionRenovacionMergeada() != null
					&& renovacion.getEvaluacionRenovacionMergeada().equals(
							EvaluacionRenovacionMergeada.PENDIENTE)) {
				PerfilPadrino padrino = beca.getPadrino();
				ComunicadoPendiente comunicadoPendiente = null;
				if (padrino.getTipo().equals(TipoPadrino.INDIVIDUAL)) {
					comunicadoPendiente = svrComunicadoPendiente
							.obtenerComunicadoPendientePorAlumno(p.getId(),
									renovacion.getPeriodoDePago().getCiclo());
				}
				if (comunicadoPendiente != null) {
					if (!comunicadoPendiente.getEstado().equals(
							EstadoInforme.ENVIADO)) {
						this.modificarEntrevistaRenovacionPendiente(
								entrevistaIndividual, valor, ape, renovacion,
								entrevista, comunicadoPendiente, pagos, p,
								fpCicloActual);
						mensaje = ok + "El estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " ha sido modificado satisfactoriamente";
					} else {
						mensaje = error
								+ "No se puede modificar el estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " porque el Comunicado de Renovación Pendiente ya ha sido enviado al padrino";
					}
				} else {
					this.modificarEntrevistaRenovacionPendiente(
							entrevistaIndividual, valor, ape, renovacion,
							entrevista, comunicadoPendiente, pagos, p,
							fpCicloActual);
					mensaje = ok + "El estado de la entrevista del becado "
							+ p.getDatosPersonales().getApellidoNombre()
							+ " ha sido modificado satisfactoriamente";
				}
			} else {
				if (renovacion.getEvaluacionRenovacionMergeada() != null
						&& renovacion.getEvaluacionRenovacionMergeada().equals(
								EvaluacionRenovacionMergeada.NO_RENUEVA)) {
					PerfilPadrino padrino = beca.getPadrino();
					ComunicadoNoRenovacion comunicadoNoRenovacion = null;
					// saque la restriccion de individual
					// if(padrino.getTipo().equals(TipoPadrino.INDIVIDUAL)){
					comunicadoNoRenovacion = svrComunicadoNoRenovacion
							.obtenerComunicadoNoRenovacionPorAlumno(p.getId(),
									renovacion.getPeriodoDePago().getCiclo());
					// }
					if (comunicadoNoRenovacion != null) {
						if (!comunicadoNoRenovacion.getEstado().equals(
								EstadoInforme.ENVIADO)) {
							this.modificarEntrevistaRenovacionNoRenueva(
									entrevistaIndividual, valor, ape,
									renovacion, entrevista,
									comunicadoNoRenovacion, pagos, p, beca,
									fpCicloActual);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						} else {
							mensaje = error
									+ "No se puede modificar el estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " porque el Comunicado de No Renovación ya ha sido enviado al padrino";
						}
					} else {
						this.modificarEntrevistaRenovacionNoRenueva(
								entrevistaIndividual, valor, ape, renovacion,
								entrevista, comunicadoNoRenovacion, pagos, p,
								beca, fpCicloActual);
						mensaje = ok + "El estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " ha sido modificado satisfactoriamente";
					}
				}
			}
		}
		return mensaje;
	}

	private void modificarEntrevistaMensualCesacion(
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, Entrevista entrevista, InformeCesacion ic,
			List<Pago> pagos, PerfilAlumno p, Beca beca) {
		this.modificarEstadoEntrevista(entrevistaIndividual, valor, ape);
		p.setBeca(beca);
		p.setMotivoBaja(null);
		p.setPeriodoDeBaja(null);
		p.setFechaBaja(null);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.setProyeccionEntrevistaFinal(null);
		p.setUltimaActualizacion(null);
		p.setFechaSituacionActual(null);
		p.setOtraSituacion(null);
		p.setFechaProyeccionDeseada(null);
		p.setProyeccionDeseada(null);
		p.setOtraProyeccion(null);
		p.setObsPostPBE(null);
		p.setPeriodoDeEgreso(null);
		p.setSituacionActual(null);
		p.getHistorialEntrevistas().remove(entrevista);
		p.getHistorialBeca().remove(beca);
		if (ape != null) {
			if (ape.getColorIS1() != null
					&& ape.getColorIS1().equals(ConstantesPaneles.GRAY))
				p.setEstadoAlumno(EstadoAlumno.INCORPORADO);
			else
				p.setEstadoAlumno(EstadoAlumno.RENOVADO);
			ape.actualizarEntrevista(entrevistaIndividual.getEstadoEntrevista());
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setActivo(true);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (ic != null)
			srvCesacion.eliminarInformeCesacion(ic);

		if (beca != null) {
			beca.setCantidadAsignada(beca.getCantidadAsignada() + 1);
			svrBeca.guardarBeca(beca);
		}

		srvEntrevistas.guardarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void modificarEntrevistaMensual(
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, Entrevista entrevista, List<Pago> pagos,
			PerfilAlumno p, boolean noSuspendida) {
		this.modificarEstadoEntrevista(entrevistaIndividual, valor, ape);
		p.getHistorialEntrevistas().remove(entrevista);
		if (ape != null) {
			ape.actualizarEntrevista(entrevistaIndividual.getEstadoEntrevista());
			if (noSuspendida)
				ape.setPagosRealizados(ape.getPagosRealizados() - 1);
			ape.setColorPagos(ConstantesPaneles.RED);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}

		srvEntrevistas.guardarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private String guardarEntrevistaMensual(List<Pago> pagos,
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, PerfilAlumno p, Beca beca, Entrevista entrevista) {
		String mensaje = "";
		String ok = "redirect://exportacionEntrevistas/verExportarEntrevistas.do?mensaje=";
		String error = "redirect://exportacionEntrevistas/verExportarEntrevistas.do?error=";
		if (entrevistaIndividual.getEvaluacionCobroBeca() != null
				&& entrevistaIndividual.getEvaluacionCobroBeca().equals(
						EvaluacionCobroBeca.CESADO)) {
			InformeCesacion ic = srvCesacion.obtenerInformeCesacionPorAlumno(p
					.getId(), entrevistaIndividual.getPeriodoDePago()
					.getCiclo());
			if (ic != null) {
				if (!ic.getEstado().equals(EstadoInforme.ENVIADO)) {
					this.modificarEntrevistaMensualCesacion(
							entrevistaIndividual, valor, ape, entrevista, ic,
							pagos, p, beca);
					mensaje = ok + "El estado de la entrevista del becado "
							+ p.getDatosPersonales().getApellidoNombre()
							+ " ha sido modificado satisfactoriamente";
				} else {
					mensaje = error
							+ "No se puede modificar el estado de la entrevista del becado "
							+ p.getDatosPersonales().getApellidoNombre()
							+ " porque el Informe de Cesación ya ha sido enviado al padrino";
				}
			} else {
				this.modificarEntrevistaMensualCesacion(entrevistaIndividual,
						valor, ape, entrevista, ic, pagos, p, beca);
				mensaje = ok + "El estado de la entrevista del becado "
						+ p.getDatosPersonales().getApellidoNombre()
						+ " ha sido modificado satisfactoriamente";
			}
		} else {
			if (entrevistaIndividual.getEvaluacionCobroBeca() != null
					&& entrevistaIndividual.getEvaluacionCobroBeca().equals(
							EvaluacionCobroBeca.SUSPENDIDO)) {
				this.modificarEntrevistaMensual(entrevistaIndividual, valor,
						ape, entrevista, pagos, p, false);
				mensaje = ok + "El estado de la entrevista del becado "
						+ p.getDatosPersonales().getApellidoNombre()
						+ " ha sido modificado satisfactoriamente";
			} else {
				if (pagos != null) {
					if (!pagos.get(0).getEstadoPago()
							.equals(EstadoPago.REALIZADO)) {
						this.modificarEntrevistaMensual(entrevistaIndividual,
								valor, ape, entrevista, pagos, p, true);
						mensaje = ok + "El estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " ha sido modificado satisfactoriamente";
					} else {
						mensaje = error
								+ "No se puede modificar el estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " porque el pago ya ha sido realizado";
					}
				} else {
					this.modificarEntrevistaMensual(entrevistaIndividual,
							valor, ape, entrevista, pagos, p, true);
					mensaje = ok + "El estado de la entrevista del becado "
							+ p.getDatosPersonales().getApellidoNombre()
							+ " ha sido modificado satisfactoriamente";
				}
			}
		}
		return mensaje;
	}

	private void modificarEntrevistaFinalPendiente(
			EntrevistaFinal entrevistFinal, String valor, AlumnoPanelEA ape,
			Entrevista entrevista, InformeIS3 is3, List<Pago> pagos,
			PerfilAlumno p, boolean aprobado) {
		this.modificarEstadoEntrevista(entrevistFinal, valor, ape);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.setEstadoRenovacion(null);
		p.getHistorialEntrevistas().remove(entrevista);
		if (ape != null) {
			if (ape.getColorIS1() != null
					&& ape.getColorIS1().equals(ConstantesPaneles.GRAY))
				p.setEstadoAlumno(EstadoAlumno.INCORPORADO);
			else
				p.setEstadoAlumno(EstadoAlumno.RENOVADO);
			ape.actualizarEntrevista(entrevistFinal.getEstadoEntrevista());
			if (aprobado)
				ape.setPagosRealizados(ape.getPagosRealizados() - 1);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS3(ConstantesPaneles.RED);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (is3 != null) {
			is3.setEstado(EstadoInforme.CONSTRUCCION);
			srvInformeIS3.guardarInformeIS3(is3);
		}
		srvEntrevistas.guardarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void modificarEntrevistaFinal(EntrevistaFinal entrevistFinal,
			String valor, AlumnoPanelEA ape, Entrevista entrevista,
			InformeIS3 is3, List<Pago> pagos, PerfilAlumno p, Beca beca,
			boolean aprobado) {
		this.modificarEstadoEntrevista(entrevistFinal, valor, ape);
		p.setBeca(beca);
		p.setMotivoBaja(null);
		p.setPeriodoDeBaja(null);
		p.setFechaBaja(null);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.setProyeccionEntrevistaFinal(null);
		p.setUltimaActualizacion(null);
		p.setFechaSituacionActual(null);
		p.setOtraSituacion(null);
		p.setFechaProyeccionDeseada(null);
		p.setProyeccionDeseada(null);
		p.setOtraProyeccion(null);
		p.setObsPostPBE(null);
		p.setPeriodoDeEgreso(null);
		p.setSituacionActual(null);
		p.getHistorialEntrevistas().remove(entrevista);
		p.getHistorialBeca().remove(beca);
		if (ape != null) {
			if (ape.getColorIS1() != null
					&& ape.getColorIS1().equals(ConstantesPaneles.GRAY))
				p.setEstadoAlumno(EstadoAlumno.INCORPORADO);
			else
				p.setEstadoAlumno(EstadoAlumno.RENOVADO);
			ape.actualizarEntrevista(entrevistFinal.getEstadoEntrevista());
			if (aprobado)
				ape.setPagosRealizados(ape.getPagosRealizados() - 1);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS3(ConstantesPaneles.RED);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (is3 != null) {
			is3.setEstado(EstadoInforme.CONSTRUCCION);
			srvInformeIS3.guardarInformeIS3(is3);
		}
		if (beca != null) {
			beca.setCantidadAsignada(beca.getCantidadAsignada() + 1);
			svrBeca.guardarBeca(beca);
		}
		srvEntrevistas.guardarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private String guardarEntrevistaFinal(EntrevistaFinal entrevistaFinal,
			List<Pago> pagos, InformeIS3 is3, Entrevista entrevista,
			EntrevistaIndividual entrevistaIndividual, String valor,
			AlumnoPanelEA ape, PerfilAlumno p, Beca beca) {
		String mensaje = "";
		String ok = "redirect://exportacionEntrevistas/verExportarEntrevistas.do?mensaje=";
		String error = "redirect://exportacionEntrevistas/verExportarEntrevistas.do?error=";
		if (is3 != null) {
			if (!is3.getEstado().equals(EstadoInforme.ENVIADO)) {
				if (pagos != null) {
					if (!pagos.get(0).getEstadoPago()
							.equals(EstadoPago.REALIZADO)) {
						if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
								&& (entrevistaFinal
										.getEvaluacionRenovacionFinal()
										.equals(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR) || entrevistaFinal
										.getEvaluacionRenovacionFinal()
										.equals(EvaluacionRenovacionFinal.PENDIENTE))) {
							if (entrevistaFinal.getEvaluacionCobroBeca() != null
									&& entrevistaFinal
											.getEvaluacionCobroBeca()
											.equals(EvaluacionCobroBeca.APROBADO)) {
								this.modificarEntrevistaFinalPendiente(
										entrevistaFinal, valor, ape,
										entrevista, is3, pagos, p, true);
								mensaje = ok
										+ "El estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " ha sido modificado satisfactoriamente";
							} else {
								this.modificarEntrevistaFinalPendiente(
										entrevistaFinal, valor, ape,
										entrevista, is3, pagos, p, false);
								mensaje = ok
										+ "El estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " ha sido modificado satisfactoriamente";
							}
						} else {
							if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
									&& (entrevistaFinal
											.getEvaluacionRenovacionFinal()
											.equals(EvaluacionRenovacionFinal.NO_RENUEVA) || entrevistaFinal
											.getEvaluacionRenovacionFinal()
											.equals(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE))) {
								if (entrevistaFinal.getEvaluacionCobroBeca() != null
										&& entrevistaFinal
												.getEvaluacionCobroBeca()
												.equals(EvaluacionCobroBeca.APROBADO)) {
									this.modificarEntrevistaFinal(
											entrevistaFinal, valor, ape,
											entrevista, is3, pagos, p, beca,
											true);
									mensaje = ok
											+ "El estado de la entrevista del becado "
											+ p.getDatosPersonales()
													.getApellidoNombre()
											+ " ha sido modificado satisfactoriamente";
								} else {
									this.modificarEntrevistaFinal(
											entrevistaFinal, valor, ape,
											entrevista, is3, pagos, p, beca,
											false);
									mensaje = ok
											+ "El estado de la entrevista del becado "
											+ p.getDatosPersonales()
													.getApellidoNombre()
											+ " ha sido modificado satisfactoriamente";
								}
							}
						}
					} else {
						mensaje = error
								+ "No se puede modificar el estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " porque el pago ya ha sido realizado";
					}
				} else {
					if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
							&& (entrevistaFinal
									.getEvaluacionRenovacionFinal()
									.equals(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR) || entrevistaFinal
									.getEvaluacionRenovacionFinal()
									.equals(EvaluacionRenovacionFinal.PENDIENTE))) {
						if (entrevistaFinal.getEvaluacionCobroBeca() != null
								&& entrevistaFinal.getEvaluacionCobroBeca()
										.equals(EvaluacionCobroBeca.APROBADO)) {
							this.modificarEntrevistaFinalPendiente(
									entrevistaFinal, valor, ape, entrevista,
									is3, pagos, p, true);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						} else {
							this.modificarEntrevistaFinalPendiente(
									entrevistaFinal, valor, ape, entrevista,
									is3, pagos, p, false);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						}
					} else {
						if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
								&& (entrevistaFinal
										.getEvaluacionRenovacionFinal()
										.equals(EvaluacionRenovacionFinal.NO_RENUEVA) || entrevistaFinal
										.getEvaluacionRenovacionFinal()
										.equals(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE))) {
							if (entrevistaFinal.getEvaluacionCobroBeca() != null
									&& entrevistaFinal
											.getEvaluacionCobroBeca()
											.equals(EvaluacionCobroBeca.APROBADO)) {
								this.modificarEntrevistaFinal(entrevistaFinal,
										valor, ape, entrevista, is3, pagos, p,
										beca, true);
								mensaje = ok
										+ "El estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " ha sido modificado satisfactoriamente";
							} else {
								this.modificarEntrevistaFinal(entrevistaFinal,
										valor, ape, entrevista, is3, pagos, p,
										beca, false);
								mensaje = ok
										+ "El estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " ha sido modificado satisfactoriamente";
							}
						}
					}
				}
			} else {
				mensaje = error
						+ "No se puede modificar el estado de la entrevista del becado "
						+ p.getDatosPersonales().getApellidoNombre()
						+ " porque el Informe de Seguimiento Nº3 ya ha sido enviado al padrino";
			}
		} else {
			if (pagos != null) {
				if (!pagos.get(0).getEstadoPago().equals(EstadoPago.REALIZADO)) {
					if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
							&& (entrevistaFinal
									.getEvaluacionRenovacionFinal()
									.equals(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR) || entrevistaFinal
									.getEvaluacionRenovacionFinal()
									.equals(EvaluacionRenovacionFinal.PENDIENTE))) {
						if (entrevistaFinal.getEvaluacionCobroBeca() != null
								&& entrevistaFinal.getEvaluacionCobroBeca()
										.equals(EvaluacionCobroBeca.APROBADO)) {
							this.modificarEntrevistaFinalPendiente(
									entrevistaFinal, valor, ape, entrevista,
									is3, pagos, p, true);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						} else {
							this.modificarEntrevistaFinalPendiente(
									entrevistaFinal, valor, ape, entrevista,
									is3, pagos, p, false);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						}
					} else {
						if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
								&& (entrevistaFinal
										.getEvaluacionRenovacionFinal()
										.equals(EvaluacionRenovacionFinal.NO_RENUEVA) || entrevistaFinal
										.getEvaluacionRenovacionFinal()
										.equals(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE))) {
							if (entrevistaFinal.getEvaluacionCobroBeca() != null
									&& entrevistaFinal
											.getEvaluacionCobroBeca()
											.equals(EvaluacionCobroBeca.APROBADO)) {
								this.modificarEntrevistaFinal(entrevistaFinal,
										valor, ape, entrevista, is3, pagos, p,
										beca, true);
								mensaje = ok
										+ "El estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " ha sido modificado satisfactoriamente";
							} else {
								this.modificarEntrevistaFinal(entrevistaFinal,
										valor, ape, entrevista, is3, pagos, p,
										beca, false);
								mensaje = ok
										+ "El estado de la entrevista del becado "
										+ p.getDatosPersonales()
												.getApellidoNombre()
										+ " ha sido modificado satisfactoriamente";
							}
						}
					}
				} else {
					mensaje = error
							+ "No se puede modificar el estado de la entrevista del becado "
							+ p.getDatosPersonales().getApellidoNombre()
							+ " porque el pago ya ha sido realizado";
				}
			} else {
				if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
						&& (entrevistaFinal
								.getEvaluacionRenovacionFinal()
								.equals(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR) || entrevistaFinal
								.getEvaluacionRenovacionFinal().equals(
										EvaluacionRenovacionFinal.PENDIENTE))) {
					if (entrevistaFinal.getEvaluacionCobroBeca() != null
							&& entrevistaFinal.getEvaluacionCobroBeca().equals(
									EvaluacionCobroBeca.APROBADO)) {
						this.modificarEntrevistaFinalPendiente(entrevistaFinal,
								valor, ape, entrevista, is3, pagos, p, true);
						mensaje = ok + "El estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " ha sido modificado satisfactoriamente";
					} else {
						this.modificarEntrevistaFinalPendiente(entrevistaFinal,
								valor, ape, entrevista, is3, pagos, p, false);
						mensaje = ok + "El estado de la entrevista del becado "
								+ p.getDatosPersonales().getApellidoNombre()
								+ " ha sido modificado satisfactoriamente";
					}
				} else {
					if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
							&& (entrevistaFinal
									.getEvaluacionRenovacionFinal()
									.equals(EvaluacionRenovacionFinal.NO_RENUEVA) || entrevistaFinal
									.getEvaluacionRenovacionFinal()
									.equals(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE))) {
						if (entrevistaFinal.getEvaluacionCobroBeca() != null
								&& entrevistaFinal.getEvaluacionCobroBeca()
										.equals(EvaluacionCobroBeca.APROBADO)) {
							this.modificarEntrevistaFinal(entrevistaFinal,
									valor, ape, entrevista, is3, pagos, p,
									beca, true);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						} else {
							this.modificarEntrevistaFinal(entrevistaFinal,
									valor, ape, entrevista, is3, pagos, p,
									beca, false);
							mensaje = ok
									+ "El estado de la entrevista del becado "
									+ p.getDatosPersonales()
											.getApellidoNombre()
									+ " ha sido modificado satisfactoriamente";
						}
					}
				}
			}
		}
		return mensaje;
	}

	@RequestMapping("/entrevistas/elimiarEntrevistaIndividualSuperUsuarioView.do")
	public ModelAndView elimiarEntrevistaIndividualSuperUsuario(
			HttpServletRequest req,
			@RequestParam("entrevistaId") Long idEntrevista,
			@RequestParam(required = false, value = "valorPerfil") String valorPerfil,
			HttpServletRequest request, HttpSession session) {

		req.getSession().setAttribute("retorno", "superUsuario");
		String mensaje = "";
		String error = "";
		Entrevista entrevista = srvEntrevistas.obtenerEntrevista(idEntrevista);
		EntrevistaIndividual entrevistaIndividual = (EntrevistaIndividual) entrevista;
		PerfilAlumno perfilAlumno = entrevistaIndividual.getPerfilAlumno();
		boolean seEliminoEntrevista = true;

		try {
			Beca beca = svrBeca.obtenerPorId(entrevistaIndividual
					.getExportacionEspecial().getIdBeca());
			List<Pago> pagos = srvPago.obtenerPagoPorAlumnoPorPeriodo(
					perfilAlumno.getId(), entrevistaIndividual
							.getPeriodoDePago().getId());
			AlumnoPanelEA ape = alumnoPanelEaSrv
					.obtenerAlumnoPanelPorIdPerfilAlumno(perfilAlumno.getId());
			List<EntrevistaIndividual> entrevistas = srvEntrevistas
					.obtenerTodasEntrevistasPorAlumno(perfilAlumno.getId(),
							"descendiente");
			EntrevistaIndividual ultimaEntrevista = null;
			if (entrevistas.size() >= 2)
				ultimaEntrevista = (EntrevistaIndividual) entrevistas.get(1);

			if (entrevistaIndividual.getTipoEntrevista().equals(
					TipoEntrevista.INCORPORACION)) {
				EntrevistaReIncorporacion incorporacion = null;
				incorporacion = (EntrevistaReIncorporacion) entrevistaIndividual;
				seEliminoEntrevista = this.eliminarEntrevistaIncorporacion(
						incorporacion, pagos, entrevista, ultimaEntrevista,
						entrevistaIndividual, ape, perfilAlumno.getId(),
						perfilAlumno, beca);
			} else {
				if (entrevistaIndividual.getTipoEntrevista().equals(
						TipoEntrevista.RENOVACION)) {
					EntrevistaRenovacion renovacion = null;
					renovacion = (EntrevistaRenovacion) entrevistaIndividual;
					seEliminoEntrevista = this.eliminarEntrevistaRenovacion(
							renovacion, pagos, entrevista, ultimaEntrevista,
							ape, perfilAlumno, beca);
				} else {
					if (entrevistaIndividual.getTipoEntrevista().equals(
							TipoEntrevista.MENSUAL)) {
						seEliminoEntrevista = this.eliminarEntrevistaMensual(
								pagos, ultimaEntrevista, ape, perfilAlumno,
								beca, entrevistaIndividual,
								entrevistaIndividual);
					} else {
						if (entrevistaIndividual.getTipoEntrevista().equals(
								TipoEntrevista.FINAL)) {
							EntrevistaFinal entrevistaFinal = (EntrevistaFinal) entrevistaIndividual;
							InformeIS3 is3 = srvInformeIS3
									.obtenerInformePorAlumno(perfilAlumno
											.getId(), entrevistaFinal
											.getPeriodoDePago().getCiclo());
							seEliminoEntrevista = this.eliminarEntrevistaFinal(
									entrevistaFinal, pagos, is3,
									entrevistaFinal, ultimaEntrevista, ape,
									perfilAlumno, beca);
						}
					}
				}
			}
			if (seEliminoEntrevista)
				mensaje = "La entrevista del becado "
						+ perfilAlumno.getDatosPersonales().getApellidoNombre()
						+ " ha sido eliminada satisfactoriamente";
			else
				error = "No se puede eliminar la entrevista del becado "
						+ perfilAlumno.getDatosPersonales().getApellidoNombre()
						+ " porque el informe asociado ya ha sido enviado al padrino";
		} catch (Exception e) {
			mensaje = "";
			error = "Se produjo un error al querer eliminar la entrevista seleccionada";
			log.error("****************************", e.getCause());
		}

		return new ModelAndView(
				"redirect:/exportacionEntrevistas/verExportarEntrevistas.do?mensaje="
						+ mensaje + "&error=" + error);
	}

	private void eliminarEntrevistaIncorporacionCicloAnterior(
			Entrevista ultimaEntrevista, AlumnoPanelEA ape,
			Entrevista entrevista, FichaPresentacion fp, List<Pago> pagos,
			PerfilAlumno p) {
		p.getHistorialEntrevistas().remove(entrevista);
		if (fp != null)
			srvFichaPresentacion.eliminarInformeFP(fp);
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaIncorporacionIncorpora(
			Entrevista ultimaEntrevista, AlumnoPanelEA ape,
			Entrevista entrevista, FichaPresentacion fp, List<Pago> pagos,
			PerfilAlumno p) {
		if (p.getFechaReincorporacionPBE() != null) // es un chico reincorporado
			p.setFechaReincorporacionPBE(null);
		else
			p.setFechaPBE(null);
		p.getHistorialEntrevistas().remove(entrevista);
		if (ape != null) {
			ape.setEntrevistasRealizadas(ape.getEntrevistasRealizadas() - 1);
			if (ape.getEntrevistasRealizadas() == 0)
				p.setEstadoAlumno(EstadoAlumno.ALTA_BECADO);
			else
				p.setEstadoAlumno(EstadoAlumno.INCORPORACION_PENDIENTE);
			ape.actualizarEntrevista(EstadoEntrevista.CONSTRUCCION);
			ape.setPagosRealizados(ape.getPagosRealizados() - 1);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS1(ConstantesPaneles.GRAY);
			if (ultimaEntrevista != null
					&& ultimaEntrevista.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				ape.setEntrevistasFinalizadas(true);
			else
				ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (fp != null)
			srvFichaPresentacion.eliminarInformeFP(fp);
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaIncorporacionPendiente(
			Entrevista ultimaEntrevista, AlumnoPanelEA ape,
			Entrevista entrevista, List<Pago> pagos, PerfilAlumno p) {
		p.getHistorialEntrevistas().remove(entrevista);
		if (ape != null) {
			ape.setEntrevistasRealizadas(ape.getEntrevistasRealizadas() - 1);
			if (ape.getEntrevistasRealizadas() == 0)
				p.setEstadoAlumno(EstadoAlumno.ALTA_BECADO);
			ape.actualizarEntrevista(EstadoEntrevista.CONSTRUCCION);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS1(ConstantesPaneles.GRAY);
			if (ultimaEntrevista != null
					&& ultimaEntrevista.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				ape.setEntrevistasFinalizadas(true);
			else
				ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaIncorporacionNoIncorpora(
			Entrevista ultimaEntrevista, AlumnoPanelEA ape,
			Entrevista entrevista, List<Pago> pagos, PerfilAlumno p, Beca beca) {
		p.setBeca(beca);
		p.getHistorialEntrevistas().remove(entrevista);
		p.setMotivoBaja(null);
		p.setPeriodoDeBaja(null);
		p.setFechaBaja(null);
		p.setProyeccionEntrevistaFinal(null);
		p.setUltimaActualizacion(null);
		p.setFechaSituacionActual(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.setOtraSituacion(null);
		p.setFechaProyeccionDeseada(null);
		p.setProyeccionDeseada(null);
		p.setOtraProyeccion(null);
		p.setObsPostPBE(null);
		p.setPeriodoDeEgreso(null);
		p.setSituacionActual(null);
		if (ape != null) {
			ape.setEntrevistasRealizadas(ape.getEntrevistasRealizadas() - 1);
			if (ape.getEntrevistasRealizadas() == 0)
				p.setEstadoAlumno(EstadoAlumno.ALTA_BECADO);
			else
				p.setEstadoAlumno(EstadoAlumno.INCORPORACION_PENDIENTE);
			ape.actualizarEntrevista(EstadoEntrevista.CONSTRUCCION);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS1(ConstantesPaneles.GRAY);
			ape.setActivo(true);
			if (ultimaEntrevista != null
					&& ultimaEntrevista.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				ape.setEntrevistasFinalizadas(true);
			else
				ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		p.getHistorialBeca().remove(beca);
		if (beca != null) {
			beca.setCantidadAsignada(beca.getCantidadAsignada() + 1);
			svrBeca.guardarBeca(beca);
		}
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private boolean eliminarEntrevistaIncorporacion(
			EntrevistaReIncorporacion incorporacion, List<Pago> pagos,
			Entrevista entrevista, Entrevista ultimaEntrevista,
			EntrevistaIndividual entrevistaIndividual, AlumnoPanelEA ape,
			Long id, PerfilAlumno p, Beca beca) {
		boolean seEliminoEntrevista = false;
		CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		List<Long> periodosIds = PeriodoHelper
				.obtenerListaIdsPeriodos(cicloActual.getPeriodos());
		FichaPresentacion fp = null;
		boolean entrevCicloActual = true;
		// Se comprueba si la entrevista a eliminar pertenece o no al ciclo
		// actual
		if (periodosIds.contains(incorporacion.getPeriodoDePago().getId())) {
			fp = srvFichaPresentacion.obtenerInformePorAlumno(id);
		}
		// La entrevista a eliminar no pertenece al ciclo actual
		else {
			fp = srvFichaPresentacion.obtenerInformePorAlumnoPorCiclo(
					cicloActual, p.getId());
			entrevCicloActual = false;
		}
		// Se chequea si la entrevista a eliminar se encuentra en estado
		// finalizada, ya que si es así tenemos que volver atras el estado del
		// alumno
		if (incorporacion.getEstadoEntrevista().equals(
				EstadoEntrevista.FINALIZADA)) {
			if (incorporacion.getIncorporacion() != null
					&& incorporacion.getIncorporacion().equals(
							EvaluacionIncorporacion.INCORPORA)) {
				if (fp != null) {
					if (!fp.getEstado().equals(EstadoInforme.ENVIADO)) {
						if (entrevCicloActual) {
							this.eliminarEntrevistaIncorporacionIncorpora(
									ultimaEntrevista, ape,
									entrevistaIndividual, fp, pagos, p);
							seEliminoEntrevista = true;
						} else {
							this.eliminarEntrevistaIncorporacionCicloAnterior(
									ultimaEntrevista, ape,
									entrevistaIndividual, fp, pagos, p);
							seEliminoEntrevista = true;
						}
					} else {
						seEliminoEntrevista = false;
					}
				} else {
					if (entrevCicloActual) {
						this.eliminarEntrevistaIncorporacionIncorpora(
								ultimaEntrevista, ape, entrevistaIndividual,
								fp, pagos, p);
						seEliminoEntrevista = true;
					} else {
						this.eliminarEntrevistaIncorporacionCicloAnterior(
								ultimaEntrevista, ape, entrevistaIndividual,
								fp, pagos, p);
						seEliminoEntrevista = true;
					}
				}
			} else {
				if (incorporacion.getIncorporacion() != null
						&& incorporacion.getIncorporacion().equals(
								EvaluacionIncorporacion.INCORPORAPENDIENTE)) {
					if (entrevCicloActual) {
						this.eliminarEntrevistaIncorporacionPendiente(
								ultimaEntrevista, ape, entrevistaIndividual,
								pagos, p);
						seEliminoEntrevista = true;
					} else {
						this.eliminarEntrevistaIncorporacionCicloAnterior(
								ultimaEntrevista, ape, entrevistaIndividual,
								fp, pagos, p);
						seEliminoEntrevista = true;
					}
				} else {
					if (incorporacion.getIncorporacion() != null
							&& incorporacion.getIncorporacion().equals(
									EvaluacionIncorporacion.NOINCORPORA)) {

						// guardo la fecha de la cesacion en becas
						Connection cn = null;
						CallableStatement cl = null;
						ResultSet rs = null;
						String call = null;
						try {
							// //System.out.println("sp_alta no incorpora "+
							// entrevista.getExportacionEspecial().getIdBeca());
							call = "{CALL SP_AltaBajaBeca(?)}";
							cn = Conexion.getConexion();
							cl = cn.prepareCall(call);
							cl.setLong(1, entrevista.getExportacionEspecial()
									.getIdBeca()); // numero de fp
							rs = cl.executeQuery();
							// cierro conexion
							Conexion.cerrarCall(cl);
							Conexion.cerrarConexion(cn);
							call = "{CALL SP_ModificarBecaBajaBecado(?)}";
							// call
							// ="insert into baja_becas values (?,CURDATE( ))";
							cn = Conexion.getConexion();
							cl = cn.prepareCall(call);
							cl.setLong(1, entrevista.getExportacionEspecial()
									.getIdBeca());
							rs = cl.executeQuery();

							/*
							 * Date fechaBajaBeca1=null; call =
							 * "{CALL SP_BuscarFechaBajaBecaHistorial(?)}"; cn =
							 * Conexion.getConexion(); cl =
							 * cn.prepareCall(call); cl.setLong(1,
							 * entrevista.getExportacionEspecial().getIdBeca());
							 * rs = cl.executeQuery(); while (rs.next()) {
							 * fechaBajaBeca1= rs.getDate(2); }
							 * if(fechaBajaBeca1!=null){ call =
							 * "{CALL SP_ModificarBajaBecaHistorial(?)}"; cn =
							 * Conexion.getConexion(); cl =
							 * cn.prepareCall(call); cl.setLong(1,
							 * entrevista.getExportacionEspecial().getIdBeca());
							 * // numero de fp rs = cl.executeQuery();
							 * 
							 * } if(fechaBajaBeca1==null){ call =
							 * "{CALL SP_AltaBajaBecaHistorial(?)}"; cn =
							 * Conexion.getConexion(); cl =
							 * cn.prepareCall(call); cl.setLong(1,
							 * entrevista.getExportacionEspecial().getIdBeca());
							 * // numero de fp rs = cl.executeQuery();
							 * 
							 * }
							 */
							Conexion.cerrarCall(cl);
							Conexion.cerrarConexion(cn);
						} catch (SQLException e) {
							e.printStackTrace();
							Conexion.cerrarCall(cl);
							Conexion.cerrarConexion(cn);

						}

						if (entrevCicloActual) {
							this.eliminarEntrevistaIncorporacionNoIncorpora(
									ultimaEntrevista, ape,
									entrevistaIndividual, pagos, p, beca);
							seEliminoEntrevista = true;
						} else {
							this.eliminarEntrevistaIncorporacionCicloAnterior(
									ultimaEntrevista, ape,
									entrevistaIndividual, fp, pagos, p);
							seEliminoEntrevista = true;
						}
					}
				}
			}
		}
		/*
		 * Si la entrevista está en construcción, nos sirve el eliminar
		 * incorporacion pendiente
		 */
		else {
			if (entrevCicloActual) {
				this.eliminarEntrevistaIncorporacionPendiente(ultimaEntrevista,
						ape, entrevistaIndividual, pagos, p);
				seEliminoEntrevista = true;
			} else {
				this.eliminarEntrevistaIncorporacionCicloAnterior(
						ultimaEntrevista, ape, entrevistaIndividual, fp, pagos,
						p);
				seEliminoEntrevista = true;
			}
		}
		return seEliminoEntrevista;
	}

	private void eliminarEntrevistaRenovacionCicloAnteriorRenueva(
			Entrevista entrevista, InformeIS1 is1, List<Pago> pagos,
			PerfilAlumno p, FichaPresentacion fp) {
		p.getHistorialEntrevistas().remove(entrevista);
		if (is1 != null)
			srvInformeIS1.eliminarInformeIS1(is1);
		if (fp != null) {
			if (fp.getFpPorReasignacion()) {
				fp.setEstado(EstadoInforme.PENDIENTE_POR_RENOVACION);
				fp.setFechaCambioUltimoEstado(new Date());
				srvFichaPresentacion.guardarInformeFP(fp);
			}
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaRenovacionCicloAnteriorPendiente(
			Entrevista entrevista, ComunicadoPendiente comunicadoPendiente,
			List<Pago> pagos, PerfilAlumno p) {
		p.getHistorialEntrevistas().remove(entrevista);
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (comunicadoPendiente != null)
			svrComunicadoPendiente
					.eliminarComunicadoPendiente(comunicadoPendiente);
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaRenovacionCicloAnteriorNoRenueva(
			Entrevista entrevista,
			ComunicadoNoRenovacion comunicadoNoRenovacion, List<Pago> pagos,
			PerfilAlumno p) {
		p.getHistorialEntrevistas().remove(entrevista);
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (comunicadoNoRenovacion != null)
			svrComunicadoNoRenovacion
					.eliminarComunicadoNoRenovacion(comunicadoNoRenovacion);
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaRenovacionRenueva(
			Entrevista ultimaEntrevista, AlumnoPanelEA ape,
			EntrevistaRenovacion renovacion, Entrevista entrevista,
			InformeIS1 is1, List<Pago> pagos, PerfilAlumno p, Boletin boletin,
			FichaPresentacion fp) {
		p.setEstadoAlumno(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION);
		p.setAnioEscolar(decrementarAnioEscolar(p.getAnioEscolar(),
				p.getAnioAdicional(), renovacion.getSituacionEscolarMergeada()));
		p.setBoletin(boletin);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.getHistorialEntrevistas().remove(entrevista);
		p.getHistorialBoletin().remove(boletin);
		if (ape != null) {
			ape.setEntrevistasRealizadas(ape.getEntrevistasRealizadas() - 1);
			ape.actualizarEntrevista(EstadoEntrevista.CONSTRUCCION);
			ape.setPagosRealizados(ape.getPagosRealizados() - 1);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setRenovacionPendiente(true);
			ape.setColorBoletin(ConstantesPaneles.GREEN);
			ape.setColorIS1(ConstantesPaneles.RED);
			ape.setAnio(decrementarAnioEscolar(p.getAnioEscolar(),
					p.getAnioAdicional(),
					renovacion.getSituacionEscolarMergeada()));
			if (ultimaEntrevista != null
					&& ultimaEntrevista.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				ape.setEntrevistasFinalizadas(true);
			else
				ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (is1 != null)
			srvInformeIS1.eliminarInformeIS1(is1);
		if (fp != null) {
			if (fp.getFpPorReasignacion()) {
				fp.setEstado(EstadoInforme.PENDIENTE_POR_RENOVACION);
				fp.setFechaCambioUltimoEstado(new Date());
				srvFichaPresentacion.guardarInformeFP(fp);
			}
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaRenovacionPendiente(
			Entrevista ultimaEntrevista, AlumnoPanelEA ape,
			Entrevista entrevista, ComunicadoPendiente comunicadoPendiente,
			List<Pago> pagos, PerfilAlumno p) {
		p.setEstadoAlumno(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.getHistorialEntrevistas().remove(entrevista);
		if (ape != null) {
			ape.setEntrevistasRealizadas(ape.getEntrevistasRealizadas() - 1);
			ape.actualizarEntrevista(EstadoEntrevista.CONSTRUCCION);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS1(ConstantesPaneles.RED);
			ape.setRenovacionPendiente(true);
			if (ultimaEntrevista != null
					&& ultimaEntrevista.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				ape.setEntrevistasFinalizadas(true);
			else
				ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (comunicadoPendiente != null)
			svrComunicadoPendiente
					.eliminarComunicadoPendiente(comunicadoPendiente);

		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaRenovacionNoRenueva(
			Entrevista ultimaEntrevista, AlumnoPanelEA ape,
			Entrevista entrevista,
			ComunicadoNoRenovacion comunicadoNoRenovacion, List<Pago> pagos,
			PerfilAlumno p, Beca beca, FichaPresentacion fp) {
		p.setEstadoAlumno(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION);
		p.setBeca(beca);
		p.setMotivoBaja(null);
		p.setPeriodoDeBaja(null);
		p.setFechaBaja(null);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.setProyeccionEntrevistaFinal(null);
		p.setUltimaActualizacion(null);
		p.setFechaSituacionActual(null);
		p.setOtraSituacion(null);
		p.setFechaProyeccionDeseada(null);
		p.setProyeccionDeseada(null);
		p.setOtraProyeccion(null);
		p.setObsPostPBE(null);
		p.setPeriodoDeEgreso(null);
		p.setSituacionActual(null);
		p.getHistorialEntrevistas().remove(entrevista);
		p.getHistorialBeca().remove(beca);
		if (ape != null) {
			ape.setEntrevistasRealizadas(ape.getEntrevistasRealizadas() - 1);
			ape.actualizarEntrevista(EstadoEntrevista.CONSTRUCCION);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS1(ConstantesPaneles.RED);
			ape.setActivo(true);
			if (ultimaEntrevista != null
					&& ultimaEntrevista.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				ape.setEntrevistasFinalizadas(true);
			else
				ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (comunicadoNoRenovacion != null)
			svrComunicadoNoRenovacion
					.eliminarComunicadoNoRenovacion(comunicadoNoRenovacion);
		if (fp != null) {
			if (fp.getFpPorReasignacion()) {
				fp.setEstado(EstadoInforme.PENDIENTE_POR_RENOVACION);
				fp.setFechaCambioUltimoEstado(new Date());
				srvFichaPresentacion.guardarInformeFP(fp);
			}
		}
		if (beca != null) {
			beca.setCantidadAsignada(beca.getCantidadAsignada() + 1);
			svrBeca.guardarBeca(beca);
		}

		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private boolean eliminarEntrevistaRenovacion(
			EntrevistaRenovacion renovacion, List<Pago> pagos,
			Entrevista entrevista, Entrevista ultimaEntrevista,
			AlumnoPanelEA ape, PerfilAlumno p, Beca beca) {
		boolean seEliminoEntrevista = false;
		CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		List<Long> periodosIds = PeriodoHelper
				.obtenerListaIdsPeriodos(cicloActual.getPeriodos());
		InformeIS1 is1 = srvInformeIS1.obtenerInformePorAlumno(p.getId(),
				renovacion.getPeriodoDePago().getCiclo());
		FichaPresentacion fp = srvFichaPresentacion
				.obtenerInformePorAlumnoPorCiclo(cicloActual, p.getId());
		boolean entrevCicloActual = true;
		// Se comprueba si la entrevista a eliminar pertenece o no al ciclo
		// actual
		if (!periodosIds.contains(renovacion.getPeriodoDePago().getId())) {
			entrevCicloActual = false;
		}
		// Se chequea si la entrevista a eliminar se encuentra en estado
		// finalizada, ya que si es así tenemos que volver atras el estado del
		// alumno
		if (renovacion.getEstadoEntrevista()
				.equals(EstadoEntrevista.FINALIZADA)) {
			if (renovacion.getEvaluacionRenovacionMergeada() != null
					&& renovacion.getEvaluacionRenovacionMergeada().equals(
							EvaluacionRenovacionMergeada.RENUEVA)) {
				Long idBoletin = null;
				Boletin boletin = null;
				if (p.getHistorialBoletin() != null
						&& p.getHistorialBoletin().size() > 0)
					idBoletin = p.getHistorialBoletin()
							.get(p.getHistorialBoletin().size() - 1).getId();
				if (idBoletin != null)
					boletin = svrBoletin.obtenerPorId(idBoletin);
				if (is1 != null) {
					if (!is1.getEstado().equals(EstadoInforme.ENVIADO)) {
						if (fp != null) {
							if (!fp.getEstado().equals(EstadoInforme.ENVIADO)) {
								if (entrevCicloActual) {
									this.eliminarEntrevistaRenovacionRenueva(
											ultimaEntrevista, ape, renovacion,
											entrevista, is1, pagos, p, boletin,
											fp);
									seEliminoEntrevista = true;
								} else {
									this.eliminarEntrevistaRenovacionCicloAnteriorRenueva(
											entrevista, is1, pagos, p, fp);
									seEliminoEntrevista = true;
								}
							} else {
								seEliminoEntrevista = false;
							}
						} else {
							if (entrevCicloActual) {
								this.eliminarEntrevistaRenovacionRenueva(
										ultimaEntrevista, ape, renovacion,
										entrevista, is1, pagos, p, boletin, fp);
								seEliminoEntrevista = true;
							} else {
								this.eliminarEntrevistaRenovacionCicloAnteriorRenueva(
										entrevista, is1, pagos, p, fp);
								seEliminoEntrevista = true;
							}
						}
					} else {
						seEliminoEntrevista = false;
					}
				} else {
					if (fp != null) {
						if (!fp.getEstado().equals(EstadoInforme.ENVIADO)) {
							if (entrevCicloActual) {
								this.eliminarEntrevistaRenovacionRenueva(
										ultimaEntrevista, ape, renovacion,
										entrevista, is1, pagos, p, boletin, fp);
								seEliminoEntrevista = true;
							} else {
								this.eliminarEntrevistaRenovacionCicloAnteriorRenueva(
										entrevista, is1, pagos, p, fp);
								seEliminoEntrevista = true;
							}
						} else {
							seEliminoEntrevista = false;
						}
					} else {
						if (entrevCicloActual) {
							this.eliminarEntrevistaRenovacionRenueva(
									ultimaEntrevista, ape, renovacion,
									entrevista, is1, pagos, p, boletin, fp);
							seEliminoEntrevista = true;
						} else {
							this.eliminarEntrevistaRenovacionCicloAnteriorRenueva(
									entrevista, is1, pagos, p, fp);
							seEliminoEntrevista = true;
						}
					}
				}
			} else {
				if (renovacion.getEvaluacionRenovacionMergeada() != null
						&& renovacion.getEvaluacionRenovacionMergeada().equals(
								EvaluacionRenovacionMergeada.PENDIENTE)) {
					PerfilPadrino padrino = beca.getPadrino();
					ComunicadoPendiente comunicadoPendiente = null;
					if (padrino.getTipo().equals(TipoPadrino.INDIVIDUAL)) {
						comunicadoPendiente = svrComunicadoPendiente
								.obtenerComunicadoPendientePorAlumno(p.getId(),
										renovacion.getPeriodoDePago()
												.getCiclo());
					}
					if (comunicadoPendiente != null) {
						if (!comunicadoPendiente.getEstado().equals(
								EstadoInforme.ENVIADO)) {
							if (entrevCicloActual) {
								this.eliminarEntrevistaRenovacionPendiente(
										ultimaEntrevista, ape, entrevista,
										comunicadoPendiente, pagos, p);
								seEliminoEntrevista = true;
							} else {
								this.eliminarEntrevistaRenovacionCicloAnteriorPendiente(
										entrevista, comunicadoPendiente, pagos,
										p);
								seEliminoEntrevista = true;
							}
						} else {
							seEliminoEntrevista = false;
						}
					} else {
						if (entrevCicloActual) {
							this.eliminarEntrevistaRenovacionPendiente(
									ultimaEntrevista, ape, entrevista,
									comunicadoPendiente, pagos, p);
							seEliminoEntrevista = true;
						} else {
							this.eliminarEntrevistaRenovacionCicloAnteriorPendiente(
									entrevista, comunicadoPendiente, pagos, p);
							seEliminoEntrevista = true;
						}
					}
				} else {
					if (renovacion.getEvaluacionRenovacionMergeada() != null
							&& renovacion
									.getEvaluacionRenovacionMergeada()
									.equals(EvaluacionRenovacionMergeada.NO_RENUEVA)) {
						PerfilPadrino padrino = beca.getPadrino();
						ComunicadoNoRenovacion comunicadoNoRenovacion = null;
						if (padrino.getTipo().equals(TipoPadrino.INDIVIDUAL)) {
							comunicadoNoRenovacion = svrComunicadoNoRenovacion
									.obtenerComunicadoNoRenovacionPorAlumno(p
											.getId(), renovacion
											.getPeriodoDePago().getCiclo());
						}
						if (comunicadoNoRenovacion != null) {
							if (!comunicadoNoRenovacion.getEstado().equals(
									EstadoInforme.ENVIADO)) {
								if (entrevCicloActual) {
									this.eliminarEntrevistaRenovacionNoRenueva(
											ultimaEntrevista, ape, entrevista,
											comunicadoNoRenovacion, pagos, p,
											beca, fp);
									seEliminoEntrevista = true;
								} else {
									this.eliminarEntrevistaRenovacionCicloAnteriorNoRenueva(
											entrevista, comunicadoNoRenovacion,
											pagos, p);
									seEliminoEntrevista = true;
								}
							} else {
								seEliminoEntrevista = false;
							}
						} else {
							if (entrevCicloActual) {
								this.eliminarEntrevistaRenovacionNoRenueva(
										ultimaEntrevista, ape, entrevista,
										comunicadoNoRenovacion, pagos, p, beca,
										fp);
								seEliminoEntrevista = true;
							} else {
								this.eliminarEntrevistaRenovacionCicloAnteriorNoRenueva(
										entrevista, comunicadoNoRenovacion,
										pagos, p);
								seEliminoEntrevista = true;
							}
						}
					}
				}
			}
		}
		/*
		 * Si la entrevista está en construcción, nos sirve el eliminar
		 * incorporacion pendiente
		 */
		else {
			if (entrevCicloActual) {
				this.eliminarEntrevistaRenovacionPendiente(ultimaEntrevista,
						ape, entrevista, null, pagos, p);
				seEliminoEntrevista = true;
			} else {
				this.eliminarEntrevistaRenovacionCicloAnteriorPendiente(
						entrevista, null, pagos, p);
				seEliminoEntrevista = true;
			}
		}
		return seEliminoEntrevista;
	}

	private void eliminarEntrevistaMensualCesacion(Entrevista ultimaEntrevista,
			AlumnoPanelEA ape, Entrevista entrevista, InformeCesacion ic,
			List<Pago> pagos, PerfilAlumno p, Beca beca) {
		p.setBeca(beca);
		p.setMotivoBaja(null);
		p.setPeriodoDeBaja(null);
		p.setFechaBaja(null);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.setProyeccionEntrevistaFinal(null);
		p.setUltimaActualizacion(null);
		p.setFechaSituacionActual(null);
		p.setOtraSituacion(null);
		p.setFechaProyeccionDeseada(null);
		p.setProyeccionDeseada(null);
		p.setOtraProyeccion(null);
		p.setObsPostPBE(null);
		p.setPeriodoDeEgreso(null);
		p.setSituacionActual(null);
		p.getHistorialEntrevistas().remove(entrevista);
		p.getHistorialBeca().remove(beca);
		if (ape != null) {
			ape.setEntrevistasRealizadas(ape.getEntrevistasRealizadas() - 1);
			if (ape.getColorIS1() != null
					&& ape.getColorIS1().equals(ConstantesPaneles.GRAY))
				p.setEstadoAlumno(EstadoAlumno.INCORPORADO);
			else
				p.setEstadoAlumno(EstadoAlumno.RENOVADO);
			ape.actualizarEntrevista(EstadoEntrevista.CONSTRUCCION);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setActivo(true);
			if (ultimaEntrevista != null
					&& ultimaEntrevista.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				ape.setEntrevistasFinalizadas(true);
			else
				ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (ic != null)
			srvCesacion.eliminarInformeCesacion(ic);

		if (beca != null) {
			beca.setCantidadAsignada(beca.getCantidadAsignada() + 1);
			svrBeca.guardarBeca(beca);
		}

		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaMensualIndividual(
			Entrevista ultimaEntrevista, AlumnoPanelEA ape,
			Entrevista entrevista, List<Pago> pagos, PerfilAlumno p,
			boolean noSuspendida) {
		p.getHistorialEntrevistas().remove(entrevista);
		if (ape != null) {
			ape.actualizarEntrevista(EstadoEntrevista.CONSTRUCCION);
			ape.setEntrevistasRealizadas(ape.getEntrevistasRealizadas() - 1);
			if (noSuspendida)
				ape.setPagosRealizados(ape.getPagosRealizados() - 1);
			ape.setColorPagos(ConstantesPaneles.RED);
			if (ultimaEntrevista != null
					&& ultimaEntrevista.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				ape.setEntrevistasFinalizadas(true);
			else
				ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}

		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaMensualCicloAnterior(Entrevista entrevista,
			InformeCesacion ic, List<Pago> pagos, PerfilAlumno p) {
		p.getHistorialEntrevistas().remove(entrevista);
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (ic != null)
			srvCesacion.eliminarInformeCesacion(ic);
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private boolean eliminarEntrevistaMensual(List<Pago> pagos,
			Entrevista ultimaEntrevista, AlumnoPanelEA ape, PerfilAlumno p,
			Beca beca, Entrevista entrevista, EntrevistaIndividual mensual) {
		boolean seEliminoEntrevista = false;
		CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		List<Long> periodosIds = PeriodoHelper
				.obtenerListaIdsPeriodos(cicloActual.getPeriodos());
		InformeCesacion ic = srvCesacion.obtenerInformeCesacionPorAlumno(
				p.getId(), mensual.getPeriodoDePago().getCiclo());
		boolean entrevCicloActual = true;
		// Se comprueba si la entrevista a eliminar pertenece o no al ciclo
		// actual
		if (!periodosIds.contains(mensual.getPeriodoDePago().getId())) {
			entrevCicloActual = false;
		}
		// Se chequea si la entrevista a eliminar se encuentra en estado
		// finalizada, ya que si es así tenemos que volver atras el estado del
		// alumno
		if (mensual.getEstadoEntrevista().equals(EstadoEntrevista.FINALIZADA)) {
			if (mensual.getEvaluacionCobroBeca() != null
					&& mensual.getEvaluacionCobroBeca().equals(
							EvaluacionCobroBeca.CESADO)) {
				if (ic != null) {
					if (!ic.getEstado().equals(EstadoInforme.ENVIADO)) {
						if (entrevCicloActual) {
							this.eliminarEntrevistaMensualCesacion(
									ultimaEntrevista, ape, entrevista, ic,
									pagos, p, beca);
							seEliminoEntrevista = true;
						} else {
							this.eliminarEntrevistaMensualCicloAnterior(
									entrevista, ic, pagos, p);
							seEliminoEntrevista = true;
						}
					} else {
						seEliminoEntrevista = false;
					}
				} else {
					if (entrevCicloActual) {
						this.eliminarEntrevistaMensualCesacion(
								ultimaEntrevista, ape, entrevista, ic, pagos,
								p, beca);
						seEliminoEntrevista = true;
					} else {
						this.eliminarEntrevistaMensualCicloAnterior(entrevista,
								ic, pagos, p);
						seEliminoEntrevista = true;
					}
				}
			} else {
				if (mensual.getEvaluacionCobroBeca() != null
						&& mensual.getEvaluacionCobroBeca().equals(
								EvaluacionCobroBeca.SUSPENDIDO)) {
					if (entrevCicloActual) {
						this.eliminarEntrevistaMensualIndividual(
								ultimaEntrevista, ape, entrevista, pagos, p,
								false);
						seEliminoEntrevista = true;
					} else {
						this.eliminarEntrevistaMensualCicloAnterior(entrevista,
								ic, pagos, p);
						seEliminoEntrevista = true;
					}
				} else {
					if (entrevCicloActual) {
						this.eliminarEntrevistaMensualIndividual(
								ultimaEntrevista, ape, entrevista, pagos, p,
								true);
						seEliminoEntrevista = true;
					} else {
						this.eliminarEntrevistaMensualCicloAnterior(entrevista,
								ic, pagos, p);
						seEliminoEntrevista = true;
					}
				}
			}
		}
		/*
		 * Si la entrevista está en construcción, nos sirve el eliminar
		 * incorporacion pendiente
		 */
		else {
			if (entrevCicloActual) {
				this.eliminarEntrevistaMensualIndividual(ultimaEntrevista, ape,
						entrevista, pagos, p, false);
				seEliminoEntrevista = true;
			} else {
				this.eliminarEntrevistaMensualCicloAnterior(entrevista, ic,
						pagos, p);
				seEliminoEntrevista = true;
			}
		}
		return seEliminoEntrevista;
	}

	private void eliminarEntrevistaFinalIndividual(Entrevista ultimaEntrevista,
			AlumnoPanelEA ape, Entrevista entrevista, InformeIS3 is3,
			List<Pago> pagos, PerfilAlumno p, Beca beca, boolean aprobado) {
		p.setBeca(beca);
		p.setMotivoBaja(null);
		p.setPeriodoDeBaja(null);
		p.setFechaBaja(null);
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.setProyeccionEntrevistaFinal(null);
		p.setUltimaActualizacion(null);
		p.setFechaSituacionActual(null);
		p.setOtraSituacion(null);
		p.setFechaProyeccionDeseada(null);
		p.setProyeccionDeseada(null);
		p.setOtraProyeccion(null);
		p.setObsPostPBE(null);
		p.setPeriodoDeEgreso(null);
		p.setSituacionActual(null);
		p.getHistorialEntrevistas().remove(entrevista);
		p.getHistorialBeca().remove(beca);
		if (ape != null) {
			ape.setEntrevistasRealizadas(ape.getEntrevistasRealizadas() - 1);
			if (ape.getColorIS1() != null
					&& ape.getColorIS1().equals(ConstantesPaneles.GRAY))
				p.setEstadoAlumno(EstadoAlumno.INCORPORADO);
			else
				p.setEstadoAlumno(EstadoAlumno.RENOVADO);
			ape.actualizarEntrevista(EstadoEntrevista.CONSTRUCCION);
			if (aprobado)
				ape.setPagosRealizados(ape.getPagosRealizados() - 1);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS3(ConstantesPaneles.RED);
			if (ultimaEntrevista != null
					&& ultimaEntrevista.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				ape.setEntrevistasFinalizadas(true);
			else
				ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (is3 != null) {
			srvInformeIS3.eliminarInformeIS3(is3);
		}
		if (beca != null) {
			beca.setCantidadAsignada(beca.getCantidadAsignada() + 1);
			svrBeca.guardarBeca(beca);
		}
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaFinalPendiente(Entrevista ultimaEntrevista,
			AlumnoPanelEA ape, Entrevista entrevista, InformeIS3 is3,
			List<Pago> pagos, PerfilAlumno p, boolean aprobado) {
		p.setSituacionEscolar(null);
		p.setSituacionEscolarUltimaEntevista(null);
		p.setEstadoRenovacion(null);
		p.getHistorialEntrevistas().remove(entrevista);
		if (ape != null) {
			ape.setEntrevistasRealizadas(ape.getEntrevistasRealizadas() - 1);
			if (ape.getColorIS1() != null
					&& ape.getColorIS1().equals(ConstantesPaneles.GRAY))
				p.setEstadoAlumno(EstadoAlumno.INCORPORADO);
			else
				p.setEstadoAlumno(EstadoAlumno.RENOVADO);
			ape.actualizarEntrevista(EstadoEntrevista.CONSTRUCCION);
			if (aprobado)
				ape.setPagosRealizados(ape.getPagosRealizados() - 1);
			ape.setColorPagos(ConstantesPaneles.RED);
			ape.setColorIS3(ConstantesPaneles.RED);
			if (ultimaEntrevista != null
					&& ultimaEntrevista.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA))
				ape.setEntrevistasFinalizadas(true);
			else
				ape.setEntrevistasFinalizadas(false);
			alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
		}
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (is3 != null) {
			srvInformeIS3.eliminarInformeIS3(is3);
		}
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private void eliminarEntrevistaFinalCicloAnterior(Entrevista entrevista,
			InformeIS3 is3, List<Pago> pagos, PerfilAlumno p) {
		p.getHistorialEntrevistas().remove(entrevista);
		if (pagos != null)
			for (Pago pago : pagos) {
				srvPago.eliminarPago(pago);
			}
		if (is3 != null) {
			srvInformeIS3.eliminarInformeIS3(is3);
		}
		srvEntrevistas.eliminarEntrevista(entrevista);
		srvAlumno.modificarAlumno(p);
	}

	private boolean eliminarEntrevistaFinal(EntrevistaFinal entrevistaFinal,
			List<Pago> pagos, InformeIS3 is3, Entrevista entrevista,
			Entrevista ultimaEntrevista, AlumnoPanelEA ape, PerfilAlumno p,
			Beca beca) {
		boolean seEliminoEntrevista = false;
		CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		List<Long> periodosIds = PeriodoHelper
				.obtenerListaIdsPeriodos(cicloActual.getPeriodos());
		boolean entrevCicloActual = true;
		// Se comprueba si la entrevista a eliminar pertenece o no al ciclo
		// actual
		if (!periodosIds.contains(entrevistaFinal.getPeriodoDePago().getId())) {
			entrevCicloActual = false;
		}
		if (is3 != null) {
			if (!is3.getEstado().equals(EstadoInforme.ENVIADO)) {
				// Se chequea si la entrevista a eliminar se encuentra en estado
				// finalizada, ya que si es así tenemos
				// que volver atras el estado del alumno
				if (entrevistaFinal.getEstadoEntrevista().equals(
						EstadoEntrevista.FINALIZADA)) {
					if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
							&& (entrevistaFinal
									.getEvaluacionRenovacionFinal()
									.equals(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR) || entrevistaFinal
									.getEvaluacionRenovacionFinal()
									.equals(EvaluacionRenovacionFinal.PENDIENTE))) {
						if (entrevCicloActual) {
							if (entrevistaFinal.getEvaluacionCobroBeca() != null
									&& entrevistaFinal
											.getEvaluacionCobroBeca()
											.equals(EvaluacionCobroBeca.APROBADO)) {
								this.eliminarEntrevistaFinalPendiente(
										ultimaEntrevista, ape, entrevista, is3,
										pagos, p, true);
								seEliminoEntrevista = true;
							} else {
								this.eliminarEntrevistaFinalPendiente(
										ultimaEntrevista, ape, entrevista, is3,
										pagos, p, false);
								seEliminoEntrevista = true;
							}
						} else {
							this.eliminarEntrevistaFinalCicloAnterior(
									entrevista, is3, pagos, p);
							seEliminoEntrevista = true;
						}
					} else {
						if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
								&& (entrevistaFinal
										.getEvaluacionRenovacionFinal()
										.equals(EvaluacionRenovacionFinal.NO_RENUEVA) || entrevistaFinal
										.getEvaluacionRenovacionFinal()
										.equals(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE))) {
							if (entrevCicloActual) {
								if (entrevistaFinal.getEvaluacionCobroBeca() != null
										&& entrevistaFinal
												.getEvaluacionCobroBeca()
												.equals(EvaluacionCobroBeca.APROBADO)) {
									this.eliminarEntrevistaFinalIndividual(
											ultimaEntrevista, ape, entrevista,
											is3, pagos, p, beca, true);
									seEliminoEntrevista = true;
								} else {
									this.eliminarEntrevistaFinalIndividual(
											ultimaEntrevista, ape, entrevista,
											is3, pagos, p, beca, false);
									seEliminoEntrevista = true;
								}
							} else {
								this.eliminarEntrevistaFinalCicloAnterior(
										entrevista, is3, pagos, p);
								seEliminoEntrevista = true;
							}
						}
					}
				}
				// Si la entrevista está en construcción, nos sirve el eliminar
				// final individual
				else {
					if (entrevCicloActual) {
						this.eliminarEntrevistaFinalIndividual(
								ultimaEntrevista, ape, entrevista, is3, pagos,
								p, beca, false);
						seEliminoEntrevista = true;
					} else {
						this.eliminarEntrevistaFinalCicloAnterior(entrevista,
								is3, pagos, p);
						seEliminoEntrevista = true;
					}
				}
			} else {
				seEliminoEntrevista = false;
			}
		} else { // Se chequea si la entrevista a eliminar se encuentra en
					// estado finalizada, ya que si es así tenemos que volver
					// atras el
					// estado del alumno
			if (entrevistaFinal.getEstadoEntrevista().equals(
					EstadoEntrevista.FINALIZADA)) {
				if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
						&& (entrevistaFinal
								.getEvaluacionRenovacionFinal()
								.equals(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR) || entrevistaFinal
								.getEvaluacionRenovacionFinal().equals(
										EvaluacionRenovacionFinal.PENDIENTE))) {
					if (entrevCicloActual) {
						if (entrevistaFinal.getEvaluacionCobroBeca() != null
								&& entrevistaFinal.getEvaluacionCobroBeca()
										.equals(EvaluacionCobroBeca.APROBADO)) {
							this.eliminarEntrevistaFinalPendiente(
									ultimaEntrevista, ape, entrevista, is3,
									pagos, p, true);
							seEliminoEntrevista = true;
						} else {
							this.eliminarEntrevistaFinalPendiente(
									ultimaEntrevista, ape, entrevista, is3,
									pagos, p, false);
							seEliminoEntrevista = true;
						}
					} else {
						this.eliminarEntrevistaFinalCicloAnterior(entrevista,
								is3, pagos, p);
						seEliminoEntrevista = true;
					}
				} else {
					if (entrevistaFinal.getEvaluacionRenovacionFinal() != null
							&& (entrevistaFinal
									.getEvaluacionRenovacionFinal()
									.equals(EvaluacionRenovacionFinal.NO_RENUEVA) || entrevistaFinal
									.getEvaluacionRenovacionFinal()
									.equals(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE))) {
						if (entrevCicloActual) {
							if (entrevistaFinal.getEvaluacionCobroBeca() != null
									&& entrevistaFinal
											.getEvaluacionCobroBeca()
											.equals(EvaluacionCobroBeca.APROBADO)) {
								this.eliminarEntrevistaFinalIndividual(
										ultimaEntrevista, ape, entrevista, is3,
										pagos, p, beca, true);
								seEliminoEntrevista = true;
							} else {
								this.eliminarEntrevistaFinalIndividual(
										ultimaEntrevista, ape, entrevista, is3,
										pagos, p, beca, false);
								seEliminoEntrevista = true;
							}
						} else {
							this.eliminarEntrevistaFinalCicloAnterior(
									entrevista, is3, pagos, p);
							seEliminoEntrevista = true;
						}
					}
				}
			}
			// Si la entrevista está en construcción, nos sirve el eliminar
			// final individual
			else {
				if (entrevCicloActual) {
					this.eliminarEntrevistaFinalIndividual(ultimaEntrevista,
							ape, entrevista, is3, pagos, p, beca, false);
					seEliminoEntrevista = true;
				} else {
					this.eliminarEntrevistaFinalCicloAnterior(entrevista, is3,
							pagos, p);
					seEliminoEntrevista = true;
				}
			}
		}
		return seEliminoEntrevista;
	}

	@RequestMapping("/entrevistas/mostrarImagen.do")
	public void mostrarFirma(HttpServletResponse response,
			@RequestParam("dni") String dni) {
		response.setContentType("image/jpeg");
		OutputStream output = null;
		FileInputStream input = null;
		File file = null;
		// System.out.println(dni);
		// System.out.println(dni.toString());
		if (dni.equals("0"))
			file = new File(getProps().getProperty(
					ConstantesInformes.pathImagenBoletines)
					+ ConstantesInformes.imagenGenerica
					+ ConstantesInformes.extensionImagenBoletines);
		else
			file = new File(getProps().getProperty(
					ConstantesInformes.pathImagenBoletines)
					+ dni.toString()
					+ ConstantesInformes.extensionImagenBoletines);

		try {
			output = response.getOutputStream();
			input = new FileInputStream(file);
			byte[] buffer = new byte[(int) file.length()];
			input.read(buffer);
			response.setContentLength(buffer.length);
			output.write(buffer);
		} catch (Exception e) {
			file = new File(getProps().getProperty(
					ConstantesInformes.pathImagenBoletines)
					+ "sinfoto.jpg");
			try {
				output = response.getOutputStream();
				input = new FileInputStream(file);
				byte[] buffer = new byte[(int) file.length()];
				input.read(buffer);
				response.setContentLength(buffer.length);
				output.write(buffer);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			// e.printStackTrace();
		} finally {
			try {
				input.close();
				output.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void guardarFoto(Object foto, String dni) {
		try {
			CommonsMultipartFile imagen = (CommonsMultipartFile) foto;
			if ((imagen.getFileItem().getName().contains(".jpg") || imagen
					.getFileItem().getName().contains(".JPG"))) {
				File file = new File(getProps().getProperty(
						ConstantesInformes.pathImagenBoletines)
						+ dni.toString()
						+ ConstantesInformes.extensionImagenBoletines);
				imagen.transferTo(file);

				BufferedImage originalImage = ImageIO.read(file);
				int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB
						: originalImage.getType();

				// Reduce solo las imagenes mayores al tamaño que
				// predefinimos(400x300)
				if (originalImage.getWidth() > IMG_WIDTH) {
					BufferedImage resizeImageJpg = resizeImage(originalImage,
							type);
					ImageIO.write(resizeImageJpg, "jpg", file);
				}
			}

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static BufferedImage resizeImage(BufferedImage originalImage,
			int type) {
		BufferedImage resizedImage;
		if (originalImage.getHeight() > originalImage.getWidth())
			resizedImage = new BufferedImage(IMG_HEIGHT, IMG_WIDTH, type);
		else
			resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);

		Graphics2D g = resizedImage.createGraphics();
		if (originalImage.getHeight() > originalImage.getWidth())
			g.drawImage(originalImage, 0, 0, IMG_HEIGHT, IMG_WIDTH, null);
		else
			g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
		g.dispose();

		return resizedImage;
	}

	@RequestMapping("/entrevistas/altaBoletinNuevo.do")
	public ModelAndView altaBoletinNuevo(
			@RequestParam(required = false, value = "idBoletin") String idBoletin,
			@RequestParam(required = false, value = "idBecado") String idBecado,
			@RequestParam(required = false, value = "becado") String becado,
			@RequestParam(required = false, value = "ciclo") String ciclo,
			@RequestParam(required = false, value = "anioEscolar") String anioEscolar,
			@RequestParam(required = false, value = "anioAdicional") String anioAdicional,
			@RequestParam(required = false, value = "inas1") String inas1,
			@RequestParam(required = false, value = "inas2") String inas2,
			@RequestParam(required = false, value = "inas3") String inas3,
			@RequestParam(required = false, value = "qma1") String qma1,
			@RequestParam(required = false, value = "qma2") String qma2,
			@RequestParam(required = false, value = "qma3") String qma3,
			@RequestParam(required = false, value = "qmasf") String qmasf,
			@RequestParam(required = false, value = "qmaer") String qmaer,
			@RequestParam(required = false, value = "qmd1") String qmd1,
			@RequestParam(required = false, value = "qmd2") String qmd2,
			@RequestParam(required = false, value = "qmd3") String qmd3,
			@RequestParam(required = false, value = "qmdsf") String qmdsf,
			@RequestParam(required = false, value = "qmder") String qmder,
			@RequestParam(required = false, value = "qmsc1") String qmsc1,
			@RequestParam(required = false, value = "qmsc2") String qmsc2,
			@RequestParam(required = false, value = "qmsc3") String qmsc3,
			@RequestParam(required = false, value = "qmscsf") String qmscsf,
			@RequestParam(required = false, value = "qmscer") String qmscer,
			@RequestParam(required = false, value = "qmt1") String qmt1,
			@RequestParam(required = false, value = "qmt2") String qmt2,
			@RequestParam(required = false, value = "qmt3") String qmt3,
			@RequestParam(required = false, value = "qmtsf") String qmtsf,
			@RequestParam(required = false, value = "qmter") String qmter,
			@RequestParam(required = false, value = "cl1t") String cl1t,
			@RequestParam(required = false, value = "cl2t") String cl2t,
			@RequestParam(required = false, value = "cl3t") String cl3t,
			@RequestParam(required = false, value = "clsf") String clsf,
			@RequestParam(required = false, value = "cler") String cler,
			@RequestParam(required = false, value = "cm1t") String cm1t,
			@RequestParam(required = false, value = "cm2t") String cm2t,
			@RequestParam(required = false, value = "cm3t") String cm3t,
			@RequestParam(required = false, value = "cmsf") String cmsf,
			@RequestParam(required = false, value = "cmer") String cmer,
			@RequestParam(required = false, value = "cmp20201t") String cmp20201t,
			@RequestParam(required = false, value = "cmp20202t") String cmp20202t,
			@RequestParam(required = false, value = "cmp20203t") String cmp20203t,
			@RequestParam(required = false, value = "cmp2020sf") String cmp2020sf,
			@RequestParam(required = false, value = "cmp2020er") String cmp2020er,
			@RequestParam(required = false, value = "previas") String previas,
			@RequestParam(required = false, value = "mp1") String mp1,
			@RequestParam(required = false, value = "aep1") String aep1,
			@RequestParam(required = false, value = "jap1") String jap1,
			@RequestParam(required = false, value = "dip1") String dip1,
			@RequestParam(required = false, value = "fmp1") String fmp1,
			@RequestParam(required = false, value = "map1") String map1,
			@RequestParam(required = false, value = "mmap1") String mmap1,
			@RequestParam(required = false, value = "mp2") String mp2,
			@RequestParam(required = false, value = "aep2") String aep2,
			@RequestParam(required = false, value = "jap2") String jap2,
			@RequestParam(required = false, value = "dip2") String dip2,
			@RequestParam(required = false, value = "fmp2") String fmp2,
			@RequestParam(required = false, value = "map2") String map2,
			@RequestParam(required = false, value = "mmap2") String mmap2,
			@RequestParam(required = false, value = "mp3") String mp3,
			@RequestParam(required = false, value = "aep3") String aep3,
			@RequestParam(required = false, value = "jap3") String jap3,
			@RequestParam(required = false, value = "dip3") String dip3,
			@RequestParam(required = false, value = "fmp3") String fmp3,
			@RequestParam(required = false, value = "map3") String map3,
			@RequestParam(required = false, value = "mmap3") String mmap3,
			@RequestParam(required = false, value = "mp4") String mp4,
			@RequestParam(required = false, value = "aep4") String aep4,
			@RequestParam(required = false, value = "jap4") String jap4,
			@RequestParam(required = false, value = "dip4") String dip4,
			@RequestParam(required = false, value = "fmp4") String fmp4,

			@RequestParam(required = false, value = "map4") String map4,
			@RequestParam(required = false, value = "mmap4") String mmap4,
			@RequestParam(required = false, value = "mp5") String mp5,
			@RequestParam(required = false, value = "aep5") String aep5,
			@RequestParam(required = false, value = "jap5") String jap5,
			@RequestParam(required = false, value = "dip5") String dip5,
			@RequestParam(required = false, value = "fmp5") String fmp5,
			@RequestParam(required = false, value = "map5") String map5,
			@RequestParam(required = false, value = "mmap5") String mmap5,
			@RequestParam(required = false, value = "mp6") String mp6,
			@RequestParam(required = false, value = "aep6") String aep6,
			@RequestParam(required = false, value = "jap6") String jap6,
			@RequestParam(required = false, value = "dip6") String dip6,
			@RequestParam(required = false, value = "fmp6") String fmp6,
			@RequestParam(required = false, value = "map6") String map6,
			@RequestParam(required = false, value = "mmap6") String mmap6,
			@RequestParam(required = false, value = "idPrevia1") String idPrevia1,
			@RequestParam(required = false, value = "idPrevia2") String idPrevia2,
			@RequestParam(required = false, value = "idPrevia3") String idPrevia3,
			@RequestParam(required = false, value = "idPrevia4") String idPrevia4,
			@RequestParam(required = false, value = "idPrevia5") String idPrevia5,
			@RequestParam(required = false, value = "idPrevia6") String idPrevia6,
			@RequestParam(required = false, value = "cmp2020") String cmp2020,
			@RequestParam(required = false, value = "foto") Object foto)
			throws SQLException {

		if (idBoletin.equals("")) {
			// alta boletin
			String url = "jdbc:mysql://localhost/cimientos_testing";
			Connection cn = DriverManager.getConnection(url, "root", "root");
			String call = null;
			call = "insert into boletin_nuevo (idBecado,becado,ciclo,anioEscolar,anioAdicional,inas1,inas2,inas3,alumnoRegular,qma1,qma2,qma3,qmasf,qmaer,qmd1,qmd2,qmd3,qmdsf,qmder,qmsc1,qmsc2,qmsc3,qmscsf,qmscer,qmt1,qmt2,qmt3,qmtsf,qmter,cl1t,cl2t,cl3t,clsf,cler,cm1t,cm2t,cm3t,cmsf,cmer,cmp20201t,cmp20202t,cmp20203t,cmp2020sf,cmp2020er) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			// System.out.println(call);

			PreparedStatement preparedStmt = cn.prepareStatement(call);
			preparedStmt.setString(1, idBecado);
			preparedStmt.setString(2, becado);
			preparedStmt.setString(3, ciclo);
			preparedStmt.setString(4, anioEscolar);
			preparedStmt.setString(5, anioAdicional);
			preparedStmt.setString(6, inas1);
			preparedStmt.setString(7, inas2);
			preparedStmt.setString(8, inas3);
			preparedStmt.setString(9, "1");
			preparedStmt.setString(10, qma1);
			preparedStmt.setString(11, qma2);
			preparedStmt.setString(12, qma3);
			preparedStmt.setString(13, qmasf);
			preparedStmt.setString(14, qmaer);
			preparedStmt.setString(15, qmd1);
			preparedStmt.setString(16, qmd2);
			preparedStmt.setString(17, qmd3);
			preparedStmt.setString(18, qmdsf);
			preparedStmt.setString(19, qmder);
			preparedStmt.setString(20, qmsc1);
			preparedStmt.setString(21, qmsc2);
			preparedStmt.setString(22, qmsc3);
			preparedStmt.setString(23, qmscsf);
			preparedStmt.setString(24, qmscer);
			preparedStmt.setString(25, qmt1);
			preparedStmt.setString(26, qmt2);
			preparedStmt.setString(27, qmt3);
			preparedStmt.setString(28, qmtsf);
			preparedStmt.setString(29, qmter);
			preparedStmt.setString(30, cl1t);
			preparedStmt.setString(31, cl2t);
			preparedStmt.setString(32, cl3t);
			preparedStmt.setString(33, clsf);
			preparedStmt.setString(34, cler);
			preparedStmt.setString(35, cm1t);
			preparedStmt.setString(36, cm2t);
			preparedStmt.setString(37, cm3t);
			preparedStmt.setString(38, cmsf);
			preparedStmt.setString(39, cmer);
			preparedStmt.setString(40, cmp20201t);
			preparedStmt.setString(41, cmp20202t);
			preparedStmt.setString(42, cmp20203t);
			preparedStmt.setString(43, cmp2020sf);
			preparedStmt.setString(44, cmp2020er);
			preparedStmt.execute();
			cn.close();

			cn = null;
			CallableStatement cl = null;
			ResultSet rs = null;
			call = "{CALL SP_BuscarBoletinAlumno(?,?)}";
			cn = Conexion.getConexion();
			cl = cn.prepareCall(call);
			cl.setString(1, idBecado);
			cl.setString(2, ciclo);
			rs = cl.executeQuery();
			while (rs.next()) {
				idBoletin = rs.getString("id");
			}
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);

			cn = null;
			cl = null;
			cn = Conexion.getConexion();
			String query = "update perfil_alumno set boletin_nuevo="
					+ idBoletin + " where id=" + idBecado;
			// System.out.println(query);
			preparedStmt = cn.prepareStatement(query);
			preparedStmt.executeUpdate();

			cn.close();
		} else {
			// update
			String url = "jdbc:mysql://localhost/cimientos_testing";
			Connection cn = DriverManager.getConnection(url, "root", "root");
			String query = "update boletin_nuevo set inas1='" + inas1
					+ "',inas2='" + inas2 + "',inas3='" + inas3 + "',qma1='"
					+ qma1 + "',qma2='" + qma2 + "',qma3='" + qma3
					+ "',qmasf='" + qmasf + "',qmaer='" + qmaer + "',qmd1='"
					+ qmd1 + "',qmd2='" + qmd2 + "',qmd3='" + qmd3
					+ "',qmdsf='" + qmdsf + "',qmder='" + qmder + "',qmsc1='"
					+ qmsc1 + "',qmsc2='" + qmsc2 + "',qmsc3='" + qmsc3
					+ "',qmscsf='" + qmscsf + "',qmscer='" + qmscer
					+ "',qmt1='" + qmt1 + "',qmt2='" + qmt2 + "',qmt3='" + qmt3
					+ "',qmtsf='" + qmtsf + "',qmter='" + qmter + "',cl1t='"
					+ cl1t + "',cl2t='" + cl2t + "',cl3t='" + cl3t + "',clsf='"
					+ clsf + "',cler='" + cler + "',cm1t='" + cm1t + "',cm2t='"
					+ cm2t + "',cm3t='" + cm3t + "',cmsf='" + cmsf + "',cmer='"
					+ cmer + "',cmp20201t='" + cmp20201t + "',cmp20202t='"
					+ cmp20202t + "',cmp20203t='" + cmp20203t + "',cmp2020sf='"
					+ cmp2020sf + "',cmp2020er='" + cmp2020er + "' where id="
					+ idBoletin;
			// System.out.println(query);
			PreparedStatement preparedStmt;
			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// update
			url = "jdbc:mysql://localhost/cimientos_testing";
			cn = DriverManager.getConnection(url, "root", "root");
			//System.out.println(query);
			query = "update perfil_alumno set boletin_nuevo=" + idBoletin
					+ " where id=" + idBecado;
			//System.out.println(query);
			//

			try {
				preparedStmt = cn.prepareStatement(query);
				preparedStmt.executeUpdate();
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		// PREVIAS

		Long cantidadPrevias = 0L;

		if (!mp1.equals("Seleccioná")) {
			if (idPrevia1.equals("")) {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String call = null;
				call = "insert into previas_nuevo (previas_nuevo.idBecado, previas_nuevo.materia, previas_nuevo.anio_escolar, previas_nuevo.ja, previas_nuevo.di,previas_nuevo.fb, previas_nuevo.ma, previas_nuevo.mam) values(?,?,?,?,?,?,?,?)";
				// System.out.println(call);
				PreparedStatement preparedStmt = cn.prepareStatement(call);
				preparedStmt.setString(1, idBecado);
				preparedStmt.setString(2, mp1);
				preparedStmt.setString(3, aep1);
				preparedStmt.setString(4, jap1);
				preparedStmt.setString(5, dip1);
				preparedStmt.setString(6, fmp1);
				preparedStmt.setString(7, map1);
				preparedStmt.setString(8, mmap1);
				preparedStmt.execute();
				cn.close();
			} else {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String query = "update previas_nuevo set idBecado='" + idBecado
						+ "',materia='" + mp1 + "',anio_escolar='" + aep1
						+ "',ja='" + jap1 + "',di='" + dip1 + "',fb='" + fmp1
						+ "',ma='" + map1 + "',mam='" + mmap1 + "' where id="
						+ idPrevia1;
				// System.out.println(query);
				PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (!jap1.equals("Aprobado") && !dip1.equals("Aprobado")
					&& !fmp1.equals("Aprobado") && !map1.equals("Aprobado")) {
				cantidadPrevias++;
			}

		}
		if (!mp2.equals("Seleccioná")) {
			if (idPrevia2.equals("")) {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String call = null;
				call = "insert into previas_nuevo (previas_nuevo.idBecado, previas_nuevo.materia, previas_nuevo.anio_escolar, previas_nuevo.ja, previas_nuevo.di,previas_nuevo.fb, previas_nuevo.ma, previas_nuevo.mam) values(?,?,?,?,?,?,?,?)";
				// System.out.println(call);
				PreparedStatement preparedStmt = cn.prepareStatement(call);
				preparedStmt.setString(1, idBecado);
				preparedStmt.setString(2, mp2);
				preparedStmt.setString(3, aep2);
				preparedStmt.setString(4, jap2);
				preparedStmt.setString(5, dip2);
				preparedStmt.setString(6, fmp2);
				preparedStmt.setString(7, map2);
				preparedStmt.setString(8, mmap2);
				preparedStmt.execute();
				cn.close();
			} else {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String query = "update previas_nuevo set idBecado='" + idBecado
						+ "',materia='" + mp2 + "',anio_escolar='" + aep2
						+ "',ja='" + jap2 + "',di='" + dip2 + "',fb='" + fmp2
						+ "',ma='" + map2 + "',mam='" + mmap2 + "' where id="
						+ idPrevia2;
				// System.out.println(query);
				PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (!jap2.equals("Aprobado") && !dip2.equals("Aprobado")
					&& !fmp2.equals("Aprobado") && !map2.equals("Aprobado")) {
				cantidadPrevias++;
			}
		}

		if (!mp3.equals("Seleccioná")) {
			if (idPrevia3.equals("")) {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String call = null;
				call = "insert into previas_nuevo (previas_nuevo.idBecado, previas_nuevo.materia, previas_nuevo.anio_escolar, previas_nuevo.ja, previas_nuevo.di,previas_nuevo.fb, previas_nuevo.ma, previas_nuevo.mam) values(?,?,?,?,?,?,?,?)";
				// System.out.println(call);
				PreparedStatement preparedStmt = cn.prepareStatement(call);
				preparedStmt.setString(1, idBecado);
				preparedStmt.setString(2, mp3);
				preparedStmt.setString(3, aep3);
				preparedStmt.setString(4, jap3);
				preparedStmt.setString(5, dip3);
				preparedStmt.setString(6, fmp3);
				preparedStmt.setString(7, map3);
				preparedStmt.setString(8, mmap3);
				preparedStmt.execute();
				cn.close();
			} else {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String query = "update previas_nuevo set idBecado='" + idBecado
						+ "',materia='" + mp3 + "',anio_escolar='" + aep3
						+ "',ja='" + jap3 + "',di='" + dip3 + "',fb='" + fmp3
						+ "',ma='" + map3 + "',mam='" + mmap3 + "' where id="
						+ idPrevia3;
				// System.out.println(query);
				PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (!jap3.equals("Aprobado") && !dip3.equals("Aprobado")
					&& !fmp3.equals("Aprobado") && !map3.equals("Aprobado")) {
				cantidadPrevias++;
			}
		}

		if (!mp4.equals("Seleccioná")) {
			if (idPrevia4.equals("")) {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String call = null;
				call = "insert into previas_nuevo (previas_nuevo.idBecado, previas_nuevo.materia, previas_nuevo.anio_escolar, previas_nuevo.ja, previas_nuevo.di,previas_nuevo.fb, previas_nuevo.ma, previas_nuevo.mam) values(?,?,?,?,?,?,?,?)";
				// System.out.println(call);
				PreparedStatement preparedStmt = cn.prepareStatement(call);
				preparedStmt.setString(1, idBecado);
				preparedStmt.setString(2, mp4);
				preparedStmt.setString(3, aep4);
				preparedStmt.setString(4, jap4);
				preparedStmt.setString(5, dip4);
				preparedStmt.setString(6, fmp4);
				preparedStmt.setString(7, map4);
				preparedStmt.setString(8, mmap4);
				preparedStmt.execute();
				cn.close();
			} else {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String query = "update previas_nuevo set idBecado='" + idBecado
						+ "',materia='" + mp4 + "',anio_escolar='" + aep4
						+ "',ja='" + jap4 + "',di='" + dip4 + "',fb='" + fmp4
						+ "',ma='" + map4 + "',mam='" + mmap4 + "' where id="
						+ idPrevia4;
				// System.out.println(query);
				PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (!jap4.equals("Aprobado") && !dip4.equals("Aprobado")
					&& !fmp4.equals("Aprobado") && !map4.equals("Aprobado")) {
				cantidadPrevias++;
			}
		}

		if (!mp5.equals("Seleccioná")) {
			if (idPrevia5.equals("")) {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String call = null;
				call = "insert into previas_nuevo (previas_nuevo.idBecado, previas_nuevo.materia, previas_nuevo.anio_escolar, previas_nuevo.ja, previas_nuevo.di,previas_nuevo.fb, previas_nuevo.ma, previas_nuevo.mam) values(?,?,?,?,?,?,?,?)";
				// System.out.println(call);
				PreparedStatement preparedStmt = cn.prepareStatement(call);
				preparedStmt.setString(1, idBecado);
				preparedStmt.setString(2, mp5);
				preparedStmt.setString(3, aep5);
				preparedStmt.setString(4, jap5);
				preparedStmt.setString(5, dip5);
				preparedStmt.setString(6, fmp5);
				preparedStmt.setString(7, map5);
				preparedStmt.setString(8, mmap5);
				preparedStmt.execute();
				cn.close();
			} else {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String query = "update previas_nuevo set idBecado='" + idBecado
						+ "',materia='" + mp5 + "',anio_escolar='" + aep5
						+ "',ja='" + jap5 + "',di='" + dip5 + "',fb='" + fmp5
						+ "',ma='" + map5 + "',mam='" + mmap5 + "' where id="
						+ idPrevia5;
				// System.out.println(query);
				PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (!jap5.equals("Aprobado") && !dip5.equals("Aprobado")
					&& !fmp5.equals("Aprobado") && !map5.equals("Aprobado")) {
				cantidadPrevias++;
			}
		}

		if (!mp6.equals("Seleccioná")) {
			if (idPrevia6.equals("")) {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String call = null;
				call = "insert into previas_nuevo (previas_nuevo.idBecado, previas_nuevo.materia, previas_nuevo.anio_escolar, previas_nuevo.ja, previas_nuevo.di,previas_nuevo.fb, previas_nuevo.ma, previas_nuevo.mam) values(?,?,?,?,?,?,?,?)";
				// System.out.println(call);
				PreparedStatement preparedStmt = cn.prepareStatement(call);
				preparedStmt.setString(1, idBecado);
				preparedStmt.setString(2, mp6);
				preparedStmt.setString(3, aep6);
				preparedStmt.setString(4, jap6);
				preparedStmt.setString(5, dip6);
				preparedStmt.setString(6, fmp6);
				preparedStmt.setString(7, map6);
				preparedStmt.setString(8, mmap6);
				preparedStmt.execute();
				cn.close();
			} else {
				String url = "jdbc:mysql://localhost/cimientos_testing";
				Connection cn = DriverManager
						.getConnection(url, "root", "root");
				String query = "update previas_nuevo set idBecado='" + idBecado
						+ "',materia='" + mp6 + "',anio_escolar='" + aep6
						+ "',ja='" + jap6 + "',di='" + dip6 + "',fb='" + fmp6
						+ "',ma='" + map6 + "',mam='" + mmap6 + "' where id="
						+ idPrevia6;
				// System.out.println(query);
				PreparedStatement preparedStmt;
				try {
					preparedStmt = cn.prepareStatement(query);
					preparedStmt.executeUpdate();
					cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (!jap6.equals("Aprobado") && !dip6.equals("Aprobado")
					&& !fmp6.equals("Aprobado") && !map6.equals("Aprobado")) {
				cantidadPrevias++;
			}
		}

		String url = "jdbc:mysql://localhost/cimientos_testing";
		Connection cn = DriverManager.getConnection(url, "root", "root");
		String query = "update alumno_panelea set alumno_panelea.cantidad_previas="
				+ cantidadPrevias
				+ " where alumno_panelea.id_perfil_alumno="
				+ idBecado;
		// System.out.println(query);
		PreparedStatement preparedStmt;
		try {
			preparedStmt = cn.prepareStatement(query);
			preparedStmt.executeUpdate();
			cn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		url = "jdbc:mysql://localhost/cimientos_testing";
		cn = DriverManager.getConnection(url, "root", "root");
		query = "update alumno_panelea set alumno_panelea.color_boletin='red' where alumno_panelea.id_perfil_alumno="
				+ idBecado;
		// System.out.println(query);
		// PreparedStatement preparedStmt;
		try {
			preparedStmt = cn.prepareStatement(query);
			preparedStmt.executeUpdate();
			cn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String nombreFotoBoletin = idBecado + "-" + idBoletin;
		guardarFoto(foto, nombreFotoBoletin);

		// return altaBoletinNuevo(idBecado, becado, ciclo, anioEscolar,
		// anioAdicional, inas1, inas2, inas3, qma1, qma2, qma3, qmasf, qmaer,
		// qmd1, qmd2, qmd3, qmdsf, qmder, qmsc1, qmsc2, qmsc3, qmscsf, qmscer,
		// qmt1, qmt2, qmt3, qmtsf, qmter, cl1t, cl2t, cl3t, clsf, cler, cm1t,
		// cm2t, cm3t, cmsf, cmer, urlInforme);
		return new ModelAndView("redirect://entrevistas/listarBecados.do");
	}

	// ENTREVISTA FEBRERO 2020

	@RequestMapping("/entrevistas/listarBecadosFebrero.do")
	public ModelAndView listarBecadosFebrero(HttpServletRequest req,
			@RequestParam(required = false, value = "mensaje") String mensaje,
			@RequestParam(required = false, value = "error") String error) {
		HashMap<String, Object> model = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		List<AlumnoPanelEA> alumnos = new ArrayList<AlumnoPanelEA>();
		PerfilEA perfilEA = getPerfilEA(req);

		if (perfilEA != null) {
			alumnos = alumnoPanelEaSrv.actualizarPagosEntrevistas(perfilEA
					.getIdPerfilEA());
		}
		model.put("alumnos", alumnos);
		model.put("idEA", perfilEA.getIdPerfilEA());
		session.setAttribute("menu", ConstantesMenu.menuAcompanamiento);
		if (StringUtils.isNotBlank(mensaje))
			model.put("mensaje", mensaje);
		if (StringUtils.isNotBlank(error))
			model.put("error", error);
		return forward("/entrevistas/listaBecadosFebrero", model);
	}

	@RequestMapping("/entrevistas/listaEntrevistasViewFebrero.do")
	public ModelAndView listarEntrevistasFebrero(
			@RequestParam("idAlumno") Long idAlumno) {
		HashMap<String, Object> model = new HashMap<String, Object>();

		PerfilAlumno perfil = srvAlumno.obtenerAlumno(idAlumno);
		List<Long> periodosIds;
		// Si el alumno no tiene beca es porque ya se le realizo la entrevista
		// final y se le saco la beca, pero aun debe estar en el panel
		// hasta el cierre de ciclo
		if (perfil.getBeca() != null)
			periodosIds = PeriodoHelper.obtenerListaIdsPeriodos(perfil
					.getBeca().getCiclo().getPeriodos());
		else
			periodosIds = PeriodoHelper.obtenerListaIdsPeriodos(srvCiclo
					.obtenerCicloActual().getPeriodos());

		model.put("entrevistas", srvEntrevistas
				.obtenerEntrevistasIndividualesPorId(idAlumno, periodosIds));
		model.put("alumno", perfil);
		model.put("idEA", perfil.getEa().getIdPerfilEA());
		model.put("tipoEntrevista", verTipoEntrevista(perfil, periodosIds));

		return forward("/entrevistas/listaBecadosFebrero", model);
	}

	@RequestMapping("/entrevistas/guardarFebrero.do")
	public ModelAndView registrarFinalFebrero(
			HttpServletRequest req,
			@ModelAttribute("entrevistaIndividual") EntrevistaFebrero entrevista,
			@RequestParam("alumnoId") Long id,
			@RequestParam("valorGuardar") String valor,
			@RequestParam("aislsdrs") String aislsdrs,
			@RequestParam("motivoAusenciaRa2") String motivoAusenciaRa2,
			@RequestParam("sea") String sea,
			@RequestParam("cup") String cup,
			@RequestParam("wifi") String wifi,
			@RequestParam("pc") String pc,
			@RequestParam("epaev") String epaev,
			@RequestParam("spe") String spe,
			@RequestParam("planAccion") String planAccion,
			@RequestParam("detallarAcreditacion") String detallarAcreditacion,
			@RequestParam("referenteEscolar") String referenteEscolar,
			@RequestParam("tipoEncuentroAcompanamiento") String tipoEncuentroAcompanamiento,
			@RequestParam("rae") String rae,

			@RequestParam("valorPerfil") String valorPerfil)
			throws CimientosExceptionHandler {

		TipoEntrevista tipoEntrevista = TipoEntrevista.FEBRERO;
		entrevista.setMotivoAusenciaRA2(motivoAusenciaRa2);
		entrevista.setAislsdrs(aislsdrs);
		entrevista.setSea(sea);
		entrevista.setCup(cup);
		entrevista.setWifi(wifi);
		entrevista.setPc(pc);
		entrevista.setEpaev(epaev);
		entrevista.setSpe(spe);
		entrevista.setPlanAccion(planAccion);
		entrevista.setDetallarAcreditacion(detallarAcreditacion);
		entrevista.setReferenteEscolar(referenteEscolar);
		entrevista.setTipoEncuentroAcompanamiento(tipoEncuentroAcompanamiento);
		entrevista.setRae(rae);

		registrarEntrevistaFebrero(entrevista, id, valor, valorPerfil,
				tipoEntrevista);

		if (valorPerfil.equals("rr")) {
			return listaEntrevistasAprobar(req);
		} else if (valorPerfil.equals("ea")) {
			return listarEntrevistasFebrero(id);
		} else {
			return new ModelAndView(
					"redirect://exportacionEntrevistas/verExportarEntrevistas.do");

		}

	}

	private void registrarEntrevistaFebrero(EntrevistaIndividual entrevista,
			Long id, String valor, String valorPerfil,
			TipoEntrevista tipoEntrevista) {
		PerfilAlumno p = srvAlumno.obtenerAlumno(id);
		// Periodo periodo = calcularProximoPeriodo(p);
		Periodo periodo = new Periodo();
		periodo.setId(2L);
		entrevista.setEstadoEntrevista(EstadoEntrevista.getEstadoEntrevista(1));
		if (entrevista.getId() == null) {
			entrevista.setTipoEntrevista(tipoEntrevista);
			entrevista.setPeriodoDePago(periodo);
			entrevista.setFechaCarga(new Date());
			entrevista.setPerfilAlumno(p);
			entrevista.setEa(p.getEa());
			entrevista.setRr(p.getEa().getRr());
			entrevista.setEscuelaAlumno(p.getEscuela());
			entrevista.setAnioEscolar(p.getAnioEscolar());
			entrevista.setFechaAltaBeca(p.getFechaAltaBeca()); // Tomo la fecha
																// de alta beca
																// del alumno!!!
			// ape.incrementarEntrevista(entrevista.getEstadoEntrevista());
		} else {
			actualizarEntrevista(entrevista);
			// ape.actualizarEntrevista(entrevista.getEstadoEntrevista());
		}
		agregarExportacionEspecialFebrero(entrevista);
		if (valor.equals("f") || valor.equals("s")) {
			Long estadoPago = 0L;
			entrevista.setEstadoEntrevista(EstadoEntrevista.FINALIZADA);
			if (entrevista.getEvaluacionCobroBeca().equals(
					EvaluacionCobroBeca.SUSPENDIDO)) {
				estadoPago = 5L;
			}
			if (entrevista.getEvaluacionCobroBeca().equals(
					EvaluacionCobroBeca.APROBADO)) {
				estadoPago = 0L;
			}
			Connection cn = null;
			cn = Conexion.getConexion();
			Statement st;
			try {
				st = cn.createStatement();
				st.executeUpdate("delete from pago where becado="
						+ entrevista.getPerfilAlumno().getId()
						+ " and periodo=2"); // periodo366x2 que corresponde a
												// febrero 2021F
				st.close();
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarConexion(cn);

			}
			cn = null;
			cn = Conexion.getConexion();
			try {
				st = cn.createStatement();
				st.executeUpdate("insert into pago (estado_pago,extra,fecha_aprobacionrr,monto,becado,periodo,ra) values("
						+ estadoPago
						+ ",0,NOW(),2100,"
						+ entrevista.getPerfilAlumno().getId()
						+ ",2,"
						+ entrevista.getPerfilAlumno().getResponsable1()
								.getId() + ")");
				// st.executeUpdate("update perfil_alumno p set p.revertir_pago='si' where p.id="+id);
				st.close();
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarConexion(cn);

			}

		}
		if (valor.equals("c")) {
			entrevista.setEstadoEntrevista(EstadoEntrevista.CONSTRUCCION);
			Connection cn = null;
			cn = Conexion.getConexion();
			Statement st;
			try {
				st = cn.createStatement();
				st.executeUpdate("delete from pago where becado="
						+ entrevista.getPerfilAlumno().getId()
						+ " and periodo=2");
				st.close();
				Conexion.cerrarConexion(cn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Conexion.cerrarConexion(cn);

			}

		}
		srvEntrevistas.guardarEntrevista(entrevista);

	}

	@RequestMapping("/entrevistas/modificarEntrevistaFebreroView.do")
	public ModelAndView irAEditarEntrevistaFebrero(
			@RequestParam("entrevistaId") Long idEntrevista,
			@RequestParam("tipoEntrevistaId") Integer idTipoEntrevista,
			HttpServletRequest request) {

		return cargarDatosEntrevistaFebrero(idEntrevista, idTipoEntrevista,
				"ea", "modificar", request, "");
	}

	private ModelAndView cargarDatosEntrevistaFebrero(Long idEntrevista,
			Integer idTipoEntrevista, String tipoPerfil, String tipoVIsta,
			HttpServletRequest request, String valorPerfil) {
		TipoEntrevista tipo = TipoEntrevista
				.getTipoEntrevista(idTipoEntrevista);
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("tipoPerfil", tipoPerfil);
		model.put("materiasBasicas", srvMateria.obtenerMateriasBasicas(true));
		model.put("fechaActual",
				Formateador.formatearFecha(new Date(), "dd/MM/yyyy"));
		EntrevistaIndividual entrevistaIndividual = (EntrevistaIndividual) srvEntrevistas
				.obtenerEntrevista(idEntrevista);
		PerfilAlumno perfil = srvAlumno.obtenerAlumno(entrevistaIndividual
				.getPerfilAlumno().getId());
		// CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		CicloPrograma cicloActual = new CicloPrograma();
		cicloActual.setId(32L);
		cicloActual.setNombre("2021");

		if (tipoPerfil == "ea") {
			model.put("idEA", getPerfilEA(request).getIdPerfilEA());
		} else {
			model.put("idEA", entrevistaIndividual.getEa().getIdPerfilEA());
		}

		if (StringUtils.isNotBlank(valorPerfil)) {
			List<EntrevistaIndividual> entrevistas = srvEntrevistas
					.obtenerTodasEntrevistasPorAlumno(perfil.getId(),
							"descendiente");
			EntrevistaIndividual ultimaEntrevista = (EntrevistaIndividual) entrevistas
					.get(0);
			if (ultimaEntrevista.getId().equals(entrevistaIndividual.getId())
					&& entrevistaIndividual.getEstadoEntrevista().equals(
							EstadoEntrevista.FINALIZADA)
					&& entrevistaIndividual.getPeriodoDePago().getCiclo()
							.equals(cicloActual))
				model.put("ultimaEntrevista", true);
			else
				model.put("ultimaEntrevista", false);
		} else
			model.put("ultimaEntrevista", false);

		// la entrevista es final
		EntrevistaFebrero entrevistaFinal = (EntrevistaFebrero) entrevistaIndividual;

		cargarDatosEntrevista(entrevistaFinal, model);
		model.put("dirMail", entrevistaFinal.getDirMail());
		model.put("facebook", entrevistaFinal.getFacebook());
		model.put("telFijo", entrevistaFinal.getTelFijo());
		model.put("celular", entrevistaFinal.getCelular());
		cargarLugarEncuentro(entrevistaFinal.getLugarEntrevista(), model);
		model.put("motivoNoRenovacion",
				MotivoNoRenovacion.getmotivoNoRenovacionFinal());
		model.put("evaluacionCobroBeca",
				EvaluacionCobroBeca.getEvaluacionCobroBecaFinal2017());
		model.put("escuelasPorZona", registrarEscuelasBecasSrv
				.obtenerEscuelasPorZona(entrevistaFinal.getEscuelaAlumno()
						.getLocalidad().getZona()));
		model.put("sextoAnio", false);
		model.put("sea", entrevistaFinal.getTipoEncuentroAcompanamiento());
		model.put("sea", entrevistaFinal.getSea());
		model.put("cup", entrevistaFinal.getCup());
		model.put("wifi", entrevistaFinal.getWifi());
		model.put("pc", entrevistaFinal.getPc());
		model.put("epaev", entrevistaFinal.getEpaev());
		model.put("spe", entrevistaFinal.getSpe());
		model.put("planAccion", entrevistaFinal.getPlanAccion());
		model.put("detallarAcreditacion",
				entrevistaFinal.getDetallarAcreditacion());
		model.put("referenteEscolar", entrevistaFinal.getReferenteEscolar());
		model.put("rae", entrevistaFinal.getRae());

		List<ResultadoAnioEscolar> anios = new ArrayList<ResultadoAnioEscolar>();
		List<EvaluacionRenovacionFinal> evaluacion = new ArrayList<EvaluacionRenovacionFinal>();

		if (tipoVIsta.equals("ver")) {
			model.put("evaluacionRenovacionFinal",
					EvaluacionRenovacionFinal.getEvaluacionRenovacionFinal());
			model.put("resultadoAnioEscolar",
					ResultadoAnioEscolar.getResultadoAnioEscolar());
			return forward(pathVerEntrevistaFinal, model);
		} else {
			// //System.out.println(perfil.getAnioAdicional());
			// //System.out.println(perfil.getAnioEscolar().getId());
			// //System.out.println(perfil.getEae());
			if (perfil.getEae().equals("7/5")) {
				if (perfil.getAnioEscolar().getId() == 13) {
					if (perfil.getAnioAdicional() == true) {
						anios.add(ResultadoAnioEscolar.PENDIENTE);
						// anios.add(ResultadoAnioEscolar.PROMOVIDO);
						// anios.add(ResultadoAnioEscolar.PROMOVIDO_CON_PREVIAS);
						// anios.add(ResultadoAnioEscolar.REPITIO);
						evaluacion
								.add(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR);
						evaluacion.add(EvaluacionRenovacionFinal.NO_RENUEVA);
						evaluacion.add(EvaluacionRenovacionFinal.PENDIENTE);
						model.put("ultimoAnio", false);
					} else {
						// anios.add(ResultadoAnioEscolar.EGRESO);
						// anios.add(ResultadoAnioEscolar.PENDIENTE);
						anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE);
						evaluacion
								.add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);
						model.put("ultimoAnio", true);
					}

				} else {
					if (perfil.getAnioEscolar().getId() == 14) {
						// anios.add(ResultadoAnioEscolar.EGRESO);
						// anios.add(ResultadoAnioEscolar.PENDIENTE);
						anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE);
						evaluacion
								.add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);
						model.put("ultimoAnio", true);
					} else {
						anios.add(ResultadoAnioEscolar.PENDIENTE);
						// anios.add(ResultadoAnioEscolar.PROMOVIDO);
						// anios.add(ResultadoAnioEscolar.PROMOVIDO_CON_PREVIAS);
						// anios.add(ResultadoAnioEscolar.REPITIO);
						evaluacion
								.add(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR);
						evaluacion.add(EvaluacionRenovacionFinal.NO_RENUEVA);
						evaluacion.add(EvaluacionRenovacionFinal.PENDIENTE);
						model.put("ultimoAnio", false);
					}
				}
			} else {
				if (permiteElegirEgreso(perfil)) {
					// anios.add(ResultadoAnioEscolar.EGRESO);
					// anios.add(ResultadoAnioEscolar.PENDIENTE);
					anios.add(ResultadoAnioEscolar.EGRESO_PENDIENTE);
					evaluacion
							.add(EvaluacionRenovacionFinal.FIN_PARTICIPACION_PFE);
					model.put("ultimoAnio", true);
				} else {
					anios.add(ResultadoAnioEscolar.PENDIENTE);
					// anios.add(ResultadoAnioEscolar.PROMOVIDO);
					// anios.add(ResultadoAnioEscolar.PROMOVIDO_CON_PREVIAS);
					// anios.add(ResultadoAnioEscolar.REPITIO);
					evaluacion
							.add(EvaluacionRenovacionFinal.EN_CONDICIONES_DE_RENOVAR);
					evaluacion.add(EvaluacionRenovacionFinal.NO_RENUEVA);
					evaluacion.add(EvaluacionRenovacionFinal.PENDIENTE);
					model.put("ultimoAnio", false);
				}
			}

			model.put("evaluacionRenovacionFinal", evaluacion);
			model.put("resultadoAnioEscolar", anios);
		}
		if (tipoVIsta.equals("modificar"))
			return forward(pathEntrevistaFebrero, model);
		else
			return forward(pathVerEntrevistaFinal, model);

	}

	private void agregarExportacionEspecialFebrero(
			EntrevistaIndividual entrevista) {

		ExportacionEspecial exportacion = null;
		PerfilAlumno alumno = entrevista.getPerfilAlumno();

		if (entrevista.getExportacionEspecial() == null) {
			// Se crea el registro y se insertan los datos especiales, estos son
			// fijos durante el proceso de entrevista

			exportacion = new ExportacionEspecial();

			Beca beca = alumno.getBeca();

			// se asegura de que los datos de anio escolar y de escuela queden
			// seteados en la entrevista.
			if (entrevista.getAnioEscolar() == null) {
				entrevista.setAnioEscolar(alumno.getAnioEscolar());
			}
			if (entrevista.getEscuelaAlumno() == null) {
				entrevista.setEscuelaAlumno(alumno.getEscuela());
			}

			Integer edad = null;
			Calendar calendarHoy = GregorianCalendar.getInstance();
			calendarHoy.setTime(entrevista.getFechaCarga());
			Calendar calendarNac = GregorianCalendar.getInstance();
			calendarNac.setTime(alumno.getDatosPersonales()
					.getFechaNacimiento());
			edad = calendarHoy.get(Calendar.YEAR)
					- calendarNac.get(Calendar.YEAR);
			exportacion.setEdad(edad);

			String padrino = (beca.getPadrino().getEmpresa() != null ? beca
					.getPadrino().getEmpresa().getDenominacion() : beca
					.getPadrino().getDatosPersonales().getApellido()
					+ ", " + beca.getPadrino().getDatosPersonales().getNombre());
			exportacion.setIdBeca(beca.getId());
			exportacion.setPadrino(padrino);
			exportacion.setIdPadrino(beca.getPadrino().getId());
			exportacion.setTipoPadrino(beca.getPadrino().getTipo().getValor());
			entrevista.setExportacionEspecial(exportacion);
		} else {
			// este registro existe
			exportacion = entrevista.getExportacionEspecial();
		}

	}

}