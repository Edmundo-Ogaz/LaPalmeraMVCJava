<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaArea.jsp&titulo=Listado de Area";
	} 
  else 
    { 
    if (opcion.equals("Nueva Area"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaArea.jsp&titulo=Nueva Area";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
