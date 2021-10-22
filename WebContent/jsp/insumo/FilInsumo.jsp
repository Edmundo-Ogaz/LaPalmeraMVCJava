<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilInsumo.jsp">
<table border = 0>
<tr>
<td>
Código del Insumo</td>
<td>
<input type=text name=filcodigo value = '' size = 25 maxlength = 25></td>
</tr>
<tr>
<td>
Nombre del Insumo</td>
<td>
<input type=text name=filnombre value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Unidad Medida
</td>
<td>
<% {
ArrayList<UnidadMedida> arrayUnidadMedida= new ArrayList<UnidadMedida>();
ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();
arrayUnidadMedida=manUnidadMedida.consultar();
%>
<SELECT size=1 name=filunidadmedida>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itUnidadMedida= arrayUnidadMedida.iterator();
while (itUnidadMedida.hasNext())
    {
UnidadMedida unidadMedida= (UnidadMedida) itUnidadMedida.next();%>
<OPTION VALUE=<%=unidadMedida.getCodigoUnidadMedida()%>> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nuevo Insumo'>
</form>
</body>
</html>
