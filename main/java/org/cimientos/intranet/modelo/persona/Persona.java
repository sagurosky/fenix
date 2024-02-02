package org.cimientos.intranet.modelo.persona;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.perfilstaff.PerfilStaff;
import org.cimientos.intranet.modelo.perfilvoluntario.PerfilVoluntario;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.cimientos.intranet.modelo.usuario.Usuario;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.cimientos.intranet.enumerativos.EstadoCivil;
import com.cimientos.intranet.enumerativos.TipoDni;
import com.googlecode.ehcache.annotations.Cacheable;

/**
 * Persona.
 * 
 * @author Juan Irungaray
 */
@Entity
 @Cache(usage=CacheConcurrencyStrategy.READ_WRITE, region="org.cimientos.intranet.modelo.persona.Persona") 
public class Persona implements Serializable{

	/** The Constant PERFIL_EA. */
	public static final String PERFIL_EA = "EA";
	
	/** The Constant PERFIL_RR. */
	public static final String PERFIL_RR = "RR";
	
	/** The Constant PERFIL_TS. */
	public static final String PERFIL_TS = "TS";
	
	/** The Constant PERFIL_COORD_PBE. */
	public static final String PERFIL_COORD_PBE = "CPBE";
	
	/** The Constant PERFIL_SELECTOR. */
	public static final String PERFIL_SELECTOR = "SEL";
	
	/** The Constant PERFIL_CORRECTOR. */
	public static final String PERFIL_CORRECTOR = "CORR";
	
	/** The Constant PERFIL_ADMINISTRACION. */
	public static final String PERFIL_ADMINISTRACION = "ADM";
	
	/** The Constant PERFIL_DI. */
	public static final String PERFIL_DI = "DI";
	
	/** The Constant PERFIL_SYSADMIN. */
	public static final String PERFIL_SYSADMIN = "SYS";
	
	/** The Constant PERFIL_BECADO. */
	public static final String PERFIL_BECADO = "BEC";
	
	/** The Constant PERFIL_PADRINO. */
	public static final String PERFIL_PADRINO = "PAD";
	
	/** The Constant PERFIL_VOLUNTARIO. */
	public static final String PERFIL_VOLUNTARIO = "VOL";
	
	/** The Constant PERFIL_STAFF. */
	public static final String PERFIL_STAFF = "STAF";
	
	/** The Constant PERFIL_RESP_ADULTO. */
	public static final String PERFIL_RESP_ADULTO = "RA";
	
	public static final String PERFIL_RRHH = "RRHH";
	
	public static final String PERFIL_ASIST = "ASIST";

	public static final String PERFIL_VISITA = "Visita";
	
	public static final String PERFIL_SUPER_USUARIO = "SuperUsuario";
	
	/** The id persona. */
	@Id
	@GeneratedValue
	private Long id;

	/** The nombre. */

	private String nombre;

	/** The apellido. */
	private String apellido;

	/** The barrio. */
	private String barrio;
	
	/** The tipo dni. */
	private TipoDni tipoDni;
	
	/** The dni. */
	private Integer dni;

	/** The cuil cuit. */
	private String cuilCuit;

	/** The direccion. */
	private String direccion;
	
	/** The departamento. */
	private String departamento;

	/** The codigo postal. */
	private String codigoPostal;

	/** The telefono. */
	private String telefono;

	/** The celular. */
	private String celular;

	/** The perfil staff. */
	@OneToOne(cascade = CascadeType.ALL)
	private PerfilStaff perfilStaff;

	/** The perfil rr. */
	@OneToOne(cascade = CascadeType.ALL)
	private PerfilRR perfilRR;

	//fetch = FetchType.LAZY
	/** The perfil ea. */
	@OneToOne(cascade = CascadeType.ALL)
	private PerfilEA perfilEA;

	/** The perfil ts. */
	@OneToOne(cascade = CascadeType.ALL)
	private PerfilTS perfilTS;

	/** The perfil voluntario. */
	@OneToOne(cascade = CascadeType.ALL)
	private PerfilVoluntario perfilVoluntario;
	
	/** The perfil alumno. */
	@OneToOne(cascade = CascadeType.ALL)
	private PerfilAlumno perfilAlumno;

	/** The credenciales. */
	@OneToOne(cascade = CascadeType.ALL)
	private Usuario credenciales;
	
	/** The fecha nacimiento. */
	private Date fechaNacimiento;

	/** true = femenino, false masculino. */
	private boolean sexo;

	/** The estado civil. */
	@Enumerated(EnumType.ORDINAL)
	private EstadoCivil estadoCivil;

	/** The mail. */
	private String mail;

	/** The localidad. */
	@ManyToOne
	private Localidad localidad;
	
	/** The entre calles. */
	private String entreCalles;
	
	/** The provincia. */
	@ManyToOne
	private Provincia provincia;
	
		
	
	/* Perfiles */
	/** The perfil admin. */
	private Boolean perfilAdmin = false;
	
	/** The perfil sys admin. */
	private Boolean perfilSysAdmin= false;
	
	/** The perfil coord pbe. */
	private Boolean perfilCoordPBE= false;
	
	/** The perfil corrector. */
	private Boolean perfilCorrector= false;
	
	/** The perfil selector. */
	private Boolean perfilSelector= false;
	
	/** The perfil di. */
	private Boolean perfilDI= false;
	
	private Boolean perfilRRHH = false;
	
	private Boolean perfilAsist = false;

	private Boolean perfilVisita = false;
	
	private Boolean perfilSuperUsuario = false;
	
	
	/** The activo. */
	private Boolean activo;
	
	/** The nacionalidad. */
	private String nacionalidad;
	
	/** The numero calle. */
	private String numeroCalle;
	
	/** The piso. */
	private String piso;
	
	private int edad;
	
	/**
	 * Constructor creado para hibernate.
	 *
	 * @since 14-feb-2011
	 * @author cfigueroa
	 */
	public Persona(){
		this.setPerfilAdmin(false);
		this.setPerfilCoordPBE(false);
		this.setPerfilSelector(false);
		this.setPerfilCorrector(false);
		this.setPerfilDI(false);
		this.setPerfilSysAdmin(false);
		this.setPerfilRRHH(false);
		this.setPerfilAsist(false);
		this.setPerfilVisita(false);
		this.setPerfilSuperUsuario(false);
	};
	
	/**
	 * Constructo creado para copiar los datos de Persona a PersonaSeleccion.
	 *
	 * @param personaSeleccion the persona seleccion
	 * @since 14-feb-2011
	 * @author cfigueroa
	 */
	public Persona( PersonaSeleccion personaSeleccion) {
		this.nombre = personaSeleccion.getNombre();
		this.apellido = personaSeleccion.getApellido();
		this.tipoDni = personaSeleccion.getTipoDni();
		this.dni = personaSeleccion.getDni();
		this.cuilCuit = personaSeleccion.getCuilCuit();
		this.direccion = personaSeleccion.getDireccion();
		this.departamento = personaSeleccion.getDepartamento();
		this.codigoPostal = personaSeleccion.getCodigoPostal();
		this.telefono = personaSeleccion.getTelefono();
		this.celular = personaSeleccion.getCelular();
		this.fechaNacimiento = personaSeleccion.getFechaNacimiento();
		this.sexo = personaSeleccion.isSexo();
		this.estadoCivil = personaSeleccion.getEstadoCivil();
		this.mail = personaSeleccion.getMail();
		this.localidad = personaSeleccion.getLocalidad();
		this.entreCalles = personaSeleccion.getEntreCalles();
		this.barrio = personaSeleccion.getBarrio();
		this.provincia = personaSeleccion.getProvincia();
		this.nacionalidad = personaSeleccion.getNacionalidad();
		this.numeroCalle = personaSeleccion.getNumeroCalle();
		this.piso = personaSeleccion.getPiso();
		this.edad= personaSeleccion.getEdad();
		
	}

	/**
	 * Gets the sex.
	 *
	 * @return the sex
	 */
	public String getSex() {
		return ((sexo ? "Masculino" : "Femenino"));
	}

	/**
	 * Gets the id persona.
	 * 
	 * @return the id persona
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Sets the id persona.
	 *
	 * @param id the new id
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the nombre.
	 * 
	 * @return the nombre
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * Sets the nombre.
	 * 
	 * @param nombre
	 *            the new nombre
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * Gets the apellido.
	 * 
	 * @return the apellido
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getApellido() {
		return apellido;
	}

	/**
	 * Sets the apellido.
	 * 
	 * @param apellido
	 *            the new apellido
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	/**
	 * Gets the dni.
	 * 
	 * @return the dni
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public Integer getDni() {
		return dni;
	}

	/**
	 * Sets the dni.
	 * 
	 * @param dni
	 *            the new dni
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setDni(Integer dni) {
		this.dni = dni;
	}

	/**
	 * Gets the cuil cuit.
	 * 
	 * @return the cuil cuit
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getCuilCuit() {
		return cuilCuit;
	}

	/**
	 * Sets the cuil cuit.
	 * 
	 * @param cuilCuit
	 *            the new cuil cuit
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setCuilCuit(String cuilCuit) {
		this.cuilCuit = cuilCuit;
	}

	/**
	 * Gets the direccion.
	 * 
	 * @return the direccion
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getDireccion() {
		return direccion;
	}

	/**
	 * Sets the direccion.
	 * 
	 * @param direccion
	 *            the new direccion
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	/**
	 * Gets the codigo postal.
	 * 
	 * @return the codigo postal
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getCodigoPostal() {
		return codigoPostal;
	}

	/**
	 * Sets the codigo postal.
	 * 
	 * @param codigoPostal
	 *            the new codigo postal
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	/**
	 * Gets the telefono.
	 * 
	 * @return the telefono
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getTelefono() {
		return telefono;
	}

	/**
	 * Sets the telefono.
	 * 
	 * @param telefono
	 *            the new telefono
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	/**
	 * Gets the celular.
	 * 
	 * @return the celular
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getCelular() {
		return celular;
	}

	/**
	 * Sets the celular.
	 * 
	 * @param celular
	 *            the new celular
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setCelular(String celular) {
		this.celular = celular;
	}

	/**
	 * Gets the perfil staff.
	 * 
	 * @return the perfil staff
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public PerfilStaff getPerfilStaff() {
		return perfilStaff;
	}

	/**
	 * Sets the perfil staff.
	 * 
	 * @param perfilStaff
	 *            the new perfil staff
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setPerfilStaff(PerfilStaff perfilStaff) {
		this.perfilStaff = perfilStaff;
	}

	/**
	 * Gets the perfil rr.
	 * 
	 * @return the perfil rr
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public PerfilRR getPerfilRR() {
		return perfilRR;
	}

	/**
	 * Sets the perfil rr.
	 * 
	 * @param perfilRR
	 *            the new perfil rr
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setPerfilRR(PerfilRR perfilRR) {
		this.perfilRR = perfilRR;
	}

	/**
	 * Gets the perfil ea.
	 * 
	 * @return the perfil ea
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public PerfilEA getPerfilEA() {
		return perfilEA;
	}

	/**
	 * Sets the perfil ea.
	 * 
	 * @param perfilEA
	 *            the new perfil ea
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setPerfilEA(PerfilEA perfilEA) {
		this.perfilEA = perfilEA;
	}

	/**
	 * Gets the perfil ts.
	 * 
	 * @return the perfil ts
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public PerfilTS getPerfilTS() {
		return perfilTS;
	}

	/**
	 * Sets the perfil ts.
	 * 
	 * @param perfilTS
	 *            the new perfil ts
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setPerfilTS(PerfilTS perfilTS) {
		this.perfilTS = perfilTS;
	}

	/**
	 * Gets the perfil voluntario.
	 * 
	 * @return the perfil voluntario
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public PerfilVoluntario getPerfilVoluntario() {
		return perfilVoluntario;
	}

	/**
	 * Sets the perfil voluntario.
	 * 
	 * @param perfilVoluntario
	 *            the new perfil voluntario
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setPerfilVoluntario(PerfilVoluntario perfilVoluntario) {
		this.perfilVoluntario = perfilVoluntario;
	}

	/**
	 * Checks if is sexo.
	 * 
	 * @return true, if is sexo
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public boolean isSexo() {
		return sexo;
	}

	/**
	 * Sets the sexo.
	 * 
	 * @param sexo
	 *            the new sexo
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setSexo(boolean sexo) {
		this.sexo = sexo;
	}

	/**
	 * Sets the fecha nacimiento.
	 *
	 * @param fechaNacimiento the new fecha nacimiento
	 */
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	/**
	 * Gets the fecha nacimiento.
	 *
	 * @return the fecha nacimiento
	 */
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	/**
	 * Gets the estado civil.
	 *
	 * @return the estado civil
	 */
	public EstadoCivil getEstadoCivil() {
		return estadoCivil;
	}

	/**
	 * Sets the estado civil.
	 *
	 * @param estadoCivil the new estado civil
	 */
	public void setEstadoCivil(EstadoCivil estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	/**
	 * Gets the mail.
	 * 
	 * @return the mail
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getMail() {
		return mail;
	}

	/**
	 * Sets the mail.
	 * 
	 * @param mail
	 *            the new mail
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setMail(String mail) {
		this.mail = mail;
	}

	/**
	 * Gets the localidad.
	 *
	 * @return the localidad
	 */
	public Localidad getLocalidad() {
		return localidad;
	}

	/**
	 * Sets the localidad.
	 *
	 * @param localidad the localidad to set
	 */
	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}

	
	/**
	 * Gets the entre calles.
	 *
	 * @return the entre calles
	 */
	public String getEntreCalles() {
		return entreCalles;
	}

	/**
	 * Sets the entre calles.
	 *
	 * @param entreCalles the new entre calles
	 */
	public void setEntreCalles(String entreCalles) {
		this.entreCalles = entreCalles;
	}

	/**
	 * Gets the provincia.
	 *
	 * @return the provincia
	 */
	public Provincia getProvincia() {
		return provincia;
	}

	/**
	 * Sets the provincia.
	 *
	 * @param provincia the new provincia
	 */
	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	/**
	 * Gets the perfil admin.
	 *
	 * @return the perfil admin
	 */
	public Boolean getPerfilAdmin() {
		return perfilAdmin;
	}
	
	/**
	 * Sets the perfil admin.
	 *
	 * @param perfilAdmin the new perfil admin
	 */
	public void setPerfilAdmin(Boolean perfilAdmin) {
		this.perfilAdmin = perfilAdmin;
	}
	
	/**
	 * Gets the perfil sys admin.
	 *
	 * @return the perfil sys admin
	 */
	public Boolean getPerfilSysAdmin() {
		return perfilSysAdmin;
	}
	
	/**
	 * Sets the perfil sys admin.
	 *
	 * @param perfilSysAdmin the new perfil sys admin
	 */
	public void setPerfilSysAdmin(Boolean perfilSysAdmin) {
		this.perfilSysAdmin = perfilSysAdmin;
	}
	
	/**
	 * Gets the perfil coord pbe.
	 *
	 * @return the perfil coord pbe
	 */
	public Boolean getPerfilCoordPBE() {
		return perfilCoordPBE;
	}
	
	/**
	 * Sets the perfil coord pbe.
	 *
	 * @param perfilCoordPBE the new perfil coord pbe
	 */
	public void setPerfilCoordPBE(Boolean perfilCoordPBE) {
		this.perfilCoordPBE = perfilCoordPBE;
	}
	
	
	/**
	 * Gets the perfil corrector.
	 *
	 * @return the perfil corrector
	 */
	public Boolean getPerfilCorrector() {
		return perfilCorrector;
	}
	
	/**
	 * Sets the perfil corrector.
	 *
	 * @param perfilCorrector the new perfil corrector
	 */
	public void setPerfilCorrector(Boolean perfilCorrector) {
		this.perfilCorrector = perfilCorrector;
	}
	
	/**
	 * Gets the perfil selector.
	 *
	 * @return the perfil selector
	 */
	public Boolean getPerfilSelector() {
		return perfilSelector;
	}
	
	/**
	 * Sets the perfil selector.
	 *
	 * @param perfilSelector the new perfil selector
	 */
	public void setPerfilSelector(Boolean perfilSelector) {
		this.perfilSelector = perfilSelector;
	}
	
	/**
	 * Gets the perfil di.
	 *
	 * @return the perfil di
	 */
	public Boolean getPerfilDI() {
		return perfilDI;
	}
	
	/**
	 * Sets the perfil di.
	 *
	 * @param perfilDI the new perfil di
	 */
	public void setPerfilDI(Boolean perfilDI) {
		this.perfilDI = perfilDI;
	}
	
	
	
	
	
	/**
	 * Obtener perfiles.
	 *
	 * @return the list
	 */
	public List<String> obtenerPerfiles() {
		List<String> perfiles = new LinkedList<String>();
		if (perfilEA != null && perfilEA.getActivo()) {
			perfiles.add(PERFIL_EA);
		}
		if (perfilRR != null && perfilRR.getActivo()) {
			perfiles.add(PERFIL_RR);
		}
		if (perfilTS != null && perfilTS.getActivo()) {
			perfiles.add(PERFIL_TS);
		}
		if (perfilStaff != null && perfilStaff.getActivo()) {
			perfiles.add(PERFIL_STAFF);
		}
		if (perfilAdmin) {
			perfiles.add(PERFIL_ADMINISTRACION);
		}
		if (perfilSysAdmin) {
			perfiles.add(PERFIL_SYSADMIN);
		}
		if (perfilCoordPBE) {
			perfiles.add(PERFIL_COORD_PBE);
		}
		if (perfilCorrector) {
			perfiles.add(PERFIL_CORRECTOR);
		}
		if (perfilSelector) {
			perfiles.add(PERFIL_SELECTOR);
		}
		if (perfilDI) {
			perfiles.add(PERFIL_DI);
		}		
		if(perfilRRHH)
			perfiles.add(PERFIL_RRHH);
		if(perfilAsist)
			perfiles.add(PERFIL_ASIST);
		if(perfilVisita)
			perfiles.add(PERFIL_VISITA);
		if(perfilSuperUsuario)
			perfiles.add(PERFIL_SUPER_USUARIO);
		
		return perfiles;
	}

	/**
	 * Gets the credenciales.
	 *
	 * @return the credenciales
	 */
	public Usuario getCredenciales() {
		return credenciales;
	}

	/**
	 * Gets the nacionalidad.
	 *
	 * @return the nacionalidad
	 */
	public String getNacionalidad() {
		return nacionalidad;
	}
	
	/**
	 * Sets the credenciales.
	 *
	 * @param credenciales the new credenciales
	 */
	public void setCredenciales(Usuario credenciales) {
		this.credenciales = credenciales;
	}

	/**
	 * Gets the activo.
	 *
	 * @return the activo
	 */
	public Boolean getActivo() {
		return activo;
	}

	/**
	 * Sets the activo.
	 *
	 * @param activo the new activo
	 */
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	/**
	 * Sets the nacionalidad.
	 *
	 * @param nacionalidad the new nacionalidad
	 */
	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

	

	public String getNumeroCalle() {
		return numeroCalle;
	}

	public void setNumeroCalle(String numeroCalle) {
		this.numeroCalle = numeroCalle;
	}

	public String getPiso() {
		return piso;
	}

	public void setPiso(String piso) {
		this.piso = piso;
	}

	/**
	 * Gets the tipo dni.
	 *
	 * @return the tipo dni
	 */
	public TipoDni getTipoDni() {
		return tipoDni;
	}

	/**
	 * Sets the tipo dni.
	 *
	 * @param tipoDni the new tipo dni
	 */
	public void setTipoDni(TipoDni tipoDni) {
		this.tipoDni = tipoDni;
	}

	/**
	 * Gets the perfil alumno.
	 *
	 * @return the perfil alumno
	 */
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.perfil.PerfilAlumno")
	public PerfilAlumno getPerfilAlumno() {
		return perfilAlumno;
	}

	/**
	 * Sets the perfil alumno.
	 *
	 * @param perfilAlumno the new perfil alumno
	 */
	public void setPerfilAlumno(PerfilAlumno perfilAlumno) {
		this.perfilAlumno = perfilAlumno;
	}

	/**
	 * Gets the departamento.
	 *
	 * @return the departamento
	 */
	public String getDepartamento() {
		return departamento;
	}

	/**
	 * Sets the departamento.
	 *
	 * @param departamento the new departamento
	 */
	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	
	/**
	 * Gets the barrio.
	 *
	 * @return the barrio
	 */
	public String getBarrio() {
		return barrio;
	}
	
	/**
	 * Sets the barrio.
	 *
	 * @param barrio the new barrio
	 */
	public void setBarrio(String barrio) {
		this.barrio = barrio;
	}
	
	/**
	 * Este devuelve el nombre de la persona 
	 * con el formato "apellido, nombre" EJ: Perez,Jose
	 *
	 * @return the apellido nombre
	 * @since 04-may-2011
	 * @author cfigueroa
	 */
	public String getApellidoNombre(){
		return apellido +", "+ nombre;
	}

	public boolean getPerfilRRHH() {
		return perfilRRHH;
	}

	public void setPerfilRRHH(boolean perfilRRHH) {
		this.perfilRRHH = perfilRRHH;
	}
	
	public Boolean getPerfilAsist() {
		return perfilAsist;
	}

	public void setPerfilAsist(Boolean perfilAsist) {
		this.perfilAsist = perfilAsist;
	}
	
	public Boolean getPerfilVisita() {
		return perfilVisita;
	}

	public void setPerfilVisita(Boolean perfilVisita) {
		this.perfilVisita = perfilVisita;
	}	
	
	
	public Boolean getPerfilSuperUsuario() {
		return perfilSuperUsuario;
	}

	public void setPerfilSuperUsuario(Boolean perfilSuperUsuario) {
		this.perfilSuperUsuario= perfilSuperUsuario;
	}

	public String getNombrePerfiles(){
		String nombre = "";
		if (perfilEA != null && perfilEA.getActivo())
			nombre = nombre + PERFIL_EA + ",";
		if (perfilRR != null && perfilRR.getActivo())
			nombre = nombre + PERFIL_RR + ",";
		if (perfilTS != null && perfilTS.getActivo())
			nombre = nombre + PERFIL_TS + ",";
		if (perfilStaff != null && perfilStaff.getActivo())
			nombre = nombre + "Staff,";
		if (perfilAdmin)
			nombre = nombre + "Administracion,";
		if (perfilSysAdmin)
			nombre = nombre + "Sistemas,";
		if (perfilCoordPBE)
			nombre = nombre + "Coordinador,";
		if (perfilCorrector)
			nombre = nombre + "Corrector,";
		if (perfilSelector)
			nombre = nombre + "Seleccion,";		
		if (perfilDI)
			nombre = nombre + PERFIL_DI + ",";		
		if (perfilRRHH)
			nombre = nombre + PERFIL_RRHH + ",";
		if(perfilAsist)
			nombre = nombre + PERFIL_ASIST + ",";
		if(perfilVisita)
			nombre = nombre + "Visita,";
		if(perfilSuperUsuario)
			nombre = nombre + PERFIL_SUPER_USUARIO + ",";
		
		
		if(nombre != "")
			return nombre.substring(0,nombre.length() - 1);
		else
			return nombre;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}
	
	

}
