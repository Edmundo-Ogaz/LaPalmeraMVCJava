<%--@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" --%>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filcodigo = request.getParameter("filcodigo");
String filnombre = request.getParameter("filnombre");
//String filciudad = request.getParameter("filciudad");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaConceptoTecnico.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcodigo" value="<%=filcodigo%>"/> 
<input type="hidden" name="filnombre" value="<%=filnombre%>"/>
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
</tr>	
<%
int i = 1;
ArrayList<ConceptoTecnico> arrayConceptoTecnico= new ArrayList<ConceptoTecnico>();
ManejadorConceptoTecnico manConceptoTecnico= new ManejadorConceptoTecnico();

manConceptoTecnico.setCodigoConceptoTecnico(filcodigo);
manConceptoTecnico.setNombreConceptoTecnico(filnombre);
//manComuna.setCodigoCiudad(filciudad);

arrayConceptoTecnico= manConceptoTecnico.consultar();
Iterator itConceptoTecnico= arrayConceptoTecnico.iterator();
while (itConceptoTecnico.hasNext())
 {
ConceptoTecnico conceptoTecnico= (ConceptoTecnico) itConceptoTecnico.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=conceptoTecnico.getCodigoConceptoTecnico()%>>
</td>
<th>
&nbsp;
<%=conceptoTecnico.getCodigoConceptoTecnico()%>
</th>
<td width =150  align="right">
&nbsp;
<%=conceptoTecnico.getNombreConceptoTecnico()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Comuna'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevoConceptoTecnico.jsp&titulo=Nuevo Concepto Tècnico&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>','_self')">Nuevo Concepto Técnico</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilConceptoTecnico.jsp&titulo=Filtrado Concepto Técnico','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

