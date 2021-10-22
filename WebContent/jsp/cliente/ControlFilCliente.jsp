<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaCliente.jsp&titulo=Listado de Cliente";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Cliente"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoCliente.jsp&titulo=Nuevo Cliente";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>

