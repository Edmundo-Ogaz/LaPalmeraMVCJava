<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
int i = 1;
String filordenfabricacion = request.getParameter("filordenfabricacion");
String filfechainicio = request.getParameter("filfechainicio");
String filfechatermino = request.getParameter("filfechatermino");
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
<input type="hidden" name="filfechainicio" value="<%=filfechainicio%>"/> 
<input type="hidden" name="filfechatermino" value="<%=filfechatermino%>"/> 
<input type="hidden" name="fillineaproduccion" value="<%=fillineaproduccion%>"/>
<input type="hidden" name="filestadoprograma" value="<%=filestadoprograma%>"/>
<table border="1">
<tr>
<th>
Selec
</th>
<th>
Ord.Fab.
</th>
<th>
N&uacute;mero Pedido
</th>
<th>
Fecha Entrega
</th>
<th>
Producto
</th>
<th>
L&iacute;nea Producción
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
Estado Ord.Fab.
</th>
</tr>	
<%
ArrayList<ProgramaProduccion> arrayProgramaProduccion = new ArrayList<ProgramaProduccion>();
ManejadorProgramaProduccion manProgramaProduccion = new ManejadorProgramaProduccion();

manProgramaProduccion.setCodigoOrdenFabricacion(filordenfabricacion);
manProgramaProduccion.setFechaInicio(filfechainicio);
manProgramaProduccion.setFechaTermino(filfechatermino);
manProgramaProduccion.setCodigoLineaProduccion(fillineaproduccion);
manProgramaProduccion.setEstadoOrdenFabricacion(filestadoprograma);
manProgramaProduccion.setEstadoOrdenFabricacion("A");
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
<td height="42">
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

