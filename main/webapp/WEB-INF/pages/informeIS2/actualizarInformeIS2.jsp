<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="mif" uri="/list-operator.tld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificación de Informe de Seguimiento Nro 2</title>
<style type="text/css">
.td
{
text-indent: 30px;
}
 

.fechas
{
text-indent: 60px;
text-transform: inherit;
font-family: cursive;
font-size: small;
font-stretch: ultra-condensed;
color: purple;
font-weight: bold;
vertical-align: top;
}
.column-right 
{
	vertical-align: top;
}
.title-right 
{
	text-indent: 20px;
	margin-left: 20px;
	font-weight: bold;
	color: purple;
	font-family: cursive;
	
}
.tabla
{
	background-image:url('../static/images/papel.jpg');
	color:black;
	font-family:sans-serif;
	align:center; 
	border:0; 
}
.ui-dropdownchecklist-text {
	font-size: 11px;
}
.errormsg {
	font-weight: bold; COLOR: red;
}
</style>
<style>
	 span{ background-color: yellow; }
</style>
<script type="text/javascript" src="<c:url value="/static/js/ui.dropdownchecklist.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/static/js/funcionesEntrevista.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/validador.js"/>"></script>

<script>
$(document).ready(() => {
	var vtepA=($("#vtepa").val());
	if(vtepA==="Excelente"){
 	   $("#exa").css("visibility", "visible");
 	   $("#mba").css("visibility", "visible");
 	   $("#ba").css("visibility", "visible");
 	   $("#ra").css("visibility", "visible");
 	   $("#nma").css("visibility", "visible");
    }
    if(vtepA==="Muy bien"){
 	   $("#exa").css("visibility", "visible");
 	   $("#mba").css("visibility", "visible");
 	   $("#ba").css("visibility", "visible");
 	   $("#ra").css("visibility", "visible");
 	   $("#nma").css("visibility", "hidden");
    }
    if(vtepA==="Bien"){
 	   $("#exa").css("visibility", "visible");
 	   $("#mba").css("visibility", "visible");
 	   $("#ba").css("visibility", "visible");
 	   $("#ra").css("visibility", "hidden");
 	   $("#nma").css("visibility", "hidden");
    }
    if(vtepA==="Regular"){
 	   $("#exa").css("visibility", "visible");
 	   $("#mba").css("visibility", "visible");
 	   $("#ba").css("visibility", "hidden");
 	   $("#ra").css("visibility", "hidden");
 	   $("#nma").css("visibility", "hidden");
    }
    if(vtepA==="Necesita mejorar"){
 	   $("#exa").css("visibility", "visible");
 	   $("#mba").css("visibility", "hidden");
 	   $("#ba").css("visibility", "hidden");
 	   $("#ra").css("visibility", "hidden");
 	   $("#nma").css("visibility", "hidden");
    }
    
    var vtepB=($("#vtepb").val());
    if(vtepB==="Excelente"){
 	   $("#exb").css("visibility", "visible");
 	   $("#mbb").css("visibility", "visible");
 	   $("#bb").css("visibility", "visible");
 	   $("#rb").css("visibility", "visible");
 	   $("#nmb").css("visibility", "visible");
    }
    if(vtepB==="Muy bien"){
 	   $("#exb").css("visibility", "visible");
 	   $("#mbb").css("visibility", "visible");
 	   $("#bb").css("visibility", "visible");
 	   $("#rb").css("visibility", "visible");
 	   $("#nmb").css("visibility", "hidden");
    }
    if(vtepB==="Bien"){
 	   $("#exb").css("visibility", "visible");
 	   $("#mbb").css("visibility", "visible");
 	   $("#bb").css("visibility", "visible");
 	   $("#rb").css("visibility", "hidden");
 	   $("#nmb").css("visibility", "hidden");
    }
    if(vtepB==="Regular"){
 	   $("#exb").css("visibility", "visible");
 	   $("#mbb").css("visibility", "visible");
 	   $("#bb").css("visibility", "hidden");
 	   $("#rb").css("visibility", "hidden");
 	   $("#nmb").css("visibility", "hidden");
    }
    if(vtepB==="Necesita mejorar"){
 	   $("#exb").css("visibility", "visible");
 	   $("#mbb").css("visibility", "hidden");
 	   $("#bb").css("visibility", "hidden");
 	   $("#rb").css("visibility", "hidden");
 	   $("#nmb").css("visibility", "hidden");
    }
    
    var vtepC=($("#vtepc").val());
       	if(vtepC==="Excelente"){
    	   $("#exc").css("visibility", "visible");
    	   $("#mbc").css("visibility", "visible");
    	   $("#bc").css("visibility", "visible");
    	   $("#rc").css("visibility", "visible");
    	   $("#nmc").css("visibility", "visible");
       }
       if(vtepC==="Muy bien"){
    	   $("#exc").css("visibility", "visible");
    	   $("#mbc").css("visibility", "visible");
    	   $("#bc").css("visibility", "visible");
    	   $("#rc").css("visibility", "visible");
    	   $("#nmc").css("visibility", "hidden");
       }
       if(vtepC==="Bien"){
    	   $("#exc").css("visibility", "visible");
    	   $("#mbc").css("visibility", "visible");
    	   $("#bc").css("visibility", "visible");
    	   $("#rc").css("visibility", "hidden");
    	   $("#nmc").css("visibility", "hidden");
       }
       if(vtepC==="Regular"){
    	   $("#exc").css("visibility", "visible");
    	   $("#mbc").css("visibility", "visible");
    	   $("#bc").css("visibility", "hidden");
    	   $("#rc").css("visibility", "hidden");
    	   $("#nmc").css("visibility", "hidden");
       }
       if(vtepC==="Necesita mejorar"){
    	   $("#exc").css("visibility", "visible");
    	   $("#mbc").css("visibility", "hidden");
    	   $("#bc").css("visibility", "hidden");
    	   $("#rc").css("visibility", "hidden");
    	   $("#nmc").css("visibility", "hidden");
       }
       
       	var vtepD=($("#vtepd").val());
        if(vtepD==="Excelente"){
       	   $("#exd").css("visibility", "visible");
       	   $("#mbd").css("visibility", "visible");
       	   $("#bd").css("visibility", "visible");
       	   $("#rd").css("visibility", "visible");
       	   $("#nmd").css("visibility", "visible");
          }
          if(vtepD==="Muy bien"){
       	   $("#exd").css("visibility", "visible");
       	   $("#mbd").css("visibility", "visible");
       	   $("#bd").css("visibility", "visible");
       	   $("#rd").css("visibility", "visible");
       	   $("#nmd").css("visibility", "hidden");
          }
          if(vtepD==="Bien"){
       	   $("#exd").css("visibility", "visible");
       	   $("#mbd").css("visibility", "visible");
       	   $("#bd").css("visibility", "visible");
       	   $("#rd").css("visibility", "hidden");
       	   $("#nmd").css("visibility", "hidden");
          }
          if(vtepD==="Regular"){
       	   $("#exd").css("visibility", "visible");
       	   $("#mbd").css("visibility", "visible");
       	   $("#bd").css("visibility", "hidden");
       	   $("#rd").css("visibility", "hidden");
       	   $("#nmd").css("visibility", "hidden");
          }
          if(vtepD==="Necesita mejorar"){
       	   $("#exd").css("visibility", "visible");
       	   $("#mbd").css("visibility", "hidden");
       	   $("#bd").css("visibility", "hidden");
       	   $("#rd").css("visibility", "hidden");
       	   $("#nmb").css("visibility", "hidden");
          }
          
          var vtepE=($("#vtepe").val());
             if(vtepE==="Excelente"){
          	   $("#exe").css("visibility", "visible");
          	   $("#mbe").css("visibility", "visible");
          	   $("#be").css("visibility", "visible");
          	   $("#re").css("visibility", "visible");
          	   $("#nme").css("visibility", "visible");
             }
             if(vtepE==="Muy bien"){
          	   $("#exe").css("visibility", "visible");
          	   $("#mbe").css("visibility", "visible");
          	   $("#be").css("visibility", "visible");
          	   $("#re").css("visibility", "visible");
          	   $("#nme").css("visibility", "hidden");
             }
             if(vtepE==="Bien"){
          	   $("#exe").css("visibility", "visible");
          	   $("#mbe").css("visibility", "visible");
          	   $("#be").css("visibility", "visible");
          	   $("#re").css("visibility", "hidden");
          	   $("#nme").css("visibility", "hidden");
             }
             if(vtepE==="Regular"){
          	   $("#exe").css("visibility", "visible");
          	   $("#mbe").css("visibility", "visible");
          	   $("#be").css("visibility", "hidden");
          	   $("#re").css("visibility", "hidden");
          	   $("#nme").css("visibility", "hidden");
             }
             if(vtepE==="Necesita mejorar"){
          	   $("#exe").css("visibility", "visible");
          	   $("#mbe").css("visibility", "hidden");
          	   $("#be").css("visibility", "hidden");
          	   $("#re").css("visibility", "hidden");
          	   $("#nme").css("visibility", "hidden");
             }
             
             var vtepF=($("#vtepf").val());
                if(vtepF==="Excelente"){
             	   $("#exf").css("visibility", "visible");
             	   $("#mbf").css("visibility", "visible");
             	   $("#bf").css("visibility", "visible");
             	   $("#rf").css("visibility", "visible");
             	   $("#nmf").css("visibility", "visible");
                }
                if(vtepF==="Muy bien"){
             	   $("#exf").css("visibility", "visible");
             	   $("#mbf").css("visibility", "visible");
             	   $("#bf").css("visibility", "visible");
             	   $("#rf").css("visibility", "visible");
             	   $("#nmf").css("visibility", "hidden");
                }
                if(vtepF==="Bien"){
             	   $("#exf").css("visibility", "visible");
             	   $("#mbf").css("visibility", "visible");
             	   $("#bf").css("visibility", "visible");
             	   $("#rf").css("visibility", "hidden");
             	   $("#nmf").css("visibility", "hidden");
                }
                if(vtepF==="Regular"){
             	   $("#exf").css("visibility", "visible");
             	   $("#mbf").css("visibility", "visible");
             	   $("#bf").css("visibility", "hidden");
             	   $("#rf").css("visibility", "hidden");
             	   $("#nmf").css("visibility", "hidden");
                }
                if(vtepF==="Necesita mejorar"){
             	   $("#exf").css("visibility", "visible");
             	   $("#mbf").css("visibility", "hidden");
             	   $("#bf").css("visibility", "hidden");
             	   $("#rf").css("visibility", "hidden");
             	   $("#nmf").css("visibility", "hidden");
                }
                
                var vtepG=($("#vtepg").val());
                   if(vtepG==="Excelente"){
                	   $("#exg").css("visibility", "visible");
                	   $("#mbg").css("visibility", "visible");
                	   $("#bg").css("visibility", "visible");
                	   $("#rg").css("visibility", "visible");
                	   $("#nmg").css("visibility", "visible");
                   }
                   if(vtepG==="Muy bien"){
                	   $("#exg").css("visibility", "visible");
                	   $("#mbg").css("visibility", "visible");
                	   $("#bg").css("visibility", "visible");
                	   $("#rg").css("visibility", "visible");
                	   $("#nmg").css("visibility", "hidden");
                   }
                   if(vtepG==="Bien"){
                	   $("#exg").css("visibility", "visible");
                	   $("#mbg").css("visibility", "visible");
                	   $("#bg").css("visibility", "visible");
                	   $("#rg").css("visibility", "hidden");
                	   $("#nmg").css("visibility", "hidden");
                   }
                   if(vtepG==="Regular"){
                	   $("#exg").css("visibility", "visible");
                	   $("#mbg").css("visibility", "visible");
                	   $("#bg").css("visibility", "hidden");
                	   $("#rg").css("visibility", "hidden");
                	   $("#nmg").css("visibility", "hidden");
                   }
                   if(vtepG==="Necesita mejorar"){
                	   $("#exg").css("visibility", "visible");
                	   $("#mbg").css("visibility", "hidden");
                	   $("#bg").css("visibility", "hidden");
                	   $("#rg").css("visibility", "hidden");
                	   $("#nmg").css("visibility", "hidden");
                   }
                   
                   var vtepH=($("#vteph").val());
                   if(vtepH==="Excelente"){
                	   $("#exh").css("visibility", "visible");
                	   $("#mbh").css("visibility", "visible");
                	   $("#bh").css("visibility", "visible");
                	   $("#rh").css("visibility", "visible");
                	   $("#nmh").css("visibility", "visible");
                   }
                   if(vtepH==="Muy bien"){
                	   $("#exh").css("visibility", "visible");
                	   $("#mbh").css("visibility", "visible");
                	   $("#bh").css("visibility", "visible");
                	   $("#rh").css("visibility", "visible");
                	   $("#nmh").css("visibility", "hidden");
                   }
                   if(vtepH==="Bien"){
                	   $("#exh").css("visibility", "visible");
                	   $("#mbh").css("visibility", "visible");
                	   $("#bh").css("visibility", "visible");
                	   $("#rh").css("visibility", "hidden");
                	   $("#nmh").css("visibility", "hidden");
                   }
                   if(vtepH==="Regular"){
                	   $("#exh").css("visibility", "visible");
                	   $("#mbh").css("visibility", "visible");
                	   $("#bh").css("visibility", "hidden");
                	   $("#rh").css("visibility", "hidden");
                	   $("#nmh").css("visibility", "hidden");
                   }
                   if(vtepH==="Necesita mejorar"){
                	   $("#exh").css("visibility", "visible");
                	   $("#mbh").css("visibility", "hidden");
                	   $("#bh").css("visibility", "hidden");
                	   $("#rh").css("visibility", "hidden");
                	   $("#nmh").css("visibility", "hidden");
                   }   
                
                   var vtepI=($("#vtepi").val());
                  if(vtepI==="Excelente"){
               	   $("#exi").css("visibility", "visible");
               	   $("#mbi").css("visibility", "visible");
               	   $("#bi").css("visibility", "visible");
               	   $("#ri").css("visibility", "visible");
               	   $("#nmi").css("visibility", "visible");
                  }
                  if(vtepI==="Muy bien"){
               	   $("#exi").css("visibility", "visible");
               	   $("#mbi").css("visibility", "visible");
               	   $("#bi").css("visibility", "visible");
               	   $("#ri").css("visibility", "visible");
               	   $("#nmi").css("visibility", "hidden");
                  }
                  if(vtepI==="Bien"){
               	   $("#exi").css("visibility", "visible");
               	   $("#mbi").css("visibility", "visible");
               	   $("#bi").css("visibility", "visible");
               	   $("#ri").css("visibility", "hidden");
               	   $("#nmi").css("visibility", "hidden");
                  }
                  if(vtepI==="Regular"){
               	   $("#exi").css("visibility", "visible");
               	   $("#mbi").css("visibility", "visible");
               	   $("#bi").css("visibility", "hidden");
               	   $("#ri").css("visibility", "hidden");
               	   $("#nmi").css("visibility", "hidden");
                  }
                  if(vtepI==="Necesita mejorar"){
               	   $("#exi").css("visibility", "visible");
               	   $("#mbi").css("visibility", "hidden");
               	   $("#bi").css("visibility", "hidden");
               	   $("#ri").css("visibility", "hidden");
               	   $("#nmi").css("visibility", "hidden");
                  }
    
})

</script>



<script type="text/javascript">
$(document).ready(function(){	
	$("#cgse").change(function(){
            //alert($('select[id=cgse]').val());
       $('#cgseM').empty();
       if($('select[id=cgse]').val()=="enRiesgo"){
       	$("#cgseM").append($("<option></option>").val('suo').html("Selecciona"))
       	$("#cgseM").append($("<option></option>").val(1).html("presenta asistencia intermitente a la escuela y la mayor parte de las materias desaprobadas."))
       	$("#cgseM").append($("<option></option>").val(2).html("seis o más materias desaprobadas."))
       	$("#cgseM").append($("<option></option>").val(3).html("perdida de condición de alumno regular."))
       }else{
        if($('select[id=cgse]').val()=="regular"){
        	$("#cgseM").append($("<option></option>").val('suo').html("Selecciona"))
        	$("#cgseM").append($("<option></option>").val(1).html("inasistencia a clase mayor al 25% en el período trimestral (60 días hábiles)"))
        	$("#cgseM").append($("<option></option>").val(2).html("cuatro o cinco materias desaprobadas."))
        	$("#cgseM").append($("<option></option>").val(3).html("ha recibido llamados de atención por faltas graves de conducta."))
        	$("#cgseM").append($("<option></option>").val(4).html("si bien ha recibido algunos llamados de atención por la conducta, su rendimiento académico ha sido aceptable."))
        	$("#cgseM").append($("<option></option>").val(5).html("si bien tiene más del 40% de las materias desaprobadas, manifiesta esfuerzo y tenacidad para mejorar su situación acedémica."))
        }else{
         if($('select[id=cgse]').val()=="bueno"){
         	$("#cgseM").append($("<option></option>").val('suo').html("Selecciona"))
         	$("#cgseM").append($("<option></option>").val('1').html("ha cumplido con el 75% de asistencia y cuenta con el 80% de las materias aprobadas."))
         	$("#cgseM").append($("<option></option>").val('2').html("ha mantenido una buena conducta y cuenta con el 80% de las materias aprobadas."))
         	
         }else{
           if($('select[id=cgse]').val()=="muyBueno"){
           	$("#cgseM").append($("<option></option>").val('suo').html("Selecciona"))
           	$("#cgseM").append($("<option></option>").val('1').html("ha cumplido con la asitencia en más del 80% y ha tenido una conducta destacada."))
           	$("#cgseM").append($("<option></option>").val('2').html("tiene todas las materias aprobadas y su conducta ha sido destacada."))
           }else{
           	 $('#cgseM').empty();
           }
         	}
        	}
       	}            
 	});
	
});
</script>

<script type="text/javascript">
$(document).ready(function(){	
	$("#cgpp").change(function(){
            //alert($('select[id=cgse]').val());
            $('#cgppM').empty();
            if($('select[id=cgpp]').val()=="enRiesgo"){
            	//$("#cgppM").append($("<option></option>").val('suo').html("Selecciona"))
            	$("#cgppM").append($("<option></option>").val(1).html("reiteradas inasistencias a entrevistas sin justificación ni aviso previo."))
            	$("#cgppM").append($("<option></option>").val(2).html("ha dejado de asistir a la escuela y ha sido imposible tomar contacto con la familia."))
            	$("#cgppM").append($("<option></option>").val(3).html("mantiene previas de años anteriores sin rendir."))            	
            	$("#cgppM").append($("<option></option>").val(4).html("se encuentra en una situación familiar de inestablidad dado que están atravesando una situación delicada de crisis."))
            	$("#cgppM").append($("<option></option>").val(5).html("la familia está evaluando la posibilidad de mudarse a una localidad en la que Cimientos no se encuentra presente."))
            	$("#cgppM").append($("<option></option>").val(6).html("la familia ha manifestado que su situación económica ha mejorado, por lo cual se evaluará su continuidad en el Programa."))
            }else{
	            if($('select[id=cgpp]').val()=="regular"){
	            	//$("#cgppM").append($("<option></option>").val('suo').html("Selecciona"))
	            	$("#cgppM").append($("<option></option>").val(1).html("no ha presentado los materiales solicitados con regularidad."))
	            	$("#cgppM").append($("<option></option>").val(2).html("en varias ocasiones, no ha podido cumplir con los propósitos establecidos."))
	            	$("#cgppM").append($("<option></option>").val(3).html("la asistencia a las entrevistas ha sido discontínua."))
	            	$("#cgppM").append($("<option></option>").val(4).html("en reiteradas ocasiones se ha ausentado el responsable adulto sin justificativo."))	            	
	            }else{
		            if($('select[id=cgpp]').val()=="bueno"){
		            	//$("#cgppM").append($("<option></option>").val('suo').html("Selecciona"))
		            	$("#cgppM").append($("<option></option>").val('1').html("asiste regularmente a las entrevistas. En pocas ocasiones se ha debido reprogramar la cita."))
		            	$("#cgppM").append($("<option></option>").val('2').html("en la mayoría de las entrevistas presenta el material solicitado en tiempo y forma."))
		            	$("#cgppM").append($("<option></option>").val('3').html("se ha mostrado muy comprmetido con el cumplimiento de los propósitos establecidos."))
		            }else{
				            if($('select[id=cgpp]').val()=="muyBueno"){
				            	//$("#cgppM").append($("<option></option>").val('suo').html("Selecciona"))
				            	$("#cgppM").append($("<option></option>").val('1').html("asiste al total de las entrevistas con su Responsable Adulto y se muestra muy comprometido."))
				            	$("#cgppM").append($("<option></option>").val('2').html("presenta todo el material solicitado en tiempo y forma."))
				            	$("#cgppM").append($("<option></option>").val('3').html("participa de la jornada de encuentro de becados y otras actividades propuestas por el Programa."))
				            	$("#cgppM").append($("<option></option>").val('4').html("participa activamente en la formulación de propósitos y se compromete con su cumplimiento."))
				            }else{
				            	 $('#cgppM').empty();
				            }
		            	}
	            	}
            	}            
 	});
	
});
</script>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#idMateriaInteres").dropdownchecklist({icon: {}, 
		width: 250, 
		maxDropHeight: 250,
		emptyText: "Seleccione al menos 1 opción ...",
		onComplete: function(selector) {
			var accion = document.forms['actualizarInformeIS2'].accion.value;
			var checkCount = 0;
			var values = "";
		    for( i=0; i < selector.options.length; i++ ) {					        
		        if ( selector.options[i].selected&& (selector.options[i].value != "")){
		        	checkCount += 1;	
		        	if ( values != "" )
						values += ",";
					values += selector.options[i].value;
		        }
		    }
		    document.forms['actualizarInformeIS2'].materiasInteres.value = values;
			if(accion == ""){
			    if(checkCount == 0)
			    	jConfirm('Como mínimo debes seleccionar 1 materia de interés', 'Aviso');
				else{
			    	if ( checkCount > 3 ) 
			        	jConfirm('Como máximo podés seleccionar 3 materias de interés', 'Aviso');	
				}
			}
		},
		onItemClick: function(checkbox){		
			var checkChequed = checkbox.attr("checked");	
			var check = (checkChequed) ? 1 : -1;
			var cantidad =  document.forms['actualizarInformeIS2'].cantMateriasInteres.value;
			var checkCount = parseInt(cantidad) + parseInt(check);	
 		    if ( checkCount > 3 ) {
 		    	jConfirm('Como máximo podés seleccionar 3 materias de interés', 'Aviso');		
 				throw rejected;
 		    }	
 		   document.forms['actualizarInformeIS2'].cantMateriasInteres.value = checkCount;
		}
	});
	$("#idMateriaCuestan").dropdownchecklist({icon: {}, 
		width: 250, 
		maxDropHeight: 250,
		emptyText: "Seleccione al menos 1 opción ...",
		onComplete: function(selector) {
			var accion = document.forms['actualizarInformeIS2'].accion.value;			
			var checkCount = 0;
			var values = "";
		    for( i=0; i < selector.options.length; i++ ) {					        
		        if ( selector.options[i].selected&& (selector.options[i].value != "")){
		        	checkCount += 1;	
		        	if ( values != "" )
						values += ",";
					values += selector.options[i].value;
		        }
		    }
		    document.forms['actualizarInformeIS2'].materiasCuestan.value = values;
		    if(accion == ""){
			    if(checkCount == 0)
			    	jConfirm('Como mínimo debes seleccionar 1 materia que le cuesta', 'Aviso');
				else{
			    	if ( checkCount > 3 ) 
			        	jConfirm('Como máximo podés seleccionar 3 materias que le cuestan', 'Aviso');	
				}
			}
		},
		onItemClick: function(checkbox){
			var checkChequed = checkbox.attr("checked");	
			var check = (checkChequed) ? 1 : -1;
			var cantidad =  document.forms['actualizarInformeIS2'].cantMateriasCuestan.value;
			var checkCount = parseInt(cantidad) + parseInt(check);	
			if ( checkCount > 3 ) {
 		    	jConfirm('Como máximo podes seleccionar 3 materias que le cuestan', 'Aviso');		    	
 				throw rejected;
 		    }	
 		   document.forms['actualizarInformeIS2'].cantMateriasCuestan.value = checkCount; 		   
		}
	});
	
	//	$("#actualizarInformeIS2").validate(
	//{
	//	errorClass: 'errormsg',
	//	rules: 
	//	{			
	//		escuelaNombre : {
	//			required:true
	//		},
	//		modalidadTrabajoEscuela : {
	//			required:true
	//		},
	//		escuelaComienzoPBE : {
	//			required:true
	//		},
	//		escuelaMatricula :{
	//			required:true
	//		},
	//		cantidadBecados :{
	//			required:true
	//		},
	//		//escuelaIndicadorRepitencia : {
	//		//	required:true
	//		//},
	//		//escuelaIndicadorAbandono : {
	//		//	required:true
	//		//},
	//		actividadAcompanamiento : {
	//			required:true
	//		},
	//		//materiasCuestan: {
	//		//	required:true
	//		//},
	//		//cgse: {
	//		//	required:true
	//		//},
	//		//cgseM: {
	//		//	required:true
	//		//},
	//		//cgpp: {
	//		//	required:true
	//		//},
	//		//cgppM: {
	//		//	required:true
	//	//},
	//		//materiasInteres: {
	//		//	required:true
	//		//}
	//		
	//	},
	//	messages: 
	//	{			
	//		escuelaNombre : {
	//			required:'Este campo es requerido en la ficha de la escuela'
	//		},
	//		modalidadTrabajoEscuela : {
	//			required:'Este campo es requerido en la ficha de la escuela'
	//		},
	//		escuelaComienzoPBE : {
	//			required:'Este campo es requerido en la ficha de la escuela'
	//		},
	//		escuelaMatricula :{
	//			required:'Este campo es requerido en la ficha de la escuela'
	//		},
	//		cantidadBecados :{
	//			required:'Este campo es requerido en la ficha de la escuela'
	//		},
			//escuelaIndicadorRepitencia : {
			//	required:'Este campo es requerido en la ficha de la escuela'
			//},
			//escuelaIndicadorAbandono : {
			//	required:'Este campo es requerido en la ficha de la escuela'
			//},
			//cgse : {
			//	required:'Este campo es requerido'
			//},		
			//cgseM : {
			//	required:'Este campo es requerido'
			//},		
			//cgpp : {
			//	required:'Este campo es requerido'
			//},		
			//cgppM : {
			//	required:'Este campo es requerido'
			//},		
			
	//		actividadAcompanamiento : {
	//			required:'Este campo es requerido'
	//		}		
	//	},	
   	//	invalidHandler: function(form, validator) 
   	//	{
	//		var errors = validator.numberOfInvalids();
	//		if (errors) 	
	//		{
	//			$.unblockUI();
	//		}
	//	}
	//});
 
});

function setearMateriasSeleccionadas(selector, campo1, campo2){
	var checkCount = 0;
	var values = "";
	var valorCampo2 = parseInt(campo2.value);
	if(valorCampo2 != parseInt(0)){
		values = selector.val();
	}
	campo1.value = values;
};

function enviarForm(action, idIS2, idBecado){
	document.forms['actualizarInformeIS2'].accion.value = action;
	//setearMateriasSeleccionadas($("#idMateriaInteres"), document.forms['actualizarInformeIS2'].materiasInteres, document.forms['actualizarInformeIS2'].cantMateriasInteres);
	//setearMateriasSeleccionadas($("#idMateriaCuestan"), document.forms['actualizarInformeIS2'].materiasCuestan, document.forms['actualizarInformeIS2'].cantMateriasCuestan);
	if(action == 'guardar'){
		document.forms['actualizarInformeIS2'].action = "../informeIS2/finalizar.do";		
		$.blockUI();
		document.forms['actualizarInformeIS2'].accion.value = "";
		$('#actualizarInformeIS2').submit();
	}
	if(action == 'revisar'){ 		
		document.forms['actualizarInformeIS2'].action ="../informeIS2/modificarIS2.do";	
		$.blockUI();
		document.forms['actualizarInformeIS2'].submit();
	}	
	document.forms['actualizarInformeIS2'].idAlumno.value = idBecado;
	document.forms['actualizarInformeIS2'].idInformeIS2.value = idIS2;

}
</script>


</head>
<body>
<div id="main-content">
<form id="actualizarInformeIS2" class="cmxform" action="" method="post">
<h1 id="titulo-informe">:: Informe de Seguimiento Nº 2 ::</h1>
<c:set var="urlRegreso" value="${urlRegreso}"></c:set>
    <table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
   	 	<tr>
			<td><label>Construcción - Act</label></td>
		</tr>
   	 	<tr>
			<td><label>${informe.estado.valor}</label></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label>Ciclo lectivo </label>
				<label>${cicloActual.nombre}</label>
			</td>
		</tr> 
		<tr>
			<td colspan="2">
				<h1 id="subtitulo-informe">Mis datos</h1>
			</td>
		</tr>
		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">		
					<tr>
						<td colspan="2">
							${becado.datosPersonales.nombre}&nbsp;${becado.datosPersonales.apellido}
						</td>
					</tr>		
					<c:if test="${tieneFoto == true}">
						<tr>				
							<td colspan="2">
								<img src="../fichaAlumno/mostrarImagen.do?dni=${becado.datosPersonales.dni}" width="100px">
							</td>
						</tr>
					</c:if>
					<c:if test="${tieneFoto == false}">			
						<tr>
							<td colspan="2">
								<img src="../fichaAlumno/mostrarImagen.do?dni=0" width="100px">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label>
									Recuerda que si no cargaste una foto, ésta es la que se enviará en el Informe al padrino.<img src="../static/images/atencion.gif" width=10>
								</label>
							</td>
						</tr>	
					</c:if>	
					<tr>
						<td colspan="2"> 
							Nací el <fmt:formatDate value="${becado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							Tengo ${edad} años
						</td>
					</tr>
					<tr>	
						<td colspan="2">
							Vivo en ${becado.datosPersonales.localidad.nombre}
						</td>
					</tr>
					<tr>	
						<td colspan="2">
							Curso 
							<c:if test="${empty boletin}">
								${becado.anioEscolar.valor}
							</c:if>
							<c:if test="${!empty boletin}">
								${boletin.ano.valor}
							</c:if>
					</tr>		
					<c:if test="${!empty becado.responsable2}">
						<tr>
							<td colspan="2">
								Viene a las entrevistas					
								${becado.responsable2.nombre }&nbsp;${becado.responsable2.apellido}
							</td>				
						</tr>
						<c:if test="${!empty becado.responsable2.idVinculo}">
							<tr>
								<td colspan="2">
									V&iacute;nculo 
									${becado.responsable2.idVinculo.valor}
								</td>
							</tr>
						</c:if>
					</c:if>
					<c:if test="${empty becado.responsable2}">
						<tr>
							<td colspan="2">
								Viene a las entrevistas				
								${becado.responsable1.nombre }&nbsp;${becado.responsable1.apellido}
							</td>					
						</tr>
						<c:if test="${!empty becado.responsable1.idVinculo}">
							<tr>
								<td colspan="2">
									V&iacute;nculo 
									${becado.responsable1.idVinculo.valor}
								</td>
							</tr>
						</c:if>
					</c:if>
					<tr>
						<td colspan="2">
							Fecha incorporación al Programa 
							${periodoFechaPBE}
						</td>
					</tr>	
					<c:if test="${!empty periodoFechaReincorporacionPBE}">
						<tr>
							<td colspan="2">
								Fecha reincorporación al Programa 
								${periodoFechaReincorporacionPBE}
							</td>
						</tr>
					</c:if>			
				</table>
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Mi escuela</label></h1></td>
		</tr>
		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
					<c:if test="${empty escuela.modalidadTrabajoEscuela}">
						<tr>
							<td nowrap="nowrap">Nombre:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="100" style="border:0;" name="escuelaNombre"
									value="${escuela.nombre}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Modalidad de trabajo:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="modalidadTrabajoEscuela"
									value="${modalidadTrabajoEscuela}"></input>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">El programa se implementa desde:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaComienzoPBE"
									value="${escuela.comienzoPBE.nombre}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Matricula total:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaMatricula"
									value="${escuela.matricula}"/>
							</td>
						</tr>	
						<tr>
							<td nowrap="nowrap">Becados por Cimientos:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="cantidadBecados"
									value="${cantidadBecadosCimiento}"/>
							</td>
						</tr>	
						<!-- tr>
							<td nowrap="nowrap">Indicadores de repitencia:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaIndicadorRepitencia"
									value="${escuela.indicadorRepitencia}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Indicadores de abandono:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaIndicadorAbandono"
									value="${escuela.indicadorAbandono}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Porcentaje de inasistencia de los alumnos a la escuela:</td>
							<td>
								<input type="text" readonly="readonly" size="45" style="border:0;" name="escuelaPorcentajeInasistencia"
									value="${escuela.porcentajeInasistencia}"/>
							</td>
						</tr-->						
					</c:if>
					<c:if test="${!empty escuela.modalidadTrabajoEscuela.id && escuela.modalidadTrabajoEscuela.id == 1}">
						<tr>
							<td nowrap="nowrap">Nombre:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="100" style="border:0;" name="escuelaNombre"
									value="${escuela.nombre}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Modalidad de trabajo:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="modalidadTrabajoEscuela"
									value="${escuela.modalidadTrabajoEscuela.valor}"></input>
							</td>
						</tr>
						<tr>				
							<td colspan="2">
								<img src="../escuela/mostrarImagen.do" align="center" width="90px" height="90px">
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Becados por Cimientos:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="cantidadBecados"
									value="${cantidadBecadosCimiento}"/>
							</td>
						</tr>							
					</c:if>		
					<c:if test="${!empty escuela.modalidadTrabajoEscuela.id && escuela.modalidadTrabajoEscuela.id != 1}">
						<tr>
							<td nowrap="nowrap">Nombre:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="100" style="border:0;" name="escuelaNombre"
									value="${escuela.nombre}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Modalidad de trabajo:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="modalidadTrabajoEscuela"
									value="${escuela.modalidadTrabajoEscuela.valor}"></input>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">El programa se implementa desde:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaComienzoPBE"
									value="${escuela.comienzoPBE.nombre}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Matricula total:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaMatricula"
									value="${escuela.matricula}"/>
							</td>
						</tr>	
						<tr>
							<td nowrap="nowrap">Becados por Cimientos:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="cantidadBecados"
									value="${cantidadBecadosCimiento}"/>
							</td>
						</tr>	
						<!-- tr>
							<td nowrap="nowrap">Indicadores de repitencia:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaIndicadorRepitencia"
									value="${escuela.indicadorRepitencia}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Indicadores de abandono:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaIndicadorAbandono"
									value="${escuela.indicadorAbandono}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Porcentaje de inasistencia de los alumnos a la escuela:</td>
							<td>
								<input type="text" readonly="readonly" size="45" style="border:0;" name="escuelaPorcentajeInasistencia"
									value="${escuela.porcentajeInasistencia}"/>
							</td>
						</tr-->	
					</c:if>			
				</table>
			</td>
		</tr>
		
		<!--tr>
				<td colspan="2"><h1 id="subtitulo-informe"><label>Principal HSE trabajada</label></h1></td>
		</tr-->
			<tr>
				<td>					
					<input type="hidden" id="hsTrabajarAño" name="hsTrabajarAño"value="${hsTrabajarAño}">
					<input type="hidden" name="cantMateriasDesaprobadas" id="cantMateriasDesaprobadas" value="0"/>		
					<input type="hidden" name="cantInasistencias" id="cantInasistencias" value="0"/>
					<input type="hidden" id="materiasInteres" name="materiasInteres" value="0">
					<input type="hidden" id="materiasCuestan" name="materiasCuestan" value="0">
					<input type="hidden"  name="propositoAnual" id="propositoAnual" value="">
					<input type="hidden"  name="qtam" id="qtam" value="">
					<input type="hidden" name="osme" id="osme" value="">
				</td>
			</tr>
		<!--tr>
		
			<td colspan="2"><h1 id="subtitulo-informe"><label>Principales Contenidos trabajados</label></h1></td>
		</tr-->	
		<tr>
			<td colspan="2">
				<input type="hidden" name="actividadAcompanamiento" id="actividadAcompanamiento" value="${actividadAcompanamiento}">
			</td>
		</tr>
		
		<!-- 2022 -->	
		
		<tr>
			<td><h1 id="subtitulo-informe"><label>
			Trabajo de acompañamiento realizado a nivel grupal:</label></h1>
			<textarea cols="60" rows="5"  name="tarang" id="tarang" >${tarang}</textarea>
			</td>
		</tr>	
		<tr>
			<td><h1 id="subtitulo-informe"><label>
				Propósito Anual de Acompañamiento:</label></h1>
				<textarea cols="60" rows="5"  name="paa" id="paa" >${paa}</textarea>
			</td>
		</tr>
		<tr>
			<td><h1 id="subtitulo-informe"><label>
				Valoración de la trayectoria escolar y en el programa de el/la estudiante</label></h1>
				
				<b>Asistencia a la modalidad de cursada definida por la escuela (virtual y/o presencial):</b>
				<input type="text"  name="vtepa" id="vtepa" value="${vtepa}">
				<img src="../static/images/estrella.gif" id="exa" style="visibility: hidden;"  width="50px">
				<img src="../static/images/estrella.gif" id="mba" style="visibility: hidden;"  width="50px">
				<img src="../static/images/estrella.gif" id="ba" style="visibility: hidden;"  width="50px">
				<img src="../static/images/estrella.gif" id="ra" style="visibility: hidden;"  width="50px">
				<img src="../static/images/estrella.gif" id="nma" style="visibility: hidden;"  width="50px">
			</td>
		</tr>
		<tr>
			<td>
				<b>Cumplimiento con las tareas asignadas por la escuela:</b>
				<input type="text"  name="vtepb" id="vtepb" value="${vtepb}">
				<img src="../static/images/estrella.gif" id="exb" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="mbb" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="bb" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="rb" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="nmb" style="visibility: hidden;" width="50px">
			</td>
		</tr>
		<tr>
			<td>
				<b>Pone en juego estrategias para resolver dificultades escolares:</b>
				<input type="text"  name="vtepc" id="vtepc" value="${vtepc}">
				<img src="../static/images/estrella.gif" id="exc" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="mbc" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="bc" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="rc" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="nmc" style="visibility: hidden;" width="50px">
			</td>
		</tr>
		<tr>
			<td>
				<b>Compromiso activo para rendir materias pendientes:</b>
				<input type="text"  name="vtepd" id="vtepd" value="${vtepd}">
				<img src="../static/images/estrella.gif" id="exd" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="mbd" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="bd" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="rd" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="nmd" style="visibility: hidden;" width="50px">
			</td>
		</tr>		
		<tr>
			<td>
				<b>Rendimiento escolar en esta etapa del año:</b>
				<input type="text"  name="vtepe" id="vtepe" value="${vtepe}">
				<img src="../static/images/estrella.gif" id="exe" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="mbe" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="be" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="re" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="nme" style="visibility: hidden;" width="50px">
			</td>
		</tr>				
		<tr>
			<td>
				<b>Asistencia y participación en las actividades propuestas en los encuentros de acompañamiento de Cimientos:</b>
				<input type="text"  name="vtepf" id="vtepf" value="${vtepf}">
				<img src="../static/images/estrella.gif" id="exf" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="mbf" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="bf" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="rf" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="nmf" style="visibility: hidden;" width="50px">
			</td>
		</tr>		
		<tr>
			<td>
				<b>Apropiación de las Habilidades Socioemocionales trabajadas en el acompañamiento:</b>
				<input type="text"  name="vtepg" id="vtepg" value="${vtepg}">
				<img src="../static/images/estrella.gif" id="exg" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="mbg" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="bg" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="rg" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="nmg" style="visibility: hidden;" width="50px">
			</td>
		</tr>			
		<tr>
			<td>
				<b>Compromiso para el cumplimiento de los propósitos establecidos en el acompañamiento:</b>
				<input type="text"  name="vteph" id="vteph" value="${vteph}">
				<img src="../static/images/estrella.gif" id="exh" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="mbh" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="bh" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="rh" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="nmh" style="visibility: hidden;" width="50px">
			</td>
		</tr>		
		<tr>
			<td>
				<b>Asistencia y participación del Responsable Adulto en los espacios de acompañamiento:</b>
				<input type="text"  name="vtepi" id="vtepi" value="${vtepi}">
				<img src="../static/images/estrella.gif" id="exi" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="mbi" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="bi" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="ri" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="nmi" style="visibility: hidden;" width="50px">
			</td>
		</tr>

				
		<tr>
			<td><h1 id="subtitulo-informe"><label>
				Trabajo de acompañamiento realizado a nivel individual:</label></h1>
				<textarea cols="60" rows="5"  name="iatarni" id="iatarni" >${iatarni}</textarea>
			</td>
		</tr>
		<tr>
			<td><h1 id="subtitulo-informe"><label>
				Materias Pendientes: ${mp}</label></h1>
				<input type="hidden" name="mp" id="mp" value="${mp}">
			</td>
		</tr>		
		<tr>
			<td><h1 id="subtitulo-informe"><label>
				Suspensiones: ${sus}</label></h1>
				<input type="hidden"  name="sus" id="sus" value="${sus}">
			</td>
		</tr>		
		
		<c:if test="${becado.anioEscolar.id==14 || becado.anioEscolar.id==15}">
			<tr>
				<td colspan="2"><h1 id="subtitulo-informe"><label>Proyección post-escolar del EP:</label></h1></td>
			</tr>	
			<tr>
				<td colspan="2">
					${sarpepe}
					<input type="hidden" name="sarpepe" id="sarpepe" value="${sarpepe}"> 
				</td>
			</tr>				
		</c:if>
		<c:if test="${becado.anioEscolar.id==13 && becado.anioAdicional==false}">
			<tr>
				<td colspan="2"><h1 id="subtitulo-informe"><label>Proyección post-escolar del EP</label></h1></td>
			</tr>	
			<tr>
				<td colspan="2">
					${sarpepe}
					<input type="hidden" name="sarpepe" id="sarpepe" value="${sarpepe}"> 
				</td>
			</tr>					
		</c:if>		
		
		
		<tr>
			<td><h1 id="subtitulo-informe"><label>
				Información adicional sobre la escuela:</label></h1>
				<textarea cols="100" rows="10"  name="ige" id="ige" >${ige}</textarea>
			</td>
		</tr>		
		
		<tr><td><input type="hidden" id="iamp" name="iamp" value=""></td></tr>
			
		<!--tr>
				<td colspan="2"><h1 id="titulo-informe">Bolet&iacute;n de calificaciones</h1></td>
			</tr>
			<tr>			
			<td colspan="2">
				
				<jsp:include page="/WEB-INF/pages/informes/boletinViewIS2.jsp"></jsp:include>
			</td>
			</tr>			
		
		
					
			<tr>			
				<td colspan="2">
					<jsp:include page="/WEB-INF/pages/informes/previasViewIS2.jsp"></jsp:include>
				</td>
			</tr>
			<tr>
				<td><label>Incluir boletín? </label>				
					<c:if test="${incluirBoletinCheck}">
						<input type="checkbox" name="incluirBoletinCheck"  id="incluirBoletinCheck" checked="checked" value="1">
					</c:if>
					<c:if test="${!incluirBoletinCheck}">
						<input type="checkbox" name="incluirBoletinCheck"  id="incluirBoletinCheck" >
					</c:if>
					
				</td>	
			</tr-->	
						
		<!-- tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Mis preferencias</label></h1></td>
		</tr>
		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
					<tr>
						<td nowrap="nowrap">Materias que me interesan:</td>
						<td>
							<select id="idMateriaInteres" name="idMateriaInteres" multiple="multiple" style="width:100px; ">								
								<c:forEach var="materia" items="${listMateriasInteres}">
									<c:choose>
									<c:when test="${mif:contiene(idMateriaInteres, materia.id)}">
										<option selected="selected" id="materiaInteres" value="${materia.id}">${materia.nombre}</option>
									</c:when>
									<c:otherwise>
										<option id="materiaInteres" value="${materia.id}">${materia.nombre}</option>
									</c:otherwise>	
									</c:choose>	
								</c:forEach>
			 				</select>
						</td>
						<td nowrap="nowrap">Materias que me cuestan:</td>
						<td>
							<select id="idMateriaCuestan" name="idMateriaCuestan" multiple="multiple" style="width:150px; ">								
								<c:forEach var="materia" items="${listMateriasCuestan}">
									<c:choose>
									<c:when test="${mif:contiene(idMateriaCuestan, materia.id)}">
										<option selected="selected" id="materiaCuesta" value="${materia.id}">${materia.nombre}</option>
									</c:when>
									<c:otherwise>
										<option id="materiaCuesta" value="${materia.id}">${materia.nombre}</option>
									</c:otherwise>	
									</c:choose>	
								</c:forEach>
			 				</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" class="required" name="materiasInteres" value="${materiasInteres}"></input>
							<input type="hidden" name="cantMateriasInteres" value="${cantMateriasInteres}"></input>
						</td>					
						<td colspan="2">
							<input type="hidden" class="required" name="materiasCuestan" value="${materiasCuestan}"></input>
							<input type="hidden" name="cantMateriasCuestan" value="${cantMateriasCuestan}"></input>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
					<tr>
						<td width="200px">Cantidad materias desaprobadas:</td>
						<td>
							<input type="text" class="required"  size="5" maxlength="2" onkeypress="return soloNumeros(this.event);" name="cantMateriasDesaprobadas"
								value="${cantMateriasDesaprobadas}"/>
						</td>
					</tr>
					<tr>
						<td>Cantidad inasistencias a la escuela:</td>
						<td>
							<input type="text" class="required" size="5" maxlength="5" onkeypress="return validarDecimal(event, this);" name="cantInasistencias"
								value="${cantInasistencias}"/>
						</td>
					</tr>
				</table>
			</td>
		</tr-->
		
		<!-- tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Mensaje al padrino</label></h1></td>
		</tr>
		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
					<tr>
						<td nowrap="nowrap">Querido padrino:</td>
						<td>
							<textarea readonly="readonly" cols="50" rows="5"  class="required" name="mensajePadrino" onblur="eliminarEnter(this);chequearLongitudTextarea(this,1800);" 
								onkeypress="textareaSinEnter(event.keyCode,this);chequearLongitudTextarea(this,1800);"
								onkeyup="textareaSinEnter(event.keyCode,this);chequearLongitudTextarea(this,1800);">${mensajePadrino}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label>
								Debido al cambio de formato del IS2, ya no completaremos este campo
							</label>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>
					Debido al cambio de formato del IS2, ya no completaremos este campo
				</label>
			</td>
		</tr-->
		<!-- tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Concepto general de la situación escolar</label></h1></td>
		</tr>
		<tr>
			<td valign="top">
				<select id="cgse" name="cgse" style="width:120px;" class="required">													
					<option value="suo">Seleccioná</option>
					<option value="enRiesgo">En Riesgo</option>
					<option value="regular">Regular</option>
					<option value="bueno">Bueno</option>
					<option value="muyBueno">Muy Bueno</option>					
			 	</select>			
			</td>
		</tr>
		<tr>		
			<td>
				<select id="cgseM" name="cgseM" style="width:600px;" class="required">													
														
			 	</select>
			</td>
			
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Concepto general de la Participación en PFE</label></h1></td>
		</tr>
		<tr>
			<td valign="top">
				<select id="cgpp" name="cgpp" style="width:120px;" class="required">													
					<option value="suo">Seleccioná</option>
					<option value="enRiesgo">En Riesgo</option>
					<option value="regular">Regular</option>
					<option value="bueno">Bueno</option>
					<option value="muyBueno">Muy Bueno</option>
				</select>						
			</td>
		</tr>
		<tr>
			<td>
			 	
			 	<select id="cgppM" name="cgppM" style="width:600px;"  multiple="multiple" class="required">													
														
			 	</select>
			</td>
		</tr-->
		
      	    
     	<tr>
        	<td>&nbsp;</td>
    	    <td>&nbsp;</td>
    	</tr>
      	<tr>
			<td colspan="2">
				<table width="900" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
             		<tr>
             			<c:if test="${valorPerfil == 'superUsuario' && informe.estado.valor == estadoConstruccion}">
	              			<td width="50" height="0" align="center" valign="middle">
		  	  					<input class="ui-state-default ui-corner-all " onclick="enviarForm('revisar','${idInformeIS2}','${becado.id}')" type="button" value="Guardar" />
		  	  				</td>	
		  	  				<td width="50" height="0" align="center" valign="middle">
				  	  			<input class="ui-state-default ui-corner-all " onclick="enviarForm('guardar','${idInformeIS2}','${becado.id}')" type="button" value="Finalizar"/>
				  	  		</td>
			  	  		</c:if>
			  	  		<c:if test="${valorPerfil == 'superUsuario' && informe.estado.valor == estadoFinalizado}">
				  	  		<td width="50" height="0" align="center" valign="middle">
		  	  					<input class="ui-state-default ui-corner-all " onclick="enviarForm('revisar','${idInformeIS2}','${becado.id}')" type="button" value="Construcción" />
		  	  				</td>
				  	  		<td width="50" height="0" align="center" valign="middle">
				  	  			<input class="ui-state-default ui-corner-all " onclick="enviarForm('guardar','${idInformeIS2}','${becado.id}')" type="button" value="Guardar"/>
				  	  		</td>				  	  		
				  	  	</c:if>
              		 	<c:if test="${valorPerfil != 'superUsuario'}">
              		 		<td width="50" height="0" align="center" valign="middle">
		  	  					<input class="ui-state-default ui-corner-all " onclick="enviarForm('revisar','${idInformeIS2}','${becado.id}')" type="button" value="Construcción" />
		  	  				</td>
				  	  		<td width="50" height="0" align="center" valign="middle">
				  	  			<input class="ui-state-default ui-corner-all " onclick="enviarForm('guardar','${idInformeIS2}','${becado.id}')" type="button" value="Guardar"/>
				  	  		</td>	
              		 	</c:if>
					  	<td width="50" align="center" valign="middle">					  		
					  		<input type="reset" class="ui-state-default ui-corner-all" value="Volver" class="ui-state-default ui-corner-all" onclick="location.href='../reporteGeneralInformes/verReporteGeneralInformes.do'" />
			  			</td>
              			<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
					</tr>
	       		</table> 
	       	</td>
	   	</tr>
	</table>
	<input type="hidden" name="idEi" value="${idEi}"></input>
	<input type="hidden" name="accion"></input>
	<input type="hidden" name="edad" value="${edad}"></input>
	<input type="hidden" name="idAlumno" value="${becado.id}"></input>
	<input type="hidden" name="urlRegreso" value="${urlRegreso}"></input>
	<input type="hidden" name="idInformeIS2" value="${idInformeIS2}"></input>
	<input type="hidden" name="mensajePadrino" value="${mensajePadrino}"></input>
</form>
</div>
</body>
</html>