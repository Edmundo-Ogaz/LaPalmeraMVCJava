<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
<%@page import="java.util.*"%>
<%@page import="cl.laPalmera.*"%>
<body>
<jsp:useBean id="producto" class="Producto" scope="session"/>
<%
String button = request.getParameter("modificar");
if (button != null){
%>
<jsp:forward page="producto_modificar.jsp"/>
<% }
else
{
%>
<%
producto.setCodigoProducto(request.getParameter("cod"));
//producto.eliminar();
%>
<%--=producto.getCodigoProducto()--%>
<jsp:forward page="/servlet/EliminaProducto"/>
<%
}
%>
</body>
</html>
