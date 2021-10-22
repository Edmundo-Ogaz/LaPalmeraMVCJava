<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="area" class="unab.com.Area" scope="session"/>
<%
String filarea = request.getParameter("filarea");
String codigo = request.getParameter("seleccion");
String nombre = "";

area.setCodigoArea(codigo);
if (area.buscar()){
nombre = area.getNombreArea();
}
%>
<html>
<head>
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
</head>
<body>
<form name = formulario action = "/LaPalmera/servlet/ModificaArea" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filarea" value="<%=filarea%>"/>
<input type="hidden" name="codigo" value="<%=codigo%>"/>
<table border = 0>
<tr>
<td>
Código Area</td>
<td>
<input type=text name=codigo2 value="<%=codigo%>" disabled="disabled">
</td>
</tr>
<tr>
<td>
Nombre Area</td>
<td>
<input type=text name=nombre value = '<%=nombre%>' size = 70 maxlength = 70></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaArea.jsp&titulo=Listado Area&filarea=<%=filarea%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
