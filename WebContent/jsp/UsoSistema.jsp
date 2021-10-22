<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="cl.laPalmera.DTO.UsuarioDTO" %>
<%@ page session='true'%>
<jsp:useBean id="usuario" class="cl.laPalmera.DTO.UsuarioDTO" scope="session" />
<%if (usuario.getLoginUsuario().equals("")){%>
	<jsp:forward page="/jsp/index.jsp">
		<jsp:param name="error" value="Es obligatorio identificarse"/>
	</jsp:forward>
<%}%>
<%String destino = request.getParameter("destino");%>
<%String titulo = request.getParameter("titulo");%>
<%--String mensaje = request.getParameter("mensaje");--%>
<html>
<head>
	<title>Pastelería La Palmera</title>
	<link rel="stylesheet" type="text/css" href="Template037.css">
	<%if (usuario.getCodigoGrupo().equals("1")) {%>	
		<script language="JavaScript" src="../menu_pasteleria/menu_administrador.js">
		</script>
	<%}else{%>
		<%if (usuario.getCodigoGrupo().equals("2")) {%>	
			<script language="JavaScript" src="../menu_pasteleria/menu_bodeguero.js">
			</script>
		<%}else{%>
			<%if (usuario.getCodigoGrupo().equals("3")) {%>	
				<script language="JavaScript" src="../menu_pasteleria/menu_supervisor.js">
				</script>
			<%}%>
		<%}%>
	<%}%>	
	<script language="JavaScript1.2" src="../menu_pasteleria/mm_menu.js"></script>
</head>
<body topmargin="0" leftmargin="0" onLoad="MM_preloadImages('../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif','../menu_pasteleria/imgenes/menu_pasteleria_r1_c2_f2.gif','../menu_pasteleria/imgenes/menu_pasteleria_r1_c2.gif','../menu_pasteleria/imgenes/menu_pasteleria_r1_c4_f2.gif','../menu_pasteleria/imgenes/menu_pasteleria_r1_c4.gif','../menu_pasteleria/imgenes/menu_pasteleria_r1_c6_f2.gif','../menu_pasteleria/imgenes/menu_pasteleria_r1_c6.gif','../menu_pasteleria/imgenes/menu_pasteleria_r1_c8_f2.gif','../menu_pasteleria/imgenes/menu_pasteleria_r1_c8.gif');">

<script language="JavaScript1.2">mmLoadMenus();</script>

<table cellpadding="0" cellspacing="0" width="752" class="Top">
	<tr>
		<td><img src="../../images/logo pasteleria la palmera.png" width="750" height="101"></td>
	</tr>
</table>

<%if (usuario.getCodigoGrupo().equals("1")) {%>
<table cellpadding="0" cellspacing="0" width="752" class="Middle">
		<tr>
		<td width="106"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="106" height="26"></td>
		<td width="115"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c2','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c2.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c2','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c2_f2.gif',1);"><img name="menu20pasteleria_r1_c2" src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c2.gif" width="115" height="26" border="0" usemap="#m_menu20pasteleria_r1_c2" alt=""></a></td>
		<td width="35"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<td width="123"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c4','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c4.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c4','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c4_f2.gif',1);"><img name="menu20pasteleria_r1_c4" src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c4.gif" width="123" height="26" border="0" usemap="#m_menu20pasteleria_r1_c4" alt=""></a></td>
		<td width="35"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<td width="185"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c6','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c6.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c6','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c6_f2.gif',1);"><img name="menu20pasteleria_r1_c6" src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c6.gif" width="185" height="26" border="0" usemap="#m_menu20pasteleria_r1_c6" alt=""></a></td>
		<td width="35"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<td width="89"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c8','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c8.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c8','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c8_f2.gif',1);"><img name="menu20pasteleria_r1_c8" src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c8.gif" width="54" height="26" border="0" usemap="#m_menu20pasteleria_r1_c8" alt=""></a></td>
		<td width="62"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="62" height="26"></td>
		</tr>
		</table>
<%}else{%>
	<%if ((usuario.getCodigoGrupo().equals("2")) || (usuario.getCodigoGrupo().equals("3"))) {%>
		<table cellpadding="0" cellspacing="0" width="752" class="Middle">
		<tr>
		<td width="106"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="106" height="26"></td>
		<td width="123"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c4','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c4.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c4','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c4_f2.gif',1);"><img name="menu20pasteleria_r1_c4" src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c4.gif" width="123" height="26" border="0" usemap="#m_menu20pasteleria_r1_c4" alt=""></a></td>
		<td width="35"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<td width="89"><a href="#" onMouseOut="MM_swapImage('menu20pasteleria_r1_c8','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c8.gif',1);" onMouseOver="MM_swapImage('menu20pasteleria_r1_c8','','../menu_pasteleria/imgenes/menu_pasteleria_r1_c8_f2.gif',1);"><img name="menu20pasteleria_r1_c8" src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c8.gif" width="54" height="26" border="0" usemap="#m_menu20pasteleria_r1_c8" alt=""></a></td>
		<td width="35"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<td width="185"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="185" height="26"></td>
		<td width="35"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="35" height="26"></td>
		<td width="115"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="115" height="26"></td>
		<td width="62"><img src="../menu_pasteleria/imgenes/menu_pasteleria_r1_c1.gif" width="62" height="26"></td>
		</tr>
		</table>
	<%}%>
<%}%>

<TABLE>
<tr>
<TD align="center">
<font size="+3"><%=titulo%></font>
</td>
</tr>
</TABLE>
<hr>
<TABLE>
<TR> 
  <TD >
  <jsp:include page="<%=destino%>" flush="true"/>
  </TD> 
 </TR> 
</TABLE>

<%if (usuario.getCodigoGrupo().equals("1")) {%>
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
<%}else{%>
	<%if ((usuario.getCodigoGrupo().equals("2")) || (usuario.getCodigoGrupo().equals("3"))) {%>
	<map name="m_null">
	<area shape="poly" coords="35,2,153,2,153,26,35,26,35,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver=		"MM_showMenu(window.mm_menu_0328002410_0,35,26,null,'nmenu_pasteleria_1_1');"  >
	</map>
	<!--map name="m_menu20pasteleria_r1_c2">
	<area shape="poly" coords="-3,2,115,2,115,26,-3,26,-3,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_0,-3,26,null,'menu20pasteleria_r1_c2');"  >
	</map-->
	<map name="m_menu20pasteleria_r1_c4">
	<area shape="poly" coords="1,2,122,2,122,26,1,26,1,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_1,1,26,null,'menu20pasteleria_r1_c4');"  >
	</map>
	<!--map name="m_menu20pasteleria_r1_c6">
	<area shape="poly" coords="0,2,187,2,187,26,0,26,0,2" href="#" alt="" onMouseOut="MM_startTimeout();"  onMouseOver="MM_showMenu(window.mm_menu_0328002410_2,0,26,null,'menu20pasteleria_r1_c6');"  >
	</map-->
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
	<%}%>
<%}%>
</body>
</html>
