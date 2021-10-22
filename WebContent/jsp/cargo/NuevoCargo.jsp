<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filcargo = request.getParameter("filcargo");
%>
<html>
<head>
</head>
<body>
<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el Código del Cargo.");
    formulario.codigo.focus();
    return (false);
  }
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el Nombre del Cargo.");
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
<form name = formulario action = "/LaPalmera/servlet/GrabaCargo" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcargo" value="<%=filcargo%>"/>
<table border = 0>
<tr>
<td>
Código Cargo
</td>
<td>
<input type="text" name="codigo"  size = "1">
</td>
</tr>
<tr>
<td>
Nombre Cargo</td>
<td>
<input type=text name=nombre value = '' size = 70 maxlength = 70>
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaCargo.jsp&titulo=Listado Cargo&filcargo=<%=filcargo%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilCargo.jsp&titulo=Filtrado Cargo','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>