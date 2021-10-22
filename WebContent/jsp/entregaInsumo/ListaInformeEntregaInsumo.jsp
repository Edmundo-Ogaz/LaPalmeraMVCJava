<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
int i = 1;
String filordenfabricacion = request.getParameter("filordenfabricacion");
String ordenfabricacion = request.getParameter("seleccion");
String producto = "";
String cantidadprogramada = "";
String cantidadfabricada = "";
String saldoporfabricar = "";
%>
<html>
<head>
</head>
<body>
<!--form action = "/LaPalmera/jsp/ControlListaEntregaInsumo.jsp"-->
<form>
<input type="hidden" name="filordenfabricacion" value="<%=filordenfabricacion%>"/>
<input type="hidden" name="ordenfabricacion" value="<%=ordenfabricacion%>"/>
<%
ProgramaProduccion programaProduccion = new ProgramaProduccion(); 
programaProduccion.setCodigoOrdenFabricacion(ordenfabricacion);
if (programaProduccion.buscar()){
producto = programaProduccion.getCodigoProducto();
cantidadprogramada = programaProduccion.getCantidadProgramada();
cantidadfabricada = programaProduccion.getCantidadFabricada();
saldoporfabricar = programaProduccion.getSaldoPorFabricar();
}
%>
<table border="0">
<tr>
<td>
Orden Fabricaci&oacute;n
</td>
<td>
<%=ordenfabricacion%>
</td>
</tr>
<tr>
<td>
Producto
</td>
<td>
<%
Producto producto2 = new Producto();
producto2.setCodigoProducto(producto);
if (producto2.buscar())
{
  out.print(producto2.getNombreProducto());
}
%> 
<%--=producto--%>
</td>
</tr>
<tr>
<td>
Cantidad Programada
</td>
<td>
<%=cantidadprogramada%>
</td>
</tr>
<tr>
<td>
Cantidad Fabricada
</td>
<td>
<%=cantidadfabricada%>
</td>
</tr>
<tr>
<td>
Saldo por Fabricar
</td>
<td>
<%=saldoporfabricar%>
</td>
</tr>
</table>
<table border="1">
<tr>
</tr>
<tr>
<!--th>
Selec
</th-->
<th>
Ord.Fab.
</th>
<th>
Fecha Entrega 
</th>
<th>
Hora Entrega 
</th>
<th>
Funcionario
</th>
<th>
Observaci&oacute;n
</th>
</tr>	
<%
ArrayList<EntregaInsumo> arrayEntregaInsumo= new ArrayList<EntregaInsumo>();
ManejadorEntregaInsumo manEntregaInsumo= new ManejadorEntregaInsumo();
manEntregaInsumo.setCodigoOrdenFabricacion(ordenfabricacion);
arrayEntregaInsumo= manEntregaInsumo.consultar();
Iterator itEntregaInsumo= arrayEntregaInsumo.iterator();
while (itEntregaInsumo.hasNext())
 {
EntregaInsumo entregaInsumo= (EntregaInsumo) itEntregaInsumo.next();
%>
<tr>
<!--td>
<input type = radio name = seleccion value = <%=entregaInsumo.getCorrelativoEntregaInsumo()%>>
</td-->
<td align="right">
&nbsp;
<%--=entregaInsumo.getCorrelativoEntregaInsumo()--%>
<%=entregaInsumo.getCodigoOrdenFabricacion()%>
</td>
<td>
&nbsp;
<%=entregaInsumo.getFechaEntregaInsumo()%>
</td>
<td>
&nbsp;
<%=entregaInsumo.getHoraEntregaInsumo()%>
</td>
<td>
&nbsp;
<%
Funcionario funcionario = new Funcionario();
funcionario.setRutFuncionario(entregaInsumo.getRutFuncionario());
if (funcionario.buscar())
{
  out.print(funcionario.getNombreFuncionario());
  out.print(" ");
  out.print(funcionario.getApellidoPaternoFuncionario());
  out.print(" ");
  out.print(funcionario.getApellidoMaternoFuncionario());
}
%>
<%--=entregaInsumo.getRutFuncionario()--%>
</td>
<td>
&nbsp;
<%=entregaInsumo.getObservacion()%>
</td>
<td>
<table border="1" width="100%">
<tr>
<th>
Insumo
</th>
<th>
Cantidad
</th>
<th>
U/M
</th>
</tr>
<%
ArrayList<DetalleEntregaInsumo> arrayDetalleEntregaInsumo= new ArrayList<DetalleEntregaInsumo>();
ManejadorDetalleEntregaInsumo manDetalleEntregaInsumo= new ManejadorDetalleEntregaInsumo();
manDetalleEntregaInsumo.setCorrelativoEntregaInsumo(entregaInsumo.getCorrelativoEntregaInsumo());
//manDetalleEntregaInsumo.setCorrelativoEntregaInsumo("5");
arrayDetalleEntregaInsumo= manDetalleEntregaInsumo.consultar();
Iterator itDetalleEntregaInsumo= arrayDetalleEntregaInsumo.iterator();
while (itDetalleEntregaInsumo.hasNext())
 {
DetalleEntregaInsumo detalleEntregaInsumo= (DetalleEntregaInsumo) itDetalleEntregaInsumo.next();
%>
<tr>
<td>
&nbsp;
<%
Insumo insumo= new Insumo();
insumo.setCodigoInsumo(detalleEntregaInsumo.getCodigoInsumo());
if (insumo.buscar())
{
  out.print(insumo.getNombreInsumo());
}
%>
<%--=detalleEntregaInsumo.getCodigoInsumo()--%>
</td>

<%if (Float.parseFloat(detalleEntregaInsumo.getCantidadEntregaInsumo()) < 1){%>
<td>
     <%=String.valueOf(Float.parseFloat(detalleEntregaInsumo.getCantidadEntregaInsumo())*1000)%>
</td>
<td>
<%    if (detalleEntregaInsumo.getCodigoUnidadMedida().equals("KGS")){
         out.print("GRS");
      }else{
	      if (detalleEntregaInsumo.getCodigoUnidadMedida().equals("LTS")){
             out.print("CM3");	 
}}%>
</td>	     
<%}else{%>
<td>
<%=detalleEntregaInsumo.getCantidadEntregaInsumo()%>
</td>
<td>
<%=detalleEntregaInsumo.getCodigoUnidadMedida()%>
</td>
<%}%>

<!--td>
&nbsp;
<%--=detalleEntregaInsumo.getCantidadEntregaInsumo()--%>
</td>
<td>
&nbsp;
<%--=detalleEntregaInsumo.getCodigoUnidadMedida()--%>
</td-->
</tr>
<%}%>
</table>
</td>
</tr>
<%i++;%>
<%}%>
<%
if (i == 1){
%>
<tr>
<td colspan="9">
<b>No tiene entrega de insumos esta orden de fabricacion</b>
<%}%>

</td>
</tr>

</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Entrega Insumos'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaOrdenFabricacionInformeEntregaInsumo.jsp&titulo=Lista Orden Fabricación&filordenfabricacion=<%=filordenfabricacion%>','_self')">Volver</button>
</form>
</body>
</html>
