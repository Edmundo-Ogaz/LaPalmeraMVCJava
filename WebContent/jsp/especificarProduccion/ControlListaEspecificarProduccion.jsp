<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Especificar Producci�n"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=EspecificarProduccion.jsp&titulo=Especificar Producci�n";
	} 
 /* else 
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
