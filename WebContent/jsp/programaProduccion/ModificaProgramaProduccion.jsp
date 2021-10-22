<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<!--jsp:useBean id="programaProduccion" class="ProgramaProduccion" scope="session"/-->
<%
String filordenfabricacion = request.getParameter("filordenfabricacion");
String filfechainicio = request.getParameter("filfechainicio");
String filfechatermino = request.getParameter("fifechatermino");
String fillineaproduccion = request.getParameter("fillineaproduccion");
String filestadoprograma = request.getParameter("filestadoprograma");
%>
<%
String ordenfabricacion= request.getParameter("seleccion");
String fecha = "";
String hora = "";
String producto = "";
String lineaproduccion = "";
//String funcionario = "";
String cantidadprogramada = "";
String cantidadfabricada = "";
String saldoporfabricar = "";
String estadoordenfabricacion = "";

ProgramaProduccion programaProduccion = new ProgramaProduccion();
programaProduccion.setCodigoOrdenFabricacion(ordenfabricacion);
if (programaProduccion.buscar()){
fecha = programaProduccion.getFechaProgramaProduccion();
hora = programaProduccion.getHoraProgramaProduccion();
producto = programaProduccion.getCodigoProducto();
lineaproduccion = programaProduccion.getCodigoLineaProduccion();
//funcionario = programaProduccion.getRutFuncionario();
cantidadprogramada = programaProduccion.getCantidadProgramada();
cantidadfabricada = programaProduccion.getCantidadFabricada();
saldoporfabricar = programaProduccion.getSaldoPorFabricar();
estadoordenfabricacion = programaProduccion.getEstadoOrdenFabricacion();
}
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
  /*if (formulario.lineaproduccion.value == -1) {
    alert("Escriba el Código del Area.");
    formulario.lineaproduccion.focus();
    return (false);
  }*/
  
  if (formulario.cantidadprogramada.value.length < 1) {
    alert("Escriba el stok critico del producto.");
    formulario.cantidadprogramada.focus();
    return (false);
  }

  var checkOK = "0123456789";
  var checkStr = formulario.cantidadprogramada.value;
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
    alert("Escriba sólo números en el campo \"Cantidad Programada\".");
    formulario.cantidadprogramada.focus();
    return (false);
  }
  if (formulario.cantidadprogramada.value < formulario.cantidadfabricada.value) {
    alert("La Cantidad Programada no es Valida.");
    formulario.cantidadprogramada.focus();
    return (false);
  }
 
  if (formulario.estado.value == -1) {
    alert("Escriba el Estado de la Orden de Fabricación.");
    formulario.estado.focus();
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
<form name = formulario action = "/LaPalmera/servlet/ModificaProgramaProduccion" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filordenfabricacion" value="<%=filordenfabricacion%>"/>
<input type="hidden" name="filfechainicio" value="<%=filfechainicio%>"/> 
<input type="hidden" name="filfechatermino" value="<%=filfechatermino%>"/> 
<input type="hidden" name="fillineaproduccion" value="<%=fillineaproduccion%>"/>
<input type="hidden" name="filestadoprograma" value="<%=filestadoprograma%>"/>
<input type="hidden" name="ordenfabricacion" value="<%=ordenfabricacion%>"/>
<input type="hidden" name="lineaproduccion" value="<%=lineaproduccion%>"/>
<input type="hidden" name="producto" value="<%=producto%>"/>
<input type="hidden" name="cantidadfabricada" value="<%=cantidadfabricada%>"/>
<input type="hidden" name="saldoporfabricar" value="<%=saldoporfabricar%>"/>
<input type="hidden" name="fecha" value="<%=fecha%>"/>
<input type="hidden" name="hora" value="<%=hora%>"/>


<table border = 0>
<tr>
<td>
Orden Fabricación</td>
<td>
<input type=text name="ordenfabricacion2" value="<%=ordenfabricacion%>" disabled="disabled"></td>
</tr>
<tr>
<td>
Producto</td>
<td>
<SELECT size="1" name="producto2" disabled="disabled">
<OPTION VALUE=-1>SELECCIONE PRODUCTO</OPTION>

<%ManejadorProducto manProducto= new ManejadorProducto();%>
<%ArrayList<Producto> arrayProducto = new ArrayList<Producto>();;
manProducto.setTipoProducto("T");
arrayProducto = manProducto.consultar();%>
<%Iterator itProducto = arrayProducto.iterator();%>
<%while (itProducto.hasNext())
{
Producto producto2= (Producto) itProducto.next();
if (producto.equals(producto2.getCodigoProducto())){%>
<OPTION selected="selected" VALUE="<%=producto2.getCodigoProducto()%>"> <%=producto2.getNombreProducto()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=producto2.getCodigoProducto()%>"> <%=producto2.getNombreProducto()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
<tr>
<td>
L&iacute;nea Producción</td>
<td>
<SELECT size=1 name=lineaproduccion2 disabled="disabled">
<OPTION VALUE=-1>SELECCIONE LINEA PRODUCCIÓN</OPTION>
<%ManejadorLineaProduccion manLineaProduccion = new ManejadorLineaProduccion();%>
<%ArrayList<LineaProduccion> arrayLineaProduccion = new ArrayList<LineaProduccion>();;
arrayLineaProduccion = manLineaProduccion.consultar();%>
<%Iterator itLineaProduccion = arrayLineaProduccion.iterator();%>
<%while (itLineaProduccion.hasNext())
{
LineaProduccion lineaProduccion = (LineaProduccion) itLineaProduccion.next();
if (lineaproduccion.equals(lineaProduccion.getCodigoLineaProduccion())){%>
<OPTION selected="selected" VALUE="<%=lineaProduccion.getCodigoLineaProduccion()%>"> <%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}else{%>
<OPTION VALUE="<%=lineaProduccion.getCodigoLineaProduccion()%>"> <%=lineaProduccion.getNombreLineaProduccion()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>Cantidad Programada</td>
<td><input name = "cantidadprogramada" type="type" value="<%=cantidadprogramada%>" />
</td>
</tr>
<tr>
<td>Cantidad Fabricada</td>
<td><input name = "cantidadfabricada2" type="type" value="<%=cantidadfabricada%>" disabled="disabled"/></td>
</tr>
<tr>
<td>Saldo por Fabricar</td>
<td><input name = "saldoporfabricar2" type="type" value="<%=saldoporfabricar%>" disabled="disabled"/></td>
</tr>
<tr>
<td>Estado Orden Fabricación</td>
<td>
<select size=1 name=estado>
    <option value=-1>SELECCIONE ESTADO</option>
    <%if (estadoordenfabricacion.equals("A")){%>
       <option selected="selected" value="A">Activo</option>
       <option value="S">Suspendido</option>
	   <option value="T">Terminado</option>
	<%}else{%>
       <%if (estadoordenfabricacion.equals("S")){%>
	     <option value="A">Activo</option>
         <option selected="selected" value="S">Suspendido</option>
	     <option value="T">Terminado</option>
	   <%}else{%>
          <%if (estadoordenfabricacion.equals("T")){%>
             <option value="A">Activo</option>
             <option value="S">Suspendido</option>
			 <option selected="selected" value="T">Terminado</option>
    	   <%}%>
       <%}%>
     <%}%>
   </select>
  </td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProgramaProduccion.jsp&titulo=Listado Programa Producción&filordenfabricacion=<%=filordenfabricacion%>&filfechainicio=<%=filfechainicio%>&filfechatermino=<%=filfechatermino%>&fillineaproduccion=<%=fillineaproduccion%>&filestadoprograma=<%=filestadoprograma%>','_self')">Volver</button>
</form>
</body>
</html>
