<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="comuna" class="unab.com.Comuna" scope="session"/>
<%
String filcomuna = request.getParameter("filcomuna");
String filciudad = request.getParameter("filciudad");
String codigo = request.getParameter("seleccion");
String nombre = "";
String ciudad = "";

comuna.setCodigoComuna(codigo);
if (comuna.buscar()){
nombre = comuna.getNombreComuna();
ciudad = comuna.getCodigoCiudad();
}
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
  if (formulario.ciudad.value == -1) {
    alert("Escriba la Ciudad de la Comuna.");
    formulario.ciudad.focus();
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
<form name = formulario action = "/LaPalmera/servlet/ModificaComuna" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcomuna" value="<%=filcomuna%>"/>
<input type="hidden" name="filciudad" value="<%=filciudad%>"/>
<input type="hidden" name="codigo" value="<%=codigo%>"/>
<table border = 0>
<tr>
<td>
Código Comuna
</td>
<td>
<input type=text name=codigo2 value="<%=codigo%>" disabled="disabled">
</td>
</tr>
<tr>
<td>
Nombre Comuna
</td>
<td>
<input type=text name=nombre value = '<%=nombre%>' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Ciudad
</td>
<td>
<SELECT size=1 name=ciudad>
<OPTION VALUE=-1>SELECCIONE CIUDAD</OPTION>
<%
ArrayList<Ciudad> arrayCiudad= new ArrayList<Ciudad>();
ManejadorCiudad manCiudad= new ManejadorCiudad();
arrayCiudad=manCiudad.consultar();
%>

<%Iterator itCiudad= arrayCiudad.iterator();
while (itCiudad.hasNext())
    {
Ciudad ciudad2= (Ciudad) itCiudad.next();
if (ciudad.equals(ciudad2.getCodigoCiudad())){%>
<OPTION selected="selected" VALUE=<%=ciudad2.getCodigoCiudad()%>> <%=ciudad2.getNombreCiudad()%></OPTION>
<%}else{%>
<OPTION VALUE=<%=ciudad2.getCodigoCiudad()%>> <%=ciudad2.getNombreCiudad()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaComuna.jsp&titulo=Listado Comuna&filcomuna=<%=filcomuna%>&filciudad=<%=filciudad%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
