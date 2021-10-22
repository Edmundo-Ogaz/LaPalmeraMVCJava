<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="arrayDetallePedidoTorta" class="ArrayList<DetallePedido>" scope="session"/>
<%
    
  int cantidaddetallepedido = Integer.parseInt(request.getParameter("cantidaddetallepedido"));
  String cantidadproducto = request.getParameter("cantidadproducto");
  if (cantidadproducto.equals("0"))
  {
	arrayDetallePedidoTorta.remove(cantidaddetallepedido-2);
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
selec
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
<th>
<input type="checkbox" name="op" value="<%=k%>">
</th>
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
<table border="1">
<tr>
<th>
Insumo
</th>
<th>
Cantidad
</th>
<th>
Unidad Medida
</th>
<th>
Stock Disponible
</th>
<th>
Unidad Medida
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
{
%>
<%=insumo.getNombreInsumo()%>
<%
}
%>
<input type="hidden" name="insumo<%=i%><%=j%>" value="<%=ingrediente.getCodigoInsumo()%>"/>
</td>
<td>
&nbsp;
<%cantidadinsumo = String.valueOf(Float.parseFloat(detallePedido.getCantidadProducto())*Float.parseFloat(ingrediente.getCantidadInsumo()));%>
<%--=cantidadinsumo.substring(0,cantidadinsumo.indexOf(".")+2)--%>
<%=cantidadinsumo%>
<input type="hidden" name="cantidadinsumo<%=i%><%=j%>" value="<%=cantidadinsumo%>"/>
</td>
<td>
<%=insumo.getCodigoUnidadMedida()%>
<input type="hidden" name="unidadmedida<%=i%><%=j%>" value="<%=insumo.getCodigoUnidadMedida()%>"/>
</td>
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
<input type="hidden" name="producto" value="0"/>
<input type="hidden" name="cantidadproducto" value="0"/>
<input type="hidden" name="insumo" value="0"/>
<%k++;%>
<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
<input type="hidden" name="cantidaddetallepedido" value="<%=k%>"/>
<button type="button" onClick="recuperaDetallePedido()">Agregar Otro Producto</button>
<!--button type="button" onClick="sacaDetallePedidoUltimo()">Sacar Ultimo Producto</button-->
