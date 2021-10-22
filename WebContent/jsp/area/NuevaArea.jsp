<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filarea = request.getParameter("filarea");
%>
<html>
<head>
</head>
<body>
<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el Código del Area.");
    formulario.codigo.focus();
    return (false);
  }
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el Nombre del Area.");
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
<form name = formulario action = "/LaPalmera/servlet/GrabaArea" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filarea" value="<%=filarea%>"/>
<table border = 0>
<tr>
<td>
Código Area</td>
<td>
<input type="text" name="codigo"  size = "1">
</td>
</tr>
<tr>
<td>
Nombre Area</td>
<td>
<input type=text name=nombre value = '' size = 70 maxlength = 70>
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaArea.jsp&titulo=Listado Area&filarea=<%=filarea%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilArea.jsp&titulo=Filtrado Area','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>