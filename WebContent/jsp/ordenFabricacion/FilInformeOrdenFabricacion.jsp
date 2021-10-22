<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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
<form action = "/LaPalmera/jsp/ControlFilInformeOrdenFabricacion.jsp">
<table border = 0>
<tr>
<td>
Orden Fabricación
</td>
<td>
<input type=text name="filordenfabricacion" value = '' size = 25 maxlength = 25></td>
</tr>
<tr>
<td>
Fecha Entrega
</td>
<td>
Fecha de Inicio
<input type="text" name="filfechainicio" id="campo_fecha" size="7"/>
<input type="button" id="lanzador" value="..."/>
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
Fecha de Termino
</td>
<td>
<input type="text" name="filfechatermino" id="campo_fecha" size="7"/>
<input type="button" id="lanzador" value="..."/>
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
L&iacute;nea de Producción
</td>
<td>
<% {
ArrayList<LineaProduccion> arrayLineaProduccion = new ArrayList<LineaProduccion>();
ManejadorLineaProduccion manLineaProduccion = new ManejadorLineaProduccion();
arrayLineaProduccion =manLineaProduccion.consultar();
%>
<SELECT size=1 name=fillineaproduccion>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itLineaProduccion = arrayLineaProduccion.iterator();
while (itLineaProduccion.hasNext())
    {
LineaProduccion lineaProduccion = (LineaProduccion) itLineaProduccion.next();%>
<OPTION VALUE=<%=lineaProduccion.getCodigoLineaProduccion()%>> <%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Estado
</td>
<td>
<select size=1 name=filestadoprograma>
  <option value="">Todos</option>
  <option value="A">Activo</option>
  <option value="S">Suspendido</option>
  <option value="T">Terminado</option>
</select>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<!--input type=submit name=Enviar value = 'Nuevo Programa de Producción'-->
</form>
</body>
</html>
