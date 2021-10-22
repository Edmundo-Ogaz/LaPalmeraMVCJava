<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaLineaProduccion.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
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
</tr>	
<%
int i = 1;
ArrayList<LineaProduccion> arrayLineaProduccion = new ArrayList<LineaProduccion>();
ManejadorLineaProduccion manLineaProduccion = new ManejadorLineaProduccion();

manLineaProduccion.setCodigoLineaProduccion(filcodigo);
manLineaProduccion.setNombreLineaProduccion(filnombre);
//manComuna.setCodigoCiudad(filciudad);

arrayLineaProduccion = manLineaProduccion.consultar();
Iterator itLineaProduccion = arrayLineaProduccion.iterator();
while (itLineaProduccion.hasNext())
 {
LineaProduccion lineaProduccion= (LineaProduccion) itLineaProduccion.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=lineaProduccion.getCodigoLineaProduccion()%>>
</td>
<th>
&nbsp;
<%=lineaProduccion.getCodigoLineaProduccion()%>
</th>
<td width =150  align="right">
&nbsp;
<%=lineaProduccion.getNombreLineaProduccion()%>
</td>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Linea de Producción'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevaLineaProduccion.jsp&titulo=Nueva Linea de Produccion&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>','_self')">Nueva Linea de Produccion</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilLineaProduccion.jsp&titulo=Filtrado Linea de Produccion','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

