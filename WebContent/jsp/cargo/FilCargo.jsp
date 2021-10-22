<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilCargo.jsp">
<table border = 0>
<tr>
<td>
Cargo</td>
<td>
<SELECT size=1 name=filcargo> 
<OPTION VALUE="">TODOS</OPTION>
<% {
ArrayList<Cargo> arrayCargo= new ArrayList<Cargo>();
ManejadorCargo manCargo= new ManejadorCargo();
arrayCargo=manCargo.consultar();
%>

<%Iterator itCargo= arrayCargo.iterator();
while (itCargo.hasNext())
    {
Cargo cargo= (Cargo) itCargo.next();
%>
<OPTION VALUE=<%=cargo.getCodigoCargo()%>> <%=cargo.getNombreCargo()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nuevo Cargo'>
</form>
</body>
</html>
