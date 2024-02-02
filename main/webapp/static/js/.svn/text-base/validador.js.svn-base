function soloNumeros(evt) {  
		//Validar la existencia del objeto event  
		evt = (evt) ? evt : event;  
		   
		//Extraer el codigo del caracter de uno de los diferentes grupos de codigos  
		var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));  
		//Predefinir como valido  
		var respuesta = true;  
		   
		//Validar si el codigo corresponde a los NO aceptables  
		if (charCode > 31 && (charCode < 48 || charCode > 57)){  
			//Asignar FALSE a la respuesta si es de los NO aceptables  
			respuesta = false;  
		}  
		   
		//Regresar la respuesta  
		return respuesta;  
	}
 
function validarDecimal(evt, field)
{
	evt = (evt) ? evt : event;
	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode
			: ((evt.which) ? evt.which : 0));
	var respuesta = true;
	if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
		respuesta = false;
	}
	if (charCode == 46) {
		var patt1 = new RegExp("\\.");
		var ch = patt1.exec(field.value);
		if (ch == ".") {
			respuesta = false;
		}
	}
	return respuesta;
} 

function esMayor(f1, f2) {

	var xDay = f1.substring(0, 2);
	var xMonth = f1.substring(3, 5);
	var xYear = f1.substring(6, 10);

	var yDay = f2.substring(0, 2);
	var yMonth = f2.substring(3, 5);
	var yYear = f2.substring(6, 10);

	if (xYear > yYear) {
		return (true)
	} else {
		if (xYear == yYear) {
			if (xMonth > yMonth) {
				return (true)
			} else {
				if (xMonth == yMonth) {
					if (xDay > yDay)
						return (true);
				}
			}
		}

	}
	return (false);
}

function controlarfechaInicio(fechaInicio,fechaFin) 
{
	if (fechaFin.value != "") {
		if (esMayor(fechaInicio.value, fechaFin.value)) 
		{
			alert("La fecha de inicio no puede ser mayor a la fecha de fin")
		}
		
	}
}
function controlarfechaFin(fechaFin, fechaInicio) 
{
	if (fechaInicio.value != " ") {
		if (esMayor(fechaInicio.value, fechaFin.value)) 
		{
			alert("La fecha de fin no puede ser menor a la fecha de inicio")
		}
	}
}

function validarHoras(hora) {

	var RegExPattern = /^(0[0-9]|1\d|2[0-3]):([0-5]\d)$/;
	
	if ((hora.value!='') && !(hora.value.match(RegExPattern))) {
		jAlert('warning','Hora inválida. Ingrese una hora entre las 00:00 y las 23:59', 'Atención!');
		hora.value = "";
	}
}

function calcular( xy, cuil )
{
	//completa con 0 a la izquierda
	cuil = padding_left(cuil, '0', 8); 
	var tmp1;
	var tmp2;
	var acum = 0;
	var n = 2;
	var	tmp1 = xy * 1 + cuil;

	for ( i = 0; i < 10; i++) 
	{
		tmp2 = parseInt( tmp1 / 10);
		acum += parseInt( (tmp1 -tmp2 * 10 ) * n );
		tmp1 = tmp2;
	
		if (n < 7)
			n++;
		else
			n = 2;
	}
	
	n = (11 - acum % 11);
	if (n == 10) 
	{
		if (xy == 20 || xy == 27)
		{
			if(xy == 20)
				digito = 9;
			else
				digito = 4;
			
			xy = 23;
		}
	} 
	else 
	{
		if (n == 11)
			digito = 0;
		else 
			digito = n;
	}
	return xy + '-' + cuil + '-' + digito;
}

//left padding s with c to a total of n chars
function padding_left(s, c, n) {
    if (! s || ! c || s.length >= n) {
        return s;
    }

    var max = (n - s.length)/c.length;
    for (var i = 0; i < max; i++) {
        s = c + s;
    }

    return s;
}

// right padding s with c to a total of n chars
function padding_right(s, c, n) {
    if (! s || ! c || s.length >= n) {
        return s;
    }

    var max = (n - s.length)/c.length;
    for (var i = 0; i < max; i++) {
        s += c;
    }

    return s;
}

//Me permite remplazar valores dentro de una cadena
function str_replace($cambia_esto, $por_esto, $cadena) {
   return $cadena.split($cambia_esto).join($por_esto);
}

//Valida que no sean ingresado ENTER dentro del textarea
function textareaSinEnter($char, obj){
  // alert ($char); 
   	if($char == 13){
    	texto_escapado = escape(obj.value);
      	if(navigator.appName == "Opera" || navigator.appName == "Microsoft Internet Explorer") 
    		texto_sin_enter = str_replace("%0D%0A", "", texto_escapado); 
      	else texto_sin_enter = str_replace("%0A", "", texto_escapado);
        obj.value = unescape(texto_sin_enter); 
   	}
}


//elimina los ENTER dentro del textarea
function eliminarEnter(obj){
 	texto_escapado = escape(obj.value);
	if(navigator.appName == "Opera" || navigator.appName == "Microsoft Internet Explorer") 
		texto_sin_enter = str_replace("%0D%0A", "", texto_escapado); 
	else texto_sin_enter = str_replace("%0A", "", texto_escapado);
	obj.value = unescape(texto_sin_enter); 
}

function chequearLongitudTextarea(obj, maxlength){
	if (obj.value.length > maxlength) {
	obj.value = obj.value.substring(0,maxlength);
	}
}


