<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filproducto = request.getParameter("filproducto");
//String filnombre = request.getParameter("filnombre");
//String filciudad = request.getParameter("filciudad");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaStock.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<!--input type="hidden" name="filnombre" value="<%--=filnombre--%>"/-->
<table border="1">
<tr>
<th>
Selec
</th>
<th>
Producto
</th>
<th>
Stock Disponible
</th>
<th>
Stock comprometido 
</th>
<th>
Unidad Medida
</th>
</tr>	
<%
ArrayList<Stock> arrayStock = new ArrayList<Stock>();
ManejadorStock manStock = new ManejadorStock();

manStock.setCodigoProducto(filproducto);
//manStock.setNombreStock(filnombre);
//manComuna.setCodigoCiudad(filciudad);

arrayStock = manStock.consultar();
Iterator itStock = arrayStock.iterator();
while (itStock.hasNext())
 {
Stock stock = (Stock) itStock.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=stock.getCodigoProducto()%>>
</td>
<td>
&nbsp;
<%
Producto producto = new Producto();
producto.setCodigoProducto(stock.getCodigoProducto());
if (producto.buscar())
{
  out.print(producto.getNombreProducto());
}else{
  Insumo insumo= new Insumo();
  insumo.setCodigoInsumo(stock.getCodigoProducto());
  if (insumo.buscar())
  {
    out.print(insumo.getNombreInsumo());
  }
}  
%>
</td>
<td>
&nbsp;
<%=stock.getStockDisponible()%>
</td>
<td>
&nbsp;
<%=stock.getStockComprometido()%>
</td>
<td>
&nbsp;
<%=stock.getCodigoUnidadMedida()%>
</td>
</tr>
<%}%>
</table>
<!--input type=submit name=Enviar value = 'Nuevo Stock'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoStock.jsp&titulo=Nuevo Stock&filproducto=<%=filproducto%>','_self')">Nuevo Stock</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilStock.jsp&titulo=Filtrado Stock','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

