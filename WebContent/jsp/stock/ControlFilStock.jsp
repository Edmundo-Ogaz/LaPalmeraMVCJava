<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaStock.jsp&titulo=Listado de Stock";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Stock"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoStock.jsp&titulo=Nuevo Stock";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>

