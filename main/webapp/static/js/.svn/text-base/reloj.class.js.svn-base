function reloj()
{
var hoy=new Date();
var h=hoy.getHours();
var m=hoy.getMinutes();
var s=hoy.getSeconds();
m=checatiempo(m);
s=checatiempo(s);
document.getElementById('reloj').innerHTML=h+":"+m+":"+s;
t=setTimeout('reloj()',500);
}

// Agrega 0 cuando los numeros son menor a 10
function chequeaTiempo(i)
{
if (i<10)
  {
  i="0" + i;
  }
return i;
}