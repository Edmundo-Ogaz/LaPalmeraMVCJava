<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filproducto= request.getParameter("filproducto");
String filbodega= request.getParameter("filbodega");
String filtipoproducto= request.getParameter("filtipoproducto");
String filfechaingresoinicio= request.getParameter("filfechaingresoinicio");
String filfechaingresotermino= request.getParameter("filfechaingresotermino");
String filfechavencimientoinicio= request.getParameter("filfechavencimientoinicio");
String filfechavencimientotermino= request.getParameter("filfechavencimientotermino");
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

<form name = formulario action = "/LaPalmera/servlet/GrabaUbicacion" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<input type="hidden" name="filbodega" value="<%=filbodega%>"/> 
<input type="hidden" name="filtipoproducto" value="<%=filtipoproducto%>"/> 
<input type="hidden" name="filfechaingresoinicio" value="<%=filfechaingresoinicio%>"/> 
<input type="hidden" name="filfechaingresotermino" value="<%=filfechaingresotermino%>"/> 
<input type="hidden" name="filfechavencimientoinicio" value="<%=filfechavencimientoinicio%>"/> 
<input type="hidden" name="filfechavencimientotermino" value="<%=filfechavencimientotermino%>"/> 
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<SELECT size=1 name=producto>
<OPTION VALUE=-1>SELECCIONE PRODUCTO</OPTION>
<%-- {
ArrayList<Producto> arrayProducto = new ArrayList<Producto>();
ManejadorProducto manProducto  = new ManejadorProducto();
arrayProducto=manProducto.consultar();
Iterator itProducto = arrayProducto.iterator();
while (itProducto.hasNext())
    {
Producto producto = (Producto) itProducto.next();
--%>
<!--OPTION VALUE=<%--=producto.getCodigoProducto()--%>> <%--=producto.getNombreProducto()--%></OPTION-->
<%--}}--%>
<% {
ArrayList<Insumo> arrayInsumo = new ArrayList<Insumo>();
ManejadorInsumo manInsumo  = new ManejadorInsumo();
arrayInsumo=manInsumo.consultar();
%>

<%Iterator itInsumo = arrayInsumo.iterator();
while (itInsumo.hasNext())
    {
Insumo insumo = (Insumo) itInsumo.next();
%>
<OPTION VALUE=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></OPTION>
<%}}%>
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
%>

<%Iterator itBodega = arrayBodega.iterator();
while (itBodega.hasNext())
    {
Bodega bodega = (Bodega) itBodega.next();
%>
<OPTION VALUE=<%=bodega.getCodigoBodega()%>> <%=bodega.getNombreBodega()%></OPTION>
<%}}%>
</SELECT></td>
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
<!--td>
<input type="text" name="fechavencimiento">
</td-->
</tr>
<tr>
<td>
Tipo Producto
</td>
<td>
<select size=1 name=tipoproducto>
  <option value=-1>SELECCIONE TIPO PRODUCTO</option>
  <option value="P">Producto</option>
  <option value="I">Insumo</option>
</select>
</td>
</tr>
<!--tr>
<td>
Fecha Ingreso
</td>
<td>
	<input type="text" name="fechaingreso" id="campo_fecha"/>
	<input type="button" id="lanzador" value="..."-->
	<!-- script que define y configura el calendario--> 
	<!--script type="text/javascript">
   	Calendar.setup({
    inputField     :    "campo_fecha",     // id del campo de texto
    ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto
    button     :    "lanzador"     // el id del botón que lanzará el calendario
	});
	</script>
	</td-->
<!--td>
<input type="text" name="fechaingreso">
</td-->
<!--/tr-->
<tr>
<td>
Cantidad
</td>
<td>
<input type="text" name="cantidad" size="10">
<SELECT size=1 name=unidadmedida>
<OPTION VALUE=-1>SELECCIONE UNIDAD</OPTION>
<option value="UND">Unidad</option>

<%-- {
ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();
ManejadorUnidadMedida manUnidadMedida  = new ManejadorUnidadMedida();
arrayUnidadMedida=manUnidadMedida.consultar();
Iterator itUnidadMedida = arrayUnidadMedida.iterator();
while (itUnidadMedida.hasNext())
    {
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();
--%>
<!--OPTION VALUE=<%--=unidadMedida.getCodigoUnidadMedida()--%>> <%--=unidadMedida.getNombreUnidadMedida()%></OPTION-->
<%--}}--%>
</SELECT></td>
</tr>
<tr>
<td>
Observación 
</td>
<td>
<textarea name="observacion"></textarea>
<!--input type="text" name="observacion"-->
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaUbicacion.jsp&titulo=Listado Ubicacion&filproducto=<%=filproducto%>&filbodega=<%=filbodega%>&filtipoproducto=<%=filtipoproducto%>&filfechaingresoinicio=<%=filfechaingresoinicio%>&filfechaingresotermino=<%=filfechaingresotermino%>&filfechavencimientoinicio=<%=filfechavencimientoinicio%>&filfechavencimientotermino=<%=filfechavencimientotermino%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilUbicacion.jsp&titulo=Filtrado Ubicacion','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>