<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Nueva Devoluci�n Insumos"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=DevolucionInsumo.jsp&titulo=Devoluci�n de Insumos";
	} 
  /*else 
    { 
    if (opcion.equals("Modificar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ModificaEspecificarProduccion.jsp&titulo=Modificar Especificaci�n de Producci�n";
      }
	  else 
      { 
      if (opcion.equals("Volver"))
        { 
        enviara = "/jsp/UsoSistema.jsp?destino=FilEspecificarProduccion.jsp&titulo=Filtrado Especificar Producci�n";
        } 
      }
	}*/ 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
