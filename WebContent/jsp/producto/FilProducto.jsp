<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilProducto.jsp">
<table border = 0>
<tr>
<td>
Código del producto</td>
<td>
<input type=text name=filcodigo value = '' size = 25 maxlength = 25></td>
</tr>
<tr>
<td>
Nombre del producto</td>
<td>
<input type=text name=filnombre value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Tipo
</td>
<td>
<select size=1 name=filtipoproducto>
  <option value="">Todos</option>
  <option value="S">SemiElaborado</option>
  <option value="T">Terminado</option>
</select>
</td>
</tr>
<tr>
<td>
Familia</td>
<td>
<% {
ArrayList<Familia> arrayFamilia = new ArrayList<Familia>();
ManejadorFamilia manFamilia  = new ManejadorFamilia();
arrayFamilia=manFamilia.consultar();
%>
<SELECT size=1 name=filfamilia>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itFamilia = arrayFamilia.iterator();
while (itFamilia.hasNext())
    {
Familia familia = (Familia) itFamilia.next();%>
<OPTION VALUE=<%=familia.getCodigoFamilia()%>> <%=familia.getNombreFamilia()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
<tr>
<td>
SubFamilia</td>
<td>
<% {
ArrayList<Subfamilia> arraySubfamilia = new ArrayList<Subfamilia>();
ManejadorSubfamilia manSubfamilia  = new ManejadorSubfamilia();
arraySubfamilia=manSubfamilia.consultar();
%>
<SELECT size=1 name=filsubfamilia>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itSubfamilia = arraySubfamilia.iterator();
while (itSubfamilia.hasNext())
    {
Subfamilia subfamilia = (Subfamilia) itSubfamilia.next();%>
<OPTION VALUE=<%=subfamilia.getCodigoSubfamilia()%>> <%=subfamilia.getNombreSubfamilia()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nuevo Producto'>
</form>
</body>
</html>
