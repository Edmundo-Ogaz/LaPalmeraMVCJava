<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaInformeOrdenFabricacion.jsp&titulo=Listado Orden Fabricaci�n";
	} 
  /*else 
    { 
    if (opcion.equals("Nuevo Programa de Producci�n"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ListaProgramaOrdenFabricacion.jsp&titulo=Listado Orden de Fabricaci�n";	
      } 
    }*/ 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>


