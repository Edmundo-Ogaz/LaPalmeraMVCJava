<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filnumeropedido = request.getParameter("filnumeropedido");
String filcliente = request.getParameter("filcliente");
String filfechainicio = request.getParameter("filfechainicio");
String filfechatermino = request.getParameter("filfechatermino");
String filestadopedido = request.getParameter("filestadopedido");
%>
<%
String cantidadinsumo = "";

String numeropedido = request.getParameter("seleccion");
//String numeropedido = "4";

String nombreapellido = "";
String fecha = "";
String hora = "";
String preciototal = "";
String confirmacion = "";
String comentario = "";

CabezaPedido cabezaPedido = new CabezaPedido();
cabezaPedido.setNumeroPedido(numeropedido);
if (cabezaPedido.buscar()){
nombreapellido = cabezaPedido.getNombreCliente();
fecha = cabezaPedido.getFechaPedido();
hora = cabezaPedido.getHoraPedido();
preciototal = cabezaPedido.getPrecioTotalPedido();
confirmacion = cabezaPedido.getConfirmacionPedido();
comentario = cabezaPedido.getObservacionPedido();
}

String direcciondespacho = "";
String fechaentrega = "";
String horaentrega = "";

DespachoPedido despachoPedido = new DespachoPedido();
despachoPedido.setNumeroPedido(numeropedido);
if (despachoPedido.buscar()){
direcciondespacho = despachoPedido.getDireccionDespacho();
fechaentrega = despachoPedido.getFechaEntregaDespacho();
horaentrega = despachoPedido.getHoraEntregaDespacho();
}

String nombre ="";
String apellido ="";
String direccion ="";
String telefono ="";

ConfirmacionPedido confirmacionPedido = new ConfirmacionPedido();
confirmacionPedido.setNumeroPedido(numeropedido);
if (confirmacionPedido.buscar()){
nombre = confirmacionPedido.getNombreCliente();
apellido = confirmacionPedido.getApellidoCliente();
direccion = confirmacionPedido.getDireccionCliente();
telefono = confirmacionPedido.getTelefonoCliente();
}
%>
<html>
<head>
<title>Pasteleria La Palmera</title>
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
  
  if (document.pedido.nombre.value.length < 1) {
    alert("Escriba el Nombre del Cliente.");
    document.pedido.nombre.focus();
    return (false);
  }
  
  if (document.pedido.apellido.value.length < 1) {
    alert("Escriba el Apellido del Cliente.");
    document.pedido.apellido.focus();
    return (false);
  }
  
  if (document.pedido.telefono.value.length < 1) {
    alert("Escriba el Teléfono del Cliente.");
    document.pedido.telefono.focus();
    return (false);
  }
  
  if (!document.pedido.direcciondespacho[0].checked){ 
   if (!document.pedido.direcciondespacho[1].checked){
    if (!document.pedido.direcciondespacho[2].checked){
    alert("Escriba el Lugar de despacho.");
    return (false);
  }}}
  
  if (document.pedido.direcciondespacho[2].checked){ 
   if (document.pedido.direccion.value.length < 1){
     alert("Escriba la Dirección de Despacho.");
    document.pedido.direccion.focus();
    return (false);
   }}	
  
  if (document.pedido.fechaentrega.value.length < 1) {
    alert("Escriba la fecha de Entrega.");
    document.pedido.fechaentrega.focus();
    return (false);
  }
  
  if (document.pedido.horaentrega.value.length < 1) {
    alert("Escriba la Hora de Entrega.");
    document.pedido.horaentrega.focus();
    return (false);
  }
  
   if (!document.pedido.confirmacion[0].checked){ 
   if (!document.pedido.confirmacion[1].checked){
    if (!document.pedido.confirmacion[2].checked){
    alert("Elija la Confirmación del Pedido.");
    return (false);
  }}}
   
   var entrar = confirm("¿Desea Continuar?")
	if ( !entrar )
      return (false);
	else
	  return (true);
}
//-->
</script>
</head>
<body>
<form action="/LaPalmera/servlet/ModificaPedido" name="pedido" onSubmit="return ValidaEntrada()">
<input type="hidden" name="filnumeropedido" value="<%=filnumeropedido%>"/> 
<input type="hidden" name="filcliente" value="<%=filcliente%>"/>
<input type="hidden" name="filfechainicio" value="<%=filfechainicio%>"/>
<input type="hidden" name="filfechatermino" value="<%=filfechatermino%>"/>
<input type="hidden" name="filestadopedido" value="<%=filestadopedido%>"/>

<input type="hidden" name="numeropedido" value="<%=numeropedido%>"/>
<input type="hidden" name="fecha" value="<%=fecha%>"/>
<input type="hidden" name="hora" value="<%=hora%>"/>

<h3>Datos de Cliente</h3>
<table>
<tr>
<td>
Nombre	  
</td>
<td>
<input type="text" name="nombre" value="<%=nombre%>" size="60"/>
</td>
<td>
Apellido	  
</td>
<td>
<input type="text" name="apellido" value="<%=apellido%>" size="60"/>   
</td>
</tr>
<tr>
<td>
Direcci&oacute;:
</td>
<td>
<input type="text" name="direccion" value="<%=direccion%>" size="60"/>   
</td>
<td>
T&eacute;lefono 	  
</td>
<td> 
<input type="text" name="telefono" value="<%=telefono%>"/>   
</td>
</tr>
</table>

	  

<b>Datos para el Despacho</b>

<table>
  <tr>
<td>
Direcci&oacute;n Despacho
</td>
<td>
<input type="text" name="Direciondespacho" value="<%=direcciondespacho%>"/>   
</td>
<td>
Fecha de Entrega 
</td>
<td>
<input type="text" name="fechaentrega" value="<%=fechaentrega%>"/>   
</td>
<td>Hora de Entrega  
</td>
<td>
<input type="text" name="fechaentrega" value="<%=horaentrega%>"/>   
</td>
</tr>
</table>
<b>Comentario</b>
<table>
<tr>
<td>
<textarea name="comentari" cols="70">
<%=comentario%>
</textarea>
</td>
</tr>
</table>

<b>Estado del Pedido</b>
<table>
<tr>
<td>
Confirmacion  
</td>
<td>
<%
if (confirmacion.equals("I"))
  {
%>
  <input type="text" name="confirmacio" value="Ingresado"/>  
<%
  }
 else
   {
   if (confirmacion.equals("C"))
     {
%>
	   <input type="text" name="confirmacio" value="Confirmado"/>
<%
   }
  else
	{
	if (confirmacion.equals("R"))
	  {
%>
	    <input type="text" name="confirmacio" value="Rechazado"/>
<%
      }
	}
  }
%>   
<%--=confirmacion--%>
</td>
</tr>
</table>

<h4>Datos del Producto</h4>

<table border="1">
<tr>
<th>
Producto</th>
<th>
Cantidad</th>
<th>
Precio</th>
<th>
Insumo</th>
</tr>
<%ArrayList<DetallePedido> arrayDetallePedido = new ArrayList<DetallePedido>();
ManejadorDetallePedido manDetallePedido = new ManejadorDetallePedido();
manDetallePedido.setNumeroPedido(numeropedido);
arrayDetallePedido = manDetallePedido.consultar();
Iterator iteratDetallePedido = arrayDetallePedido.iterator();
int i = 1;
while (iteratDetallePedido.hasNext())
{
DetallePedido detallePedido = (DetallePedido) iteratDetallePedido.next();%>
<tr>
<td>
<%
ArrayList<Producto> arrayProducto= new ArrayList<Producto>();
ManejadorProducto manProducto = new ManejadorProducto();
manProducto.setCodigoProducto(detallePedido.getCodigoProducto());
arrayProducto= manProducto.consultar();
Iterator itProducto= arrayProducto.iterator();
  while (itProducto.hasNext())
  {
  Producto producto= (Producto) itProducto.next();
  %>
  &nbsp;
  <%=producto.getNombreProducto()%>
  <%}%>
<input type="hidden" name=producto<%=i%> value="<%=detallePedido.getCodigoProducto()%>"/></td>
<td>
<%out.println(detallePedido.getCantidadProducto());%>
<input type="hidden" name=cantidad<%=i%> value="<%=detallePedido.getCantidadProducto()%>"/></td>
<td>
<%out.println(detallePedido.getPrecioProducto());%>
<input type="hidden" name=precio<%=i%> value="<%=detallePedido.getPrecioProducto()%>"/></td>
<td>
<table border="1">
<tr>
<th>
Insumo</th>
<th>
Cantidad</th>
<th>
U/M</th>
<th>
Stock Disponible</th>
<th>
Unidad Medida</th>
</tr>					
<%
ArrayList<Ingrediente> arrayIngrediente = new ArrayList<Ingrediente>();
ManejadorIngrediente manIngrediente = new ManejadorIngrediente();
manIngrediente.setCodigoProducto(detallePedido.getCodigoProducto());
arrayIngrediente = manIngrediente.consultar();
Iterator itIngrediente = arrayIngrediente.iterator();
int j = 1;
  while (itIngrediente.hasNext())
  {
  Ingrediente ingrediente = (Ingrediente) itIngrediente.next();
   %>
<tr>

<td>
  &nbsp;
  <%
  Insumo insumo = new Insumo();
  insumo.setCodigoInsumo(ingrediente.getCodigoInsumo());
  if (insumo.buscar())
  {
  out.print(insumo.getNombreInsumo());
  }
  %>
<input type="hidden" name="insumo<%=i%><%=j%>" value="<%=ingrediente.getCodigoInsumo()%>"/>
</td>

<%cantidadinsumo = String.valueOf(Float.parseFloat(detallePedido.getCantidadProducto())*Float.parseFloat(ingrediente.getCantidadInsumo()));%>

<%if (Float.parseFloat(cantidadinsumo) < 1){%>
<td>
     <%=String.valueOf(Float.parseFloat(cantidadinsumo)*1000)%>
</td>
<td>
<%    if (insumo.getCodigoUnidadMedida().equals("KGS")){
         out.print("GRS");
      }else{
	      if (insumo.getCodigoUnidadMedida().equals("LTS")){
             out.print("CM3");	 
}}%>
</td>	     
<%}else{%>
<td>
<%=cantidadinsumo%>
</td>
<td>
<%=insumo.getCodigoUnidadMedida()%>
</td>
<%}%>
<input type="hidden" name="cantidadinsumo<%=i%><%=j%>" value="<%=cantidadinsumo%>"/>
<input type="hidden" name="unidadmedida<%=i%><%=j%>" value="<%=insumo.getCodigoUnidadMedida()%>"/>

<!--td>
  &nbsp;
  <%-- 
  Producto producto2 = new Producto();
  producto2.setCodigoProducto(ingrediente.getCodigoInsumo());
  if (producto2.buscar())
  {--%>
  <%--=producto2.getNombreProducto()--%>
  <%--}--%>
  <%--
  Insumo insumo2 = new Insumo();
  insumo2.setCodigoInsumo(ingrediente.getCodigoInsumo());
  if (insumo2.buscar())
  {--%>
  <%--=insumo2.getNombreInsumo()--%>
  <%--}--%>
<input type="hidden" name="insumo<%--=i--%><%--=j--%>" value="<%--=ingrediente.getCodigoInsumo()--%>"/>
</td-->
<!--td>

<%--cantidadinsumo = String.valueOf(Float.parseFloat(detallePedido.getCantidadProducto())*Float.parseFloat(ingrediente.getCantidadInsumo()));--%>
&nbsp;
<%--=cantidadinsumo--%>
<input type="hidden" name="cantidadinsumo<%--=i--%><%--=j--%>" value="<%--=cantidadinsumo--%>"/>
</td-->
<!--td>
  <%--=ingrediente.getCodigoUnidadMedida()--%>
<input type="hidden" name="unidadmedida<%--=i--%><%--=j--%>" value="<%--=ingrediente.getCodigoUnidadMedida()--%>"/>
</td-->

<td>
  <%
  Stock stock = new Stock();
  stock.setCodigoProducto(ingrediente.getCodigoInsumo());
  if (stock.buscar())
  {%>
  <%
  if (Float.parseFloat(cantidadinsumo) < Float.parseFloat(stock.getStockDisponible()))
  {%>
  <font color="#0000FF"><%=stock.getStockDisponible()%></font>
  <%}else{%>
  <font color="#FF0000"><%=stock.getStockDisponible()%></font>
  <%}%>	  
</td>
<td>
&nbsp;
<font color="#0000FF"><%=stock.getCodigoUnidadMedida()%></font>
</td>
</tr>
  <%j++;%>
<%}}%>
</table>
<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/></td>
</tr>
<%i++;%>
<%}%>
<tr>
<td></td>
<td>
Total</td>
<td>
<%out.println(preciototal);%>
<input type="hidden" name="total" value="<%=preciototal%>"/></td>
</tr>
</table>
<input type="hidden" name=ultimafilai value="<%=i-1%>"/>
<!--input name="Enviar" value="Enviar" type="submit"-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaPedido.jsp&titulo=Listado de Pedidos&filnumeropedido=<%=filnumeropedido%>&filcliente=<%=filcliente%>&filfechainicio=<%=filfechainicio%>&filfechatermino=<%=filfechatermino%>&filestadopedido=<%=filestadopedido%>','_self')">Volver</button>
</form>
</body>
</html>
