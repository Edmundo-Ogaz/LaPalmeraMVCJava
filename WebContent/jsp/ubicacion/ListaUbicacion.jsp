<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filproducto= request.getParameter("filproducto");
String filbodega= request.getParameter("filbodega");
String filtipoproducto= request.getParameter("filtipoproducto");
String filfechaingresoinicio= request.getParameter("filfechaingresoinicio");
String filfechaingresotermino= request.getParameter("filfechaingresotermino");
String filfechavencimientoinicio= request.getParameter("filfechavencimientoinicio");
String filfechavencimientotermino= request.getParameter("filfechavencimientotermino");
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
<input type="hidden" name="filbodega" value="<%=filbodega%>"/> 
<input type="hidden" name="filtipoproducto" value="<%=filtipoproducto%>"/> 
<input type="hidden" name="filfechaingresoinicio" value="<%=filfechaingresoinicio%>"/> 
<input type="hidden" name="filfechaingresotermino" value="<%=filfechaingresotermino%>"/> 
<input type="hidden" name="filfechavencimientoinicio" value="<%=filfechavencimientoinicio%>"/> 
<input type="hidden" name="filfechavencimientotermino" value="<%=filfechavencimientotermino%>"/> 
<table border="1">
<tr>
<th>
Selec
</th>
<th>
Producto
</th>
<th>
Bodega
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
Tipo Producto
</th>
<th>
Cantidad
</th>
<th>
Unidad de Medida
</th>
<th>
Observación
</th>
</tr>	
<%
int i = 1;
ArrayList<Ubicacion> arrayUbicacion = new ArrayList<Ubicacion>();
ManejadorUbicacion manUbicacion = new ManejadorUbicacion();

manUbicacion.setCodigoProducto(filproducto);
manUbicacion.setCodigoBodega(filbodega);
manUbicacion.setTipoProducto(filtipoproducto);
manUbicacion.setFechaIngresoInicio(filfechaingresoinicio);
manUbicacion.setFechaIngresoTermino(filfechaingresotermino);
manUbicacion.setFechaVencimientoInicio(filfechavencimientoinicio);
manUbicacion.setFechaVencimientoTermino(filfechavencimientotermino);

arrayUbicacion = manUbicacion.consultar();
Iterator itUbicacion = arrayUbicacion.iterator();
while (itUbicacion.hasNext())
 {
Ubicacion ubicacion = (Ubicacion) itUbicacion.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=ubicacion.getCodigoProducto()%>/<%=ubicacion.getCodigoBodega()%>/<%=ubicacion.getFechaIngreso()%>/<%=ubicacion.getHoraIngreso()%>/<%=ubicacion.getFechaVencimiento()%>>
</td>
<td>
&nbsp;
<%
Producto producto = new Producto();
producto.setCodigoProducto(ubicacion.getCodigoProducto());
if (producto.buscar()){
out.print(producto.getNombreProducto());
}else{
Insumo insumo = new Insumo();
insumo.setCodigoInsumo(ubicacion.getCodigoProducto());
if (insumo.buscar()){
out.print(insumo.getNombreInsumo());
}
}
%>
</td>
<td>
&nbsp;
<%
Bodega bodega = new Bodega();
bodega.setCodigoBodega(ubicacion.getCodigoBodega());
if (bodega.buscar()){
out.print(bodega.getNombreBodega());
}
%>
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
<%=ubicacion.getTipoProducto()%>
</td>
<td>
&nbsp;
<%=ubicacion.getCantidad()%>
</td>
<td>
&nbsp;
<%=ubicacion.getCodigoUnidadMedida()%>
</td>
<td>
&nbsp;
<%=ubicacion.getObservacion()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Ubicacion'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevaUbicacion.jsp&titulo=Nueva Ubicacion&filproducto=<%=filproducto%>&filbodega=<%=filbodega%>&filtipoproducto=<%=filtipoproducto%>&filfechaingresoinicio=<%=filfechaingresoinicio%>&filfechaingresotermino=<%=filfechaingresotermino%>&filfechavencimientoinicio=<%=filfechavencimientoinicio%>&filfechavencimientotermino=<%=filfechavencimientotermino%>','_self')">Nueva Ubicación</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilUbicacion.jsp&titulo=Filtrado Ubicación','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

