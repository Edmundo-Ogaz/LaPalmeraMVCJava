<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaLineaProduccion.jsp&titulo=Listado de Linea de Produccion";
	} 
  else 
    { 
    if (opcion.equals("Nueva Linea de Producci�n"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaLineaProduccion.jsp&titulo=Nueva Linea de Produccion";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
