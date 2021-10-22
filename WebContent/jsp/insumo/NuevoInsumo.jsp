<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
String filunidadmedida = request.getParameter("filunidadmedida");
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
  
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el código del Insumo.");
    formulario.codigo.focus();
    return (false);
  }
 
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el nombre del Insumo.");
    formulario.nombre.focus();
    return (false);
  }
  
  if (formulario.unidadmedida.value == -1) {
    alert("Escriba la Unidad de Medida del Insumo.");
    formulario.unidadmedida.focus();
    return (false);
  }
  if (formulario.stockcritico.value.length < 1) {
    alert("Escriba el stok critico del Insumo.");
    formulario.stockcritico.focus();
    return (false);
  }
var checkOK = "0123456789";
  var checkStr = formulario.stockcritico.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0; i < checkStr.length; i++) {
    ch = checkStr.charAt(i);
    for (j = 0; j < checkOK.length; j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length) {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid) {
    alert("Escriba sólo números en el campo \"Stock Critico\".");
    formulario.stockcritico.focus();
    return (false);
  }
  
  if (formulario.peso.value.length < 1) {
    alert("Escriba el peso del Insumo.");
    formulario.peso.focus();
    return (false);
  }
var checkOK = "0123456789";
  var checkStr = formulario.peso.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0; i < checkStr.length; i++) {
    ch = checkStr.charAt(i);
    for (j = 0; j < checkOK.length; j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length) {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid) {
    alert("Escriba sólo números en el campo \"Peso\".");
    formulario.peso.focus();
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
<form name = formulario action = "/LaPalmera/servlet/GrabaInsumo" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filunidadmedida" value="<%=filunidadmedida%>"/>
<table border = 0>
<tr>
<td>
Código del Insumo
</td>
<td>
<input type="text" name="codigo"  size = "1">
</td>
</tr>
<tr>
<td>
Nombre del Insumo
</td>
<td>
<input type=text name=nombre value = '' size = 70 maxlength = 70>
</td>
</tr>
<tr>
<td>Unidad de medida</td>
<%ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();%>
<%ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();;
arrayUnidadMedida = manUnidadMedida.consultar();%>
<%Iterator itUnidadMedida = arrayUnidadMedida.iterator();%>
<td><SELECT size="1" name="unidadmedida">
<OPTION selected="selected" VALUE=-1>SELECCIONE UNIDAD MEDIDA</OPTION>
<%while (itUnidadMedida.hasNext())
{
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();%>
<OPTION VALUE="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
<%}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Stock Cr&iacute;tico
</td>
<td><input name = "stockcritico" type="type" /></td>
</tr>
<tr>
<td>
Peso
</td>
<td><input name = "peso" type="type" /></td>
</tr>
<tr>
<td>
Observaci&oacute;n
</td>
<td>
<TEXTAREA name="observacion" rows = 4 cols = 60></TEXTAREA>
</td>
</tr>
</table>

<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaInsumo.jsp&titulo=Listado Insumo&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>&filunidadmedida=<%=filunidadmedida%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilInsumo.jsp&titulo=Filtrado Insumo','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>