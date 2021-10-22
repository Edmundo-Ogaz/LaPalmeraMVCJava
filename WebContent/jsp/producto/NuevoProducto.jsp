<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
String filtipoproducto = request.getParameter("filtipoproducto");
String filfamilia = request.getParameter("filfamilia");
String filsubfamilia = request.getParameter("filsubfamilia");
%>
<html>
<head>
</head>
<body>
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
			document.all.salidaSubFamilia.innerHTML = "<b>"+ajax.responseText+"<b>";
			document.all.salidaCodigoProducto.innerHTML = "<b>"+"</b>";
			document.formulario.subfamilia.focus();	
		}
	}
}
function funcionCallback1()
{
	// Comprobamos si la peticion se ha completado (estado 4)
	if( ajax.readyState == 4 )
	{
		// Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
		if( ajax.status == 200 )
		{
			// Escribimos el resultado en la pagina HTML mediante DHTML
			document.all.salidaCodigoProducto.innerHTML = "<b>"+ajax.responseText+"<b>";	
			document.formulario.codigo.focus();
		}
	}
}
function recuperaSubFamilia()
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
	ajax.open( "GET", "/LaPalmera/jsp/CargaSubFamilia.jsp?familiaSel="+document.formulario.familia.options[document.formulario.familia.selectedIndex].value, true );
	ajax.send( "" );
}


function muestraCodigoProducto()
{
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer

	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback1;

	// Enviamos la peticion
	var valor1 = document.formulario.familia.options[document.formulario.familia.selectedIndex].value;
	//var valor1 = document.formulario.familiaSel.value;
	var valor2 = document.formulario.subfamilia.options[document.formulario.subfamilia.selectedIndex].value;
	ajax.open( "GET", "/LaPalmera/jsp/CargaCodigoProducto.jsp?subfamiliaSel="+valor2+"&familiaSel="+valor1, true );	
	//ajax.open( "GET", "/LaPalmera/jsp/CargaCodigoProducto.jsp?subfamiliaSel="+document.formulario.subfamilia.options[document.formulario.subfamilia.selectedIndex].value, true );	
	ajax.send( "" );
}
-->
</script>

<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.familia.value == -1) {
    alert("Escriba la Familia del Producto.");
    formulario.familia.focus();
    return (false);
  }
  if (formulario.subfamilia.value == -1) {
    alert("Escriba la SubFamilia del Producto.");
    formulario.subfamilia.focus();
    return (false);
  }
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el código del Producto.");
    formulario.codigo.focus();
    return (false);
  }
  /*var checkOK = "0123456789";
  var checkStr = formulario.codigo.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0; i < checkStr.length; i++) {
    ch = checkStr.charAt(i);
    for (j = 0; j < checkOK.length; j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length) {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid) {
    alert("Escriba sólo números en el campo \"Código\".");
    formulario.codigo.focus();
    return (false);
  } */   
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el nombre del producto.");
    formulario.nombre.focus();
    return (false);
  }
  if (formulario.otracaracteristica.value == -1) {
    alert("Escriba la Otra Caracteristica del Producto.");
    formulario.otracaracteristica.focus();
    return (false);
  }
  if (formulario.unidadmedida.value == -1) {
    alert("Escriba la Unidad de Medida del Producto.");
    formulario.unidadmedida.focus();
    return (false);
  }
  if (formulario.stockcritico.value.length < 1) {
    alert("Escriba el stok critico del producto.");
    formulario.stockcritico.focus();
    return (false);
  }
var checkOK = "0123456789";
  var checkStr = formulario.stockcritico.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0; i < checkStr.length; i++) {
    ch = checkStr.charAt(i);
    for (j = 0; j < checkOK.length; j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length) {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid) {
    alert("Escriba sólo números en el campo \"Stock Critico\".");
    formulario.stockcritico.focus();
    return (false);
  }
  if (!formulario.tipoproducto[0].checked){ 
   if (!formulario.tipoproducto[1].checked){
    alert("Escriba el Tipo de producto.");
    //formulario.tipoProducto.focus();
    return (false);
  }}
  
  var entrar = confirm("¿Desea continuar?")
  if ( !entrar )
  	return (false);
  else
    return (true);
}
//-->
</script>
<form name = formulario action = "/LaPalmera/servlet/GrabaProducto" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filtipoproducto" value="<%=filtipoproducto%>"/> 
<input type="hidden" name="filfamilia" value="<%=filfamilia%>"/>
<input type="hidden" name="filsubfamilia" value="<%=filsubfamilia%>"/>
<table border = 0>
<tr>
<td>
Familia
</td>
<td>
<SELECT size=1 name=familia onChange="recuperaSubFamilia()">
<OPTION VALUE=-1>SELECCIONE FAMILIA</OPTION>
<% {
ArrayList<Familia> arrayFamilia = new ArrayList<Familia>();
ManejadorFamilia manFamilia  = new ManejadorFamilia();
arrayFamilia=manFamilia.consultar();
%>

<%Iterator itFamilia = arrayFamilia.iterator();
while (itFamilia.hasNext())
    {
Familia familia = (Familia) itFamilia.next();
%>
<OPTION VALUE=<%=familia.getCodigoFamilia()%>> <%=familia.getNombreFamilia()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Subfamilia
</td>
<td>
<span id="salidaSubFamilia">
<SELECT size=1 name=subfamilia onChange="muestraCodigoProducto()">
<OPTION VALUE=-1>SELECCIONE SUBFAMILIA</OPTION>
</SELECT>
</span>
</td>
</tr>
<tr>
<td>
Código del producto
</td>
<td>
<span id ="salidaCodigoProducto"><input type="text" name="codigo"  size = "1">
</span>
</td>
</tr>
<tr>
<td>
Nombre del producto
</td>
<td>
<input type=text name=nombre value = '' size = 70 maxlength = 70>
</td>
</tr>
<tr>
<td>Otras Caracter&iacute;sticas:</td>

<td><SELECT size="1" name="otracaracteristica">
<OPTION selected="selected" VALUE=-1>SELECCIONE OTRA CARACTERISTICA</OPTION>
<%ManejadorOtraCaracteristica manOtraCaracteristica = new ManejadorOtraCaracteristica();%>
<%ArrayList<OtraCaracteristica> arrayOtraCaracteristica = new ArrayList<OtraCaracteristica>();
arrayOtraCaracteristica = manOtraCaracteristica.consultar();%>
<%Iterator itOtraCaracteristica = arrayOtraCaracteristica.iterator();%>
<%while (itOtraCaracteristica.hasNext())
{
OtraCaracteristica otraCaracteristica = (OtraCaracteristica) itOtraCaracteristica.next();%>
<OPTION VALUE="<%=otraCaracteristica.getCodigoOtraCaracteristica()%>"> <%=otraCaracteristica.getNombreOtraCaracteristica()%></OPTION>
<%}%>
</SELECT></td>
</tr>
<tr>
<td>Unidad de medida</td>
<%ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();%>
<%ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();;
arrayUnidadMedida = manUnidadMedida.consultar();%>
<%Iterator itUnidadMedida = arrayUnidadMedida.iterator();%>
<td><SELECT size="1" name="unidadmedida">
<OPTION selected="selected" VALUE=-1>SELECCIONE UNIDAD MEDIDA</OPTION>
<%while (itUnidadMedida.hasNext())
{
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();%>
<OPTION VALUE="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}%>
</SELECT>
</td>
</tr>
<tr>
<td>Stock Cr&iacute;tico</td>
<td><input name = "stockcritico" type="type" /></td>
</tr>
<tr>
<td>Tipo Producto</td>
<td>Semielaborado <input name="tipoproducto" type="radio" value="S">
Terminado <input name="tipoproducto" type="radio" value="T">
</td>
</tr>
<tr>
<td>Valor Costo</td>
<td><input name = "valorcosto" type="type" /></td>
</tr>
<tr>
<td>Valor Venta</td>
<td><input name = "valorventa" type="type" /></td>
</tr>
<tr>
<td valign="top">Preparaci&oacute;n</td>
<td colspan="3"><TEXTAREA name="preparacion" rows = 4 cols = 60></TEXTAREA></td>
</tr> 
<tr>
<td valign="top">
Dirección imagen del producto
</td>
<td>
<input name="foto" type=text/>
</td> 
</tr>
<tr>
<td valign="top">Observaci&oacute;n</td>
<td colspan="3"><TEXTAREA name="observacion" rows = 4 cols = 60></TEXTAREA></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProducto.jsp&titulo=Listado Producto&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>&filtipoproducto=<%=filtipoproducto%>&filfamilia=<%=filfamilia%>&filsubfamilia=<%=filsubfamilia%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilProducto.jsp&titulo=Filtrado Producto','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>