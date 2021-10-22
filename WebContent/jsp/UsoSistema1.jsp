<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page session='true'%>
<%String destino = request.getParameter("destino");%>
<%String titulo = request.getParameter("titulo");%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<title>Pastelería La Palmera</title>
<script language="JavaScript">
  <!--
function validar(formulario) {
  if (formulario.username.value.length < 1) {
    alert("Escriba el nombre de usuario.");
    formulario.username.focus();
    return (false);
  }
   if (formulario.password.value.length < 1) {
    alert("Escriba la contraseña del usuario.");
    formulario.password.focus();
    return (false);
  }
  return (true);
}
 //-->
 </script>
</head>
<body>
<div id="contenedor">
<div id="header"></div>
<div id="cuerpo">
<ul id="HeaderWelcome"></ul>
<ul class="HSeparator"/></ul>
<ul> <jsp:include page="jsp/menu.jsp" flush="true"/></ul>
<ul>
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
</ul>
<ul id="Photo1"></ul>
</div>
</div>
</body>
</html>
