<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaTipoCliente.jsp" onSubmit="return validar(this)" target="_self">
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
ArrayList<TipoCliente> arrayTipoCliente= new ArrayList<TipoCliente>();
ManejadorTipoCliente manTipoCliente= new ManejadorTipoCliente();

manTipoCliente.setCodigoTipoCliente(filcodigo);
manTipoCliente.setNombreTipoCliente(filnombre);

arrayTipoCliente= manTipoCliente.consultar();
Iterator itTipoCliente= arrayTipoCliente.iterator();
while (itTipoCliente.hasNext())
 {
TipoCliente tipoCliente= (TipoCliente) itTipoCliente.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=tipoCliente.getCodigoTipoCliente()%>>
</td>
<td>
&nbsp;
<%=tipoCliente.getCodigoTipoCliente()%>
</td>
<td width =150  align="right">
&nbsp;
<%=tipoCliente.getNombreTipoCliente()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Comuna'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoTipoCliente.jsp&titulo=Nuevo TipoCliente&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>','_self')">Nuevo TipoCliente</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilTipoCliente.jsp&titulo=Filtrado Tipo de Cliente','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

