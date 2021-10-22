<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filrut = request.getParameter("filrut");
String filnombre = request.getParameter("filnombre");
String fildireccion = request.getParameter("fildireccion");
String filcomuna = request.getParameter("filcomuna");
String filfechanacimiento = request.getParameter("filfechanacimiento");
String filtelefono = request.getParameter("filtelefono");
String filemail = request.getParameter("filemail");
String filpaginaweb = request.getParameter("filpaginaweb");
String filtipocliente = request.getParameter("filtipocliente");
String filobservacion = request.getParameter("filobservacion");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaCliente.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filrut" value="<%=filrut%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="fildireccion" value="<%=fildireccion%>"/>
<input type="hidden" name="filcomuna" value="<%=filcomuna%>"/> 
<input type="hidden" name="filtelefono" value="<%=filtelefono%>"/>
<input type="hidden" name="filfechanacimiento" value="<%=filfechanacimiento%>"/> 
<input type="hidden" name="filemail" value="<%=filemail%>"/>
<input type="hidden" name="filpaginaweb" value="<%=filpaginaweb%>"/> 
<input type="hidden" name="filtipocliente" value="<%=filtipocliente%>"/>
<input type="hidden" name="filobservacion" value="<%=filobservacion%>"/> 
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
Direcci&oacute;n  
</th>
<th>
Comuna
</th>
<th>
Fecha Nacimiento
</th>
<th>
Tel&eacute;fono
</th>
<th>
Email
</th>
<th>
Pagina Web
</th>
<th>
Tipo Cliente
</th>
<th>
Observaci&oacute;n 
</th>
</tr>	
<%
int i = 1;
ArrayList<Cliente> arrayCliente= new ArrayList<Cliente>();
ManejadorCliente manCliente= new ManejadorCliente();
manCliente.setRutCliente(filrut);
manCliente.setNombreCliente(filnombre);
manCliente.setDireccionCliente(fildireccion);
manCliente.setCodigoComuna(filcomuna);
manCliente.setFechaNacimientoCliente(filfechanacimiento);
manCliente.setTelefonoCliente(filtelefono);
manCliente.setEmailCliente(filemail);
manCliente.setPaginaWebCliente(filpaginaweb);
manCliente.setCodigoTipoCliente(filtipocliente);
manCliente.setObservacionCliente(filobservacion);
arrayCliente = manCliente.consultar();
Iterator itCliente= arrayCliente.iterator();
while (itCliente.hasNext())
 {
Cliente cliente= (Cliente) itCliente.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=cliente.getRutCliente()%>>
</td>
<td align="right">
&nbsp;
<%=cliente.getRutCliente()%>
</td>
<td>
&nbsp;
<%=cliente.getNombreCliente()%>
</td>
<td>
&nbsp;
<%=cliente.getDireccionCliente()%>
</td>
<td>
&nbsp;
<%=cliente.getCodigoComuna()%>
</td>
<td>
&nbsp;
<%=cliente.getFechaNacimientoCliente()%>
</td>
<td>
&nbsp;
<%=cliente.getTelefonoCliente()%>
</td>
<td>
&nbsp;
<%=cliente.getEmailCliente()%>
</td>
<td>
&nbsp;
<%=cliente.getPaginaWebCliente()%>
</td>
<td>
&nbsp;
<%=cliente.getCodigoTipoCliente()%>
</td>
<td>
&nbsp;
<%=cliente.getObservacionCliente()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoCliente.jsp&titulo=Nuevo Cliente&filrut=<%=filrut%>&filnombre=<%=filnombre%>&fildireccion=<%=fildireccion%>&filcomuna=<%=filcomuna%>&filtelefono=<%=filtelefono%>&filfechanacimiento=<%=filfechanacimiento%>&filemail=<%=filemail%>&filpaginaweb=<%=filpaginaweb%>&filtipocliente=<%=filtipocliente%>&filobservacion=<%=filobservacion%>','_self')">Nuevo Cliente</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilCliente.jsp&titulo=Filtrado Cliente','_self')">Volver</button>
</form>
</body>
</html>

