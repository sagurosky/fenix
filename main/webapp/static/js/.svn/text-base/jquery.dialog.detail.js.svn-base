function openDialog(idObjeto, urlDetalle, idDiv) {
	$.ajax({
	type: "POST",
	url: urlDetalle,
	data:"idObjeto=" + idObjeto,
	success: function(msg){
	$(idDiv).html(msg);
	$(idDiv).dialog({
		modal: true,
        draggable: true,
        resizable: false,
		width : 400,
		height: 'auto',
		show :'slow',
		hide :'slow'
	});
	}
	});
};	

function openDialogModalFalse(idObjeto, urlDetalle, idDiv) {
	$.ajax({
	type: "POST",
	url: urlDetalle,
	data:"idObjeto=" + idObjeto,
	success: function(msg){
	$(idDiv).html(msg);
	$(idDiv).dialog({
		position: 'right',
		modal: false,
        draggable: true,
        resizable: false,
		width : 400,
		height: 'auto',
		show :'slow',
		hide :'slow'
	});
	}
	});
};	

function openDetalleAlumno(idObjeto) {
	openDialogModalFalse(idObjeto, "../alumno/verDetalleAlumnoView.do", "#dialogAlumno");
}

function openDetallePadrino(idObjeto) {
	openDialog(idObjeto, "../perfilPadrino/verDetallePadrinoPersonaView.do", "#dialogPadrino");
}
function openDetalleRR(idObjeto) {
	openDialog(idObjeto, "../perfilRR/verDetalleRRView.do", "#dialogRR");
}
function openDetalleEA(idObjeto) {
	openDialog(idObjeto, "../perfilEA/verDetalleEAView.do", "#dialogEA");
}
function openDetalleTS(idObjeto) {
	openDialog(idObjeto, "../perfilTS/verDetalleTSView.do", "#dialogTS");
}
function openDetalleEntrevistaGrupal(idObjeto) {
	openDialog(idObjeto, "../entrevistas/verDetalleEntrevistaGrupalView.do", "#dialogEntrevistaGrupal");
}
function openListaConvocados(idObjeto) {
	openDialog(idObjeto, "../eventoGenerico/verListaConvocadosView.do", "#dialogConvocados");
}

