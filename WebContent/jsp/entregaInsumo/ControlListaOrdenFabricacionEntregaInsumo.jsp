<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Entrega Insumos"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaEntregaInsumo.jsp&titulo=Listado Entrega de Insumos&mensaje=";
	} 
  /*else 
    { 
    if (opcion.equals("Modificar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ModificaProgramaProduccion.jsp&titulo=Modificar Programa de Producci�n";
      }
	  else 
      { 
      if (opcion.equals("Volver"))
        { 
        enviara = "/jsp/UsoSistema.jsp?destino=FilProgramaProduccion.jsp&titulo=Filtrado Programa de Producci�n";
        } 
      }
	}*/ 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
