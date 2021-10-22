<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
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
<form action = "/LaPalmera/jsp/ControlFilCliente.jsp">
<table border = 0>
<tr>
<td>
Rut Cliente</td>
<td>
<input type=text name=filrut value = '' size = 25 maxlength = 25></td>
</tr>
<tr>
<td>
Nombre Cliente</td>
<td>
<input type=text name=filnombre value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Dirección Cliente</td>
<td>
<input type=text name=fildireccion value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Comuna
</td>
<td>
<% {
ArrayList<Comuna> arrayComuna= new ArrayList<Comuna>();
ManejadorComuna manComuna= new ManejadorComuna();
arrayComuna=manComuna.consultar();
%>
<SELECT size=1 name=filcomuna>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itComuna= arrayComuna.iterator();
while (itComuna.hasNext())
    {
Comuna comuna= (Comuna) itComuna.next();%>
<OPTION VALUE=<%=comuna.getCodigoComuna()%>> <%=comuna.getNombreComuna()%></OPTION>
<%}}%>
</SELECT></td>
</tr>
<tr>
<td>
Fecha Nacimiento Cliente
</td>
<td>
<input type="text" name="filfechanacimiento" id="campo_fecha"/>
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
<!--td>
<input type=text name=filfechanacimiento value = '' size = 70 maxlength = 70></td-->
</tr>
<tr>
<td>
Tel&eacute;fono Cliente</td>
<td>
<input type=text name=filtelefono value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Email Cliente</td>
<td>
<input type=text name=filemail value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Pagina Web Cliente</td>
<td>
<input type=text name=filpaginaweb value = '' size = 70 maxlength = 70></td>
</tr>
<tr>
<td>
Tipo Cliente
</td>
<td>
<% {
ArrayList<TipoCliente> arrayTipoCliente= new ArrayList<TipoCliente>();
ManejadorTipoCliente manTipoCliente= new ManejadorTipoCliente();
arrayTipoCliente=manTipoCliente.consultar();
%>
<SELECT size=1 name=filtipocliente>
<OPTION VALUE="">Todos</OPTION>
<%Iterator itTipoCliente= arrayTipoCliente.iterator();
while (itTipoCliente.hasNext())
    {
TipoCliente tipoCliente= (TipoCliente) itTipoCliente.next();%>
<OPTION VALUE=<%=tipoCliente.getCodigoTipoCliente()%>> <%=tipoCliente.getNombreTipoCliente()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Observaci&oacute;n
</td>
<td>
<input type=text name=filobservacion value = '' size = 70 maxlength = 70></td>
</tr>
</table>
<input type=submit name=Enviar value = 'Buscar'>
<input type=submit name=Enviar value = 'Nuevo Cliente'>
</form>
</body>
</html>

