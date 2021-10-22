<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
ArrayList<Stock> arrayStockDetallePedido = new ArrayList<Stock>();
ManejadorStock manStock= new ManejadorStock();
arrayStockDetallePedido= manStock.consultar();
%>
<%
String cantidadinsumo = "";
//String numeropedido = "13";
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

function recuperaOtroDetallePedido() {

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
  
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
	var valor1 = document.formulario.producto.value;
	var valor2 = document.formulario.cantidadproducto.value;
	ajax.open( "GET", "/LaPalmera/jsp/CargarOtroDetallePedido.jsp?producto="+valor1+"&cantidadproducto="+valor2, true );
	ajax.send( "" );

return (true);
}

function recuperaDetallePedido() {

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
  
    // Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
	var valor1 = document.formulario.producto.value;
    var valor2 = document.formulario.cantidadproducto.value;
	ajax.open( "GET", "/LaPalmera/jsp/CargarDetallePedido.jsp?producto="+valor1+"&cantidadproducto="+valor2, true );
	ajax.send( "" );

return (true);
}

function sacaDetallePedidoUltimo() {
    
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
	
	var valor1 = document.formulario.cantidaddetallepedido.value;
	var valor2 = document.formulario.cantidadproducto.value;
	
	//ajax.open( "GET", "/LaPalmera/jsp/SacarDetallePedido.jsp?cantidaddetallepedido="+valor1+"&cantidadproducto="+valor2, true );
	ajax.open( "GET", "/LaPalmera/jsp/SacarDetallePedidoUltimo.jsp?eliminar="+valor1+"&cantidadproducto="+valor2, true );
	ajax.send( "" );
}

function sacaDetallePedido() {
    
	var aux = 0;    
	//alert ("**"+document.formulario.op.length);	
	if (document.formulario.op.length == 1){
	   alert("No hay Registros para eliminar.");
       return (false);
  	}
	
	if (typeof(document.formulario.op.length) != "undefined"){
		for (j=0;j<document.formulario.op.length;j++){
       		if (document.formulario.op[j].checked){
	   	  		aux = 1;	
          		break;
    		}
		}
	}else{
		if (document.formulario.op.checked){
		    aux = 1;
		}
	}
	if (aux == 0 ){ 
    	alert("Seleccione un Registro.");
    	return (false);
  	}
	
	
	
	arrayproducto = new Array();
	var i = 0;
	//alert (document.formulario.op.length);
	if (typeof(document.formulario.op.length) != "undefined"){
		//alert (document.formulario.op.length);
		for (j=0;j<document.formulario.op.length;j++){
		     if (document.formulario.op[j].checked == true ){
        		//alert ("mas");
                arrayproducto[i] = document.formulario.op[j].value;
			    i++;
			 } 
		}
	}else{
	    //alert (document.formulario.op.value);
        //alert ("uno");
		arrayproducto[0] = document.formulario.op.value; 
	}
	
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;
	// Enviamos la peticion
	
	var valor1 = arrayproducto.toString();
	var valor1 = "-1,"+valor1;
	var valor2 = arrayproducto.length;
	var valor3 = document.formulario.insumo.value;
	//alert (valor1);
	//alert (valor2);
	//alert ("hola2");
	//alert (array.length);
	//var valor1 = document.formulario.cantidaddetallepedido.value;
	//var valor2 = document.formulario.cantidadproducto.value;
	
	//ajax.open( "GET", "/LaPalmera/jsp/SacarDetallePedido.jsp?cantidaddetallepedido="+valor1+"&cantidadproducto="+valor2, true );
	ajax.open( "GET", "/LaPalmera/jsp/SacarDetallePedido.jsp?eliminar="+valor1+"&largoeliminar="+valor2+"&insumo="+valor3, true );
	ajax.send( "" );

return (true)
}

-->
</script>

<script>
  
  function seleccionar_todo(){
     for (i=0;i<document.formulario.elements.length;i++)
        if(document.formulario.elements[i].type == "checkbox")
           document.formulario.elements[i].checked=1
  }

  function deseleccionar_todo(){
     for (i=0;i<document.formulario.elements.length;i++)
        if(document.formulario.elements[i].type == "checkbox")
           document.formulario.elements[i].checked=0
  } 

</script>

<script>
<!--
function ValidaEntrada() {
  
  if (document.formulario.producto.value == -1) {
    alert("Ingrese Producto.");
    document.formulario.producto.focus();
	return (false);
  }
  
  if (document.formulario.cantidadproducto.value.length < 1) {
    alert("Ingrese Cantidad Producto.");
    document.formulario.cantidadproducto.focus();
	return (false);
  }
  
  if (document.formulario.insumo.value.length < 1) {
    alert("No ha consultado el Stock del Producto.");
    document.formulario.insumo.focus();
	return (false);
  }
  
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
  
  if (document.formulario.fechaentrega.value.length < 1) {
    alert("Escriba la fecha de Entrega.");
    document.formulario.fechaentrega.focus();
    return (false);
  }
  
  var hoy=new Date();
  var anohoy=hoy.getYear()+1900; 
  var meshoy=hoy.getMonth()+1;
  var diahoy=hoy.getDate();
  var fechahoy=anohoy+""+meshoy+""+diahoy;
  var varano=formulario.fechaentrega.value.substr(0, 4); 
  var varmes=formulario.fechaentrega.value.substr(5, 2);  
  if(varmes<10) {
    var varmes= formulario.fechaentrega.value.substr(6, 1); 
  } 
  var vardia=formulario.fechaentrega.value.substr(8, 2);
  if(vardia<10) {
    var vardia= formulario.fechaentrega.value.substr(9, 1); 
  } 
  var varfecha=varano+varmes+vardia;
  
  if (parseInt(varfecha) <= parseInt(fechahoy)) {
    alert("Fecha de Entrega no Permitida..");
    formulario.fechaentrega.focus();
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

<!--Datos del Producto-->

<jsp:useBean id="arrayDetallePedidoTorta" class="ArrayList<DetallePedido>" scope="session"/>

<a href="javascript:seleccionar_todo()">Marcar todos</a> |
<a href="javascript:deseleccionar_todo()">Marcar ninguno</a> 
<button type="button" onClick="return sacaDetallePedido()">Eliminar</button>

<span id="salidaDetallePedido">

<table border="1">
<tr>
<th>
Selec
</th>
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
<%arrayDetallePedidoTorta.clear();%>
<%
ArrayList<DetallePedido> arrayDetallePedido = new ArrayList<DetallePedido>();
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
<input type="checkbox" name="op" value="<%=k%>">
<!--input type="checkbox" name="NomCheck[]" value="1"/-->
</td>
<td>
<%
Producto producto = new Producto();
producto.setCodigoProducto(detallePedido.getCodigoProducto());
if (producto.buscar())
{
out.print(producto.getNombreProducto());
}
%>
<input type="hidden" name=producto<%=i%> value="<%=detallePedido.getCodigoProducto()%>"/>
</td>
<td>
<%=detallePedido.getCantidadProducto()%>
<input type="hidden" name=cantidadproducto<%=i%> value="<%=detallePedido.getCantidadProducto()%>"/>
</td>
<td>
<%=detallePedido.getPrecioProducto()%>
<input type="hidden" name=precioproducto<%=i%> value="<%=detallePedido.getPrecioProducto()%>"/>
</td>
<td>
<table border="1" width="100%">
<tr>
<th>
Insumo
</th>
<th>
Cantidad
</th>
<th>
U/M
</th>
<th>
Stock Disponible
</th>
<th>
U/M
</th>
</tr>	
<%int j = 1;%>
<%
ArrayList<Ingrediente> arrayIngrediente = new ArrayList<Ingrediente>();
ManejadorIngrediente manIngrediente = new ManejadorIngrediente();
manIngrediente.setCodigoProducto(detallePedido.getCodigoProducto());
arrayIngrediente = manIngrediente.consultar();
Iterator itIngrediente = arrayIngrediente.iterator();
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

<%
String stockdisponible = "0";
String unidadmedida = "";
for (int m=0; m < arrayStockDetallePedido.size(); m++)
  {
  Stock puntero = arrayStockDetallePedido.get(m);
  if (puntero.getCodigoProducto().equals(ingrediente.getCodigoInsumo()))
    {
    stockdisponible = puntero.getStockDisponible();
    unidadmedida = puntero.getCodigoUnidadMedida();
    float c = Float.parseFloat(puntero.getStockDisponible());
    float c2 = Float.parseFloat(cantidadinsumo);
    String totalc = String.valueOf(c-c2);
    puntero.setStockDisponible(totalc);
    arrayStockDetallePedido.set(m,puntero);
    }
  }
%>
<td>
&nbsp;
<%if (Float.parseFloat(cantidadinsumo) < Float.parseFloat(stockdisponible))
{%>
<font color="#0000FF"><%=stockdisponible.substring(0,cantidadinsumo.indexOf(".")+4)%></font>
<%}else{%>
<font color="#FF0000"><%=stockdisponible.substring(0,cantidadinsumo.indexOf(".")+4)%></font>
<%}%>	  
</td>
<td>
&nbsp;
<font color="#0000FF"><%=unidadmedida%></font>
</td>
</tr>
<input type="hidden" name=ingrediente value="<%=j%>"/>
<%j++;%>
<%}%>
</table>
<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/>
</td>
</tr>
<%i++;%>
<%k++;%>
<%}%>
<input type="hidden" name="producto" value="0"/>
<input type="hidden" name="cantidadproducto" value="0"/>
<input type="hidden" name="insumo" value="0"/>
<%k++;%>
<tr>
<td>&nbsp;

</td>
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
<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
<input type="hidden" name="cantidaddetallepedido" value="<%=k%>"/>
<button type="button" onClick="recuperaOtroDetallePedido()">Agregar Otro Producto</button>
<!--button type="button" onClick="sacaDetallePedidoUltimo()">Sacar Ultimo Producto</button-->
</span>

<table>
<tr>
<td>
Datos de Cliente
</td>
</tr>
<tr>
<td>
Nombre: *	  
</td>
<td>
<input name = "nombre" type="text" size="40" value="<%=nombre%>"/>      
</td>
</tr>
<tr>
<td>
Apellido: *	  
</td>
<td>
<input name = "apellido" type="text" size="40" value="<%=apellido%>"/>      
</td>
</tr>
<tr>
<td>
<p>Direcci&oacute;n: </p>	  
</td>
<td>
<input name="direccion" type="text" size="40" value="<%=direccion%>"/>	  
</td>
</tr>
<tr>
<td>
T&eacute;lefono:* ** 	  
</td>
<td> 
<input name="telefono" type="text" size="40" value="<%=telefono%>"/>	  
</td>
</tr>
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
<tr>
<td>
Direcci&oacute;n: *
</td>
</tr>
<tr>
<td>
<% if (direcciondespacho.equals("O")){%>
<table>
<tr>
<td> 
Sucursal Osa 
</td>
<td>
<input type="radio" name="direcciondespacho" value="O" checked="checked"/>
</td>
</tr>
<tr>
<td> 
Sucursal Uribe 
</td>
<td>
<input type="radio" name="direcciondespacho" value="U"/>
</td>
</tr>
<tr>
<td> 
Direccion Cliente 
</td>
<td>
<input type="radio" name="direcciondespacho" value="C"/>
</td>
</tr>
</table>
<%}else{
if (direcciondespacho.equals("U")){
%>
<table>
<tr>
<td> 
Sucursal Osa 
</td>
<td>
<input type="radio" name="direcciondespacho" value="O"/>
</td>
</tr>
<tr>
<td> 
Sucursal Uribe 
</td>
<td>
<input type="radio" name="direcciondespacho" value="U" checked="checked"/>
</td>
</tr>
<tr>
<td> 
Direccion Cliente 
</td>
<td>
<input type="radio" name="direcciondespacho" value="C"/>
</td>
</tr>
</table>
<%}else{
if (direcciondespacho.equals("C")){
%>
<table>
<tr>
<td> 
Sucursal Osa 
</td>
<td>
<input type="radio" name="direcciondespacho" value="O" checked="checked"/>
</td>
</tr>
<tr>
<td> 
Sucursal Uribe 
</td>
<td>
<input type="radio" name="direcciondespacho" value="U"/>
</td>
</tr>
<tr>
<td> 
Direccion Cliente 
</td>
<td>
<input type="radio" name="direcciondespacho" value="C" checked="checked"/>
</td>
</tr>
</table>
<%}else{%>
<table>
<tr>
<td> 
Sucursal Osa 
</td>
<td>
<input type="radio" name="direcciondespacho" value="O" />
</td>
</tr>
<tr>
<td> 
Sucursal Uribe 
</td>
<td>
<input type="radio" name="direcciondespacho" value="U"/>
</td>
</tr>
<tr>
<td>
Direccion Cliente 
</td>
<td>
<input type="radio" name="direcciondespacho" value="C" />
</td>
</tr>
</table>
<%}}}%>

</td>
</tr>
<tr>
<td>
Fecha de Entrega: *
</td>
<td>
<input type="text" name="fechaentrega" id="campo_fecha" value="<%=fechaentrega%>"/>
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
<td>
Hora de Entrega: * 
</td>
<td>
<select name="horaentrega">
<option><%=horaentrega%></option>
<option>10:00-12:00</option>
<option>12:00-14:00</option>
<option>14:00-16:00</option>
<option>16:00-18:00</option>
<option>18:00-20:00</option>
</select>
</td>
</tr>
<tr>
<td colspan="2"><p>* Datos Obligatorios</p></td>
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
Confirmar Pedido *
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
<tr>
<td colspan="2"><p>* Datos Obligatorios</p></td>
</tr>
</table>
<input name="Enviar" value="Enviar" type="submit">
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaConfirmarPedido.jsp&titulo=Pedidos para Confirmar','_self')">Volver</button>
</form>
</body>
</html>
