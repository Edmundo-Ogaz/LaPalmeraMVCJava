<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.Subfamilia" %>
<%@ page import="unab.com.ManejadorSubfamilia" %>
<%
String familiaSel = request.getParameter("familiaSel"); %>
<SELECT size=1 name=subfamilia onchange="muestraCodigoProducto()">
<%
ArrayList<Subfamilia> arraySubfamilia = new ArrayList<Subfamilia>();
ManejadorSubfamilia manSubfamilia  = new ManejadorSubfamilia();
manSubfamilia.setCodigoFamilia(familiaSel);
arraySubfamilia=manSubfamilia.consultar();%>
<OPTION selected="selected" VALUE=-1>SELECCIONE SUBFAMILIA</OPTION>
<%
Iterator itSubfamilia = arraySubfamilia.iterator();
while (itSubfamilia.hasNext())
    {
	Subfamilia subfamilia = (Subfamilia) itSubfamilia.next();
%>
<OPTION VALUE='<%=subfamilia.getCodigoSubfamilia()%>'><%=subfamilia.getNombreSubfamilia()%></OPTION>
<%}%>
</SELECT>
<!--input type = hidden name = familiaSel value = "<%--=familiaSel--%>"-->
