<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="arrayDetallePedidoTorta" class="ArrayList<DetallePedido>" scope="session"/>
<%

String producto = request.getParameter("producto");
String cantidadproducto = request.getParameter("cantidadproducto");

	if (!cantidadproducto.equals("0"))
	  {
	  DetallePedido puntero = new DetallePedido();
	  puntero.setCodigoProducto(producto);
	  puntero.setCantidadProducto(cantidadproducto);	
		
	  Producto producto1 = new Producto();
	  producto1.setCodigoProducto(producto);
	  if (producto1.buscar())
		{
		String precioproducto = String.valueOf(Integer.parseInt(producto1.getValorVentaProducto())*Integer.parseInt(cantidadproducto));
		puntero.setPrecioProducto(precioproducto);
		}
	  arrayDetallePedidoTorta.add(puntero);
      }		
%>

<table border="1">
<tr>
<th>
Producto</th>
<th>
Cantidad</th>
<th>
Precio</th>
<th>
Insumo</th>
</tr>
<%//ArrayList<DetallePedido> arrayDetallePedido = new ArrayList<DetallePedido>();
//ManejadorDetallePedido manDetallePedido = new ManejadorDetallePedido();
//manDetallePedido.setNumeroPedido(numeropedido);
//arrayDetallePedido = manDetallePedido.consultar();
int i = 1;
int k = 0;
int preciototal = 0;
String cantidadinsumo = "";
Iterator itDetallePedido = arrayDetallePedidoTorta.iterator();

while (itDetallePedido.hasNext())
{
DetallePedido detallePedido = (DetallePedido) itDetallePedido.next();%>
<tr>
<td>
<%
ArrayList<Producto> arrayProducto= new ArrayList<Producto>();
ManejadorProducto manProducto = new ManejadorProducto();
manProducto.setCodigoProducto(detallePedido.getCodigoProducto());
arrayProducto= manProducto.consultar();
Iterator itProducto= arrayProducto.iterator();
  while (itProducto.hasNext())
  {
  Producto producto2= (Producto) itProducto.next();
  %>
  &nbsp;
  <%=producto2.getNombreProducto()%>
  <%}%>  
  <input type="hidden" name=producto<%=i%> value="<%=detallePedido.getCodigoProducto()%>"/>
  </td>
<td>
<%=detallePedido.getCantidadProducto()%>
<input type="hidden" name=cantidadproducto<%=i%> value="<%=detallePedido.getCantidadProducto()%>"/>
</td>
<td>
<%=detallePedido.getPrecioProducto()%>  
<%preciototal = preciototal + Integer.parseInt(detallePedido.getPrecioProducto());%> 
<input type="hidden" name=precioproducto<%=i%> value="<%=detallePedido.getPrecioProducto()%>"/>
</td>
<td>
<table border="1">
<tr>
<th>
Insumo</th>
<th>
Cantidad</th>
<th>
Unidad Medida</th>
<th>
Stock Disponible</th>
<th>
Unidad Medida</th>
</tr>					
<%
ArrayList<Ingrediente> arrayIngrediente = new ArrayList<Ingrediente>();
ManejadorIngrediente manIngrediente = new ManejadorIngrediente();
manIngrediente.setCodigoProducto(detallePedido.getCodigoProducto());
arrayIngrediente = manIngrediente.consultar();
Iterator itIngrediente = arrayIngrediente.iterator();
int j = 1;
  while (itIngrediente.hasNext())
  {
  Ingrediente ingrediente = (Ingrediente) itIngrediente.next();
   %>
<tr>
<td>
  &nbsp;
  <% 
  Producto producto2 = new Producto();
  producto2.setCodigoProducto(ingrediente.getCodigoInsumo());
  if (producto2.buscar())
  {%>
  <%=producto2.getNombreProducto()%>
  <%}%>
  <%
  Insumo insumo2 = new Insumo();
  insumo2.setCodigoInsumo(ingrediente.getCodigoInsumo());
  if (insumo2.buscar())
  {%>
  <%=insumo2.getNombreInsumo()%>
  <%}%>
<input type="hidden" name="insumo<%=i%><%=j%>" value="<%=ingrediente.getCodigoInsumo()%>"/></td>
<td>
<%cantidadinsumo = String.valueOf(Integer.parseInt(detallePedido.getCantidadProducto())*Integer.parseInt(ingrediente.getCantidadInsumo()));%>
&nbsp;
<%=cantidadinsumo%>
<input type="hidden" name="cantidadinsumo<%=i%><%=j%>" value="<%=cantidadinsumo%>"/>
</td>
<td>
  <%=ingrediente.getCodigoUnidadMedida()%>
<input type="hidden" name="unidadmedida<%=i%><%=j%>" value="<%=ingrediente.getCodigoUnidadMedida()%>"/>
</td>
<td>
  <%
  Stock stock = new Stock();
  stock.setCodigoProducto(ingrediente.getCodigoInsumo());
  if (stock.buscar())
  {%>
  <%
  if (Integer.parseInt(cantidadinsumo) < Integer.parseInt(stock.getStockDisponible()))
  {%>
  <font color="#0000FF"><%=stock.getStockDisponible()%></font>
  <%}else{%>
  <font color="#FF0000"><%=stock.getStockDisponible()%></font>
  <%}%>	  
</td>
<td>
&nbsp;
<font color="#0000FF"><%=stock.getCodigoUnidadMedida()%></font>
</td>
</tr>
  <%j++;%>
<%}}%>
</table>
<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/>
</td>

</tr>

<%i++;%>
<%k++;%>
<%}%>
<tr>
<td>
<select size=1 name="producto" onblur="recuperaDetallePedido2()">
<option value=-1>SELECCIONE PRODUCTO</option>
<% 
ArrayList<Producto> arrayProducto= new ArrayList<Producto>();
ManejadorProducto manProducto= new ManejadorProducto();
manProducto.setTipoProducto("T");
arrayProducto=manProducto.consultar();
Iterator itProducto= arrayProducto.iterator();
while (itProducto.hasNext())
{
Producto producto2= (Producto) itProducto.next();
%>
<option value=<%=producto2.getCodigoProducto()%>> <%=producto2.getNombreProducto()%></option>
<%}%>
</select></td>
<td>
<input type="text" name="cantidadproducto" size="3" onblur="recuperaDetallePedido2()"/></td>
<td>
&nbsp;
<!--input type="text" name="cantidadproducto" value=""/-->
</td>
<td>
&nbsp;
</td>
</tr>
<tr>
<td></td>
<td>
Total</td>
<td>
<%=preciototal%>
<input type="hidden" name="total" value="<%=preciototal%>"/>
</td>
</tr>
</table>
<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
<input type="hidden" name="cantidaddetallepedido" value="<%=k%>"/>

