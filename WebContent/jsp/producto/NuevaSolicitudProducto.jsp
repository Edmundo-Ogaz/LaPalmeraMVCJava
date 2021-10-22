<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
ArrayList<Stock> arrayStockSolicitudProducto= new ArrayList<Stock>();
ManejadorStock manStock= new ManejadorStock();
arrayStockSolicitudProducto= manStock.consultar();
%>
<html>
<head>
<title>Pasteleria La Palmera</title>
<!--script>
document.onkeydown = function(e)
{
if(e)
document.onkeypress = function(){return true;}

var evt = e?e:event;
if(evt.keyCode==116)
{
if(e)
document.onkeypress = function(){return false;}
else
{
evt.keyCode = 0;
evt.returnValue = false;
}
}
} 
</script-->

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
			document.all.salidaSolicitudProducto.innerHTML = ajax.responseText;
		}
	}
}

function recuperaOtraSolicitudProducto() {

  if (document.formulario.ingrediente.value == 1) {
    alert("No tiene Ingredientes asociados el Producto.");
    //document.formulario.ingrediente.focus();
    return (false);
  }
  
  if (document.formulario.stock.value == "N") {
    alert("Hay productos que no tienen stock sufuciente.");
    //document.formulario.ingrediente.focus();
    return (false);
  }
  
  /*if (document.formulario.producto.value == -1) {
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
  } */  
  
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
	ajax.open( "GET", "/LaPalmera/jsp/CargarSolicitudProducto.jsp?producto="+valor1+"&cantidadproducto="+valor2, true );
	ajax.send( "" );

return (true);
}

function recuperaSolicitudProducto() {
  //alert ("hola");
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
	ajax.open( "GET", "/LaPalmera/jsp/CargarSolicitudProducto2.jsp?producto="+valor1+"&cantidadproducto="+valor2, true );
	ajax.send( "" );

return (true);
}

function sacaSolicitudProductoUltimo() {

	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
	var valor1 = document.formulario.cantidadsolicitudproducto.value;
	var valor2 = document.formulario.cantidadproducto.value;
	ajax.open( "GET", "/LaPalmera/jsp/SacarSolicitudProductoUltimo.jsp?cantidadsolicitudproducto="+valor1+"&cantidadproducto="+valor2, true );
	ajax.send( "" );
}

function sacaSolicitudProducto() {
    
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
	//alert (valor3);
	
	//alert (array.length);
	//var valor1 = document.formulario.cantidaddetallepedido.value;
	//var valor2 = document.formulario.cantidadproducto.value;
	
	//ajax.open( "GET", "/LaPalmera/jsp/SacarDetallePedido.jsp?cantidaddetallepedido="+valor1+"&cantidadproducto="+valor2, true );
	ajax.open( "GET", "/LaPalmera/jsp/SacarSolicitudProducto.jsp?eliminar="+valor1+"&largoeliminar="+valor2+"&insumo="+valor3, true );
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
    alert("Ingrese el Producto.");
    document.formulario.producto.focus();
	return (false);
  }
  
  if (document.formulario.cantidadproducto.value.length < 1) {
    alert("Ingrese la cantidad del Producto.");
    document.formulario.cantidadproducto.focus();
	return (false);
  }
  
  if (document.formulario.insumo.value.length < 1) {
    alert("No ha consultado el Stock del Producto.");
    document.formulario.insumo.focus();
	return (false);
  }
  
  if (document.formulario.ultimafilaproducto.value == 1) {
    alert("No tiene productos Asociados.");
    document.formulario.ultimafilaproducto.focus();
	return (false);
  }
  
  if (document.formulario.ingrediente.value == 1) {
    alert("El producto no tiene Ingredientes asociados.");
    return (false);
  }
  
  if (document.formulario.stock.value == "N") {
    alert("Hay productos que no tienen stock sufuciente.");
    return (false);
  }
  
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
    //alert(varfecha+" <= "+fechahoy);
	alert("Fecha de Entrega no Permitida..");
    formulario.fechaentrega.focus();
    return (false);
  }
    
  if (document.formulario.horaentrega.value.length < 1) {
    alert("Escriba la Hora de Entrega.");
    document.formulario.horaentrega.focus();
    return (false);
  }
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
<form name="formulario" action="/LaPalmera/servlet/GrabaSolicitudProducto" onSubmit="return ValidaEntrada()">
<!--form name="formulario" action="/LaPalmera/jsp/Fin.jsp" onSubmit="return ValidaEntrada()"-->
     
<!--Datos del Producto-->

<jsp:useBean id="arraySolicitudProducto" class="ArrayList<DetallePedido>" scope="session"/>

<a href="javascript:seleccionar_todo()">Marcar todos</a> |
<a href="javascript:deseleccionar_todo()">Marcar ninguno</a> 
<button type="button" onClick="return sacaSolicitudProducto()">Eliminar</button>

<span id="salidaSolicitudProducto">
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
Insumo
</th>
</tr>
<%
Iterator itSolicitudProducto= arraySolicitudProducto.iterator();
int i = 1;
int k = 0;
int j = 1;
String cantidadinsumo = "";
String stock = "S";
while (itSolicitudProducto.hasNext())
{
DetallePedido detallePedido = (DetallePedido) itSolicitudProducto.next();%>

<%--arraySolicitudProducto.add(detallePedido);--%>

<tr>
<td>
<input type="checkbox" name="op" value="<%=k%>">
<!--input type="checkbox" name="NomCheck[]" value="1"/-->
</td>
<td>
<% 
Producto producto2 = new Producto();
producto2.setCodigoProducto(detallePedido.getCodigoProducto());
if (producto2.buscar())
{
out.print(producto2.getNombreProducto());
}
%>
<%--=detallePedido.getCodigoProducto()--%>
<input type="hidden" name=producto<%=i%> value="<%=detallePedido.getCodigoProducto()%>"/></td>
<td>
<%=detallePedido.getCantidadProducto()%>
<input type="hidden" name=cantidadproducto<%=i%> value="<%=detallePedido.getCantidadProducto()%>"/></td>
<!--td>
<%--=detallePedido.getPrecioProducto()--%>
<input type="hidden" name=precioproducto<%--=i--%> value="<%--=detallePedido.getPrecioProducto()--%>"/>
</td-->
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
Unidad Medida
</th>
<th>
Stock Disponible
</th>
<th>
Unidad Medida
</th>
</tr>	
<%
j = 1;
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
<td><%--=stockdisponible.substring(0,stockdisponible.indexOf(".")+2)--%>
     <%String cant =  String.valueOf(Float.parseFloat(cantidadinsumo)*1000);%>
	 <%=cant.substring(0,cant.indexOf(".")+2)%>
     <%--=String.substring(0,String.valueOf(Float.parseFloat(cantidadinsumo)*1000).indexOf(".")+2)--%>
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
<%=cantidadinsumo.substring(0,cantidadinsumo.indexOf(".")+2)%>
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
for (int m=0; m < arrayStockSolicitudProducto.size(); m++)
{
  Stock puntero = arrayStockSolicitudProducto.get(m);
  if (puntero.getCodigoProducto().equals(ingrediente.getCodigoInsumo()))
  { 
    stockdisponible = puntero.getStockDisponible();
	
	unidadmedida = puntero.getCodigoUnidadMedida();
    float c = Float.parseFloat(puntero.getStockDisponible());
    float c2 = Float.parseFloat(cantidadinsumo);
    String totalc = String.valueOf(c-c2);
    puntero.setStockDisponible(totalc);
    arrayStockSolicitudProducto.set(m,puntero);
  }
}
%>
<td>
&nbsp;
<%
if (Float.parseFloat(cantidadinsumo) < Float.parseFloat(stockdisponible))
{
%>
<font color="#0000FF"><%=stockdisponible.substring(0,stockdisponible.indexOf(".")+2)%></font>
<%}else{%>
<font color="#FF0000"><%=stockdisponible.substring(0,stockdisponible.indexOf(".")+2)%></font>
<%
stock = "N";
}
%>	  
</td>
<td>
&nbsp;
<font color="#0000FF"><%=unidadmedida%></font>
</td>
</tr>
<%j++;%>
<%}%>
<%
if (j==1){
%>
<tr>
<td colspan="5">
<font color="#FF0000">No tiene Ingredientes asociados este producto</font>
</td>
</tr>
<%}%>
</table>
<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/>
</td>
</tr>
<%i++;%>
<%k++;%>
<%}%>
<tr>
<td>
<input type="checkbox" name="op" value="<%=k%>">
</td>
<td>
<select size=1 name="producto">
<option value=-1>SELECCIONE PRODUCTO</option>
<% 
ArrayList<Producto> arrayProducto= new ArrayList<Producto>();
ManejadorProducto manProducto= new ManejadorProducto();
//manProducto.setTipoProducto("T");
arrayProducto=manProducto.consultar();
Iterator itProducto= arrayProducto.iterator();
while (itProducto.hasNext())
{
Producto producto2= (Producto) itProducto.next();
%>
<option value=<%=producto2.getCodigoProducto()%>> <%=producto2.getNombreProducto()%></option>
<%}%>
</select>
</td>
<td>
<input type="text" name="cantidadproducto" size="3"/>
</td>
<td>
<input type="hidden" name="insumo" value=""/>
</td>
</tr>
</table>
<!--input type="hidden" name="producto" value="0"/-->
<!--input type="hidden" name="cantidadproducto" value="0"/-->
<%k++;%>
<input type="hidden" name="stock" value="<%=stock%>"/>
<input type="hidden" name="ingrediente" value="<%=j%>"/>
<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
<input type="hidden" name="cantidadsolicitudproducto" value="<%=k%>"/>
<button type="button" onClick="recuperaSolicitudProducto()">Consultar Insumos</button>
<!--button type="button" onClick="sacaSolicitudProductoUltimo()">Sacar Ultimo Producto</button-->
</span>


<table>
<tr>
<td colspan="2">
<font size="+1">Datos para el Despacho</font>
</td>
</tr>
<tr>
<td>
Fecha de Entrega:
</td>
<td>
<input type="text" name="fechaentrega" id="campo_fecha"/>
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
Hora de Entrega:
</td>
<td>
<select name="horaentrega">
<option></option>
<option>10:00-12:00</option>
<option>12:00-14:00</option>
<option>14:00-16:00</option>
<option>16:00-18:00</option>
<option>18:00-20:00</option>
</select>
</td>
</tr>
</table>

<table>
<tr>
<td>
<font size="+1">Dedicatoria</font>
</td>
<td>
<textarea name="dedicatoria" rows="2" cols="55" ></textarea>
</td>
</tr>
</table>

<table>
<tr>
<td>
<font size="+1">Comentario</font>
</td>
<td>
<textarea name="comentario" rows="2" cols="55" ></textarea>
</td>
</tr>
</table>
<input name="Enviar" value="Enviar Pedido" type="submit">
<!--button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaConfirmarPedido.jsp&titulo=Pedidos para Confirmar','_self')">Volver</button-->
</form>
</body>
</html>

