<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="arrayIngredienteDevolucion" class="ArrayList<Ingrediente>" scope="session"/>
<%

String cantidadinsumo = request.getParameter("cantidadinsumo");
	if (!cantidadinsumo.equals("0"))
	  {
		Ingrediente puntero = new Ingrediente();
		puntero.setCodigoInsumo(request.getParameter("insumo"));
		puntero.setCantidadInsumo(request.getParameter("cantidadinsumo"));	
		puntero.setCodigoUnidadMedida(request.getParameter("unidadmedida"));
		arrayIngredienteDevolucion.add(puntero);
}		
%>
<table border="1">
	
<%
int j = 0;
int i = 1;
Iterator itIngrediente = arrayIngredienteDevolucion.iterator();
while (itIngrediente.hasNext())
{
Ingrediente ingrediente = (Ingrediente) itIngrediente.next();
%>

<tr>
<td width="46">
Insumo
</td>
<td width="390">
<input type="hidden" name="insumo<%=i%>" value="<%=ingrediente.getCodigoInsumo()%>"/>
<select size=1 name="insumo<%=i%>text" disabled="disabled">
<option value=-1>SELECCIONE INSUMO</option>
<% 
ArrayList<Insumo> arrayInsumo= new ArrayList<Insumo>();
ManejadorInsumo manInsumo= new ManejadorInsumo();
arrayInsumo=manInsumo.consultar();
Iterator itInsumo= arrayInsumo.iterator();
while (itInsumo.hasNext())
{
Insumo insumo= (Insumo) itInsumo.next();
if (ingrediente.getCodigoInsumo().equals(insumo.getCodigoInsumo())){
%>
<option selected="selected" value=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></option>
<%}else{%>
<option value=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></option>
<%}}%>

<% 
ArrayList<Producto> arrayProducto= new ArrayList<Producto>();
ManejadorProducto manProducto= new ManejadorProducto();
arrayProducto=manProducto.consultar();
Iterator itProducto= arrayProducto.iterator();
while (itProducto.hasNext())
{
Producto producto2 = (Producto) itProducto.next();
if (ingrediente.getCodigoInsumo().equals(producto2.getCodigoProducto())){
%>
<option selected="selected" value=<%=producto2.getCodigoProducto()%>> <%=producto2.getNombreProducto()%></option>
<%}else{%>
<option value=<%=producto2.getCodigoProducto()%>> <%=producto2.getNombreProducto()%></option>
<%}}%>
</select>

Cantidad
<input type="hidden" name="cantidadinsumo<%=i%>" value="<%=ingrediente.getCantidadInsumo()%>"/>
<input type="text" name="cantidadinsumo<%=i%>text" value="<%=ingrediente.getCantidadInsumo()%>" size="5" disabled="disabled"/> 
</td>
<td width="363">
Unidad de Medida
<input type="hidden" name="unidadmedida<%=i%>" value="<%=ingrediente.getCodigoUnidadMedida()%>"/>
<select size="1" name="unidadmedida<%=i%>text" disabled="disabled">
<option selected="selected" value=-1>SELECCIONE UNIDAD MEDIDA</option>
<%
ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();;
ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();
arrayUnidadMedida = manUnidadMedida.consultar();
Iterator itUnidadMedida = arrayUnidadMedida.iterator();
while (itUnidadMedida.hasNext())
{
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();
if (ingrediente.getCodigoUnidadMedida().equals(unidadMedida.getCodigoUnidadMedida())){
%>
<option selected="selected" value="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></option>
<%}else{%>
<option value="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></option>
<%}}%>
</select></td>
</tr>
<%
i++;
j++;
}%>
<tr>
<td>
Insumo
</td>
<td>
<select size=1 name="insumo">
<option value=-1>SELECCIONE INSUMO</option>
<% 
ArrayList<Insumo> arrayInsumo= new ArrayList<Insumo>();
ManejadorInsumo manInsumo= new ManejadorInsumo();
arrayInsumo=manInsumo.consultar();
Iterator itInsumo= arrayInsumo.iterator();
while (itInsumo.hasNext())
{
Insumo insumo= (Insumo) itInsumo.next();
%>
<option value=<%=insumo.getCodigoInsumo()%>> <%=insumo.getNombreInsumo()%></option>
<%}%>
</select>
Cantidad
<input type="text" name="cantidadinsumo" size="5"/>
</td>
<td>
Unidad de Medida
<select size="1" name="unidadmedida">
<option selected="selected" value=-1>SELECCIONE UNIDAD MEDIDA</option>
<%
ArrayList<UnidadMedida> arrayUnidadMedida = new ArrayList<UnidadMedida>();;
ManejadorUnidadMedida manUnidadMedida = new ManejadorUnidadMedida();
arrayUnidadMedida = manUnidadMedida.consultar();
Iterator itUnidadMedida = arrayUnidadMedida.iterator();
while (itUnidadMedida.hasNext())
{
UnidadMedida unidadMedida = (UnidadMedida) itUnidadMedida.next();
%>
<option value="<%=unidadMedida.getCodigoUnidadMedida()%>"> <%=unidadMedida.getNombreUnidadMedida()%></option>
<%}%>
</select>
<%i++;%>
<%j++;%>
</td>
</tr>
</table>
<input type="hidden" name="cantidaddevolucion" value="<%=j%>"/>
<input type="hidden" name="ultimafilainsumoj" value="<%=j%>"/>

