<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaSubfamilia.jsp&titulo=Listado de Subfamilia";
	} 
  else 
    { 
    if (opcion.equals("Nueva Subfamilia"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevaSubfamilia.jsp&titulo=Nueva Subfamilia";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
