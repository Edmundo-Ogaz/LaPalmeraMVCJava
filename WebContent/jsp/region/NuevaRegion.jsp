<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filregion = request.getParameter("filregion");
//String filciudad = request.getParameter("filciudad");
%>
<html>
<head>
</head>
<body>
<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el Código de la Región.");
    formulario.codigo.focus();
    return (false);
  }
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el Nombre de la Región.");
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
<form name = formulario action = "/LaPalmera/servlet/GrabaRegion" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filregion" value="<%=filregion%>"/>
<table border = 0>
<tr>
<td>
Código Región
</td>
<td>
<input type="text" name="codigo"  size = "1">
</td>
</tr>
<tr>
<td>
Nombre Región</td>
<td>
<input type=text name=nombre value = '' size = 70 maxlength = 70>
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=region/ListaRegion.jsp&titulo=Listado Región&filregion=<%=filregion%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=region/FilRegion.jsp&titulo=Filtrado Region','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>