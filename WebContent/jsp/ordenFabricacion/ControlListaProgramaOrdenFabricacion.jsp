<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Programar Orden Fabricación"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ProgramarOrdenFabricacion.jsp&titulo=Programar Orden Fabricación";
	} 
  else 
    { 
     if (opcion.equals("Refrescar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ListaProgramaOrdenFabricacion.jsp&titulo=Orden Fabricación para Programar";
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
