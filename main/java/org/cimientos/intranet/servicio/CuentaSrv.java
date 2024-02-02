package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.cimientos.intranet.dao.ResponsableDao;
import org.cimientos.intranet.dto.CreacionCuentaDTO;
import org.cimientos.intranet.modelo.EstadoCuenta;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.displaytag.properties.SortOrderEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CuentaSrv {

	@Autowired
	private ResponsableDao responsableDao;

	@Autowired
	private AlumnoPanelEASrv srvAlumnoPanel;
	
	/**
	 * @author esalvador
	 */
	public List<CreacionCuentaDTO> obtenerListaCuentasFiltradasPorBecado(String nombre) {
		List<ResponsableAdulto> responsables = responsableDao.obtenerResponsablesPorNombreSimilar(nombre);
		return obtenerCuentasDTO(responsables);

	}
	
	/**
	 * @author esalvador
	 */
	public List<CreacionCuentaDTO> obtenerCuentasFiltradasPorTitular(String titularCuenta) {
		List<ResponsableAdulto> responsables = responsableDao.obtenerResponsablesPorTitularSimilar(titularCuenta);
		return obtenerCuentasDTO(responsables);
	}
	
	/**
	 * @return
	 */
	public List<CreacionCuentaDTO> obtenerListaCuentasACrear(Banco banco, boolean traerCuentasMenosIndustrial) {
		List<ResponsableAdulto> responsables = responsableDao.obtenerResponsablesSinNroCuenta(banco, traerCuentasMenosIndustrial);
		return obtenerCuentasDTO(responsables);

	}
	
	/**
	 * @return
	 */
	public List<CreacionCuentaDTO> obtenerListaCuentasTodas(Banco banco, int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		List<ResponsableAdulto> responsables = responsableDao.obtenerResponsablesPorBanco(banco, firstResult, maxResults, sortDirection, sortCriterion);
		return obtenerCuentasDTO(responsables);

	}

	
	/**
	 * @param tipoCuentaId 
	 * @return
	 */
	public List<CreacionCuentaDTO> obtenerListaCuentasFiltradas(Banco banco, String becado,String titular,String numCuenta, Long zonaId, String rr,Long idRr, Integer idEstadoCuenta, Integer dniRA,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {

		List<ResponsableAdulto> responsables = new ArrayList<ResponsableAdulto>();
		responsables = responsableDao.obtenerResponsablesFiltrados(banco, becado, titular, numCuenta, zonaId, rr, idRr, idEstadoCuenta, dniRA, firstResult, maxResults, sortDirection, sortCriterion);
		return obtenerCuentasDTO(responsables);
	}
	

	public int obtenerCantidadCuentasFiltradasAExportar(Banco banco, String becado,String titular, String numCuenta, Long zonaId,String rr,Long rrId, Integer idEstadoCuenta, Integer dniRA) {
		Integer count = responsableDao.obtenerCantidadResponsablesFiltradosAExportar(banco, becado, titular, numCuenta, zonaId, rr, rrId, idEstadoCuenta, dniRA);
	return count;
	}
	
	
	
	/**
	 * @param responsables
	 * @param staff
	 * @return
	 */
	private List<CreacionCuentaDTO> obtenerCuentasDTO(
			List<ResponsableAdulto> responsables) {
		CreacionCuentaDTO cuentaDTO = null;
		List<CreacionCuentaDTO> cuentasDTO = new ArrayList<CreacionCuentaDTO>();
		for (ResponsableAdulto responsable : responsables) {
				cuentaDTO = new CreacionCuentaDTO();
				cuentaDTO.setApellido(responsable.getApellido());
				cuentaDTO.setNombre(responsable.getNombre());
				cuentaDTO.setLocalidad(responsable.getIdLocalidad() != null ? 
						responsable.getIdLocalidad().getNombre() : "");
				cuentaDTO.setNroDocumento(responsable.getDni());
				cuentaDTO.setProvincia(responsable.getIdLocalidad() != null && responsable.getIdLocalidad().getProvincia() != null ? 
						responsable.getIdLocalidad().getProvincia().getDescripcion() : "");
				cuentaDTO.setTipoPersona(CreacionCuentaDTO.RA);
				cuentaDTO.setId(responsable.getId());
				cuentaDTO.setNroCuil(responsable.getCuilCuit());
				cuentaDTO.setNroCuenta(responsable.getNroCuenta());
				cuentaDTO.setEstado(responsable.getEstadoCuenta());
				cuentaDTO.setFechaExportacion(responsable.getFechaExportacion());
				cuentaDTO.setMotivoFallido(responsable.getMotivoFallidoCuenta());
				//solo para RAs
				PerfilAlumno alumno = responsable.getIdAlumno();
				cuentaDTO.setApellidoAlumno(alumno.getDatosPersonales().getApellido());
				cuentaDTO.setNombreAlumno(alumno.getDatosPersonales().getNombre());
				cuentaDTO.setZona(alumno.getEscuela().getLocalidad().getZona().getNombre());
				PerfilRR rr = (alumno.getEa() != null ? alumno.getEa().getRr() : null);
				cuentaDTO.setNombreRR(rr != null ? rr.getDatosPersonales().getNombre() : null);
				cuentaDTO.setApellidoRR(rr != null ? rr.getDatosPersonales().getApellido(): null);
				cuentaDTO.setIdAlumno(alumno.getId());
				cuentaDTO.setBanco(responsable.getSucursalBanco().getBanco().getNombre());
				//System.out.println(alumno.getId());
				if (alumno.getEstadoAlumno().getId()==17) {
					cuentasDTO.add(cuentaDTO);
				}
		}
		return cuentasDTO;
	}

	/**
	 * @param cuentas
	 */
	public int altaCuentas(Map<String, String> cuentas, Banco banco) {
		Set<String> cuils = cuentas.keySet();
		
		List<ResponsableAdulto> responsables = responsableDao.obtenerResponsablesPorCuils(cuils);

		for (ResponsableAdulto responsable : responsables) {
			if((responsable.getNroCuenta() == null || responsable.getNroCuenta().equals(""))){
				String nroCuentaNuevo = cuentas.get(responsable.getCuilCuit());
				responsable.setNroCuenta(nroCuentaNuevo);
				responsable.setBanco(banco);
				responsable.setEstadoCuenta(EstadoCuenta.ACTIVA);
				responsableDao.guardar(responsable);
				actualizarPanelEA(responsable);
			}
		}

		return responsables.size();
	}
	

	private void actualizarPanelEA(ResponsableAdulto responsable) {
		//cambios panel de control del ea
		AlumnoPanelEA panelEa = srvAlumnoPanel.obtenerAlumnoPanelPorIdPerfilAlumno(responsable.getIdAlumno().getId());
		if(panelEa != null){
			panelEa.actualizarCuenta(responsable.getEstadoCuenta());
			panelEa.setCuentaRA(responsable.getNroCuenta());
			srvAlumnoPanel.modificarAlumnoPanelEA(panelEa);
		}
	}
	
}
