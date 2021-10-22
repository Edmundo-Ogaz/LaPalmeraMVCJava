<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filproducto = request.getParameter("filproducto");
String filconceptotecnico= request.getParameter("filconceptotecnico");
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
<form name = formulario action = "/LaPalmera/servlet/GrabaFichaTecnica" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/>
<input type="hidden" name="filconceptotecnico" value="<%=filconceptotecnico%>"/>
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<SELECT size=1 name=producto>
<OPTION VALUE=-1>SELECCIONE PRODUCTO</OPTION>
<% {
ArrayList<Producto> arrayProducto= new ArrayList<Producto>();
ManejadorProducto manProducto= new ManejadorProducto();
arrayProducto=manProducto.consultar();
%>

<%Iterator itProducto= arrayProducto.iterator();
while (itProducto.hasNext())
    {
Producto producto= (Producto) itProducto.next();
%>
<OPTION VALUE=<%=producto.getCodigoProducto()%>> <%=producto.getNombreProducto()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Concepto Técnico
</td>
<td>
<SELECT size=1 name=conceptotecnico>
<OPTION VALUE=-1>SELECCIONE CONCEPTOTECNICO</OPTION>
<% {
ArrayList<ConceptoTecnico> arrayConceptoTecnico= new ArrayList<ConceptoTecnico>();
ManejadorConceptoTecnico manConceptoTecnico= new ManejadorConceptoTecnico();
arrayConceptoTecnico=manConceptoTecnico.consultar();
%>

<%Iterator itConceptoTecnico= arrayConceptoTecnico.iterator();
while (itConceptoTecnico.hasNext())
    {
ConceptoTecnico conceptoTecnico= (ConceptoTecnico) itConceptoTecnico.next();
%>
<OPTION VALUE=<%=conceptoTecnico.getCodigoConceptoTecnico()%>> <%=conceptoTecnico.getNombreConceptoTecnico()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Descripción
</td>
<td>
<input type=text name=descripcion value = '' size = 70 maxlength = 70>
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaFichaTecnica.jsp&titulo=Listado Ficha Técnica&filproducto=<%=filproducto%>&filconceptotecnico=<%=filconceptotecnico%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilFichaTecnica.jsp&titulo=Filtrado Ficha Técnica','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>