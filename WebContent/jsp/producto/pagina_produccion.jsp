<html>

<head>
	<title>Your Company Name</title>
	<link rel="stylesheet" type="text/css" href="Template037.css">
	<script language="JavaScript1.2" src="mm_menu.js"></script>
	<script language="JavaScript1.2" src="menu_administrador.js"></script>
	<script language="JavaScript">
<!--
function validar(formulario) {
 if (formulario.ordenfabricacion.value.length < 1) {
    alert("Escriba la orden de fabricación.");
    formulario.ordenfabricacion.focus();
    return (false);
  }
   
 var checkOK = "0123456789";
  var checkStr = formulario.ordenfabricacion.value;
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
    alert("Escriba sólo números en el campo \"Orden de Fabricación\" del producto.");
    formulario.ordenfabricacion.focus();
    return (false);
  } 

  if (formulario.codigoproducto.value.length < 1) {
    alert("Escriba el código del producto.");
    formulario.codigoproducto.focus();
    return (false);
  }
   
 var checkOK = "0123456789";
  var checkStr = formulario.codigoproducto.value;
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
    alert("Escriba sólo números en el campo \"Código del Producto\".");
    formulario.codigoproducto.focus();
    return (false);
  } 
  
    if (formulario.cantidad.value.length < 1) {
    alert("Escriba la cantidad del producto.");
    formulario.cantidad.focus();
    return (false);
  }
   
 var checkOK = "0123456789";
  var checkStr = formulario.cantidad.value;
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
    alert("Escriba sólo números en el campo \"Cantidad\" del producto.");
    formulario.cantidad.focus();
    return (false);
  } 
  
 if (formulario.rut.value.length < 1) {
    alert("No a ingresado el rut del funcionario.");
    formulario.rut.focus();
    return (false);
  }
  
  var rut=formulario.rut.value;suma=0;mul=2;i=0;
  if (rut=="") return (false);
  for (i=rut.length-3;i>=0;i--){
  suma=suma+parseInt(rut.charAt(i)) * mul;
  mul= mul==7 ? 2 : mul+1;
  }

  var dvr = ''+(11 - suma % 11);

  if (dvr=='10') 
    dvr = 'K'; 
  else if (dvr=='11') 
    dvr = '0';
  if (rut.charAt(rut.length-2)!="-"||rut.charAt(rut.length-1)!=dvr) 
    {alert("Rut Invalido");
    formulario.rut.value="";
    formulario.rut.focus();
    return (false);
  }
 
  return (true);
}
//-->
</script>

</head>

<body topmargin="0" leftmargin="0" onLoad="MM_preloadImages('menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif','menu_pasteleria/imgenes/menu_pasteleria_r1_c2_f2.gif','menu_pasteleria/imgenes/menu_pasteleria_r1_c2.gif','menu_pasteleria/imgenes/menu_pasteleria_r1_c4_f2.gif','menu_pasteleria/imgenes/menu_pasteleria_r1_c4.gif','menu_pasteleria/imgenes/menu_pasteleria_r1_c6_f2.gif','menu_pasteleria/imgenes/menu_pasteleria_r1_c6.gif','menu_pasteleria/imgenes/menu_pasteleria_r1_c8_f2.gif','menu_pasteleria/imgenes/menu_pasteleria_r1_c8.gif');">

<script language="JavaScript1.2">mmLoadMenus();</script>
<table cellpadding="0" cellspacing="0" width="752" class="Top">
	<tr>
		<td><img src="images/logo pasteleria la palmera.png" width="750" height="101"></td>
	</tr>
</table>
<table cellpadding="0" cellspacing="0" width="752" class="Middle">
	<tr>
		<td width="106"><img src="menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="106" height="26"></td>
		<!--td><a href="index.html"><img src="images/ButtonLinkWhoWeAre.gif" border="0" width="82" height="20"></a></td-->
		<td width="115"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c2','','menu_pasteleria/imgenes/menu_pasteleria_r1_c2.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c2','','menu_pasteleria/imgenes/menu_pasteleria_r1_c2_f2.gif',1);"><img name="menu20pasteleria_r1_c2" src="menu_pasteleria/imgenes/menu_pasteleria_r1_c2.gif" width="115" height="26" border="0" usemap="#m_menu20pasteleria_r1_c2" alt=""></a></td>
		<td width="35"><img src="menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<!--td><a href="index.html"><img src="images/ButtonLinkOurKitchen.gif" border="0" width="78" height="20"></a></td-->
		 <td width="123"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c4','','menu_pasteleria/imgenes/menu_pasteleria_r1_c4.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c4','','menu_pasteleria/imgenes/menu_pasteleria_r1_c4_f2.gif',1);"><img name="menu20pasteleria_r1_c4" src="menu_pasteleria/imgenes/menu_pasteleria_r1_c4.gif" width="123" height="26" border="0" usemap="#m_menu20pasteleria_r1_c4" alt=""></a></td>
		 <td width="35"><img src="menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<!--td><a href="index.html"><img src="images/ButtonLinkEvents.gif" border="0" width="52" height="20"></a></td-->
		<td width="185"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c6','','menu_pasteleria/imgenes/menu_pasteleria_r1_c6.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c6','','menu_pasteleria/imgenes/menu_pasteleria_r1_c6_f2.gif',1);"><img name="menu20pasteleria_r1_c6" src="menu_pasteleria/imgenes/menu_pasteleria_r1_c6.gif" width="185" height="26" border="0" usemap="#m_menu20pasteleria_r1_c6" alt=""></a></td>
		<td width="35"><img src="menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<!--td><img src="images/Back2.gif" width="201" height="20"></td-->
		<td width="89"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c8','','menu_pasteleria/imgenes/menu_pasteleria_r1_c8.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c8','','menu_pasteleria/imgenes/menu_pasteleria_r1_c8_f2.gif',1);"><img name="menu20pasteleria_r1_c8" src="menu_pasteleria/imgenes/menu_pasteleria_r1_c8.gif" width="54" height="26" border="0" usemap="#m_menu20pasteleria_r1_c8" alt=""></a></td>
		<td width="62"><img src="menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="62" height="26"></td>
		<!--td><a href="index.html"><img src="images/ButtonLinkReservations.gif" border="0" width="87" height="20"></a></td-->
		<!--td><a href="index.html"><img src="images/ButtonLinkContactUs.gif" border="0" width="77" height="20"></a></td-->
		<!--td><img src="images/Back3.gif" width="104" height="20"></td-->
	</tr>
</table>
<!--table cellpadding="0" cellspacing="0" width="752" class="Middle">
	<tr>
		<td><img src="images/TopCol2.gif" width="750" height="60"></td>
	</tr>
</table-->
<!--table background="images/pasteleria_fondo3.3.png" cellpadding="0" cellspacing="0" width="752"  height="582"class="Middle"-->
<table>
	<tr height="1">
		<td><img src="_blank.gif" width="20" height="1"></td>
		<td valign="top">
			<table cellpadding="0" cellspacing="0" height="100%">
				<tr>
					<td width="483" height="5%">					</td>
				</tr>
				<tr>
				<td valign="top">
				<h2>Capturar Producción</h2>
				<!--form action="custom_error.jsp" method="post"-->
				<form method = "POST" name = "registro" onSubmit = "return validar(this)" action = "Listar.jsp">
  <table>
    <tr>
	<td><h3>Datos de la Orden de fabricación</h3></td>
	</tr>
	<tr>
      <td>
	  <table>
	  <tr>
	  <td>Orden de Fabricación:</td>
      <td><input name="ordenfabricacion" type="type"></td>
	  </tr>
	  </table>
	  </td>
    </tr>
    <tr>
	<td><h3>Datos Producto</h3></td>
	</tr>
	<tr>
      <td >
	  <table>
	  <tr>
	  <td><input name="buscarproducto" value="Buscar Producto" type="button"></td>
	  <td>Código:     
	    <input name="codigoproducto" type="text"></td>
      <td>Nombre:</td>
	<td><input name="nombreproducto" type="type"></td>
      <td>Cantidad:</td>
      <td><input name="cantidad" type="type" size="5"></td>
	  </tr>
	  </table>
	  </td>
    </tr>
    <tr>
	<td>
	<table>
	<tr>
	<td width="474">	</td>
	<td width="132"><input name="agregarfuncionario" value="Agregar Producto" type="button"></td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
      <td><h3>Datos Funcionario</h3></td>
	</tr>
	<tr>
	<td>
	<table>
	<tr>
	   	<td><input name="buscarfuncionario" value="Buscar Funcionario" type="button"></td>
	   <td>Rut: <input name="rut" type="type"></td> 
	   <td>Nombre: <input name="nombrefuncionario" type="type" size="40"></td>
	   </tr>
	   </table>
	   </td>
	</tr>
	<tr>
	<td>
	<table>
	<tr>
	<td width="474">	</td>
	<td width="132"><input name="agregarfuncionario" value="Agregar Funcionario" type="button"></td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	   <td >
	   <table>
	   <tr>
	   <td valign="top">Observación</td>
		<td><TEXTAREA name="observacion" rows = 5 cols = 60></TEXTAREA></td>
		</tr>
		</table>
		</td>
	</tr>
    <tr>
	<td>
	<table>
	<tr>
	  <td width="482"></td>
	  <td width="58"><input name="enviar" value="Enviar" type="submit"></td>
	  <td width="66"><input name="cancelar" value="Cancelar" type="reset"></td>
	  </tr>
	  </table>
	  </td>
    </tr>
  </table>
</form>
				</td>
				</tr>
				
				
			</table>
		</td>
		<td>
			</td>
		<td>&nbsp;</td>
	</tr>
</table>
<!--table cellpadding="0" cellspacing="0" width="752" class="Bottom">
	<tr>
		<td><img src="images/Copyright.gif" width="363" height="37"></td>
		<td><a href="index.html"><img src="images/ButtonWhoWeAre.gif" border="0" width="78" height="37"></a></td>
		<td><a href="index.html"><img src="images/ButtonOurKitchen.gif" border="0" width="77" height="37"></a></td>
		<td><a href="index.html"><img src="images/ButtonEvents.gif" border="0" width="60" height="37"></a></td>
		<td><a href="index.html"><img src="images/ButtonReservations.gif" border="0" width="79" height="37"></a></td>
		<td><a href="index.html"><img src="images/ButtonContactUs.gif" border="0" width="72" height="37"></a></td>
		<td><img src="images/Back4.gif" width="21" height="37"></td>
	</tr>
</table-->
<map name="m_null">
<area shape="poly" coords="35,2,153,2,153,26,35,26,35,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_0,35,26,null,'nmenu_pasteleria_1_1');"  >
</map>
<map name="m_menu20pasteleria_r1_c2">
<area shape="poly" coords="-3,2,115,2,115,26,-3,26,-3,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_0,-3,26,null,'menu20pasteleria_r1_c2');"  >
</map>
<map name="m_menu20pasteleria_r1_c4">
<area shape="poly" coords="1,2,122,2,122,26,1,26,1,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_1,1,26,null,'menu20pasteleria_r1_c4');"  >
</map>
<map name="m_menu20pasteleria_r1_c6">
<area shape="poly" coords="0,2,187,2,187,26,0,26,0,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_2,0,26,null,'menu20pasteleria_r1_c6');"  >
</map>
<map name="m_null">
<area shape="poly" coords="9,2,66,2,66,26,9,26,9,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_3,9,26,null,'nmenu_pasteleria_1_7');"  >
<area shape="poly" coords="-185,2,2,2,2,26,-185,26,-185,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_2,-185,26,null,'nmenu_pasteleria_1_7');"  >
</map>
<map name="m_menu20pasteleria_r1_c8">
<area shape="poly" coords="-1,2,56,2,56,26,-1,26,-1,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_3,-1,26,null,'menu20pasteleria_r1_c8');"  >
</map>
<map name="m_null">
<area shape="poly" coords="-55,2,2,2,2,26,-55,26,-55,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_3,-55,26,null,'nmenu_pasteleria_1_9');"  >
</map>
</body>

</html>
