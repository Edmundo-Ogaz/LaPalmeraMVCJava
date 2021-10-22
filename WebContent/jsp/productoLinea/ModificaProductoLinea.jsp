<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="productoLinea" class="ProductoLinea" scope="session"/>
<%
String filproducto = request.getParameter("filproducto");
String fillineaproduccion = request.getParameter("fillineaproduccion");
String producto = request.getParameter("seleccion");
String lineaproduccion = "";

productoLinea.setCodigoProducto(producto);
if (productoLinea.buscar()){
lineaproduccion = productoLinea.getCodigoLineaProduccion();
}
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
  
  if (formulario.lineaproduccion.value == -1) {
    alert("Ingrese la Linea de Producción.");
    formulario.lineaproduccion.focus();
    return (false);
  }
  if (formulario.producto.value == -1) {
    alert("Ingrese el Producto.");
    formulario.producto.focus();
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
<form name = formulario action = "/LaPalmera/servlet/ModificaProductoLinea" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<input type="hidden" name="fillineaproduccion" value="<%=fillineaproduccion%>"/>
<input type="hidden" name="producto" value="<%=producto%>"/>

<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<SELECT size="1" name="producto2" disabled="disabled">
<OPTION selected="selected" VALUE=-1>SELECCIONE PRODUCTO</OPTION>
<%
ArrayList<Producto> arrayProducto= new ArrayList<Producto>();;
ManejadorProducto manProducto= new ManejadorProducto();
arrayProducto= manProducto.consultar();
Iterator itProducto= arrayProducto.iterator();
while (itProducto.hasNext())
{
Producto producto2= (Producto) itProducto.next();
if (producto.equals(producto2.getCodigoProducto())){
%>
<OPTION selected="selected" VALUE="<%=producto2.getCodigoProducto()%>"><%=producto2.getNombreProducto()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=producto2.getCodigoProducto()%>"><%=producto2.getNombreProducto()%></OPTION>
<%}}%>
</SELECT>
<!--input type=text name=producto value = '<%--=producto--%>' size = 70 maxlength = 70></td-->
</tr>
<tr>
<td>
Linea de Produccion
</td>
<td>
<SELECT size="1" name="lineaproduccion">
<OPTION selected="selected" VALUE=-1>SELECCIONE LINEA PRODUCCION</OPTION>
<%
ArrayList<LineaProduccion> arrayLineaProduccion = new ArrayList<LineaProduccion>();;
ManejadorLineaProduccion manLineaProduccion= new ManejadorLineaProduccion();
arrayLineaProduccion = manLineaProduccion.consultar();
Iterator itLineaProduccion= arrayLineaProduccion.iterator();
while (itLineaProduccion.hasNext())
{
LineaProduccion lineaProduccion= (LineaProduccion) itLineaProduccion.next();
if (lineaproduccion.equals(lineaProduccion.getCodigoLineaProduccion())){
%>
<OPTION selected="selected" VALUE="<%=lineaProduccion.getCodigoLineaProduccion()%>"><%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=lineaProduccion.getCodigoLineaProduccion()%>"><%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}}%>
</SELECT>
<!--input type=text name=lineaproduccion2 value="<%--=lineaproduccion--%>" disabled="disabled"-->
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProductoLinea.jsp&titulo=Listado Producto por Linea&filproducto=<%=filproducto%>&fillineaproduccion=<%=fillineaproduccion%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
