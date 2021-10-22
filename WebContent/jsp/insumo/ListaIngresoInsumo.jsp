<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filproducto= request.getParameter("filproducto");
String stocktotal = "";
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaUbicacion.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<table border="1">
<tr>
<th>
Producto
</th>
<th>
Stock
</th>
<th>
Unidad Medida
</th>
<th>
Ubicación
</th>
</tr>	
<%
if (!filproducto.equals("")){
ArrayList<Stock> arrayStock = new ArrayList<Stock>();
ManejadorStock manStock = new ManejadorStock();
manStock.setCodigoProducto(filproducto);

arrayStock = manStock.consultar();
Iterator itStock = arrayStock.iterator();
while (itStock.hasNext())
 {
Stock stock = (Stock) itStock.next();
 %>
<tr>
<td>
&nbsp;
<%
Insumo insumo = new Insumo();
insumo.setCodigoInsumo(stock.getCodigoProducto());
if (insumo.buscar())
out.print(insumo.getNombreInsumo());
%>
</td>
<td>
&nbsp;
<%=stocktotal = String.valueOf(Float.parseFloat(stock.getStockDisponible())+Float.parseFloat(stock.getStockComprometido()))%>
</td>
<td>
&nbsp;
<%=stock.getCodigoUnidadMedida()%>
</td>
<td>
<table border="1">
<tr>
<th>
Bodega
</th>
<th>
Ubicación
</th>
<th>
Fecha Ingreso
</th>
<th>
Hora Ingreso
</th>
<th>
Fecha Vencimiento 
</th>
<th>
Cantidad
</th>
<th>
U/M
</th>
</tr>	
<%
ArrayList<Ubicacion> arrayUbicacion = new ArrayList<Ubicacion>();
ManejadorUbicacion manUbicacion = new ManejadorUbicacion();

manUbicacion.setCodigoProducto(stock.getCodigoProducto());

arrayUbicacion = manUbicacion.consultar();
Iterator itUbicacion = arrayUbicacion.iterator();
while (itUbicacion.hasNext())
 {
Ubicacion ubicacion = (Ubicacion) itUbicacion.next();
 %>
<tr>
<td>
&nbsp;
<%
Bodega bodega = new Bodega();
bodega.setCodigoBodega(ubicacion.getCodigoBodega());
if (bodega.buscar())
out.print(bodega.getNombreBodega());
%> 
</td>
<td>
&nbsp;
<%=ubicacion.getObservacion()%>
</td>
<td>
&nbsp;
<%=ubicacion.getFechaIngreso()%>
</td>
<td>
&nbsp;
<%=ubicacion.getHoraIngreso()%>
</td>
<td>
&nbsp;
<%=ubicacion.getFechaVencimiento()%>
</td>
<td>
&nbsp;
<%=ubicacion.getCantidad()%>
</td>
<td>
&nbsp;
<%=ubicacion.getCodigoUnidadMedida()%>
</td>
</tr>
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


