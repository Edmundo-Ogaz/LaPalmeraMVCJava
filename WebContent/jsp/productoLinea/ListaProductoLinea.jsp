<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filproducto = request.getParameter("filproducto");
String fillineaproduccion = request.getParameter("fillineaproduccion");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaProductoLinea.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<input type="hidden" name="fillineaproduccion" value="<%=fillineaproduccion%>"/>
<table border="1">
<tr>
<th>
Selec
</th>
<th>
Producto
</th>
<th>
Linea de Producción
</th>
</tr>	
<%
int i = 1;
ArrayList<ProductoLinea> arrayProductoLinea= new ArrayList<ProductoLinea>();
ManejadorProductoLinea manProductoLinea= new ManejadorProductoLinea();

manProductoLinea.setCodigoProducto(filproducto);
manProductoLinea.setCodigoLineaProduccion(fillineaproduccion);
//manComuna.setCodigoCiudad(filciudad);

arrayProductoLinea = manProductoLinea.consultar();
Iterator itProductoLinea = arrayProductoLinea.iterator();
while (itProductoLinea.hasNext())
 {
ProductoLinea productoLinea= (ProductoLinea) itProductoLinea.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=productoLinea.getCodigoProducto()%>>
</td>
<td align="right">
&nbsp;
<%=productoLinea.getCodigoProducto()%>
</td>
<td>
&nbsp;
<%=productoLinea.getCodigoLineaProduccion()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nuevo Producto por Linea de Producción'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoProductoLinea.jsp&titulo=Nuevo Producto por Linea&filproducto=<%=filproducto%>&fillineaproduccion=<%=fillineaproduccion%>','_self')">Nuevo Producto por Linea</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilProductoLinea.jsp&titulo=Filtrado Producto Linea','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

