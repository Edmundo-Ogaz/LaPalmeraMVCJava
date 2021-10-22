<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="ingrediente" class="Ingrediente" scope="session"/>
<%
String filproducto = request.getParameter("filproducto");
String filinsumo = request.getParameter("filinsumo");
String productoinsumo = request.getParameter("seleccion");
String producto = productoinsumo.substring(0,productoinsumo.indexOf("/"));
String insumo = productoinsumo.substring(productoinsumo.indexOf("/")+1,productoinsumo.length());
String carga = "";
String cantidad = "";
String unidadmedida = "";

ingrediente.setCodigoProducto(producto);
ingrediente.setCodigoInsumo(insumo);
if (ingrediente.buscar()){
carga = ingrediente.getCarga();
cantidad = ingrediente.getCantidadInsumo();
unidadmedida = ingrediente.getCodigoUnidadMedida();
}
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.producto.value == -1) {
    alert("Elija el Producto.");
    formulario.producto.focus();
    return (false);
  }
  if (formulario.insumo.value == -1) {
    alert("Elija el Insumo.");
    formulario.insumo.focus();
    return (false);
  }
  if (formulario.carga.value.length < 1) {
    alert("Escriba la Carga del Producto.");
    formulario.carga.focus();
    return (false);
  }
  
  if (formulario.cantidadinsumo.value.length < 1) {
    alert("Escriba la Cantidad del Insumo.");
    formulario.cantidadinsumo.focus();
    return (false);
  }
  if (formulario.unidadmedida.value == -1) {
    alert("Escriba la Unidad de Medida del Insumo.");
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
<form name = formulario action = "/LaPalmera/servlet/ModificaIngrediente" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<input type="hidden" name="filinsumo" value="<%=filinsumo%>"/>
<input type="hidden" name="producto" value="<%=producto%>"/>
<input type="hidden" name="insumo" value="<%=insumo%>"/>
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<input type=text name="codigo2" value="<%=producto%>" disabled="disabled">
</td>
</tr>
<tr>
<td>
Insumo
</td>
<td>
<SELECT size="1" name="insumo2">
<OPTION selected="selected" VALUE=-1>SELECCIONE INSUMO</OPTION>

<%--ManejadorProducto manProducto= new ManejadorProducto();
ArrayList<Producto> arrayProducto = new ArrayList<Producto>();;
manProducto.setTipoProducto("S");
arrayProducto = manProducto.consultar();
Iterator itProducto = arrayProducto.iterator();
while (itProducto.hasNext())
{
Producto producto2= (Producto) itProducto.next();
if (insumo.equals(producto2.getCodigoProducto())){
--%>
<!--OPTION selected="selected" VALUE="<%--=producto2.getCodigoProducto()--%>"> <%--=producto2.getNombreProducto()--%></OPTION-->
<%--}else{--%>
<!--OPTION VALUE="<%--=producto2.getCodigoProducto()--%>"> <%--=producto2.getNombreProducto()--%></OPTION-->
<%--}}--%>

<%ManejadorInsumo manInsumo = new ManejadorInsumo();%>
<%ArrayList<Insumo> arrayInsumo = new ArrayList<Insumo>();;
arrayInsumo = manInsumo.consultar();%>
<%Iterator itInsumo = arrayInsumo.iterator();%>
<%while (itInsumo.hasNext())
{
Insumo insumo2 = (Insumo) itInsumo.next();
if (insumo.equals(insumo2.getCodigoInsumo())){%>
<OPTION selected="selected" VALUE="<%=insumo2.getCodigoInsumo()%>"> <%=insumo2.getNombreInsumo()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=insumo2.getCodigoInsumo()%>"> <%=insumo2.getNombreInsumo()%></OPTION>
<%}}%>
</SELECT>
<!--input type=text name="insumo2" value = '<%--=insumo--%>' disabled="disabled"-->
</td>
</tr>
<tr>
<td>
Carga
</td>
<td>
<input name = "carga" type="type" value="<%=carga%>" />
</td>
</tr>
<tr>
<td>
Cantidad Insumo
</td>
<td>
<input name = "cantidadinsumo" type="type" value="<%=cantidad%>"/>
</td>
</tr>
<tr>
<td>
Unidad de Medida
</td>
<td>
<SELECT size=1 name=unidadmedida>
<OPTION VALUE=-1>SELECCIONE UNIDAD DE MEDIDA</OPTION>
<%ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();%>
<%ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();;
arrayUnidadMedida= manUnidadMedida.consultar();%>
<%Iterator itUnidadMedida= arrayUnidadMedida.iterator();%>
<%while (itUnidadMedida.hasNext())
{
UnidadMedida unidadMedida2 = (UnidadMedida) itUnidadMedida.next();
if (unidadmedida.equals(unidadMedida2.getCodigoUnidadMedida())){%>
<OPTION selected="selected" VALUE="<%=unidadMedida2.getCodigoUnidadMedida()%>"> <%=unidadMedida2.getNombreUnidadMedida()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=unidadMedida2.getCodigoUnidadMedida()%>"> <%=unidadMedida2.getNombreUnidadMedida()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaIngrediente.jsp&titulo=Listado Ingrediente&filproducto=<%=filproducto%>&filinsumo=<%=filinsumo%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
