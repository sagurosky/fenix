<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script>
var getBrowserInfo = function() {
    var ua= navigator.userAgent, tem, 
    M= ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
    if(/trident/i.test(M[1])){
        tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
        return 'IE '+(tem[1] || '');
    }
    if(M[1]=== 'Chrome'){
        tem= ua.match(/\b(OPR|Edge)\/(\d+)/);
        if(tem!= null) return tem.slice(1).join(' ').replace('OPR', 'Opera');
    }
    M= M[2]? [M[1], M[2]]: [navigator.appName, navigator.appVersion, '-?'];
    if((tem= ua.match(/version\/(\d+)/i))!= null) M.splice(1, 1, tem[1]);
    return M.join(' ');
};
	if(getBrowserInfo().substring(0, 2)!='IE' && getBrowserInfo().substring(0, 4)!='MSIE'){
		alert("Hola, recordá que tenés que usar Internet Explorer debido a que algunas funciones no funcionarían correctamente.\n\nEstás usando "+ getBrowserInfo());
		window.close();
	}	
		

//alert(getBrowserInfo());
</script>

<script type="text/javascript" src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<link rel="stylesheet" href="<c:url  value="/static/css/ui-lightness/jquery-ui-1.8.5.custom.css"/>"	media="all"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>..:: Login ::..</title>
    <style>
@import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url('../static/images/fondo2018.jpg');
	background-position:center;
	background-repeat:no-repeat;
	-webkit-filter: blur(1px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(50% - 35px);
	left: calc(50% - 255px);
	z-index: 2;
	
	
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
	
}

.header div span{
	color: #5379fa !important;
	
}

.login{
	position: absolute;
	top: calc(50% - 75px);
	left: calc(50% - 50px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: #BA007C;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: #BA007C;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=button]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover{
	opacity: 0.8;
}

.login input[type=button]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=button]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
#agrupar{
	position: absolute;
	top: -300px;
	left: 0px;
	right: 0px;
	bottom: -50px;
	float:left;
	border: 1px solid #ffffff;
	width: 300px;
}

#anpuy{
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	position: absolute;
	float:left;
	border: 1px solid #ffffff;
	width: 300px;
}
#la_liga{
	position: absolute;
	float:left;
	border: 1px solid #ffffff;
	width: 300px;
}
#demos{
	position: absolute;
	float:left;
	border: 1px solid #ffffff;
	width: 300px;
}
#leon{
	position: absolute;	
	float:left;
	border: 1px solid #ffffff;
	width: 300px;
}

</style>

    <script src="js/prefixfree.min.js"></script>

<script>
function myFunction() {
	document.getElementById("loginView").submit();
}
</script>
<script>
  $(document).ready(function(){
    $("#loginView").validate();
  });
  var esIE6 = false;
  var esIE7 = false; 
  function navegador(){
  	esIE6 = false;
	esIE7 = false;
	esIE8 = false;
	safari = false;
	user = navigator.userAgent.toLowerCase();
	if(user.indexOf("msie 6") != -1) {
		esIE6 = true;
	}else if(user.indexOf("msie 7") != -1){
		esIE7 = true;
	}else if(user.indexOf("msie 8") != -1){
		esIE8 = true;
	}else if(user.indexOf("safari") != -1){
		safari = true;
	}
  } 
  
	function inicio(){
 		if (esIE6 || esIE7 || safari){
 			document.getElementById('div_mensaje_navegador').style.display = 'none';
 			document.getElementById('principal').style.display = 'inline';
 		}else if(esIE8){
 			document.getElementById('div_mensaje_IE8').style.display = 'inline';
 			document.getElementById('principal').style.display = 'none';
 
 	 	 	}else{
 			document.getElementById('div_mensaje_navegador').style.display = 'inline';
 			document.getElementById('principal').style.display = 'none';
 				}
 	}  
</script>


</head>

<body>

  <div class="body"></div>
  	<form method="post" id="loginView" action="<c:url value='/j_spring_security_check'/>"> 	
		
		<div class="grad"></div>
		<div class="header">
			<!--  div><strong>Fénix v.2 20190912</strong></div-->
			<!-- div>
				<img id="agrupar" src="../static/images/logo_agrupar.jpg"></img>
				<img id="anpuy" src="../static/images/anpuy.png"></img>
				<img id="la_liga" src="../static/images/la_liga.jpg"></img>
				<img id="demos" src="../static/images/demos.jpg"></img>
				<img id="leon" src="../static/images/leon.JPG"></img>
			</div-->
			
		</div>
		<br><br><br><br>
		<div class="login">
				<input type="text" placeholder="usuario" name="j_username" id="j_username" class="required"><br>
				<input type="password" placeholder="contraseña" id="j_password" maxlength="12" name="j_password" class="required"><br>
				<input type="button" value="Entrar" name="boton" id="boton" onclick="myFunction()">
		</div>
		
	</form>
  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>


</html>