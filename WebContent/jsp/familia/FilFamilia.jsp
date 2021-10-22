<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilFamilia.jsp">
<table border = 0>
<tr>
<td>
Código del Familia</td>
<td>
<input type=text name=filcodigo value = '' size = 25 maxlength = 25></td>
</tr>
<tr>
<td>
Nombre del Familia</td>
<td>
<input type=text name=filnombre value = '' size = 70 maxlength = 70></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nueva Familia'>
</form>
</body>
</html>
