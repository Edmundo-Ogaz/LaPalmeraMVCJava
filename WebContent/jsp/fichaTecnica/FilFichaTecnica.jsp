<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilFichaTecnica.jsp">
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<SELECT size=1 name=filproducto> 
<OPTION VALUE="">TODOS</OPTION>
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
<!--input type=text name=codigo value = '' size = 25 maxlength = 25-->
</td>
</tr>
<!--tr>
<td>
Nombre Comuna</td>
<td>
<input type=text name=nombre value = '' size = 70 maxlength = 70></td>
</tr-->
<tr>
<td>
Concepto Técnico
</td>
<td>
<SELECT size=1 name=filconceptotecnico> 
<OPTION VALUE="">TODOS</OPTION>
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
<!--input type=text name=nombre value = '' size = 70 maxlength = 70-->
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nueva Ficha Técnica'>
</form>
</body>
</html>
