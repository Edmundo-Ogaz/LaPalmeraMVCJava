<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page session='true'%>
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
<ul class="Arial12"><p>Ingrese su nombre de Usuario y Contrase&ntilde;a para iniciar sesi&oacute;n.</p></ul>
<ul><form name = "formulario" action = "/LaPalmera/servlet/ControlUsuario" onSubmit = "return validar(this)" target="_self">
	<table>
	<tr>
	<td>Nombre de Usuario:</td>
	<td><input name="username" type="text"></td>
	</tr>
	<tr>
	<td>Contrase&ntilde;a:</td>
	<td><input name="password" type="password"></td>
	</tr>
	<tr>
	<td></td>
	<td><input name="enviar" value="Entrar" type="submit"></td>
	</tr>
	</table>
	</form></ul>
<ul id="Photo1"></ul>
</div>
</div>
</body>
</html>
