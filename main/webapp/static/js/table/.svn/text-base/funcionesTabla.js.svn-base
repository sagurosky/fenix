var oTable;
var asInitVals = new Array();
var agrupar = false;
var columnaAgrupada = -1;

$(function() {

	$("input:submit").button();
	$("input:button").button();
	
	$("#funciones").click(function(){
		$("#fxs").toggle();
	});
	
	function removeAccents(strAccents){
        strAccents = strAccents.split('');
        strAccentsOut = new Array();
        strAccentsLen = strAccents.length;
        var accents = '¡·”Û…ÈÕÌ⁄˙—Ò';
        var accentsOut = ['A','a','O','o','E','e','I','i','U','u','N','n'];
        for (var y = 0; y < strAccentsLen; y++) {
            if (accents.indexOf(strAccents[y]) != -1) {
                strAccentsOut[y] = accentsOut[accents.indexOf(strAccents[y])];
            }
            else
            strAccentsOut[y] = strAccents[y];
        }
        strAccentsOut = strAccentsOut.join('');
        return strAccentsOut;
    }


	jQuery.fn.dataTableExt.oSort['accent-asc']  = function(a,b) {
		 x = removeAccents(a).toLowerCase();
         y = removeAccents(b).toLowerCase();
         return ((x < y) ? -1 : ((x > y) ? 1 : 0));
	};

	jQuery.fn.dataTableExt.oSort['accent-desc'] = function(a,b) {
		var x = removeAccents(a).toLowerCase();
		var y = removeAccents(b).toLowerCase();
		return ((x < y) ? 1 : ((x > y) ? -1 : 0));
	};
	
/*	
	oTable = $('#laTabla').dataTable( {
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="25">25</option>'+
		'<option value="50">50</option>'+
		'<option value="75">75</option>'+
		'<option value="100">100</option>'+
		'<option value="-1">Todos</option>'+
		'</select> registros por hoja',
		"sZeroRecords": "No se encontraron registros",
		"sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
		"sInfoEmtpy": "Mostrando 0 registros",
		"sInfoFiltered": "(filtrado de _MAX_ registros totales)",
		"sSearch": "Buscar",
		"oPaginate": {
			"sFirst":    "Primera",
			"sPrevious": "Anterior",
			"sNext":     "Siguiente",
			"sLast":     "Ultima"
		}
		
		},
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25
	});
*/
	initSearchInput();	
});

function initSearchInput(){
	
		$("thead input").keyup( function () {
			//Esto es un parche para que se puedan utilizar los filtros en una 
			//Seleccion multiple. 
			//Esta variable se debe poner en true,antes de la incorporacion de las funciones de la tabla
			try {
				if(isMultipleSeleccion == "undefined"){
					isMultipleSeleccion = false;
				}
			} catch (e) {
				isMultipleSeleccion = false;
			}
			if(isMultipleSeleccion){
				var index = eval($("thead input").index(this)+ 1 );
				/* Filter on the column (the index) of this element */
				oTable.fnFilter( this.value,index);
			}else{
				oTable.fnFilter( this.value, $("thead input").index(this) );
			}
		} );
		
		$("thead input").each( function (i) {
			asInitVals[i] = this.value;
		} );
		
		$("thead input").focus( function () {
			if ( this.className == "search_init" )
			{
				this.className = "";
				this.value = "";
			}
		} );
		
		$("thead input").blur( function (i) {
			if ( this.value == "" )
			{
				this.className = "search_init";
				this.value = asInitVals[$("thead input").index(this)];
			}
		} );
		
		jQuery('thead select').change( function() {
			select_val = jQuery(this).val();
			if (select_val == "All" || select_val == '') {
				oTable.fnFilter("");
				oTable.fnDraw();
			} else {
				oTable.fnFilter(select_val);
			}
			jQuery('thead select').val(select_val);
		});
		
		$("#acciones").unbind('click');


}

function agruparColumna(idx){
	//alert(idx);
	var filas = oTable.fnGetNodes();
	if(filas.length > 0){

		if(agrupar == false){
		
			agrupar = true;
			columnaAgrupada = idx;
			
			//ordeno por la columna que quiero agrupar
			oTable.fnSort([[idx,'asc']]);
			
			var selector = ".col" + idx;

			var longitud = oTable.fnSettings()._iDisplayLength;
			oTable.fnSettings()._iDisplayLength = -1;
			oTable.fnDraw();
			
			var celdas = $(selector);
			var fondo = "#C0C2FF"
				
			var anterior = celdas[0];
			$(anterior).css('background-color', '#C0C2FF');
			//anterior.style.backgroundColor = "#C0C2FF";
			
			for (var i = 1; i < celdas.length; i++) {
				actual = celdas[i];
				if(anterior.innerHTML == actual.innerHTML || actual.innerHTML == "" ){
					actual.innerHTML = "";
					actual.style.backgroundColor = anterior.style.backgroundColor;
				}else{
					fondo = cambiarFondo(fondo);
					anterior = actual;
					anterior.style.backgroundColor = fondo;
				}
			}
			
			oTable.fnSettings()._iDisplayLength = longitud;
			oTable.fnDraw();
			
			//deshabilito el ordenamiento de las columnas
			$('th').unbind('click');
			
			$("#fxs").toggle();
			
		}else{
			window.location.reload();
		}
		
	}
	
}

//No funciona correctamente - no se implementÛ
function desagruparColumna(idx){
	
	if(columnaAgrupada == idx){
		
		columnaAgrupada = -1;
		agrupar = false;
		
		var selector = ".col" + idx;
		
		var longitud = oTable.fnSettings()._iDisplayLength;
		oTable.fnSettings()._iDisplayLength = -1;
		oTable.fnDraw();
		
		var celdas = $(selector);
		//$(selector).css("background-color","#FFFFFF")
		
		//var fondo = "#E0E2FF"
		
		var anterior = celdas[0];
		//anterior.style.backgroundColor = fondo;
		
		for (var i = 1; i < celdas.length; i++) {
			actual = celdas[i];
			if(actual.innerHTML == ""){
				actual.innerHTML = anterior.innerHTML;
			}
			//if(i%2 == 0){
			//	actual.style.backgroundColor = fondo;
			//}
			anterior = actual;
		}
		
		oTable.fnSettings()._iDisplayLength = longitud;
		oTable.fnDraw();
		
		var cabeceras = $("th");
		for(var i = 0; i < cabeceras.length; i++){
			oTable.fnSortListener(cabeceras[i],i);
		}
		
	}
	
}

function cambiarFondo(fondo){
	if(fondo == "#C0C2FF"){
		return "#D3D6FF";
	}else{
		return "#C0C2FF";
	}
}

function hacerToggle(){
	$("#fxs").toggle();
}

function cerrarTabla(selector){
	document.getElementById(selector).innerHTML="";
}

function subtotalizarColumna(idx){

	//obtengo todas las filas
	 var filas = oTable.fnGetNodes();

	    var columnas = new Array();

	    for (var i = 0; i < filas.length; i++) {
			//idx es la posicion de la columna en la fila
	        columnas[i] = (oTable.fnGetData(filas[i])[idx]);
	    }

	    //es el array que va a contener los datos para la nueva tabla
	    var arrayTabla = new Array();
	    
	    for (var i = 0; i < columnas.length; i++) {
		    var encontro = false;

		    for(var j = 0; j < arrayTabla.length; j++){
				if(columnas[i] == arrayTabla[j][0] ){
					arrayTabla[j][1]++;
					encontro = true;
				}
			}

		    if(encontro == false){
				var aux = new Array(2);
				aux[0] = columnas[i];
				aux[1] = 1;
				arrayTabla.push(aux);
			}
			
	    }

	   // $('#contenedor').html('<div class="ui-state-default ui-corner-all" ><a href="#" onclick="cerrarTabla()">cerrar</a></div>');
	    $('#contenedor').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="ejemplo"></table>' );
	    $('#contenedor').append('<div class="ui-state-default ui-corner-all" ><table align="center">'+
	    		'<tr><td><a href="#" onclick="cerrarTabla(\'contenedor\')"><b>Cerrar<b></a></td></tr></table></div>' );

		var tablaSub = $('#ejemplo').dataTable({
			"oLanguage": {
			"sLengthMenu": 'Mostrar <select>'+
			'<option value="25">25</option>'+
			'<option value="50">50</option>'+
			'<option value="75">75</option>'+
			'<option value="100">100</option>'+
			'<option value="-1">Todos</option>'+
			'</select> registros por hoja',
			"sZeroRecords": "No se encontraron registros",
			"sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
			"sInfoEmtpy": "Mostrando 0 registros",
			"sInfoFiltered": "(filtrado de _MAX_ registros totales)",
			"sSearch": "Buscar",
			"oPaginate": {
				"sFirst":    "Primera",
				"sPrevious": "Anterior",
				"sNext":     "Siguiente",
				"sLast":     "Ultima"
			}
			
			},
			"bJQueryUI": true,
			"sPaginationType": "full_numbers",
			"iDisplayLength": 25,
			"aaData": arrayTabla,
			"aoColumns": [
				{ "sTitle": "Nombre" },
				{ "sTitle": "Repeticiones" }
			]
		});
	
		tablaSub.fnAdjustColumnSizing();
		tablaSub.fnDraw();
		
		$("#fxs").toggle();
	
		

}