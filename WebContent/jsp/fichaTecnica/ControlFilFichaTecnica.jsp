<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaFichaTecnica.jsp&titulo=Listado Ficha Tecnica";
	} 
  else 
    { 
    if (opcion.equals("Nueva Ficha Técnica"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaFichaTecnica.jsp&titulo=Nueva Ficha Tecnica";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
