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
<form name = formulario action = "/LaPalmera/jsp/ControlListaUnidadMedida.jsp" onSubmit="return validar()">
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
ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();
ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();

manUnidadMedida.setCodigoUnidadMedida(filcodigo);
manUnidadMedida.setNombreUnidadMedida(filnombre);
//manComuna.setCodigoCiudad(filciudad);

arrayUnidadMedida = manUnidadMedida.consultar();
Iterator itUnidadMedida= arrayUnidadMedida.iterator();
while (itUnidadMedida.hasNext())
 {
UnidadMedida unidadMedida= (UnidadMedida) itUnidadMedida.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=unidadMedida.getCodigoUnidadMedida()%>>
</td>
<th>
&nbsp;
<%=unidadMedida.getCodigoUnidadMedida()%>
</th>
<td width =150  align="right">
&nbsp;
<%=unidadMedida.getNombreUnidadMedida()%>
</td>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Unidad de Medida'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevaUnidadMedida.jsp&titulo=Nueva Unidad de Medida&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>','_self')">Nueva Unidad de Medida</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilUnidadMedida.jsp&titulo=Filtrado Unidad de Medida','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

