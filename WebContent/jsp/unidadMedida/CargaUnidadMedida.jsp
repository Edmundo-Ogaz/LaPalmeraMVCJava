<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.Insumo" %>
<%@ page import="unab.com.UnidadMedida" %>
<%@ page import="unab.com.ManejadorUnidadMedida" %>
<%
String insumoSel = request.getParameter("insumo");
//String insumoSel = "I01C01001";
String unidadmedida = "";
Insumo insumo = new Insumo();
insumo.setCodigoInsumo(insumoSel);
if (insumo.buscar()){
unidadmedida = insumo.getCodigoUnidadMedida();
}
%>
<SELECT size=1 name=unidadmedida>
<!--OPTION VALUE=-1>UNIDAD MEDIDA</OPTION-->
<%
ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();
ManejadorUnidadMedida manUnidadMedida  = new ManejadorUnidadMedida();
manUnidadMedida.setCodigoUnidadMedida(unidadmedida);
arrayUnidadMedida=manUnidadMedida.consultar();
Iterator itUnidadMedida = arrayUnidadMedida.iterator();
while (itUnidadMedida.hasNext())
    {
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();
%>
<OPTION VALUE=<%=unidadMedida.getCodigoUnidadMedida()%>> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}%>
</SELECT>
