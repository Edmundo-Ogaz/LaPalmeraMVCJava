<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="arrayFuncionarioModifica" class="ArrayList<ProduccionFuncionario>" scope="session"/>

<%
//String ordenfabricacion= request.getParameter("ordenfabricacion");
//String filordenfabricacion= request.getParameter("filordenfabricacion");
String filordenfabricacion= "31-1";

//String correlativoproduccion = request.getParameter("seleccion");
String correlativoproduccion = "3";
String ordenfabricacion = "";
String fecha = "";
String hora = "";
String producto = "";
String cantidad = "";
String observacion = "";

CapturaProduccion capturaProduccion= new CapturaProduccion();
capturaProduccion.setCorrelativoProduccion(correlativoproduccion);
if (capturaProduccion.buscar())
{
ordenfabricacion = capturaProduccion.getCodigoOrdenFabricacion();
fecha = capturaProduccion.getFechaCapturaProduccion();
hora = capturaProduccion.getHoraCapturaProduccion();
producto = capturaProduccion.getCodigoProducto();
cantidad = capturaProduccion.getCantidadProducto();
observacion = capturaProduccion.getObservacion();
}

String productoorden = "";
String cantidadprogramada = "";
String cantidadfabricada = "";
String saldoporfabricar = "";

ProgramaProduccion programaProduccion = new ProgramaProduccion();
programaProduccion.setCodigoOrdenFabricacion(ordenfabricacion);
if (programaProduccion.buscar())
{
productoorden = programaProduccion.getCodigoProducto();
cantidadprogramada = programaProduccion.getCantidadProgramada();
cantidadfabricada = programaProduccion.getCantidadFabricada();
saldoporfabricar = programaProduccion.getSaldoPorFabricar();
}
%>

<%--
ArrayList<ProduccionFuncionario> arrayProduccionFuncionario= new ArrayList<ProduccionFuncionario>();
ManejadorProduccionFuncionario manProduccionFuncionario= new ManejadorProduccionFuncionario();
manProduccionFuncionario.setCorrelativoProduccion(correlativoproduccion);
arrayProduccionFuncionario= manProduccionFuncionario.consultar();
//arrayFuncionarioModifica= manProduccionFuncionario.consultar();
Iterator itProduccionFuncionario= arrayProduccionFuncionario.iterator();
while (itProduccionFuncionario.hasNext())
 {
ProduccionFuncionario produccionFuncionario= (ProduccionFuncionario) itProduccionFuncionario.next();

//arrayFuncionarioModifica.add(produccionFuncionario);
}
--%>

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
								
			document.all.salidaFuncionario.innerHTML = ajax.responseText;
			
		}
	}
}

function recuperaFuncionario()
{
	
  if (document.formulario.funcionario.value == -1) {
    alert("Ingrese el Funcionario.");
    document.formulario.funcionario.focus();
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
	var valor1 = document.formulario.funcionario.value;
	//var valor2 = document.formulario.cantidadfuncionario.value;
	ajax.open( "GET", "/LaPalmera/jsp/CargarCapturaProduccionFuncionario.jsp?funcionario="+valor1, true );
	ajax.send( "" );


return (true);
}

function sacaFuncionario()
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
	var valor1 = document.formulario.funcionario.value;
	var valor2 = document.formulario.cantidadfuncionario.value;

	ajax.open( "GET", "/LaPalmera/jsp/SacarCapturaProduccionFuncionario.jsp?funcionario="+valor1+"&cantidadfuncionario="+valor2, true );
	ajax.send( "" );
}
-->
</script>

<script language="JavaScript">
<!--
function validar(formulario) {
  
  if (document.formulario.ultimafilafuncionario.value == 1) {
    alert("Ingrese los Funcionario de la Captura de Producción.");
    return (false);
  }
 
  if (document.formulario.ordenfabricacion.value.length < 1) {
    alert("Ingrese la Orden de Fabricación.");
    document.formulario.ordenfabricacion.focus();
    return (false);
  }
  
  if (document.formulario.producto.value == -1) {
    alert("Ingrese el Insumo a Entregar.");
    document.formulario.insumo.focus();
    return (false);
  }
  if (document.formulario.cantidad.value.length < 1) {
    alert("Escriba la Cantidad del Insumo.");
    document.formulario.cantidad.focus();
    return (false);
  }
  
  var checkOK = "123456789";
  var checkStr = document.formulario.cantidad.value;
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
    document.formulario.cantidad.focus();
    return (false);
  }    
  
   if (document.formulario.cantidad.value > document.formulario.saldoporfabricar.value) {
    alert("La cantidad Ingresada es Mayor al Saldo por Fabricar.");
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

<form name = formulario action = "/LaPalmera/servlet/GrabaCapturaProduccion" onSubmit="return validar(this)" target="_self">
<!--form name = formulario action = "/LaPalmera/jsp/Fin.jsp" onSubmit="return validar(this)" target="_self"-->
<input type="hidden" name="ordenfabricacion" value="<%=ordenfabricacion%>"/>
<input type="hidden" name="filordenfabricacion" value="<%=filordenfabricacion%>"/>
<input type="hidden" name="producto" value="<%=producto%>"/>
<input type="hidden" name="cantidadprogramada" value="<%=cantidadprogramada%>"/>
<input type="hidden" name="cantidadfabricada" value="<%=cantidadfabricada%>"/>
<input type="hidden" name="saldoporfabricar" value="<%=saldoporfabricar%>"/>
<table border = 0>
<tr>
<td> 
Orden de Fabricaci&oacute;n</td>
<td>
<input type=text name="ordenfabricacion2" size = 20 value="<%=ordenfabricacion%>" disabled="disabled"/>
</td>
</tr>
<tr>
<td> 
Producto
</td>
<td>
<%
Producto producto2 = new Producto();
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
<input type=text name="cantidadproducto2" size = 20 value="<%=cantidadprogramada%>" disabled="disabled"/>
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
Cantidad
<input type="text" name="cantidad" size="5" value="<%=cantidad%>"/>
Unidad de Medida 
<select size="1" name="unidadmedida2" disabled="disabled">
<!--option selected="selected" value=-1>SELECCIONE UNIDAD MEDIDA</option-->
<%
UnidadMedida unidadMedida = new UnidadMedida();
unidadMedida.setCodigoUnidadMedida(producto2.getCodigoUnidadMedida());
unidadMedida.buscar();
%>
<option value="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></option>
<input type="hidden" name="unidadmedida" value="<%=unidadMedida.getCodigoUnidadMedida()%>"/>
</select>
</td>
</tr>
<tr>
<td colspan="2">
<br>


<span id="salidaFuncionario">
<table border="1">
	
<%
int i = 1;
int j = 0;
Iterator itFuncionario= arrayFuncionarioModifica.iterator();
while (itFuncionario.hasNext())
{
Funcionario funcionario= (Funcionario) itFuncionario.next();
%>

<tr>
<td width="46">
Funcionario
</td>
<td width="390">
<input type="hidden" name="funcionario<%=i%>" value="<%=funcionario.getRutFuncionario()%>"/>
<select size=1 name="funcionario<%=i%>text" disabled="disabled">
<option value=-1>SELECCIONE FUNCIONARIO</option>
<% 
ArrayList<Funcionario> arrayFuncionario2= new ArrayList<Funcionario>();
ManejadorFuncionario manFuncionario= new ManejadorFuncionario();
arrayFuncionario2=manFuncionario.consultar();
Iterator itFuncionario2= arrayFuncionario2.iterator();
while (itFuncionario2.hasNext())
{
Funcionario funcionario2 = (Funcionario) itFuncionario2.next();
if (funcionario.getRutFuncionario().equals(funcionario2.getRutFuncionario())){
%>
<option selected="selected" value=<%=funcionario2.getRutFuncionario()%>> <%=funcionario2.getNombreFuncionario()%></option>
<%}else{%>
<option value=<%=funcionario2.getRutFuncionario()%>> <%=funcionario.getNombreFuncionario()%></option>
<%}}%>
</select>
<%i++;%>
<%j++;%>
<%}%>
</td>
</tr>
<tr>
<td>
Funcionario
</td>
<td>
<select size=1 name="funcionario">
<option value=-1>SELECCIONE FUNCIONARIO</option>
<% 
ArrayList<Funcionario> arrayFuncionario2= new ArrayList<Funcionario>();
ManejadorFuncionario manFuncionario= new ManejadorFuncionario();
arrayFuncionario2=manFuncionario.consultar();
Iterator itFuncionario2= arrayFuncionario2.iterator();
while (itFuncionario2.hasNext())
{
Funcionario funcionario2= (Funcionario) itFuncionario2.next();
%>
<option value=<%=funcionario2.getRutFuncionario()%>> <%=funcionario2.getNombreFuncionario()%></option>
<%}%>
</select>
<%i++;%>
<%j++;%>
<input type="hidden" name="ultimafilafuncionario" value="<%=i%>"/>
<input type="hidden" name="cantidadfuncionario" value="<%=j%>"/>
</td>
</tr>
</table>			
</span>
	
</td>
</tr>
<tr>
<td>
<button type="button" onClick="recuperaFuncionario()">Agregar Funcionario</button>
</td>
<td>
<button type="button" onClick="sacaFuncionario()">Sacar Funcionario</button>
</td>
</tr>
<tr>
<td>
<br>
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
<input type="submit" name="Enviar" value="Enviar"/>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaCapturaProduccion.jsp&titulo=Listado Captura Producción&seleccion=<%=ordenfabricacion%>&filordenfabricacion=<%=filordenfabricacion%>','_self')">Volver</button>
</form>
</body>
</html>