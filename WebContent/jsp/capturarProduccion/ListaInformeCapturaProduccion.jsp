<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
//HttpSession session = request.getSession();
//session.invalidate();
//session.removeAttribute("arrayFuncionario");
%>
<%
int i = 1;
String filordenfabricacion = request.getParameter("filordenfabricacion");
String ordenfabricacion = request.getParameter("seleccion");
String producto = "";
String cantidadprogramada = "";
String cantidadfabricada = "";
String saldoporfabricar = "";
%>
<html>
<head>
<!--script language="JavaScript"-->
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
<!--/script-->
</head>
<body>
<!-form name="formulario" action = "/LaPalmera/jsp/ControlListaCapturaProduccion.jsp" onSubmit="return validar(this)" target="_self"-->
<!--form action = "/LaPalmera/jsp/ControlListaCapturaProduccion.jsp"-->
<form>
<input type="hidden" name="filordenfabricacion" value="<%=filordenfabricacion%>"/>
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
Producto producto2 = new Producto();
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
</tr>
<tr>
<!--th>
Selec
</th-->
<th>
Ord.Fab.
</th>
<th>
Fecha Captura 
</th>
<th>
Hora Captura 
</th>
<th>
Producto
</th>
<th>
Cantidad
</th>
<th>
Observaci&oacute;n
</th>
<th>
Funcionario
</th>
</tr>	
<%
ArrayList<CapturaProduccion> arrayCapturaProduccion= new ArrayList<CapturaProduccion>();
ManejadorCapturaProduccion manCapturaProduccion= new ManejadorCapturaProduccion();
manCapturaProduccion.setCodigoOrdenFabricacion(ordenfabricacion);
arrayCapturaProduccion= manCapturaProduccion.consultar();
Iterator itCapturaProduccion= arrayCapturaProduccion.iterator();
while (itCapturaProduccion.hasNext())
 {
CapturaProduccion capturaProduccion= (CapturaProduccion) itCapturaProduccion.next();
%>
<tr>
<!--td>
<input type = radio name = seleccion value = <%--=capturaProduccion.getCorrelativoProduccion()--%>>
</td-->
<td align="right">
&nbsp;
<%=capturaProduccion.getCodigoOrdenFabricacion()%>
</td>
<td>
&nbsp;
<%=capturaProduccion.getFechaCapturaProduccion()%>
</td>
<td>
&nbsp;
<%=capturaProduccion.getHoraCapturaProduccion()%>
</td>
<td>
&nbsp;
<%
Producto producto3 = new Producto();
producto3.setCodigoProducto(capturaProduccion.getCodigoProducto());
if (producto3.buscar())
{
  out.print(producto3.getNombreProducto());
}
%>
<%--=capturaProduccion.getCodigoProducto()--%>
</td>
<td>
&nbsp;
<%=capturaProduccion.getCantidadProducto()%>
</td>
<td>
&nbsp;
<%=capturaProduccion.getObservacion()%>
</td>
<td>
<table border="1" width="100%">
<%
ArrayList<ProduccionFuncionario> arrayProduccionFuncionario= new ArrayList<ProduccionFuncionario>();
ManejadorProduccionFuncionario manProduccionFuncionario= new ManejadorProduccionFuncionario();
manProduccionFuncionario.setCorrelativoProduccion(capturaProduccion.getCorrelativoProduccion());
//manDetalleEntregaInsumo.setCorrelativoEntregaInsumo("5");
arrayProduccionFuncionario= manProduccionFuncionario.consultar();
Iterator itProduccionFuncionario= arrayProduccionFuncionario.iterator();
while (itProduccionFuncionario.hasNext())
 {
ProduccionFuncionario produccionFuncionario= (ProduccionFuncionario) itProduccionFuncionario.next();
%>
<tr>
<td>
&nbsp;
<%
Funcionario funcionario = new Funcionario();
funcionario.setRutFuncionario(produccionFuncionario.getRutFuncionario());
if (funcionario.buscar())
{
  out.print(funcionario.getNombreFuncionario());
  out.print(" ");
  out.print(funcionario.getApellidoPaternoFuncionario());
  out.print(" ");  
  out.print(funcionario.getApellidoMaternoFuncionario());  
}
%>
<%--=produccionFuncionario.getRutFuncionario()--%>
</td>
</tr>
<%}%>
</table>
</td>
</tr>
<%i++;}%>
<%
if (i == 1){
%>
<tr>
<td colspan="9">
<b>No tiene Captura de productos para esta orden de fabricacion</b>
<%}%>
</td>
</tr>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Modificar'-->
<!--button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=CapturaProduccion.jsp&titulo=Nueva Captura Producción&filordenfabricacion=<%=filordenfabricacion%>&ordenfabricacion=<%=ordenfabricacion%>','_self')">Nueva Captura Producción</button-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaOrdenFabricacionInformeCapturaProduccion.jsp&titulo=Listado Orden Fabricación&filordenfabricacion=<%=filordenfabricacion%>','_self')">Volver</button>
</form>
</body>
</html>

