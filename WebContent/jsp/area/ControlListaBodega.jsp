<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
 if (opcion.equals("Eliminar"))
    { 
    enviara = "/servlet/EliminaBodega";
	} 
  else 
    { 
    if (opcion.equals("Modificar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ModificaBodega.jsp&titulo=Modificar Bodega";
      }
	  /*else 
      { 
      if (opcion.equals("Volver"))
        { 
        enviara = "/jsp/UsoSistema.jsp?destino=FilLineaProduccion.jsp&titulo=Filtrado Linea de Produccion";
        } 
      }*/
	} 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
