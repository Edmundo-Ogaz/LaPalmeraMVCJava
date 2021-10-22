<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="arrayIngredienteEntrega" class="ArrayList<Ingrediente>" scope="session"/>
<%
	String cantidadprogramada = request.getParameter("cantidadprogramada");
	int cantidadingredienteentrega = Integer.parseInt(request.getParameter("cantidadentregainsumo"));
	String cantidadinsumo = request.getParameter("cantidadinsumo");
	if (cantidadinsumo.equals("0"))
	{
   	  arrayIngredienteEntrega.remove(cantidadingredienteentrega-2);
	}
%>
<table border="1">
<tr>
<th>
Insumo
</th>
<th>
Cantidad
</th>
<th>
U/M
</th>
<th>
Ubicación
</th>
</tr>
<%
int i = 1;
int k = 0;
int j = 1;
String cantidadingrediente = "";
String cantidadubicacion = "";
String stock = "N";
Iterator itIngredienteEntrega = arrayIngredienteEntrega.iterator();
while (itIngredienteEntrega.hasNext())
{
Ingrediente ingrediente= (Ingrediente) itIngredienteEntrega.next();%>

<tr>
<td>
&nbsp;
<%
Insumo insumo2 = new Insumo();
insumo2.setCodigoInsumo(ingrediente.getCodigoInsumo());
if (insumo2.buscar());
out.print(insumo2.getNombreInsumo());
%>
<%--=ingrediente.getCodigoInsumo()--%>
<input type="hidden" name=insumo<%=i%> value="<%=ingrediente.getCodigoInsumo()%>"/>
</td>
<td>
&nbsp;
<%cantidadingrediente = ingrediente.getCantidadInsumo();%>
<%=cantidadingrediente.substring(0,cantidadingrediente.indexOf(".")+2)%>
<%--=cantidadingrediente--%>
<input type="hidden" name=cantidadinsumo<%=i%> value="<%=cantidadingrediente%>"/>
</td>
<td>
<%=ingrediente.getCodigoUnidadMedida()%>
<input type="hidden" name=unidadmedida<%=i%> value="<%=ingrediente.getCodigoUnidadMedida()%>"/>
</td>
<td>
<table border="1" width="100%">
<tr>
<th width="110">
Bodega
</th>
<th>
Descripción
</th>
<th>
Fecha Vencimiento
</th>
<th>
Cantidad
</th>
<th>
U/M
</th>
</tr>	
<%
j = 1;
stock = "N";
ArrayList<Ubicacion> arrayUbicacion= new ArrayList<Ubicacion>();
ManejadorUbicacion manUbicacion = new ManejadorUbicacion();
manUbicacion.setCodigoProducto(ingrediente.getCodigoInsumo());
arrayUbicacion= manUbicacion.consultar();
Iterator itUbicacion= arrayUbicacion.iterator();
while (itUbicacion.hasNext())
{
Ubicacion ubicacion= (Ubicacion) itUbicacion.next();
%>
<tr>
<td>
&nbsp;
<%
Bodega bodega = new Bodega();
bodega.setCodigoBodega(ubicacion.getCodigoBodega());
if (bodega.buscar());
out.print(bodega.getNombreBodega());
%>
<%--=ubicacion.getCodigoBodega()--%>
<input type="hidden" name="bodega<%=i%><%=j%>" value="<%=ubicacion.getCodigoBodega()%>"/>
</td>
<td>
&nbsp;
<%=ubicacion.getObservacion()%>
<input type="hidden" name="observacion<%=i%><%=j%>" value="<%=ubicacion.getObservacion()%>"/>
</td>
<td>
&nbsp;
<%=ubicacion.getFechaVencimiento()%>
<input type="hidden" name="fechavencimiento<%=i%><%=j%>" value="<%=ubicacion.getFechaVencimiento()%>"/>
<input type="hidden" name="fechaingreso<%=i%><%=j%>" value="<%=ubicacion.getFechaIngreso()%>"/>
<input type="hidden" name="horaingreso<%=i%><%=j%>" value="<%=ubicacion.getHoraIngreso()%>"/>
</td>
<%
cantidadingrediente = String.valueOf(Float.parseFloat(cantidadingrediente) - Float.parseFloat(ubicacion.getCantidad())); 
if (Float.parseFloat(cantidadingrediente) > 0)
{
%>
<td>
&nbsp;
<font color="#FF0000"><%=ubicacion.getCantidad()%></font>
<input type="hidden" name="cantidadbodega<%=i%><%=j%>" value="<%=ubicacion.getCantidad()%>"/>
<%--=ubicacion.getCantidad()--%>
</td>
<td>
&nbsp;
<%=insumo2.getCodigoUnidadMedida()%>
<input type="hidden" name=unidadmedida<%=i%><%=j%> value="<%=insumo2.getCodigoUnidadMedida()%>"/>
</td>
<%}else{%>
<%
cantidadingrediente = String.valueOf(Float.parseFloat(ubicacion.getCantidad())+Float.parseFloat(cantidadingrediente)+0.01);
cantidadingrediente = cantidadingrediente.substring(0,cantidadingrediente.indexOf(".")+2);
%>
<td>
&nbsp;
<font color="#0000FF"><%=cantidadingrediente%></font>
<input type="hidden" name="cantidadbodega<%=i%><%=j%>" value="<%=cantidadingrediente%>"/>
<%--=ubicacion.getCantidad()--%>
</td>
<td>
&nbsp;
<%=insumo2.getCodigoUnidadMedida()%>
<input type="hidden" name=unidadmedida<%=i%><%=j%> value="<%=insumo2.getCodigoUnidadMedida()%>"/>
</td>
<%j++;%>
<%
stock = "S";
break;
}
%>
</tr>
<%j++;%>
<%}%>
<%
if (j==1){
%>
<tr>
<td colspan="5">
<font color="#FF0000">No tiene Ubicación asociado este Insumo</font>
</td>
</tr>
<%}%>
</table>
<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/>
</td>
</tr>
<%i++;%>
<%k++;%>
<%}%>
</table>
<%--}--%>
<input type="hidden" name="insumo" value="0"/>
<input type="hidden" name="cantidadinsumo" value="0"/>
<%k++;%>
<input type="hidden" name="stock" value="<%=stock%>"/>
<input type="hidden" name="ubicacion" value="<%=j%>"/>
<input type="hidden" name="ultimafilainsumo" value="<%=i%>"/>
<input type="hidden" name="cantidadentregainsumo" value="<%=k%>"/>
<button type="button" onClick="recuperaOtraEntregaInsumo()">Agregar Otro Insumo</button>
<button type="button" onClick="sacaEntregaInsumo()">Sacar Ultimo Insumo</button>


