<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="arrayFuncionario" class="ArrayList<Funcionario>" scope="session"/>
<%
		int cantidadfuncionario = Integer.parseInt(request.getParameter("cantidadfuncionario"));
		String funcionario = request.getParameter("funcionario");
		if (funcionario.equals("0"))
		{
		arrayFuncionario.remove(cantidadfuncionario-2);
		}
%>
<table border="1">
	
<%
int i = 1;
int j = 0;
Iterator itFuncionario= arrayFuncionario.iterator();
while (itFuncionario.hasNext())
{
Funcionario funcionario1= (Funcionario) itFuncionario.next();
%>

<tr>
<td width="46">
Funcionario
</td>
<td width="200">
<input type="hidden" name="funcionario<%=i%>" value="<%=funcionario1.getRutFuncionario()%>"/>
<select size=1 name="funcionario<%=i%>text" disabled="disabled">
<option value=-1>SELECCIONE FUNCIONARIO</option>
<% 
ArrayList<Funcionario> arrayFuncionario2= new ArrayList<Funcionario>();
ManejadorFuncionario manFuncionario= new ManejadorFuncionario();
arrayFuncionario2=manFuncionario.consultar();
Iterator itFuncionario2= arrayFuncionario2.iterator();
while (itFuncionario2.hasNext())
{
Funcionario funcionario2 = (Funcionario) itFuncionario2.next();
if (funcionario1.getRutFuncionario().equals(funcionario2.getRutFuncionario())){
%>
<option selected="selected" value=<%=funcionario2.getRutFuncionario()%>> <%=funcionario2.getNombreFuncionario()%></option>
<%}else{%>
<option value=<%=funcionario2.getRutFuncionario()%>> <%=funcionario2.getNombreFuncionario()%></option>
<%}}%>
</select>
</td>
</tr>
<%i++;%>
<%j++;%>
<%}%>
</table>
<input type="hidden" name="funcionario" value="0"/>
<%j++;%>
<input type="hidden" name="ultimafilafuncionario" value="<%=i%>"/>
<input type="hidden" name="cantidadfuncionario" value="<%=j%>"/>
