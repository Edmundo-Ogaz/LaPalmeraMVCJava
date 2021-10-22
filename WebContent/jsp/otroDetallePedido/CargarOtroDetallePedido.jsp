<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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
<%
ArrayList<Stock> arrayStockDetallePedido = new ArrayList<Stock>();
ManejadorStock manStock= new ManejadorStock();
arrayStockDetallePedido= manStock.consultar();
%>

<table border="1">
<tr>
<th>
Selec
</th>
<th>
Producto
</th>
<th>
Cantidad
</th>
<th>
Precio
</th>
<th>
Insumo
</th>
</tr>
<%
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
<input type="checkbox" name="op" value="<%=k%>">
</td>
<td>
<%
Producto producto2 = new Producto();
producto2.setCodigoProducto(detallePedido.getCodigoProducto());
if (producto2.buscar())
{
out.print(producto2.getNombreProducto());
}
%> 
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
<table border="1" width="100%">
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
Stock Disponible
</th>
<th>
U/M
</th>
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
Insumo insumo = new Insumo();
insumo.setCodigoInsumo(ingrediente.getCodigoInsumo());
if (insumo.buscar())
{%>
<%=insumo.getNombreInsumo()%>
<%}%>
<input type="hidden" name="insumo<%=i%><%=j%>" value="<%=ingrediente.getCodigoInsumo()%>"/>
</td>

<%cantidadinsumo = String.valueOf(Float.parseFloat(detallePedido.getCantidadProducto())*Float.parseFloat(ingrediente.getCantidadInsumo()));%>

<%if (Float.parseFloat(cantidadinsumo) < 1){%>
<td>
     <%=String.valueOf(Float.parseFloat(cantidadinsumo)*1000)%>
</td>
<td>
<%    if (insumo.getCodigoUnidadMedida().equals("KGS")){
         out.print("GRS");
      }else{
	      if (insumo.getCodigoUnidadMedida().equals("LTS")){
             out.print("CM3");	 
}}%>
</td>	     
<%}else{%>
<td>
<%=cantidadinsumo%>
</td>
<td>
<%=insumo.getCodigoUnidadMedida()%>
</td>
<%}%>
<input type="hidden" name="cantidadinsumo<%=i%><%=j%>" value="<%=cantidadinsumo%>"/>
<input type="hidden" name="unidadmedida<%=i%><%=j%>" value="<%=insumo.getCodigoUnidadMedida()%>"/>
<%
String stockdisponible = "0";
String unidadmedida = "";
for (int m=0; m < arrayStockDetallePedido.size(); m++)
  {
  Stock puntero = arrayStockDetallePedido.get(m);
  if (puntero.getCodigoProducto().equals(ingrediente.getCodigoInsumo()))
    {
    stockdisponible = puntero.getStockDisponible();
    unidadmedida = puntero.getCodigoUnidadMedida();
    float c = Float.parseFloat(puntero.getStockDisponible());
    float c2 = Float.parseFloat(cantidadinsumo);
    String totalc = String.valueOf(c-c2);
    puntero.setStockDisponible(totalc);
    arrayStockDetallePedido.set(m,puntero);
    }
  }
%>
<td>
&nbsp;
<%if (Float.parseFloat(cantidadinsumo) < Float.parseFloat(stockdisponible))
{%>
<font color="#0000FF"><%=stockdisponible.substring(0,cantidadinsumo.indexOf(".")+4)%></font>
<%}else{%>
<font color="#FF0000"><%=stockdisponible.substring(0,cantidadinsumo.indexOf(".")+4)%></font>
<%}%>	  
</td>
<td>
&nbsp;
<font color="#0000FF"><%=unidadmedida%></font>
</td>
</tr>
<input type="hidden" name=ingrediente value="<%=j%>"/>
<%j++;%>
<%}%>
</table>
<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/>
</td>
</tr>
<%i++;%>
<%k++;%>
<%}%>
<tr>
<td>
<input type="checkbox" name="op" value="<%=k%>">
</td>
<td>
<select size=1 name="producto">
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
<input type="text" name="cantidadproducto" size="3"/>
<input type="hidden" name="insumo" value=""/>
<%k++;%>
</td>
<td>
&nbsp;
</td>
<td>
&nbsp;
</td>
</tr>
<tr>
<td>
&nbsp;
</td>
<td>
&nbsp;
</td>
<td>
Total
</td>
<td>
<%=preciototal%>
<input type="hidden" name="total" value="<%=preciototal%>"/>
</td>
</tr>
</table>
<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
<input type="hidden" name="cantidaddetallepedido" value="<%=k%>"/>
<button type="button" onClick="recuperaDetallePedido()">Consultar Insumos</button>
<!--button type="button" onClick="sacaDetallePedidoUltimo()">Sacar Ultimo Producto</button-->
