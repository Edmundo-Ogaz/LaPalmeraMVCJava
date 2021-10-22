<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
//String filordenfabricacion= "11-1";
String filordenfabricacion = request.getParameter("filordenfabricacion");
//String ordenfabricacion= "11-1";
String ordenfabricacion = request.getParameter("ordenfabricacion");
//String ultimafila= "0";
String ultimafila = request.getParameter("ultimafila");
String producto = "";
String cantidadprogramada = "";
String cantidadfabricada = "";
String saldoporfabricar = "";

String cantidadinsumototal ="";
//int i = 1;
ProgramaProduccion programaProduccion = new ProgramaProduccion();
programaProduccion.setCodigoOrdenFabricacion(ordenfabricacion);
if (programaProduccion.buscar())
{
producto = programaProduccion.getCodigoProducto();
cantidadprogramada = programaProduccion.getCantidadProgramada();
cantidadfabricada = programaProduccion.getCantidadFabricada();
saldoporfabricar = programaProduccion.getSaldoPorFabricar();
}
%>
<html>
<head>
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
								
			document.all.salidaInsumo.innerHTML = ajax.responseText;
			
		}
	}
}

function funcionCallback1()
{
	// Comprobamos si la peticion se ha completado (estado 4)
	if( ajax.readyState == 4 )
	{
		// Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
		if( ajax.status == 200 )
		{
			// Escribimos el resultado en la pagina HTML mediante DHTML
			document.all.salidaUnidadMedida.innerHTML = "<b>"+ajax.responseText+"<b>";	
			document.formulario.unidadmedida.focus();
		}
	}
}

function recuperaOtraEntregaInsumo()
{
  
  if (document.formulario.ultimafilainsumo.value != 1) {
  if (document.formulario.ubicacion.value == 1) {
    alert("No tiene Ubicacion asociado el ultimo Insumo.");
    //document.formulario.ingrediente.focus();
    return (false);
  }
  
  if (document.formulario.stock.value == "N") {
    alert("El ultimo Insumo no tienen stock sufuciente.");
    //document.formulario.ingrediente.focus();
    return (false);
  }
}
  /*if (document.formulario.insumo.value == -1) {
    alert("Ingrese el Insumo a Entregar.");
    document.formulario.insumo.focus();
    return (false);
  }
  if (document.formulario.cantidadinsumo.value.length < 1) {
    alert("Escriba la Cantidad del Insumo.");
    document.formulario.cantidadinsumo.focus();
    return (false);
  }
  
  var checkOK = "0123456789";
  var checkStr = document.formulario.cantidadinsumo.value;
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
    document.formulario.cantidadinsumo.focus();
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
	var valor1 = document.formulario.insumo.value;
	var valor2 = document.formulario.cantidadinsumo.value;
	var valor3 = document.formulario.cantidadprogramada.value;
	ajax.open( "GET", "/LaPalmera/jsp/CargarEntregaInsumo.jsp?insumo="+valor1+"&cantidadinsumo="+valor2+"&cantidadprogramada="+valor3, true );
	ajax.send( "" );


return (true);
}

function recuperaUbicacionEntregaInsumo() {
  //alert ("hola");
  if (document.formulario.insumo.value == -1) {
    alert("Ingrese el Insumo.");
    document.formulario.insumo.focus();
    return (false);
  }
  if (document.formulario.cantidadinsumo.value.length < 1) {
    alert("Escriba la Cantidad del Insumo.");
    document.formulario.cantidadinsumo.focus();
    return (false);
  }
  
  var checkOK = "0123456789.";
  var checkStr = document.formulario.cantidadinsumo.value;
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
    document.formulario.cantidadinsumo.focus();
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
	var valor1 = document.formulario.insumo.value;
    var valor2 = document.formulario.cantidadinsumo.value;
	var valor3 = document.formulario.cantidadprogramada.value;
	ajax.open( "GET", "/LaPalmera/jsp/CargarEntregaInsumo2.jsp?insumo="+valor1+"&cantidadinsumo="+valor2+"&cantidadprogramada="+valor3, true );
	ajax.send( "" );

return (true);
}

function sacaEntregaInsumoUltimo()
{
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
	var valor1 = document.formulario.cantidadentregainsumo.value;
	var valor2 = document.formulario.cantidadinsumo.value;
	var valor3 = document.formulario.cantidadprogramada.value;
	ajax.open( "GET", "/LaPalmera/jsp/SacarEntregaInsumoUltimo.jsp?cantidadentregainsumo="+valor1+"&cantidadinsumo="+valor2+"&cantidadprogramada="+valor3, true );
	ajax.send( "" );
}

  function recuperaUnidadMedida()
{
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer

	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado	
	ajax.onreadystatechange = funcionCallback1;

	// Enviamos la peticion
	var valor1 = document.formulario.insumo.options[document.formulario.insumo.selectedIndex].value;
	//var valor1 = document.formulario.familiaSel.value;
	//var valor2 = document.formulario.subfamilia.options[document.formulario.subfamilia.selectedIndex].value;
	ajax.open( "GET", "/LaPalmera/jsp/CargaUnidadMedida.jsp?insumo="+valor1, true );	
	//ajax.open( "GET", "/LaPalmera/jsp/CargaCodigoProducto.jsp?subfamiliaSel="+document.formulario.subfamilia.options[document.formulario.subfamilia.selectedIndex].value, true );	
	ajax.send( "" );
}

function sacaEntregaInsumo() {
    
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
	var valor3 = document.formulario.ubicacioninsumo.value;
	//alert (valor1);
	//alert (valor2);
	//alert ("hola2");
	//alert (valor3);
	
	//alert (array.length);
	//var valor1 = document.formulario.cantidaddetallepedido.value;
	//var valor2 = document.formulario.cantidadproducto.value;
	
	//ajax.open( "GET", "/LaPalmera/jsp/SacarDetallePedido.jsp?cantidaddetallepedido="+valor1+"&cantidadproducto="+valor2, true );
	ajax.open( "GET", "/LaPalmera/jsp/SacarEntregaInsumo.jsp?eliminar="+valor1+"&largoeliminar="+valor2+"&ubicacioninsumo="+valor3, true );
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

<script language="JavaScript">
<!--
function validar(formulario) {
  
  if (document.formulario.insumo.value == -1) {
    alert("Ingrese el Insumo.");
    document.formulario.insumo.focus();
    return (false);
  }
  if (document.formulario.cantidadinsumo.value.length < 1) {
    alert("Escriba la Cantidad del Insumo.");
    document.formulario.cantidadinsumo.focus();
    return (false);
  }
  
  var checkOK = "0123456789";
  var checkStr = document.formulario.cantidadinsumo.value;
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
    document.formulario.cantidadinsumo.focus();
    return (false);
  }
  
  if (document.formulario.ultimafilainsumo.value == 1) {
    alert("No tiene Insumos Asociados.");
    //document.formulario.ultimafilaproducto.focus();
	return (false);
  }
  
   if (document.formulario.ubicacion.value == 1) {
    alert("No tiene Ubicacion asociado el Ultimo Insumo.");
    //document.formulario.ingrediente.focus();
    return (false);
  }
  
  if (document.formulario.stock.value == "N") {
    alert("El Ultimo Insumo no tienen stock sufuciente.");
    //document.formulario.ingrediente.focus();
    return (false);
  }
  
  if (document.formulario.ordenfabricacion.value.length < 1) {
    alert("Ingrese la Orden de Fabricación.");
    document.formulario.ordenfabricacion.focus();
    return (false);
  }
  
  if (document.formulario.funcionario.value == -1) {
    alert("Ingrese el Funcionario.");
    document.formulario.funcionario.focus();
    return (false);
  }
    
  var entrar = confirm("¿Desea continuar?")
  if ( !entrar )
  	return (false);
  else
    return (true);
}
-->
</script>
</head>
<body>


<form name = formulario action = "/LaPalmera/servlet/GrabaEntregaInsumo" onSubmit="return validar(this)" target="_self">
<!--form name = formulario action = "/LaPalmera/jsp/Fin.jsp" onSubmit="return validar(this)" target="_self"-->
<input type="hidden" name="filordenfabricacion" value="<%=filordenfabricacion%>"/>
<input type="hidden" name="ordenfabricacion" value="<%=ordenfabricacion%>"/>
<input type="hidden" name="producto" value="<%=producto%>"/>
<input type="hidden" name="cantidadprogramada" value="<%=cantidadprogramada%>"/>
<input type="hidden" name="cantidadfabricada" value="<%=cantidadfabricada%>"/>
<input type="hidden" name="saldoporfabricar" value="<%=saldoporfabricar%>"/>
<table border = "0" width="100%">
<tr>
<td width="136"> 
Orden de Fabricaci&oacute;n
</td>
<td>
<input type=text name="ordenfabricacion2" size = 20 value="<%=ordenfabricacion%>" disabled="disabled"/>
</td>
</tr>
<tr>
<td> 
Producto
</td>
<td>
<%
Producto producto2= new Producto();
producto2.setCodigoProducto(producto);
producto2.buscar();
%>
<input type=text name="producto2" size = 40 value="<%=producto2.getNombreProducto()%>" disabled="disabled"/>
</td>
</tr>
<tr>
<td colspan="2">
<table>
<tr>
<td>
Cantidad Programada<br>
<input type=text name="cantidadprogramada2" size = 20 value="<%=cantidadprogramada%>" disabled="disabled"/>
</td>
<td>
Cantidad Fabricada<br>
<input type=text name="cantidadfabricada2" size = 20 value="<%=cantidadfabricada%>" disabled="disabled"/>
</td>
<td>
Saldo por Fabricar<br>
<input type=text name="saldoporfabricar2" size = 20 value="<%=saldoporfabricar%>" disabled="disabled"/>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="2">
<br>
<jsp:useBean id="arrayIngredienteEntrega" class="ArrayList<Ingrediente>" scope="session"/>

<a href="javascript:seleccionar_todo()">Marcar todos</a> |
<a href="javascript:deseleccionar_todo()">Marcar ninguno</a> 
<button type="button" onClick="return sacaEntregaInsumo()">Eliminar</button>

<span id="salidaInsumo">

<%
int i = 1;
int k = 0;
int j = 1;
String cantidadingrediente = "";
String cantidadubicacion = "";
String stock = "N";
%>
<%
if (ultimafila.equals("0"))
{
%>
<table border="1">
<tr>
<th>
Selec
</th>
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
Ubicación
</th>
</tr>
<%arrayIngredienteEntrega.clear();%>
<%
ArrayList<Ingrediente> arrayIngrediente = new ArrayList<Ingrediente>();
ManejadorIngrediente manIngrediente = new ManejadorIngrediente();
manIngrediente.setCodigoProducto(producto);
arrayIngrediente = manIngrediente.consultar();
Iterator itIngrediente = arrayIngrediente.iterator();
while (itIngrediente.hasNext())
{
Ingrediente ingredienteEntrega = (Ingrediente) itIngrediente.next();

Insumo insumo = new Insumo();
insumo.setCodigoInsumo(ingredienteEntrega.getCodigoInsumo());
if (insumo.buscar()){

cantidadingrediente=String.valueOf(Float.parseFloat(cantidadprogramada)*Float.parseFloat(ingredienteEntrega.getCantidadInsumo()));
//cantidadingrediente = cantidadingrediente.substring(0,cantidadingrediente.indexOf(".")+2);
ingredienteEntrega.setCantidadInsumo(cantidadingrediente);
ingredienteEntrega.setCodigoUnidadMedida(insumo.getCodigoUnidadMedida());
arrayIngredienteEntrega.add(ingredienteEntrega);
}
}
%>

<%
Iterator itIngredienteEntrega = arrayIngredienteEntrega.iterator();
while (itIngredienteEntrega.hasNext())
{
Ingrediente ingrediente= (Ingrediente) itIngredienteEntrega.next();%>

<tr>
<td>
<input type="checkbox" name="op" value="<%=k%>">
<!--input type="checkbox" name="NomCheck[]" value="1"/-->
</td>
<td>
&nbsp;
<%
Insumo insumo2 = new Insumo();
insumo2.setCodigoInsumo(ingrediente.getCodigoInsumo());
if (insumo2.buscar());
out.print(insumo2.getNombreInsumo());
%>
<%--=ingrediente.getCodigoInsumo()--%>
<input type="hidden" name=insumo<%=i%> value="<%=ingrediente.getCodigoInsumo()%>"/>
</td>

<%cantidadingrediente = ingrediente.getCantidadInsumo();%>
<%if (Float.parseFloat(cantidadingrediente) < 1){%>
<td>
     <%=String.valueOf(Float.parseFloat(cantidadingrediente)*1000)%>
</td>
<td>
<%    if (ingrediente.getCodigoUnidadMedida().equals("KGS")){
         out.print("GRS");
      }else{
	      if (ingrediente.getCodigoUnidadMedida().equals("LTS")){
             out.print("CM3");	 
}}%>
</td>	     
<%}else{%>
<td>
<%=cantidadingrediente%>
</td>
<td>
<%=ingrediente.getCodigoUnidadMedida()%>
</td>
<%}%>
<input type="hidden" name=cantidadinsumo<%=i%> value="<%=cantidadingrediente%>"/>
<input type="hidden" name=unidadmedida<%=i%> value="<%=ingrediente.getCodigoUnidadMedida()%>"/>
<!--td>
&nbsp;
<%--cantidadingrediente = ingrediente.getCantidadInsumo();--%>
<%--=cantidadingrediente.substring(0,cantidadingrediente.indexOf(".")+2)--%>
<%--=cantidadingrediente--%>
<input type="hidden" name=cantidadinsumo<%--=i--%> value="<%--=cantidadingrediente--%>"/>
</td>
<td>
<%--=ingrediente.getCodigoUnidadMedida()--%>
<input type="hidden" name=unidadmedida<%=i%> value="<%--=ingrediente.getCodigoUnidadMedida()--%>"/>
</td-->
<td>
<table border="1" width="100%">
<tr>
<th width="110">
Bodega
</th>
<th>
Descripción
</th>
<th>
Fecha Vencimiento
</th>
<th>
Cantidad
</th>
<th>
U/M
</th>
</tr>	
<%
j = 1;
stock = "N";
ArrayList<Ubicacion> arrayUbicacion= new ArrayList<Ubicacion>();
ManejadorUbicacion manUbicacion = new ManejadorUbicacion();
manUbicacion.setCodigoProducto(ingrediente.getCodigoInsumo());
//arrayUbicacion= manUbicacion.consultar();
arrayUbicacion= manUbicacion.consultarPorFechaVencimiento();
Iterator itUbicacion= arrayUbicacion.iterator();
while (itUbicacion.hasNext())
{
Ubicacion ubicacion= (Ubicacion) itUbicacion.next();
%>
<tr>
<td>
&nbsp;
<%
Bodega bodega = new Bodega();
bodega.setCodigoBodega(ubicacion.getCodigoBodega());
if (bodega.buscar());
out.print(bodega.getNombreBodega());
%>
<%--=ubicacion.getCodigoBodega()--%>
<input type="hidden" name="bodega<%=i%><%=j%>" value="<%=ubicacion.getCodigoBodega()%>"/>
</td>
<td>
&nbsp;
<%=ubicacion.getObservacion()%>
<input type="hidden" name="observacion<%=i%><%=j%>" value="<%=ubicacion.getObservacion()%>"/>
</td>
<td>
&nbsp;
<%=ubicacion.getFechaVencimiento()%>
<input type="hidden" name="fechavencimiento<%=i%><%=j%>" value="<%=ubicacion.getFechaVencimiento()%>"/>
<input type="hidden" name="fechaingreso<%=i%><%=j%>" value="<%=ubicacion.getFechaIngreso()%>"/>
<input type="hidden" name="horaingreso<%=i%><%=j%>" value="<%=ubicacion.getHoraIngreso()%>"/>
</td>
<%
cantidadingrediente = String.valueOf(Float.parseFloat(cantidadingrediente) - Float.parseFloat(ubicacion.getCantidad())); 
if (Float.parseFloat(cantidadingrediente) > 0)
{
%>
<%if (Float.parseFloat(ubicacion.getCantidad()) < 1){%>
<td>
     <font color="#FF0000"><%=String.valueOf(Float.parseFloat(ubicacion.getCantidad())*1000)%></font>
</td>
<td>
<%    if (insumo2.getCodigoUnidadMedida().equals("KGS")){
         out.print("GRS");
      }else{
	      if (insumo2.getCodigoUnidadMedida().equals("LTS")){
             out.print("CM3");	 
}}%>
</td>	     
<%}else{%>
<td>
<font color="#FF0000"><%=ubicacion.getCantidad()%></font>
</td>
<td>
<%=insumo2.getCodigoUnidadMedida()%>
</td>
<%}%>
<input type="hidden" name="cantidadbodega<%=i%><%=j%>" value="<%=ubicacion.getCantidad()%>"/>
<input type="hidden" name=unidadmedida<%=i%><%=j%> value="<%=insumo2.getCodigoUnidadMedida()%>"/>
<!--td>
&nbsp;
<font color="#FF0000"><%--=ubicacion.getCantidad()--%></font>
<input type="hidden" name="cantidadbodega<%--=i--%><%--=j--%>" value="<%--=ubicacion.getCantidad()--%>"/>
</td>
<td>
&nbsp;
<%--=insumo2.getCodigoUnidadMedida()--%>
<input type="hidden" name=unidadmedida<%--=i--%><%--=j--%> value="<%--=insumo2.getCodigoUnidadMedida()--%>"/>
</td-->
<%}else{%>
<%
cantidadingrediente = String.valueOf(Float.parseFloat(ubicacion.getCantidad())+Float.parseFloat(cantidadingrediente)+0.01);
cantidadingrediente = cantidadingrediente.substring(0,cantidadingrediente.indexOf(".")+2);
%>
<%if (Float.parseFloat(cantidadingrediente) < 1){%>
<td>
     <font color="#0000FF"><%=String.valueOf(Float.parseFloat(cantidadingrediente)*1000)%></font>
</td>
<td>
<%    if (insumo2.getCodigoUnidadMedida().equals("KGS")){
         out.print("GRS");
      }else{
	      if (insumo2.getCodigoUnidadMedida().equals("LTS")){
             out.print("CM3");	 
}}%>
</td>	     
<%}else{%>
<td>
<font color="#0000FF"><%=cantidadingrediente%></font>
</td>
<td>
<%=insumo2.getCodigoUnidadMedida()%>
</td>
<%}%>
<input type="hidden" name="cantidadbodega<%=i%><%=j%>" value="<%=cantidadingrediente%>"/>
<input type="hidden" name=unidadmedida<%=i%><%=j%> value="<%=insumo2.getCodigoUnidadMedida()%>"/>
<!--td>
&nbsp;
<font color="#0000FF"><%--=cantidadingrediente--%></font>
<input type="hidden" name="cantidadbodega<%--=i--%><%--=j--%>" value="<%--=cantidadingrediente--%>"/>
<%--=ubicacion.getCantidad()--%></td>
<td>
&nbsp;
<%--=insumo2.getCodigoUnidadMedida()--%>
<input type="hidden" name=unidadmedida<%--=i--%><%--=j--%> value="<%--=insumo2.getCodigoUnidadMedida()--%>"/></td-->
<%j++;%>
<%
stock = "S";
break;
}
%>
</tr>
<%j++;%>
<%}%>
<%
if (j==1){
%>
<tr>
<td colspan="5">
<font color="#FF0000">No tiene Ubicación asociado este Insumo</font></td>
</tr>
<%}%>
</table>
<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/></td>
</tr>
<%i++;%>
<%k++;%>
<%}%>
</table>
<input type="hidden" name="insumo" value="0"/>
<input type="hidden" name="cantidadinsumo" value="0"/>
<input type="hidden" name="ubicacioninsumo" value="0"/>
<%k++;%>
<!--input type="hidden" name="unidadmedida" value="0"/-->
<button type="button" onClick="recuperaOtraEntregaInsumo()">Agregar Otro Insumo</button>
<!--button type="button" onClick="sacaEntregaInsumoUltimo()">Sacar Ultimo Insumo</button-->

<%}else{%>

<table border="1">
<tr>
<th>
Selec
</th>
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
Ubicación
</th>
</tr>
<%--arrayIngredienteEntrega.clear();--%>
<%
//int i = 1;
//int k = 0;
//int j = 1;
//String cantidadingrediente = "";
//String cantidadubicacion = "";
//String stock = "N";
Iterator itIngredienteEntrega = arrayIngredienteEntrega.iterator();
while (itIngredienteEntrega.hasNext())
{
Ingrediente ingrediente= (Ingrediente) itIngredienteEntrega.next();%>

<tr>
<td>
<input type="checkbox" name="op" value="<%=k%>">
<!--input type="checkbox" name="NomCheck[]" value="1"/-->
</td>
<td>
&nbsp;
<%
Insumo insumo2 = new Insumo();
insumo2.setCodigoInsumo(ingrediente.getCodigoInsumo());
if (insumo2.buscar());
out.print(insumo2.getNombreInsumo());
%>
<%--=ingrediente.getCodigoInsumo()--%>
<input type="hidden" name=insumo<%=i%> value="<%=ingrediente.getCodigoInsumo()%>"/>
</td>
<%cantidadingrediente = ingrediente.getCantidadInsumo();%>
<%if (Float.parseFloat(cantidadingrediente) < 1){%>
<td>
     <%=String.valueOf(Float.parseFloat(cantidadingrediente)*1000)%>
</td>
<td>
<%    if (ingrediente.getCodigoUnidadMedida().equals("KGS")){
         out.print("GRS");
      }else{
	      if (ingrediente.getCodigoUnidadMedida().equals("LTS")){
             out.print("CM3");	 
}}%>
</td>	     
<%}else{%>
<td>
<%=cantidadingrediente%>
</td>
<td>
<%=ingrediente.getCodigoUnidadMedida()%>
</td>
<%}%>
<input type="hidden" name=cantidadinsumo<%=i%> value="<%=cantidadingrediente%>"/>
<input type="hidden" name=unidadmedida<%=i%> value="<%=ingrediente.getCodigoUnidadMedida()%>"/>
<!--td>
&nbsp;
<%--cantidadingrediente = ingrediente.getCantidadInsumo();--%>
<%--=cantidadingrediente.substring(0,cantidadingrediente.indexOf(".")+2)--%>
<%--=cantidadingrediente--%>
<input type="hidden" name=cantidadinsumo<%--=i--%> value="<%--=cantidadingrediente--%>"/>
</td>
<td>
<%--=ingrediente.getCodigoUnidadMedida()--%>
<input type="hidden" name=unidadmedida<%--=i--%> value="<%--=ingrediente.getCodigoUnidadMedida()--%>"/>
</td-->
<td>
<table border="1" width="100%">
<tr>
<th width="110">
Bodega
</th>
<th>
Descripción
</th>
<th>
Fecha Vencimiento
</th>
<th>
Cantidad
</th>
<th>
U/M
</th>
</tr>	
<%
j = 1;
stock = "N";
ArrayList<Ubicacion> arrayUbicacion= new ArrayList<Ubicacion>();
ManejadorUbicacion manUbicacion = new ManejadorUbicacion();
manUbicacion.setCodigoProducto(ingrediente.getCodigoInsumo());
arrayUbicacion= manUbicacion.consultar();
Iterator itUbicacion= arrayUbicacion.iterator();
while (itUbicacion.hasNext())
{
Ubicacion ubicacion= (Ubicacion) itUbicacion.next();
%>
<tr>
<td>
&nbsp;
<%
Bodega bodega = new Bodega();
bodega.setCodigoBodega(ubicacion.getCodigoBodega());
if (bodega.buscar());
out.print(bodega.getNombreBodega());
%>
<%--=ubicacion.getCodigoBodega()--%>
<input type="hidden" name="bodega<%=i%><%=j%>" value="<%=ubicacion.getCodigoBodega()%>"/>
</td>
<td>
&nbsp;
<%=ubicacion.getObservacion()%>
<input type="hidden" name="observacion<%=i%><%=j%>" value="<%=ubicacion.getObservacion()%>"/>
</td>
<td>
&nbsp;
<%=ubicacion.getFechaVencimiento()%>
<input type="hidden" name="fechavencimiento<%=i%><%=j%>" value="<%=ubicacion.getFechaVencimiento()%>"/>
<input type="hidden" name="fechaingreso<%=i%><%=j%>" value="<%=ubicacion.getFechaIngreso()%>"/>
<input type="hidden" name="horaingreso<%=i%><%=j%>" value="<%=ubicacion.getHoraIngreso()%>"/>
</td>
<%
cantidadingrediente = String.valueOf(Float.parseFloat(cantidadingrediente) - Float.parseFloat(ubicacion.getCantidad())); 
if (Float.parseFloat(cantidadingrediente) > 0)
{
%>
<%if (Float.parseFloat(ubicacion.getCantidad()) < 1){%>
<td>
     <font color="#FF0000"><%=String.valueOf(Float.parseFloat(ubicacion.getCantidad())*1000)%></font>
</td>
<td>
<%    if (insumo2.getCodigoUnidadMedida().equals("KGS")){
         out.print("GRS");
      }else{
	      if (insumo2.getCodigoUnidadMedida().equals("LTS")){
             out.print("CM3");	 
}}%>
</td>	     
<%}else{%>
<td>
<font color="#FF0000"><%=ubicacion.getCantidad()%></font>
</td>
<td>
<%=insumo2.getCodigoUnidadMedida()%>
</td>
<%}%>
<input type="hidden" name="cantidadbodega<%=i%><%=j%>" value="<%=ubicacion.getCantidad()%>"/>
<input type="hidden" name=unidadmedida<%=i%><%=j%> value="<%=insumo2.getCodigoUnidadMedida()%>"/>
<!--td>
&nbsp;
<font color="#FF0000"><%--=ubicacion.getCantidad()--%></font>
<input type="hidden" name="cantidadbodega<%--=i--%><%--=j--%>" value="<%--=ubicacion.getCantidad()--%>"/>
<%--=ubicacion.getCantidad()--%>
</td>
<td>
&nbsp;
<%--=insumo2.getCodigoUnidadMedida()--%>
<input type="hidden" name=unidadmedida<%--=i--%><%--=j--%> value="<%--=insumo2.getCodigoUnidadMedida()--%>"/>
</td-->
<%}else{%>
<%
cantidadingrediente = String.valueOf(Float.parseFloat(ubicacion.getCantidad())+Float.parseFloat(cantidadingrediente)+0.01);
cantidadingrediente = cantidadingrediente.substring(0,cantidadingrediente.indexOf(".")+2);
%>
<%if (Float.parseFloat(cantidadingrediente) < 1){%>
<td>
     <font color="#0000FF"><%=String.valueOf(Float.parseFloat(cantidadingrediente)*1000)%></font>
</td>
<td>
<%    if (insumo2.getCodigoUnidadMedida().equals("KGS")){
         out.print("GRS");
      }else{
	      if (insumo2.getCodigoUnidadMedida().equals("LTS")){
             out.print("CM3");	 
}}%>
</td>	     
<%}else{%>
<td>
<font color="#0000FF"><%=cantidadingrediente%></font>
</td>
<td>
<%=insumo2.getCodigoUnidadMedida()%>
</td>
<%}%>
<input type="hidden" name="cantidadbodega<%=i%><%=j%>" value="<%=cantidadingrediente%>"/>
<input type="hidden" name=unidadmedida<%=i%><%=j%> value="<%=insumo2.getCodigoUnidadMedida()%>"/>
<!--td>
&nbsp;
<font color="#0000FF"><%--=cantidadingrediente--%></font>
<input type="hidden" name="cantidadbodega<%--=i--%><%--=j--%>" value="<%--=cantidadingrediente--%>"/>
<%--=ubicacion.getCantidad()--%>
</td>
<td>
&nbsp;
<%--=insumo2.getCodigoUnidadMedida()--%>
<input type="hidden" name=unidadmedida<%--=i--%><%--=j--%> value="<%--=insumo2.getCodigoUnidadMedida()--%>"/>
</td-->
<%j++;%>
<%
stock = "S";
break;
}
%>
</tr>
<%j++;%>
<%}%>
<%
if (j==1){
%>
<tr>
<td colspan="5">
<font color="#FF0000">No tiene Ubicación asociado este Insumo</font>
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
<!--input type="checkbox" name="NomCheck[]" value="1"/-->
</td>
<td>
<select size=1 name="insumo" onChange="recuperaUnidadMedida()">
<option value=-1>SELECCIONE INSUMO</option>
<% 
ArrayList<Insumo> arrayInsumo= new ArrayList<Insumo>();
ManejadorInsumo manInsumo = new ManejadorInsumo();
arrayInsumo=manInsumo.consultar();
Iterator itInsumo= arrayInsumo.iterator();
while (itInsumo.hasNext())
{
Insumo insumo2= (Insumo) itInsumo.next();
%>
<option value=<%=insumo2.getCodigoInsumo()%>> <%=insumo2.getNombreInsumo()%></option>
<%}%>
</select>
</td>
<td>
<input type="text" name="cantidadinsumo" size="3"/>
<%k++;%>
</td>
<td colspan="2">
<span id="salidaUnidadMedida">
<SELECT size=1 name=unidadmedida>
<OPTION VALUE=-1>UNIDAD MEDIDA</OPTION>
</SELECT>
</span>
<input type="hidden" name="ubicacioninsumo" value=""/>
</td>
</tr>
</table>
<button type="button" onClick="recuperaUbicacionEntregaInsumo()">Consultar Ubicación</button>
<!--button type="button" onClick="sacaEntregaInsumo()">Sacar Ultimo Insumo</button-->

<%}%>
<!--input type="hidden" name="producto" value="0"/-->
<!--input type="hidden" name="cantidadproducto" value="0"/-->

<input type="hidden" name="stock" value="<%=stock%>"/>
<input type="hidden" name="ubicacion" value="<%=j%>"/>
<input type="hidden" name="ultimafilainsumo" value="<%=i%>"/>
<input type="hidden" name="cantidadentregainsumo" value="<%=k%>"/>
</span>
	
<table>
<tr>
<td>
<br>
</td>
</tr>
<tr>
<td>
Funcionario 
</td>
<td>
<select size=1 name=funcionario>
<option value=-1>SELECCIONE FUNCIONARIO</option>
<% 
ArrayList<Funcionario> arrayFuncionario= new ArrayList<Funcionario>();
ManejadorFuncionario manFuncionario= new ManejadorFuncionario();
arrayFuncionario=manFuncionario.consultar();
%>
<%Iterator itFuncionario= arrayFuncionario.iterator();
while (itFuncionario.hasNext())
{
Funcionario funcionario= (Funcionario) itFuncionario.next();
%>
<option value=<%=funcionario.getRutFuncionario()%>> <%=funcionario.getNombreFuncionario()%></option>
<%}%>
</select>
</td>
</tr>
<tr>
<td> 
Observaci&oacute;n 
</td>
<td>
<textarea name="observacion" rows = 4 cols = 60></textarea>
</td>
</tr>
</table>
<input type="submit" name="Enviar" value="Enviar Entrega"/>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaEntregaInsumo.jsp&titulo=Lista Entrega de Insumos&filordenfabricacion=<%=filordenfabricacion%>&seleccion=<%=ordenfabricacion%>&mensaje=','_self')">Volver</button>
</form>
</body>
</html>