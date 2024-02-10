package org.cimientos.intranet.dto;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import com.cimientos.intranet.enumerativos.DesplegadoEscuela;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaAccesibilidad;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaCED;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaECTAES;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaProyeccionPFE;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaREFP;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaSINO;

public class EscuelaDTO {
	
	private String idEscuela;
	private String nombre;
	private String cue; 
	private String modalidad;
	private String orientacion;
	private String nivel;
	private String anios;
	private String dependencia;
	private String cp;
	private String calle;
	private String numero;
	private String barrio;
	private String localidad;
	private String provincia;
	private String zona;
	private String tel1;
	private String tel2;
	private String mail;
//	10/2/24 DMS sistema anterior
	private String director;
	private String directorCel;
	private String directorMail;
	private String secretario;
	private String secretarioCel;
	private String secretarioMail;
	private String resonsable;
	private String responsableCel;
	private String responsablMail;
//	10/2/24 DMS sistema nuevo
	
	
	private String rolAutoridad1;
	private String rolAutoridad2;
	private String rolAutoridad3;
	private String rolAutoridad4;
	private String rolAutoridad5;

	private String nombreApellidoAutoridad1;
	private String nombreApellidoAutoridad2;
	private String nombreApellidoAutoridad3;
	private String nombreApellidoAutoridad4;
	private String nombreApellidoAutoridad5;

	private String telefonoAutoridad1;
	private String telefonoAutoridad2;
	private String telefonoAutoridad3;
	private String telefonoAutoridad4;
	private String telefonoAutoridad5;

	private String mailAutoridad1;
	private String mailAutoridad2;
	private String mailAutoridad3;
	private String mailAutoridad4;
	private String mailAutoridad5;

	private String esReferenteAutoridad1;
	private String esReferenteAutoridad2;
	private String esReferenteAutoridad3;
	private String esReferenteAutoridad4;
	private String esReferenteAutoridad5;

	
	
	private String equipoDirectivo;
	private String totalDocentes;
	private String totalPreceptores;
	private String totalPersonal;
	private String cualOtroEspacioApoyo;
	private String aniosParticipacionEQA;
	
	
	
	
	
	
	
	private String rural;
	private String subsidio;	
	private String observacionesGrales;	
	private String estado;
	private String motivoNoSeleccion;
	private String programa;
	private String modalidadTrabajoEscuela;
	private String anioComienzoProyecto;
	private String anioComienzoPBE;
	private String fase;
	private String objetivoProyecto;
	private String observaciones;
	private String matricula;
	private String repitencia;
	private String abandono;
	private String inasistencias;
	private String turnos;
	private String espacios;
	//DMS agrego becados activos a pedido de paula para que sea exportado en excel
	private String becadosActivos;
	

	
	// 2018
		private String ccephe;
		
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaCED  ced;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaREFP  refp;
		
		private String tcoo;
		
		@Column(length=3000)
		private String dsoo;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaAccesibilidad  accesibilidad;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaProyeccionPFE  proyeccionPFE;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaECTAES  ectaes;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuela eddes;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuela edfea;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuela  edbis;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuela  edccpa;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuela  raeea;
		
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuela  epep;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaSINO  ersb;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaSINO ecdPFE;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaSINO eudbe;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaSINO tpacl;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaSINO splftp;
		
		@Enumerated(EnumType.ORDINAL)	
		private DesplegadoEscuelaSINO euscp;
		
		
		
		private String cd1;
		private String cd2;
		private String cd3;
		private String cd4;
		private String cd5;
		private String cd6;
		private String cd7;
		private String mat1;
		private String mat2;
		private String mat3;
		private String mat4;
		private String mat5;
		private String mat6;
		private String mat7;
		private String rep1;
		private String rep2;
		private String rep3;
		private String rep4;
		private String rep5;
		private String rep6;
		private String rep7;
		private String ab1;
		private String ab2;
		private String ab3;
		private String ab4;
		private String ab5;
		private String ab6;
		private String ab7;
		
		// 2022
		private String eqa;
		
		public EscuelaDTO() {
			super();
		}

		public EscuelaDTO(String idEscuela, String nombre, String cue,
				String modalidad, String orientacion, String nivel,
				String anios, String dependencia, String cp, String calle,
				String numero, String barrio, String localidad,
				String provincia, String zona, String tel1, String tel2,
				String mail, String director, String directorCel,
				String directorMail, String secretario, String secretarioCel,
				String secretarioMail, String resonsable,
				String responsableCel, String responsablMail, String rural,
				String subsidio, String observacionesGrales, String estado,
				String motivoNoSeleccion, String programa,
				String modalidadTrabajoEscuela, String anioComienzoProyecto,
				String anioComienzoPBE, String fase, String objetivoProyecto,
				String observaciones, String matricula, String repitencia,
				String abandono, String inasistencias, String turnos,
				String espacios, String ccephe, DesplegadoEscuelaCED ced,
				DesplegadoEscuelaREFP refp, String tcoo, String dsoo,
				DesplegadoEscuelaAccesibilidad accesibilidad,
				DesplegadoEscuelaProyeccionPFE proyeccionPFE,
				DesplegadoEscuelaECTAES ectaes, DesplegadoEscuela eddes,
				DesplegadoEscuela edfea, DesplegadoEscuela edbis,
				DesplegadoEscuela edccpa, DesplegadoEscuela raeea,
				DesplegadoEscuela epep, DesplegadoEscuelaSINO ersb,
				DesplegadoEscuelaSINO ecdPFE, String cd1, String cd2,
				String cd3, String cd4, String cd5, String cd6, String cd7,
				String mat1, String mat2, String mat3, String mat4,
				String mat5, String mat6, String mat7, String rep1,
				String rep2, String rep3, String rep4, String rep5,
				String rep6, String rep7, String ab1, String ab2, String ab3,
				String ab4, String ab5, String ab6, String ab7) {
			super();
			this.idEscuela = idEscuela;
			this.nombre = nombre;
			this.cue = cue;
			this.modalidad = modalidad;
			this.orientacion = orientacion;
			this.nivel = nivel;
			this.anios = anios;
			this.dependencia = dependencia;
			this.cp = cp;
			this.calle = calle;
			this.numero = numero;
			this.barrio = barrio;
			this.localidad = localidad;
			this.provincia = provincia;
			this.zona = zona;
			this.tel1 = tel1;
			this.tel2 = tel2;
			this.mail = mail;
			this.director = director;
			this.directorCel = directorCel;
			this.directorMail = directorMail;
			this.secretario = secretario;
			this.secretarioCel = secretarioCel;
			this.secretarioMail = secretarioMail;
			this.resonsable = resonsable;
			this.responsableCel = responsableCel;
			this.responsablMail = responsablMail;
			this.rural = rural;
			this.subsidio = subsidio;
			this.observacionesGrales = observacionesGrales;
			this.estado = estado;
			this.motivoNoSeleccion = motivoNoSeleccion;
			this.programa = programa;
			this.modalidadTrabajoEscuela = modalidadTrabajoEscuela;
			this.anioComienzoProyecto = anioComienzoProyecto;
			this.anioComienzoPBE = anioComienzoPBE;
			this.fase = fase;
			this.objetivoProyecto = objetivoProyecto;
			this.observaciones = observaciones;
			this.matricula = matricula;
			this.repitencia = repitencia;
			this.abandono = abandono;
			this.inasistencias = inasistencias;
			this.turnos = turnos;
			this.espacios = espacios;
			this.ccephe = ccephe;
			this.ced = ced;
			this.refp = refp;
			this.tcoo = tcoo;
			this.dsoo = dsoo;
			this.accesibilidad = accesibilidad;
			this.proyeccionPFE = proyeccionPFE;
			this.ectaes = ectaes;
			this.eddes = eddes;
			this.edfea = edfea;
			this.edbis = edbis;
			this.edccpa = edccpa;
			this.raeea = raeea;
			this.epep = epep;
			this.ersb = ersb;
			this.ecdPFE = ecdPFE;
			this.cd1 = cd1;
			this.cd2 = cd2;
			this.cd3 = cd3;
			this.cd4 = cd4;
			this.cd5 = cd5;
			this.cd6 = cd6;
			this.cd7 = cd7;
			this.mat1 = mat1;
			this.mat2 = mat2;
			this.mat3 = mat3;
			this.mat4 = mat4;
			this.mat5 = mat5;
			this.mat6 = mat6;
			this.mat7 = mat7;
			this.rep1 = rep1;
			this.rep2 = rep2;
			this.rep3 = rep3;
			this.rep4 = rep4;
			this.rep5 = rep5;
			this.rep6 = rep6;
			this.rep7 = rep7;
			this.ab1 = ab1;
			this.ab2 = ab2;
			this.ab3 = ab3;
			this.ab4 = ab4;
			this.ab5 = ab5;
			this.ab6 = ab6;
			this.ab7 = ab7;
		}

		public String getIdEscuela() {
			return idEscuela;
		}

		public void setIdEscuela(String idEscuela) {
			this.idEscuela = idEscuela;
		}

		public String getNombre() {
			return nombre;
		}

		public void setNombre(String nombre) {
			this.nombre = nombre;
		}

		public String getCue() {
			return cue;
		}

		public void setCue(String cue) {
			this.cue = cue;
		}

		public String getModalidad() {
			return modalidad;
		}

		public void setModalidad(String modalidad) {
			this.modalidad = modalidad;
		}

		public String getOrientacion() {
			return orientacion;
		}

		public void setOrientacion(String orientacion) {
			this.orientacion = orientacion;
		}

		public String getNivel() {
			return nivel;
		}

		public void setNivel(String nivel) {
			this.nivel = nivel;
		}

		public String getAnios() {
			return anios;
		}

		public void setAnios(String anios) {
			this.anios = anios;
		}

		public String getDependencia() {
			return dependencia;
		}

		public void setDependencia(String dependencia) {
			this.dependencia = dependencia;
		}

		public String getCp() {
			return cp;
		}

		public void setCp(String cp) {
			this.cp = cp;
		}

		public String getCalle() {
			return calle;
		}

		public void setCalle(String calle) {
			this.calle = calle;
		}

		public String getNumero() {
			return numero;
		}

		public void setNumero(String numero) {
			this.numero = numero;
		}

		public String getBarrio() {
			return barrio;
		}

		public void setBarrio(String barrio) {
			this.barrio = barrio;
		}

		public String getLocalidad() {
			return localidad;
		}

		public void setLocalidad(String localidad) {
			this.localidad = localidad;
		}

		public String getProvincia() {
			return provincia;
		}

		public void setProvincia(String provincia) {
			this.provincia = provincia;
		}

		public String getZona() {
			return zona;
		}

		public void setZona(String zona) {
			this.zona = zona;
		}

		public String getTel1() {
			return tel1;
		}

		public void setTel1(String tel1) {
			this.tel1 = tel1;
		}

		public String getTel2() {
			return tel2;
		}

		public void setTel2(String tel2) {
			this.tel2 = tel2;
		}

		public String getMail() {
			return mail;
		}

		public void setMail(String mail) {
			this.mail = mail;
		}

		public String getDirector() {
			return director;
		}

		public void setDirector(String director) {
			this.director = director;
		}

		public String getDirectorCel() {
			return directorCel;
		}

		public void setDirectorCel(String directorCel) {
			this.directorCel = directorCel;
		}

		public String getDirectorMail() {
			return directorMail;
		}

		public void setDirectorMail(String directorMail) {
			this.directorMail = directorMail;
		}

		public String getSecretario() {
			return secretario;
		}

		public void setSecretario(String secretario) {
			this.secretario = secretario;
		}

		public String getSecretarioCel() {
			return secretarioCel;
		}

		public void setSecretarioCel(String secretarioCel) {
			this.secretarioCel = secretarioCel;
		}

		public String getSecretarioMail() {
			return secretarioMail;
		}

		public void setSecretarioMail(String secretarioMail) {
			this.secretarioMail = secretarioMail;
		}

		public String getResonsable() {
			return resonsable;
		}

		public void setResonsable(String resonsable) {
			this.resonsable = resonsable;
		}

		public String getResponsableCel() {
			return responsableCel;
		}

		public void setResponsableCel(String responsableCel) {
			this.responsableCel = responsableCel;
		}

		public String getResponsablMail() {
			return responsablMail;
		}

		public void setResponsablMail(String responsablMail) {
			this.responsablMail = responsablMail;
		}

		
		
		
		
		public String getRolAutoridad1() {
			return rolAutoridad1;
		}

		public void setRolAutoridad1(String rolAutoridad1) {
			this.rolAutoridad1 = rolAutoridad1;
		}

		public String getRolAutoridad2() {
			return rolAutoridad2;
		}

		public void setRolAutoridad2(String rolAutoridad2) {
			this.rolAutoridad2 = rolAutoridad2;
		}

		public String getRolAutoridad3() {
			return rolAutoridad3;
		}

		public void setRolAutoridad3(String rolAutoridad3) {
			this.rolAutoridad3 = rolAutoridad3;
		}

		public String getRolAutoridad4() {
			return rolAutoridad4;
		}

		public void setRolAutoridad4(String rolAutoridad4) {
			this.rolAutoridad4 = rolAutoridad4;
		}

		public String getRolAutoridad5() {
			return rolAutoridad5;
		}

		public void setRolAutoridad5(String rolAutoridad5) {
			this.rolAutoridad5 = rolAutoridad5;
		}

		public String getNombreApellidoAutoridad1() {
			return nombreApellidoAutoridad1;
		}

		public void setNombreApellidoAutoridad1(String nombreApellidoAutoridad1) {
			this.nombreApellidoAutoridad1 = nombreApellidoAutoridad1;
		}

		public String getNombreApellidoAutoridad2() {
			return nombreApellidoAutoridad2;
		}

		public void setNombreApellidoAutoridad2(String nombreApellidoAutoridad2) {
			this.nombreApellidoAutoridad2 = nombreApellidoAutoridad2;
		}

		public String getNombreApellidoAutoridad3() {
			return nombreApellidoAutoridad3;
		}

		public void setNombreApellidoAutoridad3(String nombreApellidoAutoridad3) {
			this.nombreApellidoAutoridad3 = nombreApellidoAutoridad3;
		}

		public String getNombreApellidoAutoridad4() {
			return nombreApellidoAutoridad4;
		}

		public void setNombreApellidoAutoridad4(String nombreApellidoAutoridad4) {
			this.nombreApellidoAutoridad4 = nombreApellidoAutoridad4;
		}

		public String getNombreApellidoAutoridad5() {
			return nombreApellidoAutoridad5;
		}

		public void setNombreApellidoAutoridad5(String nombreApellidoAutoridad5) {
			this.nombreApellidoAutoridad5 = nombreApellidoAutoridad5;
		}

		public String getTelefonoAutoridad1() {
			return telefonoAutoridad1;
		}

		public void setTelefonoAutoridad1(String telefonoAutoridad1) {
			this.telefonoAutoridad1 = telefonoAutoridad1;
		}

		public String getTelefonoAutoridad2() {
			return telefonoAutoridad2;
		}

		public void setTelefonoAutoridad2(String telefonoAutoridad2) {
			this.telefonoAutoridad2 = telefonoAutoridad2;
		}

		public String getTelefonoAutoridad3() {
			return telefonoAutoridad3;
		}

		public void setTelefonoAutoridad3(String telefonoAutoridad3) {
			this.telefonoAutoridad3 = telefonoAutoridad3;
		}

		public String getTelefonoAutoridad4() {
			return telefonoAutoridad4;
		}

		public void setTelefonoAutoridad4(String telefonoAutoridad4) {
			this.telefonoAutoridad4 = telefonoAutoridad4;
		}

		public String getTelefonoAutoridad5() {
			return telefonoAutoridad5;
		}

		public void setTelefonoAutoridad5(String telefonoAutoridad5) {
			this.telefonoAutoridad5 = telefonoAutoridad5;
		}

		public String getMailAutoridad1() {
			return mailAutoridad1;
		}

		public void setMailAutoridad1(String mailAutoridad1) {
			this.mailAutoridad1 = mailAutoridad1;
		}

		public String getMailAutoridad2() {
			return mailAutoridad2;
		}

		public void setMailAutoridad2(String mailAutoridad2) {
			this.mailAutoridad2 = mailAutoridad2;
		}

		public String getMailAutoridad3() {
			return mailAutoridad3;
		}

		public void setMailAutoridad3(String mailAutoridad3) {
			this.mailAutoridad3 = mailAutoridad3;
		}

		public String getMailAutoridad4() {
			return mailAutoridad4;
		}

		public void setMailAutoridad4(String mailAutoridad4) {
			this.mailAutoridad4 = mailAutoridad4;
		}

		public String getMailAutoridad5() {
			return mailAutoridad5;
		}

		public void setMailAutoridad5(String mailAutoridad5) {
			this.mailAutoridad5 = mailAutoridad5;
		}

		public String getEsReferenteAutoridad1() {
			return esReferenteAutoridad1;
		}

		public void setEsReferenteAutoridad1(String esReferenteAutoridad1) {
			this.esReferenteAutoridad1 = esReferenteAutoridad1;
		}

		public String getEsReferenteAutoridad2() {
			return esReferenteAutoridad2;
		}

		public void setEsReferenteAutoridad2(String esReferenteAutoridad2) {
			this.esReferenteAutoridad2 = esReferenteAutoridad2;
		}

		public String getEsReferenteAutoridad3() {
			return esReferenteAutoridad3;
		}

		public void setEsReferenteAutoridad3(String esReferenteAutoridad3) {
			this.esReferenteAutoridad3 = esReferenteAutoridad3;
		}

		public String getEsReferenteAutoridad4() {
			return esReferenteAutoridad4;
		}

		public void setEsReferenteAutoridad4(String esReferenteAutoridad4) {
			this.esReferenteAutoridad4 = esReferenteAutoridad4;
		}

		public String getEsReferenteAutoridad5() {
			return esReferenteAutoridad5;
		}

		public void setEsReferenteAutoridad5(String esReferenteAutoridad5) {
			this.esReferenteAutoridad5 = esReferenteAutoridad5;
		}

		public String getEquipoDirectivo() {
			return equipoDirectivo;
		}

		public void setEquipoDirectivo(String equipoDirectivo) {
			this.equipoDirectivo = equipoDirectivo;
		}
		
		public String getTotalDocentes() {
			return totalDocentes;
		}

		public void setTotalDocentes(String totalDocentes) {
			this.totalDocentes = totalDocentes;
		}
		
		public String getTotalPreceptores() {
			return totalPreceptores;
		}

		public void setTotalPreceptores(String totalPreceptores) {
			this.totalPreceptores = totalPreceptores;
		}

		public String getTotalPersonal() {
			return totalPersonal;
		}

		public void setTotalPersonal(String totalPersonal) {
			this.totalPersonal = totalPersonal;
		}

		public String getCualOtroEspacioApoyo() {
			return cualOtroEspacioApoyo;
		}

		public void setCualOtroEspacioApoyo(String cualOtroEspacioApoyo) {
			this.cualOtroEspacioApoyo = cualOtroEspacioApoyo;
		}

		public String getAniosParticipacionEQA() {
			return aniosParticipacionEQA;
		}

		public void setAniosParticipacionEQA(String aniosParticipacionEQA) {
			this.aniosParticipacionEQA = aniosParticipacionEQA;
		}

		public String getRural() {
			return rural;
		}

		public void setRural(String rural) {
			this.rural = rural;
		}

		public String getSubsidio() {
			return subsidio;
		}

		public void setSubsidio(String subsidio) {
			this.subsidio = subsidio;
		}

		public String getObservacionesGrales() {
			return observacionesGrales;
		}

		public void setObservacionesGrales(String observacionesGrales) {
			this.observacionesGrales = observacionesGrales;
		}

		public String getEstado() {
			return estado;
		}

		public void setEstado(String estado) {
			this.estado = estado;
		}

		public String getMotivoNoSeleccion() {
			return motivoNoSeleccion;
		}

		public void setMotivoNoSeleccion(String motivoNoSeleccion) {
			this.motivoNoSeleccion = motivoNoSeleccion;
		}

		public String getPrograma() {
			return programa;
		}

		public void setPrograma(String programa) {
			this.programa = programa;
		}

		public String getModalidadTrabajoEscuela() {
			return modalidadTrabajoEscuela;
		}

		public void setModalidadTrabajoEscuela(String modalidadTrabajoEscuela) {
			this.modalidadTrabajoEscuela = modalidadTrabajoEscuela;
		}

		public String getAnioComienzoProyecto() {
			return anioComienzoProyecto;
		}

		public void setAnioComienzoProyecto(String anioComienzoProyecto) {
			this.anioComienzoProyecto = anioComienzoProyecto;
		}

		public String getAnioComienzoPBE() {
			return anioComienzoPBE;
		}

		public void setAnioComienzoPBE(String anioComienzoPBE) {
			this.anioComienzoPBE = anioComienzoPBE;
		}

		public String getFase() {
			return fase;
		}

		public void setFase(String fase) {
			this.fase = fase;
		}

		public String getObjetivoProyecto() {
			return objetivoProyecto;
		}

		public void setObjetivoProyecto(String objetivoProyecto) {
			this.objetivoProyecto = objetivoProyecto;
		}

		public String getObservaciones() {
			return observaciones;
		}

		public void setObservaciones(String observaciones) {
			this.observaciones = observaciones;
		}

		public String getMatricula() {
			return matricula;
		}

		public void setMatricula(String matricula) {
			this.matricula = matricula;
		}

		public String getRepitencia() {
			return repitencia;
		}

		public void setRepitencia(String repitencia) {
			this.repitencia = repitencia;
		}

		public String getAbandono() {
			return abandono;
		}

		public void setAbandono(String abandono) {
			this.abandono = abandono;
		}

		public String getInasistencias() {
			return inasistencias;
		}

		public void setInasistencias(String inasistencias) {
			this.inasistencias = inasistencias;
		}

		public String getTurnos() {
			return turnos;
		}

		public void setTurnos(String turnos) {
			this.turnos = turnos;
		}

		public String getEspacios() {
			return espacios;
		}

		public void setEspacios(String espacios) {
			this.espacios = espacios;
		}

		public String getBecadosActivos() {
			return becadosActivos;
		}

		public void setBecadosActivos(String becadosActivos) {
			this.becadosActivos = becadosActivos;
		}
		
		public String getCcephe() {
			return ccephe;
		}

		public void setCcephe(String ccephe) {
			this.ccephe = ccephe;
		}

		public DesplegadoEscuelaCED getCed() {
			return ced;
		}

		public void setCed(DesplegadoEscuelaCED ced) {
			this.ced = ced;
		}

		public DesplegadoEscuelaREFP getRefp() {
			return refp;
		}

		public void setRefp(DesplegadoEscuelaREFP refp) {
			this.refp = refp;
		}

		public String getTcoo() {
			return tcoo;
		}

		public void setTcoo(String tcoo) {
			this.tcoo = tcoo;
		}

		public String getDsoo() {
			return dsoo;
		}

		public void setDsoo(String dsoo) {
			this.dsoo = dsoo;
		}

		public DesplegadoEscuelaAccesibilidad getAccesibilidad() {
			return accesibilidad;
		}

		public void setAccesibilidad(DesplegadoEscuelaAccesibilidad accesibilidad) {
			this.accesibilidad = accesibilidad;
		}

		public DesplegadoEscuelaProyeccionPFE getProyeccionPFE() {
			return proyeccionPFE;
		}

		public void setProyeccionPFE(DesplegadoEscuelaProyeccionPFE proyeccionPFE) {
			this.proyeccionPFE = proyeccionPFE;
		}

		public DesplegadoEscuelaECTAES getEctaes() {
			return ectaes;
		}

		public void setEctaes(DesplegadoEscuelaECTAES ectaes) {
			this.ectaes = ectaes;
		}

		public DesplegadoEscuela getEddes() {
			return eddes;
		}

		public void setEddes(DesplegadoEscuela eddes) {
			this.eddes = eddes;
		}

		public DesplegadoEscuela getEdfea() {
			return edfea;
		}

		public void setEdfea(DesplegadoEscuela edfea) {
			this.edfea = edfea;
		}

		public DesplegadoEscuela getEdbis() {
			return edbis;
		}

		public void setEdbis(DesplegadoEscuela edbis) {
			this.edbis = edbis;
		}

		public DesplegadoEscuela getEdccpa() {
			return edccpa;
		}

		public void setEdccpa(DesplegadoEscuela edccpa) {
			this.edccpa = edccpa;
		}

		public DesplegadoEscuela getRaeea() {
			return raeea;
		}

		public void setRaeea(DesplegadoEscuela raeea) {
			this.raeea = raeea;
		}

		public DesplegadoEscuela getEpep() {
			return epep;
		}

		public void setEpep(DesplegadoEscuela epep) {
			this.epep = epep;
		}

		public DesplegadoEscuelaSINO getErsb() {
			return ersb;
		}

		public void setErsb(DesplegadoEscuelaSINO ersb) {
			this.ersb = ersb;
		}

		public DesplegadoEscuelaSINO getEcdPFE() {
			return ecdPFE;
		}

		public void setEcdPFE(DesplegadoEscuelaSINO ecdPFE) {
			this.ecdPFE = ecdPFE;
		}

		public String getCd1() {
			return cd1;
		}

		public void setCd1(String cd1) {
			this.cd1 = cd1;
		}

		public String getCd2() {
			return cd2;
		}

		public void setCd2(String cd2) {
			this.cd2 = cd2;
		}

		public String getCd3() {
			return cd3;
		}

		public void setCd3(String cd3) {
			this.cd3 = cd3;
		}

		public String getCd4() {
			return cd4;
		}

		public void setCd4(String cd4) {
			this.cd4 = cd4;
		}

		public String getCd5() {
			return cd5;
		}

		public void setCd5(String cd5) {
			this.cd5 = cd5;
		}

		public String getCd6() {
			return cd6;
		}

		public void setCd6(String cd6) {
			this.cd6 = cd6;
		}

		public String getCd7() {
			return cd7;
		}

		public void setCd7(String cd7) {
			this.cd7 = cd7;
		}

		public String getMat1() {
			return mat1;
		}

		public void setMat1(String mat1) {
			this.mat1 = mat1;
		}

		public String getMat2() {
			return mat2;
		}

		public void setMat2(String mat2) {
			this.mat2 = mat2;
		}

		public String getMat3() {
			return mat3;
		}

		public void setMat3(String mat3) {
			this.mat3 = mat3;
		}

		public String getMat4() {
			return mat4;
		}

		public void setMat4(String mat4) {
			this.mat4 = mat4;
		}

		public String getMat5() {
			return mat5;
		}

		public void setMat5(String mat5) {
			this.mat5 = mat5;
		}

		public String getMat6() {
			return mat6;
		}

		public void setMat6(String mat6) {
			this.mat6 = mat6;
		}

		public String getMat7() {
			return mat7;
		}

		public void setMat7(String mat7) {
			this.mat7 = mat7;
		}

		public String getRep1() {
			return rep1;
		}

		public void setRep1(String rep1) {
			this.rep1 = rep1;
		}

		public String getRep2() {
			return rep2;
		}

		public void setRep2(String rep2) {
			this.rep2 = rep2;
		}

		public String getRep3() {
			return rep3;
		}

		public void setRep3(String rep3) {
			this.rep3 = rep3;
		}

		public String getRep4() {
			return rep4;
		}

		public void setRep4(String rep4) {
			this.rep4 = rep4;
		}

		public String getRep5() {
			return rep5;
		}

		public void setRep5(String rep5) {
			this.rep5 = rep5;
		}

		public String getRep6() {
			return rep6;
		}

		public void setRep6(String rep6) {
			this.rep6 = rep6;
		}

		public String getRep7() {
			return rep7;
		}

		public void setRep7(String rep7) {
			this.rep7 = rep7;
		}

		public String getAb1() {
			return ab1;
		}

		public void setAb1(String ab1) {
			this.ab1 = ab1;
		}

		public String getAb2() {
			return ab2;
		}

		public void setAb2(String ab2) {
			this.ab2 = ab2;
		}

		public String getAb3() {
			return ab3;
		}

		public void setAb3(String ab3) {
			this.ab3 = ab3;
		}

		public String getAb4() {
			return ab4;
		}

		public void setAb4(String ab4) {
			this.ab4 = ab4;
		}

		public String getAb5() {
			return ab5;
		}

		public void setAb5(String ab5) {
			this.ab5 = ab5;
		}

		public String getAb6() {
			return ab6;
		}

		public void setAb6(String ab6) {
			this.ab6 = ab6;
		}

		public String getAb7() {
			return ab7;
		}

		public void setAb7(String ab7) {
			this.ab7 = ab7;
		}

		public DesplegadoEscuelaSINO getEudbe() {
			return eudbe;
		}

		public void setEudbe(DesplegadoEscuelaSINO eudbe) {
			this.eudbe = eudbe;
		}

		public DesplegadoEscuelaSINO getTpacl() {
			return tpacl;
		}

		public void setTpacl(DesplegadoEscuelaSINO tpacl) {
			this.tpacl = tpacl;
		}

		public DesplegadoEscuelaSINO getSplftp() {
			return splftp;
		}

		public void setSplftp(DesplegadoEscuelaSINO splftp) {
			this.splftp = splftp;
		}

		public DesplegadoEscuelaSINO getEuscp() {
			return euscp;
		}

		public void setEuscp(DesplegadoEscuelaSINO euscp) {
			this.euscp = euscp;
		}

		public String getEqa() {
			return eqa;
		}

		public void setEqa(String eqa) {
			this.eqa = eqa;
		}
		
		
		
}
