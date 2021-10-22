<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filarea = request.getParameter("filarea");
//String nombre = request.getParameter("nombre");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaArea.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filarea" value="<%=filarea%>"/> 
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
ArrayList<Area> arrayArea= new ArrayList<Area>();
ManejadorArea manArea= new ManejadorArea();

manArea.setCodigoArea(filarea);
//manArea.setNombreArea(nombre);

arrayArea= manArea.consultar();
Iterator itArea= arrayArea.iterator();
while (itArea.hasNext())
 {
Area area= (Area) itArea.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=area.getCodigoArea()%>>
</td>
<td>
&nbsp;
<%=area.getCodigoArea()%>
</td>
<td width =150  align="right">
&nbsp;
<%=area.getNombreArea()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Comuna'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevaArea.jsp&titulo=Nueva Area&filarea=<%=filarea%>','_self')">Nueva Area</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilArea.jsp&titulo=Filtrado Area','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

