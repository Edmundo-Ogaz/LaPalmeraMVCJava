<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
 if (opcion.equals("Eliminar"))
    { 
    enviara = "/servlet/EliminaLineaProduccion";
	} 
  else 
    { 
    if (opcion.equals("Modificar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ModificaLineaProduccion.jsp&titulo=Modificar Linea de Produccion";
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
