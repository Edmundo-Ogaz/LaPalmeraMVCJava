<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="subfamilia" class="Subfamilia" scope="session"/>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
String filfamilia = request.getParameter("filfamilia");
String codigo = request.getParameter("seleccion");
String nombre = "";
String familia = "";

subfamilia.setCodigoSubfamilia(codigo);
if (subfamilia.buscar()){
nombre = subfamilia.getNombreSubfamilia();
familia = subfamilia.getCodigoFamilia();
}
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
<form name = formulario action = "/LaPalmera/servlet/ModificaSubfamilia" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filfamilia" value="<%=filfamilia%>"/>
<input type="hidden" name="codigo" value="<%=codigo%>"/>
<table border = 0>
<tr>
<td>
Código Subfamilia</td>
<td>
<input type=text name=codigo2 disabled="disabled" value="<%=codigo%>">
</td>
</tr>
<tr>
<td>
Nombre Subfamilia</td>
<td>
<input type=text name=nombre value = '<%=nombre%>' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Familia
</td>
<td><SELECT size="1" name="familia">
<OPTION VALUE=-1>SELECCIONE FAMILIA</OPTION>
<%ManejadorFamilia manFamilia = new ManejadorFamilia();%>
<%ArrayList<Familia> arrayFamilia = new ArrayList<Familia>();
arrayFamilia = manFamilia.consultar();%>
<%Iterator itFamilia = arrayFamilia.iterator();%>
<%while (itFamilia.hasNext())
{
Familia familia2= (Familia) itFamilia.next();
if (familia.equals(familia2.getCodigoFamilia())){%>
<OPTION selected="selected" VALUE="<%=familia2.getCodigoFamilia()%>"> <%=familia2.getNombreFamilia()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=familia2.getCodigoFamilia()%>"> <%=familia2.getNombreFamilia()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaSubfamilia.jsp&titulo=Listado Subfamilia&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>&filfamilia=<%=filfamilia%>','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
