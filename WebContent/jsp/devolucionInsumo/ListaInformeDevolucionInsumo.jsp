<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
//HttpSession session = request.getSession();
//session.invalidate();
//session.removeAttribute("arrayIngredienteDevolucion");
%>
<%
int i = 1;
String filordenfabricacion = request.getParameter("filordenfabricacion");
//String filfuncionario = request.getParameter("filfuncionario");
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
<!--form action = "/LaPalmera/jsp/ControlListaDevolucionInsumo.jsp"-->
<form>
<input type="hidden" name="filordenfabricacion" value="<%=filordenfabricacion%>"/>
<!--input type="hidden" name="filfuncionario" value="<%--=filfuncionario--%>"/-->
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
Producto producto2= new Producto();
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
<th>
Ord.Fab.
</th>
<th>
Fecha Devolución
</th>
<th>
Hora Devolución
</th>
<th>
Funcionario
</th>
<th>
Observaci&oacute;n
</th>
<th>
</th>
</tr>	
<%
ArrayList<DevolucionInsumo> arrayDevolucionInsumo= new ArrayList<DevolucionInsumo>();
ManejadorDevolucionInsumo manDevolucionInsumo= new ManejadorDevolucionInsumo();
manDevolucionInsumo.setCodigoOrdenFabricacion(ordenfabricacion);
arrayDevolucionInsumo= manDevolucionInsumo.consultar();
Iterator itDevolucionInsumo= arrayDevolucionInsumo.iterator();
while (itDevolucionInsumo.hasNext())
 {
DevolucionInsumo devolucionInsumo= (DevolucionInsumo) itDevolucionInsumo.next();
%>
<tr>
<td align="right">
&nbsp;
<%=devolucionInsumo.getCodigoOrdenFabricacion()%>
</td>
<td>
&nbsp;
<%=devolucionInsumo.getFechaDevolucionInsumo()%>
</td>
<td>
&nbsp;
<%=devolucionInsumo.getHoraDevolucionInsumo()%>
</td>
<td>
&nbsp;
<%
Funcionario funcionario= new Funcionario();
funcionario.setRutFuncionario(devolucionInsumo.getRutFuncionario());
if (funcionario.buscar())
{
  out.print(funcionario.getNombreFuncionario());
  out.print(" ");
  out.print(funcionario.getApellidoPaternoFuncionario());
  out.print(" ");
  out.print(funcionario.getApellidoMaternoFuncionario());
}
%> 
<%--=devolucionInsumo.getRutFuncionario()--%>
</td>
<td>
&nbsp;
<%=devolucionInsumo.getObservacion()%>
</td>
<td>

<table border="1">
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
ArrayList<DetalleDevolucionInsumo> arrayDetalleDevolucionInsumo = new ArrayList<DetalleDevolucionInsumo>();
ManejadorDetalleDevolucionInsumo manDetalleDevolucionInsumo = new ManejadorDetalleDevolucionInsumo();
manDetalleDevolucionInsumo.setCorrelativoDevolucionInsumo(devolucionInsumo.getCorrelativoDevolucionInsumo());
arrayDetalleDevolucionInsumo= manDetalleDevolucionInsumo.consultar();
Iterator itDetalleDevolucionInsumo= arrayDetalleDevolucionInsumo.iterator();
while (itDetalleDevolucionInsumo.hasNext())
 {
DetalleDevolucionInsumo detalleDevolucionInsumo= (DetalleDevolucionInsumo) itDetalleDevolucionInsumo.next();
%>
<tr>
<td>
&nbsp;
<%
Insumo insumo= new Insumo();
insumo.setCodigoInsumo(detalleDevolucionInsumo.getCodigoInsumo());
if (insumo.buscar())
{
  out.print(insumo.getNombreInsumo());
}
%> 
<%--=detalleDevolucionInsumo.getCodigoInsumo()--%>
</td>

<%if (Float.parseFloat(detalleDevolucionInsumo.getCantidadDevolucionInsumo()) < 1){%>
<td>
     <%=String.valueOf(Float.parseFloat(detalleDevolucionInsumo.getCantidadDevolucionInsumo())*1000)%>
</td>
<td>
<%    if (detalleDevolucionInsumo.getCodigoUnidadMedida().equals("KGS")){
         out.print("GRS");
      }else{
	      if (detalleDevolucionInsumo.getCodigoUnidadMedida().equals("LTS")){
             out.print("CM3");	 
}}%>
</td>	     
<%}else{%>
<td>
<%=detalleDevolucionInsumo.getCantidadDevolucionInsumo()%>
</td>
<td>
<%=detalleDevolucionInsumo.getCodigoUnidadMedida()%>
</td>
<%}%>

<!--td>
&nbsp;
<%--=detalleDevolucionInsumo.getCantidadDevolucionInsumo()--%>
</td>
<td>
&nbsp;
<%--=detalleDevolucionInsumo.getCodigoUnidadMedida()--%>
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
<b>No tiene devoluci&oacute;n esta orden de fabricación</b>
<%}%>

</td>
</tr>

</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Devolución Insumos'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaOrdenFabricacionInformeDevolucionInsumo.jsp&titulo=Lista Orden Fabricación&filordenfabricacion=<%=filordenfabricacion%>','_self')">Volver</button>
</form>
</body>
</html>

