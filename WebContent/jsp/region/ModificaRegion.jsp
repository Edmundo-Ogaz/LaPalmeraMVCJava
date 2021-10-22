<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="region" class="cl.laPalmera.DTO.RegionDTO" scope="session"/>
<%
String filregion = request.getParameter("filregion");
String codigo = request.getParameter("seleccion");
String nombre = "";

region.setCodigoRegion(codigo);
if (region.buscar()){
nombre = region.getNombreRegion();
}
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el Código de la Region.");
    formulario.codigo.focus();
    return (false);
  }
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el Nombre de la Region.");
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
<form name = formulario action = "/LaPalmera/servlet/ModificaRegion" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filregion" value="<%=filregion%>"/>
<input type="hidden" name="codigo" value="<%=codigo%>"/>
<table border = 0>
<tr>
<td>
Código Región
</td>
<td>
<input type=text name=codigo2 value="<%=codigo%>" disabled="disabled">
</td>
</tr>
<tr>
<td>
Nombre Región
</td>
<td>
<input type=text name=nombre value = '<%=nombre%>' size = 70 maxlength = 70></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaRegion.jsp&titulo=Listado Región&filregion=<%=filregion%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
