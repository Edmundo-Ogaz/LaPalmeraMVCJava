<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filrut = request.getParameter("filrut");
String filnombre = request.getParameter("filnombre");
String filapellidopaterno = request.getParameter("filapellidopaterno");
String filapellidomaterno = request.getParameter("filapellidomaterno");
String filcargo = request.getParameter("filcargo");
String filarea = request.getParameter("filarea");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaFuncionario.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filrut" value="<%=filrut%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filapellidopaterno" value="<%=filapellidopaterno%>"/> 
<input type="hidden" name="filapellidomaterno" value="<%=filapellidomaterno%>"/>
<input type="hidden" name="filcargo" value="<%=filcargo%>"/> 
<input type="hidden" name="filarea" value="<%=filarea%>"/>
<table border="1">
<tr>
<th>
Selec
</th>
<th>
Rut
</th>
<th>
Nombre
</th>
<th>
Apellido Paterno 
</th>
<th>
Apellido Materno
</th>
<th>
Cargo
</th>
<th>
Area
</th>
</tr>	
<%
int i = 1;
ArrayList<Funcionario> arrayFuncionario= new ArrayList<Funcionario>();
ManejadorFuncionario manFuncionario= new ManejadorFuncionario();
manFuncionario.setRutFuncionario(filrut);
manFuncionario.setNombreFuncionario(filnombre);
manFuncionario.setApellidoPaternoFuncionario(filapellidopaterno);
manFuncionario.setApellidoMaternoFuncionario(filapellidomaterno);
manFuncionario.setCodigoCargo(filcargo);
manFuncionario.setCodigoArea(filarea);
arrayFuncionario = manFuncionario.consultar();
Iterator itFuncionario= arrayFuncionario.iterator();
while (itFuncionario.hasNext())
 {
Funcionario funcionario= (Funcionario) itFuncionario.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=funcionario.getRutFuncionario()%>>
</td>
<td width =150  align="right">
&nbsp;
<%=funcionario.getRutFuncionario()%>
</td>
<td width =300>
&nbsp;
<%=funcionario.getNombreFuncionario()%>
</td>
<td>
&nbsp;
<%=funcionario.getApellidoPaternoFuncionario()%>
</td>
<td>
&nbsp;
<%=funcionario.getApellidoMaternoFuncionario()%>
</td>
<td>
&nbsp;
<%=funcionario.getCodigoCargo()%>
</td>
<td>
&nbsp;
<%=funcionario.getCodigoArea()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoFuncionario.jsp&titulo=Nuevo Funcionario&filrut=<%=filrut%>&filnombre=<%=filnombre%>&filapellidopaterno=<%=filapellidopaterno%>&filapellidomaterno=<%=filapellidomaterno%>&filcargo=<%=filcargo%>&filarea=<%=filarea%>','_self')">Nuevo Funcionario</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilFuncionario.jsp&titulo=Filtrado Funcionario','_self')">Volver</button>
</form>
</body>
</html>

