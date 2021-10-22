<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
//String filproducto= request.getParameter("filproducto");
%>
<html>
<head>
<!-Hoja de estilos del calendario -->
<link rel="stylesheet" type="text/css" media="all" href="calendar-system.css" title="win2k-cold-1" />
<!-- librería principal del calendario -->
<script type="text/javascript" src="calendar.js"></script>
<!-- librería para cargar el lenguaje deseado -->
<script type="text/javascript" src="lang/calendar-es.js"></script>
<!-- librería que declara la función Calendar.setup, que ayuda a generar un calendario en unas pocas líneas de código -->
<script type="text/javascript" src="calendar-setup.js"></script>
<!-- script que define y configura el calendario-->

<script language="JavaScript">
<!--
var ajax;
function funcionCallback()
{
	// Comprobamos si la peticion se ha completado (estado 4)
	if( ajax.readyState == 4 )
	{
		// Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
		if( ajax.status == 200 )
		{
			// Escribimos el resultado en la pagina HTML mediante DHTML
			document.all.salidaUnidadMedida.innerHTML = "<b>"+ajax.responseText+"<b>";	
			document.formulario.unidadmedida.focus();
		}
	}
}

function recuperaUnidadMedida()
{
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer

	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;

	// Enviamos la peticion
	var valor1 = document.formulario.insumo.options[document.formulario.insumo.selectedIndex].value;
	//var valor1 = document.formulario.familiaSel.value;
	//var valor2 = document.formulario.subfamilia.options[document.formulario.subfamilia.selectedIndex].value;
	ajax.open( "GET", "/LaPalmera/jsp/CargaUnidadMedida.jsp?insumo="+valor1, true );	
	//ajax.open( "GET", "/LaPalmera/jsp/CargaCodigoProducto.jsp?subfamiliaSel="+document.formulario.subfamilia.options[document.formulario.subfamilia.selectedIndex].value, true );	
	ajax.send( "" );
}
-->
</script>

<script language="JavaScript">
<!--
function validar(formulario) {
 
  if (formulario.insumo.value == -1) {
    alert("Ingrese el Producto.");
    formulario.insumo.focus();
    return (false);
  }
  
  if (formulario.bodega.value == -1) {
    alert("Ingrese la Bodega.");
    formulario.bodega.focus();
    return (false);
  }
  
  if (formulario.fechavencimiento.value.length < 1) {
    alert("Ingrese la Fecha de Vencimiento.");
    formulario.fechavencimiento.focus();
    return (false);
  }
  
  var hoy=new Date();
  var anohoy=hoy.getYear()+1900; 
  var meshoy=hoy.getMonth()+1;
  var diahoy=hoy.getDate();
  var fechahoy=anohoy+""+meshoy+""+diahoy;
  var varano=formulario.fechavencimiento.value.substr(0, 4); 
  var varmes=formulario.fechavencimiento.value.substr(5, 2);  
  if(varmes<10) {
    var varmes= formulario.fechavencimiento.value.substr(6, 1); 
  } 
  var vardia=formulario.fechavencimiento.value.substr(8, 2);
  if(vardia<10) {
    var vardia= formulario.fechavencimiento.value.substr(9, 1); 
  } 
  var varfecha=varano+varmes+vardia;
  
  if (varfecha <= fechahoy) {
    alert("Fecha de Venciminto no Permitida..");
    formulario.fechavencimiento.focus();
    return (false);
  }
  
  if (formulario.cantidad.value.length < 1) {
    alert("Ingrese la Cantidad del Producto.");
    formulario.cantidad.focus();
    return (false);
  }
  
  if (formulario.unidadmedida.value == -1) {
    alert("Ingrese la Unidad de Medida.");
    formulario.unidadmedida.focus();
    return (false);
  }
    
  var entrar = confirm("¿Desea continuar?")
  if ( !entrar )
  	return (false);
  else
    return (true);
}
//-->
</script>
</head>
<body>
<form name = formulario action = "/LaPalmera/servlet/GrabaIngresoInsumo" onSubmit="return validar(this)" target="_self">
<!--form name = formulario action = "/LaPalmera/jsp/Fin.jsp" onSubmit="return validar(this)" target="_self"-->
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<SELECT size=1 name=insumo onChange="recuperaUnidadMedida()">
<OPTION VALUE=-1>SELECCIONE INSUMO</OPTION>
<%
ArrayList<Insumo> arrayInsumo = new ArrayList<Insumo>();
ManejadorInsumo manInsumo  = new ManejadorInsumo();
arrayInsumo=manInsumo.consultar();
Iterator itInsumo = arrayInsumo.iterator();
while (itInsumo.hasNext())
{
Insumo insumo = (Insumo) itInsumo.next();
%>
<OPTION VALUE=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></OPTION>
<%}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Bodega
</td>
<td>
<SELECT size=1 name=bodega>
<OPTION VALUE=-1>SELECCIONE BODEGA</OPTION>
<% {
ArrayList<Bodega> arrayBodega = new ArrayList<Bodega>();
ManejadorBodega manBodega  = new ManejadorBodega();
arrayBodega=manBodega.consultar();
Iterator itBodega = arrayBodega.iterator();
while (itBodega.hasNext())
{
Bodega bodega = (Bodega) itBodega.next();
%>
<OPTION VALUE=<%=bodega.getCodigoBodega()%>> <%=bodega.getNombreBodega()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Fecha Vencimiento
</td>
<td>
<input type="text" name="fechavencimiento" id="campo_fecha"/>
<input type="button" id="lanzador" value="...">
<!-- script que define y configura el calendario--> 
<script type="text/javascript">
Calendar.setup({
inputField     :    "campo_fecha",     // id del campo de texto
ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto
button     :    "lanzador"     // el id del botón que lanzará el calendario
});
</script>
</td>
</tr>
<tr>
<td>
Cantidad
</td>
<td>
<input type="text" name="cantidad" size="10">
<span id="salidaUnidadMedida">
<SELECT size=1 name=unidadmedida>
<OPTION VALUE=-1>UNIDAD MEDIDA</OPTION>
</SELECT>
</span>
<!--SELECT size=1 name=unidadmedida>
<OPTION VALUE=-1>SELECCIONE UNIDAD MEDIDA</OPTION>
<OPTION VALUE=UND> Unidad </OPTION>
</SELECT-->
</td>
</tr>
<tr>
<td>
Observación 
</td>
<td>
<textarea name="observacion"></textarea>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<!--button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaIngresoInsumo.jsp&titulo=Listado Ingreso Insumo&filproducto=<%--=filproducto--%>','_self')">Lista</button-->
<!--button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilIngresoInsumo.jsp&titulo=Filtrado Ingreso de Insumos','_self')">Filtro</button-->
</form>
</body>
</html>
