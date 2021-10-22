<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
   <title>Untitled Document</title>
   <script>
	   //window.open('file://bodeguero.html','Mail','toolbar=0,location=0,status=0,menubar=0,scrollbars=1,heigth=300,width=120');
	   //window.open("http://localhost:8080/LaPalmera/jsp/mail/java.mail","Mail","width=500,heigth=300,scrollbars=NO");
	   //window.open("http://bodeguero.html","Mail","width=900,heigth=500,scrollbars=NO");
	   alert("Hay Mensajes\n Para el Usuario");
	</script>
</head>
<body>
<form name = formulario action = "/LaPalmera/servlet/GrabaServlet" target="_self">
<table border = 0>
<!--tr>
<td>
destinatario
</td>
<td>
<input type="text" name="destinatario">
</td>
</tr>
<tr>
<td>
asunto
</td>
<td>
<input type="text" name="asunto">
</td>
</tr>
<tr>
<td>
cuerpo
</td>
<td>
<input type="text" name="cuerpo">
</td>
</tr-->
</table>
<input type="submit" name="Enviar" value ='Enviar'>
</form>
</body>
</html>
