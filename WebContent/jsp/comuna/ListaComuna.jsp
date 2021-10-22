<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<%
String filcomuna = request.getParameter("filcomuna");
//String nombre = request.getParameter("nombre");
String filciudad = request.getParameter("filciudad");
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
<form name = formulario action = "/LaPalmera/jsp/ControlListaComuna.jsp" onSubmit="return validar(this)" target="_self">
<input type="hidden" name="filcomuna" value="<%=filcomuna%>"/> 
<input type="hidden" name="filciudad" value="<%=filciudad%>"/>
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
Ciudad
</th>
</tr>	
<%
int i = 1;
ArrayList<Comuna> arrayComuna= new ArrayList<Comuna>();
ManejadorComuna manComuna= new ManejadorComuna();

manComuna.setCodigoComuna(filcomuna);
//manComuna.setNombreComuna(nombre);
manComuna.setCodigoCiudad(filciudad);

arrayComuna= manComuna.consultar();
Iterator itComuna= arrayComuna.iterator();
while (itComuna.hasNext())
 {
Comuna comuna= (Comuna) itComuna.next();
 %>
<tr>
<td>
<input type = radio name = seleccion value = <%=comuna.getCodigoComuna()%>>
</td>
<th>
&nbsp;
<%=comuna.getCodigoComuna()%>
</th>
<td width =150  align="right">
&nbsp;
<%=comuna.getNombreComuna()%>
</td>
<td width =150  align="right">
&nbsp;
<%=comuna.getCodigoCiudad()%>
</td>
</tr>
<%i++;}%>
</table>
<input type="hidden" name="ultimafila" value="<%=i-1%>"/>
<!--input type=submit name=Enviar value = 'Nueva Comuna'-->
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=NuevaComuna.jsp&titulo=Nueva Comuna&filcomuna=<%=filcomuna%>&filciudad=<%=filciudad%>','_self')">Nueva Comuna</button>
<input type=submit name=Enviar value = 'Modificar'>
<input type=submit name=Enviar value = 'Eliminar'>
<button type="button" onClick="window.open('/LaPalmera/jsp/UsoSistema.jsp?destino=FilComuna.jsp&titulo=Filtrado Comuna','_self')">Volver</button>
<!--input type=submit name=Enviar value = 'Volver'-->
</form>
</body>
</html>

