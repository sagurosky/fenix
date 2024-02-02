//Filtro por zona, requiere dos inputs 'zonaCimientosId' y 'zonaCimientos'
//id zona: zonaCimientosId
$(function() {
	$("#zonaCimientos").keypress(function(){
		$("#zonaCimientosId").val(0);
		$("#zonaCimientos").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarZonaPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.zonas, function(item) {
							return {
								label: item.nombre,
								value: item.nombre,
								id: item.id
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#zonaCimientosId").val(ui.item.id);
			}
		});
	});
});

//Filtro para encargada de acompañamiento + zona
//id encargado: ea
$(function() {
	$("#ea").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEAPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.eas, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							ea: item.ea
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idEA").val(ui.item.id);
			$("#ea").text(ui.item.ea);
		}
	});
});


//Filtro para responsable de reclutamiento
//id encargado: rr
$(function() {
	$("#rr").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarRRPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.rrs, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							rr: item.rr
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idRR").val(ui.item.id);
			$("#rr").text(ui.item.rr);
		}
	});
});


$(function() {
	$("#padrino").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarPadrinosPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 15,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.padrinos, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idPadrino").val(ui.item.id);
//			$("#padrino").val(ui.item.nombre);
		}
	});
});


//Filtro para encargada de acompañamiento + zona
//id encargado: ea
//id zona: zonaCimientosId
$(function() {
	$("#eaAndZona").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEasPorZonaYNombre.do?idZona=" + $("#zonaCimientosId").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.json, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							ea: item.nombre
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idEA").val(ui.item.id);
			$("#ea").text(ui.item.nombre);
		}
	});
});

//Filtro para correctora
//id correctora: correctora
$(function() {
	$("#correctora").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarCorrectoraPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.correctoras, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							correctora: item.correctora
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idCorrectora").val(ui.item.id);
			$("#correctora").text(ui.item.correctora);
		}
	});
});
