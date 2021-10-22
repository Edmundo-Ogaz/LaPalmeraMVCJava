<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Modificar Programa de Producción"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ModificaProgramaProduccion.jsp&titulo=Modificar Programa Producción";
	} 
  else 
    { 
    if (opcion.equals("Refrescar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ListaProgramaProduccion.jsp&titulo=Listado Programa de Producción";
      }
	  else 
      { 
      /*if (opcion.equals("Volver"))
        { 
        enviara = "/jsp/UsoSistema.jsp?destino=FilProgramaProduccion.jsp&titulo=Filtrado Programa de Producción";
        }*/ 
      }
	} 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
