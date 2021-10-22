<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="arraySolicitudProducto" class="ArrayList<DetallePedido>" scope="session"/>

<%
  int indice;    
  boolean mostrarproducto = true;
  int largoeliminar = Integer.parseInt(request.getParameter("largoeliminar"));
  String cantinsumo = request.getParameter("insumo");
  String mostrar = request.getParameter("eliminar");
  String eliminar = request.getParameter("eliminar");
  int largoarray = 	arraySolicitudProducto.size();
  
  if (!cantinsumo.equals("0")){
    //for (int j=0;j<largoeliminar;j++){ 
  
  	  indice = Integer.parseInt(mostrar.substring(mostrar.lastIndexOf(",")+1,mostrar.length()));
  	  //mostrar = mostrar.substring(mostrar.indexOf(",")+1,mostrar.length());
	
	  if (arraySolicitudProducto.size() == indice){
  	     mostrarproducto = false;
	  }
    //}
  }else{
	 mostrarproducto = false;
  }
  
  for (int j=0;j<largoeliminar;j++){ 
  
  	indice = Integer.parseInt(eliminar.substring(eliminar.lastIndexOf(",")+1,eliminar.length()));
    eliminar = eliminar.substring(0,eliminar.lastIndexOf(","));
	
	//indice = Integer.parseInt(eliminar.substring(eliminar.lastIndexOf(","),eliminar.length()));
  	//eliminar = eliminar.substring(eliminar.indexOf(",")+1,eliminar.length());
	
	if (largoarray != indice){
  	   arraySolicitudProducto.remove(indice);
	}
  }
%>



<%/*
  int cantidadsolicitudproducto= Integer.parseInt(request.getParameter("cantidadsolicitudproducto"));
  String cantidadproducto = request.getParameter("cantidadproducto");
  if (cantidadproducto.equals("0"))
  {
	arraySolicitudProducto.remove(cantidadsolicitudproducto-2);
  }
*/%>

<%
ArrayList<Stock> arrayStockSolicitudProducto= new ArrayList<Stock>();
ManejadorStock manStock= new ManejadorStock();
arrayStockSolicitudProducto= manStock.consultar();
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
Insumo
</th>
</tr>
<%
int i = 1;
int k = 0;
int j = 1;
int preciototal = 0;
String cantidadinsumo = "";
String stock= "S";
Iterator itSolicitudProducto= arraySolicitudProducto.iterator();
while (itSolicitudProducto.hasNext())
{
DetallePedido detallePedido = (DetallePedido) itSolicitudProducto.next();%>
<tr>
<td>
<input type="checkbox" name="op" value="<%=k%>">
<!--input type="checkbox" name="NomCheck[]" value="1"/-->
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
<table border="1" width="100%">
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
j = 1;
ArrayList<Ingrediente> arrayIngrediente = new ArrayList<Ingrediente>();
ManejadorIngrediente manIngrediente = new ManejadorIngrediente();
manIngrediente.setCodigoProducto(detallePedido.getCodigoProducto());
arrayIngrediente = manIngrediente.consultar();
Iterator itIngrediente = arrayIngrediente.iterator();
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
out.print(insumo.getNombreInsumo());
}
%>
<input type="hidden" name="insumo<%=i%><%=j%>" value="<%=ingrediente.getCodigoInsumo()%>"/>
</td>

<%cantidadinsumo = String.valueOf(Float.parseFloat(detallePedido.getCantidadProducto())*Float.parseFloat(ingrediente.getCantidadInsumo()));%>

<%if (Float.parseFloat(cantidadinsumo) < 1){%>
<td><%--=stockdisponible.substring(0,stockdisponible.indexOf(".")+2)--%>
     <%String cant =  String.valueOf(Float.parseFloat(cantidadinsumo)*1000);%>
	 <%=cant.substring(0,cant.indexOf(".")+2)%>
     <%--=String.substring(0,String.valueOf(Float.parseFloat(cantidadinsumo)*1000).indexOf(".")+2)--%>
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
<%=cantidadinsumo.substring(0,cantidadinsumo.indexOf(".")+2)%>
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
for (int m=0; m < arrayStockSolicitudProducto.size(); m++)
{
  Stock puntero = arrayStockSolicitudProducto.get(m);
  if (puntero.getCodigoProducto().equals(ingrediente.getCodigoInsumo()))
  {
    stockdisponible = puntero.getStockDisponible();
    //out.print(stockdisponible);
	unidadmedida = puntero.getCodigoUnidadMedida();
    float c = Float.parseFloat(puntero.getStockDisponible());
    float c2 = Float.parseFloat(cantidadinsumo);
    //out.print(c);
	//out.print(c2);
	String totalc = String.valueOf(c-c2);
    //out.print(totalc);
	puntero.setStockDisponible(totalc);
    arrayStockSolicitudProducto.set(m,puntero);
  }
}
%>
<td>
&nbsp;
<%
if (Float.parseFloat(cantidadinsumo) < Float.parseFloat(stockdisponible))
{
%>
<font color="#0000FF"><%=stockdisponible.substring(0,stockdisponible.indexOf(".")+2)%></font>
<%}else{%>
<font color="#FF0000"><%=stockdisponible.substring(0,stockdisponible.indexOf(".")+2)%></font>
<%
stock = "N";
}
%>	  
</td>
<td>
&nbsp;
<font color="#0000FF"><%=unidadmedida%></font>
</td>
</tr>
<%j++;%>
<%}%>
<%
if (j==1){
%>
<tr>
<td colspan="5">
<font color="#FF0000">No tiene Ingredientes asociados este producto</font>
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
<%if (mostrarproducto){%>
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
//manProducto.setTipoProducto("T");
arrayProducto=manProducto.consultar();
Iterator itProducto= arrayProducto.iterator();
while (itProducto.hasNext())
{
Producto producto2= (Producto) itProducto.next();
%>
<option value=<%=producto2.getCodigoProducto()%>> <%=producto2.getNombreProducto()%></option>
<%}%>
</select>
</td>
<td>
<input type="text" name="cantidadproducto" size="3"/>
<input type="hidden" name="insumo" value=""/>
<%k++;%>
</td>
<td>&nbsp;

</td>
<td>&nbsp;

</td>
</tr>
</table>
<button type="button" onClick="recuperaSolicitudProducto()">Consultar Insumos</button>

<%}else{%>

<input type="hidden" name="producto" value="0"/>
<input type="hidden" name="cantidadproducto" value="0"/>
<input type="hidden" name="insumo" value="0"/>
<%k++;%>
</table>
<button type="button" onClick="recuperaOtraSolicitudProducto()">Agregar Otro Producto</button>
<%}%>
<input type="hidden" name="stock" value="<%=stock%>"/>
<input type="hidden" name="ingrediente" value="0"/>
<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
<input type="hidden" name="cantidadsolicitudproducto" value="<%=k%>"/>
<!--button type="button" onClick="recuperaOtraSolicitudProducto()">Agregar Otro Producto</button>
<button type="button" onClick="sacaSolicitudProductoUltimo()">Sacar Ultimo Producto</button-->
