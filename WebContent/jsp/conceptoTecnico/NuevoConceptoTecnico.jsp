<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el Código de la Comuna.");
    formulario.codigo.focus();
    return (false);
  }
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el Nombre de la Comuna.");
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
<form name = formulario action = "/LaPalmera/servlet/GrabaConceptoTecnico" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<table border = 0>
<tr>
<td>
Código Concepto Técnico</td>
<td>
<input type="text" name="codigo"  size = "1">
</td>
</tr>
<tr>
<td>
Nombre Concepto Técnico</td>
<td>
<input type=text name=nombre value = '' size = 70 maxlength = 70>
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaConceptoTecnico.jsp&titulo=Listado Concepto Tècnico&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilConceptoTecnico.jsp&titulo=Filtrado ConceptoTecnico','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>