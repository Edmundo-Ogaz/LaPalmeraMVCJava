<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilInformeCapturaProduccion.jsp">
<table border = 0>
<tr>
<td>
Código Orden Fabricación</td>
<td>
<input type=text name=filordenfabricacion value = '' size = 25 maxlength = 25></td>
</tr>
<!--tr>
<td>
Funcionario
</td>
<td>
<SELECT size=1 name=funcionario>
<OPTION VALUE="">Todos</OPTION-->
<%-- 
ArrayList<Funcionario> arrayFuncionario = new ArrayList<Funcionario>();
ManejadorFuncionario manFuncionario = new ManejadorFuncionario();
arrayFuncionario = manFuncionario.consultar();
Iterator itFuncionario = arrayFuncionario.iterator();
while (itFuncionario.hasNext())
    {
Funcionario funcionario = (Funcionario) itFuncionario.next();
--%>
<!--OPTION VALUE=<%--=funcionario.getRutFuncionario()--%>> <%--=funcionario.getNombreFuncionario()--%></OPTION-->
<%--}--%>
<!--/SELECT>
</td>
</tr-->
</table>
<input type=submit name=Enviar value = 'Buscar'>
<!--input type=submit name=Enviar value = 'Nueva Entrega de Insumos'-->
</form>
</body>
</html>
