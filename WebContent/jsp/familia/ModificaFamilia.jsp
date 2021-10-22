<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="familia" class="Familia" scope="session"/>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
String codigo = request.getParameter("seleccion");
String nombre = "";

familia.setCodigoFamilia(codigo);
if (familia.buscar()){
nombre = familia.getNombreFamilia();
}
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {

  if (formulario.codigo.value.length < 1) {
    alert("Escriba el código de la Familia.");
    formulario.codigo.focus();
    return (false);
  }

  if (formulario.nombre.value.length < 1) {
    alert("Escriba el nombre de la Familia.");
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
<form name = formulario action = "/LaPalmera/servlet/ModificaFamilia" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="codigo" value="<%=codigo%>"/>
<table border = 0>
<tr>
<td>
Código del Familia
</td>
<td>
<input type=text name=codigo2 value="<%=codigo%>" disabled="disabled">
</td>
</tr>
<tr>
<td>
Nombre del Familia</td>
<td>
<input type=text name=nombre value = '<%=nombre%>' size = 70 maxlength = 70>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaFamilia.jsp&titulo=Lista Familia&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
