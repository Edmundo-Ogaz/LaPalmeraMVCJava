<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
int i = 1;
String filordenfabricacion = request.getParameter("filordenfabricacion");
String fillineaproduccion = request.getParameter("fillineaproduccion");
String filestadoprograma = request.getParameter("filestadoprograma");
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
<form name="formulario" action = "/LaPalmera/jsp/ControlListaProgramaProduccion.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filordenfabricacion" value="<%=filordenfabricacion%>"/> 
<input type="hidden" name="fillineaproduccion" value="<%=fillineaproduccion%>"/>
<input type="hidden" name="filestadoprograma" value="<%=filestadoprograma%>"/>
<table border="1">
<tr>
<th>
Selec
</th>
<th>
O.F.
</th>
<th>
Numero Pedido
</th>
<th>
Fecha Entrega
</th>
<th>
Producto
</th>
<th>
Linea Producción
</th>
<!--th>
Rut Funcionario
</th-->
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
Estado Orden Fabricación
</th>
</tr>	
<%
ArrayList<ProgramaProduccion> arrayProgramaProduccion = new ArrayList<ProgramaProduccion>();
ManejadorProgramaProduccion manProgramaProduccion = new ManejadorProgramaProduccion();

manProgramaProduccion.setCodigoOrdenFabricacion(filordenfabricacion);
manProgramaProduccion.setCodigoLineaProduccion(fillineaproduccion);
manProgramaProduccion.setEstadoOrdenFabricacion(filestadoprograma);

arrayProgramaProduccion = manProgramaProduccion.listarPorFecha();
Iterator itProgramaProduccion = arrayProgramaProduccion.iterator();
while (itProgramaProduccion.hasNext())
 {
ProgramaProduccion programaProduccion= (ProgramaProduccion) itProgramaProduccion.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=programaProduccion.getCodigoOrdenFabricacion()%>>
</td>
<td>
&nbsp;
<%=programaProduccion.getCodigoOrdenFabricacion()%>
</td>
<td>
&nbsp;
<%=programaProduccion.getNumeroPedido()%>
</td>
<td>
&nbsp;
<%=programaProduccion.getFechaPedido()%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCodigoProducto()%>
</td>
<td>
&nbsp;
<%=programaProduccion.getCodigoLineaProduccion()%>
</td>
<!--td>
&nbsp;
<%--=programaProduccion.getRutFuncionario()--%>
</td-->
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
<%i++;}%>
</table>
<%
if (i == 1){
%>
<input type=submit name=Enviar value = 'Refrescar'>
<%}else{%>
<input type=submit name=Enviar value = 'Modificar Programa de Producción'>
<%}%>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilProgramaProduccion.jsp&titulo=Filtrado Programa Producción','_self')">Filtro</button>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
</form>
</body>
</html>

