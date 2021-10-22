<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="cargo" class="unab.com.Cargo" scope="session"/>
<%
String filcargo = request.getParameter("filcargo");
String codigo = request.getParameter("seleccion");
String nombre = "";

cargo.setCodigoCargo(codigo);
if (cargo.buscar()){
nombre = cargo.getNombreCargo();
}
%>
<html>
<head>
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
</head>
<body>
<form name = formulario action = "/LaPalmera/servlet/ModificaCargo" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcargo" value="<%=filcargo%>"/>
<input type="hidden" name="codigo" value="<%=codigo%>"/>
<table border = 0>
<tr>
<td>
Código Cargo</td>
<td>
<input type=text name=codigo2 value="<%=codigo%>" disabled="disabled">
</td>
</tr>
<tr>
<td>
Nombre Cargo</td>
<td>
<input type=text name=nombre value = '<%=nombre%>' size = 70 maxlength = 70></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaCargo.jsp&titulo=Listado Cargo&filcargo=<%=filcargo%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
