<html>
<head>
	<title>Your Company Name</title>
	<link rel="stylesheet" type="text/css" href="Template037.css">
	<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.rut.value.length < 1) {
    alert("Escriba el Rut del Cliente.");
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
  
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el nombre del Cliente.");
    formulario.nombre.focus();
    return (false);
  }
  
    if (formulario.direccion.value.length < 1) {
    alert("Escriba la dirección del Cliente.");
    formulario.direccion.focus();
    return (false);
  }
  
  if (formulario.comuna.value.length < 1) {
    alert("Escriba la comuna del Cliente.");
    formulario.comuna.focus();
    return (false);
  }
  
    if (formulario.telefono.value.length < 1) {
    alert("Escriba el Teléfono del Cliente.");
    formulario.telefono.focus();
    return (false);
  }
  
  if (formulario.tipocliente.value.length < 1) {
    alert("Escriba el Tipo de Cliente.");
    formulario.tipocliente.focus();
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
<script language="JavaScript1.2" src="mm_menu.js"></script>
<script language="JavaScript1.2" src="menu_administrador.js"></script>
</head>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
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
		<td width="115"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c2','','menu_pasteleria/imgenes/menu_pasteleria_r1_c2.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c2','','menu_pasteleria/imgenes/menu_pasteleria_r1_c2_f2.gif',1);"><img name="menu20pasteleria_r1_c2" src="menu_pasteleria/imgenes/menu_pasteleria_r1_c2.gif" width="115" height="26" border="0" usemap="#m_menu20pasteleria_r1_c2" alt=""></a></td>
		<td width="35"><img src="menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<td width="123"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c4','','menu_pasteleria/imgenes/menu_pasteleria_r1_c4.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c4','','menu_pasteleria/imgenes/menu_pasteleria_r1_c4_f2.gif',1);"><img name="menu20pasteleria_r1_c4" src="menu_pasteleria/imgenes/menu_pasteleria_r1_c4.gif" width="123" height="26" border="0" usemap="#m_menu20pasteleria_r1_c4" alt=""></a></td>
		<td width="35"><img src="menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<td width="185"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c6','','menu_pasteleria/imgenes/menu_pasteleria_r1_c6.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c6','','menu_pasteleria/imgenes/menu_pasteleria_r1_c6_f2.gif',1);"><img name="menu20pasteleria_r1_c6" src="menu_pasteleria/imgenes/menu_pasteleria_r1_c6.gif" width="185" height="26" border="0" usemap="#m_menu20pasteleria_r1_c6" alt=""></a></td>
		<td width="35"><img src="menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<td width="89"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c8','','menu_pasteleria/imgenes/menu_pasteleria_r1_c8.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c8','','menu_pasteleria/imgenes/menu_pasteleria_r1_c8_f2.gif',1);"><img name="menu20pasteleria_r1_c8" src="menu_pasteleria/imgenes/menu_pasteleria_r1_c8.gif" width="54" height="26" border="0" usemap="#m_menu20pasteleria_r1_c8" alt=""></a></td>
		<td width="62"><img src="menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="62" height="26"></td>
		</tr>
</table>
<!--table background="images/pasteleria_fondo3.3.png" cellpadding="0" cellspacing="0" width="752"  height="582"class="Middle"-->
<table>
	<tr height="1">
		<td><img src="_blank.gif" width="20" height="1"></td>
		<td valign="top">
			<table cellpadding="0" cellspacing="0" height="100%">
				<tr>
					<td height="5%"></td>
				</tr>
				<tr>
				<td valign="top">
				<table width="676">
				<tr>
				<td width="611"><h1>Mantenedor Cliente</h1></td>
				<td width="64"><button type="button" onClick="window.open('cliente.jsp','_self')">Atr&aacute;s</button></td>
				<td width="47"><button type="button" onClick="window.open('listar_cliente.jsp','_self')">Listar</button></td>
				<!--td width="50"><form action="listar_cliente.jsp">
					<input type="submit" name="listar" value="Listar"/>
				  </form></td-->
				</tr>
				</table>
			<jsp:useBean id="cliente" class="Cliente" scope="session"/>
			<form method = "get" name = "ingreso_Formulario" onSubmit = "return validar(this)" action = "/LaPalmera/servlet/GrabaCliente">
  				<input name = "rut" type="hidden" value="<%=cliente.getRutCliente()%>"/>
  				<table>
				<tr>
					<td width="133">Rut Cliente :</td>
   				  <td width="242"><input name = "rut2" type="type" value="<%=cliente.getRutCliente()%>" disabled="disabled"/></td>
				</tr>
				<tr>
					<td width="133">Nombre :</td>
	   			  <td width="242"><input name = "nombre" type="type" size="40"/></td>
    			</tr>
    			<tr>
					<td>Direcci&oacute;n :</td>
				  <td width="242"><input name = "direccion" type="type" size="40"/></td>
				</tr>
				<tr>
				<td>Comuna :</td>
				<%ManejadorComuna manComuna = new ManejadorComuna();%>
				<%Vector vecComuna;
				vecComuna = manComuna.consultar();%>
				<%Enumeration enumComuna = vecComuna.elements();%>
			   <td><SELECT size="1" name="comuna">
				  <%while (enumComuna.hasMoreElements())
			    {
			     Comuna comuna = (Comuna) enumComuna.nextElement();%>
			     <OPTION VALUE="<%=comuna.getCodigoComuna()%>"> <%=comuna.getNombreComuna()%></OPTION>
			   <%}%>
				</SELECT></td>
				</tr>
				<tr>
				  <td>Fecha Nacimiento :</td>
				  <td width="242"><input name = "fechanacimiento" type="type"/></td>

			</tr>
			<tr>
				  <td>Tel&eacute;fono :</td>
				  <td width="242"><input name = "telefono" type="type" size="40"/></td>

			</tr>
			<tr>
				  <td>E-Mail :</td>
				  <td width="242"><input name = "email" type="type" size="40"/></td>

			</tr>
			<tr>
				  <td>P&aacute;gina Web :</td>
				  <td width="242"><input name = "paginaweb" type="type" size="40"/></td>

			</tr>
			<tr>
				  <td>Tipo Cliente :</td>
				  <%ManejadorTipoCliente manTipoCliente = new ManejadorTipoCliente();%>
				<%Vector vecTipoCliente;
				vecTipoCliente = manTipoCliente.consultar();%>
				<%Enumeration enumTipoCliente = vecTipoCliente.elements();%>
			   <td><SELECT size="1" name="tipocliente">
				  <%while (enumTipoCliente.hasMoreElements())
			    {
			     TipoCliente tipoCliente = (TipoCliente) enumTipoCliente.nextElement();%>
			     <OPTION VALUE="<%=tipoCliente.getCodigoTipoCliente()%>"> <%=tipoCliente.getNombreTipoCliente()%></OPTION>
			   <%}%>
				</SELECT></td>
			</tr>
			<tr>
				  <td>Observaci&oacute;n :</td>
				  <td width="242"><input name = "observacion" type="type" size="40"/></td>

			</tr>
			<tr>
			<td></td>
	        <td></td>
	  <td><input name="grabar" value="Grabar" type="submit"></td>
	  <td><input name="cancelar" value="Cancelar" type="button"></td>
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
