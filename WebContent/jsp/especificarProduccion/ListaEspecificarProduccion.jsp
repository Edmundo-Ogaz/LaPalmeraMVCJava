<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
int i = 1;
OrdenFabricacion ordenFabricacion = new OrdenFabricacion();
DespachoPedido despachoPedido = new DespachoPedido(); 
%>
<html>
<head>
</head>
<body>
<form action = "/LaPalmera/jsp/ControlListaEspecificarProduccion.jsp">
<table border="1">
<tr>
<th>
Selec
</th>
<th>
Orden de Fabricación
</th>
<th>
Fecha Entrega
</th>
<th>
Hora Entrega 
</th>
<th>
Producto
</th>
<th>
Cantidad 
</th>
<th>
Linea Producción
</th>
<th>
Rut Funcionario
</th>
</tr>	
<%
ArrayList<ProgramaProduccion> arrayProgramaProduccion = new ArrayList<ProgramaProduccion>();
ManejadorProgramaProduccion manProgramaProduccion = new ManejadorProgramaProduccion();
manProgramaProduccion.setEstadoOrdenFabricacion("I");
arrayProgramaProduccion = manProgramaProduccion.consultar();
Iterator itProgramaProduccion = arrayProgramaProduccion.iterator();
while (itProgramaProduccion.hasNext())
 {
ProgramaProduccion programaProduccion= (ProgramaProduccion) itProgramaProduccion.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=programaProduccion.getCodigoOrdenFabricacion()%>>
</td>
<td width =150  align="right">
&nbsp;
<%=programaProduccion.getCodigoOrdenFabricacion()%>
</td>
<td>
&nbsp;

<%ordenFabricacion.setCodigoOrdenFabricacion(programaProduccion.getCodigoOrdenFabricacion());
if (ordenFabricacion.buscar()){
	despachoPedido.setNumeroPedido(ordenFabricacion.getNumeroPedido());
	if (despachoPedido.buscar()){
	out.print(despachoPedido.getFechaEntregaDespacho());
	}
}%>


<%--=programaProduccion.getFechaProgramaProduccion()--%>
<%--}--%>
</td>
<td>
&nbsp;

<%ordenFabricacion.setCodigoOrdenFabricacion(programaProduccion.getCodigoOrdenFabricacion());
if (ordenFabricacion.buscar()){
	despachoPedido.setNumeroPedido(ordenFabricacion.getNumeroPedido());
	if (despachoPedido.buscar()){
	out.print(despachoPedido.getHoraEntregaDespacho());
	}
}%>
<%--=programaProduccion.getHoraProgramaProduccion()--%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCodigoProducto()%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCantidadProgramada()%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCodigoLineaProduccion()%>
</td>
<td>
&nbsp;
<%=programaProduccion.getRutFuncionario()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Comuna'-->
<input type=submit name=Enviar value = 'Especificar Producción'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilEspecificarProduccion.jsp&titulo=Filtrado Especificar Producción','_self')">Volver</button>
</form>
</body>
</html>

