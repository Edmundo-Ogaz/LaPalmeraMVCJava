<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilInformeDeterminarInsumo.jsp">
<table border = 0>
<tr>
<td>
Producto</td>
<td>
<% {
ArrayList<Producto> arrayProducto= new ArrayList<Producto>();
ManejadorProducto manProducto= new ManejadorProducto();
arrayProducto=manProducto.consultar();
%>
<SELECT size=1 name=filproducto>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itProducto= arrayProducto.iterator();
while (itProducto.hasNext())
    {
Producto producto= (Producto) itProducto.next();%>
<OPTION VALUE=<%=producto.getCodigoProducto()%>> <%=producto.getNombreProducto()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
<tr>
<td>
Insumo</td>
<td>
<% {
ArrayList<Insumo> arrayInsumo= new ArrayList<Insumo>();
ManejadorInsumo manInsumo= new ManejadorInsumo();
arrayInsumo=manInsumo.consultar();
%>
<SELECT size=1 name=filinsumo>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itInsumo= arrayInsumo.iterator();
while (itInsumo.hasNext())
    {
Insumo insumo= (Insumo) itInsumo.next();%>
<OPTION VALUE=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<!--input type=submit name=Enviar value = 'Nuevo Ingrediente'-->
</form>
</body>
</html>
