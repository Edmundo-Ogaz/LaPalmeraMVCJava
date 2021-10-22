<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="stock" class="Stock" scope="session"/>
<%
String filproducto= request.getParameter("filproducto");
//String filnombre = request.getParameter("filnombre");
String producto = request.getParameter("seleccion");
String stockdisponible = "";
String stockcomprometido = "";
String unidadmedida = "";

stock.setCodigoProducto(producto);
if (stock.buscar()){
stockdisponible = stock.getStockDisponible();
stockcomprometido = stock.getStockComprometido();
unidadmedida = stock.getCodigoUnidadMedida();
}
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
<form name = formulario action = "/LaPalmera/servlet/ModificaStock" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<!--input type="hidden" name="filnombre" value="<%--=filnombre--%>"/-->
<input type="hidden" name="producto" value="<%=producto%>"/>
<table border = 0>
<tr>
<td>
Producto</td>
<td>
<input type=text name="codigo2" value="<%=producto%>" disabled="disabled"></td>
</tr>
<tr>
<td>
Stock Disponible</td>
<td>
<input type=text name="stockdisponible" value = '<%=stockdisponible%>'></td>
</tr>
<tr>
<td>Stock comprometido</td>
<td><input name = "stockcomprometido" type="type" value="<%=stockcomprometido%>" /></td>
</tr>
<tr>
<td>Unidad Medida</td>
<td>
<SELECT size="1" name="unidadmedida">
<OPTION VALUE=-1>SELECCIONE UNIDAD DE MEDIDA</OPTION>

<%ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();%>
<%ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();;
arrayUnidadMedida= manUnidadMedida.consultar();%>
<%Iterator itUnidadMedida= arrayUnidadMedida.iterator();%>
<%while (itUnidadMedida.hasNext())
{
UnidadMedida unidadMedida= (UnidadMedida) itUnidadMedida.next();
if (unidadmedida.equals(unidadMedida.getCodigoUnidadMedida())){%>
<OPTION selected="selected" VALUE="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}}%>
</SELECT>
<!--input name = "unidadmedida" type="type" value="<%--=unidadmedida--%>" /-->
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaStock.jsp&titulo=Listado Stock&filproducto=<%=filproducto%>','_self')">Volver</button>
</form>
</body>
</html>
