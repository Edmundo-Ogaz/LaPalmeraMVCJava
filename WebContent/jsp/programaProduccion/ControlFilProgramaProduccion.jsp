<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaProgramaProduccion.jsp&titulo=Listado Programa de Producci�n";
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

