<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilCiudad.jsp">
<table border = 0>
<tr>
<td>
Ciudad</td>
<td>
<SELECT size=1 name=filciudad> 
<OPTION VALUE="">TODOS</OPTION>
<% {
ArrayList<Ciudad> arrayCiudad= new ArrayList<Ciudad>();
ManejadorCiudad manCiudad= new ManejadorCiudad();
arrayCiudad=manCiudad.consultar();
%>

<%Iterator itCiudad= arrayCiudad.iterator();
while (itCiudad.hasNext())
    {
Ciudad ciudad= (Ciudad) itCiudad.next();
%>
<OPTION VALUE=<%=ciudad.getCodigoCiudad()%>> <%=ciudad.getNombreCiudad()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Región
</td>
<td>
<SELECT size=1 name=filregion> 
<OPTION VALUE="">TODOS</OPTION>
<% {
ArrayList<Region> arrayRegion= new ArrayList<Region>();
ManejadorRegion manRegion= new ManejadorRegion();
arrayRegion=manRegion.consultar();
%>

<%Iterator itRegion= arrayRegion.iterator();
while (itRegion.hasNext())
    {
Region region= (Region) itRegion.next();
%>
<OPTION VALUE=<%=region.getCodigoRegion()%>> <%=region.getNombreRegion()%></OPTION>
<%}}%>
</SELECT>
<!--input type=text name=nombre value = '' size = 70 maxlength = 70-->
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nueva Ciudad'>
</form>
</body>
</html>
