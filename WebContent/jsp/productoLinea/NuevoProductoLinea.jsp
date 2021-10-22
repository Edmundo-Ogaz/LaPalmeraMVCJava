<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filproducto = request.getParameter("filproducto");
String fillineaproduccion = request.getParameter("fillineaproduccion");
//String filciudad = request.getParameter("filciudad");
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
<form name = formulario action = "/LaPalmera/servlet/GrabaProductoLinea" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<input type="hidden" name="fillineaproduccion" value="<%=fillineaproduccion%>"/>
<table border = 0>
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
%>
<OPTION VALUE="<%=lineaProduccion.getCodigoLineaProduccion()%>"> <%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}%>
</SELECT>
<!--input type="text" name="lineaproduccion"  size = "1"-->
</td>
</tr>
<tr>
<td>
Producto
</td>
<td>
<SELECT size="1" name="producto">
<OPTION selected="selected" VALUE=-1>SELECCIONE PRODUCTO</OPTION>
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
<!--input type=text name=producto value = '' size = 70 maxlength = 70-->
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProductoLinea.jsp&titulo=Listado Producto por Linea&filproducto=<%=filproducto%>&fillineaproduccion=<%=fillineaproduccion%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilProductoLinea.jsp&titulo=Filtrado Producto por Linea','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>