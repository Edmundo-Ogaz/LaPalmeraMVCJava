<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="ubicacion" class="Ubicacion" scope="session"/>
<%
String filproducto= request.getParameter("filproducto");
String filbodega= request.getParameter("filbodega");
String filtipoproducto= request.getParameter("filtipoproducto");
String filfechaingresoinicio= request.getParameter("filfechaingresoinicio");
String filfechaingresotermino= request.getParameter("filfechaingresotermino");
String filfechavencimientoinicio= request.getParameter("filfechavencimientoinicio");
String filfechavencimientotermino= request.getParameter("filfechavencimientotermino");
String seleccion = request.getParameter("seleccion");

String producto = seleccion.substring(0,seleccion.indexOf("/"));
seleccion = seleccion.substring(seleccion.indexOf("/")+1,seleccion.length());
String bodega = seleccion.substring(0,seleccion.indexOf("/"));
seleccion = seleccion.substring(seleccion.indexOf("/")+1,seleccion.length());
String fechaingreso = seleccion.substring(0,seleccion.indexOf("/"));
seleccion = seleccion.substring(seleccion.indexOf("/")+1,seleccion.length());
String horaingreso = seleccion.substring(0,seleccion.indexOf("/"));
seleccion = seleccion.substring(seleccion.indexOf("/")+1,seleccion.length());
String fechavencimiento = seleccion.substring(seleccion.indexOf("/")+1,seleccion.length());

String tipoproducto = "";
String cantidad= "";
String unidadmedida= "";
String observacion = "";

ubicacion.setCodigoProducto(producto);
ubicacion.setCodigoBodega(bodega);
ubicacion.setFechaIngreso(fechaingreso);
ubicacion.setHoraIngreso(horaingreso);
ubicacion.setFechaVencimiento(fechavencimiento);
if (ubicacion.buscar()){
tipoproducto = ubicacion.getTipoProducto();
cantidad = ubicacion.getCantidad();
unidadmedida = ubicacion.getCodigoUnidadMedida();
observacion = ubicacion.getObservacion();
}
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
function validar(formulario) {
 
  if (formulario.producto.value == -1) {
    alert("Ingrese el Producto.");
    formulario.producto.focus();
    return (false);
  }
  
  if (formulario.bodega.value == -1) {
    alert("Ingrese la Bodega.");
    formulario.bodega.focus();
    return (false);
  }
  
  if (formulario.tipoproducto.value == -1) {
    alert("Ingrese el Tipo Producto.");
    formulario.tipoproducto.focus();
    return (false);
  }
  
  if (formulario.fechavencimiento.value.length < 1) {
    alert("Ingrese la Fecha de Vencimiento.");
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
<form name = formulario action = "/LaPalmera/servlet/ModificaUbicacion" onSubmit="return validar(this)" target="_self">
<!--form name = formulario action = "/LaPalmera/jsp/Fin.jsp" onSubmit="return validar(this)" target="_self"-->
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<input type="hidden" name="filbodega" value="<%=filbodega%>"/> 
<input type="hidden" name="filtipoproducto" value="<%=filtipoproducto%>"/> 
<input type="hidden" name="filfechaingresoinicio" value="<%=filfechaingresoinicio%>"/> 
<input type="hidden" name="filfechaingresotermino" value="<%=filfechaingresotermino%>"/> 
<input type="hidden" name="filfechavencimientoinicio" value="<%=filfechavencimientoinicio%>"/> 
<input type="hidden" name="filfechavencimientotermino" value="<%=filfechavencimientotermino%>"/> 
<input type="hidden" name="producto" value="<%=producto%>"/>
<input type="hidden" name="bodega" value="<%=bodega%>"/>
<input type="hidden" name="fechaingreso" value="<%=fechaingreso%>"/>
<input type="hidden" name="horaingreso" value="<%=horaingreso%>"/>
<input type="hidden" name="fechavencimiento" value="<%=fechavencimiento%>"/>

<table border = 0>
<tr>
<td>
Producto</td>
<td>
<input type=text name="producto2" value="<%=producto%>" disabled="disabled">
</td>
</tr>
<tr>
<td>
Bodega</td>
<td>
<input type=text name="bodega2" value = '<%=bodega%>' disabled="disabled"></td>
</tr>
<tr>
<td>
Fecha Vencimiento
</td>
<td><input name = "fechavencimiento2" type="type" value="<%=fechavencimiento%>" disabled="disabled"/></td>
</tr>
<tr>
<td>
Tipo Producto
</td>
<td>
<select size=1 name=tipoproducto>
<option value=-1>SELECCIONE TIPO PRODUCTO</option>
<%
if (tipoproducto.equals("P"))
  {
%>  
  <option selected="selected" value="P">Producto</option>
  <option value="I">Insumo</option>
<%
}else{
%>
  <option value="P">Producto</option>
  <option selected="selected" value="I">Insumo</option>
<%
  }
%>  
</select>
<!--input name = "tipo" type="type" value="<%--=tipoproducto--%>" /-->
</td>
</tr>
<!--tr>
<td>Fecha de Ingreso</td>
<td><input name = "fechaingreso" type="type" value="<%=fechaingreso%>" /></td>
</tr-->
<tr>
<td>Cantidad</td>
<td><input name = "cantidad" type="type" value="<%=cantidad%>" /></td>
</tr>
<tr>
<td>
Unidad de Medida
</td>
<td>
<SELECT size=1 name=unidadmedida>
<OPTION VALUE=-1>SELECCIONE UNIDAD</OPTION>
<%
ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();
ManejadorUnidadMedida manUnidadMedida  = new ManejadorUnidadMedida();
arrayUnidadMedida=manUnidadMedida.consultar();
%>

<%Iterator itUnidadMedida = arrayUnidadMedida.iterator();
while (itUnidadMedida.hasNext())
    {
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();
if (unidadmedida.equals(unidadMedida.getCodigoUnidadMedida())){
%>
<OPTION selected="selected" VALUE=<%=unidadMedida.getCodigoUnidadMedida()%>> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}else{%>
<OPTION VALUE=<%=unidadMedida.getCodigoUnidadMedida()%>> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>Observacion</td>
<td><input name = "observacion" type="type" value="<%=observacion%>" /></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaUbicacion.jsp&titulo=Listado Ubicacion&filproducto=<%=filproducto%>&filbodega=<%=filbodega%>&filtipoproducto=<%=filtipoproducto%>&filfechaingresoinicio=<%=filfechaingresoinicio%>&filfechaingresotermino=<%=filfechaingresotermino%>&filfechavencimientoinicio=<%=filfechavencimientoinicio%>&filfechavencimientotermino=<%=filfechavencimientotermino%>','_self')">Volver</button>
</form>
</body>
</html>
