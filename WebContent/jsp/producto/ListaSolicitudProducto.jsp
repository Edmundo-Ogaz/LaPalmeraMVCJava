<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filnumeropedido= request.getParameter("filnumeropedido");
String mensaje= request.getParameter("mensaje");
//String filnumeropedido = "6";
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
var j
var aux = 0;    
		
	if (typeof(document.formulario.seleccion.length) != "undefined"){
		for (j=0;j<document.formulario.seleccion.length;j++){
       		if (document.formulario.seleccion[j].checked){
	   	  		aux = 1;	
          		break;
    		}
		}
	}else{
		if (document.formulario.seleccion.checked){
		    aux = 1;
		}
	}
	if (aux == 0 ){ 
    	alert("Seleccione un Registro.");
    	return (false);
  	}
	
	var entrar = confirm("¿Desea continuar?")
    if ( !entrar )
  	  return (false);
    else
      return (true);
    
}
//-->
</script>
</head>
<body>
<form name = formulario action = "/LaPalmera/jsp/ControlListaSolicitudProducto.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filnumeropedido" value="<%=filnumeropedido%>"/> 
<%
if (!filnumeropedido.equals("")){
CabezaPedido cabezaPedido = new CabezaPedido();
cabezaPedido.setNumeroPedido(filnumeropedido);
if (cabezaPedido.buscar())
{
%>

<table border="0">
<tr>
<th>
Número Pedido</th>
<td>
&nbsp;
<%=cabezaPedido.getNumeroPedido()%></td>
</tr>
<tr>
<th>
Nombre Cliente</th>
<td>
&nbsp;
<%=cabezaPedido.getNombreCliente()%>
</td>
</tr>
<%
DespachoPedido despachoPedido = new DespachoPedido();
despachoPedido.setNumeroPedido(cabezaPedido.getNumeroPedido());
if (despachoPedido.buscar()){
%>
<tr>
<th>
Fecha Entrega</th>
<td>
&nbsp;
<%=despachoPedido.getFechaEntregaDespacho()%></td>
</tr>
<tr>
<th>
Hora Entrega</th>
<td>
&nbsp;
<%=despachoPedido.getHoraEntregaDespacho()%></td>
</tr>
<%}%>
</table>
<table border="1">
<tr>
<th>
Ord.Fab
</th>
<th>
Producto 
</th>
<th>
Linea Producción
</th>
<th>
Cant.Prog.
</th>
<th>
Cant.Fab.
</th>
<th>
SaldoXFab.
</th>
<th>
Estado
</th>
</tr>	
<%
ArrayList<OrdenFabricacion> arrayOrdenFabricacion = new ArrayList<OrdenFabricacion>();
ManejadorOrdenFabricacion manOrdenFabricacion = new ManejadorOrdenFabricacion();

manOrdenFabricacion.setNumeroPedido(cabezaPedido.getNumeroPedido());

arrayOrdenFabricacion= manOrdenFabricacion.consultar();
Iterator itOrdenFabricacion = arrayOrdenFabricacion.iterator();
while (itOrdenFabricacion.hasNext())
 {
OrdenFabricacion ordenFabricacion= (OrdenFabricacion) itOrdenFabricacion.next();
 %>
<%
ProgramaProduccion programaProduccion = new ProgramaProduccion();
programaProduccion.setCodigoOrdenFabricacion(ordenFabricacion.getCodigoOrdenFabricacion());
if (programaProduccion.buscar())
{
 %>
<tr>
<td>
&nbsp;
<%=programaProduccion.getCodigoOrdenFabricacion()%>
</td>
<td>
&nbsp;
<%
Producto producto = new Producto();
producto.setCodigoProducto(programaProduccion.getCodigoProducto());
if (producto.buscar())
{
  out.print(producto.getNombreProducto());
}
%> 
<%--=programaProduccion.getCodigoProducto()--%>
</td>
<td>
&nbsp;
<%
LineaProduccion lineaProduccion = new LineaProduccion();
lineaProduccion.setCodigoLineaProduccion(programaProduccion.getCodigoLineaProduccion());
if (lineaProduccion.buscar())
{
  out.print(lineaProduccion.getNombreLineaProduccion());
}
%>
<%--=programaProduccion.getCodigoLineaProduccion()--%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCantidadProgramada()%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCantidadFabricada()%>
</td>
<td>
&nbsp;
<%=programaProduccion.getSaldoPorFabricar()%>
</td>
<td>
&nbsp;
<%=programaProduccion.getEstadoOrdenFabricacion()%>
</td>
</tr>
<%}%>
<%}%>
</table>
<table>
<tr>
<td>
<font size="+1">Dedicatoria</font>
</td>
<td>
<table border="1" width="300" height="50">
<tr>
<td>
<!--textarea name="dedicatoria" rows="2" cols="55" disabled="disabled"-->
<%=cabezaPedido.getDedicatoriaPedido()%>
<!--/textarea-->
</td>
</tr>
</table>
</td>
</tr>
</table>
<table>
<tr>
<td>
<font size="+1">Comentario</font>
</td>
<td>
<table border="1" width="300" height="50">
<tr>
<td>
<!--textarea name="dedicatoria" rows="2" cols="55" disabled="disabled"-->
<%=cabezaPedido.getObservacionPedido()%>
<!--/textarea-->
</td>
</tr>
</table>
</td>
</tr>
</table>
<%}%>
<%}%>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevaSolicitudProducto.jsp&titulo=Nueva Solicitud Producto&filnumeropedido=<%=filnumeropedido%>','_self')">Nueva Solicitud Producto</button>
</form>
</body>
</html>
<%if (mensaje.length() > 0){%>
<script> alert("<%=mensaje%>"); </script>
<%}%>

