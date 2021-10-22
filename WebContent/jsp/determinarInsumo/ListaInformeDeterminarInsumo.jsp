<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filproducto = request.getParameter("filproducto");
String filinsumo = request.getParameter("filinsumo");
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
<!--form name = formulario action = "/LaPalmera/jsp/ControlListaIngrediente.jsp" onSubmit="return validar(this)" target="_self"-->
<form>
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<input type="hidden" name="filinsumo" value="<%=filinsumo%>"/>
<table border="1">
<tr>
<!--th>
Selec
</th-->
<th>
Producto
</th>
<th>
Insumo
</th>
<th>
Carga 
</th>
<th>
Cantidad Insumo
</th>
<th>
Unidad Medida
</th>
</tr>	
<%
//int i = 1;
ArrayList<Ingrediente> arrayIngrediente = new ArrayList<Ingrediente>();
ManejadorIngrediente manIngrediente = new ManejadorIngrediente();

manIngrediente.setCodigoProducto(filproducto);
manIngrediente.setCodigoInsumo(filinsumo);

arrayIngrediente = manIngrediente.consultar();
Iterator itIngrediente = arrayIngrediente.iterator();
while (itIngrediente.hasNext())
 {
Ingrediente ingrediente = (Ingrediente) itIngrediente.next();
 %>
<tr>
<!--td>
<input type = radio name = seleccion value = <%--=ingrediente.getCodigoProducto()--%>/<%--=ingrediente.getCodigoInsumo()--%>>
</td-->
<td>
&nbsp;
<%
Producto producto = new Producto();
producto.setCodigoProducto(ingrediente.getCodigoProducto());
if (producto.buscar()){
out.print(producto.getNombreProducto());
}
%>
</td>
<td width =300>
&nbsp;
<%
Insumo insumo= new Insumo();
insumo.setCodigoInsumo(ingrediente.getCodigoInsumo());
if (insumo.buscar()){
out.print(insumo.getNombreInsumo());
}
%>
</td>
<td>
&nbsp;
<%=ingrediente.getCarga()%>
</td>
<td>
&nbsp;
<%=ingrediente.getCantidadInsumo()%>
</td>
<td>
&nbsp;
<%=ingrediente.getCodigoUnidadMedida()%>
</td>
</tr>
<%--i++;--%>
<%}%>
</table>
<!--input type="hidden" name="ultimafila" value="<%--=i-1--%>"/-->
<!--input type=submit name=Enviar value = 'Nueva Comuna'-->
<!--button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoIngrediente.jsp&titulo=Nuevo Ingrediente&filproducto=<%--=filproducto--%>&filinsumo=<%--=filinsumo--%>','_self')">Nuevo Ingrediente</button-->
<!--input type=submit name=Enviar value = 'Modificar'-->
<!--input type=submit name=Enviar value = 'Eliminar'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilInformeDeterminarInsumo.jsp&titulo=Filtrado Informe Determinar insumo','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

