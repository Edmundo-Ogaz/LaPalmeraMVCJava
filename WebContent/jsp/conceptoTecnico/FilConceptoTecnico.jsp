<%--@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" --%>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilConceptoTecnico.jsp">
<table border = 0>
<tr>
<td>
Código Concepto Ténico
</td>
<td>
<input type=text name=filcodigo value = '' size = 25 maxlength = 25>
</td>
</tr>
<tr>
<td>
Nombre Concepto Ténico
</td>
<td>
<input type=text name=filnombre value = '' size = 70 maxlength = 70></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nuevo Concepto Técnico'>
</form>
</body>
</html>
