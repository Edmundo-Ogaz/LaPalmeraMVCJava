<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="ordenFabricacion" class="OrdenFabricacion" scope="session"/>
<%
String ordenfabricacion = request.getParameter("seleccion");
//String fecha = "";
//String hora = "";
//String numeropedido = "";
String producto = "";
String cantidad = "";

ordenFabricacion.setCodigoOrdenFabricacion(ordenfabricacion);
if (ordenFabricacion.buscar()){
//fecha = ordenFabricacion.getFechaIngresoOrdenFabricacion();
//hora = ordenFabricacion.getHoraIngresoOrdenFabricacion();
//numeropedido = ordenFabricacion.getNumeroPedido();
producto = ordenFabricacion.getCodigoProducto();
cantidad = ordenFabricacion.getCantidadProducto();
}
%>
<html>
<head>

<script>
<!--
function Validar() {
  
  if (document.pedido.lineaproduccion.value == -1) {
    alert("Elija la Linea de Producción.");
    document.pedido.lineaproduccion.focus();
    return (false);
  }
  
  /*if (document.pedido.funcionario.value == -1) {
    alert("Elija el Funcionario a Cargo.");
    document.pedido.funcionario.focus();
    return (false);
  }*/
   
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
<form name = "pedido" action = "/LaPalmera/servlet/GrabaProgramaProduccion" onSubmit="return Validar()" target="_self">
<input type="hidden" name="ordenfabricacion" value="<%=ordenfabricacion%>"/>
<input type="hidden" name="producto" value="<%=producto%>"/>
<input type="hidden" name="cantidadprogramada" value="<%=cantidad%>"/>
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
Producto
</td>
<td>
<SELECT size="1" name="producto2" disabled="disabled">
<OPTION VALUE=-1>PRODUCTO NO ENCONTRADO</OPTION>

<%ManejadorProducto manProducto= new ManejadorProducto();%>
<%ArrayList<Producto> arrayProducto = new ArrayList<Producto>();;
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
<input name = "cantidadprogramada2" type="type" value="<%=cantidad%>" disabled="disabled"/>
</td>
</tr>
<tr>
<td>
Linea Producción
</td>
<td>
<SELECT size=1 name=lineaproduccion>
<OPTION VALUE=-1>SELECCIONE LINEA PRODUCCIÓN</OPTION>
<%ManejadorLineaProduccion manLineaProduccion = new ManejadorLineaProduccion();%>
<%ArrayList<LineaProduccion> arrayLineaProduccion = new ArrayList<LineaProduccion>();;
arrayLineaProduccion = manLineaProduccion.consultar();%>
<%Iterator itLineaProduccion = arrayLineaProduccion.iterator();%>
<%while (itLineaProduccion.hasNext())
{
LineaProduccion lineaProduccion = (LineaProduccion) itLineaProduccion.next();%>
<OPTION VALUE="<%=lineaProduccion.getCodigoLineaProduccion()%>"> <%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}%>
</SELECT>
</td>
</tr>
<!--tr>
<td>
Funcionario
</td>
<td>
<SELECT size=1 name=funcionario>
<OPTION VALUE=-1>SELECCIONE FUNCIONARIO</OPTION-->
<%--
ArrayList<Funcionario> arrayFuncionario = new ArrayList<Funcionario>();;
ManejadorFuncionario manFuncionario = new ManejadorFuncionario();
arrayFuncionario = manFuncionario.consultar();
Iterator itFuncionario = arrayFuncionario.iterator();
while (itFuncionario.hasNext())
{
Funcionario funcionario= (Funcionario) itFuncionario.next();
--%>
<!--OPTION VALUE="<%--=funcionario.getRutFuncionario()--%>"> <%--=funcionario.getNombreFuncionario()--%></OPTION-->
<%--}--%>
<!--/SELECT>
</td>
</tr-->
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProgramaOrdenFabricacion.jsp&titulo=Orden Fabricación para Programar','_self')">Volver</button>
</form>
</body>
</html>
