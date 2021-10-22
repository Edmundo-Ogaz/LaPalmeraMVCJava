<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filciudad = request.getParameter("filciudad");
//String nombre = request.getParameter("nombre");
String filregion = request.getParameter("filregion");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaCiudad.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filciudad" value="<%=filciudad%>"/> 
<input type="hidden" name="filregion" value="<%=filregion%>"/>
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
Región
</th>
</tr>	
<%
int i = 1;
ArrayList<Ciudad> arrayCiudad= new ArrayList<Ciudad>();
ManejadorCiudad manCiudad= new ManejadorCiudad();

manCiudad.setCodigoCiudad(filciudad);
//manCiudad.setNombreCiudad(nombre);
manCiudad.setCodigoRegion(filregion);

arrayCiudad= manCiudad.consultar();
Iterator itCiudad= arrayCiudad.iterator();
while (itCiudad.hasNext())
 {
Ciudad ciudad= (Ciudad) itCiudad.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=ciudad.getCodigoCiudad()%>>
</td>
<th>
&nbsp;
<%=ciudad.getCodigoCiudad()%>
</th>
<td width =150  align="right">
&nbsp;
<%=ciudad.getNombreCiudad()%>
</td>
<td width =150  align="right">
&nbsp;
<%
ArrayList<Region> arrayRegion = new ArrayList<Region>();
ManejadorRegion manRegion = new ManejadorRegion();

manRegion.setCodigoRegion(ciudad.getCodigoRegion());

arrayRegion = manRegion.consultar(); 
Iterator itRegion = arrayRegion.iterator();
while (itRegion.hasNext()) {
	Region region = (Region) itRegion.next();
%>
<%=region.getNombreRegion()%>	
<%
}
%>
<%--=ciudad.getCodigoRegion()--%>
</td>

<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Comuna'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevaCiudad.jsp&titulo=Nueva Ciudad&filciudad=<%=filciudad%>&filregion=<%=filregion%>','_self')">Nueva Ciudad</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilCiudad.jsp&titulo=Filtrado Ciudad','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

