<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filproducto = request.getParameter("filproducto");
String filinsumo = request.getParameter("filinsumo");
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

<form name = formulario action = "/LaPalmera/servlet/GrabaIngrediente" onSubmit="return validar(this)" target="_self">
<!--form name = formulario action = "/LaPalmera/jsp/Fin.jsp" onSubmit="return validar(this)" target="_self"-->
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<input type="hidden" name="filinsumo" value="<%=filinsumo%>"/>
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<SELECT size=1 name=producto>
<OPTION VALUE=-1>SELECCIONE PRODUCTO</OPTION>
<% 
ArrayList<Producto> arrayProducto = new ArrayList<Producto>();
ManejadorProducto manProducto  = new ManejadorProducto();
arrayProducto=manProducto.consultar();
Iterator itProducto = arrayProducto.iterator();
while (itProducto.hasNext())
    {
Producto producto = (Producto) itProducto.next();
%>
<OPTION VALUE=<%=producto.getCodigoProducto()%>> <%=producto.getNombreProducto()%></OPTION>
<%}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Insumo
</td>
<td>
<SELECT size=1 name=insumo>
<OPTION VALUE=-1>SELECCIONE INSUMO</OPTION>

<%--ManejadorProducto manProducto= new ManejadorProducto();
ArrayList<Producto> arrayProducto = new ArrayList<Producto>();
manProducto.setTipoProducto("S");
arrayProducto = manProducto.consultar();
Iterator itProducto = arrayProducto.iterator();
while (itProducto.hasNext())
{
Producto producto2= (Producto) itProducto.next();
--%>
<!--OPTION VALUE="<%--=producto2.getCodigoProducto()--%>"> <%--=producto2.getNombreProducto()--%></OPTION-->
<%--}--%>

<%
ArrayList<Insumo> arrayInsumo = new ArrayList<Insumo>();
ManejadorInsumo manInsumo  = new ManejadorInsumo();
arrayInsumo=manInsumo.consultar();
Iterator itInsumo = arrayInsumo.iterator();
while (itInsumo.hasNext())
    {
Insumo insumo = (Insumo) itInsumo.next();
%>
<OPTION VALUE=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></OPTION>
<%}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Carga
</td>
<td>
<input type="text" name="carga"  size = "1">
</td>
</tr>
<tr>
<td>
Cantidad Insumo
</td>
<td>
<input type="text" name="cantidadinsumo" size = "1">

<SELECT size=1 name=unidadmedida>
<OPTION VALUE=-1>SELECCIONE UNIDAD DE MEDIDA</OPTION>
<%ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();%>
<%ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();;
arrayUnidadMedida= manUnidadMedida.consultar();%>
<%Iterator itUnidadMedida= arrayUnidadMedida.iterator();%>
<%while (itUnidadMedida.hasNext())
{
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();%>
<OPTION VALUE="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaIngrediente.jsp&titulo=Listado Ingrediente&filproducto=<%=filproducto%>&filinsumo=<%=filinsumo%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilIngrediente.jsp&titulo=Filtrado Ingrediente','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>