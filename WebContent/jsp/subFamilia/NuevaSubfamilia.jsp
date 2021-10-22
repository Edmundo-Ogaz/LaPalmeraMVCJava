<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
String filfamilia = request.getParameter("filfamilia");
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
    
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el código del Producto.");
    formulario.codigo.focus();
    return (false);
  }

  if (formulario.nombre.value.length < 1) {
    alert("Escriba el nombre del producto.");
    formulario.nombre.focus();
    return (false);
  }
 
  if (formulario.familia.value == -1) {
    alert("Escriba la Familia del Producto.");
    formulario.familia.focus();
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
<form name = formulario action = "/LaPalmera/servlet/GrabaSubfamilia" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filfamilia" value="<%=filfamilia%>"/>
<table border = 0>
<tr>
<td>
Código Subfamilia
</td>
<td>
<input type="text" name="codigo"  size = "1">
</td>
</tr>
<tr>
<td>
Nombre Subfamilia
</td>
<td>
<input type=text name=nombre value = '' size = 70 maxlength = 70>
</td>
</tr>
<tr>
<td>
Familia
</td>
<%ManejadorFamilia manFamilia = new ManejadorFamilia();%>
<%ArrayList<Familia> arrayFamilia = new ArrayList<Familia>();;
arrayFamilia = manFamilia.consultar();%>
<%Iterator itFamilia= arrayFamilia.iterator();%>
<td><SELECT size="1" name="familia">
<OPTION selected="selected" VALUE=-1>SELECCIONE FAMILIA</OPTION>
<%while (itFamilia.hasNext())
{
Familia Familia= (Familia) itFamilia.next();%>
<OPTION VALUE="<%=Familia.getCodigoFamilia()%>"> <%=Familia.getNombreFamilia()%></OPTION>
<%}%>
</SELECT>
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaSubfamilia.jsp&titulo=Listado Subfamilia&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>&filfamilia=<%=filfamilia%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilComuna.jsp&titulo=Filtrado Comuna','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>