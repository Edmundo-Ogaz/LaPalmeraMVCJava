<html>
<head>
<!-Hoja de estilos del calendario -->
<link rel="stylesheet" type="text/css" media="all" href="calendar-system.css" title="win2k-cold-1" />
<!-- librería principal del calendario -->
<script type="text/javascript" src="calendar.js"></script>
<!-- librería para cargar el lenguaje deseado -->
<script type="text/javascript" src="lang/calendar-es.js"></script>
<!-- librería que declara la función Calendar.setup, que ayuda a generar un calendario en unas pocas líneas de código -->
<script type="text/javascript" src="calendar-setup.js"></script>
<!-- script que define y configura el calendario-->
</head>
<body>
<form action = "/LaPalmera/jsp/ControlFilPedido.jsp">
<table border = 0>
<tr>
<td>
Código del pedido</td>
<td>
<input type=text name="filnumeropedido" value = '' size = 25 maxlength = 25></td>
</tr>
<tr>
<td>
Nombre Cliente
</td>
<td>
<input type=text name="filcliente" value = '' size = 25 maxlength = 25></td>
</tr>
<tr>
<td>
Fecha de Inicio
</td>
<td>
<input type="text" name="filfechainicio" id="campo_fecha"/>
<input type="button" id="lanzador" value="..."/>
<!-- script que define y configura el calendario-->
<script type="text/javascript">
Calendar.setup({
inputField     :    "campo_fecha",     // id del campo de texto
ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto
button     :    "lanzador"     // el id del botón que lanzará el calendario
});
</script>
</td>
</tr>
<tr>
<td>
Fecha de Termino
</td>
<td>
<input type="text" name="filfechatermino" id="campo_fecha"/>
<input type="button" id="lanzador" value="..."/>
<!-- script que define y configura el calendario-->
<script type="text/javascript">
Calendar.setup({
inputField     :    "campo_fecha",     // id del campo de texto
ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto
button     :    "lanzador"     // el id del botón que lanzará el calendario
});
</script>
</td>
</tr>
<tr>
<td>
Estado Pedido
</td>
<td>
<select name="filestadopedido">
<option value="">TODOS</option>
<option value="I">INGRESADO</option>
<option value="C">CONFIRMADO</option>
<option value="R">RECHAZADO</option>
</select>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
</form>
</body>
</html>

