package org.cimientos.intranet.modelo.pbe.evento.entrevistas;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.Periodo;
import org.hibernate.annotations.CollectionOfElements;

import com.cimientos.intranet.enumerativos.entrevista.ContenidosTrabajarEnElAnio;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionIncorporacion;
import com.cimientos.intranet.enumerativos.entrevista.MotivoIncorporacionPendiente;
import com.cimientos.intranet.enumerativos.entrevista.TipoContacto;
import com.cimientos.intranet.enumerativos.entrevista.motivoNoIncorporacion;



@Entity
@DiscriminatorValue("incorporacion")
public class EntrevistaReIncorporacion extends EntrevistaIndividual {
	
	
	//@CollectionOfElements
	//@JoinTable(name="contenidos_trabajar_en_el_anio")
	//@Enumerated(EnumType.ORDINAL)
	//private List<ContenidosTrabajarEnElAnio> contenidosTrabajarEnElAnio;
	

	@Enumerated(EnumType.ORDINAL)
	private EvaluacionIncorporacion incorporacion;
	
	@Enumerated(EnumType.ORDINAL)
	private motivoNoIncorporacion motivoNoIncorporacion;
	
	@Column(length=10000)
	private String observacionesNoIncorporacion;
	
	private boolean realizoEntrevista;
	
	@Enumerated(EnumType.ORDINAL)
	private TipoContacto tipoContacto;
	
	@OneToOne
	private Periodo periodoPrograma;
	
	@Column(length=10000)
	private String motivoTipoContactoOtro;
	
	@Column(length=10000)
	private String motivoNoIncorporacionOtro;
	
	@Enumerated(EnumType.ORDINAL)
	private MotivoIncorporacionPendiente motivoPendiente;
	
	@Column(length=10000)
	private String motivoOtroPendiente;
	
	//2018
	@Column(length=10000)
	private String observacionMateriasExamenes;
	
	
	//2022
	@Column(length=10000)
	private String otroHSE;

	@Column(length=10000)
	private String 	otroContenidoTrabajado;
	
	
	@Column(length=10000)
	private String 	oeaioe;
	
	
	
	
	
	
	
	

	public String getOeaioe() {
		return oeaioe;
	}

	public void setOeaioe(String oeaioe) {
		this.oeaioe = oeaioe;
	}

	public String getOtroContenidoTrabajado() {
		return otroContenidoTrabajado;
	}

	public void setOtroContenidoTrabajado(String otroContenidoTrabajado) {
		this.otroContenidoTrabajado = otroContenidoTrabajado;
	}

	public String getOtroHSE() {
		return otroHSE;
	}

	public void setOtroHSE(String otroHSE) {
		this.otroHSE = otroHSE;
	}

	public EvaluacionIncorporacion getIncorporacion() {
		return incorporacion;
	}

	public void setIncorporacion(EvaluacionIncorporacion incorporacion) {
		this.incorporacion = incorporacion;
	}

	public motivoNoIncorporacion getMotivoNoIncorporacion() {
		return motivoNoIncorporacion;
	}

	public void setMotivoNoIncorporacion(motivoNoIncorporacion motivoNoIncorporacion) {
		this.motivoNoIncorporacion = motivoNoIncorporacion;
	}

	public String getObservacionesNoIncorporacion() {
		return observacionesNoIncorporacion;
	}

	public void setObservacionesNoIncorporacion(String observacionesNoIncorporacion) {
		this.observacionesNoIncorporacion = observacionesNoIncorporacion;
	}

	public boolean isRealizoEntrevista() {
		return realizoEntrevista;
	}

	public void setRealizoEntrevista(boolean realizoEntrevista) {
		this.realizoEntrevista = realizoEntrevista;
	}

	public TipoContacto getTipoContacto() {
		return tipoContacto;
	}

	public void setTipoContacto(TipoContacto tipoContacto) {
		this.tipoContacto = tipoContacto;
	}

	public Periodo getPeriodoPrograma() {
		return periodoPrograma;
	}

	public void setPeriodoPrograma(Periodo periodoPrograma) {
		this.periodoPrograma = periodoPrograma;
	}
		
	/**
	 * Retorna true si en una entrevista incorporacion se cobra beca.
	 * @return
	 */
	public boolean isCobraBeca(){
		return super.isCobraBeca() && !this.getIncorporacion().equals(EvaluacionIncorporacion.NOINCORPORA)
			&& !this.getIncorporacion().equals(EvaluacionIncorporacion.INCORPORAPENDIENTE);
	}

	/**
	 * @return the motivoTipoContactoOtro
	 */
	public String getMotivoTipoContactoOtro() {
		return motivoTipoContactoOtro;
	}

	/**
	 * @param motivoTipoContactoOtro the motivoTipoContactoOtro to set
	 */
	public void setMotivoTipoContactoOtro(String motivoTipoContactoOtro) {
		this.motivoTipoContactoOtro = motivoTipoContactoOtro;
	}

	/**
	 * @return the motivoNoIncorporacionOtro
	 */
	public String getMotivoNoIncorporacionOtro() {
		return motivoNoIncorporacionOtro;
	}

	/**
	 * @param motivoNoIncorporacionOtro the motivoNoIncorporacionOtro to set
	 */
	public void setMotivoNoIncorporacionOtro(String motivoNoIncorporacionOtro) {
		this.motivoNoIncorporacionOtro = motivoNoIncorporacionOtro;
	}

	public MotivoIncorporacionPendiente getMotivoPendiente() {
		return motivoPendiente;
	}

	public void setMotivoPendiente(MotivoIncorporacionPendiente motivoPendiente) {
		this.motivoPendiente = motivoPendiente;
	}

	public String getMotivoOtroPendiente() {
		return motivoOtroPendiente;
	}

	public void setMotivoOtroPendiente(String motivoOtroPendiente) {
		this.motivoOtroPendiente = motivoOtroPendiente;
	}

	public String getObservacionMateriasExamenes() {
		return observacionMateriasExamenes;
	}

	public void setObservacionMateriasExamenes(String observacionMateriasExamenes) {
		this.observacionMateriasExamenes = observacionMateriasExamenes;
	}

	
	
	
}
