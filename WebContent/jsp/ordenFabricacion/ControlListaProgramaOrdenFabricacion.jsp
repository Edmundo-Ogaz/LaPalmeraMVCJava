<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Programar Orden Fabricaci�n"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ProgramarOrdenFabricacion.jsp&titulo=Programar Orden Fabricaci�n";
	} 
  else 
    { 
     if (opcion.equals("Refrescar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ListaProgramaOrdenFabricacion.jsp&titulo=Orden Fabricaci�n para Programar";
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
