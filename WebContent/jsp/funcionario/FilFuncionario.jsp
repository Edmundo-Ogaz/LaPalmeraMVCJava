<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilFuncionario.jsp">
<table border = 0>
<tr>
<td>
Rut Funcionario</td>
<td>
<input type=text name=filrut value = '' size = 25 maxlength = 25></td>
</tr>
<tr>
<td>
Nombre Funcionario</td>
<td>
<input type=text name=filnombre value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Apellido Paterno Funcionario</td>
<td>
<input type=text name=filapellidopaterno value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Apellido Materno Funcionario</td>
<td>
<input type=text name=filapellidomaterno value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Cargo</td>
<td>
<% {
ArrayList<Cargo> arrayCargo= new ArrayList<Cargo>();
ManejadorCargo manCargo= new ManejadorCargo();
arrayCargo=manCargo.consultar();
%>
<SELECT size=1 name=filcargo>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itCargo= arrayCargo.iterator();
while (itCargo.hasNext())
    {
Cargo cargo= (Cargo) itCargo.next();%>
<OPTION VALUE=<%=cargo.getCodigoCargo()%>> <%=cargo.getNombreCargo()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
<tr>
<td>
Area</td>
<td>
<% {
ArrayList<Area> arrayArea= new ArrayList<Area>();
ManejadorArea manArea= new ManejadorArea();
arrayArea=manArea.consultar();
%>
<SELECT size=1 name=filarea>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itArea= arrayArea.iterator();
while (itArea.hasNext())
    {
Area area= (Area) itArea.next();%>
<OPTION VALUE=<%=area.getCodigoArea()%>> <%=area.getNombreArea()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nuevo Funcionario'>
</form>
</body>
</html>
