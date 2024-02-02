package org.cimientos.intranet.modelo.evento.eventoGenerico;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.apache.commons.collections.Factory;
import org.apache.commons.collections.list.LazyList;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.evento.Evento;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.persona.Persona;
import org.hibernate.annotations.CollectionOfElements;

import com.cimientos.intranet.enumerativos.entrevista.ContenidosAbordados;

/**
 * @author plabaronnie
 *
 */
@Entity
public class EventoGenerico extends Evento{

	@ManyToOne
	private PerfilEA ea;
	
	private Date fechaCarga;
	
	private Date fechaEvento;
	
	@ManyToOne
	private Escuela lugarEncuentro;
	
	@Enumerated(EnumType.ORDINAL)
	private TipoEventoGenerico tipoEvento;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<AsistenciaEventoGenerico> convocados = LazyList.decorate(new ArrayList<AsistenciaEventoGenerico>(), new Factory() {
        public Object create() {
            return new AsistenciaEventoGenerico();
        }
    });
	@CollectionOfElements
	@JoinTable(name="eventoGenerico_contenidos")
	@Column(name="contenido_id")
	@Enumerated(EnumType.ORDINAL)
	private List<ContenidosAbordados> contenidosAbordados;
	
	@Enumerated(EnumType.ORDINAL)
	private EvaluacionEncuentro evaluacionEncuentro;
	
	@Column(length = 10000)
	private String observaciones;
	
	@ManyToOne
	private Persona quienCargoEvento;
	
	private boolean pagaEntrevista;
	
	private boolean activo;
	
	@Column(length = 10000)
	private String otroContenidoAbordado;
	
	
	//2019
		@Column(length=30)
		private String op1;
		
		@Column(length=30)
		private String op2;
		
		@Column(length=30)
		private String op3;
		
		@Column(length=30)
		private String op4;
		
		@Column(length=30)
		private String op5;
		
		@Column(length=30)
		private String op6;
		
		@Column(length=100)
		private String op;
		
		@Column(length=30)
		private String tipoEncuentro;
	
	

		
		
	public String getOp() {
			return op;
		}

		public void setOp(String op) {
			this.op = op;
		}

	public String getOp5() {
			return op5;
		}

		public void setOp5(String op5) {
			this.op5 = op5;
		}

		public String getOp6() {
			return op6;
		}

		public void setOp6(String op6) {
			this.op6 = op6;
		}

	public String getOp4() {
			return op4;
		}

		public void setOp4(String op4) {
			this.op4 = op4;
		}

	public String getOp1() {
			return op1;
		}

		public void setOp1(String op1) {
			this.op1 = op1;
		}

		public String getOp2() {
			return op2;
		}

		public void setOp2(String op2) {
			this.op2 = op2;
		}

		public String getOp3() {
			return op3;
		}

		public void setOp3(String op3) {
			this.op3 = op3;
		}

		public String getTipoEncuentro() {
			return tipoEncuentro;
		}

		public void setTipoEncuentro(String tipoEncuentro) {
			this.tipoEncuentro = tipoEncuentro;
		}

	/**
	 * @return the ea
	 */
	public PerfilEA getEa() {
		return ea;
	}

	/**
	 * @param ea the ea to set
	 */
	public void setEa(PerfilEA ea) {
		this.ea = ea;
	}

	/**
	 * @return the fechaCarga
	 */
	public Date getFechaCarga() {
		return fechaCarga;
	}

	/**
	 * @param fechaCarga the fechaCarga to set
	 */
	public void setFechaCarga(Date fechaCarga) {
		this.fechaCarga = fechaCarga;
	}

	/**
	 * @return the fechaEvento
	 */
	public Date getFechaEvento() {
		return fechaEvento;
	}

	/**
	 * @param fechaEvento the fechaEvento to set
	 */
	public void setFechaEvento(Date fechaEvento) {
		this.fechaEvento = fechaEvento;
	}

	/**
	 * @return the lugarEncuentro
	 */
	public Escuela getLugarEncuentro() {
		return lugarEncuentro;
	}

	/**
	 * @param lugarEncuentro the lugarEncuentro to set
	 */
	public void setLugarEncuentro(Escuela lugarEncuentro) {
		this.lugarEncuentro = lugarEncuentro;
	}

	/**
	 * @return the tipoEvento
	 */
	public TipoEventoGenerico getTipoEvento() {
		return tipoEvento;
	}

	/**
	 * @param tipoEvento the tipoEvento to set
	 */
	public void setTipoEvento(TipoEventoGenerico tipoEvento) {
		this.tipoEvento = tipoEvento;
	}

	/**
	 * @return the convocados
	 */
	public List<AsistenciaEventoGenerico> getConvocados() {
		return convocados;
	}

	/**
	 * @param convocados the convocados to set
	 */
	public void setConvocados(List<AsistenciaEventoGenerico> convocados) {
		this.convocados = convocados;
	}


	/**
	 * @return the observaciones
	 */
	public String getObservaciones() {
		return observaciones;
	}

	/**
	 * @param observaciones the observaciones to set
	 */
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}



	/**
	 * @return the contenidosAbordados
	 */
	public List<ContenidosAbordados> getContenidosAbordados() {
		return contenidosAbordados;
	}

	/**
	 * @param contenidosAbordados the contenidosAbordados to set
	 */
	public void setContenidosAbordados(List<ContenidosAbordados> contenidosAbordados) {
		this.contenidosAbordados = contenidosAbordados;
	}

	/**
	 * @return the evaluacionEncuentro
	 */
	public EvaluacionEncuentro getEvaluacionEncuentro() {
		return evaluacionEncuentro;
	}

	/**
	 * @param evaluacionEncuentro the evaluacionEncuentro to set
	 */
	public void setEvaluacionEncuentro(EvaluacionEncuentro evaluacionEncuentro) {
		this.evaluacionEncuentro = evaluacionEncuentro;
	}

	/**
	 * @return the quienCargoEvento
	 */
	public Persona getQuienCargoEvento() {
		return quienCargoEvento;
	}

	/**
	 * @param quienCargoEvento the quienCargoEvento to set
	 */
	public void setQuienCargoEvento(Persona quienCargoEvento) {
		this.quienCargoEvento = quienCargoEvento;
	}

	/**
	 * @return the pagaEntrevista
	 */
	public boolean isPagaEntrevista() {
		return pagaEntrevista;
	}

	/**
	 * @param pagaEntrevista the pagaEntrevista to set
	 */
	public void setPagaEntrevista(boolean pagaEntrevista) {
		this.pagaEntrevista = pagaEntrevista;
	}

	/**
	 * @return the activo
	 */
	public boolean isActivo() {
		return activo;
	}

	/**
	 * @param activo the activo to set
	 */
	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	/**
	 * @return the otroContenidoAbordado
	 */
	public String getOtroContenidoAbordado() {
		return otroContenidoAbordado;
	}

	/**
	 * @param otroContenidoAbordado the otroContenidoAbordado to set
	 */
	public void setOtroContenidoAbordado(String otroContenidoAbordado) {
		this.otroContenidoAbordado = otroContenidoAbordado;
	}
	
	

}
