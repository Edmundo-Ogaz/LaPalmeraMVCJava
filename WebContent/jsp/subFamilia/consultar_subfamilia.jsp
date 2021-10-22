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
		<jsp:useBean id="subfamilia" class="Subfamilia" scope="session"/>
<%
		subfamilia.setCodigoSubfamilia(request.getParameter("codigo"));%>
<%
	    if (subfamilia.buscar()){
%>
			
			<jsp:forward page="subfamilia_encontrado.jsp"/>
<%		}
		else
		{
%>
		
			<jsp:forward page="subfamilia_no_encontrado.jsp"/>
<%		}
%>
</body>
</html>
