<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filproducto = "";
%>
<html>
<head>
<!-Hoja de estilos del calendario -->
<link rel="stylesheet" type="text/css" media="all" href="calendar-system.css" title="win2k-cold-1" />
<!-- librería principal del calendario -->
<script type="text/javascript" src="calendar.js"></script>
<!-- librería para cargar el lenguaje deseado -->
<script type="text/javascript" src="lang/calendar-es.js"></script>
<!-- librería que declara la función Calendar.setup, que ayuda a generar un calendario en unas pocas líneas de código -->
<script type="text/javascript" src="calendar-setup.js"></script>
<!-- script que define y configura el calendario-->
<script>
<!--
function ValidaEntrada() {
  
  if (document.formulario.filproducto.value.length < 1) {
    alert("No ha seleccionado productos para la busqueda.");
    return (false);
  }
   
   /*var entrar = confirm("¿Desea Continuar?")
	if ( !entrar )
      return (false);
	else*/
	  return (true);
}
//-->
</script>
</head>
<form name="formulario" action="/LaPalmera/jsp/ControlFilIngresoInsumo.jsp" onSubmit="return ValidaEntrada()"-->
<!--form action = "/LaPalmera/jsp/ControlFilIngresoInsumo.jsp"-->
<table border = 0>
<tr>
<td>
Producto
</td>
<td>
<SELECT size=1 name=filproducto>
<OPTION VALUE="">SELECCIONE PRODUCTO</OPTION>
<% 
ArrayList<Insumo> arrayInsumo = new ArrayList<Insumo>();
ManejadorInsumo manInsumo  = new ManejadorInsumo();
arrayInsumo=manInsumo.consultar();
Iterator itInsumo = arrayInsumo.iterator();
while (itInsumo.hasNext())
    {
Insumo insumo = (Insumo) itInsumo.next();
%>
<OPTION VALUE=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></OPTION>
<%}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoIngresoInsumo.jsp&titulo=Nuevo Ingreso Insumo&filproducto=<%=filproducto%>','_self')">Nuevo Ingreso Insumo</button>
<!--input type=submit name=Enviar value = 'Nuevo Ingreso Insumo'-->
</form>
</body>
</html>

