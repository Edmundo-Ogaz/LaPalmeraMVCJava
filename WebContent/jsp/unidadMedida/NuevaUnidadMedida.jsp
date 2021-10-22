<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
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
<form name = formulario action = "/LaPalmera/servlet/GrabaUnidadMedida" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<table border = 0>
<tr>
<td>
Código Unidad de Medida
</td>
<td>
<input type="text" name="codigo"  size = "1">
</td>
</tr>
<tr>
<td>
Nombre Unidad de Medida
</td>
<td>
<input type=text name=nombre value = '' size = 70 maxlength = 70>
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaUnidadMedida.jsp&titulo=Listado Unidad de Medida&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilUnidadMedida.jsp&titulo=Filtrado UnidadMedida','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>