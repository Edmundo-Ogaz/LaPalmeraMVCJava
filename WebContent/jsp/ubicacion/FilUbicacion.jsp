<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
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
</head>
<form action = "/LaPalmera/jsp/ControlFilUbicacion.jsp">
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<SELECT size=1 name=filproducto>
<OPTION VALUE="">TODOS</OPTION>
<% 
ArrayList<Producto> arrayProducto = new ArrayList<Producto>();
ManejadorProducto manProducto  = new ManejadorProducto();
arrayProducto=manProducto.consultar();
%>

<%Iterator itProducto = arrayProducto.iterator();
while (itProducto.hasNext())
    {
Producto producto = (Producto) itProducto.next();
%>
<OPTION VALUE=<%=producto.getCodigoProducto()%>> <%=producto.getNombreProducto()%></OPTION>
<%}%>
<% 
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
<%}%>
</SELECT>
<!--input type=text name=codigo value = '' size = 25 maxlength = 25-->
</td>
</tr>
<tr>
<td>
Bodega
</td>
<td>
<SELECT size=1 name=filbodega>
<OPTION VALUE="">TODOS</OPTION>
<% 
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
<%}%>
</SELECT>
<!--input type=text name=nombre value = '' size = 70 maxlength = 70-->
</td>
</tr>
<tr>
<td>
Tipo
</td>
<td>
<select size=1 name=filtipoproducto>
  <option value="">Todos</option>
  <option value="P">Producto</option>
  <option value="I">Insumo</option>
</select>
</td>
</tr>
<tr>
<td>
Fecha Ingreso
</td>
<td>
Desde
<input type="text" name="filfechaingresoinicio" id="campo_fecha" size="10"/>
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
<td>
Hasta
<input type="text" name="filfechaingresotermino" id="campo_fecha" size="10"/>
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
Fecha Vencimiento
</td>
<td>
Desde
<input type="text" name="filfechavencimientoinicio" id="campo_fecha" size="10"/>
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
<td>
Hasta
<input type="text" name="filfechavencimientotermino" id="campo_fecha" size="10"/>
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
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nueva Ubicacion'>
</form>
</body>
</html>
