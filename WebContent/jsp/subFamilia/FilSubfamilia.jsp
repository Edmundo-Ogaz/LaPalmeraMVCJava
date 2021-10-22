<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<html>
<head>
</head>
<form action = "/LaPalmera/jsp/ControlFilSubfamilia.jsp">
<table border = 0>
<tr>
<td>
Código Subfamilia
</td>
<td>
<input type=text name=filcodigo value = '' size = 25 maxlength = 25></td>
</tr>
<tr>
<td>
Nombre Subfamilia
</td>
<td>
<input type=text name=filnombre value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Familia
</td>
<td>
<% {
ArrayList<Familia> arrayFamilia= new ArrayList<Familia>();
ManejadorFamilia manFamilia= new ManejadorFamilia();
arrayFamilia=manFamilia.consultar();
%>
<SELECT size=1 name=filfamilia>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itFamilia= arrayFamilia.iterator();
while (itFamilia.hasNext())
    {
Familia familia= (Familia) itFamilia.next();%>
<OPTION VALUE=<%=familia.getCodigoFamilia()%>> <%=familia.getNombreFamilia()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nueva Subfamilia'>
</form>
</body>
</html>
