<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilArea.jsp">
<table border = 0>
<tr>
<td>
Area
</td>
<td>
<SELECT size=1 name=filarea> 
<OPTION VALUE="">TODOS</OPTION>
<% {
ArrayList<Area> arrayArea= new ArrayList<Area>();
ManejadorArea manArea= new ManejadorArea();
arrayArea=manArea.consultar();
%>

<%Iterator itArea= arrayArea.iterator();
while (itArea.hasNext())
    {
Area area= (Area) itArea.next();
%>
<OPTION VALUE=<%=area.getCodigoArea()%>> <%=area.getNombreArea()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nueva Area'>
</form>
</body>
</html>
