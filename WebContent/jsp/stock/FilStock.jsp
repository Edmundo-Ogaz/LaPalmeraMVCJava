<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilStock.jsp">
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<SELECT size=1 name=filproducto>
<OPTION VALUE="">TODOS</OPTION>
<% {
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
<%}}%>
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
<!--tr>
<td>
Nombre</td>
<td>
<input type=text name=filnombre value = '' size = 70 maxlength = 70></td>
</tr-->
<!--tr>
<td>
Tipo
</td>
<td>
<select size=1 name=tipoproducto>
  <option value="">Todos</option>
  <option value="S">Producto</option>
  <option value="T">Insumo</option>
</select>
</td>
</tr-->
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nuevo Stock'>
</form>
</body>
</html>
