<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filordenfabricacion= request.getParameter("filordenfabricacion");
//String filfuncionario= request.getParameter("filfuncionario");
String ordenfabricacion= request.getParameter("ordenfabricacion");
String ultimafila= request.getParameter("ultimafila");
String producto = "";
String cantidadprogramada = "";
String cantidadfabricada = "";
String saldoporfabricar = "";

String cantidadinsumototal ="";

ProgramaProduccion programaProduccion = new ProgramaProduccion();
programaProduccion.setCodigoOrdenFabricacion(ordenfabricacion);
if (programaProduccion.buscar())
{
producto = programaProduccion.getCodigoProducto();
cantidadprogramada = programaProduccion.getCantidadProgramada();
cantidadfabricada = programaProduccion.getCantidadFabricada();
saldoporfabricar = programaProduccion.getSaldoPorFabricar();
}
%>
<html>
<head>
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
								
			document.all.salidaInsumo.innerHTML = ajax.responseText;
			
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
			document.all.salidaUnidadMedida.innerHTML = "<b>"+ajax.responseText+"<b>";	
			document.formulario.unidadmedida.focus();
		}
	}
}

function recuperaInsumo()
{
	
  if (document.formulario.insumo.value == -1) {
    alert("Ingrese el Insumo a Entregar.");
    document.formulario.insumo.focus();
    return (false);
  }
  if (document.formulario.cantidadinsumo.value.length < 1) {
    alert("Escriba la Cantidad del Insumo.");
    document.formulario.cantidadinsumo.focus();
    return (false);
  }
  
  var checkOK = "0123456789.";
  var checkStr = document.formulario.cantidadinsumo.value;
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
    alert("Escriba sólo números en el campo \"Cantidad\".");
    document.formulario.cantidadinsumo.focus();
    return (false);
  }    
  
  if (document.formulario.unidadmedida.value == -1) {
    alert("Ingrese la Unidad de Medida.");
    document.formulario.unidadmedida0.focus();
    return (false);
  }
	
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
	var valor1 = document.formulario.insumo.value;
	var valor2 = document.formulario.cantidadinsumo.value;
	var valor3 = document.formulario.unidadmedida.value;
	//var valor4 = document.formulario.cantidaddevolucion.value;
	//var valor4 = document.formulario.ultimafila.value;
	ajax.open( "GET", "/LaPalmera/jsp/CargarDevolucionInsumo.jsp?insumo="+valor1+"&cantidadinsumo="+valor2+"&unidadmedida="+valor3, true );
	ajax.send( "" );


return (true);
}

function sacaInsumo()
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
	var valor1 = document.formulario.cantidaddevolucion.value;
	var valor2 = document.formulario.cantidadinsumo.value;
	ajax.open( "GET", "/LaPalmera/jsp/SacarDevolucionInsumo.jsp?cantidaddevolucion="+valor1+"&cantidadinsumo="+valor2, true );
	ajax.send( "" );
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
	ajax.onreadystatechange = funcionCallback1;

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
  
  if (document.formulario.cantidaddevolucion.value == 0) {
    alert("No tiene insumos para entregar.");
    return (false);
  }
  
  if (document.formulario.ordenfabricacion.value.length < 1) {
    alert("Ingrese la Orden de Fabricación.");
    document.formulario.ordenfabricacion.focus();
    return (false);
  }
  
  if (document.formulario.insumo.value == -1) {
    alert("Ingrese el Insumo a Entregar.");
    document.formulario.insumo.focus();
    return (false);
  }
  if (document.formulario.cantidadinsumo.value.length < 1) {
    alert("Escriba la Cantidad del Insumo.");
    document.formulario.cantidadinsumo.focus();
    return (false);
  }
  
  var checkOK = "0123456789.";
  var checkStr = document.formulario.cantidadinsumo.value;
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
    alert("Escriba sólo números en el campo \"Cantidad\".");
    document.formulario.cantidadinsumo.focus();
    return (false);
  }    
  
  if (document.formulario.unidadmedida.value == -1) {
    alert("Ingrese la Unidad de Medida.");
    document.formulario.unidadmedida.focus();
    return (false);
  }

  if (document.formulario.funcionario.value == -1) {
    alert("Ingrese el Funcionario.");
    document.formulario.funcionario.focus();
    return (false);
  }

  var entrar = confirm("¿Desea continuar?")
  if ( !entrar )
  	return (false);
  else
    return (true);
}
-->
</script>
</head>
<body>

<form name = formulario action = "/LaPalmera/servlet/GrabaDevolucionInsumo" onSubmit="return validar(this)" target="_self">
<!--form name = formulario action = "/LaPalmera/jsp/Fin.jsp" onSubmit="return validar(this)" target="_self"-->
<input type="hidden" name="filordenfabricacion" value="<%=filordenfabricacion%>"/>
<!--input type="hidden" name="filfuncionario" value="<%--=filfuncionario--%>"/-->
<input type="hidden" name="ordenfabricacion" value="<%=ordenfabricacion%>"/>
<input type="hidden" name="producto" value="<%=producto%>"/>
<input type="hidden" name="cantidadprogramada" value="<%=cantidadprogramada%>"/>
<input type="hidden" name="cantidadfabricada" value="<%=cantidadfabricada%>"/>
<input type="hidden" name="saldoporfabricar" value="<%=saldoporfabricar%>"/>
<table border = 0>
<tr>
<td width="136"> 
Orden de Fabricaci&oacute;n</td>
<td width="664">
<input type=text name="ordenfabricacion2" size = 20 value="<%=ordenfabricacion%>" disabled="disabled"/>
</td>
</tr>
<tr>
<td> 
Producto
</td>
<td>
<%
Producto producto2= new Producto();
producto2.setCodigoProducto(producto);
producto2.buscar();
%> 
<input type=text name="producto2" size = 40 value="<%=producto2.getNombreProducto()%>" disabled="disabled"/>
</td>
</tr>
<tr>
<td colspan="2">
<table>
<tr>
<td>
Cantidad Programada<br>
<input type=text name="cantidadprogramada2" size = 20 value="<%=cantidadprogramada%>" disabled="disabled"/>
</td>
<td>
Cantidad Fabricada<br>
<input type=text name="cantidadfabricada2" size = 20 value="<%=cantidadfabricada%>" disabled="disabled"/>
</td>
<td>
Saldo por Fabricar<br>
<input type=text name="saldoporfabricar2" size = 20 value="<%=saldoporfabricar%>" disabled="disabled"/>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="2">
<br>
<jsp:useBean id="arrayIngredienteDevolucion" class="ArrayList<Ingrediente>" scope="session"/>


<span id="salidaInsumo">

<%
int i = 1;
int j = 0;
%>

<table border="1">
<%
Iterator itIngrediente = arrayIngredienteDevolucion.iterator();
while (itIngrediente.hasNext())
{
Ingrediente ingrediente = (Ingrediente) itIngrediente.next();
%>
<tr>
<td width="46">
Insumo
</td>
<td width="390">
<input type="hidden" name="insumo<%=i%>" value="<%=ingrediente.getCodigoInsumo()%>"/>
<select size=1 name="insumo<%=i%>text" disabled="disabled">
<option value=-1>SELECCIONE INSUMO</option>
<% 
ArrayList<Insumo> arrayInsumo= new ArrayList<Insumo>();
ManejadorInsumo manInsumo= new ManejadorInsumo();
arrayInsumo=manInsumo.consultar();
Iterator itInsumo= arrayInsumo.iterator();
while (itInsumo.hasNext())
{
Insumo insumo= (Insumo) itInsumo.next();
if (ingrediente.getCodigoInsumo().equals(insumo.getCodigoInsumo())){
%>
<option selected="selected" value=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></option>
<%}else{%>
<option value=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></option>
<%}}%>
</select>
Cantidad
<input type="hidden" name="cantidadinsumo<%=i%>" value="<%=ingrediente.getCantidadInsumo()%>"/>
<input type="text" name="cantidadinsumo<%=i%>text" value="<%=ingrediente.getCantidadInsumo()%>" size="5" disabled="disabled"/></td>
<td width="363">
Unidad de Medida
<input type="hidden" name="unidadmedida<%=i%>" value="<%=ingrediente.getCodigoUnidadMedida()%>"/>
<select size="1" name="unidadmedida<%=i%>text" disabled="disabled">
<option selected="selected" value=-1>SELECCIONE UNIDAD MEDIDA</option>
<%
ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();;
ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();
arrayUnidadMedida = manUnidadMedida.consultar();
Iterator itUnidadMedida = arrayUnidadMedida.iterator();
while (itUnidadMedida.hasNext())
{
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();
if (ingrediente.getCodigoUnidadMedida().equals(unidadMedida.getCodigoUnidadMedida())){
%>
<option selected="selected" value="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></option>
<%}else{%>
<option value="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></option>
<%}}%>
</select>
</td>
</tr>
<%
i++;
j++;
}%>
<tr>
<td>
Insumo
</td>
<td>
<select size=1 name="insumo" onChange="recuperaUnidadMedida()">
<option value=-1>SELECCIONE INSUMO</option>
<% 
ArrayList<Insumo> arrayInsumo= new ArrayList<Insumo>();
ManejadorInsumo manInsumo= new ManejadorInsumo();
arrayInsumo=manInsumo.consultar();
Iterator itInsumo= arrayInsumo.iterator();
while (itInsumo.hasNext())
{
Insumo insumo= (Insumo) itInsumo.next();
%>
<option value=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></option>
<%}%>

<%-- 
ArrayList<Producto> arrayProducto= new ArrayList<Producto>();
ManejadorProducto manProducto= new ManejadorProducto();
arrayProducto=manProducto.consultar();
Iterator itProducto= arrayProducto.iterator();
while (itProducto.hasNext())
{
Producto producto2 = (Producto) itProducto.next();
--%>
<!--option value=<%--=producto2.getCodigoProducto()--%>> <%--=producto2.getNombreProducto()--%></option-->
<%--}--%>
</select>

Cantidad
<input type="text" name="cantidadinsumo" size="5"/></td>
<td>
Unidad de Medida
<span id="salidaUnidadMedida">
<SELECT size=1 name=unidadmedida>
<OPTION VALUE=-1>UNIDAD MEDIDA</OPTION>
</SELECT>
</span>
<!--select size="1" name="unidadmedida">
<option selected="selected" value=-1>SELECCIONE UNIDAD MEDIDA</option-->
<%--
ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();;
ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();
arrayUnidadMedida = manUnidadMedida.consultar();
Iterator itUnidadMedida = arrayUnidadMedida.iterator();
while (itUnidadMedida.hasNext())
{
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();
--%>
<!--option value="<%--=unidadMedida.getCodigoUnidadMedida()--%>"> <%--=unidadMedida.getNombreUnidadMedida()--%></option-->
<%--}--%>
<!--/select-->
<%
i++;
j++;
%>
</td>
</tr>
</table>
<%--}--%>
<input type="hidden" name="cantidaddevolucion" value="<%=j%>"/>
<input type="hidden" name="ultimafilainsumoj" value="<%=j%>"/>

</span>
	
</td>
</tr>
<tr>
<td>
<button type="button" onClick="recuperaInsumo()">Agregar Insumo</button>
</td>
<td>
<button type="button" onClick="sacaInsumo()">Sacar Ultimo Insumo</button>
</td>
</tr>
<tr>
<td>
<br>
</td>
</tr>
<tr>
<td>
Funcionario 
</td>
<td>
<select size=1 name=funcionario>
<option value=-1>SELECCIONE FUNCIONARIO</option>
<% 
ArrayList<Funcionario> arrayFuncionario= new ArrayList<Funcionario>();
ManejadorFuncionario manFuncionario= new ManejadorFuncionario();
arrayFuncionario=manFuncionario.consultar();
%>
<%Iterator itFuncionario= arrayFuncionario.iterator();
while (itFuncionario.hasNext())
{
Funcionario funcionario= (Funcionario) itFuncionario.next();
%>
<option value=<%=funcionario.getRutFuncionario()%>> <%=funcionario.getNombreFuncionario()%></option>
<%}%>
</select>
</td>
</tr>
<tr>
<td> 
Observaci&oacute;n 
</td>
<td>
<textarea name="observacion" rows = 4 cols = 60></textarea>
</td>
</tr>
</table>
<input type="hidden" name="ultimafila" value="<%=ultimafila%>"/>
<input type="submit" name="Enviar" value="Enviar"/>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaDevolucionInsumo.jsp&titulo=Lista Devolución de Insumo&filordenfabricacion=<%=filordenfabricacion%>&seleccion=<%=ordenfabricacion%>','_self')">Volver</button>
</form>
</body>
</html>