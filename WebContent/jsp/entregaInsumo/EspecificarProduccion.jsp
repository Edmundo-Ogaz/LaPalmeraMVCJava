<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
ProgramaProduccion programaProduccion = new ProgramaProduccion();
OrdenFabricacion ordenFabricacion = new OrdenFabricacion();
DespachoPedido despachoPedido = new DespachoPedido();
%>
<!--jsp:useBean id="programaProduccion" class="ProgramaProduccion" scope="session"/-->
<%
String ordenfabricacion = request.getParameter("seleccion");
String fecha = "";
String hora = "";
String producto = "";
String lineaproduccion = "";
String funcionario = "";
String cantidadprogramada = "";
String cantidadfabricada = "";
String saldoporfabricar = "";
String estadoordenfabricacion = "";

programaProduccion.setCodigoOrdenFabricacion(ordenfabricacion);
if (programaProduccion.buscar()){
fecha = programaProduccion.getFechaProgramaProduccion();
hora = programaProduccion.getHoraProgramaProduccion();
producto = programaProduccion.getCodigoProducto();
lineaproduccion = programaProduccion.getCodigoLineaProduccion();
funcionario = programaProduccion.getRutFuncionario();
cantidadprogramada = programaProduccion.getCantidadProgramada();
cantidadfabricada = programaProduccion.getCantidadFabricada();
saldoporfabricar = programaProduccion.getSaldoPorFabricar();
estadoordenfabricacion = programaProduccion.getEstadoOrdenFabricacion();
}
%>
<html>
<head>

<script>
<!--
function ValidaEntrada() {
  
  if (document.pedido.lineaproduccion.value == -1) {
    alert("Elija la Linea de Producción.");
    document.pedido.lineaproduccion.focus();
    return (false);
  }
  
  if (document.pedido.funcionario.value == -1) {
    alert("Elija el Funcionario a Cargo.");
    document.pedido.funcionario.focus();
    return (false);
  }
   
  var entrar = confirm("¿Desea Continuar?")
  if ( !entrar )
      return (false);
	else
	  return (true);
}
//-->
</script>

</head>
<body>
<form name = "pedido" action = "/LaPalmera/servlet/GrabaEspecificarProduccion" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="ordenfabricacion" value="<%=ordenfabricacion%>"/>
<input type="hidden" name="fecha" value="<%=fecha%>"/>
<input type="hidden" name="hora" value="<%=hora%>"/>
<input type="hidden" name="producto" value="<%=producto%>"/>
<!--input type="hidden" name="lineaproduccion" value="<%--=lineaproduccion--%>"/-->
<!--input type="hidden" name="funcionario" value="<%--=funcionario--%>"/-->
<input type="hidden" name="cantidadprogramada" value="<%=cantidadprogramada%>"/>
<input type="hidden" name="cantidadfabricada" value="<%=cantidadfabricada%>"/>
<input type="hidden" name="saldoporfabricar" value="<%=saldoporfabricar%>"/>
<input type="hidden" name="estadoordenfabricacion" value="<%=estadoordenfabricacion%>"/>

<table border = 0>
<tr>
<td>
Orden Fabricación
</td>
<td>
<input type=text name="ordenfabricacion2" value="<%=ordenfabricacion%>" disabled="disabled">
</td>
</tr>
<tr>
<td>
Fecha Entrega Producto
</td>
<td>
<%ordenFabricacion.setCodigoOrdenFabricacion(ordenfabricacion);
if (ordenFabricacion.buscar()){
	despachoPedido.setNumeroPedido(ordenFabricacion.getNumeroPedido());
	if (despachoPedido.buscar()){%>
	<input type=text name="fechaentrega" value="<%=despachoPedido.getFechaEntregaDespacho()%>" disabled="disabled">
<%}}%>

</td>
</tr>
<tr>
<td>
Hora Entrega Producto
</td>
<td>
<%ordenFabricacion.setCodigoOrdenFabricacion(ordenfabricacion);
if (ordenFabricacion.buscar()){
	despachoPedido.setNumeroPedido(ordenFabricacion.getNumeroPedido());
	if (despachoPedido.buscar()){%>
	<input type=text name="horaentrega" value="<%=despachoPedido.getHoraEntregaDespacho()%>" disabled="disabled">
<%}}%>
<!--input type=text name="hora" value="<%--=hora--%>" disabled="disabled"-->
</td>
</tr>
<tr>
<td>
Producto
</td>
<td>
<SELECT size="1" name="producto2" disabled="disabled">
<OPTION VALUE=-1>PRODUCTO NO ENCONTRADO</OPTION>

<%ManejadorProducto manProducto= new ManejadorProducto();%>
<%ArrayList<Producto> arrayProducto = new ArrayList<Producto>();;
manProducto.setCodigoProducto(producto);
arrayProducto = manProducto.consultar();%>
<%Iterator itProducto = arrayProducto.iterator();%>
<%while (itProducto.hasNext())
{
Producto producto2= (Producto) itProducto.next();
if (producto.equals(producto2.getCodigoProducto())){%>
<OPTION selected="selected" VALUE="<%=producto2.getCodigoProducto()%>"> <%=producto2.getNombreProducto()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=producto2.getCodigoProducto()%>"> <%=producto2.getNombreProducto()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Cantidad
</td>
<td>
<%--programaProduccion.setCodigoOrdenFabricacion(ordenfabricacion);
if (programaProduccion.buscar()){
	out.print(programaProduccion.getCantidadProgramada());
}--%>
<input name = "cantidadprogramada2" type="type" value="<%=cantidadprogramada%>" disabled="disabled"/>
</td>
</tr>
<tr>
<td>
Linea Producción
</td>
<td>
<SELECT size=1 name="lineaproduccion">
<OPTION VALUE="-1">SELECCIONE LINEA PRODUCCIÓN</OPTION>
<%ManejadorLineaProduccion manLineaProduccion = new ManejadorLineaProduccion();%>
<%ArrayList<LineaProduccion> arrayLineaProduccion = new ArrayList<LineaProduccion>();;
arrayLineaProduccion = manLineaProduccion.consultar();%>
<%Iterator itLineaProduccion = arrayLineaProduccion.iterator();%>
<%while (itLineaProduccion.hasNext())
{
LineaProduccion lineaProduccion = (LineaProduccion) itLineaProduccion.next();
if (lineaproduccion.equals(lineaProduccion.getCodigoLineaProduccion())){%>
<OPTION selected="selected" VALUE="<%=lineaProduccion.getCodigoLineaProduccion()%>"> <%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=lineaProduccion.getCodigoLineaProduccion()%>"> <%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Funcionario
</td>
<td>
<SELECT size=1 name="funcionario">
<OPTION VALUE="-1">SELECCIONE FUNCIONARIO</OPTION>
<%ManejadorFuncionario manFuncionario = new ManejadorFuncionario();%>
<%ArrayList<Funcionario> arrayFuncionario = new ArrayList<Funcionario>();;
arrayFuncionario = manFuncionario.consultar();%>
<%Iterator itFuncionario = arrayFuncionario.iterator();%>
<%while (itFuncionario.hasNext())
{
Funcionario funcionario2 = (Funcionario) itFuncionario.next();
if (funcionario.equals(funcionario2.getRutFuncionario())){%>
<OPTION selected="selected" VALUE="<%=funcionario2.getRutFuncionario()%>"> <%=funcionario2.getNombreFuncionario()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=funcionario2.getRutFuncionario()%>"> <%=funcionario2.getNombreFuncionario()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
</form>
</body>
</html>
