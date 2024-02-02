<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@page import="java.util.ArrayList"%>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<title>Boletín</title>
<style>
.celda{
	color: #45526e;
	text-align: center;
}

.inasistencias{
	background-color: #9e9e9e;
}

.materias{
	background-color: #aa66cc;
}

.previas{
	background-color: #9fa8da;
}

.fuente {
    /* el tamaño por defecto es 14px */
    font-size: 12px;
}

.cuidado{
	color:blue;

}
</style>

<script>
function validarExtension(){
	if(!document.getElementById("foto").value.length==0){
		 var a = document.getElementById("foto").value;
		 a1 = a.indexOf('.JPG');
		 a2 = a.indexOf('.jpg');
		 if ((a1 < 0) && (a2 <0)) {
			 alert("Imagen no válida");
			 document.getElementById("foto").value = "";
		 } 
		document.getElementById("foto").focus();
		return false;
	}
}
</script>


<script>
function inasistencia1(){
	if($("#inas1").val()=="s" || $("#inas1").val()=="S"){
		$("#inas1").val("Sin dato");
	}
}

function inasistencia2(){
	if($("#inas2").val()=="s" || $("#inas2").val()=="S"){
		$("#inas2").val("Sin dato");
	}
}

function inasistencia3(){
	if($("#inas3").val()=="s" || $("#inas3").val()=="S"){
		$("#inas3").val("Sin dato");
	}
}

function seleccionarTexto(obj){
obj.select();
}


function sumar1T(){	
		if($("#qma1").val()=="s" || $("#qma1").val()=="S"){
			$("#qma1").val("Sin Información");
		}
		if($("#qma1").val()=="n" || $("#qma1").val()=="N"){
			$("#qma1").val("No Aplica");
		}
		if($("#qmd1").val()=="s" || $("#qmd1").val()=="S"){
			$("#qmd1").val("Sin Información");
		}
		if($("#qmd1").val()=="n" || $("#qmd1").val()=="N"){
			$("#qmd1").val("No Aplica");
		}
		if($("#qmsc1").val()=="s" || $("#qmsc1").val()=="S"){
			$("#qmsc1").val("Sin Información");
		}
		if($("#qmsc1").val()=="n" || $("#qmsc1").val()=="N"){
			$("#qmsc1").val("No Aplica");
		}
		
		var qma1=0;
		var qmd1=0;
		var qmsc1=0;
		var qmt1=0;
		qma1=parseInt($("#qma1").val());	
		qmd1=parseInt($("#qmd1").val());
		qmsc1=parseInt($("#qmsc1").val());
		//alert(qmd1);
		if (isNaN(qma1)) {
		    qma1=0;
		}
		if (isNaN(qmd1)) {
			qmd1=0;
		}
		if (isNaN(qmsc1)) {
			qmsc1=0;
		}	
		qmt1=qma1+qmd1+qmsc1;
		$("#qmt1").val(qmt1);				
	//}else{
	//	$("#qma1").val("");
	//}
		
}
</script>
<script>
function sumar2T(){
	if($("#qma2").val()=="s" || $("#qma2").val()=="S"){
		$("#qma2").val("Sin Información");
	}
	if($("#qma2").val()=="n" || $("#qma2").val()=="N"){
		$("#qma2").val("No Aplica");
	}
	if($("#qmd2").val()=="s" || $("#qmd2").val()=="S"){
		$("#qmd2").val("Sin Información");
	}
	if($("#qmd2").val()=="n" || $("#qmd2").val()=="N"){
		$("#qmd2").val("No Aplica");
	}
	if($("#qmsc2").val()=="s" || $("#qmsc2").val()=="S"){
		$("#qmsc2").val("Sin Información");
	}
	if($("#qmsc2").val()=="n" || $("#qmsc2").val()=="N"){
		$("#qmsc2").val("No Aplica");
	}
	
	var qma2=0;
	var qmd2=0;
	var qmsc2=0;
	var qmt2=0;
	qma2=parseInt($("#qma2").val());	
	qmd2=parseInt($("#qmd2").val());
	qmsc2=parseInt($("#qmsc2").val());
	//alert(qmd1);
	if (isNaN(qma2)) {
	    qma2=0;
	  }
	if (isNaN(qmd2)) {
		qmd2=0;
	}
	if (isNaN(qmsc2)) {
		qmsc2=0;
	}	
	qmt2=qma2+qmd2+qmsc2;
	$("#qmt2").val(qmt2);  
}
</script>
<script>
function sumar3T(){
	if($("#qma3").val()=="s" || $("#qma3").val()=="S"){
		$("#qma3").val("Sin Información");
	}
	if($("#qma3").val()=="n" || $("#qma3").val()=="N"){
		$("#qma3").val("No Aplica");
	}
	if($("#qmd3").val()=="s" || $("#qmd3").val()=="S"){
		$("#qmd3").val("Sin Información");
	}
	if($("#qmd3").val()=="n" || $("#qmd3").val()=="N"){
		$("#qmd3").val("No Aplica");
	}
	if($("#qmsc3").val()=="s" || $("#qmsc3").val()=="S"){
		$("#qmsc3").val("Sin Información");
	}
	if($("#qmsc3").val()=="n" || $("#qmsc3").val()=="N"){
		$("#qmsc3").val("No Aplica");
	}
	var qma3=0;
	var qmd3=0;
	var qmsc3=0;
	var qmt3=0;
	qma3=parseInt($("#qma3").val());	
	qmd3=parseInt($("#qmd3").val());
	qmsc3=parseInt($("#qmsc3").val());
	//alert(qmd1);
	if (isNaN(qma3)) {
	    qma3=0;
	  }
	if (isNaN(qmd3)) {
		qmd3=0;
	}
	if (isNaN(qmsc3)) {
		qmsc3=0;
	}	
	qmt3=qma3+qmd3+qmsc3;
	$("#qmt3").val(qmt3);  
}
</script>

<script>
function sumarSF(){
	if($("#qmasf").val()=="s" || $("#qmasf").val()=="S"){
		$("#qmasf").val("Sin Información");
	}
	if($("#qmasf").val()=="n" || $("#qmasf").val()=="N"){
		$("#qmasf").val("No Aplica");
	}
	if($("#qmdsf").val()=="s" || $("#qmdsf").val()=="S"){
		$("#qmdsf").val("Sin Información");
	}
	if($("#qmdsf").val()=="n" || $("#qmdsf").val()=="N"){
		$("#qmdsf").val("No Aplica");
	}
	if($("#qmscsf").val()=="s" || $("#qmscsf").val()=="S"){
		$("#qmscsf").val("Sin Información");
	}
	if($("#qmscsf").val()=="n" || $("#qmscsf").val()=="N"){
		$("#qmscsf").val("No Aplica");
	}
	var qmasf=0;
	var qmdsf=0;
	var qmscsf=0;
	var qmtsf=0;
	qmasf=parseInt($("#qmasf").val());	
	qmdsf=parseInt($("#qmdsf").val());
	qmscsf=parseInt($("#qmscsf").val());
	//alert(qmd1);
	if (isNaN(qmasf)) {
	    qmasf=0;
	  }
	if (isNaN(qmdsf)) {
		qmdsf=0;
	}
	if (isNaN(qmscsf)) {
		qmscsf=0;
	}	
	qmtsf=qmasf+qmdsf+qmscsf;
	$("#qmtsf").val(qmtsf); 
	
	if($("#qmdsf").val()=="0" & $("#qmscsf").val()=="0"){
		$("#qmaer").val(qmasf);
		$("#qmder").val("");
		$("#qmscer").val("");
		
		$("#qmder").prop('readonly', true);
		$("#qmscer").prop('readonly', true);
		
		
	}else{
		$("#qmaer").val(qmasf);
		$("#qmder").val("");
		$("#qmscer").val("");
		$("#qmter").val(qmasf);
		$("#qmder").prop('readonly', false);
		$("#qmscer").prop('readonly', false);
		
	}
	
	
	
	
}
</script>
<script>
function sumarER(){
	if($("#qmaer").val()=="s" || $("#qmaer").val()=="S"){
		$("#qmaer").val("Sin Información");
	}
	if($("#qmaer").val()=="n" || $("#qmaer").val()=="N"){
		$("#qmaer").val("No Aplica");
	}
	if($("#qmder").val()=="s" || $("#qmder").val()=="S"){
		$("#qmder").val("Sin Información");
	}
	if($("#qmder").val()=="n" || $("#qmder").val()=="N"){
		$("#qmder").val("No Aplica");
	}
	if($("#qmscer").val()=="s" || $("#qmscer").val()=="S"){
		$("#qmscer").val("Sin Información");
	}
	if($("#qmscer").val()=="n" || $("#qmscer").val()=="N"){
		$("#qmscer").val("No Aplica");
	}
	var qmaer=0;
	var qmder=0;
	var qmscer=0;
	var qmter=0;
	qmaer=parseInt($("#qmaer").val());	
	qmder=parseInt($("#qmder").val());
	qmscer=parseInt($("#qmscer").val());
	//alert(qmd1);
	if (isNaN(qmaer)) {
	    qmaer=0;
	  }
	if (isNaN(qmder)) {
		qmder=0;
	}
	if (isNaN(qmscer)) {
		qmscer=0;
	}	
	qmter=qmaer+qmder+qmscer;
	$("#qmter").val(qmter);  
}
</script>

<script>
function cl1tx(){	
	if($("#cl1t").val()=="s" || $("#cl1t").val()=="S"){
		$("#cl1t").val("Sin Información");
	}
	if($("#cl1t").val()=="n" || $("#cl1t").val()=="N"){
		$("#cl1t").val("No Aplica");
	}	 
}
</script>
<script>
function cl2tx(){
	if($("#cl2t").val()=="s" || $("#cl2t").val()=="S"){
		$("#cl2t").val("Sin Información");
	}
	if($("#cl2t").val()=="n" || $("#cl2t").val()=="N"){
		$("#cl2t").val("No Aplica");
	}	 
}
</script>
<script>
function cl3tx(){
	if($("#cl3t").val()=="s" || $("#cl3t").val()=="S"){
		$("#cl3t").val("Sin Información");
	}
	if($("#cl3t").val()=="n" || $("#cl3t").val()=="N"){
		$("#cl3t").val("No Aplica");
	}	 
}
</script>
<script>
function clsfx(){
	if($("#clsf").val()=="s" || $("#clsf").val()=="S"){
		$("#clsf").val("Sin Información");
	}
	if($("#clsf").val()=="n" || $("#clsf").val()=="N"){
		$("#clsf").val("No Aplica");
	}	 
}
</script>
<script>
function clerx(){
	if($("#cler").val()=="s" || $("#cler").val()=="S"){
		$("#cler").val("Sin Información");
	}
	if($("#cler").val()=="n" || $("#cler").val()=="N"){
		$("#cler").val("No Aplica");
	}	 
}
</script>

<script>
function cm1tx(){	
	if($("#cm1t").val()=="s" || $("#cm1t").val()=="S"){
		$("#cm1t").val("Sin Información");
	}
	if($("#cm1t").val()=="n" || $("#cm1t").val()=="N"){
		$("#cm1t").val("No Aplica");
	}	 
}
</script>
<script>
function cm2tx(){
	if($("#cm2t").val()=="s" || $("#cm2t").val()=="S"){
		$("#cm2t").val("Sin Información");
	}
	if($("#cm2t").val()=="n" || $("#cm2t").val()=="N"){
		$("#cm2t").val("No Aplica");
	}	 
}
</script>
<script>
function cm3tx(){
	if($("#cm3t").val()=="s" || $("#cm3t").val()=="S"){
		$("#cm3t").val("Sin Información");
	}
	if($("#cm3t").val()=="n" || $("#cm3t").val()=="N"){
		$("#cm3t").val("No Aplica");
	}	 
}
</script>
<script>
function cmsfx(){
	if($("#cmsf").val()=="s" || $("#cmsf").val()=="S"){
		$("#cmsf").val("Sin Información");
	}
	if($("#cmsf").val()=="n" || $("#cmsf").val()=="N"){
		$("#cmsf").val("No Aplica");
	}	 
}
</script>
<script>
function cmerx(){
	if($("#cmer").val()=="s" || $("#cmer").val()=="S"){
		$("#cmer").val("Sin Información");
	}
	if($("#cmer").val()=="n" || $("#cmer").val()=="N"){
		$("#cmer").val("No Aplica");
	}	 
}
</script>

<script>
function cmp20201tx(){
	if($("#cmp20201t").val()=="s" || $("#cmp20201t").val()=="S"){
		$("#cmp20201t").val("Sin Información");
	}
	if($("#cmp20201t").val()=="n" || $("#cmp20201t").val()=="N"){
		$("#cmp20201t").val("No Aplica");
	}	 
}
</script>

<script>
function cmp20202tx(){
	if($("#cmp20202t").val()=="s" || $("#cmp20202t").val()=="S"){
		$("#cmp20202t").val("Sin Información");
	}
	if($("#cmp20202t").val()=="n" || $("#cmp20202t").val()=="N"){
		$("#cmp20202t").val("No Aplica");
	}	 
}
</script>

<script>
function cmp20203tx(){
	if($("#cmp20203t").val()=="s" || $("#cmp20203t").val()=="S"){
		$("#cmp20203t").val("Sin Información");
	}
	if($("#cmp20203t").val()=="n" || $("#cmp20203t").val()=="N"){
		$("#cmp20203t").val("No Aplica");
	}	 
}
</script>

<script>
function cmp2020sfx(){
	if($("#cmp2020sf").val()=="s" || $("#cmp2020sf").val()=="S"){
		$("#cmp2020sf").val("Sin Información");
	}
	if($("#cmp2020sf").val()=="n" || $("#cmp2020sf").val()=="N"){
		$("#cmp2020sf").val("No Aplica");
	}	 
}
</script>

<script>
function cmp2020erx(){
	if($("#cmp2020er").val()=="s" || $("#cmp2020er").val()=="S"){
		$("#cmp2020er").val("Sin Información");
	}
	if($("#cmp2020er").val()=="n" || $("#cmp2020er").val()=="N"){
		$("#cmp2020er").val("No Aplica");
	}	 
}
</script>




<script>
function aep1x(){	
	if($("#aep1").val()=="1") {$("#aep1").val("1° Sec");}else{
	if($("#aep1").val()=="2") {$("#aep1").val("2° Sec");}else{
	if($("#aep1").val()=="3") {$("#aep1").val("3° Sec");}else{
	if($("#aep1").val()=="4") {$("#aep1").val("4° Sec");}else{
	if($("#aep1").val()=="5") {$("#aep1").val("5° Sec");}else{
	if($("#aep1").val()=="6") {$("#aep1").val("6° Sec");}else{
	if($("#aep1").val()=="7") {$("#aep1").val("7° Técnica");}else{$("#aep1").val("");}}}}}}}
}
</script>
<script>
function jap1x(){	
	if($("#jap1").val()=="a") {$("#jap1").val("Aprobado");}else{
	if($("#jap1").val()=="d") {$("#jap1").val("Desaprobado");}else{
	if($("#jap1").val()=="r") {$("#jap1").val("Recursando");}else{
	if($("#jap1").val()=="p") {$("#jap1").val("No se presentó");}else{
	if($("#jap1").val()=="h") {$("#jap1").val("No hubo mesa de examen");}else{$("#jap1").val("");}}}}}
}
</script>
<script>
function dip1x(){	
	if($("#dip1").val()=="a") {$("#dip1").val("Aprobado");}else{
	if($("#dip1").val()=="d") {$("#dip1").val("Desaprobado");}else{
	if($("#dip1").val()=="r") {$("#dip1").val("Recursando");}else{
	if($("#dip1").val()=="p") {$("#dip1").val("No se presentó");}else{
	if($("#dip1").val()=="h") {$("#dip1").val("No hubo mesa de examen");}else{$("#dip1").val("");}}}}}
}
</script>
<script>
function fmp1x(){	
	if($("#fmp1").val()=="a") {$("#fmp1").val("Aprobado");}else{
	if($("#fmp1").val()=="d") {$("#fmp1").val("Desaprobado");}else{
	if($("#fmp1").val()=="r") {$("#fmp1").val("Recursando");}else{
	if($("#fmp1").val()=="p") {$("#fmp1").val("No se presentó");}else{
	if($("#fmp1").val()=="h") {$("#fmp1").val("No hubo mesa de examen");}else{$("#fmp1").val("");}}}}}
}
</script>
<script>
function map1x(){	
	if($("#map1").val()=="a") {$("#map1").val("Aprobado");}else{
	if($("#map1").val()=="d") {$("#map1").val("Desaprobado");}else{
	if($("#map1").val()=="r") {$("#map1").val("Recursando");}else{
	if($("#map1").val()=="p") {$("#map1").val("No se presentó");}else{
	if($("#map1").val()=="h") {$("#map1").val("No hubo mesa de examen");}else{$("#map1").val("");}}}}}
}
</script>
<script>
function map1x(){	
	if($("#map1").val()=="a") {$("#map1").val("Aprobado");}else{
	if($("#map1").val()=="d") {$("#map1").val("Desaprobado");}else{
	if($("#map1").val()=="r") {$("#map1").val("Recursando");}else{
	if($("#map1").val()=="p") {$("#map1").val("No se presentó");}else{
	if($("#map1").val()=="h") {$("#map1").val("No hubo mesa de examen");}else{$("#map1").val("");}}}}}
}
</script>
<script>
function mmap1x(){	
	if($("#mmap1").val()=="a") {$("#mmap1").val("Abril");}else{
	if($("#mmap1").val()=="m") {$("#mmap1").val("Mayo");}else{
	if($("#mmap1").val()=="j") {$("#mmap1").val("Junio");}else{
	if($("#mmap1").val()=="s") {$("#mmap1").val("Septiembre");}else{
	if($("#mmap1").val()=="o") {$("#mmap1").val("Octubre");}else{
	if($("#mmap1").val()=="n") {$("#mmap1").val("Noviembre");}else{$("#mmap1").val("");}}}}}}
}
</script>

<script>
function aep2x(){	
	if($("#aep2").val()=="1") {$("#aep2").val("1° Sec");}else{
	if($("#aep2").val()=="2") {$("#aep2").val("2° Sec");}else{
	if($("#aep2").val()=="3") {$("#aep2").val("3° Sec");}else{
	if($("#aep2").val()=="4") {$("#aep2").val("4° Sec");}else{
	if($("#aep2").val()=="5") {$("#aep2").val("5° Sec");}else{
	if($("#aep2").val()=="6") {$("#aep2").val("6° Sec");}else{
	if($("#aep2").val()=="7") {$("#aep2").val("7° Técnica");}else{$("#aep2").val("");}}}}}}}
}
</script>
<script>
function jap2x(){	
	if($("#jap2").val()=="a") {$("#jap2").val("Aprobado");}else{
	if($("#jap2").val()=="d") {$("#jap2").val("Desaprobado");}else{
	if($("#jap2").val()=="r") {$("#jap2").val("Recursando");}else{
	if($("#jap2").val()=="p") {$("#jap2").val("No se presentó");}else{
	if($("#jap2").val()=="h") {$("#jap2").val("No hubo mesa de examen");}else{$("#jap2").val("");}}}}}
}
</script>
<script>
function dip2x(){	
	if($("#dip2").val()=="a") {$("#dip2").val("Aprobado");}else{
	if($("#dip2").val()=="d") {$("#dip2").val("Desaprobado");}else{
	if($("#dip2").val()=="r") {$("#dip2").val("Recursando");}else{
	if($("#dip2").val()=="p") {$("#dip2").val("No se presentó");}else{
	if($("#dip2").val()=="h") {$("#dip2").val("No hubo mesa de examen");}else{$("#dip2").val("");}}}}}
}
</script>
<script>
function fmp2x(){	
	if($("#fmp2").val()=="a") {$("#fmp2").val("Aprobado");}else{
	if($("#fmp2").val()=="d") {$("#fmp2").val("Desaprobado");}else{
	if($("#fmp2").val()=="r") {$("#fmp2").val("Recursando");}else{
	if($("#fmp2").val()=="p") {$("#fmp2").val("No se presentó");}else{
	if($("#fmp2").val()=="h") {$("#fmp2").val("No hubo mesa de examen");}else{$("#fmp2").val("");}}}}}
}
</script>
<script>
function map2x(){	
	if($("#map2").val()=="a") {$("#map2").val("Aprobado");}else{
	if($("#map2").val()=="d") {$("#map2").val("Desaprobado");}else{
	if($("#map2").val()=="r") {$("#map2").val("Recursando");}else{
	if($("#map2").val()=="p") {$("#map2").val("No se presentó");}else{
	if($("#map2").val()=="h") {$("#map2").val("No hubo mesa de examen");}else{$("#map2").val("");}}}}}
}
</script>
<script>
function map2x(){	
	if($("#map2").val()=="a") {$("#map2").val("Aprobado");}else{
	if($("#map2").val()=="d") {$("#map2").val("Desaprobado");}else{
	if($("#map2").val()=="r") {$("#map2").val("Recursando");}else{
	if($("#map2").val()=="p") {$("#map2").val("No se presentó");}else{
	if($("#map2").val()=="h") {$("#map2").val("No hubo mesa de examen");}else{$("#map2").val("");}}}}}
}
</script>
<script>
function mmap2x(){	
	if($("#mmap2").val()=="a") {$("#mmap2").val("Abril");}else{
	if($("#mmap2").val()=="m") {$("#mmap2").val("Mayo");}else{
	if($("#mmap2").val()=="j") {$("#mmap2").val("Junio");}else{
	if($("#mmap2").val()=="s") {$("#mmap2").val("Septiembre");}else{
	if($("#mmap2").val()=="o") {$("#mmap2").val("Octubre");}else{
	if($("#mmap2").val()=="n") {$("#mmap2").val("Noviembre");}else{$("#mmap2").val("");}}}}}}
}
</script>

<script>
function aep3x(){	
	if($("#aep3").val()=="1") {$("#aep3").val("1° Sec");}else{
	if($("#aep3").val()=="2") {$("#aep3").val("2° Sec");}else{
	if($("#aep3").val()=="3") {$("#aep3").val("3° Sec");}else{
	if($("#aep3").val()=="4") {$("#aep3").val("4° Sec");}else{
	if($("#aep3").val()=="5") {$("#aep3").val("5° Sec");}else{
	if($("#aep3").val()=="6") {$("#aep3").val("6° Sec");}else{
	if($("#aep3").val()=="7") {$("#aep3").val("7° Técnica");}else{$("#aep3").val("");}}}}}}}
}
</script>
<script>
function jap3x(){	
	if($("#jap3").val()=="a") {$("#jap3").val("Aprobado");}else{
	if($("#jap3").val()=="d") {$("#jap3").val("Desaprobado");}else{
	if($("#jap3").val()=="r") {$("#jap3").val("Recursando");}else{
	if($("#jap3").val()=="p") {$("#jap3").val("No se presentó");}else{
	if($("#jap3").val()=="h") {$("#jap3").val("No hubo mesa de examen");}else{$("#jap3").val("");}}}}}
}
</script>
<script>
function dip3x(){	
	if($("#dip3").val()=="a") {$("#dip3").val("Aprobado");}else{
	if($("#dip3").val()=="d") {$("#dip3").val("Desaprobado");}else{
	if($("#dip3").val()=="r") {$("#dip3").val("Recursando");}else{
	if($("#dip3").val()=="p") {$("#dip3").val("No se presentó");}else{
	if($("#dip3").val()=="h") {$("#dip3").val("No hubo mesa de examen");}else{$("#dip3").val("");}}}}}
}
</script>
<script>
function fmp3x(){	
	if($("#fmp3").val()=="a") {$("#fmp3").val("Aprobado");}else{
	if($("#fmp3").val()=="d") {$("#fmp3").val("Desaprobado");}else{
	if($("#fmp3").val()=="r") {$("#fmp3").val("Recursando");}else{
	if($("#fmp3").val()=="p") {$("#fmp3").val("No se presentó");}else{
	if($("#fmp3").val()=="h") {$("#fmp3").val("No hubo mesa de examen");}else{$("#fmp3").val("");}}}}}
}
</script>
<script>
function map3x(){	
	if($("#map3").val()=="a") {$("#map3").val("Aprobado");}else{
	if($("#map3").val()=="d") {$("#map3").val("Desaprobado");}else{
	if($("#map3").val()=="r") {$("#map3").val("Recursando");}else{
	if($("#map3").val()=="p") {$("#map3").val("No se presentó");}else{
	if($("#map3").val()=="h") {$("#map3").val("No hubo mesa de examen");}else{$("#map3").val("");}}}}}
}
</script>
<script>
function map3x(){	
	if($("#map3").val()=="a") {$("#map3").val("Aprobado");}else{
	if($("#map3").val()=="d") {$("#map3").val("Desaprobado");}else{
	if($("#map3").val()=="r") {$("#map3").val("Recursando");}else{
	if($("#map3").val()=="p") {$("#map3").val("No se presentó");}else{
	if($("#map3").val()=="h") {$("#map3").val("No hubo mesa de examen");}else{$("#map3").val("");}}}}}
}
</script>
<script>
function mmap3x(){	
	if($("#mmap3").val()=="a") {$("#mmap3").val("Abril");}else{
	if($("#mmap3").val()=="m") {$("#mmap3").val("Mayo");}else{
	if($("#mmap3").val()=="j") {$("#mmap3").val("Junio");}else{
	if($("#mmap3").val()=="s") {$("#mmap3").val("Septiembre");}else{
	if($("#mmap3").val()=="o") {$("#mmap3").val("Octubre");}else{
	if($("#mmap3").val()=="n") {$("#mmap3").val("Noviembre");}else{$("#mmap3").val("");}}}}}}
}
</script>

<script>
function aep4x(){	
	if($("#aep4").val()=="1") {$("#aep4").val("1° Sec");}else{
	if($("#aep4").val()=="2") {$("#aep4").val("2° Sec");}else{
	if($("#aep4").val()=="3") {$("#aep4").val("3° Sec");}else{
	if($("#aep4").val()=="4") {$("#aep4").val("4° Sec");}else{
	if($("#aep4").val()=="5") {$("#aep4").val("5° Sec");}else{
	if($("#aep4").val()=="6") {$("#aep4").val("6° Sec");}else{
	if($("#aep4").val()=="7") {$("#aep4").val("7° Técnica");}else{$("#aep4").val("");}}}}}}}
}
</script>
<script>
function jap4x(){	
	if($("#jap4").val()=="a") {$("#jap4").val("Aprobado");}else{
	if($("#jap4").val()=="d") {$("#jap4").val("Desaprobado");}else{
	if($("#jap4").val()=="r") {$("#jap4").val("Recursando");}else{
	if($("#jap4").val()=="p") {$("#jap4").val("No se presentó");}else{
	if($("#jap4").val()=="h") {$("#jap4").val("No hubo mesa de examen");}else{$("#jap4").val("");}}}}}
}
</script>
<script>
function dip4x(){	
	if($("#dip4").val()=="a") {$("#dip4").val("Aprobado");}else{
	if($("#dip4").val()=="d") {$("#dip4").val("Desaprobado");}else{
	if($("#dip4").val()=="r") {$("#dip4").val("Recursando");}else{
	if($("#dip4").val()=="p") {$("#dip4").val("No se presentó");}else{
	if($("#dip4").val()=="h") {$("#dip4").val("No hubo mesa de examen");}else{$("#dip4").val("");}}}}}
}
</script>
<script>
function fmp4x(){	
	if($("#fmp4").val()=="a") {$("#fmp4").val("Aprobado");}else{
	if($("#fmp4").val()=="d") {$("#fmp4").val("Desaprobado");}else{
	if($("#fmp4").val()=="r") {$("#fmp4").val("Recursando");}else{
	if($("#fmp4").val()=="p") {$("#fmp4").val("No se presentó");}else{
	if($("#fmp4").val()=="h") {$("#fmp4").val("No hubo mesa de examen");}else{$("#fmp4").val("");}}}}}
}
</script>
<script>
function map4x(){	
	if($("#map4").val()=="a") {$("#map4").val("Aprobado");}else{
	if($("#map4").val()=="d") {$("#map4").val("Desaprobado");}else{
	if($("#map4").val()=="r") {$("#map4").val("Recursando");}else{
	if($("#map4").val()=="p") {$("#map4").val("No se presentó");}else{
	if($("#map4").val()=="h") {$("#map4").val("No hubo mesa de examen");}else{$("#map4").val("");}}}}}
}
</script>
<script>
function map4x(){	
	if($("#map4").val()=="a") {$("#map4").val("Aprobado");}else{
	if($("#map4").val()=="d") {$("#map4").val("Desaprobado");}else{
	if($("#map4").val()=="r") {$("#map4").val("Recursando");}else{
	if($("#map4").val()=="p") {$("#map4").val("No se presentó");}else{
	if($("#map4").val()=="h") {$("#map4").val("No hubo mesa de examen");}else{$("#map4").val("");}}}}}
}
</script>
<script>
function mmap4x(){	
	if($("#mmap4").val()=="a") {$("#mmap4").val("Abril");}else{
	if($("#mmap4").val()=="m") {$("#mmap4").val("Mayo");}else{
	if($("#mmap4").val()=="j") {$("#mmap4").val("Junio");}else{
	if($("#mmap4").val()=="s") {$("#mmap4").val("Septiembre");}else{
	if($("#mmap4").val()=="o") {$("#mmap4").val("Octubre");}else{
	if($("#mmap4").val()=="n") {$("#mmap4").val("Noviembre");}else{$("#mmap4").val("");}}}}}}
}
</script>

<script>
function aep5x(){	
	if($("#aep5").val()=="1") {$("#aep5").val("1° Sec");}else{
	if($("#aep5").val()=="2") {$("#aep5").val("2° Sec");}else{
	if($("#aep5").val()=="3") {$("#aep5").val("3° Sec");}else{
	if($("#aep5").val()=="4") {$("#aep5").val("4° Sec");}else{
	if($("#aep5").val()=="5") {$("#aep5").val("5° Sec");}else{
	if($("#aep5").val()=="6") {$("#aep5").val("6° Sec");}else{
	if($("#aep5").val()=="7") {$("#aep5").val("7° Técnica");}else{$("#aep5").val("");}}}}}}}
}
</script>
<script>
function jap5x(){	
	if($("#jap5").val()=="a") {$("#jap5").val("Aprobado");}else{
	if($("#jap5").val()=="d") {$("#jap5").val("Desaprobado");}else{
	if($("#jap5").val()=="r") {$("#jap5").val("Recursando");}else{
	if($("#jap5").val()=="p") {$("#jap5").val("No se presentó");}else{
	if($("#jap5").val()=="h") {$("#jap5").val("No hubo mesa de examen");}else{$("#jap5").val("");}}}}}
}
</script>
<script>
function dip5x(){	
	if($("#dip5").val()=="a") {$("#dip5").val("Aprobado");}else{
	if($("#dip5").val()=="d") {$("#dip5").val("Desaprobado");}else{
	if($("#dip5").val()=="r") {$("#dip5").val("Recursando");}else{
	if($("#dip5").val()=="p") {$("#dip5").val("No se presentó");}else{
	if($("#dip5").val()=="h") {$("#dip5").val("No hubo mesa de examen");}else{$("#dip5").val("");}}}}}
}
</script>
<script>
function fmp5x(){	
	if($("#fmp5").val()=="a") {$("#fmp5").val("Aprobado");}else{
	if($("#fmp5").val()=="d") {$("#fmp5").val("Desaprobado");}else{
	if($("#fmp5").val()=="r") {$("#fmp5").val("Recursando");}else{
	if($("#fmp5").val()=="p") {$("#fmp5").val("No se presentó");}else{
	if($("#fmp5").val()=="h") {$("#fmp5").val("No hubo mesa de examen");}else{$("#fmp5").val("");}}}}}
}
</script>
<script>
function map5x(){	
	if($("#map5").val()=="a") {$("#map5").val("Aprobado");}else{
	if($("#map5").val()=="d") {$("#map5").val("Desaprobado");}else{
	if($("#map5").val()=="r") {$("#map5").val("Recursando");}else{
	if($("#map5").val()=="p") {$("#map5").val("No se presentó");}else{
	if($("#map5").val()=="h") {$("#map5").val("No hubo mesa de examen");}else{$("#map5").val("");}}}}}
}
</script>
<script>
function map5x(){	
	if($("#map5").val()=="a") {$("#map5").val("Aprobado");}else{
	if($("#map5").val()=="d") {$("#map5").val("Desaprobado");}else{
	if($("#map5").val()=="r") {$("#map5").val("Recursando");}else{
	if($("#map5").val()=="p") {$("#map5").val("No se presentó");}else{
	if($("#map5").val()=="h") {$("#map5").val("No hubo mesa de examen");}else{$("#map5").val("");}}}}}
}
</script>
<script>
function mmap5x(){	
	if($("#mmap5").val()=="a") {$("#mmap5").val("Abril");}else{
	if($("#mmap5").val()=="m") {$("#mmap5").val("Mayo");}else{
	if($("#mmap5").val()=="j") {$("#mmap5").val("Junio");}else{
	if($("#mmap5").val()=="s") {$("#mmap5").val("Septiembre");}else{
	if($("#mmap5").val()=="o") {$("#mmap5").val("Octubre");}else{
	if($("#mmap5").val()=="n") {$("#mmap5").val("Noviembre");}else{$("#mmap5").val("");}}}}}}
}
</script>

<script>
function aep6x(){	
	if($("#aep6").val()=="1") {$("#aep6").val("1° Sec");}else{
	if($("#aep6").val()=="2") {$("#aep6").val("2° Sec");}else{
	if($("#aep6").val()=="3") {$("#aep6").val("3° Sec");}else{
	if($("#aep6").val()=="4") {$("#aep6").val("4° Sec");}else{
	if($("#aep6").val()=="5") {$("#aep6").val("5° Sec");}else{
	if($("#aep6").val()=="6") {$("#aep6").val("6° Sec");}else{
	if($("#aep6").val()=="7") {$("#aep6").val("7° Técnica");}else{$("#aep6").val("");}}}}}}}
}
</script>
<script>
function jap6x(){	
	if($("#jap6").val()=="a") {$("#jap6").val("Aprobado");}else{
	if($("#jap6").val()=="d") {$("#jap6").val("Desaprobado");}else{
	if($("#jap6").val()=="r") {$("#jap6").val("Recursando");}else{
	if($("#jap6").val()=="p") {$("#jap6").val("No se presentó");}else{
	if($("#jap6").val()=="h") {$("#jap6").val("No hubo mesa de examen");}else{$("#jap6").val("");}}}}}
}
</script>
<script>
function dip6x(){	
	if($("#dip6").val()=="a") {$("#dip6").val("Aprobado");}else{
	if($("#dip6").val()=="d") {$("#dip6").val("Desaprobado");}else{
	if($("#dip6").val()=="r") {$("#dip6").val("Recursando");}else{
	if($("#dip6").val()=="p") {$("#dip6").val("No se presentó");}else{
	if($("#dip6").val()=="h") {$("#dip6").val("No hubo mesa de examen");}else{$("#dip6").val("");}}}}}
}
</script>
<script>
function fmp6x(){	
	if($("#fmp6").val()=="a") {$("#fmp6").val("Aprobado");}else{
	if($("#fmp6").val()=="d") {$("#fmp6").val("Desaprobado");}else{
	if($("#fmp6").val()=="r") {$("#fmp6").val("Recursando");}else{
	if($("#fmp6").val()=="p") {$("#fmp6").val("No se presentó");}else{
	if($("#fmp6").val()=="h") {$("#fmp6").val("No hubo mesa de examen");}else{$("#fmp6").val("");}}}}}
}
</script>
<script>
function map6x(){	
	if($("#map6").val()=="a") {$("#map6").val("Aprobado");}else{
	if($("#map6").val()=="d") {$("#map6").val("Desaprobado");}else{
	if($("#map6").val()=="r") {$("#map6").val("Recursando");}else{
	if($("#map6").val()=="p") {$("#map6").val("No se presentó");}else{
	if($("#map6").val()=="h") {$("#map6").val("No hubo mesa de examen");}else{$("#map6").val("");}}}}}
}
</script>
<script>
function map6x(){	
	if($("#map6").val()=="a") {$("#map6").val("Aprobado");}else{
	if($("#map6").val()=="d") {$("#map6").val("Desaprobado");}else{
	if($("#map6").val()=="r") {$("#map6").val("Recursando");}else{
	if($("#map6").val()=="p") {$("#map6").val("No se presentó");}else{
	if($("#map6").val()=="h") {$("#map6").val("No hubo mesa de examen");}else{$("#map6").val("");}}}}}
}
</script>
<script>
function mmap6x(){	
	if($("#mmap6").val()=="a") {$("#mmap6").val("Abril");}else{
	if($("#mmap6").val()=="m") {$("#mmap6").val("Mayo");}else{
	if($("#mmap6").val()=="j") {$("#mmap6").val("Junio");}else{
	if($("#mmap6").val()=="s") {$("#mmap6").val("Septiembre");}else{
	if($("#mmap6").val()=="o") {$("#mmap6").val("Octubre");}else{
	if($("#mmap6").val()=="n") {$("#mmap6").val("Noviembre");}else{$("#mmap6").val("");}}}}}}
}
</script>

<script>
$(function(){	
	var availableTags= new Array();
	$("#mp1").bind("keydown",function(event){
		
		var data ={nombre:$("#mp1").val()};		
		$.getJSON("buscar",data,function(res,est,jqXHR){
		
			availableTags.length=0;
			$.each(res,function(i,item){
				availableTags[i]=item;
				
			});
		});
		});
	$("#mp1").autocomplete({
		source:availableTags,
		minLength:1
	});
});
</script>


</head>
<body>

<% 	
	String id="";	
	String ciclo="2023";
	id=request.getParameter("idAlumno");
	String foto="";
	String becado="";
	String anioEscolar="";
	Long anioAdicional=0L;
	Connection cn = null;
    CallableStatement cl = null;
    ResultSet rs = null;
    String call = "{CALL SP_BuscarAlumno(?)}";
	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    cl.setString(1, id);    
    rs = cl.executeQuery();
    while (rs.next()) {
    	becado=rs.getString("apellido") +", "+ rs.getString("nombre");
    	anioEscolar=rs.getString("anio_escolar.anio_escolar");
    	anioAdicional=rs.getLong("anio_adicional");
	//System.out.println(rs.getString("apellido"));
    	//System.out.println(rs.getString("anio_adicional"));    	
    }
    Conexion.cerrarCall(cl);
    Conexion.cerrarConexion(cn);
	
    String inas1="";
    String inas2="";
    String inas3="";
    
	String qma1="";    
	String qma2="";
	String qma3="";
	String qmasf="";
	String qmaer="";
	
	String qmd1="";    
	String qmd2="";
	String qmd3="";
	String qmdsf="";
	String qmder="";
	
	String qmsc1="";    
	String qmsc2="";
	String qmsc3="";
	String qmscsf="";
	String qmscer="";
	
	String qmt1="";    
	String qmt2="";
	String qmt3="";
	String qmtsf="";
	String qmter="";
	
	String cl1t="";    
	String cl2t="";
	String cl3t="";
	String clsf="";
	String cler="";
	
	String cm1t="";    
	String cm2t="";
	String cm3t="";
	String cmsf="";
	String cmer="";
	
	String cmp20201t="";    
	String cmp20202t="";
	String cmp20203t="";
	String cmp2020sf="";
	String cmp2020er="";
	
	
	
	String idBoletin="";
	
	cn = null;
    cl = null;
    rs = null;
    call = "{CALL SP_BuscarBoletinAlumno(?,?)}";
	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    cl.setString(1, id);
    cl.setString(2, ciclo);
    rs = cl.executeQuery();
    while (rs.next()) {
    	idBoletin=rs.getString("id");    	
		id=rs.getString("idBecado");
		foto=id+"-"+idBoletin;
		becado=rs.getString("becado");
		ciclo=rs.getString("ciclo");
		anioEscolar=rs.getString("anioEscolar");
		anioAdicional=rs.getLong("anioAdicional");
		inas1=rs.getString("inas1");
		inas2=rs.getString("inas2");
		inas3=rs.getString("inas3");
		qma1=rs.getString("qma1");
		qma2=rs.getString("qma2");
		qma3=rs.getString("qma3");
		qmasf=rs.getString("qmasf");
		qmaer=rs.getString("qmaer");
		qmd1=rs.getString("qmd1");
		qmd2=rs.getString("qmd2");
		qmd3=rs.getString("qmd3");
		qmdsf=rs.getString("qmdsf");
		qmder=rs.getString("qmder");
		qmsc1=rs.getString("qmsc1");
		qmsc2=rs.getString("qmsc2");
		qmsc3=rs.getString("qmsc3");
		qmscsf=rs.getString("qmscsf");
		qmscer=rs.getString("qmscer");
		qmt1=rs.getString("qmt1");
		qmt2=rs.getString("qmt2");
		qmt3=rs.getString("qmt3");
		qmtsf=rs.getString("qmtsf");
		qmter=rs.getString("qmter");
		cl1t=rs.getString("cl1t");
		cl2t=rs.getString("cl2t");
		cl3t=rs.getString("cl3t");
		clsf=rs.getString("clsf");
		cler=rs.getString("cler");
		cm1t=rs.getString("cm1t");
		cm2t=rs.getString("cm2t");
		cm3t=rs.getString("cm3t");
		cmsf=rs.getString("cmsf");
		cmer=rs.getString("cmer");
		cmp20201t=rs.getString("cmp20201t");
		cmp20202t=rs.getString("cmp20202t");
		cmp20203t=rs.getString("cmp20203t");
		cmp2020sf=rs.getString("cmp2020sf");
		cmp2020er=rs.getString("cmp2020er");
		
    }
    Conexion.cerrarCall(cl);
    Conexion.cerrarConexion(cn);
    
    //PREVIAS
    String idPrevia1="";
    String idPrevia2="";
    String idPrevia3="";
    String idPrevia4="";
    String idPrevia5="";
    String idPrevia6="";
    String mp1="";
    String mp2="";
    String mp3="";
    String mp4="";
    String mp5="";
    String mp6="";
    String aep1="";
    String aep2="";
    String aep3="";
    String aep4="";
    String aep5="";
    String aep6="";
    String jap1="";
    String jap2="";
    String jap3="";
    String jap4="";
    String jap5="";
    String jap6="";
    String dip1="";
    String dip2="";
    String dip3="";
    String dip4="";
    String dip5="";
    String dip6="";
    String fbp1="";
    String fbp2="";
    String fbp3="";
    String fbp4="";
    String fbp5="";
    String fbp6="";
    String map1="";
    String map2="";
    String map3="";
    String map4="";
    String map5="";
    String map6="";
    String mmap1="";
    String mmap2="";
    String mmap3="";
    String mmap4="";
    String mmap5="";
    String mmap6="";
    String previas="";
    Long cantidadPrevias=0L;
    Long i=0L;
    cn = null;
    cl = null;
    rs = null;
    call = "{CALL SP_TraerMateriaPrevia(?)}";
	cn = Conexion.getConexion();
    cl = cn.prepareCall(call); 
    cl.setString(1, id);
    rs = cl.executeQuery();
    while (rs.next()) {
    	previas="SI";
    	i++;
    	cantidadPrevias++;
    	if (i==1){
    		idPrevia1=rs.getString("id");
    		mp1=rs.getString("materia");
    		aep1=rs.getString("anio_escolar");
    		jap1=rs.getString("ja");
    		dip1=rs.getString("di");
    		fbp1=rs.getString("fb");
    		map1=rs.getString("ma");
    		mmap1=rs.getString("mam");
    	}
		if (i==2){
			idPrevia2=rs.getString("id");
    		mp2=rs.getString("materia");
    		aep2=rs.getString("anio_escolar");
    		jap2=rs.getString("ja");
    		dip2=rs.getString("di");
    		fbp2=rs.getString("fb");
    		map2=rs.getString("ma");
    		mmap2=rs.getString("mam");
    	}
		if (i==3){
			idPrevia3=rs.getString("id");
    		mp3=rs.getString("materia");
    		aep3=rs.getString("anio_escolar");
    		jap3=rs.getString("ja");
    		dip3=rs.getString("di");
    		fbp3=rs.getString("fb");
    		map3=rs.getString("ma");
    		mmap3=rs.getString("mam");
    	}    	
		if (i==4){
			idPrevia4=rs.getString("id");
    		mp4=rs.getString("materia");
    		aep4=rs.getString("anio_escolar");
    		jap4=rs.getString("ja");
    		dip4=rs.getString("di");
    		fbp4=rs.getString("fb");
    		map4=rs.getString("ma");
    		mmap4=rs.getString("mam");
    	}   
		if (i==5){
			idPrevia5=rs.getString("id");
    		mp5=rs.getString("materia");
    		aep5=rs.getString("anio_escolar");
    		jap5=rs.getString("ja");
    		dip5=rs.getString("di");
    		fbp5=rs.getString("fb");
    		map5=rs.getString("ma");
    		mmap5=rs.getString("mam");
    	}   
		if (i==6){
			idPrevia6=rs.getString("id");
    		mp6=rs.getString("materia");
    		aep6=rs.getString("anio_escolar");
    		jap6=rs.getString("ja");
    		dip6=rs.getString("di");
    		fbp6=rs.getString("fb");
    		map6=rs.getString("ma");
    		mmap6=rs.getString("mam");
    	}   
    }
    Conexion.cerrarCall(cl);
    Conexion.cerrarConexion(cn);
    
%>	

<div class="container-fluid">
  <h2>Boletín de <%=becado %> - Ciclo Lectivo <%=ciclo %></h2>
  <form action="altaBoletinNuevo.do" method="post" enctype='multipart/form-data'>
    <input type="hidden" id="idBecado" name="idBecado" value="<%=id%>">
    <input type="hidden" id="becado" name="becado" value="<%=becado%>">
    <input type="hidden" id="ciclo" name="ciclo" value="<%=2023%>">
    <input type="hidden" id="anioEscolar" name="anioEscolar" value="<%=anioEscolar%>">
    <input type="hidden" id="anioAdicional" name="anioAdicional" value="<%=anioAdicional%>">
    <input type="hidden" id="idBoletin" name="idBoletin" value="<%=idBoletin%>">
    <input type="hidden" id="previas" name="previas" value="<%=previas%>">
    <input type="hidden" id="cantidadPrevias" name="cantidadPrevias" value="<%=cantidadPrevias%>">
    <input type="hidden" id="idPrevia1" name="idPrevia1" value="<%=idPrevia1%>">    
    <input type="hidden" id="idPrevia2" name="idPrevia2" value="<%=idPrevia2%>">
    <input type="hidden" id="idPrevia3" name="idPrevia3" value="<%=idPrevia3%>">
    <input type="hidden" id="idPrevia4" name="idPrevia4" value="<%=idPrevia4%>">
    <input type="hidden" id="idPrevia5" name="idPrevia5" value="<%=idPrevia5%>">
    <input type="hidden" id="idPrevia6" name="idPrevia6" value="<%=idPrevia6%>">
    
    <div class="form-group">
      <label for="pwd">Año Escolar: <%=anioEscolar %> </label>      
      <%if(anioAdicional==1){%>
    	  <label for="pwd"> (Tiene año adicional)</label>
      <% 
       }%>
    </div>
    <div class="form-group">
	    <div class="card">
			<div class="card-body d-flex justify-content-between align-items-center inasistencias text-white">
				<h3>INASISTENCIAS</h3>
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Ayuda</button>
			</div>
		</div>
  		<br>
	    <div class="row">		    		    
	    	<div class="col-4">
	    		1° Trimestre / Cuatrimestre:<input type="text" class="form-control" id="inas1" name="inas1" style="max-width: 100px;" oninput="inasistencia1()" value="<%=inas1%>">
	  		</div>
	  		<div class="col-4">
	    		2° Trimestre / Cuatrimestre:<input type="text" class="form-control" id="inas2" name="inas2" style="max-width: 100px;" oninput="inasistencia2()" value="<%=inas2%>">
			</div>
			<div class="col-4">		  
	  			3° Trimestre:<input type="text" class="form-control" id="inas3" name="inas3" style="max-width: 100px;" oninput="inasistencia3()" value="<%=inas3%>">
    		</div>		    
	    </div>
	    <br>
	    
	    <div class="card">
			<div class="card-body d-flex justify-content-between align-items-center materias text-white">
				<h3>MATERIAS</h3>
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Ayuda</button>
			</div>
		</div>
  		<br>
	    <div class="row">
		    <div class="col text-dark celda">Información</div>
		    <div class="col text-dark celda">1° Trim/Cuatrim</div>
		    <div class="col text-dark celda">2° Trim/Cuatrim</div>
		    <div class="col text-dark celda">3° Trimestre</div>
		    <div class="col text-dark celda">Situación Final (Entrevista diciembre)</div>
		    <div class="col text-dark celda">Situación Entrevista Renovación</div>
  		</div>
  		<div class="row">
		    <div class="col text-dark celda">Cantidad materias aprobadas</div>
		    <div class="col celda"><input type="text" class="form-control" id="qma1" name="qma1"  oninput="sumar1T()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=qma1%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qma2" name="qma2"  oninput="sumar2T()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=qma2%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qma3" name="qma3"  oninput="sumar3T()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=qma3%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmasf" name="qmasf" oninput="sumarSF()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=qmasf%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmaer" name="qmaer" oninput="sumarER()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=qmaer%>"></div>
  		</div>
  		<div class="row">
		    <div class="col text-dark celda">Cantidad materias desaprobadas</div>
		    <div class="col celda"><input type="text" class="form-control" id="qmd1" name="qmd1" oninput="sumar1T()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=qmd1%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmd2" name="qmd2"  oninput="sumar2T()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=qmd2%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmd3"  name="qmd3" oninput="sumar3T()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=qmd3%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmdsf"  name="qmdsf" oninput="sumarSF()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=qmdsf%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmder"  name="qmder" oninput="sumarER()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=qmder%>"></div>
  		</div>
  		<div class="row">
		    <div class="col text-dark celda">Cantidad materias sin calificar / sin información</div>
		    <div class="col celda"><input type="text" class="form-control" id="qmsc1" name="qmsc1" oninput="sumar1T()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=qmsc1%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmsc2" name="qmsc2" oninput="sumar2T()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=qmsc2%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmsc3" name="qmsc3" oninput="sumar3T()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=qmsc3%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmscsf" name="qmscsf" oninput="sumarSF()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=qmscsf%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmscer" name="qmscer" oninput="sumarER()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=qmscer%>"></div>
  		</div>
  		<div class="row">
		    <div class="col text-dark celda">Cantidad total materias en boletín</div>
		    <div class="col celda"><input type="text" class="form-control" id="qmt1" name="qmt1" readonly value="<%=qmt1%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmt2" name="qmt2" readonly value="<%=qmt2%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmt3" name="qmt3" readonly value="<%=qmt3%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmtsf" name="qmtsf" readonly value="<%=qmtsf%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="qmter" name="qmter" readonly value="<%=qmter%>"></div>
  		</div>
  		<div class="row">
		    <div class="col text-dark celda">Calificación Lengua /Literatura</div>
		    <div class="col celda"><input type="text" class="form-control" id="cl1t" name="cl1t" oninput="cl1tx()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=cl1t%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="cl2t" name="cl2t" oninput="cl2tx()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=cl2t%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="cl3t" name="cl3t" oninput="cl3tx()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=cl3t%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="clsf" name="clsf" oninput="clsfx()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=clsf%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="cler" name="cler" oninput="clerx()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=cler%>"></div>
  		</div>
  		<div class="row">
		    <div class="col text-dark celda">Calificación Matemática</div>
		    <div class="col celda"><input type="text" class="form-control" id="cm1t" name="cm1t" oninput="cm1tx()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=cm1t%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="cm2t" name="cm2t" oninput="cm2tx()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=cm2t%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="cm3t" name="cm3t" oninput="cm3tx()"onclick="seleccionarTexto(this)" maxlength="2" title="solo números o S N" value="<%=cm3t%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="cmsf" name="cmsf" oninput="cmsfx()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=cmsf%>"></div>
		    <div class="col celda"><input type="text" class="form-control" id="cmer" name="cmer" oninput="cmerx()" onclick="seleccionarTexto(this)"maxlength="2" title="solo números o S N" value="<%=cmer%>"></div>
  		</div>
  		<br>
  		<!--  div class="row">
		    <div class="col  celda" style="color:red;">Cantidad de materias en proceso ciclo 2020</div>
		    <div class="col celda"><input type="text" class="form-control" id="cmp20201t" name="cmp20201t" oninput="cmp20201tx()" maxlength="2" title="solo números o S N" value="<%=cmp20201t%>"></div>		    
			<div class="col celda"><input type="text" class="form-control" id="cmp20202t" name="cmp20202t" oninput="cmp20202tx()" maxlength="2" title="solo números o S N" value="<%=cmp20202t%>"></div>
			<div class="col celda"><input type="text" class="form-control" id="cmp20203t" name="cmp20203t" oninput="cmp20203tx()" maxlength="2" title="solo números o S N" value="<%=cmp20203t%>"></div>
			<div class="col celda"><input type="text" class="form-control" id="cmp2020sf" name="cmp2020sf" oninput="cmp2020sfx()" maxlength="2" title="solo números o S N" value="<%=cmp2020sf%>"></div>
			<div class="col celda"><input type="text" class="form-control" id="cmp2020er" name="cmp2020er" oninput="cmp2020erx()" maxlength="2" title="solo números o S N" value="<%=cmp2020er%>"></div>
		</div-->
		
		    <div class="col celda"><input type="hidden" class="form-control" id="cmp20201t" name="cmp20201t" oninput="cmp20201tx()" maxlength="2" title="solo números o S N" value="<%=cmp20201t%>"></div>		    
			<div class="col celda"><input type="hidden" class="form-control" id="cmp20202t" name="cmp20202t" oninput="cmp20202tx()" maxlength="2" title="solo números o S N" value="<%=cmp20202t%>"></div>
			<div class="col celda"><input type="hidden" class="form-control" id="cmp20203t" name="cmp20203t" oninput="cmp20203tx()" maxlength="2" title="solo números o S N" value="<%=cmp20203t%>"></div>
			<div class="col celda"><input type="hidden" class="form-control" id="cmp2020sf" name="cmp2020sf" oninput="cmp2020sfx()" maxlength="2" title="solo números o S N" value="<%=cmp2020sf%>"></div>
			<div class="col celda"><input type="hidden" class="form-control" id="cmp2020er" name="cmp2020er" oninput="cmp2020erx()" maxlength="2" title="solo números o S N" value="<%=cmp2020er%>"></div>
		
		
  		<br>
  		<div class="card">
			<div class="card-body d-flex justify-content-between align-items-center previas text-white">								
				<h3>MATERIAS PENDIENTES</h3>
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Ayuda</button>
			</div>
		</div>
		
		<br>
		
		
		
		
		
		<div class="row">
		    <div class="col-3 text-dark celda"><b>Materia</b></div>
		    <div class="col-1 text-dark celda"><b>Año Escolar</b></div>
		    <div class="col-2 text-dark celda"><b>Jul/Ago</b></div>
		    <div class="col-2 text-dark celda"><b>Diciembre</b></div>
		    <div class="col-2 text-dark celda"><b>Feb/Mzo</b></div>
		    <div class="col-2 text-dark celda"><b>Mesa Adic</b><br><b> Mes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Resultado</b></div>		    
  		</div>
  		<br>
  		
		<div class="row">		    		    
		    <div class="col-3">
		    	<select  class="form-control fuente" id="mp1" name="mp1">				   	
				   	<% 
				   	cn = null;
			        cl = null;
			        rs = null;
		            call = "{CALL SP_TraerMaterias()}";
		            cn = Conexion.getConexion();
		            cl = cn.prepareCall(call);
		            //La sentencia lo almacenamos en un resulset
		            rs = cl.executeQuery();
		            //Consultamos si hay datos para recorrerlo
		            //e insertarlo en nuestro array
		            while (rs.next()) {	                
		                if(rs.getString("nombre").equals(mp1)){
		                %>		                
		                <option value="<%=rs.getString("nombre")%>" selected="selected"><%=rs.getString("nombre") %></option>
		                <%}else{%>
		            		<option value="<%=rs.getString("nombre")%>"> <%=rs.getString("nombre") %></option>		             
		            <% }}
		            if(mp1==""){%><option value="Seleccioná" selected="selected">Seleccioná</option>		            	
		            <%}%>		            
		            Conexion.cerrarCall(cl);
		          	Conexion.cerrarConexion(cn);%>	       				   									   				   
				</select>
			</div>       
		    <div class="col-1">    
			    <input type="text" class="form-control fuente" id="aep1" name="aep1" oninput="aep1x()" value="<%=aep1 %>">
			  </div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="jap1" name="jap1" oninput="jap1x()" value="<%=jap1 %>">
			</div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="dip1" name="dip1"  oninput="dip1x()" value="<%=dip1 %>">
			</div>
		     <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="fmp1" name="fmp1"  oninput="fmp1x()" value="<%=fbp1 %>">
			</div>
		    <div class="col-2 input-group">
		    	<input type="text" class="form-control fuente" id="mmap1" name="mmap1" oninput="mmap1x()" value="<%=mmap1 %>">
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<input type="text" class="form-control fuente" id="map1" name="map1"  oninput="map1x()"  value="<%=map1 %>">
				
				
			</div>
  		</div>
  		<br>
  		<div class="row">		    		    
		    <div class="col-3">
		    	<select  class="form-control fuente" id="mp2" name="mp2">				   	
				   	<%
				   	cn = null;
			        cl = null;
			        rs = null;
		            call = "{CALL SP_TraerMaterias()}";
		            cn = Conexion.getConexion();
		            cl = cn.prepareCall(call);
		            //La sentencia lo almacenamos en un resulset
		            rs = cl.executeQuery();
		            //Consultamos si hay datos para recorrerlo
		            //e insertarlo en nuestro array
		            while (rs.next()) {	                
		                if(rs.getString("nombre").equals(mp2)){
		                %>		                
		                <option value="<%=rs.getString("nombre")%>" selected="selected"><%=rs.getString("nombre") %></option>
		                <%}else{%>
		            		<option value="<%=rs.getString("nombre")%>"> <%=rs.getString("nombre") %></option>		             
		            <% }}
		            if(mp2==""){%><option value="Seleccioná" selected="selected">Seleccioná</option>		            	
		            <%}%>		            
		            Conexion.cerrarCall(cl);
		          	Conexion.cerrarConexion(cn);%>	       				   									   				   
				</select>
			</div>   
		    <div class="col-1">    
			    <input type="text" class="form-control fuente" id="aep2" name="aep2" oninput="aep2x()"  value="<%=aep2 %>">
			  </div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="jap2" name="jap2" oninput="jap2x()"  value="<%=jap2 %>">
			</div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="dip2" name="dip2"  oninput="dip2x()" value="<%=dip2 %>">
			</div>
		     <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="fmp2" name="fmp2"  oninput="fmp2x()" value="<%=fbp2 %>">
			</div>
		    <div class="col-2 input-group">
		    	<input type="text" class="form-control fuente" id="mmap2" name="mmap2" oninput="mmap2x()" value="<%=mmap2 %>">
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<input type="text" class="form-control fuente" id="map2" name="map2"  oninput="map2x()"  value="<%=map2 %>">
				
				
			</div>
  		</div>
  		<br>
  		<div class="row">		    		    
		    <div class="col-3">
		    	<select  class="form-control fuente" id="mp3" name="mp3">				   	
				   	<%
				   	cn = null;
			        cl = null;
			        rs = null;
		            call = "{CALL SP_TraerMaterias()}";
		            cn = Conexion.getConexion();
		            cl = cn.prepareCall(call);
		            //La sentencia lo almacenamos en un resulset
		            rs = cl.executeQuery();
		            //Consultamos si hay datos para recorrerlo
		            //e insertarlo en nuestro array
		            while (rs.next()) {	                
		                if(rs.getString("nombre").equals(mp3)){
		                %>		                
		                <option value="<%=rs.getString("nombre")%>" selected="selected"><%=rs.getString("nombre") %></option>
		                <%}else{%>
		            		<option value="<%=rs.getString("nombre")%>"> <%=rs.getString("nombre") %></option>		             
		            <% }}
		            if(mp3==""){%><option value="Seleccioná" selected="selected">Seleccioná</option>		            	
		            <%}%>		            
		            Conexion.cerrarCall(cl);
		          	Conexion.cerrarConexion(cn);%>	       				   									   				   
				</select>
			</div>   
		    <div class="col-1">    
			    <input type="text" class="form-control fuente" id="aep3" name="aep3" oninput="aep3x()"  value="<%=aep3 %>">
			  </div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="jap3" name="jap3" oninput="jap3x()"  value="<%=jap3 %>">
			</div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="dip3" name="dip3"  oninput="dip3x()"  value="<%=dip3 %>">
			</div>
		     <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="fmp3" name="fmp3"  oninput="fmp3x()" value="<%=fbp3 %>">
			</div>
		    <div class="col-2 input-group">
		    	<input type="text" class="form-control fuente" id="mmap3" name="mmap3" oninput="mmap3x()" value="<%=mmap3 %>">
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<input type="text" class="form-control fuente" id="map3" name="map3"  oninput="map3x()"  value="<%=map3 %>">
				
				
			</div>
  		</div>
  		<br>
  		<div class="row">		    		    
		    <div class="col-3">
		    	<select  class="form-control fuente" id="mp4" name="mp4">				   	
				   	<%
				   	cn = null;
			        cl = null;
			        rs = null;
		            call = "{CALL SP_TraerMaterias()}";
		            cn = Conexion.getConexion();
		            cl = cn.prepareCall(call);
		            //La sentencia lo almacenamos en un resulset
		            rs = cl.executeQuery();
		            //Consultamos si hay datos para recorrerlo
		            //e insertarlo en nuestro array
		            while (rs.next()) {	                
		                if(rs.getString("nombre").equals(mp4)){
		                %>		                
		                <option value="<%=rs.getString("nombre")%>" selected="selected"><%=rs.getString("nombre") %></option>
		                <%}else{%>
		            		<option value="<%=rs.getString("nombre")%>"> <%=rs.getString("nombre") %></option>		             
		            <% }}
		            if(mp4==""){%><option value="Seleccioná" selected="selected">Seleccioná</option>		            	
		            <%}%>		            
		            Conexion.cerrarCall(cl);
		          	Conexion.cerrarConexion(cn);%>	       				   									   				   
				</select>
			</div>   
		    <div class="col-1">    
			    <input type="text" class="form-control fuente" id="aep4" name="aep4" oninput="aep4x()"  value="<%=aep4 %>">
			  </div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="jap4" name="jap4" oninput="jap4x()"  value="<%=jap4 %>">
			</div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="dip4" name="dip4"  oninput="dip4x()"  value="<%=dip4 %>">
			</div>
		     <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="fmp4" name="fmp4"  oninput="fmp4x()" value="<%=fbp4 %>">
			</div>
		    <div class="col-2 input-group">
		    	<input type="text" class="form-control fuente" id="mmap4" name="mmap4" oninput="mmap4x()" value="<%=mmap4 %>">
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<input type="text" class="form-control fuente" id="map4" name="map4"  oninput="map4x()"  value="<%=map4 %>">
				
				
			</div>
  		</div>
  		<br>
  		<div class="row">		    		    
		    <div class="col-3">
		    	<select  class="form-control fuente" id="mp5" name="mp5">				   	
				   	<%
				   	cn = null;
			        cl = null;
			        rs = null;
		            call = "{CALL SP_TraerMaterias()}";
		            cn = Conexion.getConexion();
		            cl = cn.prepareCall(call);
		            //La sentencia lo almacenamos en un resulset
		            rs = cl.executeQuery();
		            //Consultamos si hay datos para recorrerlo
		            //e insertarlo en nuestro array
		            while (rs.next()) {	                
		                if(rs.getString("nombre").equals(mp5)){
		                %>		                
		                <option value="<%=rs.getString("nombre")%>" selected="selected"><%=rs.getString("nombre") %></option>
		                <%}else{%>
		            		<option value="<%=rs.getString("nombre")%>"> <%=rs.getString("nombre") %></option>		             
		            <% }}
		            if(mp5==""){%><option value="Seleccioná" selected="selected">Seleccioná</option>		            	
		            <%}%>		            
		            Conexion.cerrarCall(cl);
		          	Conexion.cerrarConexion(cn);%>	       				   									   				   
				</select>
			</div>   
		    <div class="col-1">    
			    <input type="text" class="form-control fuente" id="aep5" name="aep5" oninput="aep5x()"  value="<%=aep5 %>">
			  </div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="jap5" name="jap5" oninput="jap5x()"  value="<%=jap5 %>">
			</div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="dip5" name="dip5"  oninput="dip5x()"  value="<%=dip5 %>">
			</div>
		     <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="fmp5" name="fmp5"  oninput="fmp5x()" value="<%=fbp5 %>">
			</div>
		    <div class="col-2 input-group">
		    	<input type="text" class="form-control fuente" id="mmap5" name="mmap5" oninput="mmap5x()" value="<%=mmap5 %>">
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<input type="text" class="form-control fuente" id="map5" name="map5"  oninput="map5x()"  value="<%=map5 %>">
				
				
			</div>
  		</div>
  		<br>
  		<div class="row">		    		    
		   <div class="col-3">
		    	<select  class="form-control fuente" id="mp6" name="mp6">				   	
				   	<%
				   	cn = null;
			        cl = null;
			        rs = null;
		            call = "{CALL SP_TraerMaterias()}";
		            cn = Conexion.getConexion();
		            cl = cn.prepareCall(call);
		            //La sentencia lo almacenamos en un resulset
		            rs = cl.executeQuery();
		            //Consultamos si hay datos para recorrerlo
		            //e insertarlo en nuestro array
		            while (rs.next()) {	                
		                if(rs.getString("nombre").equals(mp6)){
		                %>		                
		                <option value="<%=rs.getString("nombre")%>" selected="selected"><%=rs.getString("nombre") %></option>
		                <%}else{%>
		            		<option value="<%=rs.getString("nombre")%>"> <%=rs.getString("nombre") %></option>		             
		            <% }}
		            if(mp6==""){%><option value="Seleccioná" selected="selected">Seleccioná</option>		            	
		            <%}%>		            
		            Conexion.cerrarCall(cl);
		          	Conexion.cerrarConexion(cn);%>	       				   									   				   
				</select>
			</div>      
		    <div class="col-1">    
			    <input type="text" class="form-control fuente" id="aep6" name="aep6" oninput="aep6x()"  value="<%=aep6 %>">
			  </div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="jap6" name="jap6" oninput="jap6x()"  value="<%=jap6 %>">
			</div>
		    <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="dip6" name="dip6"  oninput="dip6x()"  value="<%=dip6 %>">
			</div>
		     <div class="col-2 ">
			      <input type="text" class="form-control fuente" id="fmp6" name="fmp6"  oninput="fmp6x()" value="<%=fbp6 %>">
			</div>
		    <div class="col-2 input-group">
		    	<input type="text" class="form-control fuente" id="mmap6" name="mmap6" oninput="mmap6x()" value="<%=mmap6 %>">
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<input type="text" class="form-control fuente" id="map6" name="map6"  oninput="map6x()"  value="<%=map6 %>">
				
				
			</div>
  		</div>
		<br>
	</div>	
	<!--div class="card">
			<div class="card-body d-flex justify-content-between align-items-center inasistencias text-white">
				<a href="../entrevistas/mostrarImagen.do?dni=<%=foto %>" target="_blank"> <img src="../entrevistas/mostrarImagen.do?dni=<%=foto %>" width="100px"></a>
				<h3>FOTO DEL BOLETÍN</h3><br>
				<p>Subir boletín</p>
			<p><input name="foto" id="foto" type="file" onchange="validarExtension()"></p>
			<p class="cuidado">Si ves el logo de Cimientos es porque aún no se cargó ninguna foto</p>
			
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Ayuda</button>
			</div>
		</div-->
	<br>
	<input name="foto" id="foto" type="file" value="pp.JPG" style="visibility:hidden;">
	<button type="submit" class="btn btn-success btn-lg btn-block">Guardar</button>
  </form>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ayuda</h4>
        </div>
        <div class="modal-body">
          <h4>INASISTENCIAS</h4>
          <p>Ingresá solamente números o las letra s (Sin dato)</p>
          <h4>MATERIAS</h4>
          <p>Ingresá solamente números o las letras s (Sin información) o n (No aplica)</p>
          <h4>PREVIAS</h4>
          <p>Materia: Seleccioná el nombre de la materia previa</p>
          <p>Año Escolar: Ingresá sólamente los números 1 - 2 - 3 - 4 - 5 - 6 - 7</p>
          <p>Para los meses de las mesas: Ingresá solamente: a (Aprobado) - d (Desaprobado) - r (Recursando) - p (No se presentó) - h (no hubo mesa de examen)</p>
          <p>Para Mesa adicional:</p> 
          <p>Ingresá en Mes: a (Abril) - m (Mayo) - j (Junio) - s (Septiembre) - o (Octubre) - n (noviembre)</p>
          <p>Ingresá en Resultado: a (Aprobado) - d (Desaprobado) - r (Recursando) - p (No se presentó) - h (no hubo mesa de examen)</p>          
		  <p><b>Una vez que la materia previa fue aprobada en alguna de las llamadas, desaparece de la grilla</b>      
		  <hr>
		  <p><b>Las letras, en todos los casos, se tienen que ingresar en minúscula</b></p>
          <hr>   
          <h4>FOTO BOLETIN</h4>
          <p>La foto tiene que ser con extensión <b>JPG</b>
          <p>La foto se guarda cuando se hace click en guardar</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
<script>

</script>
</body>
</html>