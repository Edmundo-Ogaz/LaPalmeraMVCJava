<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
String filfamilia = request.getParameter("filfamilia");
%>
<html>
<head>
<script language="JavaScript">
<!--
function validar(formulario) {
var j
var aux = 0;    
		
	if (typeof(document.formulario.seleccion.length) != "undefined"){
		for (j=0;j<document.formulario.seleccion.length;j++){
       		if (document.formulario.seleccion[j].checked){
	   	  		aux = 1;	
          		break;
    		}
		}
	}else{
		if (document.formulario.seleccion.checked){
		    aux = 1;
		}
	}
	if (aux == 0 ){ 
    	alert("Seleccione un Registro.");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaSubfamilia.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
<input type="hidden" name="filfamilia" value="<%=filfamilia%>"/>
<table border="1">
<tr>
<th>
Selec
</th>
<th>
Código
</th>
<th>
Nombre
</th>
<th>
Familia
</th>
</tr>	
<%
int i = 1;
ArrayList<Subfamilia> arraySubfamilia= new ArrayList<Subfamilia>();
ManejadorSubfamilia manSubfamilia= new ManejadorSubfamilia();

manSubfamilia.setCodigoSubfamilia(filcodigo);
manSubfamilia.setNombreSubfamilia(filnombre);
manSubfamilia.setCodigoFamilia(filfamilia);

arraySubfamilia= manSubfamilia.consultar();
Iterator itSubfamilia= arraySubfamilia.iterator();
while (itSubfamilia.hasNext())
 {
Subfamilia subfamilia= (Subfamilia) itSubfamilia.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=subfamilia.getCodigoSubfamilia()%>>
</td>
<th>
&nbsp;
<%=subfamilia.getCodigoSubfamilia()%>
</th>
<td width =150  align="right">
&nbsp;
<%=subfamilia.getNombreSubfamilia()%>
</td>
<td width =300>
&nbsp;
<%=subfamilia.getCodigoFamilia()%>
</td>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Subfamilia'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevaSubfamilia.jsp&titulo=Nueva Subfamilia&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>&filfamilia=<%=filfamilia%>','_self')">Nueva Subfamilia</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilSubfamilia.jsp&titulo=Filtrado Subfamilia','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

