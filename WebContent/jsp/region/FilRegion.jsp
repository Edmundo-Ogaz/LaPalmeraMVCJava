<%@page import="cl.laPalmera.Manejador.ManejadorRegion"%>
<%@page import="cl.laPalmera.DTO.RegionDTO"%>
<%@page import="java.util.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/region/ControlFilRegion.jsp">
<table border="0">
<tr>
<td>
Región</td>
<td>
<SELECT size=1 name=filregion> 
<OPTION VALUE="">TODOS</OPTION>
<% {
ArrayList<RegionDTO> arrayRegion= new ArrayList<RegionDTO>();
ManejadorRegion manRegion= new ManejadorRegion();
arrayRegion=manRegion.consultar();
%>

<%Iterator itRegion= arrayRegion.iterator();
while (itRegion.hasNext())
{
RegionDTO region= (RegionDTO) itRegion.next();
%>
<OPTION VALUE=<%=region.getCodigoRegion()%>> <%=region.getNombreRegion()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nueva Región'>
</form>
</body>
</html>
