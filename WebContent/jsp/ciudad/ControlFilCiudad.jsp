<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaCiudad.jsp&titulo=Listado de Ciudad";
	} 
  else 
    { 
    if (opcion.equals("Nueva Ciudad"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaCiudad.jsp&titulo=Nueva Ciudad";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
