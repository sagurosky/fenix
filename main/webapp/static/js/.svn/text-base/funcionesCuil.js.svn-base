/*
 * campo dni -> id="dni"
 * campo cuil -> id="cuil"
 * 
 */

var digito;
	
	//Se utiliza en el onfocus de los radios de sexo
	function generarCuil(valueRadio){
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		value = $('#dni').val();
		
		if(valueRadio == "false"){//Masculino			
			cuil = value;
			xy = 20;
			calcular( xy, cuil);
		}else{
			if(valueRadio == "true"){//fememino
				cuil = value;
				xy = 27;
				cuil = calcular( xy, cuil );
			}
		}
		
		if(isNaN( digito ) ){
			$('#cuil').val(" ");
		}
		else{
			cuil = formatear(xy, cuil, digito);
			$('#cuil').val(cuil);
		}
					
	}
	
	function calcular( xy, cuil ){
		var tmp1;
		var tmp2;
		var acum = 0;
		var n = 2;
		var	tmp1 = xy * 1 + cuil;
		
		for ( i = 0; i < 10; i++) {
			tmp2 = parseInt( tmp1 / 10);
			acum += parseInt( (tmp1 -tmp2 * 10 ) * n );
			tmp1 = tmp2;
		
			if (n < 7)
				n++;
			else
				n = 2;
		}
		
		n = (11 - acum % 11);
		
		if (n == 10) {
			if (xy == 20 || xy == 27 || xy == 24){
				xy = 23;
			}
		
				calcular(xy, cuil);
			} else {
				if (n == 11)
					digito = 0;
				else
					digito = n;
			  }
		
		return cuil;
	}
	
	function formatear(xy, cuil, digito) {
		return (xy + "-" + cuil + "-" + digito);		
	}
	
	function validar() {
		var error = false; /* No se detecto error hasta el momento, no se vio que falten datos */
		var faltantes = "Faltan: ";

		if (document.getElementById("dni").value == ""){
			error = true;
			faltantes += " N° de Documento \n";
			}
		
		if (error == true) {			/* Si hay error es porque entre en algun if, entonces muestro con alert lo que falta y devuelvo false para que no funcione el submit del formulario */
			alert (faltantes);
			return false;			/* El submit del formulario no funciona porque tiene un return validar() <-- y return false hace que no submitee que es lo que pasa en este caso */
		}else{
			return true;
		}
	}
	
	//Se utiliza en el onblur del campo DNI
	function verificarCuil(){
		if($("#sexoM").attr("checked")){
			generarCuil("false");
		}
		if($("#sexoF").attr("checked")){
			generarCuil("true");
		}
	}
	