<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="producto" class="Producto" scope="session"/>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
String filtipoproducto = request.getParameter("filtipoproducto");
String filfamilia = request.getParameter("filfamilia");
String filsubfamilia = request.getParameter("filsubfamilia");
String codigo = request.getParameter("seleccion");
String nombre = "";
String familia = "";
String subfamilia = "";
String otracaracteristica = "";
String unidadmedida = "";
String stockcritico = "";
String tipoproducto = "";
String valorcosto = "";
String valorventa = "";
String preparacion = "";
String foto = "";
String observacion = "";

producto.setCodigoProducto(codigo);
if (producto.buscar()){
nombre = producto.getNombreProducto();
familia = producto.getCodigoFamilia();
subfamilia = producto.getCodigoSubfamilia();
otracaracteristica = producto.getCodigoOtraCaracteristica();
unidadmedida = producto.getCodigoUnidadMedida();
stockcritico = producto.getStockCriticoProducto();
tipoproducto = producto.getTipoProducto();
valorcosto = producto.getValorCostoProducto();
valorventa = producto.getValorVentaProducto();
preparacion = producto.getPreparacionProducto();
foto = producto.getFotoProducto();
observacion = producto.getObservacionProducto();
}
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el nombre del producto.");
    formulario.nombre.focus();
    return (false);
  }
  if (formulario.otracaracteristica.value == -1) {
    alert("Escriba la Otra Caracteristica del Producto.");
    formulario.otracaracteristica.focus();
    return (false);
  }
  if (formulario.unidadmedida.value == -1) {
    alert("Escriba la Unidad de Medida del Producto.");
    formulario.unidadmedida.focus();
    return (false);
  }
  if (formulario.stockcritico.value.length < 1) {
    alert("Escriba el stok critico del producto.");
    formulario.stockcritico.focus();
    return (false);
  }
var checkOK = "0123456789";
  var checkStr = formulario.stockcritico.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0; i < checkStr.length; i++) {
    ch = checkStr.charAt(i);
    for (j = 0; j < checkOK.length; j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length) {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid) {
    alert("Escriba sólo números en el campo \"Stock Critico\".");
    formulario.stockcritico.focus();
    return (false);
  }
  if (!formulario.tipoproducto[0].checked){ 
   if (!formulario.tipoproducto[1].checked){
    alert("Escriba el Tipo de producto.");
    //formulario.tipoProducto.focus();
    return (false);
  }}
  
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
<form name = formulario action = "/LaPalmera/servlet/ModificaProducto" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filtipoproducto" value="<%=filtipoproducto%>"/> 
<input type="hidden" name="filfamilia" value="<%=filfamilia%>"/>
<input type="hidden" name="filsubfamilia" value="<%=filsubfamilia%>"/>
<input type="hidden" name="codigo" value="<%=codigo%>"/>
<input type="hidden" name="familia" value="<%=familia%>"/>
<input type="hidden" name="subfamilia" value="<%=subfamilia%>"/>
<table border = 0>
<tr>
<td>
Código del producto</td>
<td>
<input type=text name=codigo2 disabled="disabled" value="<%=codigo%>">
</td>
</tr>
<tr>
<td>
Nombre del producto</td>
<td>
<input type=text name=nombre value = '<%=nombre%>' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>Otras Caracter&iacute;sticas:</td>
<td><SELECT size="1" name="otracaracteristica">
<OPTION VALUE=-1>SELECCIONE OTRA CARACTERISTICA</OPTION>
<%ManejadorOtraCaracteristica manOtraCaracteristica = new ManejadorOtraCaracteristica();%>
<%ArrayList<OtraCaracteristica> arrayOtraCaracteristica = new ArrayList<OtraCaracteristica>();;
arrayOtraCaracteristica = manOtraCaracteristica.consultar();%>
<%Iterator itOtraCaracteristica = arrayOtraCaracteristica.iterator();%>

<%while (itOtraCaracteristica.hasNext())
{
OtraCaracteristica otraCaracteristica = (OtraCaracteristica) itOtraCaracteristica.next();
if (otracaracteristica.equals(otraCaracteristica.getCodigoOtraCaracteristica())){%>
<OPTION selected="selected" VALUE="<%=otraCaracteristica.getCodigoOtraCaracteristica()%>"> <%=otraCaracteristica.getNombreOtraCaracteristica()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=otraCaracteristica.getCodigoOtraCaracteristica()%>"> <%=otraCaracteristica.getNombreOtraCaracteristica()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
<tr>
<td>Unidad de medida</td>
<td><SELECT size="1" name="unidadmedida">
<OPTION VALUE=-1>SELECCIONE UNIDAD MEDIDA</OPTION>
<%ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();%>
<%ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();
arrayUnidadMedida = manUnidadMedida.consultar();%>
<%Iterator itUnidadMedida = arrayUnidadMedida.iterator();%>
<%while (itUnidadMedida.hasNext())
{
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();
if (unidadmedida.equals(unidadMedida.getCodigoUnidadMedida())){%>
<OPTION selected="selected" VALUE="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
<tr>
<td>Stock Cr&iacute;tico</td>
<td><input name = "stockcritico" type="type" value="<%=stockcritico%>" /></td>
</tr>
<tr>
<td>Producto Semielaborado</td>
<%if (tipoproducto.equals("S")){%>  
			<td>Semielaborado <input name="tipoproducto" type="radio" value="S" checked="checked" >
			Terminado <input name="tipoproducto" type="radio" value="T">
		</td>
		<%}else{%>
			<td>Semielaborado <input name="tipoproducto" type="radio" value="S">
			Terminado <input name="tipoproducto" type="radio" value="T" checked="checked">
		</td>
		<%}%>
</tr>
<tr>
<td>Valor Costo</td>
<td><input name = "valorcosto" type="type" value="<%=valorcosto%>" /></td>
</tr>
<tr>
<td>Valor Venta</td>
<td><input name = "valorventa" type="type" value="<%=valorventa%>" /></td>
</tr>
<tr>
<td valign="top">Preparaci&oacute;n</td>
<td colspan="3"><TEXTAREA name="preparacion" rows = 4 cols = 60><%=preparacion%></TEXTAREA></td>
</tr> 
<tr>
<td>
Dirección imagen del producto
</td>
<td>
<input name="foto" type=text value="<%=foto%>">
</td> 
</tr>
<tr>
<td valign="top">Observaci&oacute;n</td>
<td colspan="3"><TEXTAREA name="observacion" rows = 4 cols = 60><%=observacion%></TEXTAREA></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProducto.jsp&titulo=Listado Producto&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>&filtipoproducto=<%=filtipoproducto%>&filfamilia=<%=filfamilia%>&filsubfamilia=<%=filsubfamilia%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
