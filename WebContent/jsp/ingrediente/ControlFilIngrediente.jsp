<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaIngrediente.jsp&titulo=Listado de Ingredientes";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Ingrediente"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoIngrediente.jsp&titulo=Nuevo Ingrediente";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>

