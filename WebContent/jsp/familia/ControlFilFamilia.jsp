<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaFamilia.jsp&titulo=Listado de Familia";
	} 
  else 
    { 
    if (opcion.equals("Nueva Familia"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaFamilia.jsp&titulo=Nueva Familia";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
