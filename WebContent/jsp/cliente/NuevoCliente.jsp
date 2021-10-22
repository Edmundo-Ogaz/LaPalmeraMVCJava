<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filrut = request.getParameter("filrut");
String filnombre = request.getParameter("filnombre");
String fildireccion = request.getParameter("fildireccion");
String filcomuna = request.getParameter("filcomuna");
String filfechanacimiento = request.getParameter("filfechanacimiento");
String filtelefono = request.getParameter("filtelefono");
String filemail = request.getParameter("filemail");
String filpaginaweb = request.getParameter("filpaginaweb");
String filtipocliente = request.getParameter("filtipocliente");
String filobservacion = request.getParameter("filobservacion");
%>
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
<script language="JavaScript">
<!--
function validar(formulario) {
  
  if (formulario.rut.value.length < 1) {
    alert("Escriba el Rut del Funcionario.");
    formulario.rut.focus();
    return (false);
  }
  
  if (formulario.rut.value.length < 9) {
    alert("Rut Invalido.");
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
    //formulario.rut.value="";
    formulario.rut.focus();
    return (false);
  }
  
  if (formulario.nombre.value.length < 1) {
    alert("Escriba el nombre del Funcionario.");
    formulario.nombre.focus();
    return (false);
  }
  
  /*if (formulario.direccion.value.length < 1) {
    alert("Escriba la Dirección del Cliente.");
    formulario.direccion.focus();
    return (false);
  }*/
  
  /*if (formulario.comuna.value == -1) {
    alert("Elija la Comuna del Cliente.");
    formulario.comuna.focus();
    return (false);
  }*/
  
  /*if (formulario.tipocliente.value == -1) {
    alert("Escriba la Cargo del Funcionario.");
    formulario.cargo.focus();
    return (false);
  }*/
  
  var entrar = confirm("¿Desea continuar?")
  if ( !entrar )
  	return (false);
  else
    return (true);
}
//-->
</script>
</head>
<body>

<form name = formulario action = "/LaPalmera/servlet/GrabaCliente" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filrut" value="<%=filrut%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="fildireccion" value="<%=fildireccion%>"/>
<input type="hidden" name="filcomuna" value="<%=filcomuna%>"/> 
<input type="hidden" name="filtelefono" value="<%=filtelefono%>"/>
<input type="hidden" name="filfechanacimiento" value="<%=filfechanacimiento%>"/> 
<input type="hidden" name="filemail" value="<%=filemail%>"/>
<input type="hidden" name="filpaginaweb" value="<%=filpaginaweb%>"/> 
<input type="hidden" name="filtipocliente" value="<%=filtipocliente%>"/>
<input type="hidden" name="filobservacion" value="<%=filobservacion%>"/>
<table border = 0>
<tr>
<td>
Rut Cliente 
</td>
<td>
<input name = "rut" type="text" />
</td>
</tr>
<tr>
<td>
Nombre Cliente
</td>
<td>
<input name = "nombre" type="text" size="40"/>
</td>
</tr>
<tr>
<td>
Dierecci&oacute;n Cliente
</td>
<td>
<input name = "direccion" type="type" size="40"/>
</td>
</tr>
<tr>
<td>
Comuna
</td>
<td>
<SELECT size=1 name=comuna>
<OPTION VALUE=-1>SELECCIONE COMUNA</OPTION>
<% {
ArrayList<Comuna> arrayComuna= new ArrayList<Comuna>();
ManejadorComuna manComuna= new ManejadorComuna();
arrayComuna=manComuna.consultar();
%>

<%Iterator itComuna= arrayComuna.iterator();
while (itComuna.hasNext())
    {
Comuna comuna= (Comuna) itComuna.next();
%>
<OPTION VALUE=<%=comuna.getCodigoComuna()%>> <%=comuna.getNombreComuna()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>
Fecha Nacimiento Cliente
</td>
<td>
<input type="text" name="fechanacimiento" id="campo_fecha"/>
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
<input name = "fechanacimiento" type="type" size="40"/>
</td-->
</tr>
<tr>
<td>
Tel&eacute;fono Cliente
</td>
<td>
<input name = "telefono" type="type" size="40"/>
</td>
</tr>
<tr>
<td>
Email Cliente
</td>
<td>
<input name = "email" type="type" size="40"/>
</td>
</tr>
<tr>
<td>
P&aacute;gina Web Cliente
</td>
<td>
<input name = "paginaweb" type="type" size="40"/>
</td>
</tr>
<tr>
<td>Tipo Cliente
</td>
<td>
<SELECT size=1 name=tipocliente>
<OPTION VALUE=-1>SELECCIONE TIPO CLIENTE</OPTION>
<% {
ArrayList<TipoCliente> arrayTipoCliente= new ArrayList<TipoCliente>();
ManejadorTipoCliente manTipoCliente= new ManejadorTipoCliente();
arrayTipoCliente=manTipoCliente.consultar();
%>

<%Iterator itTipoCliente= arrayTipoCliente.iterator();
while (itTipoCliente.hasNext())
    {
TipoCliente tipoCliente= (TipoCliente) itTipoCliente.next();
%>
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
<input name = "observacion" type="type" size="40"/>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaCliente.jsp&titulo=Listado Cliente&filrut=<%=filrut%>&filnombre=<%=filnombre%>&fildireccion=<%=fildireccion%>&filcomuna=<%=filcomuna%>&filtelefono=<%=filtelefono%>&filfechanacimiento=<%=filfechanacimiento%>&filemail=<%=filemail%>&filpaginaweb=<%=filpaginaweb%>&filtipocliente=<%=filtipocliente%>&filobservacion=<%=filobservacion%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilCliente.jsp&titulo=Filtrado Cliente','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>