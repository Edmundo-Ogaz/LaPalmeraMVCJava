<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filcargo = request.getParameter("filcargo");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaCargo.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcargo" value="<%=filcargo%>"/> 
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
ArrayList<Cargo> arrayCargo= new ArrayList<Cargo>();
ManejadorCargo manCargo= new ManejadorCargo();

manCargo.setCodigoCargo(filcargo);
//manCargo.setNombreCargo(nombre);

arrayCargo= manCargo.consultar();
Iterator itCargo= arrayCargo.iterator();
while (itCargo.hasNext())
 {
Cargo cargo= (Cargo) itCargo.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=cargo.getCodigoCargo()%>>
</td>
<td>
&nbsp;
<%=cargo.getCodigoCargo()%>
</td>
<td width =150  align="right">
&nbsp;
<%=cargo.getNombreCargo()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Comuna'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoCargo.jsp&titulo=Nuevo Cargo&filcargo=<%=filcargo%>','_self')">Nuevo Cargo</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilCargo.jsp&titulo=Filtrado Cargo','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

