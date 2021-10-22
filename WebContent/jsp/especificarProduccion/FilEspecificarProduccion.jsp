<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilEspecificarProduccion.jsp">
<table border = 0>
<tr>
<td>
Código Orden Fabricación</td>
<td>
<input type=text name=codigo value = '' size = 25 maxlength = 25></td>
</tr>
<tr>
<td>
Linea de Producción
</td>
<td>
<% {
ArrayList<LineaProduccion> arrayLineaProduccion = new ArrayList<LineaProduccion>();
ManejadorLineaProduccion manLineaProduccion = new ManejadorLineaProduccion();
arrayLineaProduccion =manLineaProduccion.consultar();
%>
<SELECT size=1 name=lineaproduccion>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itLineaProduccion = arrayLineaProduccion.iterator();
while (itLineaProduccion.hasNext())
    {
LineaProduccion lineaProduccion = (LineaProduccion) itLineaProduccion.next();%>
<OPTION VALUE=<%=lineaProduccion.getCodigoLineaProduccion()%>> <%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Funcionario
</td>
<td>
<% {
ArrayList<Funcionario> arrayFuncionario = new ArrayList<Funcionario>();
ManejadorFuncionario manFuncionario = new ManejadorFuncionario();
arrayFuncionario = manFuncionario.consultar();
%>
<SELECT size=1 name=funcionario>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itFuncionario = arrayFuncionario.iterator();
while (itFuncionario.hasNext())
    {
Funcionario funcionario = (Funcionario) itFuncionario.next();%>
<OPTION VALUE=<%=funcionario.getRutFuncionario()%>> <%=funcionario.getNombreFuncionario()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<!--input type=submit name=Enviar value = 'Nuevo Programa de Producción'-->
</form>
</body>
</html>
