<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%ProgramaProduccion programaProduccion = new ProgramaProduccion();%>
<html>
<head>
<%int i = 1;%>
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
  	}else{
  		return (true);   
	}
}
//-->
</script>
</head>
<body>
<form name = formulario action = "/LaPalmera/jsp/ControlListaProgramaOrdenFabricacion.jsp" onSubmit="return validar(this)" target="_self">
<table border="1">
<tr>
<th>
Selec
</th>
<th>
O.F.
</th>
<th>
Fecha O.F.
</th>
<th>
Hora O.F.
</th>
<th>
Número Pedido
</th>
<th>
Producto
</th>
<th>
Cantidad
</th>
</tr>	
<%
ArrayList<OrdenFabricacion> arrayOrdenFabricacion = new ArrayList<OrdenFabricacion>();
ManejadorOrdenFabricacion manOrdenFabricacion = new ManejadorOrdenFabricacion();
arrayOrdenFabricacion = manOrdenFabricacion.consultar();
Iterator itOrdenFabricacion = arrayOrdenFabricacion.iterator();
while (itOrdenFabricacion.hasNext())
 {
OrdenFabricacion ordenFabricacion= (OrdenFabricacion) itOrdenFabricacion.next();
 %>

<%programaProduccion.setCodigoOrdenFabricacion(ordenFabricacion.getCodigoOrdenFabricacion());
if (!programaProduccion.buscar()){%>
<tr>
<td>
<input type = radio name = seleccion value = <%=ordenFabricacion.getCodigoOrdenFabricacion()%>>
</td>
<td align="right">
&nbsp;
<%=ordenFabricacion.getCodigoOrdenFabricacion()%>
</td>
<td>
&nbsp;
<%=ordenFabricacion.getFechaIngresoOrdenFabricacion()%>
</td>
<td>
&nbsp;
<%=ordenFabricacion.getHoraIngresoOrdenFabricacion()%>
</td>
<td>
&nbsp;
<%=ordenFabricacion.getNumeroPedido()%>
</td>
<td>
&nbsp;
<%=ordenFabricacion.getCodigoProducto()%>
</td>
<td>
&nbsp;
<%=ordenFabricacion.getCantidadProducto()%>
</td>
</tr>
<%}%>
<%i++;}%>
</table>
<%
if (i == 1){
%>
<input type="submit" name=Enviar value = 'Refrescar'>
<%}else{%>
<input type="submit" name=Enviar value = 'Programar Orden Fabricación'>
<%}%>
<!--button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilPedido.jsp&titulo=Filtrado de Pedidos','_self')">Filtro</button-->
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
</form>
</body>
</html>

