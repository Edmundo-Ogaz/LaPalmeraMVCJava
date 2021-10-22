<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.DTO.ComunaDTO"%>
<%@page import="cl.laPalmera.Manejador.ManejadorComuna"%>
<%@page import="cl.laPalmera.DTO.CiudadDTO"%>
<%@page import="cl.laPalmera.Manejador.ManejadorCiudad"%>
<html>
<head>
</head>
<form action = "/LaPalmera/LaPalmera/jsp/comuna/ControlFilComuna.jsp">
<table border = 0>
<tr>
<td>
Comuna
</td>
<td>
<SELECT size=1 name=filcomuna> 
<OPTION VALUE="">TODOS</OPTION>
<% {
ArrayList<ComunaDTO> arrayComuna= new ArrayList<ComunaDTO>();
ManejadorComuna manComuna= new ManejadorComuna();
arrayComuna=manComuna.consultar();
%>

<%Iterator itComuna= arrayComuna.iterator();
while (itComuna.hasNext())
    {
ComunaDTO comuna= (ComunaDTO) itComuna.next();
%>
<OPTION VALUE=<%=comuna.getCodigoComuna()%>> <%=comuna.getNombreComuna()%></OPTION>
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
Ciudad</td>
<td>
<SELECT size=1 name=filciudad> 
<OPTION VALUE="">TODOS</OPTION>
<% {
ArrayList<CiudadDTO> arrayCiudad= new ArrayList<CiudadDTO>();
ManejadorCiudad manCiudad= new ManejadorCiudad();
arrayCiudad=manCiudad.consultar();
%>

<%Iterator itCiudad= arrayCiudad.iterator();
while (itCiudad.hasNext())
    {
CiudadDTO ciudad= (CiudadDTO) itCiudad.next();
%>
<OPTION VALUE=<%=ciudad.getCodigoCiudad()%>> <%=ciudad.getNombreCiudad()%></OPTION>
<%}}%>
</SELECT>
<!--input type=text name=nombre value = '' size = 70 maxlength = 70-->
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nueva Comuna'>
</form>
</body>
</html>
