<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaTipoCliente.jsp&titulo=Listado Tipo de Cliente";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Tipo de Cliente"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoTipoCliente.jsp&titulo=Nuevo Tipo de Cliente";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
