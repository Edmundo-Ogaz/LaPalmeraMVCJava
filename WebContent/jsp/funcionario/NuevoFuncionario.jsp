<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<%
String filrut = request.getParameter("filrut");
String filnombre = request.getParameter("filnombre");
String filapellidopaterno = request.getParameter("filapellidopaterno");
String filapellidomaterno = request.getParameter("filapellidomaterno");
String filcargo = request.getParameter("filcargo");
String filarea = request.getParameter("filarea");
%>
<html>
<head>
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
  
  if (formulario.apellidopaterno.value.length < 1) {
    alert("Escriba el Apellido Paterno del Funcionario.");
    formulario.apellidopaterno.focus();
    return (false);
  }
  
  if (formulario.apellidomaterno.value.length < 1) {
    alert("Escriba el Apellido Materno del Funcionario.");
    formulario.apellidomaterno.focus();
    return (false);
  }
  if (formulario.cargo.value == -1) {
    alert("Escriba la Cargo del Funcionario.");
    formulario.cargo.focus();
    return (false);
  }
  
  if (formulario.area.value == -1) {
    alert("Escriba el Area del Funcionario.");
    formulario.area.focus();
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
</head>
<body>

<form name = formulario action = "/LaPalmera/servlet/GrabaFuncionario" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filrut" value="<%=filrut%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filapellidopaterno" value="<%=filapellidopaterno%>"/> 
<input type="hidden" name="filapellidomaterno" value="<%=filapellidomaterno%>"/>
<input type="hidden" name="filcargo" value="<%=filcargo%>"/> 
<input type="hidden" name="filarea" value="<%=filarea%>"/>
<table border = 0>
<tr>
<td>
Rut Funcionario
</td>
<td>
<input name = "rut" type="text" />
</td>
</tr>
<tr>
<td>
Nombre Funcionario
</td>
<td>
<input name = "nombre" type="text" size="40"/>
</td>
</tr>
<tr>
<td>
Apellido Paterno Funcionario
</td>
<td>
<input name = "apellidopaterno" type="type" size="40"/>
</td>
</tr>
<tr>
<td>
Apellido Materno Funcionario
</td>
<td>
<input name = "apellidomaterno" type="type" size="40"/>
</td>
</tr>
<tr>
<td>
C&oacute;digo Cargo 
</td>
<td>
<SELECT size=1 name=cargo>
<OPTION VALUE=-1>SELECCIONE CARGO</OPTION>
<% {
ArrayList<Cargo> arrayCargo= new ArrayList<Cargo>();
ManejadorCargo manCargo= new ManejadorCargo();
arrayCargo=manCargo.consultar();
%>

<%Iterator itCargo= arrayCargo.iterator();
while (itCargo.hasNext())
    {
Cargo cargo= (Cargo) itCargo.next();
%>
<OPTION VALUE=<%=cargo.getCodigoCargo()%>> <%=cargo.getNombreCargo()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
<tr>
<td>C&oacute;digo Area
</td>
<td>
<SELECT size=1 name=area>
<OPTION VALUE=-1>SELECCIONE AREA</OPTION>
<% {
ArrayList<Area> arrayArea= new ArrayList<Area>();
ManejadorArea manArea= new ManejadorArea();
arrayArea=manArea.consultar();
%>

<%Iterator itArea= arrayArea.iterator();
while (itArea.hasNext())
    {
Area area= (Area) itArea.next();
%>
<OPTION VALUE=<%=area.getCodigoArea()%>> <%=area.getNombreArea()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaFuncionario.jsp&titulo=Listado Funcionario&filrut=<%=filrut%>&filnombre=<%=filnombre%>&filapellidopaterno=<%=filapellidopaterno%>&filapellidomaterno=<%=filapellidomaterno%>&filcargo=<%=filcargo%>&filarea=<%=filarea%>','_self')">Lista</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilFuncionario.jsp&titulo=Filtrado Funcionario','_self')">Filtro</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>