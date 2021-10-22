<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
int i = 1;
String filnumeropedido = request.getParameter("filnumeropedido");
String filcliente = request.getParameter("filcliente");
String filfechainicio = request.getParameter("filfechainicio");
String filfechatermino = request.getParameter("filfechatermino");
String filestadopedido = request.getParameter("filestadopedido");
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
  	}else{
  		return (true);   
	}
}
//-->
</script>
</head>
<body>
<form name = formulario action = "/LaPalmera/jsp/ControlListaPedido.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filnumeropedido" value="<%=filnumeropedido%>"/> 
<input type="hidden" name="filcliente" value="<%=filcliente%>"/>
<input type="hidden" name="filfechainicio" value="<%=filfechainicio%>"/>
<input type="hidden" name="filfechatermino" value="<%=filfechatermino%>"/>
<input type="hidden" name="filestadopedido" value="<%=filestadopedido%>"/>
<table border = 1>
<th>
Selec
</th>
<th>
N&uacute;mero de Pedido
</th>
<th>
Nombre
</th>
<th>
Fecha Pedido
</th>
<th>
Hora de Pedido
</th>
<th>
Precio Total
</th>
<th>
Estado Pedido
</th>
<th>
Observaci&oacute;n
</th>
<%
ArrayList<CabezaPedido> arrayCabezaPedido= new ArrayList<CabezaPedido>();
ManejadorCabezaPedido manCabezaPedido = new ManejadorCabezaPedido();
manCabezaPedido.setNumeroPedido(filnumeropedido);
manCabezaPedido.setNombreCliente(filcliente);
manCabezaPedido.setFechaInicio(filfechainicio);
manCabezaPedido.setFechaTermino(filfechatermino);
manCabezaPedido.setConfirmacionPedido(filestadopedido);

arrayCabezaPedido= manCabezaPedido.consultar();
Iterator itCabezaPedido = arrayCabezaPedido.iterator();
while (itCabezaPedido.hasNext())
 {
CabezaPedido cabezaPedido = (CabezaPedido) itCabezaPedido.next();
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
<%=cabezaPedido.getPrecioTotalPedido()%>
</td>
<td>
&nbsp;
<%=cabezaPedido.getConfirmacionPedido()%>
</td>
<td>
&nbsp;
<%=cabezaPedido.getObservacionPedido()%>
</td>
</tr>
<%i++;}%>
</table>
<%
if (i == 1){
%>
<input type=submit name=Enviar value = 'Refrescar'>
<%}else{%>
<input type=submit name=Enviar value = 'Consultar Pedido'>
<%}%>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilPedido.jsp&titulo=Filtrado de Pedidos','_self')">Filtro</button>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
</form>
</body>
</html>

