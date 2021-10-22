<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="fichaTecnica" class="FichaTecnica" scope="session"/>
<%
String filproducto = request.getParameter("filproducto");
String filconceptotecnico= request.getParameter("filconceptotecnico");
String productoconceptotecnico = request.getParameter("seleccion");
String producto = productoconceptotecnico.substring(0,productoconceptotecnico.indexOf("/"));
String conceptotecnico = productoconceptotecnico.substring(productoconceptotecnico.indexOf("/")+1,productoconceptotecnico.length());
String descripcion = "";

fichaTecnica.setCodigoProducto(producto);
fichaTecnica.setCodigoConceptoTecnico(conceptotecnico);
if (fichaTecnica.buscar()){
descripcion = fichaTecnica.getDescripcionFichaTecnica();
}
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.producto.value == -1) {
    alert("Escriba el Producto.");
    formulario.producto.focus();
    return (false);
  }
  if (formulario.conceptotecnico.value == -1) {
    alert("Escriba el Concepto Técnico.");
    formulario.conceptotecnico.focus();
    return (false);
  }
  if (formulario.descripcion.value.length < 1) {
    alert("Escriba la Descricción.");
    formulario.descripcion.focus();
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
<form name = formulario action = "/LaPalmera/servlet/ModificaFichaTecnica" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/>
<input type="hidden" name="filconceptotecnico" value="<%=filconceptotecnico%>"/>
<input type="hidden" name="producto" value="<%=producto%>"/>
<input type="hidden" name="conceptotecnico" value="<%=conceptotecnico%>"/>
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<input type=text name=producto2 value="<%=producto%>" disabled="disabled">
</td>
</tr>
<tr>
<td>
Concepto Técnico
</td>
<td>
<input type=text name=conceptotecnico2 value = '<%=conceptotecnico%>' disabled="disabled">
</td>
</tr>
<tr>
<td>
Descripción
</td>
<td>
<input type=text name=descripcion value = '<%=descripcion%>' size = 70 maxlength = 70>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaFichaTecnica.jsp&titulo=Listado Ficha Técnica&filproducto=<%=filproducto%>&filconceptotecnico=<%=filconceptotecnico%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
