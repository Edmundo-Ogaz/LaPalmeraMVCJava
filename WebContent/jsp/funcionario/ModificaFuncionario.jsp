<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="funcionario" class="unab.com.Funcionario" scope="session"/>
<%
String filrut = request.getParameter("filrut");
String filnombre = request.getParameter("filnombre");
String filapellidopaterno = request.getParameter("filapellidopaterno");
String filapellidomaterno = request.getParameter("filapellidomaterno");
String filcargo = request.getParameter("filcargo");
String filarea = request.getParameter("filarea");
String rut = request.getParameter("seleccion");
String nombre = "";
String apellidopaterno = "";
String apellidomaterno = "";
String cargo = "";
String area = "";

funcionario.setRutFuncionario(rut);
if (funcionario.buscar()){
nombre = funcionario.getNombreFuncionario();
apellidopaterno = funcionario.getApellidoPaternoFuncionario();
apellidomaterno = funcionario.getApellidoMaternoFuncionario();
cargo = funcionario.getCodigoCargo();
area = funcionario.getCodigoArea();
}
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
<form name = formulario action = "/LaPalmera/servlet/ModificaFuncionario" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filrut" value="<%=filrut%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filapellidopaterno" value="<%=filapellidopaterno%>"/> 
<input type="hidden" name="filapellidomaterno" value="<%=filapellidomaterno%>"/>
<input type="hidden" name="filcargo" value="<%=filcargo%>"/> 
<input type="hidden" name="filarea" value="<%=filarea%>"/>
<input type="hidden" name="rut" value="<%=rut%>"/>

<table border = 0>
<tr>
<td>
Rut</td>
<td>
<input type=text name="rut2" value="<%=rut%>" disabled="disabled">
</td>
</tr>
<tr>
<td>
Nombre
</td>
<td>
<input type=text name="nombre" value="<%=nombre%>"/>
</td>
</tr>
<tr>
<td>
Apellido Paterno 
</td>
<td>
<input name = "apellidopaterno" type="type" size="40" value="<%=apellidopaterno%>"/>
</td>
</tr>
<tr>
<td>
Apellido Materno 
</td>
<td>
<input name = "apellidomaterno" type="type" size="40" value="<%=apellidomaterno%>"/>
</td>
</tr>
<tr>
<td>
C&oacute;digo Cargo :
</td>
<td>
<SELECT size=1 name=cargo>
<OPTION VALUE=-1>SELECCIONE CARGO</OPTION>
<% 
ArrayList<Cargo> arrayCargo= new ArrayList<Cargo>();
ManejadorCargo manCargo= new ManejadorCargo();
arrayCargo=manCargo.consultar();%>

<%Iterator itCargo= arrayCargo.iterator();
while (itCargo.hasNext())
    {
Cargo cargo2= (Cargo) itCargo.next();
if (cargo.equals(cargo2.getCodigoCargo())){%>
<OPTION selected="selected" VALUE=<%=cargo2.getCodigoCargo()%>> <%=cargo2.getNombreCargo()%></OPTION>
<%}else{%>
<OPTION VALUE=<%=cargo2.getCodigoCargo()%>> <%=cargo2.getNombreCargo()%></OPTION>
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
<% 
ArrayList<Area> arrayArea= new ArrayList<Area>();
ManejadorArea manArea= new ManejadorArea();
arrayArea=manArea.consultar();
%>

<%Iterator itArea= arrayArea.iterator();
while (itArea.hasNext())
    {
Area area2= (Area) itArea.next();
if (area.equals(area2.getCodigoArea())){%>
<OPTION selected="selected" VALUE=<%=area2.getCodigoArea()%>> <%=area2.getNombreArea()%></OPTION>
<%}else{%>
<OPTION VALUE=<%=area2.getCodigoArea()%>> <%=area2.getNombreArea()%></OPTION>
<%}}%>
</SELECT>
</td>
</tr>
</table>
<input type=submit name=Enviar value = 'Enviar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=ListaFuncionario.jsp&titulo=Listado Funcionario&filrut=<%=filrut%>&filnombre=<%=filnombre%>&filapellidopaterno=<%=filapellidopaterno%>&filapellidomaterno=<%=filapellidomaterno%>&filcargo=<%=filcargo%>&filarea=<%=filarea%>','_self')">Volver</button>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilFuncionario.jsp&titulo=Filtrado Funcionario','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>
