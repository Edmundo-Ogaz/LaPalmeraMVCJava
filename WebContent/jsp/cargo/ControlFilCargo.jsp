<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaCargo.jsp&titulo=Listado de Cargo";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Cargo"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoCargo.jsp&titulo=Nuevo Cargo";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
