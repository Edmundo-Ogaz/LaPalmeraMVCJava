<html>
<head>
	<title>Your Company Name</title>
	<link rel="stylesheet" type="text/css" href="Template037.css">
<script language="JavaScript1.2" src="mm_menu.js"></script>
<script language="JavaScript1.2" src="menu_administrador.js"></script>
<script language="JavaScript">
<!--
function validar(formulario) {
  if (formulario.codigo.value.length < 1) {
    alert("Escriba el cdigo del Producto.");
    formulario.codigo.focus();
    return (false);
  }
var checkOK = "0123456789";
  var checkStr = formulario.codigo.value;
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
    alert("Escriba slo nmeros en el campo \"Cdigo\".");
    formulario.codigo.focus();
    return (false);
  }    
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el nombre del producto.");
    formulario.nombre.focus();
    return (false);
  }
  if (formulario.stockcritico.value.length < 1) {
    alert("Escriba el stok critico del producto.");
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
    alert("Escriba slo nmeros en el campo \"Stock Critico\".");
    formulario.stockcritico.focus();
    return (false);
  }
  var entrar = confirm("�Desea continuar?")
  if ( !entrar )
  	return (false);
  else
    return (true);
}
//-->
</script>
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
				<td width="549"><h1>Mantenedor Producto</h1></td>
				<td width="64"><button type="button" onClick="window.open('producto.jsp','_self')">Atr&aacute;s</button></td>
				<td width="47"><button type="button" onClick="window.open('listar_producto.jsp','_self')">Listar</button></td>
				
				<!--td width="50"><form action="listar_producto.jsp">
					<input type="submit" name="listar" value="Listar"/>
				  </form></td-->
				</tr>
				</table>
				
				<jsp:useBean id="producto" class="Producto" scope="session"/>
	<form method = "get" name = "producto_modificar" onSubmit = "return validar(this)" action = "/LaPalmera/servlet/ModificaProducto">
				<input name="codigo" type="hidden" value="<%=producto.getCodigoProducto()%>"/>	
  				<table>
				<tr>
					<td width="133">C&oacute;digo Producto :</td>
   				  <td width="242"><input name = "codigo2" type="type" value="<%=producto.getCodigoProducto()%>" disabled="disabled"/></td>
				</tr>
				<tr>
					<td width="133">Nombre :</td>
	   			  <td width="242"><input name = "nombre" type="type" size="40" value="<%=producto.getNombreProducto()%>"/></td>
    			</tr>
    			<tr>
					<td>Familia :</td>
					<%ManejadorFamilia manfamilia = new ManejadorFamilia();%>
				<%Vector vecRep;
				vecRep = manfamilia.consultar();%>
				<%Enumeration enumRep = vecRep.elements();%>
			   <td><SELECT size="1" name="familia">
				  <%while (enumRep.hasMoreElements())
			    {
			     Familia familia = (Familia) enumRep.nextElement();%>
			     
				 <%if ( producto.getCodigoFamilia().equals(familia.getCodigoFamilia())){%>
				 <OPTION  selected VALUE="<%=familia.getCodigoFamilia()%>"> <%=familia.getNombreFamilia()%></OPTION>					   				<%}else{%>
				 <OPTION VALUE="<%=familia.getCodigoFamilia()%>"> <%=familia.getNombreFamilia()%></OPTION>
			    <%}%>
			    <%}%>
				</SELECT></td>
				</tr>
				<tr>
				<td>SubFamilia :</td>
				<%ManejadorSubfamilia mansubfamilia = new ManejadorSubfamilia();%>
				<%Vector vecRep2;
				vecRep2 = mansubfamilia.consultar();%>
				<%Enumeration enumRep2 = vecRep2.elements();%>
			   <td><SELECT size="1" name="subfamilia">
				  <%while (enumRep2.hasMoreElements())
			    {
			     Subfamilia subfamilia = (Subfamilia) enumRep2.nextElement();%>
			     <%if ( producto.getCodigoSubfamilia().equals(subfamilia.getCodigoSubfamilia())){%>
				 <OPTION  selected VALUE="<%=subfamilia.getCodigoSubfamilia()%>"> <%=subfamilia.getNombreSubfamilia()%></OPTION>					   				<%}else{%>
				 <OPTION VALUE="<%=subfamilia.getCodigoSubfamilia()%>"> <%=subfamilia.getNombreSubfamilia()%></OPTION>
			    <%}%>
			   <%}%>
			</SELECT></td>
				</tr>
				<tr>
				  <td>Otras Caracter&iacute;sticas:</td>
				 <%ManejadorOtraCaracteristica manOtraCaracteristica = new ManejadorOtraCaracteristica();%>
				<%Vector vecRep3;
				vecRep3 = manOtraCaracteristica.consultar();%>
				<%Enumeration enumRep3 = vecRep3.elements();%>
			   <td><SELECT size="1" name="otracaracteristica">
			  <%while (enumRep3.hasMoreElements())
			    {
			     OtraCaracteristica otraCaracteristica = (OtraCaracteristica) enumRep3.nextElement();%>
				     <%if ( producto.getCodigoOtraCaracteristica().equals(otraCaracteristica.getCodigoOtraCaracteristica())){%>
				 <OPTION  selected VALUE="<%=otraCaracteristica.getCodigoOtraCaracteristica()%>"> <%=otraCaracteristica.getNombreOtraCaracteristica()%></OPTION>					   				<%}else{%>
				 <OPTION VALUE="<%=otraCaracteristica.getCodigoOtraCaracteristica()%>"> <%=otraCaracteristica.getNombreOtraCaracteristica()%></OPTION>
			    <%}%>
   			<%}%>
			</SELECT></td>
				<td width="157">Stock Critico</td>
				<td><input name = "stockcritico" type="type" value="<%=producto.getStockCriticoProducto()%>"/></td>
			</tr>
			<tr>
			<td>Unidad de medida</td>
			<%ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();%>
			<%Vector vecRep4;
			vecRep4 = manUnidadMedida.consultar();%>
			<%Enumeration enumRep4 = vecRep4.elements();%>
			   <td><SELECT size="1" name="unidadmedida">
			  <%while (enumRep4.hasMoreElements())
    			{
		     UnidadMedida unidadMedida = (UnidadMedida) enumRep4.nextElement();%>
		     <%if ( producto.getCodigoUnidadMedida().equals(unidadMedida.getCodigoUnidadMedida())){%>
				 <OPTION  selected VALUE="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>					   				<%}else{%>
				 <OPTION VALUE="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></OPTION>
			    <%}%>
		   <%}%>
			</SELECT></td>
			<td>Producto Semielaborado</td>
			<%if (producto.getProductoSemielaborado().equals("S")){%>  
			<td>Si <input name="productosemielaborado" type="radio" value="S" checked="checked" >
			No <input name="productosemielaborado" type="radio" value="N">
		</td>
		<%}else{%>
			<td>Si <input name="productosemielaborado" type="radio" value="S" >
			No <input name="productosemielaborado" type="radio" value="N" checked="checked">
		</td>
		<%}%>
			<!--td width="156"><input name = "productosemielaborado" type="type" value="<%--=producto.getProductoSemielaborado()--%>"/></td-->
			</tr>
			<tr>
			<td>Valor Costo</td>
			<td><input name = "valorcosto" type="type" value="<%=producto.getValorCostoProducto()%>"/></td>
			<td>Valor Venta</td>
			<td><input name = "valorventa" type="type" value="<%=producto.getValorVentaProducto()%>"/></td>
			</tr>
			<tr>
			<td valign="top">Preparaci&oacute;n</td>
			<td><input name = "preparacion" type="type" value="<%=producto.getPreparacionProducto()%>"/></td>
			</tr> 
			<tr>
			<td valign="top">Foto</td>
			<td><input name = "foto" type="type" value="<%=producto.getFotoProducto()%>"/></td>
			</tr>
			<tr>
		   <td valign="top">Observaci&oacute;n</td>
   			<td><input name = "observacion" type="type" value="<%=producto.getObservacionProducto()%>"/></td>
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
