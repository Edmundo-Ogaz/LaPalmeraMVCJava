<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaUnidadMedida.jsp&titulo=Listado Unidad de Medida";
	} 
  else 
    { 
    if (opcion.equals("Nueva Unidad de Medida"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaUnidadMedida.jsp&titulo=Nueva Unidad de Medida";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
