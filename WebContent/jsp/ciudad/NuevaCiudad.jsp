<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filciudad = request.getParameter("filciudad");
String filregion = request.getParameter("filregion");
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el Código de la Ciudad.");
    formulario.codigo.focus();
    return (false);
  }
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el Nombre de la Ciudad.");
    formulario.nombre.focus();
    return (false);
  }
  if (formulario.region.value == -1) {
    alert("Escriba la Región de la Ciudad.");
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
<form name = formulario action = "/LaPalmera/servlet/GrabaCiudad" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filciudad" value="<%=filciudad%>"/>
<input type="hidden" name="filregion" value="<%=filregion%>"/>
<table border = 0>
<tr>
<td>
Código Ciudad
</td>
<td>
<input type="text" name="codigo"  size = "1">
</td>
</tr>
<tr>
<td>
Nombre Ciudad
</td>
<td>
<input type=text name=nombre value = '' size = 70 maxlength = 70>
</td>
</tr>
<tr>
<td>
Región
</td>
<td>
<SELECT size=1 name=region>
<OPTION VALUE=-1>SELECCIONE REGION</OPTION>
<% {
ArrayList<Region> arrayRegion= new ArrayList<Region>();
ManejadorRegion manRegion= new ManejadorRegion();
arrayRegion=manRegion.consultar();
%>

<%Iterator itRegion= arrayRegion.iterator();
while (itRegion.hasNext())
    {
Region region= (Region) itRegion.next();
%>
<OPTION VALUE=<%=region.getCodigoRegion()%>> <%=region.getNombreRegion()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaCiudad.jsp&titulo=Listado Ciudad&filciudad=<%=filciudad%>&filregion=<%=filregion%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilCiudad.jsp&titulo=Filtrado Ciudad','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>