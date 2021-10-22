<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaBodega.jsp&titulo=Listado Bodega";
	} 
  else 
    { 
    if (opcion.equals("Nueva Bodega"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaBodega.jsp&titulo=Nueva Bodega";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
