<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaProducto.jsp&titulo=Listado de Productos";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Producto"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoProducto.jsp&titulo=Nuevo Producto";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
