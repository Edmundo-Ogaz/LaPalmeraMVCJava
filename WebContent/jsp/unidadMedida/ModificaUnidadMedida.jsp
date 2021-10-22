<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="unidadMedida" class="UnidadMedida" scope="session"/>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
String codigo = request.getParameter("seleccion");
String nombre = "";

unidadMedida.setCodigoUnidadMedida(codigo);
if (unidadMedida.buscar()){
nombre = unidadMedida.getNombreUnidadMedida();
}
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
  
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el código de la Unidad de Medida.");
    formulario.codigo.focus();
    return (false);
  }
   
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el nombre de la Unidad de Medida");
    formulario.nombre.focus();
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
<form name = formulario action = "/LaPalmera/servlet/ModificaUnidadMedida" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="codigo" value="<%=codigo%>"/>
<table border = 0>
<tr>
<td>
Código Unidad de Medida</td>
<td>
<input type=text name=codigo2 disabled="disabled" value="<%=codigo%>">
</td>
</tr>
<tr>
<td>
Nombre Unidad de Medida</td>
<td>
<input type=text name=nombre value = '<%=nombre%>' size = 70 maxlength = 70></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaUnidadMedida.jsp&titulo=Listado Unidad de Medida&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
