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
<form name = formulario action = "/LaPalmera/jsp/ControlListaBodega.jsp" onSubmit="return validar(this)" target="_self">
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
ArrayList<Bodega> arrayBodega= new ArrayList<Bodega>();
ManejadorBodega manBodega= new ManejadorBodega();

manBodega.setCodigoBodega(filcodigo);
manBodega.setNombreBodega(filnombre);
//manComuna.setCodigoCiudad(filciudad);

arrayBodega= manBodega.consultar();
Iterator itBodega= arrayBodega.iterator();
while (itBodega.hasNext())
 {
Bodega bodega= (Bodega) itBodega.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=bodega.getCodigoBodega()%>>
</td>
<th>
&nbsp;
<%=bodega.getCodigoBodega()%>
</th>
<td align="right">
&nbsp;
<%=bodega.getNombreBodega()%>
</td>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Linea de Producción'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevaBodega.jsp&titulo=Nueva Bodega&filcodigo=<%=filcodigo%>&filnombre=<%=filnombre%>','_self')">Nueva Bodega</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilBodega.jsp&titulo=Filtrado Bodega','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

