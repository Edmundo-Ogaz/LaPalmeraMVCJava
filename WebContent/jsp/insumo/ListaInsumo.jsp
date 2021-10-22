<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
String filunidadmedida = request.getParameter("filunidadmedida");
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
<form name="formulario" action = "/LaPalmera/jsp/ControlListaInsumo.jsp" onSubmit="return validar()">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filunidadmedida" value="<%=filunidadmedida%>"/>
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
Peso
</th>
<th>
Unidad Medida
</th>
<th>
Stock Critico
</th>
<th>
Observaci&oacute;n
</th>
</tr>	
<%
int i = 1;
ArrayList<Insumo> arrayInsumo = new ArrayList<Insumo>();
ManejadorInsumo manInsumo = new ManejadorInsumo();

manInsumo.setCodigoInsumo(filcodigo);
manInsumo.setNombreInsumo(filnombre);
manInsumo.setCodigoUnidadMedida(filunidadmedida);

arrayInsumo = manInsumo.consultar();
Iterator itInsumo= arrayInsumo.iterator();
while (itInsumo.hasNext())
 {
Insumo insumo= (Insumo) itInsumo.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=insumo.getCodigoInsumo()%>>
</td>
<th>
&nbsp;
<%=insumo.getCodigoInsumo()%>
</th>
<td width =150  align="right">
&nbsp;
<%=insumo.getNombreInsumo()%>
</td>
<td>
&nbsp;
<%=insumo.getPesoInsumo()%>
</td>
<td width =300>
&nbsp;
<%=insumo.getCodigoUnidadMedida()%>
</td>
<td>
&nbsp;
<%=insumo.getStockCriticoInsumo()%>
</td>
<td>
&nbsp;
<%=insumo.getObservacionInsumo()%>
</td>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nuevo Insumo'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoInsumo.jsp&titulo=Nuevo Insumo&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>&filunidadmedida=<%=filunidadmedida%>','_self')">Nuevo Insumo</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilInsumo.jsp&titulo=Filtrado Insumo','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

