<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaConceptoTecnico.jsp&titulo=Listado Concepto Técnico";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Concepto Técnico"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoConceptoTecnico.jsp&titulo=Nuevo Concepto Técnico";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
