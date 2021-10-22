<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilProductoLinea.jsp">
<table border = 0>
<tr>
<td>
Linea Producción</td>
<td>
<SELECT size="1" name="fillineaproduccion">
<OPTION selected="selected" VALUE="">TODOS</OPTION>
<%
ArrayList<LineaProduccion> arrayLineaProduccion = new ArrayList<LineaProduccion>();;
ManejadorLineaProduccion manLineaProduccion= new ManejadorLineaProduccion();
arrayLineaProduccion = manLineaProduccion.consultar();
Iterator itLineaProduccion= arrayLineaProduccion.iterator();
while (itLineaProduccion.hasNext())
{
LineaProduccion lineaProduccion= (LineaProduccion) itLineaProduccion.next();
%>
<OPTION VALUE="<%=lineaProduccion.getCodigoLineaProduccion()%>"> <%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}%>
</SELECT>
<!--input type=text name=filcodigo value = '' size = 25 maxlength = 25-->
</td>
</tr>
<tr>
<td>
Producto
</td>
<td>
<SELECT size="1" name="filproducto">
<OPTION selected="selected" VALUE="">TODOS</OPTION>
<%
ArrayList<Producto> arrayProducto = new ArrayList<Producto>();;
ManejadorProducto manProducto= new ManejadorProducto();
arrayProducto = manProducto.consultar();
Iterator itProducto = arrayProducto.iterator();
while (itProducto.hasNext())
{
Producto producto2= (Producto) itProducto.next();
%>
<OPTION VALUE="<%=producto2.getCodigoProducto()%>"> <%=producto2.getNombreProducto()%></OPTION>
<%}%>
</SELECT>
<!--input type=text name=filnombre value = '' size = 70 maxlength = 70-->
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nuevo Producto por Linea de Producción'>
</form>
</body>
</html>
