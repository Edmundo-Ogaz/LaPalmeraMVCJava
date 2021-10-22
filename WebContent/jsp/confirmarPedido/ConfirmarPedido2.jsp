<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>

<!--jsp:useBean id="cabezaPedido" class="CabezaPedido" scope="session"/-->
<!--jsp:useBean id="despachoPedido" class="DespachoPedido" scope="session"/-->
<!--jsp:useBean id="confirmacionPedido" class="ConfirmacionPedido" scope="session"/-->
<!--jsp:useBean id="cliente" class="Cliente" scope="session"/-->

<%
String cantidadinsumo = "";
String numeropedido = request.getParameter("seleccion");
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

//String nombredespacho = "";
String direcciondespacho = "";
//String comunadespacho = "";
//String telefonodespacho = "";
String fechaentrega = "";
String horaentrega = "";

DespachoPedido despachoPedido = new DespachoPedido();
despachoPedido.setNumeroPedido(numeropedido);
if (despachoPedido.buscar()){
//nombredespacho = despachoPedido.getNombreDespacho();
direcciondespacho = despachoPedido.getDireccionDespacho();
//omunadespacho = despachoPedido.getCodigoComuna();
//telefonodespacho = despachoPedido.getTelefonoDespacho();
fechaentrega = despachoPedido.getFechaEntregaDespacho();
horaentrega = despachoPedido.getHoraEntregaDespacho();
}

String nombre ="";
String apellido ="";
String direccion ="";
//String comuna = "";
//String fechanacimiento ="";
String telefono ="";
//String email ="";
//String paginaweb ="";
//String telefonoconfirmacion = "";
//String fechaconfirmacion = "";
//String horaconfirmacion = "";

ConfirmacionPedido confirmacionPedido = new ConfirmacionPedido();
confirmacionPedido.setNumeroPedido(numeropedido);
if (confirmacionPedido.buscar()){
nombre = confirmacionPedido.getNombreCliente();
apellido = confirmacionPedido.getApellidoCliente();
direccion = confirmacionPedido.getDireccionCliente();
//comuna = confirmacionPedido.getCodigoComuna();

//if (!confirmacionPedido.getFechaNacimientoCliente().equals("9999-12-31"))
//fechanacimiento = confirmacionPedido.getFechaNacimientoCliente();

telefono = confirmacionPedido.getTelefonoCliente();
//email = confirmacionPedido.getEmailCliente();
//paginaweb = confirmacionPedido.getPaginaWebCliente();
//telefonoconfirmacion = confirmacionPedido.getTelefonoConfirmacion();
//fechaconfirmacion = confirmacionPedido.getFechaConfirmacion();
//horaconfirmacion = confirmacionPedido.getHoraConfirmacion();
}

//String tipocliente ="";
//String observacion ="";

//cliente.setRutCliente(rut);
//if (cliente.buscar()){
//tipocliente = cliente.getCodigoTipoCliente();
//observacion = cliente.getObservacionCliente();
//}
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

<script language="JavaScript">
<!--
var ajax;
function funcionCallback()
{
	// Comprobamos si la peticion se ha completado (estado 4)
	if( ajax.readyState == 4 )
	{
		// Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
		if( ajax.status == 200 )
		{
			// Escribimos el resultado en la pagina HTML mediante DHTML
								
			document.all.salidaDetallePedido.innerHTML = ajax.responseText;
			
		}
	}
}

function recuperaDetallePedido()
{
		alert ("hola");
  if (document.formulario.producto.value == -1) {
    alert("Ingrese el Producto.");
    document.formulario.producto.focus();
    return (false);
  }
  if (document.formulario.cantidadproducto.value.length < 1) {
    alert("Escriba la Cantidad del Producto.");
    document.formulario.cantidadproducto.focus();
    return (false);
  }
  
  var checkOK = "0123456789";
  var checkStr = document.formulario.cantidadproducto.value;
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
    alert("Escriba sólo números en el campo \"Cantidad\".");
    document.formulario.cantidadproducto.focus();
    return (false);
  }   
  
  /*if (document.formulario.unidadmedida.value == -1) {
    alert("Ingrese la Unidad de Medida.");
    document.formulario.unidadmedida.focus();
    return (false);
  }*/
	
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
	//alert(document.formulario.producto.value);
	var valor1 = document.formulario.producto.value;
    //alert(document.formulario.cantidadproducto.value);
	var valor2 = document.formulario.cantidadproducto.value;
	//var valor3 = document.formulario.unidadmedida.value;
	//var valor4 = document.formulario.cantidadentrega.value;
	ajax.open( "GET", "/LaPalmera/jsp/CargarDetallePedido.jsp?producto="+valor1+"&cantidadproducto="+valor2, true );
	ajax.send( "" );


return (true);
}

function recuperaDetallePedido2()
{
		alert ("hola");
  if (document.formulario.producto.value == -1) {
    //alert("Ingrese el Producto.");
    //document.formulario.producto.focus();
    return (false);
  }
  if (document.formulario.cantidadproducto.value.length < 1) {
    //alert("Escriba la Cantidad del Producto.");
    //document.formulario.cantidadproducto.focus();
    return (false);
  }
  
  var checkOK = "0123456789";
  var checkStr = document.formulario.cantidadproducto.value;
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
    alert("Escriba sólo números en el campo \"Cantidad\".");
    document.formulario.cantidadproducto.focus();
    return (false);
  }   
  
  /*if (document.formulario.unidadmedida.value == -1) {
    alert("Ingrese la Unidad de Medida.");
    document.formulario.unidadmedida.focus();
    return (false);
  }*/
	
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
	//alert(document.formulario.producto.value);
	var valor1 = document.formulario.producto.value;
    //alert(document.formulario.cantidadproducto.value);
	var valor2 = document.formulario.cantidadproducto.value;
	//var valor3 = document.formulario.unidadmedida.value;
	//var valor4 = document.formulario.cantidadentrega.value;
	ajax.open( "GET", "/LaPalmera/jsp/CargarDetallePedido2.jsp?producto="+valor1+"&cantidadproducto="+valor2, true );
	ajax.send( "" );


return (true);
}

function sacaDetallePedido()
{

	alert ("hola");
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
   	//alert(document.formulario.cantidaddetallepedido.value);
	var valor1 = document.formulario.cantidaddetallepedido.value;
	//alert(document.formulario.cantidadproducto.value);
	var valor2 = document.formulario.cantidadproducto.value;

	ajax.open( "GET", "/LaPalmera/jsp/SacarDetallePedido.jsp?cantidaddetallepedido="+valor1+"&cantidadproducto="+valor2, true );
	ajax.send( "" );
}
-->
</script>

<script>
<!--
function ValidaEntrada() {
  
  if (document.formulario.nombre.value.length < 1) {
    alert("Escriba el Nombre del Cliente.");
    document.formulario.nombre.focus();
    return (false);
  }
  
  if (document.formulario.apellido.value.length < 1) {
    alert("Escriba el Apellido del Cliente.");
    document.formulario.apellido.focus();
    return (false);
  }
  
  if (document.formulario.telefono.value.length < 1) {
    alert("Escriba el Teléfono del Cliente.");
    document.formulario.telefono.focus();
    return (false);
  }
  
  if (!document.formulario.direcciondespacho[0].checked){ 
   if (!document.formulario.direcciondespacho[1].checked){
    if (!document.formulario.direcciondespacho[2].checked){
    alert("Escriba el Lugar de despacho.");
    return (false);
  }}}
  
  if (document.formulario.direcciondespacho[2].checked){ 
   if (document.formulario.direccion.value.length < 1){
     alert("Escriba la Dirección de Despacho.");
    document.formulario.direccion.focus();
    return (false);
   }}	
  /*if (document.pedido.direccion.value.length < 1) {
    alert("Escriba la Dirección del Cliente.");
    document.pedido.direccion.focus();
    return (false);
  }*/
  
  if (document.formulario.fechaentrega.value.length < 1) {
    alert("Escriba la fecha de Entrega.");
    document.formulario.fechaentrega.focus();
    return (false);
  }
  
  if (document.formulario.horaentrega.value.length < 1) {
    alert("Escriba la Hora de Entrega.");
    document.formulario.horaentrega.focus();
    return (false);
  }
  
   if (!document.formulario.confirmacion[0].checked){ 
   if (!document.formulario.confirmacion[1].checked){
    if (!document.formulario.confirmacion[2].checked){
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
<form name="formulario" action="/LaPalmera/servlet/ModificaPedido" onSubmit="return ValidaEntrada()">
<!--form name="formulario" action="/LaPalmera/jsp/Fin.jsp" onSubmit="return ValidaEntrada()"-->
     <input type="hidden" name="numeropedido" value="<%=numeropedido%>"/>
	 <input type="hidden" name="fecha" value="<%=fecha%>"/>
	 <input type="hidden" name="hora" value="<%=hora%>"/>
	 <!--input type="hidden" name="tipocliente" value="<%--=tipocliente--%>"/-->
	 <!--input type="hidden" name="observacion" value="<%--=observacion--%>"/-->
	 

Datos del Producto

<jsp:useBean id="arrayDetallePedidoTorta" class="ArrayList<DetallePedido>" scope="session"/>

<table border="0">
<tr>
<td>
<span id="salidaDetallePedido">
<table border="1">
<tr>
<th>
Producto
</th>
<th>
Cantidad
</th>
<th>
Precio
</th>
<th>
Insumo
</th>
</tr>
<%ArrayList<DetallePedido> arrayDetallePedido = new ArrayList<DetallePedido>();
ManejadorDetallePedido manDetallePedido = new ManejadorDetallePedido();
manDetallePedido.setNumeroPedido(numeropedido);
arrayDetallePedido = manDetallePedido.consultar();
Iterator iteratDetallePedido = arrayDetallePedido.iterator();
int i = 1;
int k = 0;
while (iteratDetallePedido.hasNext())
{
DetallePedido detallePedido = (DetallePedido) iteratDetallePedido.next();%>

<%arrayDetallePedidoTorta.add(detallePedido);%>

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
<%=detallePedido.getCantidadProducto()%>
<input type="hidden" name=cantidadproducto<%=i%> value="<%=detallePedido.getCantidadProducto()%>"/></td>
<td>
<%=detallePedido.getPrecioProducto()%>
<input type="hidden" name=precioproducto<%=i%> value="<%=detallePedido.getPrecioProducto()%>"/></td>
<td>
<table border="1">
<tr>
<th>
Insumo</th>
<th>
Cantidad</th>
<th>
Unidad Medida</th>
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
  Producto producto2 = new Producto();
  producto2.setCodigoProducto(ingrediente.getCodigoInsumo());
  if (producto2.buscar())
  {%>
  <%=producto2.getNombreProducto()%>
  <%}%>
  <%
  Insumo insumo2 = new Insumo();
  insumo2.setCodigoInsumo(ingrediente.getCodigoInsumo());
  if (insumo2.buscar())
  {%>
  <%=insumo2.getNombreInsumo()%>
  <%}%>
<input type="hidden" name="insumo<%=i%><%=j%>" value="<%=ingrediente.getCodigoInsumo()%>"/></td>
<td>
<%cantidadinsumo = String.valueOf(Integer.parseInt(detallePedido.getCantidadProducto())*Integer.parseInt(ingrediente.getCantidadInsumo()));%>
&nbsp;
<%=cantidadinsumo%>
<input type="hidden" name="cantidadinsumo<%=i%><%=j%>" value="<%=cantidadinsumo%>"/>
</td>
<td>
  <%=ingrediente.getCodigoUnidadMedida()%>
<input type="hidden" name="unidadmedida<%=i%><%=j%>" value="<%=ingrediente.getCodigoUnidadMedida()%>"/>
</td>
<td>
  <%
  Stock stock = new Stock();
  stock.setCodigoProducto(ingrediente.getCodigoInsumo());
  if (stock.buscar())
  {%>
  <%
  if (Integer.parseInt(cantidadinsumo) < Integer.parseInt(stock.getStockDisponible()))
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
<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/>
</td>
</tr>
<%i++;%>
<%k++;%>
<%}%>
<tr>
<td>&nbsp;

</td>
<td>
Total
</td>
<td>
<%=preciototal%>
<input type="hidden" name="total" value="<%=preciototal%>"/></td>
</tr>
</table>
<input type="hidden" name="producto" value="0"/>
<input type="hidden" name="cantidadproducto" value="0"/>
<%k++;%>

<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
<input type="hidden" name="cantidaddetallepedido" value="<%=k%>"/>
</span>
</td>
<tr>
<td colspan="2">
<table>
<tr>
<td>
<button type="button" onClick="recuperaDetallePedido()">Agregar Producto</button>
</td>
<td>
<button type="button" onClick="sacaDetallePedido()">Sacar Ultimo Producto</button>
</td>
</tr>
</table>
</td>
</tr>
</table>

Datos de Cliente

<table>
<!--tr>
<td>
<p>Rut: *1</p>	  
</td>
<td>
<input name="rut" type="text" size="20" value="<%--=rut--%>">      
</td>
</tr-->
<tr>
<td>
<p>Nombre: *</p>	  
</td>
<td>
<input name = "nombre" type="text" size="40" value="<%=nombre%>"/>      
</td>
</tr>
<tr>
<td>
<p>Apellido: </p>	  
</td>
<td>
<input name = "apellido" type="text" size="40" value="<%=apellido%>"/>      
</td>
</tr>
<tr>
<td>
<p>Direcci&oacute;n: *</p>	  
</td>
<td>
<input name="direccion" type="text" size="40" value="<%=direccion%>"/>	  
</td>
</tr>
<!--tr>
<td>
<p>Comuna: *1 </p>	  
</td-->
<%--ManejadorComuna manComuna = new ManejadorComuna();--%>
<%--ArrayList<Comuna> arrayComuna = new ArrayList<Comuna>();
arrayComuna = manComuna.consultar();--%>
<%--Iterator itComuna = arrayComuna.iterator();--%>
<!--td><SELECT size="1" name="comuna">
<OPTION VALUE=-1>SELECCIONE COMUNA</OPTION-->
<%--while (itComuna.hasNext())
{
Comuna comunaCliente = (Comuna) itComuna.next();--%>
<%--if (comuna.equals(comunaCliente.getCodigoComuna())){--%>
<!--OPTION selected="selected" VALUE="<%--=comunaCliente.getCodigoComuna()--%>"> <%--=comunaCliente.getNombreComuna()--%></OPTION-->
<%--}else{--%>
<!--OPTION VALUE="<%--=comunaCliente.getCodigoComuna()--%>"> <%--=comunaCliente.getNombreComuna()--%></OPTION-->
<%--}--%>
<%--}--%>
<!--/SELECT-->
<!--/td>
</tr-->
<tr>
<td>
<p>T&eacute;lefono:* ** </p>	  
</td>
<td> 
<input name="telefono" type="text" size="40" value="<%=telefono%>"/>	  
</td>
</tr>
<!--tr>
<td>
<p>Fecha de Nacimiento:</p>	  
</td>
<td>
<input type="text" name="fechanacimiento" id="campo_fecha" value="<%--=fechanacimiento--%>"/>
<input type="button" id="lanzador" value="..."-->
<!-- script que define y configura el calendario--> 
<!--script type="text/javascript">
Calendar.setup({
inputField     :    "campo_fecha",     // id del campo de texto
ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto
button     :    "lanzador"     // el id del botón que lanzará el calendario
});
</script>
</td-->
<!--td> 
<input name="fechanacimiento" type="text" size="40" value="<%--=fechanacimiento--%>"/>	  
</td-->
<!--/tr-->
<!--tr>
<td>
<p>E-mail: </p>	  
</td>
<td> 
<input name="email" type="text" size="40" value="<%--=email--%>"/>	  
</td>
</tr-->
<!--tr>
<td>
<p>P&aacute;gina Web: </p>	  
</td>
<td> 
<input name="paginaweb" type="text" size="40" value="<%--=paginaweb--%>"/>	  
</td>
</tr-->
<tr>
<td colspan="2">
<p>* Datos Obligatorios</p>
</td>
</tr>
<tr>
<td colspan="2">
<p>** A este n&uacute;mero se confirmar&aacute; el pedido. Se llamar&aacute; de parte de "Pasteler&iacute;a La Palmera"</p>
</td>
</tr>
</table>

	  

Datos para el Despacho

<table>
  <!--tr>
<td>
<p>A Nombre de: *1 </p>					
</td>
<td><input name="nombredespacho" type="text" size="40" value="<%--=nombredespacho--%>"/>
</td>
</tr-->
  <tr>
    <td><p>Direcci&oacute;n: *</p></td>
  </tr>
  <tr>
    <td><% if (direcciondespacho.equals("O")){%>
        <table>
          <tr>
            <td> Sucursal Osa </td>
            <td><input type="radio" name="direcciondespacho" value="O" checked="checked"/>
            </td>
          </tr>
          <tr>
            <td> Sucursal Uribe </td>
            <td><input type="radio" name="direcciondespacho" value="U"/>
            </td>
          </tr>
          <tr>
            <td> Direccion Cliente </td>
            <td><input type="radio" name="direcciondespacho" value="C"/>
            </td>
          </tr>
        </table>
      <%}else{
if (direcciondespacho.equals("U")){
%>
        <table>
          <tr>
            <td> Sucursal Osa </td>
            <td><input type="radio" name="direcciondespacho" value="O"/>
            </td>
          </tr>
          <tr>
            <td> Sucursal Uribe </td>
            <td><input type="radio" name="direcciondespacho" value="U" checked="checked"/>
            </td>
          </tr>
          <tr>
            <td> Direccion Cliente </td>
            <td><input type="radio" name="direcciondespacho" value="C"/>
            </td>
          </tr>
        </table>
      <%}else{
if (direcciondespacho.equals("C")){
%>
        <table>
          <tr>
            <td> Sucursal Osa </td>
            <td><input type="radio" name="direcciondespacho" value="O" checked="checked"/>
            </td>
          </tr>
          <tr>
            <td> Sucursal Uribe </td>
            <td><input type="radio" name="direcciondespacho" value="U"/>
            </td>
          </tr>
          <tr>
            <td> Direccion Cliente </td>
            <td><input type="radio" name="direcciondespacho" value="C" checked="checked"/>
            </td>
          </tr>
        </table>
      <%}else{%>
	  <table>
          <tr>
            <td> Sucursal Osa </td>
            <td><input type="radio" name="direcciondespacho" value="O" />
            </td>
          </tr>
          <tr>
            <td> Sucursal Uribe </td>
            <td><input type="radio" name="direcciondespacho" value="U"/>
            </td>
          </tr>
          <tr>
            <td> Direccion Cliente </td>
            <td><input type="radio" name="direcciondespacho" value="C" />
            </td>
          </tr>
        </table>
	  
	  <%}}}%>
        <!--input name="direcciondespacho" type="text" size="40" value="<%--=direcciondespacho--%>"/-->
    </td>
  </tr>
  <!--tr>
<td>
<p>Comuna: *1 </p>					
</td-->
  <%--ManejadorComuna manComunaDespacho = new ManejadorComuna();--%>
  <%--ArrayList<Comuna> arrayComunaDespacho = new ArrayList<Comuna>();
arrayComunaDespacho = manComunaDespacho.consultar();--%>
  <%--Iterator itComunaDespacho = arrayComunaDespacho.iterator();--%>
  <!--td><SELECT size="1" name="comunadespacho">
<OPTION VALUE=-1>SELECCIONE COMUNA DESPACHO</OPTION-->
  <%--while (itComunaDespacho.hasNext())
{
Comuna comunaDespacho = (Comuna) itComunaDespacho.next();--%>
  <%--if (comunadespacho.equals(comunaDespacho.getCodigoComuna())){--%>
  <!--OPTION selected="selected" VALUE="<%--=comunaDespacho.getCodigoComuna()--%>"> <%--=comunaDespacho.getNombreComuna()--%></OPTION-->
  <%--}else{--%>
  <!--OPTION VALUE="<%--=comunaDespacho.getCodigoComuna()--%>"> <%--=comunaDespacho.getNombreComuna()--%></OPTION-->
  <%--}--%>
  <%--}--%>
  <!--/SELECT>
</td>
</tr-->
  <!--tr>
<td>
<p>T&eacute;lefono: *1 </p>					
</td>
<td>
<input name="telefonodespacho" type="text" size="40" value="<%--=telefonodespacho--%>"/>					
</td>
</tr-->
  <tr>
    <td><p>Fecha de Entrega: *1</p></td>
    <td><input type="text" name="fechaentrega" id="campo_fecha" value="<%=fechaentrega%>"/>
        <input type="button" id="lanzador" value="..."/>
        <!-- script que define y configura el calendario-->
        <script type="text/javascript">
Calendar.setup({
inputField     :    "campo_fecha",     // id del campo de texto
ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto
button     :    "lanzador"     // el id del botón que lanzará el calendario
});
  </script></td>
  </tr>
  <tr>
    <td><p>Hora de Entrega: *1 </p></td>
    <td><select name="horaentrega">
      <option><%=horaentrega%>
        <option>10:00-12:00
          <option>12:00-14:00
          <option>14:00-16:00
          <option>16:00-18:00
          <option>18:00-20:00
          </select></td>
  </tr>
  <tr>
    <td colspan="2"><p>*1 Datos Obligatorios</p></td>
  </tr>
</table>
Comentario
<table>
<tr>
<td>
<textarea name="comentario" rows="5" cols="55" ><%=comentario%></textarea>
</td>
</tr>
</table>

<table>
<tr>
<td>
Confirmar Pedido
</td>
</tr>
<tr>
<td>
Por Confirmar
</td>
<td>
<input type="radio" name="confirmacion" value="I"/> 
</td>
</tr>
<tr>
<td>
Confirmado
</td>
<td>
<input type="radio" name="confirmacion" value="C"/> 
</td>
<tr>
<td>
Rechazado
</td>
<td>
<input type="radio" name="confirmacion" value="R"/> 
</td>
</tr>
</table>
<input name="Enviar" value="Enviar" type="submit">
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaConfirmarPedido.jsp&titulo=Pedidos para Confirmar','_self')">Volver</button>
</form>
</body>
</html>
