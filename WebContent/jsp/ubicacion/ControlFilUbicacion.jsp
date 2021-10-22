<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaUbicacion.jsp&titulo=Listado de Ubicacion";
	} 
  else 
    { 
    if (opcion.equals("Nueva Ubicacion"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaUbicacion.jsp&titulo=Nueva Ubicacion";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>

