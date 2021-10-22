<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filproducto= request.getParameter("filproducto");
//String filnombre = request.getParameter("filnombre");
//String filciudad = request.getParameter("filciudad");
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
 
  if (formulario.producto.value == -1) {
    alert("Ingrese el Producto.");
    formulario.producto.focus();
    return (false);
  }
  
  if (formulario.stockdisponible.value.length < 1) {
    alert("Ingrese el Stock Disponible.");
    formulario.stockdisponible.focus();
    return (false);
  }
  
  if (formulario.stockcomprometido.value.length < 1) {
    alert("Ingrese el Stock Comprometido.");
    formulario.stockcomprometido.focus();
    return (false);
  }
  
  if (formulario.unidadmedida.value == -1) {
    alert("Ingrese la Unidad de Medida del Producto.");
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

<form name = formulario action = "/LaPalmera/servlet/GrabaStock" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<!--input type="hidden" name="filnombre" value="<%--=filnombre--%>"/-->
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<SELECT size=1 name=producto>
<OPTION VALUE=-1>SELECCIONE PRODUCTO</OPTION>
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
<tr>
<td>
Stock Disponible
</td>
<td>
<input type="text" name="stockdisponible" size = "10">
Stock Comprometido
</td>
<td>
<input type="text" name="stockcomprometido" size="10">
<SELECT size=1 name=unidadmedida>
<OPTION VALUE=-1>SELECCIONE UNIDAD</OPTION>
<% {
ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();
ManejadorUnidadMedida manUnidadMedida  = new ManejadorUnidadMedida();
arrayUnidadMedida=manUnidadMedida.consultar();
%>

<%Iterator itUnidadMedida = arrayUnidadMedida.iterator();
while (itUnidadMedida.hasNext())
    {
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();
%>
<OPTION VALUE=<%=unidadMedida.getCodigoUnidadMedida()%>> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaStock.jsp&titulo=Listado Stock&filproducto=<%=filproducto%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilStock.jsp&titulo=Filtrado Stock','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>