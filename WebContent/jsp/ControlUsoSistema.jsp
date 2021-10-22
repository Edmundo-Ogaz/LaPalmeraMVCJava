<%@ page import="unab.com.*" %>
<%@page session='true'%>
<jsp:useBean id="usuario" class="Usuario" scope="session" /><%if (usuario.getUsuario().equals("")){%>
<jsp:forward page="/jsp/index.jsp">	<jsp:param name="error" value="Es obligatorio identificarse"/>
</jsp:forward><%}%>
<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%
  String opcion = request.getParameter("destino");
  String enviara = "";
  if (opcion.equals("NuevaSolicitudProducto.jsp"))
    { 
	session.removeAttribute("arraySolicitudProducto");
	enviara = "/jsp/UsoSistema.jsp?destino=NuevaSolicitudProducto.jsp&titulo=Nueva Solicitud Producto";
	} 
  else 
    { 
    if (opcion.equals("index.jsp"))
      { 
	  session.invalidate();
      enviara = "/jsp/index.jsp";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
