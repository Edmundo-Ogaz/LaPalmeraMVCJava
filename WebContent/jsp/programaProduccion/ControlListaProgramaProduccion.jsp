<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Modificar Programa de Producci�n"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ModificaProgramaProduccion.jsp&titulo=Modificar Programa Producci�n";
	} 
  else 
    { 
    if (opcion.equals("Refrescar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ListaProgramaProduccion.jsp&titulo=Listado Programa de Producci�n";
      }
	  else 
      { 
      /*if (opcion.equals("Volver"))
        { 
        enviara = "/jsp/UsoSistema.jsp?destino=FilProgramaProduccion.jsp&titulo=Filtrado Programa de Producci�n";
        }*/ 
      }
	} 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
