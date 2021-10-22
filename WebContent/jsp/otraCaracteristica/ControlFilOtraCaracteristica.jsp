<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaOtraCaracteristica.jsp&titulo=Listado Otra Caracteristica";
	} 
  else 
    { 
    if (opcion.equals("Nueva Otra Caracteristica"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaOtraCaracteristica.jsp&titulo=Nueva Otra Caracteristica";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
