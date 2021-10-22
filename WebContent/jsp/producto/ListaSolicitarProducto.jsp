<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filnumeropedido= request.getParameter("filnumeropedido");
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
<table border="1">
<tr>
<th>
Selec
</th>
<th>
Número Pedido
</th>
<th>
Nombre cliente
</th>
<th>
Fecha Pedido
</th>
<th>
Hora Pedido
</th>
<th>
Observación Pedido
</th>
<th>
Dirección
</th>
<th>
Fecha Entrega
</th>
<th>
Hora Entrega
</th>
</tr>	
<%
if (!filnumeropedido.equals("")){
ArrayList<CabezaPedido> arrayCabezaPedido= new ArrayList<CabezaPedido>();
ManejadorCabezaPedido manCabezaPedido= new ManejadorCabezaPedido();
manCabezaPedido.setNumeroPedido(filnumeropedido);

arrayCabezaPedido= manCabezaPedido.consultar();
Iterator itCabezaPedido= arrayCabezaPedido.iterator();
while (itCabezaPedido.hasNext())
 {
CabezaPedido cabezaPedido= (CabezaPedido) itCabezaPedido.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=cabezaPedido.getNumeroPedido()%>>
</td>
<td>
&nbsp;
<%=cabezaPedido.getNumeroPedido()%>
</td>
<td>
&nbsp;
<%=cabezaPedido.getNombreCliente()%>
</td>
<td>
&nbsp;
<%=cabezaPedido.getFechaPedido()%>
</td>
<td>
&nbsp;
<%=cabezaPedido.getHoraPedido()%>
</td>
<td>
&nbsp;
<%=cabezaPedido.getObservacionPedido()%>
</td>
<%
DespachoPedido despachoPedido = new DespachoPedido();
despachoPedido.setNumeroPedido(cabezaPedido.getNumeroPedido());
if (despachoPedido.buscar()){
%>
<td>
&nbsp;
<%=despachoPedido.getDireccionDespacho()%>
</td>
<td>
&nbsp;
<%=despachoPedido.getObservacionPedido()%>
</td>
<td>
&nbsp;
<%=despachoPedido.getDireccionDespacho()%>
</td>
<%}%>
<td>
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
Cantidad Programada
</th>
<th>
Cantidad Fabricada
</th>
<th>
Saldo por Fabricar
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
programaProduccion.setOrdenFabricacion(ordenFabricacion.getOrdenFabricacion());
if (programaProduccion.Buscar()){
 %>
<tr>
<td>
&nbsp;
<%=programaProduccion.getOrdenFabricacion())%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCodigoProducto())%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCodigoLineaProduccion())%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCantidadProgramada())%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCantidadFabricada())%>
</td>
<td>
&nbsp;
<%=programaProduccion.getSaldoPorFabricar())%>
</td>
<td>
&nbsp;
<%=programaProduccion.getEstadoOrdenFabricacion())%>
</td>
</tr>
<%}%>
<%}%>
</table>
</td>
</tr>
<%}%>
<%}%>
</table>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoIngresoInsumo.jsp&titulo=Nuevo Ingreso Insumo&filproducto=<%=filproducto%>','_self')">Nuevo Ingreso Insumo</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilIngresoInsumo.jsp&titulo=Filtrado Ingreso de Insumos','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>


