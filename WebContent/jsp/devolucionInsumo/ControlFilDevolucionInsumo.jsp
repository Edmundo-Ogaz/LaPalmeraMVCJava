<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaOrdenFabricacionDevolucionInsumo.jsp&titulo=Devolución Insumos por Orden Fabricación";
	} 
  /*else 
    { 
    if (opcion.equals("Nueva Comuna"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaComuna.jsp&titulo=Nueva Comuna";	
      } 
    }*/ 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
