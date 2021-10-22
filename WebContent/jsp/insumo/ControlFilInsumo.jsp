<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaInsumo.jsp&titulo=Listado de Insumo";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Insumo"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoInsumo.jsp&titulo=Nuevo Insumo";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
