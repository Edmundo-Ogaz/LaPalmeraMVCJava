<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
String filtipoproducto = request.getParameter("filtipoproducto");
String filfamilia = request.getParameter("filfamilia");
String filsubfamilia = request.getParameter("filsubfamilia");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaProducto.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filtipoproducto" value="<%=filtipoproducto%>"/> 
<input type="hidden" name="filfamilia" value="<%=filfamilia%>"/>
<input type="hidden" name="filsubfamilia" value="<%=filsubfamilia%>"/>
<table border="1">
<tr>
<th>
Selec
</th>
<th>
Código
</th>
<th>
Nombre
</th>
<th>
Familia
</th>
<th>
Subfamilia
</th>
<th>
Otra Caracter&iacute;stica
</th>
<th>
Unidad Medida
</th>
<th>
Stock Cr&iacute;tico
</th>
<th>
Valor Costo
</th>
<th>
Valor Venta
</th>
<th>
Preparaci&oacute;n
</th>
<th>
Producto Semielaborado
</th>
<th>
Foto
</th>
<th>
Observaci&oacute;n
</th>
</tr>	
<%
int i = 1;
ArrayList<Producto> arrayProducto = new ArrayList<Producto>();
ManejadorProducto manProducto = new ManejadorProducto();

manProducto.setCodigoProducto(filcodigo);
manProducto.setNombreProducto(filnombre);
manProducto.setTipoProducto(filtipoproducto);
manProducto.setCodigoFamilia(filfamilia);
manProducto.setCodigoSubfamilia(filsubfamilia);

arrayProducto= manProducto.consultar();
Iterator itProducto = arrayProducto.iterator();
while (itProducto.hasNext())
 {
Producto producto = (Producto) itProducto.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=producto.getCodigoProducto()%>>
</td>
<th>
&nbsp;
<%=producto.getCodigoProducto()%>
</th>
<td width =150  align="right">
&nbsp;
<%=producto.getNombreProducto()%>
</td>
<td>
&nbsp;
<%=producto.getCodigoFamilia()%>
</td>
<td>
&nbsp;
<%=producto.getCodigoSubfamilia()%>
</td>
<td>
&nbsp;
<%=producto.getCodigoOtraCaracteristica()%>
</td>
<td>
&nbsp;
<%=producto.getCodigoUnidadMedida()%> 
</td>
<td>
&nbsp;
<%=producto.getStockCriticoProducto()%>
</td>
<td>
&nbsp;
<%=producto.getValorCostoProducto()%>
</td>
<td>
&nbsp;
<%=producto.getValorVentaProducto()%>
</td>
<td>
&nbsp;
<%=producto.getPreparacionProducto()%>
</td>
<td>
&nbsp;
<%=producto.getTipoProducto()%>
</td>
<td>
&nbsp;
<%=producto.getFotoProducto()%>
</td>
<td>
&nbsp;
<%=producto.getObservacionProducto()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Comuna'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoProducto.jsp&titulo=Nuevo Producto&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>&filtipoproducto=<%=filtipoproducto%>&filfamilia=<%=filfamilia%>&filsubfamilia=<%=filsubfamilia%>','_self')">Nuevo Producto</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilProducto.jsp&titulo=Filtrado Producto','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

