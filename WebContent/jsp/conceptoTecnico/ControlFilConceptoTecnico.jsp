<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaConceptoTecnico.jsp&titulo=Listado Concepto T�cnico";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Concepto T�cnico"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoConceptoTecnico.jsp&titulo=Nuevo Concepto T�cnico";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
