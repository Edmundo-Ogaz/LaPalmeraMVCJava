<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaEspecificarProduccion.jsp&titulo=Listado Especidicar Producción";
	} 
  /*else 
    { 
    if (opcion.equals("Nuevo Programa de Producción"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ListaProgramaOrdenFabricacion.jsp&titulo=Listado Orden de Fabricación";	
      } 
    }*/ 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>

