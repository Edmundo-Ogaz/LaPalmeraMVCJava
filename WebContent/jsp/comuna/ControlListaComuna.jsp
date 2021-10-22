<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Eliminar"))
    { 
    enviara = "/servlet/EliminaComuna";
	} 
  else 
    { 
    if (opcion.equals("Modificar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ModificaComuna.jsp&titulo=Modificar Comuna";
      }
	  /*else 
      { 
      if (opcion.equals("Volver"))
        { 
        enviara = "/jsp/UsoSistema.jsp?destino=FilComuna.jsp&titulo=Filtrado Comuna";
        } 
      }*/
	} 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
