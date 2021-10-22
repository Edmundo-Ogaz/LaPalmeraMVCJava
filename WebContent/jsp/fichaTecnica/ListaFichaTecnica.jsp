<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filproducto = request.getParameter("filproducto");
//String nombre = request.getParameter("nombre");
String filconceptotecnico = request.getParameter("filconceptotecnico");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaFichaTecnica.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filproducto" value="<%=filproducto%>"/> 
<input type="hidden" name="filconceptotecnico" value="<%=filconceptotecnico%>"/>
<table border="1">
<tr>
<th>
Selec
</th>
<th>
Producto
</th>
<th>
Concepto Técnico
</th>
<th>
Descripción
</th>
</tr>	
<%
int i = 1;
ArrayList<FichaTecnica> arrayFichaTecnica= new ArrayList<FichaTecnica>();
ManejadorFichaTecnica manFichaTecnica= new ManejadorFichaTecnica();

manFichaTecnica.setCodigoProducto(filproducto);
//manComuna.setNombreComuna(nombre);
manFichaTecnica.setCodigoConceptoTecnico(filconceptotecnico);

arrayFichaTecnica= manFichaTecnica.consultar();
Iterator itFichaTecnica= arrayFichaTecnica.iterator();
while (itFichaTecnica.hasNext())
 {
FichaTecnica fichaTecnica= (FichaTecnica) itFichaTecnica.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=fichaTecnica.getCodigoProducto()%>/<%=fichaTecnica.getCodigoConceptoTecnico()%>>
</td>
<th>
&nbsp;
<%=fichaTecnica.getCodigoProducto()%>
</th>
<td width =150  align="right">
&nbsp;
<%=fichaTecnica.getCodigoConceptoTecnico()%>
</td>
<td width =150  align="right">
&nbsp;
<%=fichaTecnica.getDescripcionFichaTecnica()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Comuna'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevaFichaTecnica.jsp&titulo=Nueva FichaTecnica&filproducto=<%=filproducto%>&filconceptotecnico=<%=filconceptotecnico%>','_self')">Nueva Ficha Técnica</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilFichaTecnica.jsp&titulo=Filtrado FichaTecnica','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

